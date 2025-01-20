@interface CKMediaObjectBackedAsset
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpatialMedia;
- (CGSize)_previewPxSize:(BOOL *)a3;
- (CGSize)_transcoderGeneratedPxSize:(BOOL *)a3;
- (CKAggregateAcknowledgmentChatItem)acknowledgmentChatItem;
- (CKAttachmentMessagePartChatItem)chatItem;
- (CKMediaObject)mediaObject;
- (CKMediaObjectBackedAsset)initWithChatItem:(id)a3;
- (CKMediaObjectBackedAsset)initWithConfiguration:(id)a3;
- (CLLocation)location;
- (Class)defaultImageProviderClass;
- (NSArray)visibleAssociatedMessageChatItems;
- (NSDate)creationDate;
- (double)aspectRatio;
- (double)duration;
- (id)_mediaObjectPreview;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localCreationDate;
- (id)url;
- (id)uuid;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (void)aspectRatio;
- (void)setChatItem:(id)a3;
@end

@implementation CKMediaObjectBackedAsset

- (CKMediaObjectBackedAsset)initWithChatItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMediaObjectBackedAsset;
  v5 = [(CKMediaObjectBackedAsset *)&v9 initWithConfiguration:&__block_literal_global_236];
  v6 = v5;
  if (v5)
  {
    [(CKMediaObjectBackedAsset *)v5 setChatItem:v4];
    v7 = [v4 mediaObject];
    [v7 isMonoskiAsset];
  }
  return v6;
}

- (CKMediaObjectBackedAsset)initWithConfiguration:(id)a3
{
  id v3 = a3;
  abort();
}

- (CKMediaObject)mediaObject
{
  v2 = [(CKMediaObjectBackedAsset *)self chatItem];
  id v3 = [v2 mediaObject];

  return (CKMediaObject *)v3;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  v2 = [(CKMediaObjectBackedAsset *)self chatItem];
  id v3 = [v2 IMChatItem];
  id v4 = [v3 visibleAssociatedMessageChatItems];

  return (NSArray *)v4;
}

- (CKAggregateAcknowledgmentChatItem)acknowledgmentChatItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CKMediaObjectBackedAsset *)self chatItem];
  id v3 = [v2 visibleAssociatedMessageChatItems];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 setOverrideBalloonOrientationForPhotoGrid:1];
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (CKAggregateAcknowledgmentChatItem *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 mediaObject];
    v6 = [(CKMediaObjectBackedAsset *)self mediaObject];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)mediaType
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  int v3 = [v2 mediaType];

  if (v3 == 3) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (int64_t)playbackStyle
{
  int v3 = [(CKMediaObjectBackedAsset *)self mediaObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = [(CKMediaObjectBackedAsset *)self mediaObject];
  v6 = v5;
  if (isKindOfClass)
  {
    if ([v5 isIrisAsset]) {
      int64_t v7 = 3;
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      return 0;
    }
    v6 = [(CKMediaObjectBackedAsset *)self mediaObject];
    if ([v6 isAutoloopVideo]) {
      int64_t v7 = 5;
    }
    else {
      int64_t v7 = 4;
    }
  }

  return v7;
}

- (BOOL)isSpatialMedia
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  char v3 = [v2 isMonoskiAsset];

  return v3;
}

- (id)url
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  char v3 = [v2 fileURL];

  return v3;
}

- (NSDate)creationDate
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  char v3 = [v2 time];

  return (NSDate *)v3;
}

- (id)localCreationDate
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  char v3 = [v2 time];

  return v3;
}

- (unint64_t)pixelWidth
{
  char v6 = 0;
  [(CKMediaObjectBackedAsset *)self _transcoderGeneratedPxSize:&v6];
  if (v6) {
    return (unint64_t)v3;
  }
  [(CKMediaObjectBackedAsset *)self _previewPxSize:&v6];
  if (v6) {
    return (unint64_t)v5;
  }
  else {
    return 0;
  }
}

- (unint64_t)pixelHeight
{
  char v6 = 0;
  [(CKMediaObjectBackedAsset *)self _transcoderGeneratedPxSize:&v6];
  if (v6) {
    return (unint64_t)v3;
  }
  [(CKMediaObjectBackedAsset *)self _previewPxSize:&v6];
  if (v6) {
    return (unint64_t)v5;
  }
  else {
    return 0;
  }
}

- (double)aspectRatio
{
  if ([(CKMediaObjectBackedAsset *)self pixelHeight])
  {
    double v3 = (double)[(CKMediaObjectBackedAsset *)self pixelWidth];
    return v3 / (double)[(CKMediaObjectBackedAsset *)self pixelHeight];
  }
  else
  {
    double v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectBackedAsset aspectRatio](v5);
    }

    return 0.0;
  }
}

- (id)uuid
{
  double v3 = [(CKMediaObjectBackedAsset *)self mediaObject];
  id v4 = [v3 transfer];
  double v5 = [v4 attributionInfo];
  char v6 = [v5 objectForKey:*MEMORY[0x1E4F6D3F0]];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    char v8 = [(CKMediaObjectBackedAsset *)self mediaObject];
    id v7 = [v8 transferGUID];
  }

  return v7;
}

- (double)duration
{
  double v3 = [(CKMediaObjectBackedAsset *)self mediaObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0.0;
  }
  double v5 = [(CKMediaObjectBackedAsset *)self mediaObject];
  [v5 duration];
  double v7 = v6;

  return v7;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(CKMediaObjectBackedAsset *)self isEqual:v4]) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (CLLocation)location
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKMediaObjectBackedAsset alloc];
  int64_t v5 = [(CKMediaObjectBackedAsset *)self chatItem];
  double v6 = [(CKMediaObjectBackedAsset *)v4 initWithChatItem:v5];

  return v6;
}

- (CGSize)_transcoderGeneratedPxSize:(BOOL *)a3
{
  [(CKMediaObjectBackedAsset *)self _clientPreviewConstraints];
  int64_t v5 = [(CKMediaObjectBackedAsset *)self mediaObject];
  double v6 = v5;
  if (v5) {
    [v5 transcodingPreviewConstraints];
  }

  if (IMPreviewConstraintsEqualToConstraints())
  {
    double v7 = [(CKMediaObjectBackedAsset *)self mediaObject];
    [v7 transcodingPreviewPxSize];
    double v9 = v8;
    double v11 = v10;

    if (a3)
    {
      BOOL v12 = v9 != *MEMORY[0x1E4F1DB30];
      if (v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        BOOL v12 = 1;
      }
      *a3 = v12;
    }
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v13 = v9;
  double v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_previewPxSize:(BOOL *)a3
{
  int64_t v5 = [(CKMediaObjectBackedAsset *)self _mediaObjectPreview];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a3) {
      *a3 = 1;
    }
    long long v20 = 0u;
    id v6 = v5;
    double v7 = [(CKMediaObjectBackedAsset *)self mediaObject];
    double v8 = v7;
    if (v7)
    {
      [v7 transcodingPreviewConstraints];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }

    double v11 = *((double *)&v20 + 1);
    if (*((double *)&v20 + 1) <= 0.0)
    {
      BOOL v12 = [MEMORY[0x1E4F42D90] mainScreen];
      [v12 scale];
      double v11 = v13;
    }
    objc_msgSend(v6, "size", v19, (void)v20);
    double v10 = v11 * v14;
    [v6 size];
    double v16 = v15;

    double v9 = v11 * v16;
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    double v10 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v17 = v10;
  double v18 = v9;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)_mediaObjectPreview
{
  v2 = [(CKMediaObjectBackedAsset *)self mediaObject];
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 previewMaxWidth];
  id v4 = objc_msgSend(v2, "previewForWidth:orientation:", 0);

  return v4;
}

- (CKAttachmentMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)aspectRatio
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[CKMediaObjectBackedAsset aspectRatio]";
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%s would have attempted divide by zero because pixelHeight was 0.", (uint8_t *)&v1, 0xCu);
}

@end
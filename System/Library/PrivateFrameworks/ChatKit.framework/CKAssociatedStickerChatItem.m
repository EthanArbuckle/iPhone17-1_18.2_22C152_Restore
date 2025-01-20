@interface CKAssociatedStickerChatItem
+ (BOOL)isDroppedSticker:(id)a3;
+ (BOOL)userHasDraggedSticker;
+ (double)computeHorizontalStickerFrameOffset:(CGRect)a3 parentSize:(CGSize)a4 forPositioningWithinContentAlignmentRect:(CGRect)a5 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6 forTranscriptOrientation:(char)a7;
+ (id)_droppedStickers;
+ (id)_showingStickers;
+ (void)addDroppedSticker:(id)a3;
+ (void)clearTranscriptDisplayCaches;
+ (void)removeDroppedSticker:(id)a3;
+ (void)setUserHasDraggedSticker:(BOOL)a3;
- (BOOL)canDeleteFromStickerDetails;
- (BOOL)canShowInAppStore;
- (BOOL)chatItemIsStickerReposition;
- (BOOL)currentStickerRepositionIsLocalReposition;
- (BOOL)isCustomSticker;
- (BOOL)isReaction;
- (BOOL)isSticker;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAssociatedStickerChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKMediaObject)mediaObject;
- (Class)cellClass;
- (IMSticker)saveableSticker;
- (IMSticker)sticker;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSNumber)adamID;
- (NSString)stickerDetailsSubtitleText;
- (NSString)stickerDetailsTitleText;
- (NSString)stickerPackGUID;
- (NSString)stickerPackName;
- (NSString)transferGUID;
- (char)transcriptOrientation;
- (id)attributionImage;
- (id)attributionImageTintColor;
- (id)insertionHandler;
- (id)messageSummaryInfoValueForKey:(id)a3;
- (id)stickerDetailsPreview;
- (int64_t)stickerReactionIndex;
- (void)clearStickerRepositionLocalState;
- (void)currentStickerRepositionIsLocalReposition;
- (void)refreshMediaObjectForStickerRepositioning;
- (void)setMediaObject:(id)a3;
- (void)setSticker:(id)a3;
- (void)setStickerReactionIndex:(int64_t)a3;
@end

@implementation CKAssociatedStickerChatItem

+ (double)computeHorizontalStickerFrameOffset:(CGRect)a3 parentSize:(CGSize)a4 forPositioningWithinContentAlignmentRect:(CGRect)a5 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6 forTranscriptOrientation:(char)a7
{
  int v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat rect = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[CKAssociatedMessageChatItem adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:](CKAssociatedStickerChatItem, "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.width, a4.height);
  double v13 = v12;
  long long v14 = *(_OWORD *)&a6->parentPreviewWidth;
  v25[0] = *(_OWORD *)&a6->layoutIntent;
  v25[1] = v14;
  v25[2] = *(_OWORD *)&a6->yScalar;
  double rotation = a6->rotation;
  +[CKAssociatedMessageChatItem horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedStickerChatItem, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v25, width, height, v15, v13, v16, v17);
  double v19 = v18;
  if (v7 == 2)
  {
    v27.origin.CGFloat x = x;
    v27.origin.y = rect;
    v27.size.double width = width;
    v27.size.double height = height;
    double v22 = v19 + CGRectGetWidth(v27);
    double v23 = v22 - CGRectGetMaxX(a5);
    if (v23 <= 0.0) {
      return 0.0;
    }
    else {
      return 0.0 - v23;
    }
  }
  else
  {
    double result = 0.0;
    if (!v7)
    {
      if (v19 >= a5.origin.x) {
        double v21 = v19;
      }
      else {
        double v21 = a5.origin.x;
      }
      return v21 - v19;
    }
  }
  return result;
}

- (NSString)stickerDetailsTitleText
{
  v2 = [(CKAssociatedStickerChatItem *)self transferGUID];
  v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  v4 = [v3 transferForGUID:v2];

  if (+[CKStickerDetailViewController isGenmojiBundleIDFromFileTransfer:v4])
  {
    v5 = [v4 adaptiveImageGlyphContentDescription];
  }
  else
  {
    v5 = 0;
  }
  if (![v5 length])
  {
    uint64_t v6 = +[CKStickerDetailViewController localizedAppNameForStickerDetailsFromFileTransfer:v4];

    v5 = (void *)v6;
  }

  return (NSString *)v5;
}

- (NSString)stickerDetailsSubtitleText
{
  v2 = [(CKAssociatedMessageChatItem *)self sender];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (IMSticker)saveableSticker
{
  return (IMSticker *)+[CKUtilities saveableStickerFromChatItem:self];
}

- (BOOL)canDeleteFromStickerDetails
{
  return 1;
}

- (id)stickerDetailsPreview
{
  v2 = [(CKAssociatedStickerChatItem *)self mediaObject];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 previewMaxWidth];
  double v5 = v4;

  uint64_t v6 = [v2 previewForWidth:0 orientation:v5];

  return v6;
}

- (CKAssociatedStickerChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKAssociatedStickerChatItem;
  int v7 = [(CKChatItem *)&v18 initWithIMChatItem:v6 maxWidth:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(CKAssociatedStickerChatItem *)v7 transferGUID];

    if (v9)
    {
      if (objc_opt_respondsToSelector())
      {
        v10 = NSStringFromSelector(sel_chatContext);
        v11 = [v6 valueForKey:v10];
      }
      else
      {
        v11 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        double v12 = NSStringFromSelector(sel_message);
        double v13 = [v6 valueForKey:v12];
      }
      else
      {
        double v13 = 0;
      }
      long long v14 = +[CKMediaObjectManager sharedInstance];
      double v15 = [(CKAssociatedStickerChatItem *)v8 transferGUID];
      double v16 = [v14 mediaObjectWithTransferGUID:v15 imMessage:v13 chatContext:v11];

      [(CKAssociatedStickerChatItem *)v8 setMediaObject:v16];
    }
  }

  return v8;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->bottom = v7;
  }
  v8 = +[CKChatItemSizeCache sharedInstance];
  v9 = (double *)MEMORY[0x1E4F1DB30];
  long long v48 = *MEMORY[0x1E4F1DB30];
  if (objc_msgSend(v8, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v48, 0, width, height))
  {
    double v10 = *((double *)&v48 + 1);
    double v11 = *(double *)&v48;
  }
  else
  {
    double v12 = [(CKAssociatedStickerChatItem *)self mediaObject];
    uint64_t v13 = +[CKUIBehavior sharedBehaviors];
    [(id)v13 previewMaxWidth];
    long long v14 = objc_msgSend(v12, "previewForWidth:orientation:", 0);

    objc_opt_class();
    LOBYTE(v13) = objc_opt_isKindOfClass();
    id v15 = v14;
    double v16 = v15;
    if (v13)
    {
      double v17 = [v15 image];
      [v17 size];
      double v19 = v18;
      double v21 = v20;

      double v22 = [v16 image];
    }
    else
    {
      [v15 size];
      double v19 = v23;
      double v21 = v24;
      double v22 = v16;
    }
    [v22 scale];
    double v26 = v25;

    CGRect v27 = +[CKUIBehavior sharedBehaviors];
    [(CKAssociatedMessageChatItem *)self geometryDescriptor];
    [v27 stickerScreenScale];
    objc_msgSend(v27, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v19, v21, v26, v47, v28, width);
    double v11 = v29;
    double v10 = v30;
    v31 = [(CKAssociatedStickerChatItem *)self mediaObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v33 = [(CKAssociatedStickerChatItem *)self mediaObject];
      if ([v33 isSticker] && objc_msgSend(v33, "isReaction"))
      {
        v34 = +[CKUIBehavior sharedBehaviors];
        [v34 stickerReactionSize];
        double v11 = v35;
        double v10 = v36;
      }
      else if ([v33 isSticker])
      {
        v37 = [v33 sticker];
        v38 = [v37 externalURI];
        uint64_t v39 = [v38 hasPrefix:@"sticker:///emoji/"];

        v40 = +[CKUIBehavior sharedBehaviors];
        [v27 stickerScreenScale];
        objc_msgSend(v40, "stickerDropPreviewMaxWidthForImageSize:isEmoji:displayScale:", v39, v11, v10, v41);
        double v43 = v42;

        if (v11 > v43 && v10 > 0.0)
        {
          [v27 stickerScreenScale];
          double v10 = round(v43 / (v11 / v10) * v44) / v44;
          double v11 = v43;
        }
      }
    }
    if (v11 != *v9 || v10 != v9[1]) {
      objc_msgSend(v8, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v11, v10, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), width, height);
    }
  }
  double v45 = v11;
  double v46 = v10;
  result.double height = v46;
  result.double width = v45;
  return result;
}

- (BOOL)isSticker
{
  return 1;
}

- (NSString)transferGUID
{
  v2 = [(CKAssociatedStickerChatItem *)self IMAssociatedStickerChatItem];
  v3 = [v2 transferGUID];

  return (NSString *)v3;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (char)transcriptOrientation
{
  if ([(CKAssociatedMessageChatItem *)self parentMessageIsFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)isReaction
{
  v3 = [(CKAssociatedStickerChatItem *)self mediaObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  double v5 = [(CKAssociatedStickerChatItem *)self mediaObject];
  char v6 = [v5 isReaction];

  return v6;
}

- (void)refreshMediaObjectForStickerRepositioning
{
  v3 = [(CKChatItem *)self IMChatItem];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(CKChatItem *)self IMChatItem];
    id v12 = (id)[v4 performSelector:sel_chatContext];
  }
  else
  {
    id v12 = 0;
  }

  double v5 = [(CKChatItem *)self IMChatItem];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [(CKChatItem *)self IMChatItem];
    id v7 = (id)[v6 performSelector:sel_message];
  }
  else
  {
    id v7 = 0;
  }

  v8 = +[CKMediaObjectManager sharedInstance];
  v9 = [(CKAssociatedStickerChatItem *)self transferGUID];
  double v10 = [v8 mediaObjectWithTransferGUID:v9 imMessage:v7 chatContext:v12];

  [(CKAssociatedStickerChatItem *)self setMediaObject:v10];
  double v11 = [(CKAssociatedStickerChatItem *)self IMAssociatedStickerChatItem];
  [v11 _refreshGeometryDescriptorFromStickerUserInfo];
}

- (BOOL)chatItemIsStickerReposition
{
  v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  double v4 = [(CKAssociatedStickerChatItem *)self transferGUID];
  double v5 = [v3 transferForGUID:v4];

  BOOL v6 = [v5 updateReason] == 1 || objc_msgSend(v5, "updateReason") == 2;
  return v6;
}

- (BOOL)currentStickerRepositionIsLocalReposition
{
  v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  double v4 = [(CKAssociatedStickerChatItem *)self transferGUID];
  double v5 = [v3 transferForGUID:v4];

  BOOL v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CKAssociatedStickerChatItem currentStickerRepositionIsLocalReposition](v5);
  }

  BOOL v7 = [v5 updateReason] == 1;
  return v7;
}

- (void)clearStickerRepositionLocalState
{
  v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  double v4 = [(CKAssociatedStickerChatItem *)self transferGUID];
  id v5 = [v3 transferForGUID:v4];

  [v5 setUpdateReason:0];
}

- (NSDictionary)stickerUserInfo
{
  v2 = [(CKAssociatedStickerChatItem *)self mediaObject];
  v3 = [v2 transfer];
  double v4 = [v3 stickerUserInfo];

  return (NSDictionary *)v4;
}

- (NSDictionary)attributionInfo
{
  v2 = [(CKAssociatedStickerChatItem *)self mediaObject];
  v3 = [v2 transfer];
  double v4 = [v3 attributionInfo];

  return (NSDictionary *)v4;
}

- (NSNumber)adamID
{
  v2 = [(CKAssociatedStickerChatItem *)self attributionInfo];
  v3 = v2;
  if (v2)
  {
    double v4 = [v2 objectForKey:*MEMORY[0x1E4F6D3C8]];
  }
  else
  {
    double v4 = 0;
  }

  return (NSNumber *)v4;
}

+ (id)_showingStickers
{
  if (_showingStickers_token != -1) {
    dispatch_once(&_showingStickers_token, &__block_literal_global_131);
  }
  v2 = (void *)_showingStickers_stickers;

  return v2;
}

void __47__CKAssociatedStickerChatItem__showingStickers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)_showingStickers_stickers;
  _showingStickers_stickers = v0;
}

- (id)messageSummaryInfoValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAssociatedStickerChatItem *)self IMAssociatedStickerChatItem];
  BOOL v6 = [v5 messageSummaryInfo];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (IMSticker)sticker
{
  v3 = [(CKAssociatedStickerChatItem *)self mediaObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CKAssociatedStickerChatItem *)self mediaObject];
    BOOL v6 = [v5 sticker];
  }
  else
  {
    BOOL v6 = 0;
  }

  return (IMSticker *)v6;
}

- (NSString)stickerPackName
{
  v2 = [(CKAssociatedStickerChatItem *)self attributionInfo];
  v3 = objc_msgSend(v2, "__ck_localizedAppNameForTranscriptAttribution");

  return (NSString *)v3;
}

- (BOOL)isCustomSticker
{
  v2 = [(CKAssociatedStickerChatItem *)self stickerPackGUID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSString)stickerPackGUID
{
  v2 = [(CKAssociatedStickerChatItem *)self stickerUserInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B8]];

  return (NSString *)v3;
}

- (BOOL)canShowInAppStore
{
  v2 = [(CKAssociatedStickerChatItem *)self adamID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)attributionImage
{
  v2 = [(CKAssociatedStickerChatItem *)self sticker];
  BOOL v3 = [v2 image];

  return v3;
}

- (id)attributionImageTintColor
{
  return 0;
}

+ (id)_droppedStickers
{
  if (_droppedStickers_token != -1) {
    dispatch_once(&_droppedStickers_token, &__block_literal_global_88);
  }
  v2 = (void *)_droppedStickers_stickers;

  return v2;
}

void __47__CKAssociatedStickerChatItem__droppedStickers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)_droppedStickers_stickers;
  _droppedStickers_stickers = v0;
}

+ (BOOL)userHasDraggedSticker
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v3 = [v2 isAlwaysShowStickerDropUIEnabled];

  if (v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v6 = [v5 objectForKey:@"kUserHasDraggedSticker"];

  if (v6) {
    char v4 = [v6 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (void)setUserHasDraggedSticker:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v6 = [v5 isAlwaysShowStickerDropUIEnabled];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v8 = [NSNumber numberWithBool:v3];
    [v7 setValue:v8 forKey:@"kUserHasDraggedSticker"];

    v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CKAssociatedStickerChatItem setUserHasDraggedSticker:](v3, v9);
    }

    if (v3)
    {
      double v10 = [a1 _droppedStickers];
      [v10 removeAllObjects];
    }
  }
}

+ (void)addDroppedSticker:(id)a3
{
  id v4 = a3;
  if (([a1 userHasDraggedSticker] & 1) == 0)
  {
    id v5 = [a1 _droppedStickers];
    char v6 = [v4 uniqueID];
    [v5 addObject:v6];

    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CKAssociatedStickerChatItem addDroppedSticker:](v4);
    }
  }
}

+ (void)removeDroppedSticker:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _droppedStickers];
  char v6 = [v4 uniqueID];
  [v5 removeObject:v6];

  BOOL v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[CKAssociatedStickerChatItem removeDroppedSticker:](v4);
  }
}

+ (BOOL)isDroppedSticker:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _droppedStickers];
  char v6 = [v4 uniqueID];
  uint64_t v7 = [v5 containsObject:v6];

  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CKAssociatedStickerChatItem isDroppedSticker:v8];
  }

  return v7;
}

+ (void)clearTranscriptDisplayCaches
{
  BOOL v3 = [a1 _droppedStickers];
  [v3 removeAllObjects];

  id v4 = [a1 _showingStickers];
  [v4 removeAllObjects];
}

- (id)insertionHandler
{
  if (insertionHandler_token != -1) {
    dispatch_once(&insertionHandler_token, &__block_literal_global_99_0);
  }
  v2 = (void *)insertionHandler_sInsertionHandler;

  return v2;
}

void __47__CKAssociatedStickerChatItem_insertionHandler__block_invoke()
{
  uint64_t v0 = objc_alloc_init(CKStickerTranscriptInsertionHandler);
  v1 = (void *)insertionHandler_sInsertionHandler;
  insertionHandler_sInsertionHandler = (uint64_t)v0;
}

- (void)setSticker:(id)a3
{
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (int64_t)stickerReactionIndex
{
  return self->_stickerReactionIndex;
}

- (void)setStickerReactionIndex:(int64_t)a3
{
  self->_stickerReactionIndeCGFloat x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);

  objc_storeStrong((id *)&self->_sticker, 0);
}

- (void)currentStickerRepositionIsLocalReposition
{
  [a1 updateReason];
  v1 = IMStringFromIMFileTransferUpdateReason();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "File transfer update reason: %@", v4, v5, v6, v7, v8);
}

+ (void)setUserHasDraggedSticker:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"NO";
  if (a1) {
    uint64_t v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18EF18000, a2, OS_LOG_TYPE_DEBUG, "Set User has dragged a sticker %@", (uint8_t *)&v3, 0xCu);
}

+ (void)addDroppedSticker:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uniqueID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "Added dropped sticker %@", v4, v5, v6, v7, v8);
}

+ (void)removeDroppedSticker:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uniqueID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "Removed dropped sticker %@", v4, v5, v6, v7, v8);
}

+ (void)isDroppedSticker:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 uniqueID];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_debug_impl(&dword_18EF18000, a3, OS_LOG_TYPE_DEBUG, "Sticker %@ is dropped sticker: %@", v6, 0x16u);
}

@end
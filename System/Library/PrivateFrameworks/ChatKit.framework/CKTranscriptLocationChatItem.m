@interface CKTranscriptLocationChatItem
- (BOOL)canCopy;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKLocationMediaObject)locationMediaObject;
- (Class)balloonViewClass;
- (NSURL)locationURL;
- (id)dragItemProvider;
- (id)transferGUID;
- (void)setLocationMediaObject:(id)a3;
- (void)setLocationURL:(id)a3;
@end

@implementation CKTranscriptLocationChatItem

- (id)transferGUID
{
  v2 = [(CKTranscriptLocationChatItem *)self mediaObject];
  v3 = [v2 transferGUID];

  return v3;
}

- (CKLocationMediaObject)locationMediaObject
{
  locationMediaObject = self->_locationMediaObject;
  if (!locationMediaObject)
  {
    v4 = [(CKChatItem *)self IMChatItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 locationInfo];
      v7 = [v6 location];

      v8 = &off_1E561D000;
      if (v7)
      {
        v9 = [v5 locationInfo];
        uint64_t v10 = [v9 query];
        v11 = (void *)v10;
        v12 = @"Location";
        if (v10) {
          v12 = (__CFString *)v10;
        }
        v13 = v12;

        v14 = +[CKMediaObjectManager sharedInstance];
        v15 = [v5 locationInfo];
        v16 = [v15 location];
        v17 = +[CKLocationMediaObject vcardDataFromCLLocation:v16];
        v18 = [v14 mediaObjectWithData:v17 UTIType:@"loc.vcf" filename:v13 transcoderUserInfo:MEMORY[0x1E4F1CC08]];

        v8 = &off_1E561D000;
      }
      else
      {
        v18 = 0;
      }
      id v19 = objc_alloc((Class)v8[347]);
      v20 = [v18 transfer];
      v21 = [(CKMessagePartChatItem *)self message];
      v22 = objc_msgSend(v21, "__ck_context");
      v23 = (CKLocationMediaObject *)[v19 initWithTransfer:v20 context:v22 forceInlinePreview:0];
      v24 = self->_locationMediaObject;
      self->_locationMediaObject = v23;

      v25 = [v5 locationInfo];
      v26 = [v25 url];
      locationURL = self->_locationURL;
      self->_locationURL = v26;
    }
    locationMediaObject = self->_locationMediaObject;
  }

  return locationMediaObject;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = +[CKUIBehavior sharedBehaviors];
  [v5 mapPreviewMaxWidth];
  objc_msgSend(v4, "mapThumbnailFillSizeForWidth:");
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)canCopy
{
  return self->_locationURL != 0;
}

- (id)dragItemProvider
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v4 = [(NSURL *)self->_locationURL absoluteString];
  id v5 = [v4 dataUsingEncoding:4];

  uint64_t v6 = *MEMORY[0x1E4F226F8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke;
  v13[3] = &unk_1E5621A58;
  id v7 = v5;
  id v14 = v7;
  [v3 registerDataRepresentationForTypeIdentifier:v6 visibility:0 loadHandler:v13];
  uint64_t v8 = *MEMORY[0x1E4F22708];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke_2;
  v11[3] = &unk_1E5621A58;
  id v12 = v7;
  id v9 = v7;
  [v3 registerDataRepresentationForTypeIdentifier:v8 visibility:0 loadHandler:v11];

  return v3;
}

uint64_t __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)setLocationMediaObject:(id)a3
{
}

- (NSURL)locationURL
{
  return self->_locationURL;
}

- (void)setLocationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationURL, 0);

  objc_storeStrong((id *)&self->_locationMediaObject, 0);
}

@end
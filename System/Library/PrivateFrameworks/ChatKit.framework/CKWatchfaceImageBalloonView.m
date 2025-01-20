@interface CKWatchfaceImageBalloonView
- (BOOL)isIrisAsset;
- (LPLinkMetadata)metadata;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKWatchfaceImageBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6 = a5;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v10 linkMetadataForWidth:v6 orientation:a4];
    [(CKWatchfaceImageBalloonView *)self setMetadata:v9];
  }
}

- (void)setMetadata:(id)a3
{
  v5 = (LPLinkMetadata *)a3;
  if (self->_metadata != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_metadata, a3);
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    v5 = v6;
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKWatchfaceImageBalloonView;
  [(CKLinkBalloonView *)&v4 prepareForReuse];
  metadata = self->_metadata;
  self->_metadata = 0;
}

- (void)prepareForDisplay
{
  v3 = [(CKLinkBalloonView *)self linkView];

  if (v3)
  {
    objc_super v4 = [(CKLinkBalloonView *)self linkView];
    [v4 setMetadata:self->_metadata];
  }
  else
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:self->_metadata];
    [(CKLinkBalloonView *)self setLinkView:v4];
  }

  v5.receiver = self;
  v5.super_class = (Class)CKWatchfaceImageBalloonView;
  [(CKLinkBalloonView *)&v5 prepareForDisplay];
}

- (void)tapGestureRecognized:(id)a3
{
  id v7 = a3;
  metadata = self->_metadata;
  if (metadata)
  {
    objc_super v5 = [(LPLinkMetadata *)metadata originalURL];

    if (v5)
    {
      uint64_t v6 = [(LPLinkMetadata *)self->_metadata originalURL];
      +[CKWatchfaceUtilities addWatchFaceAtURL:v6 completionHandler:&__block_literal_global_81];
    }
  }
}

void __52__CKWatchfaceImageBalloonView_tapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(47);
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v5 = v2;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "Failed to import URL: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end
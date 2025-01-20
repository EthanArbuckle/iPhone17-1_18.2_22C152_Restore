@interface CKWorkoutImageReplyPreviewBalloonView
- (LPLinkMetadata)metadata;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)configureForMessagePart:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setMetadata:(id)a3;
@end

@implementation CKWorkoutImageReplyPreviewBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6 = a5;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v10 linkMetadataForWidth:v6 orientation:a4];
    [(CKWorkoutImageReplyPreviewBalloonView *)self setMetadata:v9];
  }
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKWorkoutImageReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v9 configureForMessagePart:v4];
  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [(CKColoredBalloonView *)self setBalloonDescriptor:v8];
  v5 = [v4 mediaObject];
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  -[CKWorkoutImageReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, [v4 balloonOrientation], v7);
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
  v4.super_class = (Class)CKWorkoutImageReplyPreviewBalloonView;
  [(CKLinkReplyContextPreviewBalloonView *)&v4 prepareForReuse];
  metadata = self->_metadata;
  self->_metadata = 0;
}

- (void)prepareForDisplay
{
  v3 = [(CKLinkReplyContextPreviewBalloonView *)self linkView];

  if (v3)
  {
    objc_super v4 = [(CKLinkReplyContextPreviewBalloonView *)self linkView];
    [v4 setMetadata:self->_metadata];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:self->_metadata];
    [(CKLinkReplyContextPreviewBalloonView *)self setLinkView:v5];

    objc_super v4 = [(CKLinkReplyContextPreviewBalloonView *)self linkView];
    [v4 _setPreferredSizeClass:6];
  }

  v6.receiver = self;
  v6.super_class = (Class)CKWorkoutImageReplyPreviewBalloonView;
  [(CKLinkReplyContextPreviewBalloonView *)&v6 prepareForDisplay];
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end
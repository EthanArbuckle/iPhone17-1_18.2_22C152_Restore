@interface CKWorkoutBalloonView
- (LPLinkMetadata)metadata;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setMetadata:(id)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKWorkoutBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6 = a5;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v10 linkMetadataForWidth:v6 orientation:a4];
    [(CKWorkoutBalloonView *)self setMetadata:v9];
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
  v4.super_class = (Class)CKWorkoutBalloonView;
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
  v5.super_class = (Class)CKWorkoutBalloonView;
  [(CKLinkBalloonView *)&v5 prepareForDisplay];
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  metadata = self->_metadata;
  if (metadata
    && ([(LPLinkMetadata *)metadata originalURL],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (void *)MEMORY[0x1E4F1C9B8];
    v8 = [(LPLinkMetadata *)self->_metadata originalURL];
    id v13 = 0;
    v9 = [v7 dataWithContentsOfURL:v8 options:0 error:&v13];
    id v10 = v13;

    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      v12 = [(CKBalloonView *)self delegate];
      [v12 didTapWorkoutBalloonView:self workoutData:v9];
    }
    else
    {
      v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CKWorkoutBalloonView tapGestureRecognized:]((uint64_t)v10, v12);
      }
    }
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKWorkoutBalloonView tapGestureRecognized:](v10);
    }
  }
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

- (void)tapGestureRecognized:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Link metadata URL is nil", v1, 2u);
}

- (void)tapGestureRecognized:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Unable to read contents of file with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
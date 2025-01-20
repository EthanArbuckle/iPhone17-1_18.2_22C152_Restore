@interface CKTranscriptHeaderCell
+ (double)defaultCellHeight;
- (CKTranscriptHeaderCell)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)loadingIndicator;
- (void)_stopLoadingIndicatorAnimatingIfNeeded;
- (void)dealloc;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)setLoadingIndicator:(id)a3;
- (void)startAnimatingActivityIndicator;
@end

@implementation CKTranscriptHeaderCell

- (CKTranscriptHeaderCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptHeaderCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 showsLoadMoreItem];

    if (v5)
    {
      v6 = +[CKUIBehavior sharedBehaviors];
      uint64_t v7 = [v6 transcriptLoadingIndicatorStyle];

      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:v7];
      loadingIndicator = v3->_loadingIndicator;
      v3->_loadingIndicator = (UIActivityIndicatorView *)v8;

      [(UIActivityIndicatorView *)v3->_loadingIndicator sizeToFit];
      [(UIActivityIndicatorView *)v3->_loadingIndicator startAnimating];
      v10 = [(CKEditableCollectionViewCell *)v3 contentView];
      [v10 addSubview:v3->_loadingIndicator];
    }
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptHeaderCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKTranscriptHeaderCell *)self _stopLoadingIndicatorAnimatingIfNeeded];
}

- (void)dealloc
{
  [(CKTranscriptHeaderCell *)self _stopLoadingIndicatorAnimatingIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptHeaderCell;
  [(CKTranscriptHeaderCell *)&v3 dealloc];
}

- (void)layoutSubviewsForAlignmentContents
{
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptHeaderCell;
  [(CKEditableCollectionViewCell *)&v19 layoutSubviewsForAlignmentContents];
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 showsLoadMoreItem];

  if (v4)
  {
    int v5 = [(CKTranscriptHeaderCell *)self loadingIndicator];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    [(CKEditableCollectionViewCell *)self contentAlignmentRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    if (CKMainScreenScale_once_17 != -1) {
      dispatch_once(&CKMainScreenScale_once_17, &__block_literal_global_44);
    }
    double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_17;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_17 == 0.0) {
      double v18 = 1.0;
    }
    objc_msgSend(v5, "setFrame:", 1.0 / v18 * (v11 * v18 + floor((v15 * v18 - v7 * v18) * 0.5)), 1.0 / v18 * (v13 * v18 + floor((v17 * v18 - v9 * v18) * 0.5)), v7 * v18 * (1.0 / v18), v9 * v18 * (1.0 / v18));
  }
}

+ (double)defaultCellHeight
{
  v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 showsLoadMoreItem];

  double result = 0.0;
  if (v3)
  {
    int v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 theme];
    uint64_t v7 = [v6 transcriptLoadingIndicatorStyle];

    [MEMORY[0x1E4F42708] defaultSizeForStyle:v7];
    return v8;
  }
  return result;
}

- (void)startAnimatingActivityIndicator
{
  if (![(UIActivityIndicatorView *)self->_loadingIndicator isAnimating])
  {
    loadingIndicator = self->_loadingIndicator;
    [(UIActivityIndicatorView *)loadingIndicator startAnimating];
  }
}

- (void)_stopLoadingIndicatorAnimatingIfNeeded
{
  int v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 showsLoadMoreItem];

  if (v4 && [(UIActivityIndicatorView *)self->_loadingIndicator isAnimating])
  {
    loadingIndicator = self->_loadingIndicator;
    [(UIActivityIndicatorView *)loadingIndicator stopAnimating];
  }
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
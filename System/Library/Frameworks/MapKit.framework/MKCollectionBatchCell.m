@interface MKCollectionBatchCell
- (MKCollectionBatchCell)initWithFrame:(CGRect)a3;
- (void)finishedLoadingBatch;
- (void)setupConstraitns;
- (void)setupSubviews;
- (void)startedLoadingBatch;
@end

@implementation MKCollectionBatchCell

- (MKCollectionBatchCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKCollectionBatchCell;
  v3 = -[MKCollectionBatchCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKCollectionBatchCell *)v3 setupSubviews];
  }
  return v4;
}

- (void)setupSubviews
{
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  loadingView = self->_loadingView;
  self->_loadingView = v3;

  [(UIActivityIndicatorView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(MKCollectionBatchCell *)self contentView];
  [v5 addSubview:self->_loadingView];

  [(MKCollectionBatchCell *)self setupConstraitns];
}

- (void)setupConstraitns
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(UIActivityIndicatorView *)self->_loadingView centerXAnchor];
  v5 = [(MKCollectionBatchCell *)self contentView];
  objc_super v6 = [v5 centerXAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v13[0] = v7;
  v8 = [(UIActivityIndicatorView *)self->_loadingView centerYAnchor];
  v9 = [(MKCollectionBatchCell *)self contentView];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v13[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v3 activateConstraints:v12];
}

- (void)startedLoadingBatch
{
  if (![(UIActivityIndicatorView *)self->_loadingView isAnimating])
  {
    loadingView = self->_loadingView;
    [(UIActivityIndicatorView *)loadingView startAnimating];
  }
}

- (void)finishedLoadingBatch
{
  if ([(UIActivityIndicatorView *)self->_loadingView isAnimating])
  {
    loadingView = self->_loadingView;
    [(UIActivityIndicatorView *)loadingView stopAnimating];
  }
}

- (void).cxx_destruct
{
}

@end
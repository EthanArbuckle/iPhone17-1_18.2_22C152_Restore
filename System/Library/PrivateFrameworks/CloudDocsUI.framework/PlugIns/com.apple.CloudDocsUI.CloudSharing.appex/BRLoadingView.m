@interface BRLoadingView
- (BRLoadingView)initWithCoder:(id)a3;
- (BRLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)loadingView;
- (UILabel)loadingLabel;
- (void)initCommon;
- (void)setLoadingLabel:(id)a3;
- (void)setLoadingView:(id)a3;
@end

@implementation BRLoadingView

- (BRLoadingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRLoadingView;
  v3 = -[BRLoadingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BRLoadingView *)v3 initCommon];
  }
  return v4;
}

- (BRLoadingView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRLoadingView;
  v3 = [(BRLoadingView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BRLoadingView *)v3 initCommon];
  }
  return v4;
}

- (void)initCommon
{
  v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  loadingView = self->_loadingView;
  self->_loadingView = v3;

  [(UIActivityIndicatorView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_loadingView startAnimating];
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v5;

  v7 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_loadingLabel setTextColor:v7];

  [(UILabel *)self->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BRLoadingView *)self setAxis:0];
  [(BRLoadingView *)self setSpacing:8.0];
  v8 = [(BRLoadingView *)self loadingView];
  [(BRLoadingView *)self addArrangedSubview:v8];

  v9 = [(BRLoadingView *)self loadingLabel];
  [(BRLoadingView *)self addArrangedSubview:v9];

  LODWORD(v10) = 1144750080;
  [(BRLoadingView *)self setContentHuggingPriority:1 forAxis:v10];
  LODWORD(v11) = 1148846080;

  [(BRLoadingView *)self setContentHuggingPriority:0 forAxis:v11];
}

- (UILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void)setLoadingLabel:(id)a3
{
}

- (UIActivityIndicatorView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end
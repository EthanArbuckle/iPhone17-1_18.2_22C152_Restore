@interface MRURoutingAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRURoutingAccessoryView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIActivityIndicatorView)activityView;
- (UIImageView)imageView;
- (int64_t)state;
- (void)layoutSubviews;
- (void)setActivityView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateImageViewVisualStyle;
- (void)updateState;
- (void)updateVisualStyling;
@end

@implementation MRURoutingAccessoryView

- (MRURoutingAccessoryView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRURoutingAccessoryView;
  v3 = -[MRURoutingAccessoryView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:4];
    v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:17.0];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v6];

    [(MRURoutingAccessoryView *)v3 addSubview:v3->_imageView];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityView = v3->_activityView;
    v3->_activityView = (UIActivityIndicatorView *)v7;

    [(MRURoutingAccessoryView *)v3 addSubview:v3->_activityView];
    [(MRURoutingAccessoryView *)v3 updateState];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MRURoutingAccessoryView;
  [(MRURoutingAccessoryView *)&v11 layoutSubviews];
  [(MRURoutingAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UIActivityIndicatorView setFrame:](self->_activityView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 28.0;
  double v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(MRURoutingAccessoryView *)self updateState];
  }
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRURoutingAccessoryView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)updateVisualStyling
{
  double v3 = [(MRUVisualStylingProvider *)self->_stylingProvider colorForStyle:0];
  double v4 = [(MRURoutingAccessoryView *)self activityView];
  [v4 setColor:v3];

  [(MRURoutingAccessoryView *)self updateImageViewVisualStyle];
}

- (void)updateImageViewVisualStyle
{
  switch(self->_state)
  {
    case 0:
    case 2:
      [(UIImageView *)self->_imageView setAlpha:0.0];
      break;
    case 1:
      imageView = self->_imageView;
      stylingProvider = self->_stylingProvider;
      uint64_t v4 = 2;
      goto LABEL_3;
    case 3:
    case 4:
      imageView = self->_imageView;
      stylingProvider = self->_stylingProvider;
      uint64_t v4 = 0;
LABEL_3:
      [(MRUVisualStylingProvider *)stylingProvider applyStyle:v4 toView:imageView];
      break;
    default:
      return;
  }
}

- (void)updateState
{
  switch(self->_state)
  {
    case 0:
      goto LABEL_7;
    case 1:
      uint64_t v3 = +[MRUAssetsProvider routingAccessoryMultiDeselected];
      goto LABEL_6;
    case 2:
      [(UIActivityIndicatorView *)self->_activityView startAnimating];
      break;
    case 3:
      uint64_t v3 = +[MRUAssetsProvider routingAccessorySelected];
      goto LABEL_6;
    case 4:
      uint64_t v3 = +[MRUAssetsProvider routingAccessoryMultiSelected];
LABEL_6:
      uint64_t v4 = (void *)v3;
      [(UIImageView *)self->_imageView setImage:v3];

LABEL_7:
      [(UIActivityIndicatorView *)self->_activityView stopAnimating];
      break;
    default:
      break;
  }

  [(MRURoutingAccessoryView *)self updateImageViewVisualStyle];
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)state
{
  return self->_state;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
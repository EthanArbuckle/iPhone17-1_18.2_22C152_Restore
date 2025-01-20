@interface WAAttributionView
- (CGSize)sizeThatFits:(CGSize)result;
- (UIButton)attributionButton;
- (WAAttributionView)initWithFrame:(CGRect)a3;
- (WAAttributionViewDelegate)delegate;
- (void)attributionButtonTapped;
- (void)layoutSubviews;
- (void)setAttributionButton:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WAAttributionView

- (WAAttributionView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WAAttributionView;
  v3 = -[WAAttributionView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    [(WAAttributionView *)v3 setKeylineType:0];
    v5 = +[UIImage imageNamed:@"WolframLogo" inBundle:v4];
    v6 = +[UIColor siriui_maskingColor];
    uint64_t v7 = [v5 _flatImageWithColor:v6];
    logoImage = v3->_logoImage;
    v3->_logoImage = (UIImage *)v7;

    id v9 = [objc_alloc((Class)UIImageView) initWithImage:v3->_logoImage];
    v10 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    attributionButton = v3->_attributionButton;
    v3->_attributionButton = v10;

    [(UIButton *)v3->_attributionButton addSubview:v9];
    LODWORD(v12) = -1097229926;
    [(UIButton *)v3->_attributionButton setCharge:v12];
    [(UIButton *)v3->_attributionButton addTarget:v3 action:"attributionButtonTapped" forControlEvents:64];
    [(WAAttributionView *)v3 addSubview:v3->_attributionButton];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)WAAttributionView;
  [(WAAttributionView *)&v12 layoutSubviews];
  [(UIImage *)self->_logoImage size];
  [(WAAttributionView *)self bounds];
  UIRectCenteredYInRect();
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(WAAttributionView *)self bounds];
  double Width = CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  -[UIButton setFrame:](self->_attributionButton, "setFrame:", Width - CGRectGetWidth(v14) - SiriUIPlatterStyle[34], v6, v8, v10);
}

- (void)attributionButtonTapped
{
  id v3 = [(WAAttributionView *)self delegate];
  [v3 attributionViewTapped:self];
}

- (UIButton)attributionButton
{
  return self->_attributionButton;
}

- (void)setAttributionButton:(id)a3
{
}

- (WAAttributionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WAAttributionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributionButton, 0);

  objc_storeStrong((id *)&self->_logoImage, 0);
}

@end
@interface MPUHalfTintedTransportButton
+ (id)transportButton;
- (BOOL)_shouldForwardSelectedState;
- (BOOL)adjustsImageWhenHighlighted;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isEnabled;
- (BOOL)shouldTrack;
- (BOOL)wantsCustomHighlightAppearance;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUHalfTintedTransportButton)initWithFrame:(CGRect)a3;
- (MPUTransportButtonEventHandler)transportButtonEventHandler;
- (UIButton)_regularButton;
- (UIButton)_tintedButton;
- (UIColor)regularImageColor;
- (UIColor)tintedImageColor;
- (UIImage)regularImage;
- (UIImage)tintedImage;
- (UIImageView)regularImageView;
- (UIImageView)tintedImageView;
- (double)regularImageAlpha;
- (double)tintedImageAlpha;
- (id)_newButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)transportButtonImageViewContentMode;
- (void)_applyImage:(id)a3 toButton:(id)a4;
- (void)_updateRegularImage;
- (void)applyTransportButtonLayoutAttributes:(id *)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdjustsImageWhenHighlighted:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRegularImage:(id)a3;
- (void)setRegularImageAlpha:(double)a3;
- (void)setRegularImageColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTintedImage:(id)a3;
- (void)setTintedImageAlpha:(double)a3;
- (void)setTintedImageColor:(id)a3;
- (void)setTransportButtonImageViewContentMode:(int64_t)a3;
@end

@implementation MPUHalfTintedTransportButton

- (MPUHalfTintedTransportButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MPUHalfTintedTransportButton;
  v3 = -[MPUHalfTintedTransportButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MPUTransportButtonEventHandler);
    transportButtonEventHandler = v3->_transportButtonEventHandler;
    v3->_transportButtonEventHandler = v4;

    [(MPUTransportButtonEventHandler *)v3->_transportButtonEventHandler setButton:v3];
    uint64_t v6 = [(MPUHalfTintedTransportButton *)v3 _newButton];
    regularButton = v3->_regularButton;
    v3->_regularButton = (UIButton *)v6;

    [(UIButton *)v3->_regularButton setHidden:1];
    [(UIButton *)v3->_regularButton setUserInteractionEnabled:0];
    [(MPUHalfTintedTransportButton *)v3 addSubview:v3->_regularButton];
    uint64_t v8 = [(MPUHalfTintedTransportButton *)v3 _newButton];
    tintedButton = v3->_tintedButton;
    v3->_tintedButton = (UIButton *)v8;

    [(UIButton *)v3->_tintedButton setHidden:1];
    [(UIButton *)v3->_tintedButton setUserInteractionEnabled:0];
    [(MPUHalfTintedTransportButton *)v3 addSubview:v3->_tintedButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MPUHalfTintedTransportButton;
  [(MPUHalfTintedTransportButton *)&v11 layoutSubviews];
  [(MPUHalfTintedTransportButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_regularButton, "setFrame:");
  -[UIButton setFrame:](self->_tintedButton, "setFrame:", v4, v6, v8, v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__MPUHalfTintedTransportButton_hitTest_withEvent___block_invoke;
  v12[3] = &unk_2647D0C70;
  CGFloat v15 = x;
  CGFloat v16 = y;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  double v10 = [(MPUTransportButtonEventHandler *)transportButtonEventHandler performHitTestingBlock:v12];

  return v10;
}

id __50__MPUHalfTintedTransportButton_hitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v8.receiver = *(id *)(a1 + 40);
  v8.super_class = (Class)MPUHalfTintedTransportButton;
  uint64_t v3 = objc_msgSendSuper2(&v8, sel_hitTest_withEvent_, v2, *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v4 = (void *)v3;
  double v5 = *(void **)(a1 + 40);
  if (v3 == v5[57] || v3 == v5[58])
  {
    double v6 = v5;

    double v4 = v6;
  }

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIButton sizeThatFits:](self->_regularButton, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[UIButton sizeThatFits:](self->_tintedButton, "sizeThatFits:", width, height);
  if (v7 >= v10) {
    double v10 = v7;
  }
  if (v9 >= v11) {
    double v11 = v9;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5 = self;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MPUTransportButtonEventHandler *)transportButtonEventHandler beginTrackingWithTouch:v8 withEvent:v7];
  v10.receiver = v5;
  v10.super_class = (Class)MPUHalfTintedTransportButton;
  LOBYTE(v5) = [(MPUHalfTintedTransportButton *)&v10 beginTrackingWithTouch:v8 withEvent:v7];

  return (char)v5;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v5 = a3;
  [(MPUTransportButtonEventHandler *)transportButtonEventHandler cancelTrackingWithEvent:v5];
  v6.receiver = self;
  v6.super_class = (Class)MPUHalfTintedTransportButton;
  [(MPUHalfTintedTransportButton *)&v6 cancelTrackingWithEvent:v5];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MPUTransportButtonEventHandler *)transportButtonEventHandler endTrackingWithTouch:v8 withEvent:v7];
  v9.receiver = self;
  v9.super_class = (Class)MPUHalfTintedTransportButton;
  [(MPUHalfTintedTransportButton *)&v9 endTrackingWithTouch:v8 withEvent:v7];
}

- (BOOL)isEnabled
{
  v4.receiver = self;
  v4.super_class = (Class)MPUHalfTintedTransportButton;
  return [(MPUHalfTintedTransportButton *)&v4 isEnabled]
      || [(MPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldFakeEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setEnabled:](&v5, sel_setEnabled_);
  [(UIButton *)self->_regularButton setEnabled:v3];
  [(UIButton *)self->_tintedButton setEnabled:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setHighlighted:](&v5, sel_setHighlighted_);
  [(UIButton *)self->_regularButton setHighlighted:v3];
  [(UIButton *)self->_tintedButton setHighlighted:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setSelected:](&v5, sel_setSelected_);
  if ([(MPUHalfTintedTransportButton *)self _shouldForwardSelectedState])
  {
    [(UIButton *)self->_regularButton setSelected:v3];
    [(UIButton *)self->_tintedButton setSelected:v3];
  }
}

- (BOOL)shouldTrack
{
  v4.receiver = self;
  v4.super_class = (Class)MPUHalfTintedTransportButton;
  return [(MPUHalfTintedTransportButton *)&v4 shouldTrack]
      || [(MPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldForceTrackingEnabled];
}

+ (id)transportButton
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v3;
}

- (MPUTransportButtonEventHandler)transportButtonEventHandler
{
  return self->_transportButtonEventHandler;
}

- (void)applyTransportButtonLayoutAttributes:(id *)a3
{
}

- (void)prepareForReuse
{
  [(MPUHalfTintedTransportButton *)self setRegularImage:0];

  [(MPUHalfTintedTransportButton *)self setTintedImage:0];
}

- (BOOL)wantsCustomHighlightAppearance
{
  return 1;
}

- (BOOL)adjustsImageWhenHighlighted
{
  return [(UIButton *)self->_regularButton adjustsImageWhenHighlighted];
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setAdjustsImageWhenHighlighted:](self->_regularButton, "setAdjustsImageWhenHighlighted:");
  tintedButton = self->_tintedButton;

  [(UIButton *)tintedButton setAdjustsImageWhenHighlighted:v3];
}

- (int64_t)transportButtonImageViewContentMode
{
  id v2 = [(UIButton *)self->_regularButton imageView];
  int64_t v3 = [v2 contentMode];

  return v3;
}

- (void)setTransportButtonImageViewContentMode:(int64_t)a3
{
  objc_super v5 = [(UIButton *)self->_regularButton imageView];
  [v5 setContentMode:a3];

  id v6 = [(UIButton *)self->_tintedButton imageView];
  [v6 setContentMode:a3];
}

- (double)regularImageAlpha
{
  [(UIButton *)self->_regularButton alpha];
  return result;
}

- (UIImageView)regularImageView
{
  return [(UIButton *)self->_regularButton imageView];
}

- (void)setRegularImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_regularImage != v5)
  {
    objc_storeStrong((id *)&self->_regularImage, a3);
    [(MPUHalfTintedTransportButton *)self _updateRegularImage];
    [(UIButton *)self->_regularButton setHidden:v5 == 0];
  }
}

- (void)setRegularImageAlpha:(double)a3
{
}

- (void)setRegularImageColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_regularImageColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_regularImageColor, a3);
    [(UIButton *)self->_regularButton setTintColor:v6];
    objc_super v5 = v6;
    if ((v6 != 0) == (self->_regularImageColor == 0))
    {
      [(MPUHalfTintedTransportButton *)self _updateRegularImage];
      objc_super v5 = v6;
    }
  }
}

- (void)setTintedImage:(id)a3
{
  id v6 = (UIImage *)a3;
  if (self->_tintedImage != v6)
  {
    objc_storeStrong((id *)&self->_tintedImage, a3);
    objc_super v5 = [(UIImage *)v6 imageWithRenderingMode:2];
    [(MPUHalfTintedTransportButton *)self _applyImage:v5 toButton:self->_tintedButton];

    [(UIButton *)self->_tintedButton setHidden:v6 == 0];
  }
}

- (void)setTintedImageAlpha:(double)a3
{
}

- (void)setTintedImageColor:(id)a3
{
}

- (double)tintedImageAlpha
{
  [(UIButton *)self->_tintedButton alpha];
  return result;
}

- (UIColor)tintedImageColor
{
  return [(UIButton *)self->_tintedButton tintColor];
}

- (UIImageView)tintedImageView
{
  return [(UIButton *)self->_tintedButton imageView];
}

- (void)_applyImage:(id)a3 toButton:(id)a4
{
}

- (id)_newButton
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIButton)_regularButton
{
  return self->_regularButton;
}

- (BOOL)_shouldForwardSelectedState
{
  return 1;
}

- (UIButton)_tintedButton
{
  return self->_tintedButton;
}

- (void)_updateRegularImage
{
  if (self->_regularImageColor) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(UIImage *)self->_regularImage imageWithRenderingMode:v3];
  [(MPUHalfTintedTransportButton *)self _applyImage:v4 toButton:self->_regularButton];
}

- (UIImage)regularImage
{
  return self->_regularImage;
}

- (UIColor)regularImageColor
{
  return self->_regularImageColor;
}

- (UIImage)tintedImage
{
  return self->_tintedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedImage, 0);
  objc_storeStrong((id *)&self->_regularImageColor, 0);
  objc_storeStrong((id *)&self->_regularImage, 0);
  objc_storeStrong((id *)&self->_transportButtonEventHandler, 0);
  objc_storeStrong((id *)&self->_tintedButton, 0);

  objc_storeStrong((id *)&self->_regularButton, 0);
}

@end
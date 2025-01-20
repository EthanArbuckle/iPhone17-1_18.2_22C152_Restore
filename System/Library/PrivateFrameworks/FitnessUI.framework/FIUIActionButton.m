@interface FIUIActionButton
+ (id)buttonWithTitle:(id)a3 color:(id)a4 icon:(id)a5;
- (BOOL)animatingTouchDown;
- (CGRect)backgroundImageFrame;
- (CGRect)backgroundRectForBounds:(CGRect)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)FIUIActionButtonSize;
- (FIUIActionButton)initWithFrame:(CGRect)a3;
- (UIColor)backgroundImageColor;
- (UIColor)imageViewTintColor;
- (UIImageView)transformingImageView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)touchUpAnimationCompleteHandler;
- (void)_animateHighlighted:(BOOL)a3;
- (void)_setupInternalTouchActions;
- (void)_touchDown;
- (void)_touchUp;
- (void)layoutSubviews;
- (void)setAnimatingTouchDown:(BOOL)a3;
- (void)setBackgroundImageColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImageViewTintColor:(id)a3;
- (void)setTouchUpAnimationCompleteHandler:(id)a3;
- (void)setTransformingImageView:(id)a3;
- (void)turnIntoSolidDotWithDuration:(double)a3 completion:(id)a4;
@end

@implementation FIUIActionButton

+ (id)buttonWithTitle:(id)a3 color:(id)a4 icon:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 buttonWithType:0];
  [v11 setTitle:v10 forState:0];

  v12 = [v8 imageWithRenderingMode:2];

  [v11 setImage:v12 forState:0];
  v13 = [v9 colorWithAlphaComponent:0.2];
  [v11 setBackgroundImageColor:v13];

  v14 = [v9 colorWithAlphaComponent:1.0];

  [v11 setImageViewTintColor:v14];
  [v11 sizeToFit];
  return v11;
}

- (FIUIActionButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FIUIActionButton;
  v3 = -[FIUIActionButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F81708] defaultFontForTextStyle:*MEMORY[0x263F83590]];
    v5 = [(FIUIActionButton *)v3 titleLabel];
    [v5 setFont:v4];

    v6 = [(FIUIActionButton *)v3 titleLabel];
    [v6 setLineBreakMode:4];

    v7 = [(FIUIActionButton *)v3 titleLabel];
    [v7 setTextAlignment:1];

    id v8 = [MEMORY[0x263F825C8] whiteColor];
    id v9 = [(FIUIActionButton *)v3 titleLabel];
    [v9 setTextColor:v8];

    id v10 = [(FIUIActionButton *)v3 titleLabel];
    [v10 setAllowsDefaultTighteningForTruncation:1];

    [(FIUIActionButton *)v3 _setupInternalTouchActions];
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    transformingImageView = v3->_transformingImageView;
    v3->_transformingImageView = v11;

    [(UIImageView *)v3->_transformingImageView setContentMode:1];
    [(FIUIActionButton *)v3 addSubview:v3->_transformingImageView];
    v13 = [(FIUIActionButton *)v3 imageView];
    [v13 setAlpha:0.0];

    [(FIUIActionButton *)v3 setExclusiveTouch:1];
  }
  return v3;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(FIUIActionButton *)self currentTitle];

  if (v8)
  {
    id v9 = [(FIUIActionButton *)self titleLabel];
    [v9 _firstBaselineOffsetFromTop];
    double v11 = v10;

    v12 = [(FIUIActionButton *)self titleLabel];
    [v12 intrinsicContentSize];
    double v14 = v13;

    if (width < v14)
    {
      double v18 = 0.0;
    }
    else
    {
      v29.origin.CGFloat x = x;
      v29.origin.double y = y;
      v29.size.double width = width;
      v29.size.CGFloat height = height;
      CGFloat v15 = CGRectGetWidth(v29) * 0.5;
      v16 = [(FIUIActionButton *)self titleLabel];
      [v16 intrinsicContentSize];
      double v18 = v15 - v17 * 0.5;

      v19 = [(FIUIActionButton *)self titleLabel];
      [v19 intrinsicContentSize];
      double width = v20;
    }
    double v21 = y + 43.5 + 15.5 - v11;
    v23 = [(FIUIActionButton *)self titleLabel];
    [v23 intrinsicContentSize];
    double v22 = v24;
  }
  else
  {
    double v18 = *MEMORY[0x263F001A8];
    double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v25 = v18;
  double v26 = v21;
  double v27 = width;
  double v28 = v22;
  result.size.CGFloat height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)_setupInternalTouchActions
{
  [(FIUIActionButton *)self addTarget:self action:sel__touchDown forControlEvents:1];
  [(FIUIActionButton *)self addTarget:self action:sel__touchDown forControlEvents:16];
  [(FIUIActionButton *)self addTarget:self action:sel__touchUp forControlEvents:64];
  [(FIUIActionButton *)self addTarget:self action:sel__touchUp forControlEvents:32];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  v4 = [(FIUIActionButton *)self imageForState:[(FIUIActionButton *)self state]];
  [v4 size];
  double v6 = (width - v5) * 0.5;
  [v4 size];
  double v8 = (43.5 - v7) * 0.5;
  [v4 size];
  double v10 = v9;
  [v4 size];
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)FIUIActionButton;
  [(FIUIActionButton *)&v24 layoutSubviews];
  v3 = [(FIUIActionButton *)self imageView];
  [v3 setAlpha:0.0];

  v4 = [(FIUIActionButton *)self transformingImageView];
  [v4 intrinsicContentSize];
  CGFloat v6 = v5;
  double v7 = [(FIUIActionButton *)self transformingImageView];
  [v7 intrinsicContentSize];
  CGFloat v9 = v8;

  double v10 = [(FIUIActionButton *)self transformingImageView];
  double v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  v25.origin.double x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.double width = v6;
  v25.size.double height = v9;
  CGRect v26 = CGRectApplyAffineTransform(v25, &v23);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  double v16 = [(FIUIActionButton *)self transformingImageView];
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  double v17 = [(FIUIActionButton *)self imageView];
  [v17 center];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(FIUIActionButton *)self transformingImageView];
  objc_msgSend(v22, "setCenter:", v19, v21);
}

- (UIImageView)transformingImageView
{
  return self->_transformingImageView;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FIUIActionButton;
  id v6 = a3;
  [(FIUIActionButton *)&v8 setImage:v6 forState:a4];
  double v7 = [(FIUIActionButton *)self transformingImageView];
  [v7 setImage:v6];
}

- (void)setBackgroundImageColor:(id)a3
{
  id v8 = a3;
  if ((-[UIColor isEqual:](self->_backgroundImageColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundImageColor, a3);
    id v5 = v8;
    v10.double width = 67.5;
    v10.double height = 43.5;
    UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
    [v5 setFill];

    id v6 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 67.5, 43.5, 21.75);
    [v6 fill];
    double v7 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [(FIUIActionButton *)self setBackgroundImage:v7 forState:0];
  }
}

- (void)setImageViewTintColor:(id)a3
{
  p_imageViewTintColor = &self->_imageViewTintColor;
  id v8 = a3;
  if (([v8 isEqual:*p_imageViewTintColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageViewTintColor, a3);
    id v6 = *p_imageViewTintColor;
    double v7 = [(FIUIActionButton *)self transformingImageView];
    [v7 setTintColor:v6];
  }
}

- (void)setTouchUpAnimationCompleteHandler:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FIUIActionButton;
  -[FIUIActionButton setEnabled:](&v8, sel_setEnabled_);
  if (v3)
  {
    [(FIUIActionButton *)self setAlpha:1.0];
    imageViewTintColor = self->_imageViewTintColor;
    id v6 = [(FIUIActionButton *)self transformingImageView];
    [v6 setTintColor:imageViewTintColor];
  }
  else
  {
    [(FIUIActionButton *)self setAlpha:0.400000006];
    id v6 = [MEMORY[0x263F825C8] lightGrayColor];
    double v7 = [(FIUIActionButton *)self transformingImageView];
    [v7 setTintColor:v6];
  }
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  double v3 = (a3.size.width + -67.5) * 0.5;
  double v4 = 67.5;
  double v5 = 43.5;
  double v6 = 0.0;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v6;
  result.origin.double x = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(FIUIActionButton *)self bounds];
  -[FIUIActionButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  v15.origin.CGFloat x = v7 + -8.0;
  v15.origin.CGFloat y = v8 + -12.0;
  v15.size.double width = v9 + 16.0;
  v15.size.double height = v10 + 24.0;
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  if (CGRectContainsPoint(v15, v14)) {
    double v11 = self;
  }
  else {
    double v11 = 0;
  }
  return v11;
}

- (void)_touchDown
{
  [(FIUIActionButton *)self setAnimatingTouchDown:1];
  [(FIUIActionButton *)self _animateHighlighted:1];
}

- (void)setAnimatingTouchDown:(BOOL)a3
{
  self->_animatingTouchDown = a3;
}

- (void)_animateHighlighted:(BOOL)a3
{
  double v3 = 0.8;
  if (!a3) {
    double v3 = 1.0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__FIUIActionButton__animateHighlighted___block_invoke;
  v6[3] = &unk_2644A88A0;
  v6[4] = self;
  *(double *)&v6[5] = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__FIUIActionButton__animateHighlighted___block_invoke_2;
  v4[3] = &unk_2644A88C8;
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v6 animations:v4 completion:0.15];
}

void __40__FIUIActionButton__animateHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) transformingImageView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

- (void)_touchUp
{
  if (![(FIUIActionButton *)self animatingTouchDown])
  {
    [(FIUIActionButton *)self _animateHighlighted:0];
  }
}

- (BOOL)animatingTouchDown
{
  return self->_animatingTouchDown;
}

- (id)touchUpAnimationCompleteHandler
{
  return self->_touchUpAnimationCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformingImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageColor, 0);
  objc_storeStrong((id *)&self->_imageViewTintColor, 0);
  objc_storeStrong(&self->_touchUpAnimationCompleteHandler, 0);
}

- (void)turnIntoSolidDotWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = [(FIUIActionButton *)self backgroundImageColor];
  double v8 = [v7 colorWithAlphaComponent:1.0];

  double v9 = (void *)MEMORY[0x263F82E00];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke;
  v14[3] = &unk_2644A7AF0;
  v14[4] = self;
  id v15 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke_2;
  v12[3] = &unk_2644A7990;
  id v13 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 transitionWithView:self duration:5439616 options:v14 animations:v12 completion:a3];
}

void __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundImageColor:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) transformingImageView];
  [v2 setAlpha:0.0];
}

uint64_t __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)FIUIActionButtonSize
{
  id v2 = [(FIUIActionButton *)self titleLabel];
  [v2 frame];
  double v4 = v3;

  double v5 = v4 + 43.5 + 1.0;
  double v6 = 67.5;
  result.double height = v5;
  result.double width = v6;
  return result;
}

void __40__FIUIActionButton__animateHighlighted___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingTouchDown:0];
  if (([*(id *)(a1 + 32) isHighlighted] & 1) != 0 || !*(unsigned char *)(a1 + 40))
  {
    double v3 = [*(id *)(a1 + 32) touchUpAnimationCompleteHandler];

    if (v3)
    {
      double v4 = [*(id *)(a1 + 32) touchUpAnimationCompleteHandler];
      v4[2]();
    }
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _animateHighlighted:0];
  }
}

- (CGRect)backgroundImageFrame
{
  [(FIUIActionButton *)self bounds];
  -[FIUIActionButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (UIColor)imageViewTintColor
{
  return self->_imageViewTintColor;
}

- (UIColor)backgroundImageColor
{
  return self->_backgroundImageColor;
}

- (void)setTransformingImageView:(id)a3
{
}

@end
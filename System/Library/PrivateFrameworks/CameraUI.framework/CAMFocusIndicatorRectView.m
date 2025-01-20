@interface CAMFocusIndicatorRectView
- (BOOL)isInactive;
- (BOOL)isPulsing;
- (CAMFocusIndicatorRectView)initWithStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (UIImageView)_imageView;
- (int64_t)style;
- (void)layoutSubviews;
- (void)setInactive:(BOOL)a3;
- (void)setPulsing:(BOOL)a3;
@end

@implementation CAMFocusIndicatorRectView

- (CAMFocusIndicatorRectView)initWithStyle:(int64_t)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CAMFocusIndicatorRectView;
  v4 = -[CAMFocusIndicatorRectView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if ((unint64_t)a3 < 2)
    {
      v19 = (void *)MEMORY[0x263F827E8];
      v20 = @"PLFocusCrosshairs";
    }
    else
    {
      if ((unint64_t)(a3 - 3) < 2)
      {
        v7 = (void *)MEMORY[0x263F827E8];
        v8 = CAMCameraUIFrameworkBundle();
        v9 = [v7 imageNamed:@"CAMSubjectIndicatorActive" inBundle:v8];

        v10 = (void *)MEMORY[0x263F827E8];
        v11 = CAMCameraUIFrameworkBundle();
        v12 = [v10 imageNamed:@"CAMSubjectIndicatorInactive" inBundle:v11];

        [v9 size];
        double v14 = v13 * 0.5;
        double v16 = v15 * 0.5;
        v17 = objc_msgSend(v9, "resizableImageWithCapInsets:resizingMode:", 1, v14, v16, v14, v16);

        v18 = objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 1, v14, v16, v14, v16);
LABEL_9:

LABEL_10:
        uint64_t v22 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v17 highlightedImage:v18];
        imageView = v5->__imageView;
        v5->__imageView = (UIImageView *)v22;

        [(UIImageView *)v5->__imageView setContentMode:0];
        [(CAMFocusIndicatorRectView *)v5 addSubview:v5->__imageView];
        v24 = v5;

        goto LABEL_11;
      }
      if (a3 != 2)
      {
        v17 = 0;
        v18 = 0;
        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x263F827E8];
      v20 = @"PLFocusCrosshairsSmall";
    }
    v21 = [v19 imageNamed:v20 inBundle:v6];
    v12 = [MEMORY[0x263F825C8] systemYellowColor];
    v17 = [v21 imageWithTintColor:v12];

    v18 = 0;
    goto LABEL_9;
  }
LABEL_11:

  return v5;
}

- (void)setInactive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMFocusIndicatorRectView *)self _imageView];
  [v4 setHighlighted:v3];
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (CGSize)intrinsicContentSize
{
  switch([(CAMFocusIndicatorRectView *)self style])
  {
    case 0:
    case 2:
      BOOL v3 = [(CAMFocusIndicatorRectView *)self _imageView];
      [v3 intrinsicContentSize];
      double v5 = v4;
      uint64_t v7 = v6;

      break;
    case 1:
      *(double *)&uint64_t v7 = 200.0;
      goto LABEL_7;
    case 3:
      *(double *)&uint64_t v7 = 127.0;
      goto LABEL_7;
    case 4:
      *(double *)&uint64_t v7 = 77.0;
LABEL_7:
      double v5 = *(double *)&v7;
      break;
    default:
      double v5 = *MEMORY[0x263F001B0];
      uint64_t v7 = *(uint64_t *)(MEMORY[0x263F001B0] + 8);
      break;
  }
  double v8 = v5;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setPulsing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMFocusIndicatorRectView *)self isPulsing] != a3)
  {
    double v5 = [(CAMFocusIndicatorRectView *)self _imageView];
    uint64_t v6 = [v5 layer];
    uint64_t v7 = v6;
    if (v3)
    {
      [v5 setAlpha:1.0];
      double v8 = (void *)MEMORY[0x263F82E00];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __40__CAMFocusIndicatorRectView_setPulsing___block_invoke;
      v9[3] = &unk_263FA0208;
      id v10 = v5;
      [v8 animateWithDuration:30 delay:v9 options:0 animations:0.18 completion:0.0];
    }
    else
    {
      [v6 removeAnimationForKey:@"opacity"];
      [v5 setAlpha:1.0];
    }
  }
}

- (BOOL)isPulsing
{
  v2 = [(CAMFocusIndicatorRectView *)self _imageView];
  BOOL v3 = [v2 layer];
  double v4 = [v3 animationForKey:@"opacity"];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __40__CAMFocusIndicatorRectView_setPulsing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.65];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CAMFocusIndicatorRectView;
  [(CAMFocusIndicatorRectView *)&v12 layoutSubviews];
  [(CAMFocusIndicatorRectView *)self bounds];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if ((unint64_t)([(CAMFocusIndicatorRectView *)self style] - 3) <= 1)
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    CGRect v14 = CGRectInset(v13, -3.0, -3.0);
    double x = v14.origin.x;
    double y = v14.origin.y;
    double width = v14.size.width;
    double height = v14.size.height;
  }
  v11 = [(CAMFocusIndicatorRectView *)self _imageView];
  objc_msgSend(v11, "setFrame:", x, y, width, height);
}

- (BOOL)isInactive
{
  v2 = [(CAMFocusIndicatorRectView *)self _imageView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void).cxx_destruct
{
}

@end
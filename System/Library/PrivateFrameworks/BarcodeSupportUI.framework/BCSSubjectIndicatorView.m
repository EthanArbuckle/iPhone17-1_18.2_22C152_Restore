@interface BCSSubjectIndicatorView
+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3;
- (BCSSubjectIndicatorView)initWithFrame:(CGRect)a3;
- (BOOL)isBouncing;
- (BOOL)isInactive;
- (BOOL)isPulsing;
- (CGSize)intrinsicContentSize;
- (UIImageView)_imageView;
- (void)layoutSubviews;
- (void)setBouncing:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setInactive:(BOOL)a3;
- (void)setPulsing:(BOOL)a3;
- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5;
- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6;
- (void)stopScalingWithDuration:(double)a3;
@end

@implementation BCSSubjectIndicatorView

- (BCSSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BCSSubjectIndicatorView;
  v3 = -[BCSSubjectIndicatorView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v4 imageNamed:@"FocusIndicator" inBundle:v5];

    [v6 size];
    v9 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);

    uint64_t v10 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
    imageView = v3->__imageView;
    v3->__imageView = (UIImageView *)v10;

    [(BCSSubjectIndicatorView *)v3 addSubview:v3->__imageView];
    v12 = v3;
  }
  return v3;
}

- (BOOL)isInactive
{
  v2 = [(BCSSubjectIndicatorView *)self _imageView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setInactive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BCSSubjectIndicatorView *)self _imageView];
  [v4 setHighlighted:v3];
}

- (CGSize)intrinsicContentSize
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;

  objc_msgSend((id)objc_opt_class(), "_fixedSubjectIndicatorSizeForReferenceBounds:", v4, v6);
  double v8 = v7 + -3.0 + -3.0;
  double v10 = v9 + -3.0 + -3.0;
  result.height = v10;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)BCSSubjectIndicatorView;
  [(BCSSubjectIndicatorView *)&v12 layoutSubviews];
  [(BCSSubjectIndicatorView *)self bounds];
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  CGRectGetMidX(v13);
  UIRoundToViewScale();
  double v8 = v7;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  CGRectGetMidY(v14);
  UIRoundToViewScale();
  double v10 = v9;
  v11 = [(BCSSubjectIndicatorView *)self _imageView];
  objc_msgSend(v11, "setBounds:", x + -3.0, y + -3.0, width + 6.0, height + 6.0);
  objc_msgSend(v11, "setCenter:", v8, v10);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  double v7 = [(BCSSubjectIndicatorView *)self _imageView];
  double v8 = [(BCSSubjectIndicatorView *)self layer];
  double v9 = [v7 layer];
  uint64_t v10 = [v8 animationForKey:@"opacity"];

  uint64_t v11 = [v9 animationForKey:@"transform"];

  [(BCSSubjectIndicatorView *)self alpha];
  if (v5) {
    double v13 = 0.0;
  }
  else {
    double v13 = 1.0;
  }
  if (v5 && !a4)
  {
    [v8 removeAnimationForKey:@"opacity"];
    [v9 removeAnimationForKey:@"transform"];
LABEL_7:
    [(BCSSubjectIndicatorView *)self setAlpha:v13];
    goto LABEL_16;
  }
  if (v12 == v13) {
    goto LABEL_16;
  }
  if (!a4) {
    goto LABEL_7;
  }
  if (v5)
  {
    CGRect v14 = (void *)MEMORY[0x263F82E00];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke;
    v24[3] = &unk_26524C098;
    v24[4] = self;
    v24[5] = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_2;
    v22[3] = &unk_26524BE90;
    v22[4] = self;
    id v23 = v9;
    [v14 animateWithDuration:6 delay:v24 options:v22 animations:0.25 completion:0.0];
    v15 = v23;
  }
  else
  {
    if (!(v11 | v10))
    {
      [(BCSSubjectIndicatorView *)self layoutIfNeeded];
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 1.22279793, 1.22279793);
      CGAffineTransform v20 = v21;
      [v7 setTransform:&v20];
    }
    v16 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_3;
    v17[3] = &unk_26524C228;
    v17[4] = self;
    BOOL v19 = (v11 | v10) == 0;
    id v18 = v7;
    [v16 animateWithDuration:131078 delay:v17 options:0 animations:0.233333333 completion:0.0];
    v15 = v18;
  }

LABEL_16:
}

uint64_t __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  double v3 = v2;
  double v4 = [*(id *)(a1 + 40) animationForKey:@"transform"];

  if (v3 == 0.0 && v4 != 0)
  {
    double v6 = *(void **)(a1 + 40);
    [v6 removeAnimationForKey:@"transform"];
  }
}

uint64_t __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAlpha:1.0];
  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 40);
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v5[0] = *MEMORY[0x263F000D0];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    return [v3 setTransform:v5];
  }
  return result;
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6
{
  v25[2] = *MEMORY[0x263EF8340];
  id v10 = a6;
  uint64_t v11 = [(BCSSubjectIndicatorView *)self _imageView];
  double v12 = [v11 layer];
  double v13 = [v12 animationForKey:@"transform"];

  if (!v13)
  {
    [(BCSSubjectIndicatorView *)self bounds];
    if (v14 != 0.0)
    {
      double v15 = v14;
      if (!v10)
      {
        id v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
      }
      v16 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
      [v16 setTimingFunction:v10];
      [v16 setDuration:a4];
      v17 = [NSNumber numberWithDouble:v15 / (v15 + a3 * 2.0)];
      v25[0] = v17;
      v25[1] = &unk_26FCC64C8;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      [v16 setValues:v18];

      *(float *)&double v19 = (float)a5;
      [v16 setRepeatCount:v19];
      [v16 setAutoreverses:1];
      [v12 addAnimation:v16 forKey:@"transform"];
      long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      v24[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      v24[5] = v20;
      long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      void v24[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      v24[7] = v21;
      long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      v24[0] = *MEMORY[0x263F15740];
      v24[1] = v22;
      long long v23 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      v24[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      v24[3] = v23;
      [v12 setTransform:v24];
    }
  }
}

- (void)stopScalingWithDuration:(double)a3
{
  long long v4 = [(BCSSubjectIndicatorView *)self _imageView];
  BOOL v5 = [v4 layer];

  double v6 = (long long *)MEMORY[0x263F15740];
  if (a3 > 0.0)
  {
    uint64_t v7 = [v5 presentationLayer];
    double v8 = (void *)v7;
    if (v7) {
      double v9 = (void *)v7;
    }
    else {
      double v9 = v5;
    }
    id v10 = v9;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    if (v10) {
      [v10 transform];
    }
    uint64_t v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    [v11 setDuration:a3];
    double v12 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v11 setTimingFunction:v12];

    long long v28 = v36;
    long long v29 = v37;
    long long v30 = v38;
    long long v31 = v39;
    long long v24 = v32;
    long long v25 = v33;
    long long v26 = v34;
    long long v27 = v35;
    double v13 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v24];
    [v11 setFromValue:v13];

    long long v14 = v6[5];
    long long v28 = v6[4];
    long long v29 = v14;
    long long v15 = v6[7];
    long long v30 = v6[6];
    long long v31 = v15;
    long long v16 = v6[1];
    long long v24 = *v6;
    long long v25 = v16;
    long long v17 = v6[3];
    long long v26 = v6[2];
    long long v27 = v17;
    id v18 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v24];
    [v11 setToValue:v18];

    [v5 addAnimation:v11 forKey:@"stopScalingAnimation"];
  }
  [v5 removeAnimationForKey:@"transform"];
  long long v19 = v6[5];
  v23[4] = v6[4];
  v23[5] = v19;
  long long v20 = v6[7];
  v23[6] = v6[6];
  v23[7] = v20;
  long long v21 = v6[1];
  v23[0] = *v6;
  v23[1] = v21;
  long long v22 = v6[3];
  v23[2] = v6[2];
  v23[3] = v22;
  [v5 setTransform:v23];
}

- (BOOL)isPulsing
{
  double v2 = [(BCSSubjectIndicatorView *)self _imageView];
  double v3 = [v2 layer];
  long long v4 = [v3 animationForKey:@"opacity"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setPulsing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCSSubjectIndicatorView *)self isPulsing] != a3)
  {
    BOOL v5 = [(BCSSubjectIndicatorView *)self _imageView];
    double v6 = [v5 layer];
    uint64_t v7 = v6;
    if (v3)
    {
      [v5 setAlpha:1.0];
      double v8 = (void *)MEMORY[0x263F82E00];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __38__BCSSubjectIndicatorView_setPulsing___block_invoke;
      v9[3] = &unk_26524BD30;
      id v10 = v5;
      [v8 animateWithDuration:30 delay:v9 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      [v6 removeAnimationForKey:@"opacity"];
      [v5 setAlpha:1.0];
    }
  }
}

uint64_t __38__BCSSubjectIndicatorView_setPulsing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.45];
}

+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3
{
  UIRoundToScale();
  double v4 = v3;
  UIRoundToScale();
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (BOOL)isBouncing
{
  double v2 = [(BCSSubjectIndicatorView *)self _imageView];
  double v3 = [v2 layer];
  double v4 = [v3 animationForKey:@"transform"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setBouncing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCSSubjectIndicatorView *)self isBouncing] != a3)
  {
    if (v3)
    {
      [(BCSSubjectIndicatorView *)self startScalingWithExpansionWidth:-1 duration:10.0 repeatCount:0.5];
    }
    else
    {
      [(BCSSubjectIndicatorView *)self stopScalingWithDuration:0.0];
    }
  }
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
}

@end
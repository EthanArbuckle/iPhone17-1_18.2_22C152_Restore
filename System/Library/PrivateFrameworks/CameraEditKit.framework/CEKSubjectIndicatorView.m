@interface CEKSubjectIndicatorView
+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3 withScale:(double)a4;
+ (CGSize)fixedSizeWithScale:(double)a3;
- (BOOL)isInactive;
- (BOOL)isPulsing;
- (CEKSubjectIndicatorView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIImageView)_bottomLeftCornerView;
- (UIImageView)_bottomRightCornerView;
- (UIImageView)_fullSizeIndicatorView;
- (UIImageView)_topLeftCornerView;
- (UIImageView)_topRightCornerView;
- (UIView)_containerView;
- (int64_t)shape;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setInactive:(BOOL)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setShape:(int64_t)a3;
- (void)setShape:(int64_t)a3 animated:(BOOL)a4;
- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5;
- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6;
- (void)stopScalingWithDuration:(double)a3;
@end

@implementation CEKSubjectIndicatorView

- (CEKSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)CEKSubjectIndicatorView;
  v3 = -[CEKSubjectIndicatorView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v3->__containerView;
    v3->__containerView = v4;

    [(CEKSubjectIndicatorView *)v3 addSubview:v3->__containerView];
    v6 = (void *)MEMORY[0x1E4FB1818];
    v7 = CEKFrameworkBundle();
    v8 = [v6 imageNamed:@"CEKSubjectIndicatorCornerInactive" inBundle:v7];

    v9 = (void *)MEMORY[0x1E4FB1818];
    v10 = CEKFrameworkBundle();
    v11 = [v9 imageNamed:@"CEKSubjectIndicatorCornerActiveThick" inBundle:v10];

    [v8 size];
    double v13 = v12 + -1.0;
    v14 = objc_msgSend(v8, "resizableImageWithCapInsets:resizingMode:", 1, v13, v13, 0.0, 0.0);

    v15 = objc_msgSend(v11, "resizableImageWithCapInsets:resizingMode:", 1, v13, v13, 0.0, 0.0);

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15 highlightedImage:v14];
    topLeftCornerView = v3->__topLeftCornerView;
    v3->__topLeftCornerView = (UIImageView *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15 highlightedImage:v14];
    topRightCornerView = v3->__topRightCornerView;
    v3->__topRightCornerView = (UIImageView *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15 highlightedImage:v14];
    bottomLeftCornerView = v3->__bottomLeftCornerView;
    v3->__bottomLeftCornerView = (UIImageView *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15 highlightedImage:v14];
    bottomRightCornerView = v3->__bottomRightCornerView;
    v3->__bottomRightCornerView = (UIImageView *)v22;

    [(UIView *)v3->__containerView addSubview:v3->__topLeftCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__topRightCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__bottomLeftCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__bottomRightCornerView];
    v24 = (void *)MEMORY[0x1E4FB1818];
    v25 = CEKFrameworkBundle();
    v26 = [v24 imageNamed:@"CEKSubjectIndicatorRect" inBundle:v25];
    v27 = [v26 imageWithRenderingMode:2];

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v27];
    fullSizeIndicatorView = v3->__fullSizeIndicatorView;
    v3->__fullSizeIndicatorView = (UIImageView *)v28;

    [(UIImageView *)v3->__fullSizeIndicatorView setContentMode:0];
    [(UIView *)v3->__containerView addSubview:v3->__fullSizeIndicatorView];
    v3->_shape = 1;
    v30 = v3;
  }
  return v3;
}

- (void)setInactive:(BOOL)a3
{
  if (self->_inactive != a3)
  {
    self->_inactive = a3;
    [(CEKSubjectIndicatorView *)self setNeedsLayout];
  }
}

- (void)setShape:(int64_t)a3
{
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_shape != a3)
  {
    if (a4)
    {
      [(CEKSubjectIndicatorView *)self layoutIfNeeded];
      self->_shape = a3;
      [(CEKSubjectIndicatorView *)self setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __45__CEKSubjectIndicatorView_setShape_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 options:0 animations:0.4 completion:0.0];
    }
    else
    {
      self->_shape = a3;
      [(CEKSubjectIndicatorView *)self setNeedsLayout];
    }
  }
}

uint64_t __45__CEKSubjectIndicatorView_setShape_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

+ (CGSize)fixedSizeWithScale:(double)a3
{
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(a1, "_fixedSubjectIndicatorSizeForReferenceBounds:withScale:", v7, v9, a3);
  double v11 = v10 + -3.0 + -3.0;
  double v13 = v12 + -3.0 + -3.0;
  result.height = v13;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CEKSubjectIndicatorView *)self window];
  v3 = [v2 screen];
  [v3 scale];
  double v5 = v4;

  +[CEKSubjectIndicatorView fixedSizeWithScale:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v73.receiver = self;
  v73.super_class = (Class)CEKSubjectIndicatorView;
  [(CEKSubjectIndicatorView *)&v73 layoutSubviews];
  [(CEKSubjectIndicatorView *)self bounds];
  double v4 = v3 + 6.0;
  double v6 = v5 + 6.0;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  UIRectGetCenter();
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CEKSubjectIndicatorView *)self _containerView];
  objc_msgSend(v13, "setBounds:", v7, v8, v4, v6);
  objc_msgSend(v13, "setCenter:", v10, v12);
  v14 = [(CEKSubjectIndicatorView *)self _topLeftCornerView];
  v15 = [v14 image];
  [v15 size];
  double v17 = v16;
  double v19 = v18;

  int64_t v20 = [(CEKSubjectIndicatorView *)self shape];
  if ((unint64_t)(v20 - 1) < 2)
  {
    if (v4 >= v6) {
      double v29 = v6;
    }
    else {
      double v29 = v4;
    }
    double v30 = v29 * 0.4;
    if (v19 >= v30) {
      double v19 = v30;
    }
    if (v17 >= v30) {
      double v17 = v30;
    }
    int64_t v31 = [(CEKSubjectIndicatorView *)self shape];
    double v32 = 1.0;
    if (v31 == 2) {
      double v32 = 2.5;
    }
    double v23 = v17 * v32;
    UIRoundToViewScale();
    double v28 = v33;
    uint64_t v26 = 0;
    double v22 = v4 - v33;
    double v21 = v6 - v19;
    double v27 = 0.0;
    goto LABEL_15;
  }
  double v22 = *MEMORY[0x1E4F1DB28];
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v20 == 3)
  {
    uint64_t v26 = 1;
  }
  else
  {
    if (!v20)
    {
      UIRoundToViewScale();
      double v23 = v24;
      UIRoundToViewScale();
      double v21 = v25;
      uint64_t v26 = 0;
      double v27 = 0.0;
      double v22 = v23;
      double v19 = v25;
      double v28 = v23;
LABEL_15:
      double v34 = 0.0;
      goto LABEL_19;
    }
    uint64_t v26 = 0;
  }
  double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v34 = *MEMORY[0x1E4F1DB28];
LABEL_19:
  v35 = [(CEKSubjectIndicatorView *)self _topLeftCornerView];
  [v35 setHidden:v26];

  v36 = [(CEKSubjectIndicatorView *)self _topRightCornerView];
  [v36 setHidden:v26];

  v37 = [(CEKSubjectIndicatorView *)self _bottomLeftCornerView];
  [v37 setHidden:v26];

  v38 = [(CEKSubjectIndicatorView *)self _bottomRightCornerView];
  [v38 setHidden:v26];

  v39 = [(CEKSubjectIndicatorView *)self _fullSizeIndicatorView];
  [v39 setHidden:v26 ^ 1];

  if (v26)
  {
    [v13 bounds];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    v48 = [(CEKSubjectIndicatorView *)self _fullSizeIndicatorView];
    v49 = v48;
    double v50 = v41;
    double v51 = v43;
    double v52 = v45;
    double v53 = v47;
  }
  else
  {
    v54 = [(CEKSubjectIndicatorView *)self _topLeftCornerView];
    objc_msgSend(v54, "setFrame:", v34, v27, v28, v19);

    v55 = [(CEKSubjectIndicatorView *)self _topRightCornerView];
    objc_msgSend(v55, "setFrame:", v22, v27, v23, v19);

    v56 = [(CEKSubjectIndicatorView *)self _bottomLeftCornerView];
    objc_msgSend(v56, "setFrame:", v34, v21, v28, v19);

    v48 = [(CEKSubjectIndicatorView *)self _bottomRightCornerView];
    v49 = v48;
    double v50 = v22;
    double v51 = v21;
    double v52 = v28;
    double v53 = v19;
  }
  objc_msgSend(v48, "setFrame:", v50, v51, v52, v53);

  BOOL v57 = [(CEKSubjectIndicatorView *)self isInactive];
  v58 = [(CEKSubjectIndicatorView *)self _topLeftCornerView];
  [v58 setHighlighted:v57];

  v59 = [(CEKSubjectIndicatorView *)self _topRightCornerView];
  [v59 setHighlighted:v57];

  v60 = [(CEKSubjectIndicatorView *)self _bottomLeftCornerView];
  [v60 setHighlighted:v57];

  v61 = [(CEKSubjectIndicatorView *)self _bottomRightCornerView];
  [v61 setHighlighted:v57];

  if ([(CEKSubjectIndicatorView *)self isInactive]) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v62 = [MEMORY[0x1E4FB1618] systemYellowColor];
  }
  v63 = [(CEKSubjectIndicatorView *)self _fullSizeIndicatorView];
  [v63 setTintColor:v62];

  CGAffineTransformMakeScale(&v72, -1.0, 1.0);
  v64 = [(CEKSubjectIndicatorView *)self _topRightCornerView];
  CGAffineTransform v71 = v72;
  [v64 setTransform:&v71];

  CGAffineTransformMakeScale(&v70, 1.0, -1.0);
  v65 = [(CEKSubjectIndicatorView *)self _bottomLeftCornerView];
  CGAffineTransform v69 = v70;
  [v65 setTransform:&v69];

  CGAffineTransformMakeScale(&v68, -1.0, -1.0);
  v66 = [(CEKSubjectIndicatorView *)self _bottomRightCornerView];
  CGAffineTransform v67 = v68;
  [v66 setTransform:&v67];
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  double v7 = [(CEKSubjectIndicatorView *)self _containerView];
  double v8 = [(CEKSubjectIndicatorView *)self layer];
  double v9 = [v7 layer];
  uint64_t v10 = [v8 animationForKey:@"opacity"];

  uint64_t v11 = [v9 animationForKey:@"transform"];

  [(CEKSubjectIndicatorView *)self alpha];
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
    [(CEKSubjectIndicatorView *)self setAlpha:v13];
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
    v14 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke;
    v24[3] = &unk_1E63CD5A0;
    v24[4] = self;
    v24[5] = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_2;
    v22[3] = &unk_1E63CD438;
    v22[4] = self;
    id v23 = v9;
    [v14 animateWithDuration:6 delay:v24 options:v22 animations:0.25 completion:0.0];
    v15 = v23;
  }
  else
  {
    if (!(v11 | v10))
    {
      [(CEKSubjectIndicatorView *)self layoutIfNeeded];
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 1.22279793, 1.22279793);
      CGAffineTransform v20 = v21;
      [v7 setTransform:&v20];
    }
    double v16 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_3;
    v17[3] = &unk_1E63CDB38;
    v17[4] = self;
    BOOL v19 = (v11 | v10) == 0;
    id v18 = v7;
    [v16 animateWithDuration:131078 delay:v17 options:0 animations:0.233333333 completion:0.0];
    v15 = v18;
  }

LABEL_16:
}

uint64_t __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_2(uint64_t a1)
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

uint64_t __46__CEKSubjectIndicatorView_setHidden_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAlpha:1.0];
  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 40);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v5[0] = *MEMORY[0x1E4F1DAB8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    return [v3 setTransform:v5];
  }
  return result;
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = [(CEKSubjectIndicatorView *)self _containerView];
  double v12 = [v11 layer];
  double v13 = [v12 animationForKey:@"transform"];

  if (v13)
  {
    v14 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Skipping attempt to scale a CEKSubjectIndicatorView since a transform animation is already in progress";
LABEL_7:
      _os_log_impl(&dword_1BEE2D000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }
  else
  {
    [(CEKSubjectIndicatorView *)self bounds];
    if (v16 == 0.0)
    {
      v14 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Attempting to scale a CEKSubjectIndicatorView without having a valid width yet";
        goto LABEL_7;
      }
    }
    else
    {
      double v17 = v16;
      if (!v10)
      {
        id v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
      }
      v14 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
      [v14 setTimingFunction:v10];
      [v14 setDuration:a4];
      v27[0] = &unk_1F1A0FAF0;
      id v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v17 + a3 * 2.0) / v17];
      v27[1] = v18;
      BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      [v14 setValues:v19];

      *(float *)&double v20 = (float)a5;
      [v14 setRepeatCount:v20];
      [v14 setAutoreverses:1];
      [v12 addAnimation:v14 forKey:@"transform"];
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v25[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v25[5] = v21;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v25[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v25[7] = v22;
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v25[0] = *MEMORY[0x1E4F39B10];
      v25[1] = v23;
      long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v25[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v25[3] = v24;
      [v12 setTransform:v25];
    }
  }
}

- (void)stopScalingWithDuration:(double)a3
{
  long long v4 = [(CEKSubjectIndicatorView *)self _containerView];
  BOOL v5 = [v4 layer];

  double v6 = (long long *)MEMORY[0x1E4F39B10];
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
    uint64_t v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    [v11 setDuration:a3];
    double v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    [v11 setTimingFunction:v12];

    long long v28 = v36;
    long long v29 = v37;
    long long v30 = v38;
    long long v31 = v39;
    long long v24 = v32;
    long long v25 = v33;
    long long v26 = v34;
    long long v27 = v35;
    double v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
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
    id v18 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
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
  double v2 = [(CEKSubjectIndicatorView *)self _containerView];
  double v3 = [v2 layer];
  long long v4 = [v3 animationForKey:@"opacity"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setPulsing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKSubjectIndicatorView *)self isPulsing] != a3)
  {
    BOOL v5 = [(CEKSubjectIndicatorView *)self _containerView];
    double v6 = [v5 layer];
    uint64_t v7 = v6;
    if (v3)
    {
      [v5 setAlpha:1.0];
      double v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__CEKSubjectIndicatorView_setPulsing___block_invoke;
      v9[3] = &unk_1E63CD380;
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

uint64_t __38__CEKSubjectIndicatorView_setPulsing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.35];
}

+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3 withScale:(double)a4
{
  UIRoundToScale();
  double v5 = v4;
  UIRoundToScale();
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (int64_t)shape
{
  return self->_shape;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (UIImageView)_fullSizeIndicatorView
{
  return self->__fullSizeIndicatorView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__fullSizeIndicatorView, 0);
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
}

@end
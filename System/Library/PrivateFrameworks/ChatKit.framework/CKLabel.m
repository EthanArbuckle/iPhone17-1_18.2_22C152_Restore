@interface CKLabel
- (BOOL)hasAccessoryImageView;
- (BOOL)isLTR;
- (BOOL)shouldHaveRotatedTitleIconImage;
- (BOOL)titleIconImageTypeSupportsRotation:(int64_t)a3;
- (CGRect)rectToDrawTextInForRect:(CGRect)a3;
- (CGRect)textRectForAccessoryImageView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeOfAccessoryImageView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSSet)titleIconImageTypesSupportingRotation;
- (UIImageView)titleIconImageView;
- (int64_t)titleIconImageType;
- (void)_rotateTitleIconImageView;
- (void)drawTextInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3;
- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextColor:(id)a3;
- (void)setTextRectForAccessoryImageView:(CGRect)a3;
- (void)setTitleIconImageType:(int64_t)a3;
- (void)setTitleIconImageTypesSupportingRotation:(id)a3;
- (void)setTitleIconImageView:(id)a3;
@end

@implementation CKLabel

- (void)_rotateTitleIconImageView
{
  memset(&v11, 0, sizeof(v11));
  if ([(CKLabel *)self shouldHaveRotatedTitleIconImage])
  {
    BOOL v3 = [(CKLabel *)self isLTR];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v3) {
      CGFloat v5 = 1.57079633;
    }
    else {
      CGFloat v5 = -1.57079633;
    }
    CGAffineTransformRotate(&v11, &v10, v5);
  }
  else
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v6;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  CGAffineTransform v9 = v11;
  v7 = [(CKLabel *)self titleIconImageView];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (BOOL)shouldHaveRotatedTitleIconImage
{
  return self->_shouldHaveRotatedTitleIconImage;
}

- (void)setTitleIconImageType:(int64_t)a3
{
  if (self->_titleIconImageType != a3) {
    [(CKLabel *)self setNeedsDisplay];
  }
  self->_titleIconImageType = a3;
  CGFloat v5 = [(CKLabel *)self titleIconImageView];
  [v5 removeFromSuperview];

  [(CKLabel *)self setTitleIconImageView:0];
  switch(a3)
  {
    case 1:
      id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKLabel *)self setTitleIconImageView:v7];

      CGAffineTransform v8 = +[CKUIBehavior sharedBehaviors];
      uint64_t v9 = [v8 businessVerifiedImageLarge];
      goto LABEL_6;
    case 2:
      id v26 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKLabel *)self setTitleIconImageView:v27];

      v28 = +[CKUIBehavior sharedBehaviors];
      v29 = [v28 theme];
      v30 = [v29 navBarGrayColor];
      v31 = [(CKLabel *)self titleIconImageView];
      [v31 setTintColor:v30];

      v14 = +[CKUIBehavior sharedBehaviors];
      v15 = [v14 navBarHeaderChevronImageNoAvatar];
      v32 = [(CKLabel *)self titleIconImageView];
      [v32 setImage:v15];

      goto LABEL_13;
    case 3:
      id v10 = objc_alloc(MEMORY[0x1E4F42AA0]);
      CGAffineTransform v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKLabel *)self setTitleIconImageView:v11];

      CGAffineTransform v8 = +[CKUIBehavior sharedBehaviors];
      uint64_t v9 = [v8 navBarHeaderOpaqueChevronImageNoAvatar];
LABEL_6:
      v12 = (void *)v9;
      v13 = [(CKLabel *)self titleIconImageView];
      [v13 setImage:v12];

      v14 = [(CKLabel *)self textColor];
      v15 = [(CKLabel *)self titleIconImageView];
      [v15 setTintColor:v14];
      goto LABEL_13;
    case 4:
      v33 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v34 = [v33 isKeyTransparencyEnabled];

      if (!v34) {
        goto LABEL_14;
      }
      id v35 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v36 = objc_msgSend(v35, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKLabel *)self setTitleIconImageView:v36];

      v37 = +[CKUIBehavior sharedBehaviors];
      v38 = [v37 theme];
      v39 = [v38 navBarGrayColor];
      v40 = [(CKLabel *)self titleIconImageView];
      [v40 setTintColor:v39];

      v24 = (void *)MEMORY[0x1E4F42A80];
      v25 = @"checkmark.circle.fill";
      break;
    case 5:
      v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v17 = [v16 isKeyTransparencyEnabled];

      if (!v17) {
        goto LABEL_14;
      }
      id v18 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKLabel *)self setTitleIconImageView:v19];

      v20 = +[CKUIBehavior sharedBehaviors];
      v21 = [v20 theme];
      v22 = [v21 navBarGrayColor];
      v23 = [(CKLabel *)self titleIconImageView];
      [v23 setTintColor:v22];

      v24 = (void *)MEMORY[0x1E4F42A80];
      v25 = @"exclamationmark.triangle.fill";
      break;
    default:
      goto LABEL_14;
  }
  v14 = [v24 systemImageNamed:v25];
  v15 = [(CKLabel *)self titleIconImageView];
  [v15 setImage:v14];
LABEL_13:

  v41 = [(CKLabel *)self titleIconImageView];
  [(CKLabel *)self addSubview:v41];

LABEL_14:
  if ([(CKLabel *)self titleIconImageTypeSupportsRotation:a3])
  {
    v42 = [(CKLabel *)self titleIconImageView];
    [v42 setContentMode:4];
  }
  else
  {
    [(CKLabel *)self setShouldHaveRotatedTitleIconImage:0];
    [(CKLabel *)self _rotateTitleIconImageView];
  }

  [(CKLabel *)self setNeedsLayout];
}

- (UIImageView)titleIconImageView
{
  return self->_titleIconImageView;
}

- (BOOL)titleIconImageTypeSupportsRotation:(int64_t)a3
{
  long long v4 = [(CKLabel *)self titleIconImageTypesSupportingRotation];
  CGFloat v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (NSSet)titleIconImageTypesSupportingRotation
{
  titleIconImageTypesSupportingRotation = self->_titleIconImageTypesSupportingRotation;
  if (!titleIconImageTypesSupportingRotation)
  {
    long long v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDF15920];
    CGFloat v5 = self->_titleIconImageTypesSupportingRotation;
    self->_titleIconImageTypesSupportingRotation = v4;

    titleIconImageTypesSupportingRotation = self->_titleIconImageTypesSupportingRotation;
  }

  return titleIconImageTypesSupportingRotation;
}

- (void)setTitleIconImageView:(id)a3
{
}

- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3
{
  self->_shouldHaveRotatedTitleIconImage = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CKLabel *)self hasAccessoryImageView])
  {
    [(CKLabel *)self sizeOfAccessoryImageView];
    double v7 = v6;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v15.receiver = self;
      v15.super_class = (Class)CKLabel;
      -[CKLabel sizeThatFits:](&v15, sel_sizeThatFits_, width, height);
      double v11 = v7 + 4.0 + v12;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)CKLabel;
      -[CKLabel sizeThatFits:](&v14, sel_sizeThatFits_, width + -4.0 - v6, height);
      double v11 = v7 + 4.0 + v10;
      if (v11 >= width) {
        double v11 = width;
      }
      if (v9 >= height) {
        double v9 = height;
      }
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKLabel;
    -[CKLabel sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.double height = v9;
  result.double width = v11;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  -[CKLabel rectToDrawTextInForRect:](self, "rectToDrawTextInForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4.receiver = self;
  v4.super_class = (Class)CKLabel;
  -[CKLabel drawTextInRect:](&v4, sel_drawTextInRect_);
}

- (CGRect)rectToDrawTextInForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CKLabel *)self hasAccessoryImageView])
  {
    [(CKLabel *)self textRectForAccessoryImageView];
    CGFloat x = v8;
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CKLabel;
  [(CKLabel *)&v47 layoutSubviews];
  if (![(CKLabel *)self hasAccessoryImageView]) {
    return;
  }
  [(CKLabel *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CKLabel *)self sizeOfAccessoryImageView];
  double v12 = v11;
  double rect_16 = v13;
  v48.origin.CGFloat x = v4;
  v48.origin.CGFloat y = v6;
  v48.size.CGFloat width = v8;
  v48.size.CGFloat height = v10;
  double rect_24 = v12;
  CGFloat v14 = CGRectGetWidth(v48) + -2.0 - v12;
  v49.origin.CGFloat x = v4;
  v49.origin.CGFloat y = v6;
  v49.size.CGFloat width = v8;
  v49.size.CGFloat height = v10;
  -[CKLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", [(CKLabel *)self numberOfLines], 0.0, 0.0, v14, CGRectGetHeight(v49));
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat rect = v15;
  if ([(CKLabel *)self textAlignment] == 1)
  {
    v50.origin.CGFloat x = v4;
    v50.origin.CGFloat y = v6;
    v50.size.CGFloat width = v8;
    v50.size.CGFloat height = v10;
    double rect_8a = CGRectGetWidth(v50);
    v51.origin.CGFloat x = v16;
    v51.origin.CGFloat y = v18;
    v51.size.CGFloat width = v20;
    v51.size.CGFloat height = v22;
    double v23 = (rect_8a - (rect_24 + CGRectGetWidth(v51) + 2.0)) * 0.5;
  }
  else
  {
    if (![(CKLabel *)self isLTR])
    {
      v52.origin.CGFloat x = v4;
      v52.origin.CGFloat y = v6;
      v52.size.CGFloat width = v8;
      v52.size.CGFloat height = v10;
      double rect_8b = CGRectGetWidth(v52);
      v53.origin.CGFloat x = v16;
      v53.origin.CGFloat y = v18;
      v53.size.CGFloat width = v20;
      v53.size.CGFloat height = v22;
      CGFloat v24 = v6;
      double rect_8 = rect_8b - (rect_24 + CGRectGetWidth(v53) + 2.0);
      goto LABEL_8;
    }
    double v23 = 0.0;
  }
  double rect_8 = v23;
  CGFloat v24 = v6;
LABEL_8:
  v54.origin.CGFloat x = v4;
  v54.origin.CGFloat y = v24;
  v54.size.CGFloat width = v8;
  v54.size.CGFloat height = v10;
  double v40 = (CGRectGetHeight(v54) - rect_16) * 0.5;
  v55.origin.CGFloat x = v4;
  v55.origin.CGFloat y = v24;
  v55.size.CGFloat width = v8;
  v55.size.CGFloat height = v10;
  double Height = CGRectGetHeight(v55);
  v56.origin.CGFloat x = rect;
  v56.origin.CGFloat y = v18;
  v56.size.CGFloat width = v20;
  v56.size.CGFloat height = v22;
  double v26 = (Height - CGRectGetHeight(v56)) * 0.5;
  if ([(CKLabel *)self isLTR])
  {
    double v27 = rect_8;
    double v28 = v26;
    CGFloat v29 = v20;
    CGFloat v30 = v22;
  }
  else
  {
    double v27 = rect_8;
    double v28 = v40;
    CGFloat v29 = rect_24;
    CGFloat v30 = rect_16;
  }
  CGRectGetMaxX(*(CGRect *)&v27);
  UIRectRoundToViewScale();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(CKLabel *)self titleIconImageView];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  UIRectRoundToViewScale();
  -[CKLabel setTextRectForAccessoryImageView:](self, "setTextRectForAccessoryImageView:");
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKLabel;
  [(CKLabel *)&v6 setTextColor:v4];
  if ([(CKLabel *)self titleIconImageType] == 1
    || [(CKLabel *)self titleIconImageType] == 3)
  {
    double v5 = [(CKLabel *)self titleIconImageView];
    [v5 setTintColor:v4];
  }
}

- (BOOL)hasAccessoryImageView
{
  int64_t v2 = [(CKLabel *)self titleIconImageType];
  if (v2)
  {
    if (v2 == 5 || v2 == 4)
    {
      double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      char v4 = [v3 isKeyTransparencyEnabled];

      LOBYTE(v2) = v4;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (int64_t)titleIconImageType
{
  return self->_titleIconImageType;
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)CKLabel;
  [(CKLabel *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if ([(CKLabel *)self hasAccessoryImageView])
  {
    [(CKLabel *)self sizeOfAccessoryImageView];
    double v4 = v4 + v7 + 2.0;
  }
  double v8 = v4;
  double v9 = v6;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)sizeOfAccessoryImageView
{
  switch([(CKLabel *)self titleIconImageType])
  {
    case 0:
      goto LABEL_5;
    case 1:
      CGFloat v22 = [(CKLabel *)self font];
      [v22 lineHeight];
      UICeilToViewScale();
      double v2 = v23;

      double v4 = v2;
      break;
    case 2:
    case 3:
      double v5 = [(CKLabel *)self titleIconImageView];
      double v6 = [v5 image];
      [v6 size];
      double v8 = v7;
      double v10 = v9;

      double v4 = v8 * 1.5;
      double v2 = v10 * 1.5;
      break;
    case 4:
    case 5:
      double v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v12 = [v11 isKeyTransparencyEnabled];

      if (v12)
      {
        double v13 = [(CKLabel *)self font];
        [v13 lineHeight];
        UICeilToViewScale();
        double v15 = v14;

        CGFloat v16 = [(CKLabel *)self titleIconImageView];
        double v17 = [v16 image];
        [v17 size];
        double v19 = v18;
        double v21 = v20;

        double v4 = v19 * (v15 / v21);
        double v2 = v21 * (v15 / v21);
      }
      else
      {
LABEL_5:
        double v4 = *MEMORY[0x1E4F1DB30];
        double v2 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      break;
    default:
      break;
  }
  double v24 = v2;
  result.CGFloat height = v24;
  result.CGFloat width = v4;
  return result;
}

- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKLabel *)self titleIconImageTypeSupportsRotation:[(CKLabel *)self titleIconImageType]])
  {
    [(CKLabel *)self setShouldHaveRotatedTitleIconImage:v5];
    if (v4)
    {
      double v7 = +[CKUIBehavior sharedBehaviors];
      [v7 transcriptHeaderChevronRotationAnimationSpeed];
      double v9 = v8;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__CKLabel_setShouldHaveRotatedTitleIconImage_animated___block_invoke;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v10 options:0 animations:v9 completion:0.0];
    }
    else
    {
      [(CKLabel *)self _rotateTitleIconImageView];
    }
  }
}

uint64_t __55__CKLabel_setShouldHaveRotatedTitleIconImage_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rotateTitleIconImageView];
}

- (BOOL)isLTR
{
  return [(CKLabel *)self _shouldReverseLayoutDirection] ^ 1;
}

- (void)setTitleIconImageTypesSupportingRotation:(id)a3
{
}

- (CGRect)textRectForAccessoryImageView
{
  double x = self->_textRectForAccessoryImageView.origin.x;
  double y = self->_textRectForAccessoryImageView.origin.y;
  double width = self->_textRectForAccessoryImageView.size.width;
  double height = self->_textRectForAccessoryImageView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextRectForAccessoryImageView:(CGRect)a3
{
  self->_textRectForAccessoryImageView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleIconImageTypesSupportingRotation, 0);

  objc_storeStrong((id *)&self->_titleIconImageView, 0);
}

@end
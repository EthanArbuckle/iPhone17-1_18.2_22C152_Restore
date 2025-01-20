@interface CKEmojiBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKEmojiBalloonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setOrientation:(char)a3;
@end

@implementation CKEmojiBalloonView

- (CKEmojiBalloonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKEmojiBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKEmojiBalloonView *)v3 setClipsToBounds:1];
    [(CKEmojiBalloonView *)v4 setContentMode:5];
  }
  return v4;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CKEmojiBalloonView;
  [(CKImageBalloonView *)&v18 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 balloonMaskTailSizeForTailShape:1];
  double v5 = v4;
  if (CKMainScreenScale_once_25 != -1) {
    dispatch_once(&CKMainScreenScale_once_25, &__block_literal_global_56);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_25;

  int v7 = [(CKBalloonView *)self orientation];
  if (CKMainScreenScale_once_25 != -1) {
    dispatch_once(&CKMainScreenScale_once_25, &__block_literal_global_56);
  }
  double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_25;
  v9 = [(CKEmojiBalloonView *)self layer];
  v10 = v9;
  memset(&v17, 0, sizeof(v17));
  if (v9) {
    [v9 contentsTransform];
  }
  double v11 = 1.0;
  if (v8 == 0.0) {
    double v12 = 1.0;
  }
  else {
    double v12 = v8;
  }
  if (v6 != 0.0) {
    double v11 = v6;
  }
  double v13 = floor(v5 * 0.5 * v11) / v11;
  double v14 = -floor(v13 * 1.5 * v12) / v12;
  if (v7) {
    double v13 = -v13;
  }
  CGAffineTransform v15 = v17;
  CGAffineTransformTranslate(&v16, &v15, v13, v14);
  [v10 setContentsTransform:&v16];
}

- (void)setOrientation:(char)a3
{
  uint64_t v3 = a3;
  if ([(CKBalloonView *)self orientation] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKEmojiBalloonView;
    [(CKBalloonView *)&v5 setOrientation:v3];
    [(CKEmojiBalloonView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  objc_super v5 = [(CKImageBalloonView *)self animatedImage];
  double v6 = v5;
  if (!v5) {
    objc_super v5 = self;
  }
  int v7 = [v5 image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 balloonMaskTailSizeForTailShape:1];
  double v14 = v13;
  if (CKMainScreenScale_once_25 != -1) {
    dispatch_once(&CKMainScreenScale_once_25, &__block_literal_global_56);
  }
  double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_25;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_25 == 0.0) {
    double v15 = 1.0;
  }
  double v16 = floor(v14 * 0.5 * v15) / v15;

  double v17 = v9 - v16;
  double v18 = v11 + v16 * -3.0;
  result.height = v18;
  result.width = v17;
  return result;
}

@end
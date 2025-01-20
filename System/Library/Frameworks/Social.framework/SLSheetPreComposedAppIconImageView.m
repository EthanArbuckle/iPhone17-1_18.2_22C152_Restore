@interface SLSheetPreComposedAppIconImageView
- (CGSize)intrinsicContentSize;
- (SLSheetPreComposedAppIconImageView)init;
- (UIEdgeInsets)alignmentRectInsets;
- (void)setImage:(id)a3;
@end

@implementation SLSheetPreComposedAppIconImageView

- (SLSheetPreComposedAppIconImageView)init
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v15.receiver = self;
  v15.super_class = (Class)SLSheetPreComposedAppIconImageView;
  v4 = -[SLSheetImagePreviewView initWithFrame:](&v15, sel_initWithFrame_, v2, v3, 110.0, 110.0);
  v5 = v4;
  if (v4)
  {
    v6 = [(SLSheetPreComposedAppIconImageView *)v4 layer];
    [v6 setShouldRasterize:1];

    v7 = [(SLSheetPreComposedAppIconImageView *)v5 layer];
    v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
    objc_msgSend(v7, "setRasterizationScale:");

    id v9 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v16.origin.x = v2;
    v16.origin.y = v3;
    v16.size.width = 110.0;
    v16.size.height = 110.0;
    CGRect v17 = CGRectInset(v16, 6.5, 6.5);
    v10 = objc_msgSend(v9, "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    [(SLSheetImagePreviewView *)v5 setImageView:v10];

    v11 = [(SLSheetImagePreviewView *)v5 imageView];
    [v11 setContentMode:2];

    v12 = [(SLSheetImagePreviewView *)v5 imageView];
    [v12 setClipsToBounds:1];

    v13 = [(SLSheetImagePreviewView *)v5 imageView];
    [(SLSheetPreComposedAppIconImageView *)v5 addSubview:v13];

    [(SLSheetPreComposedAppIconImageView *)v5 setNeedsLayout];
  }
  return v5;
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (a3)
  {
    [v5 size];
    double width = v7;
    double height = v9;
    [(SLSheetPreComposedAppIconImageView *)self bounds];
    double x = (v11 - width) * 0.5;
    [(SLSheetPreComposedAppIconImageView *)self bounds];
    double y = (v13 - height) * 0.5;
  }
  else
  {
    [(SLSheetPreComposedAppIconImageView *)self bounds];
    CGRect v18 = CGRectInset(v17, 6.5, 6.5);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
  }
  objc_super v15 = [(SLSheetImagePreviewView *)self imageView];
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  v16.receiver = self;
  v16.super_class = (Class)SLSheetPreComposedAppIconImageView;
  [(SLSheetImagePreviewView *)&v16 setImage:v6];
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 8.0;
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 94.0;
  double v3 = 94.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end
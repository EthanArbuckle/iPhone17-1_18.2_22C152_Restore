@interface CEKMultiplyImageView
- (CEKMultiplyImageView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIColor)contentsMultiplyColor;
- (UIImage)image;
- (void)setContentsMultiplyColor:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation CEKMultiplyImageView

- (CEKMultiplyImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CEKMultiplyImageView;
  v3 = -[CEKMultiplyImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CEKMultiplyImageView *)v3 setUserInteractionEnabled:0];
    v5 = v4;
  }

  return v4;
}

- (void)setContentsMultiplyColor:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_contentsMultiplyColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentsMultiplyColor, a3);
    uint64_t v5 = [v7 CGColor];
    v6 = [(CEKMultiplyImageView *)self layer];
    [v6 setContentsMultiplyColor:v5];
  }
}

- (void)setImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v6 = [(UIImage *)v5 imageOrientation];
    long long v7 = *MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v20.c = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v20.tx = v9;
    if (v6)
    {
      *(_OWORD *)&v13.a = v7;
      *(_OWORD *)&v13.c = v8;
      *(_OWORD *)&v13.tx = v9;
      [(UIImage *)v5 size];
      memset(&v19, 0, sizeof(v19));
      CGAffineTransformMakeTranslation(&v19, v10 * -0.5, v11 * -0.5);
      CGAffineTransform t1 = v13;
      CGAffineTransform t2 = v19;
      CGAffineTransformConcat(&v20, &t1, &t2);
      PLTransformForImageOrientation();
      CGAffineTransform t2 = v20;
      CGAffineTransformConcat(&t1, &t2, &v16);
      CGAffineTransform v20 = t1;
      CGAffineTransform t1 = v19;
      CGAffineTransformInvert(&v15, &t1);
      CGAffineTransform t2 = v20;
      CGAffineTransformConcat(&t1, &t2, &v15);
      CGAffineTransform v20 = t1;
    }
    v12 = [(CEKMultiplyImageView *)self layer];
    objc_msgSend(v12, "setContents:", -[UIImage CGImage](v5, "CGImage"));
    CGAffineTransform v14 = v20;
    [v12 setContentsTransform:&v14];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CEKMultiplyImageView *)self image];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)contentsMultiplyColor
{
  return self->_contentsMultiplyColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsMultiplyColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
@interface MPUImageStackItemView
- (CGAffineTransform)imageTransform;
- (CGRect)imageContentsRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUImageStackItemView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (double)imageAlpha;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageAlpha:(double)a3;
- (void)setImageContentsRect:(CGRect)a3;
- (void)setImageTransform:(CGAffineTransform *)a3;
@end

@implementation MPUImageStackItemView

- (MPUImageStackItemView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPUImageStackItemView;
  v3 = -[MPUImageStackItemView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x263F000D0];
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v3->_imageTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v3->_imageTransform.c = v6;
    *(_OWORD *)&v3->_imageTransform.tx = *(_OWORD *)(v5 + 32);
    v3->_imageAlpha = 1.0;
    [(MPUImageStackItemView *)v3 bounds];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v7, v8, v9, v10);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v11;

    [(MPUImageStackItemView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MPUImageStackItemView;
  [(MPUImageStackItemView *)&v4 layoutSubviews];
  imageView = self->_imageView;
  [(MPUImageStackItemView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(UIImageView *)self->_imageView setImage:*p_image];
    [(UIImageView *)self->_imageView setHidden:*p_image == 0];
    float v7 = self->_imageAlpha + -1.0;
    [(UIImageView *)self->_imageView setOpaque:fabsf(v7) < 0.00000011921];
    [MEMORY[0x263F158F8] commit];
    uint64_t v5 = v8;
  }
}

- (void)setImageAlpha:(double)a3
{
  if (self->_imageAlpha != a3)
  {
    self->_imageAlpha = a3;
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:");
    imageView = self->_imageView;
    float v5 = self->_imageAlpha + -1.0;
    BOOL v6 = fabsf(v5) < 0.00000011921;
    [(UIImageView *)imageView setOpaque:v6];
  }
}

- (void)setImageContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_imageContentsRect = &self->_imageContentsRect;
  if (!CGRectEqualToRect(self->_imageContentsRect, a3))
  {
    p_imageContentsRect->origin.CGFloat x = x;
    p_imageContentsRect->origin.CGFloat y = y;
    p_imageContentsRect->size.CGFloat width = width;
    p_imageContentsRect->size.CGFloat height = height;
    id v9 = [(UIImageView *)self->_imageView layer];
    objc_msgSend(v9, "setContentsRect:", p_imageContentsRect->origin.x, p_imageContentsRect->origin.y, p_imageContentsRect->size.width, p_imageContentsRect->size.height);
  }
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  p_imageTransform = &self->_imageTransform;
  long long v6 = *(_OWORD *)&self->_imageTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_imageTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_imageTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_imageTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_imageTransform->tCGFloat x = v9;
    *(_OWORD *)&p_imageTransform->a = v8;
    double v10 = [(UIImageView *)self->_imageView layer];
    long long v11 = *(_OWORD *)&p_imageTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_imageTransform->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&p_imageTransform->tx;
    [v10 setAffineTransform:&t1];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (double)imageAlpha
{
  return self->_imageAlpha;
}

- (CGRect)imageContentsRect
{
  double x = self->_imageContentsRect.origin.x;
  double y = self->_imageContentsRect.origin.y;
  double width = self->_imageContentsRect.size.width;
  double height = self->_imageContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGAffineTransform)imageTransform
{
  long long v3 = *(_OWORD *)&self[10].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[10].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
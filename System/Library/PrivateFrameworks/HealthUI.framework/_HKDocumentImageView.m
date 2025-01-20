@interface _HKDocumentImageView
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)margins;
- (UIImageView)imageView;
- (_HKDocumentImageView)initWithImage:(id)a3;
- (void)layoutSubviews;
- (void)setMargins:(UIEdgeInsets)a3;
@end

@implementation _HKDocumentImageView

- (_HKDocumentImageView)initWithImage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDocumentImageView;
  v5 = -[_HKDocumentImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_margins.top = 0u;
    *(_OWORD *)&v5->_margins.bottom = 0u;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v7;

    [(UIImageView *)v6->_imageView setContentMode:1];
    [(_HKDocumentImageView *)v6 addSubview:v6->_imageView];
    LODWORD(v9) = 1148846080;
    [(_HKDocumentImageView *)v6 setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(_HKDocumentImageView *)v6 setContentCompressionResistancePriority:0 forAxis:v10];
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_imageView intrinsicContentSize];
  double v4 = v3 + self->_margins.top + self->_margins.bottom;
  double v6 = fmin(v5, 65.0) + self->_margins.left + self->_margins.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  [(_HKDocumentImageView *)self frame];
  imageView = self->_imageView;
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end
@interface CertInfoDescriptionCellContentView
- (double)rowHeight;
- (id)_labelFont;
- (id)_valueFont;
- (void)_recalculateIdealHeight;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLabelsAndValues:(id)a3;
@end

@implementation CertInfoDescriptionCellContentView

- (void)dealloc
{
  sizes = self->_sizes;
  if (sizes) {
    free(sizes);
  }
  v4.receiver = self;
  v4.super_class = (Class)CertInfoDescriptionCellContentView;
  [(CertInfoDescriptionCellContentView *)&v4 dealloc];
}

- (id)_labelFont
{
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:13.0];
}

- (id)_valueFont
{
  return (id)[MEMORY[0x263F1C658] systemFontOfSize:13.0];
}

- (void)_recalculateIdealHeight
{
  int v3 = [(NSArray *)self->_labelsAndValues count];
  if (v3 >= 0) {
    int v4 = v3;
  }
  else {
    int v4 = v3 + 1;
  }
  int sizesCount = v4 >> 1;
  self->_int sizesCount = sizesCount;
  sizes = self->_sizes;
  if (sizes)
  {
    free(sizes);
    self->_sizes = 0;
    int sizesCount = self->_sizesCount;
  }
  v7 = (CGSize *)malloc_type_malloc(16 * sizesCount, 0x1000040451B5BE8uLL);
  self->_sizes = v7;
  if (v7)
  {
    self->_idealHeight = 20.0;
    id v25 = [(CertInfoDescriptionCellContentView *)self _valueFont];
    [(CertInfoDescriptionCellContentView *)self bounds];
    double v9 = v8 + -106.0 + -10.0;
    objc_msgSend(@"test", "_legacy_sizeWithFont:forWidth:lineBreakMode:", v25, 4, v9);
    if (self->_sizesCount)
    {
      double v12 = v10;
      double v13 = v11;
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      double v16 = v11 * 10.0;
      do
      {
        v17 = [(NSArray *)self->_labelsAndValues objectAtIndex:v14 * 2 + 1];
        uint64_t v18 = [v17 length];
        CGFloat v19 = v12;
        double v20 = v13;
        if (v18) {
          objc_msgSend(v17, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v25, 4, v9, v16);
        }
        v21 = &self->_sizes[v14];
        v21->width = v19;
        v21->height = v20;
        self->_idealHeight = v20 + self->_idealHeight;

        ++v15;
        unint64_t v22 = self->_sizesCount;
        ++v14;
      }
      while (v15 < v22);
      double v23 = (double)((int)v22 - 1);
    }
    else
    {
      double v23 = -1.0;
    }
    float v24 = self->_idealHeight + v23 * 8.0;
    self->_idealHeight = rintf(v24) + 2.0;
  }
}

- (void)setLabelsAndValues:(id)a3
{
  v5 = (NSArray *)a3;
  p_labelsAndValues = &self->_labelsAndValues;
  if (self->_labelsAndValues != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_labelsAndValues, a3);
    [(CertInfoDescriptionCellContentView *)self _recalculateIdealHeight];
    p_labelsAndValues = (NSArray **)[(CertInfoDescriptionCellContentView *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_labelsAndValues, v5);
}

- (double)rowHeight
{
  return self->_idealHeight;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = [(CertInfoDescriptionCellContentView *)self _labelFont];
  v6 = [(CertInfoDescriptionCellContentView *)self _valueFont];
  NSUInteger v7 = [(NSArray *)self->_labelsAndValues count];
  if (v7)
  {
    NSUInteger v8 = v7;
    NSUInteger v9 = 0;
    long long v22 = xmmword_218616FB0;
    long long v23 = xmmword_218616FA0;
    double v10 = 8.0;
    do
    {
      double v11 = -[NSArray objectAtIndex:](self->_labelsAndValues, "objectAtIndex:", v9, v22, v23);
      double v12 = [(NSArray *)self->_labelsAndValues objectAtIndex:v9 + 1];
      objc_msgSend(v11, "_legacy_sizeWithFont:", v5);
      double v15 = v14;
      if (v13 <= 86.0) {
        double v16 = v13;
      }
      else {
        double v16 = 86.0;
      }
      *(_OWORD *)components = xmmword_218616F80;
      long long v27 = xmmword_218616F90;
      CGContextSetFillColor(CurrentContext, components);
      objc_msgSend(v11, "_legacy_drawInRect:withFont:lineBreakMode:", v5, 4, 96.0 - v16, v10, v16, v15);
      v17 = &self->_sizes[v9 / 2];
      double width = v17->width;
      double height = v17->height;
      v29.origin.x = 96.0 - v16;
      v29.origin.y = v10;
      v29.size.double width = v16;
      v29.size.double height = v15;
      CGFloat v20 = CGRectGetMaxX(v29) + 10.0;
      *(_OWORD *)float v24 = v23;
      long long v25 = v22;
      CGContextSetFillColor(CurrentContext, v24);
      objc_msgSend(v12, "_legacy_drawInRect:withFont:lineBreakMode:", v6, 4, v20, v10, width, height);
      if (v15 >= height) {
        double v21 = v15;
      }
      else {
        double v21 = height;
      }
      double v10 = v10 + v21 + 8.0;

      v9 += 2;
    }
    while (v9 < v8);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CertInfoDescriptionCellContentView;
  [(CertInfoDescriptionCellContentView *)&v3 layoutSubviews];
  [(CertInfoDescriptionCellContentView *)self setNeedsDisplay];
}

- (void).cxx_destruct
{
}

@end
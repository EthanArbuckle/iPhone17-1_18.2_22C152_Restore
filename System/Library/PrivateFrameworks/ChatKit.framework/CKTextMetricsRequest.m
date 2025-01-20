@interface CKTextMetricsRequest
- (BOOL)isAlreadyPadded;
- (CGSize)adjustedMaximumSize;
- (CKTextMetricsRequest)initWithAttributedString:(id)a3;
- (NSAttributedString)attributedString;
- (UIEdgeInsets)containerInset;
- (double)adjustedMaximumWidth;
- (double)lineFragmentPadding;
- (double)maximumHeight;
- (double)maximumWidth;
- (double)minimumViewHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)lineBreakMode;
- (unint64_t)maximumNumberOfLines;
- (void)setAlreadyPadded:(BOOL)a3;
- (void)setAttributedString:(id)a3;
- (void)setContainerInset:(UIEdgeInsets)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setLineFragmentPadding:(double)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMinimumViewHeight:(double)a3;
@end

@implementation CKTextMetricsRequest

- (CKTextMetricsRequest)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTextMetricsRequest;
  v5 = [(CKTextMetricsRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    v8 = (_OWORD *)MEMORY[0x1E4F437F8];
    *((int64x2_t *)v5 + 3) = vdupq_n_s64(0x40C3880000000000uLL);
    long long v9 = v8[1];
    *(_OWORD *)(v5 + 72) = *v8;
    *((void *)v5 + 4) = 0;
    *((void *)v5 + 5) = 0;
    *((void *)v5 + 3) = 0x4014000000000000;
    v5[8] = 1;
    *(_OWORD *)(v5 + 88) = v9;
    *((void *)v5 + 8) = 0;
  }

  return (CKTextMetricsRequest *)v5;
}

- (double)adjustedMaximumWidth
{
  double result = self->_maximumWidth;
  if (!self->_alreadyPadded) {
    return result + self->_lineFragmentPadding * 2.0;
  }
  return result;
}

- (CGSize)adjustedMaximumSize
{
  [(CKTextMetricsRequest *)self adjustedMaximumWidth];
  double v4 = v3;
  [(CKTextMetricsRequest *)self maximumHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [CKTextMetricsRequest alloc];
  double v5 = (void *)[(NSAttributedString *)self->_attributedString copy];
  double v6 = [(CKTextMetricsRequest *)v4 initWithAttributedString:v5];

  [(CKTextMetricsRequest *)v6 setLineFragmentPadding:self->_lineFragmentPadding];
  [(CKTextMetricsRequest *)v6 setLineBreakMode:self->_lineBreakMode];
  [(CKTextMetricsRequest *)v6 setMaximumNumberOfLines:self->_maximumNumberOfLines];
  [(CKTextMetricsRequest *)v6 setMaximumWidth:self->_maximumWidth];
  [(CKTextMetricsRequest *)v6 setMaximumHeight:self->_maximumHeight];
  [(CKTextMetricsRequest *)v6 setAlreadyPadded:self->_alreadyPadded];
  -[CKTextMetricsRequest setContainerInset:](v6, "setContainerInset:", self->_containerInset.top, self->_containerInset.left, self->_containerInset.bottom, self->_containerInset.right);
  [(CKTextMetricsRequest *)v6 setMinimumViewHeight:self->_minimumViewHeight];
  return v6;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (double)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (void)setLineFragmentPadding:(double)a3
{
  self->_lineFragmentPadding = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (BOOL)isAlreadyPadded
{
  return self->_alreadyPadded;
}

- (void)setAlreadyPadded:(BOOL)a3
{
  self->_alreadyPadded = a3;
}

- (UIEdgeInsets)containerInset
{
  double top = self->_containerInset.top;
  double left = self->_containerInset.left;
  double bottom = self->_containerInset.bottom;
  double right = self->_containerInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContainerInset:(UIEdgeInsets)a3
{
  self->_containerInset = a3;
}

- (double)minimumViewHeight
{
  return self->_minimumViewHeight;
}

- (void)setMinimumViewHeight:(double)a3
{
  self->_minimumViewHeight = a3;
}

- (void).cxx_destruct
{
}

@end
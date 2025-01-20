@interface CKTextMetrics
- (BOOL)isSingleLine;
- (CGSize)size;
- (CKTextMetrics)initWithSize:(CGSize)a3 singleLine:(BOOL)a4 alignmentInset:(UIEdgeInsets)a5;
- (UIEdgeInsets)alignmentInset;
- (void)setAlignmentInset:(UIEdgeInsets)a3;
- (void)setSingleLine:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CKTextMetrics

- (CKTextMetrics)initWithSize:(CGSize)a3 singleLine:(BOOL)a4 alignmentInset:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)CKTextMetrics;
  result = [(CKTextMetrics *)&v13 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_singleLine = a4;
    result->_alignmentInset.CGFloat top = top;
    result->_alignmentInset.CGFloat left = left;
    result->_alignmentInset.CGFloat bottom = bottom;
    result->_alignmentInset.CGFloat right = right;
  }
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)isSingleLine
{
  return self->_singleLine;
}

- (void)setSingleLine:(BOOL)a3
{
  self->_singleLine = a3;
}

- (UIEdgeInsets)alignmentInset
{
  double top = self->_alignmentInset.top;
  double left = self->_alignmentInset.left;
  double bottom = self->_alignmentInset.bottom;
  double right = self->_alignmentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAlignmentInset:(UIEdgeInsets)a3
{
  self->_alignmentInset = a3;
}

@end
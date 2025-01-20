@interface CKGradientReferenceView
- (CGRect)gradientFrame;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGradientFrame:(CGRect)a3;
@end

@implementation CKGradientReferenceView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKGradientReferenceView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKGradientReferenceView;
  -[CKGradientReferenceView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIView *)self setGradientViewsNeedLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKGradientReferenceView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKGradientReferenceView;
  -[CKGradientReferenceView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIView *)self setGradientViewsNeedLayout];
  }
}

- (void)setGradientFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_gradientFrame = &self->_gradientFrame;
  if (!CGRectEqualToRect(self->_gradientFrame, a3))
  {
    p_gradientFrame->origin.CGFloat x = x;
    p_gradientFrame->origin.CGFloat y = y;
    p_gradientFrame->size.CGFloat width = width;
    p_gradientFrame->size.CGFloat height = height;
    [(UIView *)self setGradientViewsNeedLayout];
  }
}

- (CGRect)gradientFrame
{
  double x = self->_gradientFrame.origin.x;
  double y = self->_gradientFrame.origin.y;
  double width = self->_gradientFrame.size.width;
  double height = self->_gradientFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end
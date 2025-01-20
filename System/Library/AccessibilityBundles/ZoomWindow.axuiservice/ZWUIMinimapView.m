@interface ZWUIMinimapView
- (BOOL)enabled;
- (CGRect)zoomedRect;
- (ZWUIMinimapView)initWithFrame:(CGRect)a3;
- (void)hideSelf;
- (void)setEnabled:(BOOL)a3;
- (void)setZoomedRect:(CGRect)a3;
- (void)setZoomedRect:(CGRect)a3 screenRect:(CGRect)a4;
@end

@implementation ZWUIMinimapView

- (ZWUIMinimapView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZWUIMinimapView;
  return -[ZWUIMinimapView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __30__ZWUIMinimapView_setEnabled___block_invoke;
  v3[3] = &unk_78B78;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView animateWithDuration:4 delay:v3 options:0 animations:0.25 completion:0.0];
}

id __30__ZWUIMinimapView_setEnabled___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setZoomedRect:(CGRect)a3 screenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  -[ZWUIMinimapView setZoomedRect:](self, "setZoomedRect:");
  [(ZWUIMinimapView *)self bounds];
  CGRect v22 = CGRectInset(v21, 1.0, 1.0);
  double v11 = v22.size.width;
  double v12 = v22.size.height;
  v22.origin.CGFloat x = v9;
  v22.origin.CGFloat y = v8;
  v22.size.double width = v7;
  v22.size.double height = v6;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  CGRect v23 = CGRectIntersection(v22, v24);
  double v13 = v23.origin.x / width * v11 + 1.0;
  double v14 = v23.origin.y / height * v12 + 1.0;
  double v15 = v11 * (v23.size.width / width);
  double v16 = v12 * (v23.size.height / height);
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"hideSelf" object:0];
  [(ZWUIMinimapView *)self performSelector:"hideSelf" withObject:0 afterDelay:1.25];
  zoomedView = self->_zoomedView;

  -[UIView setFrame:](zoomedView, "setFrame:", v13, v14, v15, v16);
}

- (void)hideSelf
{
}

- (CGRect)zoomedRect
{
  double x = self->_zoomedRect.origin.x;
  double y = self->_zoomedRect.origin.y;
  double width = self->_zoomedRect.size.width;
  double height = self->_zoomedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomedRect:(CGRect)a3
{
  self->_zoomedRect = a3;
}

- (void).cxx_destruct
{
}

@end
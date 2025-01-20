@interface CSLUIIconView
+ (double)defaultIconSize;
+ (double)maximumZoomDiameter;
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributes;
- (BOOL)isClock;
- (BOOL)isDragging;
- (BOOL)isJiggling;
- (BOOL)isZooming;
- (CSLHexAppNode)node;
- (CSLUIIconView)initWithFrame:(CGRect)a3;
- (double)diameter;
- (double)unscaledIconSize;
- (void)beginDraggingAtPoint:(CGPoint)a3;
- (void)cleanupAfterZoom;
- (void)endDraggingToLayoutAttributes:(id)a3;
- (void)prepareToZoom;
- (void)setJiggling:(BOOL)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation CSLUIIconView

- (CSLUIIconView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSLUIIconView;
  result = -[CSLUIIconView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_unscaledIconSize = 40.0;
  }
  return result;
}

+ (double)defaultIconSize
{
  return 40.0;
}

- (void)prepareToZoom
{
  self->_isZooming = 1;
}

- (void)cleanupAfterZoom
{
  self->_isZooming = 0;
}

+ (double)maximumZoomDiameter
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  return sqrt(v6 * v6 + v4 * v4);
}

- (BOOL)isClock
{
  return 0;
}

- (void)setJiggling:(BOOL)a3
{
  if (self->_jiggling != a3)
  {
    if (a3) {
      [(CSLUIIconView *)self setupJiggling];
    }
    else {
      [(CSLUIIconView *)self cleanupJiggling];
    }
    self->_jiggling = a3;
  }
}

- (void)beginDraggingAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CSLUIIconView *)self pauseJiggling];
  self->_isDragging = 1;
  memset(&v12, 0, sizeof(v12));
  double v6 = [(CSLUIIconView *)self layer];
  v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }

  CATransform3D v10 = v12;
  CATransform3DScale(&v11, &v10, 1.6, 1.6, 1.0);
  CATransform3D v12 = v11;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3A0C;
  v8[3] = &unk_3C9B8;
  v8[4] = self;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  CATransform3D v9 = v11;
  +[UIView _animateUsingSpringWithDuration:0 delay:v8 options:0 mass:0.63 stiffness:0.0 damping:2.0 initialVelocity:450.0 animations:45.0 completion:0.0];
}

- (void)endDraggingToLayoutAttributes:(id)a3
{
  self->_isDragging = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3B98;
  v6[3] = &unk_3C9E0;
  CATransform3D v9 = self;
  long long v4 = v3[1];
  long long v7 = *v3;
  long long v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3BE0;
  v5[3] = &unk_3CA08;
  v5[4] = self;
  +[UIView _animateUsingSpringWithDuration:0 delay:v6 options:v5 mass:0.65 stiffness:0.0 damping:2.0 initialVelocity:450.0 animations:40.0 completion:0.0];
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (BOOL)isJiggling
{
  return self->_jiggling;
}

- (double)diameter
{
  return self->_diameter;
}

- (double)unscaledIconSize
{
  return self->_unscaledIconSize;
}

- (CSLHexAppNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributes
{
  long long v3 = *(_OWORD *)&self[1].super.super.super.isa;
  long long v4 = *(_OWORD *)&self[1]._unscaledIconSize;
  _OWORD *v2 = v3;
  v2[1] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v3;
}

- (void)setLayoutAttributes:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self[1].super.super.super.isa = *v3;
  *(_OWORD *)&self[1]._unscaledIconSize = v4;
}

- (void).cxx_destruct
{
}

@end
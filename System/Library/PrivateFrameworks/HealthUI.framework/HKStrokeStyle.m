@interface HKStrokeStyle
+ (HKStrokeStyle)strokeStyleWithColor:(id)a3 lineWidth:(double)a4;
- (HKStrokeStyle)init;
- (UIColor)strokeColor;
- (double)lineWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int)blendMode;
- (int)lineCap;
- (int)lineJoin;
- (int64_t)dashStyle;
- (void)applyToContext:(CGContext *)a3;
- (void)applyToContext:(CGContext *)a3 dashPhase:(double)a4;
- (void)setBlendMode:(int)a3;
- (void)setDashStyle:(int64_t)a3;
- (void)setLineCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation HKStrokeStyle

- (void).cxx_destruct
{
}

+ (HKStrokeStyle)strokeStyleWithColor:(id)a3 lineWidth:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v6)
  {
    [v7 setStrokeColor:v6];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setStrokeColor:v9];
  }
  [v8 setLineWidth:a4];

  return (HKStrokeStyle *)v8;
}

- (void)setStrokeColor:(id)a3
{
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (HKStrokeStyle)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKStrokeStyle;
  v2 = [(HKStrokeStyle *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_lineCap = 0x100000000;
    v2->_dashStyle = 0;
    v2->_blendMode = 0;
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    strokeColor = v3->_strokeColor;
    v3->_strokeColor = (UIColor *)v4;
  }
  return v3;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(UIColor *)self->_strokeColor copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  *(double *)(v4 + 32) = self->_lineWidth;
  *(_DWORD *)(v4 + 8) = self->_lineCap;
  *(_DWORD *)(v4 + 12) = self->_lineJoin;
  *(void *)(v4 + 40) = self->_dashStyle;
  *(_DWORD *)(v4 + 16) = self->_blendMode;
  return (id)v4;
}

- (void)applyToContext:(CGContext *)a3
{
}

- (void)applyToContext:(CGContext *)a3 dashPhase:(double)a4
{
  CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_strokeColor CGColor]);
  CGContextSetLineWidth(a3, self->_lineWidth);
  CGContextSetLineCap(a3, (CGLineCap)self->_lineCap);
  CGContextSetLineJoin(a3, (CGLineJoin)self->_lineJoin);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  unint64_t v7 = self->_dashStyle - 1;
  if (v7 <= 3)
  {
    v8 = (const CGFloat *)*(&off_1E6D56990 + v7);
    CGContextSetLineDash(a3, a4, v8, 2uLL);
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(int)a3
{
  self->_lineCap = a3;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(int)a3
{
  self->_lineJoin = a3;
}

- (int64_t)dashStyle
{
  return self->_dashStyle;
}

- (void)setDashStyle:(int64_t)a3
{
  self->_dashStyle = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

@end
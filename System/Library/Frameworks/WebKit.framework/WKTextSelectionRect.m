@interface WKTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (WKTextSelectionRect)initWithCGRect:(CGRect)a3;
- (WKTextSelectionRect)initWithSelectionGeometry:(const void *)a3 scaleFactor:(double)a4;
- (id).cxx_construct;
- (id)_customHandleInfo;
- (id)_path;
- (id)range;
- (int64_t)writingDirection;
@end

@implementation WKTextSelectionRect

- (WKTextSelectionRect)initWithCGRect:(CGRect)a3
{
  CGRect v15 = a3;
  __int16 v8 = 0;
  memset(v7, 0, sizeof(v7));
  memset(v10, 0, sizeof(v10));
  uint64_t v9 = 0;
  __int16 v11 = 1;
  int v12 = 0;
  char v13 = 0;
  char v14 = 0;
  v6.m_location = (IntPoint)WebCore::enclosingIntRect((WebCore *)&v15, (const CGRect *)a2);
  v6.m_size = v4;
  WebCore::SelectionGeometry::setRect((WebCore::SelectionGeometry *)v7, &v6);
  return [(WKTextSelectionRect *)self initWithSelectionGeometry:v7 scaleFactor:1.0];
}

- (WKTextSelectionRect)initWithSelectionGeometry:(const void *)a3 scaleFactor:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WKTextSelectionRect;
  result = [(WKTextSelectionRect *)&v11 init];
  if (result)
  {
    long long v7 = *((_OWORD *)a3 + 1);
    *(_OWORD *)&result->_selectionGeometry.m_quad.m_p1.m_x = *(_OWORD *)a3;
    *(_OWORD *)&result->_selectionGeometry.m_quad.m_p3.m_x = v7;
    long long v9 = *((_OWORD *)a3 + 3);
    $296A1C23873E8B44E77F8EDA7D3CA450 v8 = *(($296A1C23873E8B44E77F8EDA7D3CA450 *)a3 + 4);
    long long v10 = *((_OWORD *)a3 + 2);
    *(_DWORD *)&result->_selectionGeometry.m_cachedEnclosingRect.__engaged_ = *((_DWORD *)a3 + 20);
    *(_OWORD *)&result->_selectionGeometry.m_lineNumber = v9;
    result->_selectionGeometry.m_cachedEnclosingRect.var0 = v8;
    *(_OWORD *)&result->_selectionGeometry.m_behavior = v10;
    result->_scaleFactor = a4;
  }
  return result;
}

- (id)_path
{
  p_selectionGeometry = (float32x4_t *)&self->_selectionGeometry;
  if (!self->_selectionGeometry.m_behavior) {
    return 0;
  }
  int32x2_t v4 = (int32x2_t)WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)&self->_selectionGeometry);
  double scaleFactor = self->_scaleFactor;
  float v6 = scaleFactor;
  int32x2_t v7 = vneg_s32(v4);
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  float64x2_t v9 = vmulq_n_f64(vcvtq_f64_s64(v8), scaleFactor);
  float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v9);
  objc_super v11 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPath", vaddq_f32(vmulq_n_f32(*p_selectionGeometry, v6), v10), vaddq_f32(vmulq_n_f32(p_selectionGeometry[1], v6), v10));
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "moveToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v11, "addLineToPoint:");
  [v11 closePath];
  return v11;
}

- (int64_t)writingDirection
{
  return self->_selectionGeometry.m_direction;
}

- (id)range
{
  return 0;
}

- (id)_customHandleInfo
{
  if (!self->_selectionGeometry.m_behavior) {
    return 0;
  }
  long long v2 = *(_OWORD *)&self->_selectionGeometry.m_quad.m_p3.m_x;
  v4[0] = *(_OWORD *)&self->_selectionGeometry.m_quad.m_p1.m_x;
  v4[1] = v2;
  return (id)(id)CFMakeCollectable([[WKTextSelectionRectCustomHandleInfo alloc] initWithFloatQuad:v4 isHorizontal:self->_selectionGeometry.m_isHorizontal]);
}

- (CGRect)rect
{
  WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)&self->_selectionGeometry);
  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)containsStart
{
  return self->_selectionGeometry.m_containsStart;
}

- (BOOL)containsEnd
{
  return self->_selectionGeometry.m_containsEnd;
}

- (BOOL)isVertical
{
  return !self->_selectionGeometry.m_behavior && !self->_selectionGeometry.m_isHorizontal;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_WORD *)self + 28) = 0;
  *(void *)((char *)self + 68) = 0;
  *(void *)((char *)self + 60) = 0;
  *(void *)((char *)self + 73) = 0;
  *(_WORD *)((char *)self + 81) = 1;
  *((_DWORD *)self + 21) = 0;
  *((unsigned char *)self + 88) = 0;
  *((unsigned char *)self + 104) = 0;
  return self;
}

@end
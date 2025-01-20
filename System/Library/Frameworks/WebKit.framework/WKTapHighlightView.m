@interface WKTapHighlightView
- (WKTapHighlightView)initWithFrame:(CGRect)a3;
- (id).cxx_construct;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)cleanUp;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadii:(Radii *)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrames:(void *)a3;
- (void)setMinimumCornerRadius:(float)a3;
- (void)setQuads:(void *)a3 boundaryRect:(const FloatRect *)a4;
@end

@implementation WKTapHighlightView

- (WKTapHighlightView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKTapHighlightView;
  v3 = -[WKTapHighlightView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    objc_msgSend((id)-[WKTapHighlightView layer](v3, "layer"), "setNeedsDisplayOnBoundsChange:", 1);
  }
  return v4;
}

- (void)cleanUp
{
  WTF::Vector<WebCore::FloatRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_innerFrames, 0);

  WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_innerQuads, 0);
}

- (void)setColor:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_color.m_ptr;
  self->_color.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)setMinimumCornerRadius:(float)a3
{
  self->_minimumCornerRadius = a3;
}

- (void)setCornerRadii:(Radii *)a3
{
  long long v3 = *(_OWORD *)&a3->m_bottomLeft.m_width;
  *(_OWORD *)&self->_cornerRadii.m_topLeft.m_width = *(_OWORD *)&a3->m_topLeft.m_width;
  *(_OWORD *)&self->_cornerRadii.m_bottomLeft.m_width = v3;
}

- (void)setFrames:(void *)a3
{
  [(WKTapHighlightView *)self cleanUp];
  uint64_t v5 = *((unsigned int *)a3 + 3);
  if (v5)
  {
    long long v18 = 0uLL;
    goto LABEL_4;
  }
  -[WKTapHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = *((unsigned int *)a3 + 3);
  long long v18 = 0uLL;
  if (v5)
  {
LABEL_4:
    objc_super v6 = *(long long **)a3;
    uint64_t v7 = *(void *)a3 + 16 * v5;
    char v8 = 1;
    do
    {
      long long v17 = *v6;
      if (v8)
      {
        p_minimumCornerRadius = &self->_minimumCornerRadius;
        float32x2_t v10 = vld1_dup_f32(p_minimumCornerRadius);
        long long v18 = *v6;
        float32x2_t v11 = vsub_f32(*(float32x2_t *)&v18, v10);
        float32x2_t v12 = vadd_f32(v10, vadd_f32(v10, *(float32x2_t *)((char *)&v18 + 8)));
      }
      else
      {
        long long v19 = v18;
        WebCore::FloatRect::unite((WebCore::FloatRect *)&v19, (const WebCore::FloatRect *)&v17);
        float32x2_t v12 = *(float32x2_t *)((char *)&v19 + 8);
        float32x2_t v11 = (float32x2_t)v19;
      }
      char v8 = 0;
      *(float32x2_t *)&long long v18 = v11;
      *((float32x2_t *)&v18 + 1) = v12;
      ++v6;
    }
    while (v6 != (long long *)v7);
  }
  WebCore::FloatRect::operator CGRect();
  v16.receiver = self;
  v16.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v16, sel_setFrame_);
  WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)&self->_innerFrames, a3);
  uint64_t m_size = self->_innerFrames.m_size;
  if (m_size)
  {
    m_buffer = (float32x2_t *)self->_innerFrames.m_buffer;
    uint64_t v15 = 16 * m_size;
    do
    {
      float32x2_t *m_buffer = vsub_f32(*m_buffer, *(float32x2_t *)&v18);
      m_buffer += 2;
      v15 -= 16;
    }
    while (v15);
  }
  if (objc_msgSend((id)-[WKTapHighlightView layer](self, "layer"), "needsDisplayOnBoundsChange")) {
    [(WKTapHighlightView *)self setNeedsDisplay];
  }
}

- (void)setQuads:(void *)a3 boundaryRect:(const FloatRect *)a4
{
  [(WKTapHighlightView *)self cleanUp];
  uint64_t v8 = *((unsigned int *)a3 + 3);
  if (v8
    || (-[WKTapHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24)), uint64_t v8 = *((unsigned int *)a3 + 3), v8))
  {
    float32x2_t v10 = *(float32x4_t **)a3;
    uint64_t v11 = *(void *)a3 + 32 * v8;
    int v12 = 0;
    float32x2_t v13 = 0;
    float32x2_t v14 = 0;
    do
    {
      uint64_t v15 = 0;
      float32x4_t v9 = *v10;
      float32x4_t v16 = v10[1];
      v31[0] = *v10;
      v31[1] = v16;
      do
      {
        v9.i32[0] = 0;
        float32x2_t v17 = *(float32x2_t *)((char *)v31 + v15);
        v7.i32[0] = v12;
        *(int32x2_t *)v9.f32 = vdup_lane_s32(vceq_s32(v7, *(int32x2_t *)v9.f32), 0);
        float32x2_t v13 = (float32x2_t)vbsl_s8(*(int8x8_t *)v9.f32, (int8x8_t)v17, vbsl_s8((int8x8_t)vcgt_f32(v17, v13), (int8x8_t)v17, (int8x8_t)v13));
        int32x2_t v7 = vcgt_f32(v14, v17);
        float32x2_t v14 = (float32x2_t)vbsl_s8(*(int8x8_t *)v9.f32, (int8x8_t)v17, vbsl_s8((int8x8_t)v7, (int8x8_t)v17, (int8x8_t)v14));
        v15 += 8;
        int v12 = 1;
      }
      while (v15 != 32);
      v10 += 2;
    }
    while (v10 != (float32x4_t *)v11);
  }
  else
  {
    float32x2_t v13 = 0;
    float32x2_t v14 = 0;
  }
  float32x2_t v18 = vsub_f32(v13, v14);
  v9.f32[0] = self->_minimumCornerRadius * 4.0;
  *(float *)v31 = v14.f32[0] - v9.f32[0];
  *((float *)v31 + 1) = v14.f32[1] - v9.f32[0];
  float32x2_t v19 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.f32, 0);
  *((float32x2_t *)&v31[0] + 1) = vadd_f32(v19, vadd_f32(v18, v19));
  WebCore::FloatRect::intersect((WebCore::FloatRect *)v31, (const WebCore::FloatRect *)a4);
  WebCore::FloatRect::operator CGRect();
  v30.receiver = self;
  v30.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v30, sel_setFrame_);
  p_innerQuads = &self->_innerQuads;
  m_buffer = self->_innerQuads.m_buffer;
  if (m_buffer)
  {
    p_innerQuads->m_buffer = 0;
    self->_innerQuads.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, v20);
  }
  v23 = *(float32x4_t **)a3;
  *(void *)a3 = 0;
  p_innerQuads->m_buffer = (FloatQuad *)v23;
  unsigned int v24 = *((_DWORD *)a3 + 2);
  *((_DWORD *)a3 + 2) = 0;
  self->_innerQuads.m_capacity = v24;
  uint64_t v25 = *((unsigned int *)a3 + 3);
  *((_DWORD *)a3 + 3) = 0;
  self->_innerQuads.uint64_t m_size = v25;
  if (v25)
  {
    v26 = &v23[2 * v25];
    do
    {
      v27.i64[0] = *(void *)&v31[0];
      v27.i64[1] = *(void *)&v31[0];
      float32x4_t v28 = vsubq_f32(*v23, v27);
      float32x4_t v29 = vsubq_f32(v23[1], v27);
      float32x4_t *v23 = v28;
      v23[1] = v29;
      v23 += 2;
    }
    while (v23 != v26);
  }
  if (objc_msgSend((id)-[WKTapHighlightView layer](self, "layer"), "needsDisplayOnBoundsChange")) {
    [(WKTapHighlightView *)self setNeedsDisplay];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WKTapHighlightView *)self cleanUp];
  v8.receiver = self;
  v8.super_class = (Class)WKTapHighlightView;
  -[WKTapHighlightView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_innerFrames = &self->_innerFrames;
  if (self->_innerFrames.m_size || self->_innerQuads.m_size)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (p_innerFrames->m_size)
    {
      WebCore::PathUtilities::pathWithShrinkWrappedRects();
      objc_msgSend(v5, "appendPath:", objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithCGPath:", WebCore::Path::platformPath((WebCore::Path *)v17)));
      if (v19 != -1) {
        ((void (*)(char *, uint64_t *))off_1EE9D4490[v19])(&v16, &v18);
      }
    }
    else
    {
      p_innerQuads = &self->_innerQuads;
      uint64_t m_size = self->_innerQuads.m_size;
      if (m_size)
      {
        m_buffer = p_innerQuads->m_buffer;
        uint64_t v9 = (uint64_t)&p_innerQuads->m_buffer[m_size];
        do
        {
          float32x2_t v10 = (void *)[MEMORY[0x1E4F427D0] bezierPath];
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "moveToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          WebCore::FloatPoint::operator CGPoint();
          objc_msgSend(v10, "addLineToPoint:");
          [v10 closePath];
          [v5 appendPath:v10];
          ++m_buffer;
        }
        while (m_buffer != (FloatQuad *)v9);
      }
    }
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    if (self->_innerQuads.m_size) {
      CGContextSetLineWidth(CurrentContext, (float)(self->_minimumCornerRadius * 4.0));
    }
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    p_color = &self->_color;
    CGFloat Alpha = CGColorGetAlpha((CGColorRef)[p_color->m_ptr CGColor]);
    objc_msgSend((id)objc_msgSend(p_color->m_ptr, "colorWithAlphaComponent:", 1.0), "set");
    CGContextSetAlpha(CurrentContext, Alpha);
    CGContextBeginTransparencyLayer(CurrentContext, 0);
    CGContextAddPath(CurrentContext, (CGPathRef)[v5 CGPath]);
    CGContextDrawPath(CurrentContext, kCGPathFillStroke);
    CGContextEndTransparencyLayer(CurrentContext);
    CGContextRestoreGState(CurrentContext);
  }
  else
  {
    objc_msgSend(self->_color.m_ptr, "set", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    float32x2_t v14 = (void *)MEMORY[0x1E4F427D0];
    [(WKTapHighlightView *)self bounds];
    uint64_t v15 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:");
    [v15 fill];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  p_innerQuads = &self->_innerQuads;
  m_buffer = self->_innerQuads.m_buffer;
  if (m_buffer)
  {
    p_innerQuads->m_buffer = 0;
    p_innerQuads->m_capacitdouble y = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  uint64_t v5 = self->_innerFrames.m_buffer;
  if (v5)
  {
    self->_innerFrames.m_buffer = 0;
    self->_innerFrames.m_capacitdouble y = 0;
    WTF::fastFree((WTF *)v5, (void *)a2);
  }
  m_ptr = self->_color.m_ptr;
  self->_color.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *(_OWORD *)((char *)self + 420) = 0u;
  *(_OWORD *)((char *)self + 436) = 0u;
  *((void *)self + 57) = 0;
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  *((void *)self + 60) = 0;
  return self;
}

@end
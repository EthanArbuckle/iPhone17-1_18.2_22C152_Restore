@interface RETextLayer
- (EdgeInsets)edgeInsets;
- (__CFAttributedString)attributedString;
- (id).cxx_construct;
- (id)renderBlock;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setAttributedString:(__CFAttributedString *)a3;
- (void)setEdgeInsets:(EdgeInsets)a3;
- (void)setRenderBlock:(id)a3;
@end

@implementation RETextLayer

- (void)setAttributedString:(__CFAttributedString *)a3
{
  attributedString = self->_attributedString;
  if (attributedString != a3)
  {
    if (attributedString) {
      CFRelease(attributedString);
    }
    self->_attributedString = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setRenderBlock:(id)a3
{
  v4 = _Block_copy(a3);
  id renderBlock = self->_renderBlock;
  self->_id renderBlock = v4;
}

- (void)dealloc
{
  attributedString = self->_attributedString;
  if (attributedString) {
    CFRelease(attributedString);
  }
  v4.receiver = self;
  v4.super_class = (Class)RETextLayer;
  [(RETextLayer *)&v4 dealloc];
}

- (void)drawInContext:(CGContext *)a3
{
  [(RETextLayer *)self bounds];
  float top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double v10 = v9 + left;
  double v11 = v6 - left - self->_edgeInsets.right;
  double bottom = self->_edgeInsets.bottom;
  double v14 = v13 - bottom;
  double v15 = v14 - top;
  id renderBlock = self->_renderBlock;
  if (renderBlock)
  {
    double v17 = v5 + top;
    attributedString = self->_attributedString;
    uint64_t v19 = [(RETextLayer *)self backgroundColor];
    [(RETextLayer *)self bounds];
    v20.n128_u64[0] = v25.n128_u64[0];
    v21.n128_u64[0] = v26.n128_u64[0];
    v22 = (void (*)(void *, CGContext *, __CFAttributedString *, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))renderBlock[2];
    v23.n128_f64[0] = v10;
    v24.n128_f64[0] = v17;
    v25.n128_f64[0] = v11;
    v26.n128_f64[0] = v15;
    v22(renderBlock, a3, attributedString, v19, v23, v24, v25, v26, v20, v21);
  }
  else
  {
    v32.origin.y = v5 + bottom;
    v32.origin.x = v10;
    v32.size.width = v6 - left - self->_edgeInsets.right;
    v32.size.height = v14 - top;
    v27 = CGPathCreateWithRect(v32, 0);
    v28 = CTFramesetterCreateWithAttributedString(self->_attributedString);
    v31.length = CFAttributedStringGetLength(self->_attributedString);
    v31.location = 0;
    Frame = CTFramesetterCreateFrame(v28, v31, v27, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(v28);
    CGPathRelease(v27);
  }
}

- (__CFAttributedString)attributedString
{
  return self->_attributedString;
}

- (EdgeInsets)edgeInsets
{
  float top = self->_edgeInsets.top;
  float left = self->_edgeInsets.left;
  float bottom = self->_edgeInsets.bottom;
  float right = self->_edgeInsets.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
  return result;
}

- (void)setEdgeInsets:(EdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end
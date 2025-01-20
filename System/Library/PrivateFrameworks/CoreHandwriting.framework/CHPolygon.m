@interface CHPolygon
- (BOOL)containsPoint:(CGPoint)a3;
- (CGPoint)vertices;
- (CHPolygon)initWithRect:(CGRect)a3;
- (CHPolygon)initWithVertices:(CGPoint *)a3 vertexCount:(int64_t)a4;
- (double)area;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)polygonByIntersectingWithClipPolygon:(id)a3;
- (id)polygonDrawing;
- (int64_t)edgeCountIntersectingLineSegment:(CHLineSegment)a3;
- (int64_t)vertexCount;
- (void)dealloc;
- (void)enumerateEdgesWithBlock:(id)a3;
- (void)setArea:(double)a3;
@end

@implementation CHPolygon

- (CHPolygon)initWithVertices:(CGPoint *)a3 vertexCount:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CHPolygon;
  v6 = [(CHPolygon *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_vertexCount = a4;
    v6->_vertices = a3;
    Mutable = CGPathCreateMutable();
    v7->_path = Mutable;
    CGPathAddLines(Mutable, 0, a3, a4);
    CGPathCloseSubpath(v7->_path);
  }
  return v7;
}

- (CHPolygon)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = (CGFloat *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v22);
  CGFloat *v8 = MinX;
  v8[1] = MinY;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v11 = CGRectGetMinX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v24);
  v8[2] = v11;
  v8[3] = MaxY;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMaxY(v26);
  v8[4] = MaxX;
  v8[5] = v14;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v16 = CGRectGetMinY(v28);
  v8[6] = v15;
  v8[7] = v16;
  return (CHPolygon *)objc_msgSend_initWithVertices_vertexCount_(self, v17, (uint64_t)v8, 4, v18, v19);
}

- (void)dealloc
{
  vertices = self->_vertices;
  if (vertices)
  {
    free(vertices);
    self->_vertices = 0;
  }
  path = self->_path;
  if (path)
  {
    CGPathRelease(path);
    self->_path = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CHPolygon;
  [(CHPolygon *)&v5 dealloc];
}

- (id)description
{
  CGFloat v11 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  if (self->_vertexCount >= 1)
  {
    uint64_t v12 = 0;
    int64_t v13 = 0;
    do
    {
      CGFloat v14 = objc_msgSend_stringWithFormat_(NSString, v7, @"{%f, %f}", v8, v9, v10, *(void *)&self->_vertices[v12].x, *(void *)&self->_vertices[v12].y);
      uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v15, @"%@, ", v16, v17, v18, v14);
      objc_msgSend_appendString_(v11, v20, (uint64_t)v19, v21, v22, v23);

      ++v13;
      ++v12;
    }
    while (v13 < self->_vertexCount);
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (char *)malloc_type_calloc(self->_vertexCount, 0x10uLL, 0x1000040451B5BE8uLL);
  uint64_t v5 = (uint64_t)v4;
  if (self->_vertexCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      *(CGPoint *)&v4[v6 * 16] = self->_vertices[v6];
      ++v7;
      ++v6;
    }
    while (v7 < self->_vertexCount);
  }
  uint64_t v8 = [CHPolygon alloc];
  int64_t vertexCount = self->_vertexCount;
  return (id)objc_msgSend_initWithVertices_vertexCount_(v8, v9, v5, vertexCount, v10, v11);
}

- (double)area
{
  int64_t vertexCount = self->_vertexCount;
  if (vertexCount < 1) {
    return fabs(0.0) * 0.5;
  }
  vertices = self->_vertices;
  int64_t v4 = vertexCount - 1;
  if (vertexCount == 1)
  {
    unint64_t v5 = 0;
    float64x2_t v6 = 0uLL;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v5 = vertexCount & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v9 = (float64x2_t *)&vertices[1];
    float64x2_t v6 = 0uLL;
    do
    {
      if (v4 == v8) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v8 + 1;
      }
      uint64_t v11 = v8 + 2;
      if (vertexCount - 2 == v8) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v8 + 2;
      }
      float64x2_t v6 = vaddq_f64(vaddq_f64(v6, vmulq_f64((float64x2_t)vextq_s8((int8x16_t)vertices[v10], (int8x16_t)vertices[v10], 8uLL), v9[-1])), vmulq_f64((float64x2_t)vextq_s8((int8x16_t)vertices[v12], (int8x16_t)vertices[v12], 8uLL), *v9));
      v9 += 2;
      uint64_t v8 = v11;
    }
    while (v5 != v11);
    if (vertexCount == v5) {
      return fabs(vsubq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]) * 0.5;
    }
  }
  p_CGFloat y = &vertices[v5].y;
  do
  {
    if (v4 == v5) {
      unint64_t v14 = 0;
    }
    else {
      unint64_t v14 = v5 + 1;
    }
    unint64_t v15 = v5 + 1;
    v16.f64[0] = *(p_y - 1);
    p_CGFloat x = &vertices[v14].x;
    v18.f64[0] = p_x[1];
    v16.f64[1] = *p_x;
    v18.f64[1] = *p_y;
    float64x2_t v6 = vmlaq_f64(v6, v18, v16);
    p_y += 2;
    unint64_t v5 = v15;
  }
  while (vertexCount != v15);
  return fabs(vsubq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]) * 0.5;
}

- (id)polygonDrawing
{
  uint64_t v8 = objc_alloc_init(CHDrawing);
  if (self->_vertexCount >= 1)
  {
    uint64_t v9 = 0;
    int64_t v10 = 0;
    do
    {
      objc_msgSend_addPoint_(v8, v3, v4, v5, v6, v7, self->_vertices[v9].x, self->_vertices[v9].y);
      ++v10;
      ++v9;
    }
    while (v10 < self->_vertexCount);
  }
  objc_msgSend_addPoint_(v8, v3, v4, v5, v6, v7, self->_vertices->x, self->_vertices->y);
  objc_msgSend_endStroke(v8, v11, v12, v13, v14, v15);
  return v8;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  return CGPathContainsPoint(self->_path, 0, a3, 0);
}

- (id)polygonByIntersectingWithClipPolygon:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  self;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1C4B32868;
  float64x2_t v18 = sub_1C4B32878;
  uint64_t v6 = v4;
  uint64_t v19 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4B32880;
  v13[3] = &unk_1E64E3FD0;
  v13[4] = &v14;
  objc_msgSend_enumerateEdgesWithBlock_(v5, v7, (uint64_t)v13, v8, v9, v10);
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (int64_t)edgeCountIntersectingLineSegment:(CHLineSegment)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4B3247C;
  v8[3] = &unk_1E64E3FA8;
  CHLineSegment v9 = a3;
  v8[4] = &v10;
  objc_msgSend_enumerateEdgesWithBlock_(self, a2, (uint64_t)v8, v3, v4, v5);
  int64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)enumerateEdgesWithBlock:(id)a3
{
  CHLineSegment v9 = (void (**)(id, uint64_t, unsigned char *, double, double, double, double))a3;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  do
  {
    if (v11 >= objc_msgSend_vertexCount(self, v4, v5, v6, v7, v8)) {
      break;
    }
    uint64_t v17 = objc_msgSend_vertexCount(self, v12, v13, v14, v15, v16);
    uint64_t v23 = objc_msgSend_vertices(self, v18, v19, v20, v21, v22);
    double v24 = *(double *)(v23 + v10);
    double v25 = *(double *)(v23 + v10 + 8);
    v31 = (double *)(objc_msgSend_vertices(self, v26, v27, v28, v29, v30) + 16 * ((v11 + 1) % v17));
    double v32 = *v31;
    double v33 = v31[1];
    char v34 = 0;
    v9[2](v9, v11, &v34, v24, v25, v32, v33);
    v10 += 16;
    ++v11;
  }
  while (!v34);
}

- (void)setArea:(double)a3
{
  self->_area = a3;
}

- (int64_t)vertexCount
{
  return self->_vertexCount;
}

- (CGPoint)vertices
{
  return self->_vertices;
}

@end
@interface ARUIRingsGeometry
- (ARUIRingsGeometry)init;
- (float)endingRadian;
- (float)startingRadian;
- (unsigned)circleSegments;
- (unsigned)connectedIndiciesGeometry;
- (unsigned)disconnectedIndexCount;
- (unsigned)disconnectedIndiciesGeometry;
- (unsigned)indexCount;
- (unsigned)vertexCount;
- (void)enumerateVertexGeometryWithBlock:(id)a3;
- (void)setCircleSegments:(unsigned int)a3;
- (void)setEndingRadian:(float)a3;
- (void)setStartingRadian:(float)a3;
@end

@implementation ARUIRingsGeometry

- (void)setCircleSegments:(unsigned int)a3
{
  self->_circleSegments = a3;
}

- (ARUIRingsGeometry)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARUIRingsGeometry;
  result = [(ARUIRingsGeometry *)&v3 init];
  if (result) {
    *(void *)&result->_startingRadian = 0x40C90FDB00000000;
  }
  return result;
}

- (unsigned)vertexCount
{
  return 2 * [(ARUIRingsGeometry *)self circleSegments];
}

- (unsigned)indexCount
{
  return 6 * [(ARUIRingsGeometry *)self circleSegments];
}

- (void)enumerateVertexGeometryWithBlock:(id)a3
{
  v16 = (void (**)(id, uint64_t, uint64_t, float, float, float, float))a3;
  [(ARUIRingsGeometry *)self endingRadian];
  float v5 = v4;
  [(ARUIRingsGeometry *)self startingRadian];
  float v7 = v6;
  unsigned int v8 = [(ARUIRingsGeometry *)self circleSegments];
  if ([(ARUIRingsGeometry *)self circleSegments])
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    float v11 = (float)(v5 - v7) / (float)(v8 - 1);
    do
    {
      [(ARUIRingsGeometry *)self startingRadian];
      float v13 = v12 + (float)((float)v10 * v11);
      float v14 = v13 / 6.28318531;
      __float2 v15 = __sincosf_stret(v13);
      v16[2](v16, v10, v9, v13, v14, v15.__sinval, v15.__cosval);
      uint64_t v10 = (v10 + 1);
      uint64_t v9 = (v9 + 2);
    }
    while (v10 < [(ARUIRingsGeometry *)self circleSegments]);
  }
}

- (float)startingRadian
{
  return self->_startingRadian;
}

- (float)endingRadian
{
  return self->_endingRadian;
}

- (unsigned)connectedIndiciesGeometry
{
  objc_super v3 = (unsigned __int16 *)malloc_type_malloc(12 * [(ARUIRingsGeometry *)self circleSegments], 0x1235415CuLL);
  if ([(ARUIRingsGeometry *)self circleSegments])
  {
    int v4 = 0;
    unint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      v3[v4] = v6 - 1;
      v3[v4 + 1] = v6 % (2 * [(ARUIRingsGeometry *)self circleSegments]);
      v3[v4 + 2] = (v6 + 2) % (2 * [(ARUIRingsGeometry *)self circleSegments]);
      v3[v4 + 3] = v6 - 1;
      v3[v4 + 4] = (v6 + 1) % (2 * [(ARUIRingsGeometry *)self circleSegments]);
      v3[v4 + 5] = (v6 + 2) % (2 * [(ARUIRingsGeometry *)self circleSegments]);
      ++v5;
      v4 += 6;
      v6 += 2;
    }
    while (v5 < [(ARUIRingsGeometry *)self circleSegments]);
  }
  return v3;
}

- (unsigned)circleSegments
{
  return self->_circleSegments;
}

- (unsigned)disconnectedIndexCount
{
  return 6 * [(ARUIRingsGeometry *)self circleSegments] - 6;
}

- (unsigned)disconnectedIndiciesGeometry
{
  objc_super v3 = (unsigned __int16 *)malloc_type_malloc(2 * (6 * [(ARUIRingsGeometry *)self circleSegments] - 6), 0x6240062uLL);
  if ([(ARUIRingsGeometry *)self circleSegments])
  {
    int v4 = 0;
    unint64_t v5 = 0;
    do
    {
      v3[v4] = 2 * v5;
      v3[v4 + 1] = (2 * v5) | 1;
      v3[v4 + 2] = 2 * v5 + 3;
      v3[v4 + 3] = 2 * v5;
      v3[v4 + 4] = 2 * v5 + 2;
      v3[v4 + 5] = 2 * v5++ + 3;
      v4 += 6;
    }
    while (v5 < [(ARUIRingsGeometry *)self circleSegments]);
  }
  return v3;
}

- (void)setStartingRadian:(float)a3
{
  self->_startingRadian = a3;
}

- (void)setEndingRadian:(float)a3
{
  self->_endingRadian = a3;
}

@end
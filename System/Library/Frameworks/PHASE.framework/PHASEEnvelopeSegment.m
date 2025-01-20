@interface PHASEEnvelopeSegment
- (PHASECurveType)curveType;
- (PHASEEnvelopeSegment)init;
- (PHASEEnvelopeSegment)initWithEndPoint:(simd_double2)endPoint curveType:(PHASECurveType)curveType;
- (simd_double2)endPoint;
- (void)setCurveType:(PHASECurveType)curveType;
- (void)setEndPoint:(simd_double2)endPoint;
@end

@implementation PHASEEnvelopeSegment

- (PHASEEnvelopeSegment)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEEnvelopeSegment;
  result = [(PHASEEnvelopeSegment *)&v3 init];
  if (result)
  {
    *(void *)result->_endPoint = 0;
    *(void *)&result->_endPoint[8] = 0;
    result->_curveType = 1668435054;
  }
  return result;
}

- (PHASEEnvelopeSegment)initWithEndPoint:(simd_double2)endPoint curveType:(PHASECurveType)curveType
{
  v7.receiver = self;
  v7.super_class = (Class)PHASEEnvelopeSegment;
  result = [(PHASEEnvelopeSegment *)&v7 init];
  if (result)
  {
    *(simd_double2 *)result->_endPoint = endPoint;
    result->_curveType = curveType;
  }
  return result;
}

- (simd_double2)endPoint
{
  return *(simd_double2 *)self->_endPoint;
}

- (void)setEndPoint:(simd_double2)endPoint
{
  *(simd_double2 *)self->_endPoint = endPoint;
}

- (PHASECurveType)curveType
{
  return self->_curveType;
}

- (void)setCurveType:(PHASECurveType)curveType
{
  self->_curveType = curveType;
}

@end
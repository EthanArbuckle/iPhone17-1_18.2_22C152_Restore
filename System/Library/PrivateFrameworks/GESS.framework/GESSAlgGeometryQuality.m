@interface GESSAlgGeometryQuality
- (GESSMathAABB)AABB;
- (float)averageEdgeLength;
- (float)averageVertexValence;
- (float)edgeLengthStandardDeviation;
- (float)faceAngleStandardDeviation;
- (float)vertexValenceDeviation;
- (id).cxx_construct;
- (id)description;
- (void)setAABB:(id)a3;
- (void)setAverageEdgeLength:(float)a3;
- (void)setAverageVertexValence:(float)a3;
- (void)setEdgeLengthStandardDeviation:(float)a3;
- (void)setFaceAngleStandardDeviation:(float)a3;
- (void)setQualityImpl:(const void *)a3;
- (void)setVertexValenceDeviation:(float)a3;
@end

@implementation GESSAlgGeometryQuality

- (void)setQualityImpl:(const void *)a3
{
  long long v3 = *(_OWORD *)a3;
  self->_qualityImpl.faceAngleSD = *((float *)a3 + 4);
  *(_OWORD *)&self->_qualityImpl.avgEdgeLength = v3;
  *(_OWORD *)self[1]._anon_8 = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self[1]._qualityImpl.vertexValenceDeviation = *((_OWORD *)a3 + 3);
}

- (float)averageEdgeLength
{
  return self->_qualityImpl.avgEdgeLength;
}

- (void)setAverageEdgeLength:(float)a3
{
  self->_qualityImpl.avgEdgeLength = a3;
}

- (float)averageVertexValence
{
  return self->_qualityImpl.avgVertexValence;
}

- (void)setAverageVertexValence:(float)a3
{
  self->_qualityImpl.avgVertexValence = a3;
}

- (float)vertexValenceDeviation
{
  return self->_qualityImpl.vertexValenceDeviation;
}

- (void)setVertexValenceDeviation:(float)a3
{
  self->_qualityImpl.vertexValenceDeviation = a3;
}

- (float)edgeLengthStandardDeviation
{
  return self->_qualityImpl.edgeLengthSD;
}

- (void)setEdgeLengthStandardDeviation:(float)a3
{
  self->_qualityImpl.edgeLengthSD = a3;
}

- (float)faceAngleStandardDeviation
{
  return self->_qualityImpl.faceAngleSD;
}

- (void)setFaceAngleStandardDeviation:(float)a3
{
  self->_qualityImpl.faceAngleSD = a3;
}

- (GESSMathAABB)AABB
{
  long long v3 = objc_alloc_init(GESSMathAABB);
  [(GESSMathAABB *)v3 setBoxImpl:self[1]._anon_8];

  return v3;
}

- (void)setAABB:(id)a3
{
  v4 = (_OWORD *)[a3 boxImpl];
  *(_OWORD *)self[1]._anon_8 = *v4;
  *(_OWORD *)&self[1]._qualityImpl.vertexValenceDeviation = v4[1];
}

- (id)description
{
  v2 = NSString;
  cv3d::cv::gess::alg::GeometryQuality::Description(__p);
  if (v7 >= 0) {
    long long v3 = __p;
  }
  else {
    long long v3 = (void **)__p[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }

  return v4;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *(void *)&long long v2 = 0x80000000800000;
  *((void *)&v2 + 1) = 0x80000000800000;
  *((int32x4_t *)self + 3) = vdupq_n_s32(0x7F7FFFFFu);
  *((_OWORD *)self + 4) = v2;
  return self;
}

@end
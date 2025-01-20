@interface GESSAlgTopologyQuality
- (BOOL)equal:(id)a3;
- (id).cxx_construct;
- (id)description;
- (unsigned)numberOfBoundaryHalfEdges;
- (unsigned)numberOfBoundaryLoops;
- (unsigned)numberOfComponents;
- (unsigned)numberOfEdges;
- (unsigned)numberOfFaces;
- (unsigned)numberOfGenus;
- (unsigned)numberOfHalfEdges;
- (unsigned)numberOfVertices;
- (void)setNumberOfBoundaryHalfEdges:(unsigned int)a3;
- (void)setNumberOfBoundaryLoops:(unsigned int)a3;
- (void)setNumberOfComponents:(unsigned int)a3;
- (void)setNumberOfEdges:(unsigned int)a3;
- (void)setNumberOfFaces:(unsigned int)a3;
- (void)setNumberOfGenus:(unsigned int)a3;
- (void)setNumberOfHalfEdges:(unsigned int)a3;
- (void)setNumberOfVertices:(unsigned int)a3;
- (void)setQualityImpl:(const TopologyQuality *)a3;
@end

@implementation GESSAlgTopologyQuality

- (void)setQualityImpl:(const TopologyQuality *)a3
{
  long long v3 = *(_OWORD *)&a3->nVertices;
  *(_OWORD *)&self->_qualityImpl.nFaces = *(_OWORD *)&a3->nFaces;
  *(_OWORD *)&self->_qualityImpl.nVertices = v3;
}

- (unsigned)numberOfVertices
{
  return self->_qualityImpl.nVertices;
}

- (void)setNumberOfVertices:(unsigned int)a3
{
  self->_qualityImpl.nVertices = a3;
}

- (unsigned)numberOfHalfEdges
{
  return self->_qualityImpl.nHalfEdges;
}

- (void)setNumberOfHalfEdges:(unsigned int)a3
{
  self->_qualityImpl.nHalfEdges = a3;
}

- (unsigned)numberOfBoundaryHalfEdges
{
  return self->_qualityImpl.nBoundaryHalfEdges;
}

- (void)setNumberOfBoundaryHalfEdges:(unsigned int)a3
{
  self->_qualityImpl.nBoundaryHalfEdges = a3;
}

- (unsigned)numberOfEdges
{
  return self->_qualityImpl.nEdges;
}

- (void)setNumberOfEdges:(unsigned int)a3
{
  self->_qualityImpl.nEdges = a3;
}

- (unsigned)numberOfFaces
{
  return self->_qualityImpl.nFaces;
}

- (void)setNumberOfFaces:(unsigned int)a3
{
  self->_qualityImpl.nFaces = a3;
}

- (unsigned)numberOfBoundaryLoops
{
  return self->_qualityImpl.nBoundaryLoops;
}

- (void)setNumberOfBoundaryLoops:(unsigned int)a3
{
  self->_qualityImpl.nBoundaryLoops = a3;
}

- (unsigned)numberOfGenus
{
  return self->_qualityImpl.nGenus;
}

- (void)setNumberOfGenus:(unsigned int)a3
{
  self->_qualityImpl.nGenus = a3;
}

- (unsigned)numberOfComponents
{
  return self->_qualityImpl.nComponents;
}

- (void)setNumberOfComponents:(unsigned int)a3
{
  self->_qualityImpl.nComponents = a3;
}

- (BOOL)equal:(id)a3
{
  return cv3d::cv::gess::alg::operator==(&self->_qualityImpl.nVertices, (void *)a3 + 1);
}

- (id)description
{
  v2 = NSString;
  cv3d::cv::gess::alg::TopologyQuality::Description(__p);
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
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
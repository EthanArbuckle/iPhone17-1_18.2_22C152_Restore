@interface ARCV3DPlaneDetectionPlaneList
- (ARCV3DPlaneDetectionPlaneList)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3;
- (CV3DPlaneDetectionPlane)planeAtIndex:(unint64_t)a3;
- (CV3DPlaneDetectionPlaneList)cv3dPlaneDetections;
- (unint64_t)numberOfPlanes;
- (void)dealloc;
@end

@implementation ARCV3DPlaneDetectionPlaneList

- (ARCV3DPlaneDetectionPlaneList)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARCV3DPlaneDetectionPlaneList;
  v4 = [(ARCV3DPlaneDetectionPlaneList *)&v6 init];
  if (v4)
  {
    CV3DPlaneDetectionPlaneListRetain();
    v4->_cv3dPlaneDetections = a3;
  }
  return v4;
}

- (unint64_t)numberOfPlanes
{
  return CV3DPlaneDetectionPlaneListLength();
}

- (CV3DPlaneDetectionPlane)planeAtIndex:(unint64_t)a3
{
  return (CV3DPlaneDetectionPlane *)CV3DPlaneDetectionPlaneAtIndex();
}

- (void)dealloc
{
  CV3DPlaneDetectionPlaneListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARCV3DPlaneDetectionPlaneList;
  [(ARCV3DPlaneDetectionPlaneList *)&v3 dealloc];
}

- (CV3DPlaneDetectionPlaneList)cv3dPlaneDetections
{
  return self->_cv3dPlaneDetections;
}

@end
@interface ComputedFaceData
- (BOOL)hasLeftEyePosition;
- (BOOL)hasMouthPosition;
- (BOOL)hasRightEyePosition;
- (CGPoint)betweenTheEyes;
- (CGPoint)faceCenter;
- (CGPoint)leftEye;
- (CGPoint)leftIrisSeedPoints;
- (CGPoint)leftRightVec;
- (CGPoint)mouthCenter;
- (CGPoint)neckSeedPoints;
- (CGPoint)rightEye;
- (CGPoint)rightIrisSeedPoints;
- (CGPoint)skinSeedPoints;
- (CGPoint)teethSeedPoints;
- (CGRect)adjustmentRect;
- (CGRect)faceBounds;
- (CGRect)headRect;
- (CGRect)imageRect;
- (ComputedFaceData)init;
- (Rgon)skinSampleRgon;
- (double)iOD;
- (float)eyeTiltAngle;
- (float)faceOrientationIndex;
- (int)faceIndex;
- (int)skinSeedPointCount;
- (void)dealloc;
- (void)setAdjustmentRect:(CGRect)a3;
- (void)setBetweenTheEyes:(CGPoint)a3;
- (void)setEyeTiltAngle:(float)a3;
- (void)setFaceBounds:(CGRect)a3;
- (void)setFaceCenter:(CGPoint)a3;
- (void)setFaceIndex:(int)a3;
- (void)setFaceOrientationIndex:(float)a3;
- (void)setHasLeftEyePosition:(BOOL)a3;
- (void)setHasMouthPosition:(BOOL)a3;
- (void)setHasRightEyePosition:(BOOL)a3;
- (void)setHeadRect:(CGRect)a3;
- (void)setIOD:(double)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setLeftEye:(CGPoint)a3;
- (void)setLeftIrisSeedPoints:(CGPoint *)a3;
- (void)setLeftRightVec:(CGPoint)a3;
- (void)setMouthCenter:(CGPoint)a3;
- (void)setNeckSeedPoints:(CGPoint *)a3;
- (void)setRightEye:(CGPoint)a3;
- (void)setRightIrisSeedPoints:(CGPoint *)a3;
- (void)setSkinSampleRgon:(id)a3;
- (void)setSkinSeedPointCount:(int)a3;
- (void)setSkinSeedPoints:(CGPoint *)a3;
- (void)setTeethSeedPoints:(CGPoint *)a3;
@end

@implementation ComputedFaceData

- (ComputedFaceData)init
{
  v3.receiver = self;
  v3.super_class = (Class)ComputedFaceData;
  result = [(ComputedFaceData *)&v3 init];
  result->_skinSeedPoints = result->skinSeedPointArray;
  result->_teethSeedPoints = result->teethSeedPointArray;
  result->_leftIrisSeedPoints = result->leftIrisSeedPointArray;
  result->_rightIrisSeedPoints = result->rightIrisSeedPointArray;
  result->_neckSeedPoints = result->neckSeedPointArray;
  return result;
}

- (void)dealloc
{
  [(ComputedFaceData *)self setSkinSampleRgon:0];
  v3.receiver = self;
  v3.super_class = (Class)ComputedFaceData;
  [(ComputedFaceData *)&v3 dealloc];
}

- (CGRect)imageRect
{
  objc_copyStruct(v6, &self->_imageRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_imageRect, &v3, 32, 1, 0);
}

- (int)faceIndex
{
  return self->_faceIndex;
}

- (void)setFaceIndex:(int)a3
{
  self->_faceIndex = a3;
}

- (CGPoint)skinSeedPoints
{
  return self->_skinSeedPoints;
}

- (void)setSkinSeedPoints:(CGPoint *)a3
{
  self->_skinSeedPoints = a3;
}

- (int)skinSeedPointCount
{
  return self->_skinSeedPointCount;
}

- (void)setSkinSeedPointCount:(int)a3
{
  self->_skinSeedPointCount = a3;
}

- (CGPoint)teethSeedPoints
{
  return self->_teethSeedPoints;
}

- (void)setTeethSeedPoints:(CGPoint *)a3
{
  self->_teethSeedPoints = a3;
}

- (CGPoint)rightIrisSeedPoints
{
  return self->_rightIrisSeedPoints;
}

- (void)setRightIrisSeedPoints:(CGPoint *)a3
{
  self->_rightIrisSeedPoints = a3;
}

- (CGPoint)leftIrisSeedPoints
{
  return self->_leftIrisSeedPoints;
}

- (void)setLeftIrisSeedPoints:(CGPoint *)a3
{
  self->_leftIrisSeedPoints = a3;
}

- (CGPoint)neckSeedPoints
{
  return self->_neckSeedPoints;
}

- (void)setNeckSeedPoints:(CGPoint *)a3
{
  self->_neckSeedPoints = a3;
}

- (double)iOD
{
  return self->_iOD;
}

- (void)setIOD:(double)a3
{
  self->_iOD = a3;
}

- (CGRect)adjustmentRect
{
  objc_copyStruct(v6, &self->_adjustmentRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAdjustmentRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_adjustmentRect, &v3, 32, 1, 0);
}

- (CGRect)headRect
{
  objc_copyStruct(v6, &self->_headRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHeadRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_headRect, &v3, 32, 1, 0);
}

- (CGRect)faceBounds
{
  objc_copyStruct(v6, &self->_faceBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFaceBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_faceBounds, &v3, 32, 1, 0);
}

- (BOOL)hasLeftEyePosition
{
  return self->_hasLeftEyePosition;
}

- (void)setHasLeftEyePosition:(BOOL)a3
{
  self->_hasLeftEyePosition = a3;
}

- (BOOL)hasRightEyePosition
{
  return self->_hasRightEyePosition;
}

- (void)setHasRightEyePosition:(BOOL)a3
{
  self->_hasRightEyePosition = a3;
}

- (BOOL)hasMouthPosition
{
  return self->_hasMouthPosition;
}

- (void)setHasMouthPosition:(BOOL)a3
{
  self->_hasMouthPosition = a3;
}

- (CGPoint)leftEye
{
  objc_copyStruct(v4, &self->_leftEye, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftEye:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_leftEye, &v3, 16, 1, 0);
}

- (CGPoint)rightEye
{
  objc_copyStruct(v4, &self->_rightEye, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setRightEye:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_rightEye, &v3, 16, 1, 0);
}

- (CGPoint)betweenTheEyes
{
  objc_copyStruct(v4, &self->_betweenTheEyes, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setBetweenTheEyes:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_betweenTheEyes, &v3, 16, 1, 0);
}

- (CGPoint)mouthCenter
{
  objc_copyStruct(v4, &self->_mouthCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setMouthCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_mouthCenter, &v3, 16, 1, 0);
}

- (CGPoint)faceCenter
{
  objc_copyStruct(v4, &self->_faceCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFaceCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_faceCenter, &v3, 16, 1, 0);
}

- (CGPoint)leftRightVec
{
  objc_copyStruct(v4, &self->_leftRightVec, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftRightVec:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_leftRightVec, &v3, 16, 1, 0);
}

- (float)eyeTiltAngle
{
  return self->_eyeTiltAngle;
}

- (void)setEyeTiltAngle:(float)a3
{
  self->_eyeTiltAngle = a3;
}

- (Rgon)skinSampleRgon
{
  return self->_skinSampleRgon;
}

- (void)setSkinSampleRgon:(id)a3
{
}

- (float)faceOrientationIndex
{
  return self->_faceOrientationIndex;
}

- (void)setFaceOrientationIndex:(float)a3
{
  self->_faceOrientationIndex = a3;
}

@end
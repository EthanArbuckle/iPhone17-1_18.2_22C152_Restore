@interface CIBurstFaceStat
- (BOOL)foundByFaceCore;
- (BOOL)hasLeftEye;
- (BOOL)hasRightEye;
- (BOOL)hasRollAngle;
- (BOOL)hasYawAngle;
- (BOOL)isSyncedWithImage;
- (BOOL)leftEyeOpen;
- (BOOL)rightEyeOpen;
- (BOOL)smallFace;
- (BOOL)smiling;
- (CGRect)faceRect;
- (CGRect)hwFaceRect;
- (CGRect)leftEyeRect;
- (CGRect)normalizedFaceRect;
- (CGRect)rightEyeRect;
- (CIBurstFaceStat)initWithFaceStat:(id)a3;
- (NSMutableArray)FCRSmileAndBlinkFeatures;
- (double)timestamp;
- (float)faceScore;
- (float)focusScore;
- (float)leftEyeBlinkScore;
- (float)normalizedFocusScore;
- (float)normalizedSigma;
- (float)rightEyeBlinkScore;
- (float)rollAngle;
- (float)smileScore;
- (float)yawAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (int)FCRBlinkFeaturesSize;
- (int)FCRLeftEyeFeaturesOffset;
- (int)FCRRightEyeFeaturesOffset;
- (int)FCRSmileFeaturesOffset;
- (int)FCRSmileFeaturesSize;
- (int)faceId;
- (int)framesSinceLast;
- (int)hwFaceId;
- (void)setFCRBlinkFeaturesSize:(int)a3;
- (void)setFCRLeftEyeFeaturesOffset:(int)a3;
- (void)setFCRRightEyeFeaturesOffset:(int)a3;
- (void)setFCRSmileAndBlinkFeatures:(id)a3;
- (void)setFCRSmileFeaturesOffset:(int)a3;
- (void)setFCRSmileFeaturesSize:(int)a3;
- (void)setFaceId:(int)a3;
- (void)setFaceRect:(CGRect)a3;
- (void)setFaceScore:(float)a3;
- (void)setFocusScore:(float)a3;
- (void)setFoundByFaceCore:(BOOL)a3;
- (void)setFramesSinceLast:(int)a3;
- (void)setHasLeftEye:(BOOL)a3;
- (void)setHasRightEye:(BOOL)a3;
- (void)setHasRollAngle:(BOOL)a3;
- (void)setHasYawAngle:(BOOL)a3;
- (void)setHwFaceId:(int)a3;
- (void)setHwFaceRect:(CGRect)a3;
- (void)setIsSyncedWithImage:(BOOL)a3;
- (void)setLeftEyeBlinkScore:(float)a3;
- (void)setLeftEyeOpen:(BOOL)a3;
- (void)setLeftEyeRect:(CGRect)a3;
- (void)setNormalizedFaceRect:(CGRect)a3;
- (void)setNormalizedFocusScore:(float)a3;
- (void)setNormalizedSigma:(float)a3;
- (void)setRightEyeBlinkScore:(float)a3;
- (void)setRightEyeOpen:(BOOL)a3;
- (void)setRightEyeRect:(CGRect)a3;
- (void)setRollAngle:(float)a3;
- (void)setSmallFace:(BOOL)a3;
- (void)setSmileScore:(float)a3;
- (void)setSmiling:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setYawAngle:(float)a3;
@end

@implementation CIBurstFaceStat

- (CIBurstFaceStat)initWithFaceStat:(id)a3
{
  self->leftEyeOpen = [a3 leftEyeOpen];
  self->rightEyeOpen = [a3 rightEyeOpen];
  self->smiling = [a3 smiling];
  self->foundByFaceCore = [a3 foundByFaceCore];
  [a3 faceRect];
  self->faceRect.origin.x = v5;
  self->faceRect.origin.y = v6;
  self->faceRect.size.width = v7;
  self->faceRect.size.height = v8;
  [a3 normalizedFaceRect];
  self->normalizedFaceRect.origin.x = v9;
  self->normalizedFaceRect.origin.y = v10;
  self->normalizedFaceRect.size.width = v11;
  self->normalizedFaceRect.size.height = v12;
  [a3 normalizedSigma];
  self->normalizedSigma = v13;
  self->faceId = [a3 faceId];
  self->hwFaceId = [a3 hwFaceId];
  self->framesSinceLast = [a3 framesSinceLast];
  [a3 focusScore];
  self->focusScore = v14;
  [a3 normalizedFocusScore];
  self->normalizedFocusScore = v15;
  [a3 faceScore];
  self->faceScore = v16;
  self->hasLeftEye = [a3 hasLeftEye];
  self->hasRightEye = [a3 hasRightEye];
  [a3 leftEyeRect];
  self->leftEyeRect.origin.x = v17;
  self->leftEyeRect.origin.y = v18;
  self->leftEyeRect.size.width = v19;
  self->leftEyeRect.size.height = v20;
  [a3 rightEyeRect];
  self->rightEyeRect.origin.x = v21;
  self->rightEyeRect.origin.y = v22;
  self->rightEyeRect.size.width = v23;
  self->rightEyeRect.size.height = v24;
  [a3 timestamp];
  self->timestamp = v25;
  [a3 leftEyeBlinkScore];
  self->leftEyeBlinkScore = v26;
  [a3 rightEyeBlinkScore];
  self->rightEyeBlinkScore = v27;
  [a3 smileScore];
  self->smileScore = v28;
  self->smallFace = 0;
  self->FCRLeftEyeFeaturesOffset = [a3 FCRLeftEyeFeaturesOffset];
  self->FCRRightEyeFeaturesOffset = [a3 FCRRightEyeFeaturesOffset];
  self->FCRSmileFeaturesOffset = [a3 FCRSmileFeaturesOffset];
  self->FCRBlinkFeaturesSize = [a3 FCRBlinkFeaturesSize];
  self->FCRSmileFeaturesSize = [a3 FCRSmileFeaturesSize];
  self->FCRSmileAndBlinkFeatures = 0;
  [(CIBurstFaceStat *)self setIsSyncedWithImage:1];
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CIBurstFaceStat allocWithZone:a3];

  return [(CIBurstFaceStat *)v4 initWithFaceStat:self];
}

- (BOOL)leftEyeOpen
{
  return self->leftEyeOpen;
}

- (void)setLeftEyeOpen:(BOOL)a3
{
  self->leftEyeOpen = a3;
}

- (BOOL)rightEyeOpen
{
  return self->rightEyeOpen;
}

- (void)setRightEyeOpen:(BOOL)a3
{
  self->rightEyeOpen = a3;
}

- (BOOL)smiling
{
  return self->smiling;
}

- (void)setSmiling:(BOOL)a3
{
  self->smiling = a3;
}

- (BOOL)foundByFaceCore
{
  return self->foundByFaceCore;
}

- (void)setFoundByFaceCore:(BOOL)a3
{
  self->foundByFaceCore = a3;
}

- (CGRect)faceRect
{
  objc_copyStruct(v6, &self->faceRect, 32, 1, 0);
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

- (void)setFaceRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->faceRect, &v3, 32, 1, 0);
}

- (CGRect)normalizedFaceRect
{
  objc_copyStruct(v6, &self->normalizedFaceRect, 32, 1, 0);
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

- (void)setNormalizedFaceRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->normalizedFaceRect, &v3, 32, 1, 0);
}

- (float)normalizedSigma
{
  return self->normalizedSigma;
}

- (void)setNormalizedSigma:(float)a3
{
  self->normalizedSigma = a3;
}

- (int)faceId
{
  return self->faceId;
}

- (void)setFaceId:(int)a3
{
  self->faceId = a3;
}

- (int)hwFaceId
{
  return self->hwFaceId;
}

- (void)setHwFaceId:(int)a3
{
  self->hwFaceId = a3;
}

- (int)framesSinceLast
{
  return self->framesSinceLast;
}

- (void)setFramesSinceLast:(int)a3
{
  self->framesSinceLast = a3;
}

- (float)focusScore
{
  return self->focusScore;
}

- (void)setFocusScore:(float)a3
{
  self->focusScore = a3;
}

- (float)normalizedFocusScore
{
  return self->normalizedFocusScore;
}

- (void)setNormalizedFocusScore:(float)a3
{
  self->normalizedFocusScore = a3;
}

- (float)faceScore
{
  return self->faceScore;
}

- (void)setFaceScore:(float)a3
{
  self->faceScore = a3;
}

- (BOOL)hasLeftEye
{
  return self->hasLeftEye;
}

- (void)setHasLeftEye:(BOOL)a3
{
  self->hasLeftEye = a3;
}

- (BOOL)hasRightEye
{
  return self->hasRightEye;
}

- (void)setHasRightEye:(BOOL)a3
{
  self->hasRightEye = a3;
}

- (CGRect)leftEyeRect
{
  objc_copyStruct(v6, &self->leftEyeRect, 32, 1, 0);
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

- (void)setLeftEyeRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->leftEyeRect, &v3, 32, 1, 0);
}

- (CGRect)rightEyeRect
{
  objc_copyStruct(v6, &self->rightEyeRect, 32, 1, 0);
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

- (void)setRightEyeRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->rightEyeRect, &v3, 32, 1, 0);
}

- (float)leftEyeBlinkScore
{
  return self->leftEyeBlinkScore;
}

- (void)setLeftEyeBlinkScore:(float)a3
{
  self->leftEyeBlinkScore = a3;
}

- (float)rightEyeBlinkScore
{
  return self->rightEyeBlinkScore;
}

- (void)setRightEyeBlinkScore:(float)a3
{
  self->rightEyeBlinkScore = a3;
}

- (float)smileScore
{
  return self->smileScore;
}

- (void)setSmileScore:(float)a3
{
  self->smileScore = a3;
}

- (int)FCRLeftEyeFeaturesOffset
{
  return self->FCRLeftEyeFeaturesOffset;
}

- (void)setFCRLeftEyeFeaturesOffset:(int)a3
{
  self->FCRLeftEyeFeaturesOffset = a3;
}

- (int)FCRRightEyeFeaturesOffset
{
  return self->FCRRightEyeFeaturesOffset;
}

- (void)setFCRRightEyeFeaturesOffset:(int)a3
{
  self->FCRRightEyeFeaturesOffset = a3;
}

- (int)FCRSmileFeaturesOffset
{
  return self->FCRSmileFeaturesOffset;
}

- (void)setFCRSmileFeaturesOffset:(int)a3
{
  self->FCRSmileFeaturesOffset = a3;
}

- (int)FCRBlinkFeaturesSize
{
  return self->FCRBlinkFeaturesSize;
}

- (void)setFCRBlinkFeaturesSize:(int)a3
{
  self->FCRBlinkFeaturesSize = a3;
}

- (int)FCRSmileFeaturesSize
{
  return self->FCRSmileFeaturesSize;
}

- (void)setFCRSmileFeaturesSize:(int)a3
{
  self->FCRSmileFeaturesSize = a3;
}

- (NSMutableArray)FCRSmileAndBlinkFeatures
{
  return self->FCRSmileAndBlinkFeatures;
}

- (void)setFCRSmileAndBlinkFeatures:(id)a3
{
  self->FCRSmileAndBlinkFeatures = (NSMutableArray *)a3;
}

- (BOOL)hasRollAngle
{
  return self->hasRollAngle;
}

- (void)setHasRollAngle:(BOOL)a3
{
  self->hasRollAngle = a3;
}

- (BOOL)hasYawAngle
{
  return self->hasYawAngle;
}

- (void)setHasYawAngle:(BOOL)a3
{
  self->hasYawAngle = a3;
}

- (float)rollAngle
{
  return self->rollAngle;
}

- (void)setRollAngle:(float)a3
{
  self->rollAngle = a3;
}

- (float)yawAngle
{
  return self->yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->yawAngle = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (BOOL)smallFace
{
  return self->smallFace;
}

- (void)setSmallFace:(BOOL)a3
{
  self->smallFace = a3;
}

- (CGRect)hwFaceRect
{
  objc_copyStruct(v6, &self->_hwFaceRect, 32, 1, 0);
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

- (void)setHwFaceRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_hwFaceRect, &v3, 32, 1, 0);
}

- (BOOL)isSyncedWithImage
{
  return self->_isSyncedWithImage;
}

- (void)setIsSyncedWithImage:(BOOL)a3
{
  self->_isSyncedWithImage = a3;
}

@end
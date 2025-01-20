@interface BWFaceSegmentsWithLandmarksInferenceConfiguration
+ (id)configuration;
- (BOOL)detectFacesInFullSizeInput;
- (BOOL)includesInvalidContent;
- (BOOL)skipFaceLandmarkDetection;
- (BOOL)skipFoodAndDrinkDetection;
- (BOOL)skipSkinToneClassification;
- (BWFaceSegmentsWithLandmarksInferenceConfiguration)initWithInferenceType:(int)a3;
- (void)setDetectFacesInFullSizeInput:(BOOL)a3;
- (void)setIncludesInvalidContent:(BOOL)a3;
- (void)setSkipFaceLandmarkDetection:(BOOL)a3;
- (void)setSkipFoodAndDrinkDetection:(BOOL)a3;
- (void)setSkipSkinToneClassification:(BOOL)a3;
@end

@implementation BWFaceSegmentsWithLandmarksInferenceConfiguration

- (BOOL)includesInvalidContent
{
  return self->_skipFoodAndDrinkDetection;
}

- (BOOL)skipSkinToneClassification
{
  return self->_skipFaceLandmarkDetection;
}

- (BOOL)skipFaceLandmarkDetection
{
  return *((unsigned char *)&self->super._landmarksInferenceVersion + 7);
}

- (BOOL)skipFoodAndDrinkDetection
{
  return self->_detectFacesInFullSizeInput;
}

- (BOOL)detectFacesInFullSizeInput
{
  return *((unsigned char *)&self->super._landmarksInferenceVersion + 6);
}

- (void)setSkipFoodAndDrinkDetection:(BOOL)a3
{
  self->_detectFacesInFullSizeInput = a3;
}

- (void)setSkipFaceLandmarkDetection:(BOOL)a3
{
  *((unsigned char *)&self->super._landmarksInferenceVersion + 7) = a3;
}

- (void)setIncludesInvalidContent:(BOOL)a3
{
  self->_skipFoodAndDrinkDetection = a3;
}

- (void)setDetectFacesInFullSizeInput:(BOOL)a3
{
  *((unsigned char *)&self->super._landmarksInferenceVersion + 6) = a3;
}

- (BWFaceSegmentsWithLandmarksInferenceConfiguration)initWithInferenceType:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWFaceSegmentsWithLandmarksInferenceConfiguration;
  v3 = [(BWLandmarksInferenceConfiguration *)&v6 initWithInferenceType:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    v3->_detectFacesInFullSizeInput = 1;
    v3->_skipFoodAndDrinkDetection = 1;
    [(BWLandmarksInferenceConfiguration *)v3 setDetectsBlinking:0];
  }
  return v4;
}

+ (id)configuration
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInferenceType:802];
  return v2;
}

- (void)setSkipSkinToneClassification:(BOOL)a3
{
  self->_skipFaceLandmarkDetection = a3;
}

@end
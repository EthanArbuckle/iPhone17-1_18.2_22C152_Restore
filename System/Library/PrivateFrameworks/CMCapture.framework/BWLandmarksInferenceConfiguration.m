@interface BWLandmarksInferenceConfiguration
+ (BOOL)isPortraitPrewarmingRequired;
+ (id)configuration;
+ (unint64_t)portraitMaximumNumberOfFaces;
+ (void)initialize;
- ($2ACC23B9A21F50F5CC728381CA870116)landmarksInferenceVersion;
- (BOOL)alwaysExecuteForRedEyeReduction;
- (BOOL)clampToLargestMaximumNumberOfFaces;
- (BOOL)considerISPRectsIfVisionFails;
- (BOOL)detectLandmarksInFullSizeInput;
- (BOOL)detectsBlinking;
- (BOOL)refinesLeftEyeLandmarks;
- (BOOL)refinesMouthLandmarks;
- (BOOL)refinesRightEyeLandmarks;
- (BWLandmarksInferenceConfiguration)initWithInferenceType:(int)a3;
- (NSNumber)cascadeStepCount;
- (int)constellationPointCount;
- (unint64_t)maximumNumberOfFaces;
- (void)dealloc;
- (void)setAlwaysExecuteForRedEyeReduction:(BOOL)a3;
- (void)setCascadeStepCount:(id)a3;
- (void)setClampToLargestMaximumNumberOfFaces:(BOOL)a3;
- (void)setConsiderISPRectsIfVisionFails:(BOOL)a3;
- (void)setConstellationPointCount:(int)a3;
- (void)setDetectLandmarksInFullSizeInput:(BOOL)a3;
- (void)setDetectsBlinking:(BOOL)a3;
- (void)setLandmarksInferenceVersion:(id)a3;
- (void)setMaximumNumberOfFaces:(unint64_t)a3;
- (void)setRefinesLeftEyeLandmarks:(BOOL)a3;
- (void)setRefinesMouthLandmarks:(BOOL)a3;
- (void)setRefinesRightEyeLandmarks:(BOOL)a3;
@end

@implementation BWLandmarksInferenceConfiguration

- (unint64_t)maximumNumberOfFaces
{
  return self->_maximumNumberOfFaces;
}

- (BOOL)considerISPRectsIfVisionFails
{
  return self->_considerISPRectsIfVisionFails;
}

- (BOOL)clampToLargestMaximumNumberOfFaces
{
  return self->_clampToLargestMaximumNumberOfFaces;
}

- (BOOL)alwaysExecuteForRedEyeReduction
{
  return self->_alwaysExecuteForRedEyeReduction;
}

- (BOOL)refinesRightEyeLandmarks
{
  return self->_refinesRightEyeLandmarks;
}

- (BOOL)refinesMouthLandmarks
{
  return self->_refinesMouthLandmarks;
}

- (BOOL)refinesLeftEyeLandmarks
{
  return self->_refinesLeftEyeLandmarks;
}

- (BOOL)detectsBlinking
{
  return self->_detectsBlinking;
}

- (BOOL)detectLandmarksInFullSizeInput
{
  return self->_detectLandmarksInFullSizeInput;
}

- (int)constellationPointCount
{
  return self->_constellationPointCount;
}

- (NSNumber)cascadeStepCount
{
  return self->_cascadeStepCount;
}

- (void)setMaximumNumberOfFaces:(unint64_t)a3
{
  self->_maximumNumberOfFaces = a3;
}

- ($2ACC23B9A21F50F5CC728381CA870116)landmarksInferenceVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)&self->_landmarksInferenceVersion.major | ((unint64_t)self->_landmarksInferenceVersion.patch << 32));
}

+ (unint64_t)portraitMaximumNumberOfFaces
{
  if (gPortraitMaximumNumberOfFaces) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (id)configuration
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInferenceType:801];
  return v2;
}

- (BWLandmarksInferenceConfiguration)initWithInferenceType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)BWLandmarksInferenceConfiguration;
  v4 = -[BWInferenceConfiguration initWithInferenceType:](&v8, sel_initWithInferenceType_);
  v5 = v4;
  if (v4)
  {
    v4->_refinesMouthLandmarks = 0;
    v4->_refinesLeftEyeLandmarks = 0;
    v4->_refinesRightEyeLandmarks = 0;
    v4->_detectsBlinking = 1;
    v4->_cascadeStepCount = 0;
    v4->_maximumNumberOfFaces = 0;
    v4->_alwaysExecuteForRedEyeReduction = 0;
    v4->_detectLandmarksInFullSizeInput = 0;
    v4->_constellationPointCount = [+[FigCaptureCameraParameters sharedInstance] landmarksConstellationPointCountForInferenceType:v3];
    uint64_t v6 = (uint64_t)[+[FigCaptureCameraParameters sharedInstance] landmarksVersionForInferenceType:v3];
    *(_DWORD *)&v5->_landmarksInferenceVersion.major = v6;
    v5->_landmarksInferenceVersion.patch = WORD2(v6);
  }
  return v5;
}

- (void)setDetectLandmarksInFullSizeInput:(BOOL)a3
{
  self->_detectLandmarksInFullSizeInput = a3;
}

- (void)setConsiderISPRectsIfVisionFails:(BOOL)a3
{
  self->_considerISPRectsIfVisionFails = a3;
}

- (void)setClampToLargestMaximumNumberOfFaces:(BOOL)a3
{
  self->_clampToLargestMaximumNumberOfFaces = a3;
}

- (void)setAlwaysExecuteForRedEyeReduction:(BOOL)a3
{
  self->_alwaysExecuteForRedEyeReduction = a3;
}

- (void)setDetectsBlinking:(BOOL)a3
{
  self->_detectsBlinking = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    gPortraitMaximumNumberOfFaces = 1;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLandmarksInferenceConfiguration;
  [(BWVisionInferenceConfiguration *)&v3 dealloc];
}

+ (BOOL)isPortraitPrewarmingRequired
{
  return !+[BWInferenceEngine isNeuralEngineSupported];
}

- (void)setRefinesMouthLandmarks:(BOOL)a3
{
  self->_refinesMouthLandmarks = a3;
}

- (void)setRefinesLeftEyeLandmarks:(BOOL)a3
{
  self->_refinesLeftEyeLandmarks = a3;
}

- (void)setRefinesRightEyeLandmarks:(BOOL)a3
{
  self->_refinesRightEyeLandmarks = a3;
}

- (void)setCascadeStepCount:(id)a3
{
}

- (void)setConstellationPointCount:(int)a3
{
  self->_constellationPointCount = a3;
}

- (void)setLandmarksInferenceVersion:(id)a3
{
  self->_landmarksInferenceVersion = ($1D54FF943ED39CD641379A9C294BD6F7)a3;
}

@end
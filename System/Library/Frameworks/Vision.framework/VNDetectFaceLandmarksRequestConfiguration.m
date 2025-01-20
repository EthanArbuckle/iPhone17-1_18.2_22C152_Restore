@interface VNDetectFaceLandmarksRequestConfiguration
+ (BOOL)revision:(unint64_t)a3 supportsConstellation:(unint64_t)a4;
- (BOOL)performBlinkDetection;
- (BOOL)refineLeftEyeRegion;
- (BOOL)refineMouthRegion;
- (BOOL)refineRightEyeRegion;
- (NSNumber)cascadeStepCount;
- (VNDetectFaceLandmarksRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)constellation;
- (void)setCascadeStepCount:(id)a3;
- (void)setConstellation:(unint64_t)a3;
- (void)setPerformBlinkDetection:(BOOL)a3;
- (void)setRefineLeftEyeRegion:(BOOL)a3;
- (void)setRefineMouthRegion:(BOOL)a3;
- (void)setRefineRightEyeRegion:(BOOL)a3;
@end

@implementation VNDetectFaceLandmarksRequestConfiguration

- (VNDetectFaceLandmarksRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  v4 = v3;
  if (v3)
  {
    v3->_refineMouthRegion = 1;
    v3->_refineLeftEyeRegion = 1;
    v3->_refineRightEyeRegion = 1;
    v3->_performBlinkDetection = [(VNRequestConfiguration *)v3 resolvedRevision] != 3;
    v4->_constellation = 1;
    v5 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setRefineRightEyeRegion:(BOOL)a3
{
  self->_refineRightEyeRegion = a3;
}

- (void)setRefineMouthRegion:(BOOL)a3
{
  self->_refineMouthRegion = a3;
}

- (void)setCascadeStepCount:(id)a3
{
}

- (void)setPerformBlinkDetection:(BOOL)a3
{
  self->_performBlinkDetection = a3;
}

- (void)setRefineLeftEyeRegion:(BOOL)a3
{
  self->_refineLeftEyeRegion = a3;
}

- (BOOL)performBlinkDetection
{
  return self->_performBlinkDetection;
}

- (unint64_t)constellation
{
  return self->_constellation;
}

- (void)setConstellation:(unint64_t)a3
{
  self->_constellation = a3;
}

+ (BOOL)revision:(unint64_t)a3 supportsConstellation:(unint64_t)a4
{
  if (+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::onceToken != -1) {
    dispatch_once(&+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::onceToken, &__block_literal_global_14025);
  }
  v6 = *(void **)(+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
                  + 8);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = +[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
     + 8;
  do
  {
    unint64_t v8 = v6[4];
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      v10 = v6;
    }
    else {
      v10 = v6 + 1;
    }
    if (v9) {
      uint64_t v7 = (uint64_t)v6;
    }
    v6 = (void *)*v10;
  }
  while (*v10);
  if (v7 == +[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
           + 8
    || *(void *)(v7 + 32) > a3)
  {
    return 0;
  }
  v14 = *(void **)(v7 + 48);
  uint64_t v12 = v7 + 48;
  v13 = v14;
  if (!v14) {
    goto LABEL_26;
  }
  v15 = (void *)v12;
  do
  {
    unint64_t v16 = v13[4];
    BOOL v17 = v16 >= a4;
    if (v16 >= a4) {
      v18 = v13;
    }
    else {
      v18 = v13 + 1;
    }
    if (v17) {
      v15 = v13;
    }
    v13 = (void *)*v18;
  }
  while (*v18);
  if (v15 == (void *)v12 || v15[4] > a4) {
LABEL_26:
  }
    v15 = (void *)v12;
  return v15 != (void *)v12;
}

void __76__VNDetectFaceLandmarksRequestConfiguration_revision_supportsConstellation___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (NSNumber)cascadeStepCount
{
  return self->_cascadeStepCount;
}

- (BOOL)refineRightEyeRegion
{
  return self->_refineRightEyeRegion;
}

- (BOOL)refineLeftEyeRegion
{
  return self->_refineLeftEyeRegion;
}

- (BOOL)refineMouthRegion
{
  return self->_refineMouthRegion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setRefineMouthRegion:self->_refineMouthRegion];
    [v5 setRefineLeftEyeRegion:self->_refineLeftEyeRegion];
    [v5 setRefineRightEyeRegion:self->_refineRightEyeRegion];
    [v5 setPerformBlinkDetection:self->_performBlinkDetection];
    [v5 setCascadeStepCount:self->_cascadeStepCount];
    [v5 setConstellation:self->_constellation];
  }
  return v5;
}

@end
@interface BWTextLocalizationInferenceConfiguration
+ (id)configuration;
- ($2ACC23B9A21F50F5CC728381CA870116)version;
- (BWTextLocalizationInferenceConfiguration)initWithInferenceType:(int)a3 version:(id)a4;
- (void)setVersion:(id)a3;
@end

@implementation BWTextLocalizationInferenceConfiguration

- ($2ACC23B9A21F50F5CC728381CA870116)version
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)&self->_version.major | ((unint64_t)self->_version.patch << 32));
}

+ (id)configuration
{
  if (BWInferenceTextLocalizationCurrentVersion_onceToken != -1) {
    dispatch_once(&BWInferenceTextLocalizationCurrentVersion_onceToken, &__block_literal_global_90);
  }
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInferenceType:116 version:BWInferenceTextLocalizationCurrentVersion_version | ((unint64_t)(unsigned __int16)word_1E96B78CC << 32)];
  return v2;
}

- (BWTextLocalizationInferenceConfiguration)initWithInferenceType:(int)a3 version:(id)a4
{
  uint64_t v4 = *(void *)&a4.var0;
  v26.receiver = self;
  v26.super_class = (Class)BWTextLocalizationInferenceConfiguration;
  v5 = [(BWInferenceConfiguration *)&v26 initWithInferenceType:*(void *)&a3];
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_version.major = v4;
    v5->_version.patch = WORD2(v4);
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    float v7 = (float)(int)((unint64_t)FigCaptureMainScreenDimensions(1) >> 32) * 1.2;
    uint64_t v8 = (unsigned __int16)v4;
    int v9 = WORD1(v4);
    if (WORD1(v4)) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = (unsigned __int16)v4 == 1;
    }
    if (v10)
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.3, 0.09, 0.75);
      float v12 = 17.0;
      float v13 = 22.0;
      float v14 = *(float *)"ff&?";
    }
    else if (v8 == 1 && v9 == 2)
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.36, 0.16, 0.75);
      float v12 = 17.0;
      float v13 = 22.0;
      float v14 = *(float *)"333?cnpm";
    }
    else if (v8 == 1 && v9 == 5)
    {
      float v14 = 0.75;
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.3, 0.09, 0.75);
      float v12 = 17.0;
      float v13 = 22.0;
    }
    else
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.29, 0.09, 0.75);
      float v12 = 10.0;
      float v13 = 12.0;
      float v14 = 0.6;
    }
    LODWORD(v11) = 1045220557;
    [(BWBoundingBoxInferenceConfiguration *)v6 setTrackingThreshold:v11];
    *(float *)&double v15 = v14;
    [(BWBoundingBoxInferenceConfiguration *)v6 setMaxMatchCost:v15];
    v21[0] = v23;
    v21[1] = v24;
    uint64_t v22 = v25;
    [(BWBoundingBoxInferenceConfiguration *)v6 setConfidenceFilterSettings:v21];
    [(BWBoundingBoxInferenceConfiguration *)v6 setInteriorSuppression:v10];
    LODWORD(v16) = 1022739087;
    [(BWBoundingBoxInferenceConfiguration *)v6 setInteriorSuppressionPadding:v16];
    LODWORD(v17) = 1.0;
    [(BWBoundingBoxInferenceConfiguration *)v6 setAngularOffsetExponentialSmoothing:v17];
    *(float *)&double v18 = (float)(v13 / v7) * 100.0;
    [(BWBoundingBoxInferenceConfiguration *)v6 setFontSizeStartReportingThreshold:v18];
    *(float *)&double v19 = (float)(v12 / v7) * 100.0;
    [(BWBoundingBoxInferenceConfiguration *)v6 setFontSizeStopReportingThreshold:v19];
  }
  return v6;
}

- (void)setVersion:(id)a3
{
  self->_version = ($1D54FF943ED39CD641379A9C294BD6F7)a3;
}

@end
@interface FigCaptureVisionDataSinkConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration;
- (BOOL)featureBinningEnabled;
- (BOOL)featureOrientationAssignmentEnabled;
- (BOOL)isDynamicThresholdingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeatureMatchingEnabled;
- (FigCaptureVisionDataSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSData)laccConfigAndMetadata;
- (NSDictionary)embeddedCaptureDeviceConfiguration;
- (float)gaussianPyramidBaseOctaveDownscalingFactor;
- (float)keypointDetectionThreshold;
- (float)maxBurstFrameRate;
- (float)maxFrameRate;
- (float)orientationDistanceThreshold;
- (float)sigmaDistanceThreshold;
- (float)squareDistanceDisparityFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)featureMatchingDescriptorSize;
- (int)sinkType;
- (unint64_t)hammingDistanceThreshold;
- (unint64_t)subPixelThreshold;
- (unsigned)gaussianPyramidOctavesCount;
- (unsigned)keypointDetectionFlowType;
- (unsigned)maxKeypointsCount;
- (void)dealloc;
- (void)setDynamicThresholdingEnabled:(BOOL)a3;
- (void)setFeatureBinningEnabled:(BOOL)a3;
- (void)setFeatureMatchingDescriptorSize:(int)a3;
- (void)setFeatureMatchingEnabled:(BOOL)a3;
- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3;
- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3;
- (void)setGaussianPyramidOctavesCount:(unsigned int)a3;
- (void)setHammingDistanceThreshold:(unint64_t)a3;
- (void)setKeypointDetectionFlowType:(unsigned int)a3;
- (void)setKeypointDetectionThreshold:(float)a3;
- (void)setLaccConfigAndMetadata:(id)a3;
- (void)setMaxBurstDuration:(id *)a3;
- (void)setMaxBurstFrameRate:(float)a3;
- (void)setMaxFrameRate:(float)a3;
- (void)setMaxKeypointsCount:(unsigned int)a3;
- (void)setOrientationDistanceThreshold:(float)a3;
- (void)setSigmaDistanceThreshold:(float)a3;
- (void)setSquareDistanceDisparityFraction:(float)a3;
- (void)setSubPixelThreshold:(unint64_t)a3;
@end

@implementation FigCaptureVisionDataSinkConfiguration

- (FigCaptureVisionDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v15, sel_initWithXPCEncoding_);
  if (v4)
  {
    float v5 = xpc_dictionary_get_double(a3, "maxFrameRate");
    v4->_maxFrameRate = v5;
    float v6 = xpc_dictionary_get_double(a3, "maxBurstFrameRate");
    v4->_maxBurstFrameRate = v6;
    FigXPCMessageGetCMTime();
    v4->_gaussianPyramidOctavesCount = xpc_dictionary_get_uint64(a3, "gaussianPyramidOctavesCount");
    float v7 = xpc_dictionary_get_double(a3, "gaussianPyramidBaseOctaveDownscalingFactor");
    v4->_gaussianPyramidBaseOctaveDownscalingFactor = v7;
    v4->_maxKeypointsCount = xpc_dictionary_get_uint64(a3, "maxKeypointsCount");
    float v8 = xpc_dictionary_get_double(a3, "keypointDetectionThreshold");
    v4->_keypointDetectionThreshold = v8;
    v4->_featureBinningEnabled = xpc_dictionary_get_BOOL(a3, "featureBinningEnabled");
    v4->_featureOrientationAssignmentEnabled = xpc_dictionary_get_BOOL(a3, "featureOrientationAssignmentEnabled");
    v4->_dynamicThresholdingEnabled = xpc_dictionary_get_BOOL(a3, "dynamicThresholdingEnabled");
    v4->_keypointDetectionFlowType = xpc_dictionary_get_uint64(a3, "keypointDetectionFlowType");
    v4->_subPixelThreshold = xpc_dictionary_get_uint64(a3, "subPixelThreshold");
    v4->_featureMatchingEnabled = xpc_dictionary_get_BOOL(a3, "featureMatchingEnabled");
    v4->_featureMatchingDescriptorSize = xpc_dictionary_get_uint64(a3, "featureMatchingDescriptorSize");
    float v9 = xpc_dictionary_get_double(a3, "orientationDistanceThreshold");
    v4->_orientationDistanceThreshold = v9;
    float v10 = xpc_dictionary_get_double(a3, "sigmaDistanceThreshold");
    v4->_sigmaDistanceThreshold = v10;
    float v11 = xpc_dictionary_get_double(a3, "squareDistanceDisparityFraction");
    v4->_squareDistanceDisparityFraction = v11;
    v4->_hammingDistanceThreshold = xpc_dictionary_get_uint64(a3, "hammingDistanceThreshold");
    size_t length = 0;
    data = xpc_dictionary_get_data(a3, "laccConfigAndMetadata", &length);
    if (data) {
      v4->_laccConfigAndMetadata = (NSData *)(id)[MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    }
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v13.receiver = self;
  v13.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v13 copyXPCEncoding];
  [(FigCaptureVisionDataSinkConfiguration *)self maxFrameRate];
  xpc_dictionary_set_double(v3, "maxFrameRate", v4);
  [(FigCaptureVisionDataSinkConfiguration *)self maxBurstFrameRate];
  xpc_dictionary_set_double(v3, "maxBurstFrameRate", v5);
  if (self) {
    [(FigCaptureVisionDataSinkConfiguration *)self maxBurstDuration];
  }
  FigXPCMessageSetCMTime();
  xpc_dictionary_set_uint64(v3, "gaussianPyramidOctavesCount", [(FigCaptureVisionDataSinkConfiguration *)self gaussianPyramidOctavesCount]);
  [(FigCaptureVisionDataSinkConfiguration *)self gaussianPyramidBaseOctaveDownscalingFactor];
  xpc_dictionary_set_double(v3, "gaussianPyramidBaseOctaveDownscalingFactor", v6);
  xpc_dictionary_set_uint64(v3, "maxKeypointsCount", [(FigCaptureVisionDataSinkConfiguration *)self maxKeypointsCount]);
  [(FigCaptureVisionDataSinkConfiguration *)self keypointDetectionThreshold];
  xpc_dictionary_set_double(v3, "keypointDetectionThreshold", v7);
  xpc_dictionary_set_BOOL(v3, "featureBinningEnabled", [(FigCaptureVisionDataSinkConfiguration *)self featureBinningEnabled]);
  xpc_dictionary_set_BOOL(v3, "featureOrientationAssignmentEnabled", [(FigCaptureVisionDataSinkConfiguration *)self featureOrientationAssignmentEnabled]);
  xpc_dictionary_set_BOOL(v3, "dynamicThresholdingEnabled", [(FigCaptureVisionDataSinkConfiguration *)self isDynamicThresholdingEnabled]);
  xpc_dictionary_set_uint64(v3, "keypointDetectionFlowType", [(FigCaptureVisionDataSinkConfiguration *)self keypointDetectionFlowType]);
  xpc_dictionary_set_uint64(v3, "subPixelThreshold", [(FigCaptureVisionDataSinkConfiguration *)self subPixelThreshold]);
  xpc_dictionary_set_BOOL(v3, "featureMatchingEnabled", [(FigCaptureVisionDataSinkConfiguration *)self isFeatureMatchingEnabled]);
  xpc_dictionary_set_uint64(v3, "featureMatchingDescriptorSize", [(FigCaptureVisionDataSinkConfiguration *)self featureMatchingDescriptorSize]);
  [(FigCaptureVisionDataSinkConfiguration *)self orientationDistanceThreshold];
  xpc_dictionary_set_double(v3, "orientationDistanceThreshold", v8);
  [(FigCaptureVisionDataSinkConfiguration *)self sigmaDistanceThreshold];
  xpc_dictionary_set_double(v3, "sigmaDistanceThreshold", v9);
  [(FigCaptureVisionDataSinkConfiguration *)self squareDistanceDisparityFraction];
  xpc_dictionary_set_double(v3, "squareDistanceDisparityFraction", v10);
  xpc_dictionary_set_uint64(v3, "hammingDistanceThreshold", [(FigCaptureVisionDataSinkConfiguration *)self hammingDistanceThreshold]);
  laccConfigAndMetadata = self->_laccConfigAndMetadata;
  if (laccConfigAndMetadata) {
    xpc_dictionary_set_data(v3, "laccConfigAndMetadata", [(NSData *)laccConfigAndMetadata bytes], [(NSData *)self->_laccConfigAndMetadata length]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v30.receiver = self;
  v30.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v28 = [(FigCaptureSinkConfiguration *)&v30 description];
  [(FigCaptureVisionDataSinkConfiguration *)self maxFrameRate];
  double v5 = v4;
  [(FigCaptureVisionDataSinkConfiguration *)self maxBurstFrameRate];
  double v7 = v6;
  if (self) {
    [(FigCaptureVisionDataSinkConfiguration *)self maxBurstDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);
  uint64_t v27 = [(FigCaptureVisionDataSinkConfiguration *)self gaussianPyramidOctavesCount];
  [(FigCaptureVisionDataSinkConfiguration *)self gaussianPyramidBaseOctaveDownscalingFactor];
  double v10 = v9;
  uint64_t v11 = [(FigCaptureVisionDataSinkConfiguration *)self maxKeypointsCount];
  [(FigCaptureVisionDataSinkConfiguration *)self keypointDetectionThreshold];
  double v13 = v12;
  BOOL v14 = [(FigCaptureVisionDataSinkConfiguration *)self featureBinningEnabled];
  BOOL v15 = [(FigCaptureVisionDataSinkConfiguration *)self featureOrientationAssignmentEnabled];
  BOOL v16 = [(FigCaptureVisionDataSinkConfiguration *)self isDynamicThresholdingEnabled];
  uint64_t v17 = [(FigCaptureVisionDataSinkConfiguration *)self keypointDetectionFlowType];
  unint64_t v18 = [(FigCaptureVisionDataSinkConfiguration *)self subPixelThreshold];
  BOOL v19 = [(FigCaptureVisionDataSinkConfiguration *)self isFeatureMatchingEnabled];
  uint64_t v20 = [(FigCaptureVisionDataSinkConfiguration *)self featureMatchingDescriptorSize];
  [(FigCaptureVisionDataSinkConfiguration *)self orientationDistanceThreshold];
  double v22 = v21;
  [(FigCaptureVisionDataSinkConfiguration *)self sigmaDistanceThreshold];
  double v24 = v23;
  [(FigCaptureVisionDataSinkConfiguration *)self squareDistanceDisparityFraction];
  objc_msgSend(v3, "appendFormat:", @"%@ maxFPS:%.0f maxBurstFPS:%.0f maxBurstDur:%.3f octaves:%d downscaleBy:%.3f maxKeypoints:%d keypointDetectionThreshold:%.3f featureBinning:%d orientationAware:%d dynamicThresholding:%d keypointDetectionFlow:%d subPixelThreshold:%lu featureMatching:%d featureMatchingDescriptorSize:%d orientationDistanceThreshold:%f sigmaDistanceThreshold:%f squareDistanceDisparityThreshold:%f hammingDistanceThreshold:%lu", v28, *(void *)&v5, *(void *)&v7, *(void *)&Seconds, v27, *(void *)&v10, v11, *(void *)&v13, v14, v15, v16, v17, v18, v19, v20, *(void *)&v22,
    *(void *)&v24,
    v25,
    [(FigCaptureVisionDataSinkConfiguration *)self hammingDistanceThreshold]);
  if ([(FigCaptureVisionDataSinkConfiguration *)self laccConfigAndMetadata]) {
    [v3 appendFormat:@" LACCConfigAndMetadata:%@", -[FigCaptureVisionDataSinkConfiguration laccConfigAndMetadata](self, "laccConfigAndMetadata")];
  }
  return (id)[NSString stringWithString:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  id v5 = -[FigCaptureSinkConfiguration copyWithZone:](&v16, sel_copyWithZone_);
  *(float *)&double v6 = self->_maxFrameRate;
  [v5 setMaxFrameRate:v6];
  *(float *)&double v7 = self->_maxBurstFrameRate;
  [v5 setMaxBurstFrameRate:v7];
  $95D729B680665BEAEFA1D6FCA8238556 maxBurstDuration = self->_maxBurstDuration;
  [v5 setMaxBurstDuration:&maxBurstDuration];
  [v5 setGaussianPyramidOctavesCount:self->_gaussianPyramidOctavesCount];
  *(float *)&double v8 = self->_gaussianPyramidBaseOctaveDownscalingFactor;
  [v5 setGaussianPyramidBaseOctaveDownscalingFactor:v8];
  [v5 setMaxKeypointsCount:self->_maxKeypointsCount];
  *(float *)&double v9 = self->_keypointDetectionThreshold;
  [v5 setKeypointDetectionThreshold:v9];
  [v5 setFeatureBinningEnabled:self->_featureBinningEnabled];
  [v5 setFeatureOrientationAssignmentEnabled:self->_featureOrientationAssignmentEnabled];
  [v5 setDynamicThresholdingEnabled:self->_dynamicThresholdingEnabled];
  [v5 setKeypointDetectionFlowType:self->_keypointDetectionFlowType];
  [v5 setSubPixelThreshold:self->_subPixelThreshold];
  [v5 setFeatureMatchingEnabled:self->_featureMatchingEnabled];
  [v5 setFeatureMatchingDescriptorSize:self->_featureMatchingDescriptorSize];
  *(float *)&double v10 = self->_orientationDistanceThreshold;
  [v5 setOrientationDistanceThreshold:v10];
  *(float *)&double v11 = self->_sigmaDistanceThreshold;
  [v5 setSigmaDistanceThreshold:v11];
  *(float *)&double v12 = self->_squareDistanceDisparityFraction;
  [v5 setSquareDistanceDisparityFraction:v12];
  [v5 setHammingDistanceThreshold:self->_hammingDistanceThreshold];
  double v13 = (void *)[(NSData *)self->_laccConfigAndMetadata copyWithZone:a3];
  [v5 setLaccConfigAndMetadata:v13];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v7, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(v5) = -[NSDictionary isEqual:](-[FigCaptureVisionDataSinkConfiguration embeddedCaptureDeviceConfiguration](self, "embeddedCaptureDeviceConfiguration"), "isEqual:", [a3 embeddedCaptureDeviceConfiguration]);
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)sinkType
{
  return 13;
}

- (NSDictionary)embeddedCaptureDeviceConfiguration
{
  v20[18] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 maxBurstDuration = self->_maxBurstDuration;
  CFDictionaryRef v4 = CMTimeCopyAsDictionary((CMTime *)&maxBurstDuration, v3);
  unsigned int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v19[0] = *MEMORY[0x1E4F55528];
  *(float *)&double v6 = self->_maxFrameRate;
  v20[0] = [NSNumber numberWithFloat:v6];
  v19[1] = *MEMORY[0x1E4F55520];
  *(float *)&double v7 = self->_maxBurstFrameRate;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  uint64_t v9 = *MEMORY[0x1E4F55518];
  v20[1] = v8;
  v20[2] = v4;
  uint64_t v10 = *MEMORY[0x1E4F554F0];
  v19[2] = v9;
  v19[3] = v10;
  v20[3] = [NSNumber numberWithUnsignedInt:self->_gaussianPyramidOctavesCount];
  v19[4] = *MEMORY[0x1E4F554E8];
  *(float *)&double v11 = self->_gaussianPyramidBaseOctaveDownscalingFactor;
  v20[4] = [NSNumber numberWithFloat:v11];
  v19[5] = *MEMORY[0x1E4F55530];
  v20[5] = [NSNumber numberWithUnsignedInt:self->_maxKeypointsCount];
  v19[6] = *MEMORY[0x1E4F55508];
  *(float *)&double v12 = self->_keypointDetectionThreshold;
  v20[6] = [NSNumber numberWithFloat:v12];
  v19[7] = *MEMORY[0x1E4F554C8];
  v20[7] = [NSNumber numberWithBool:self->_featureBinningEnabled];
  v19[8] = *MEMORY[0x1E4F554E0];
  v20[8] = [NSNumber numberWithBool:self->_featureOrientationAssignmentEnabled];
  v19[9] = *MEMORY[0x1E4F554C0];
  v20[9] = [NSNumber numberWithBool:self->_dynamicThresholdingEnabled];
  v19[10] = *MEMORY[0x1E4F55500];
  v20[10] = [NSNumber numberWithUnsignedInt:self->_keypointDetectionFlowType];
  v19[11] = *MEMORY[0x1E4F55558];
  v20[11] = [NSNumber numberWithUnsignedInteger:self->_subPixelThreshold];
  v19[12] = *MEMORY[0x1E4F554D8];
  v20[12] = [NSNumber numberWithBool:self->_featureMatchingEnabled];
  v19[13] = *MEMORY[0x1E4F554D0];
  v20[13] = [NSNumber numberWithInt:self->_featureMatchingDescriptorSize];
  v19[14] = *MEMORY[0x1E4F55538];
  *(float *)&double v13 = self->_orientationDistanceThreshold;
  v20[14] = [NSNumber numberWithFloat:v13];
  v19[15] = *MEMORY[0x1E4F55548];
  *(float *)&double v14 = self->_sigmaDistanceThreshold;
  v20[15] = [NSNumber numberWithFloat:v14];
  v19[16] = *MEMORY[0x1E4F55550];
  *(float *)&double v15 = self->_squareDistanceDisparityFraction;
  v20[16] = [NSNumber numberWithFloat:v15];
  v19[17] = *MEMORY[0x1E4F554F8];
  v20[17] = [NSNumber numberWithUnsignedInteger:self->_hammingDistanceThreshold];
  objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 18));
  laccConfigAndMetadata = self->_laccConfigAndMetadata;
  if (laccConfigAndMetadata) {
    [v5 setObject:laccConfigAndMetadata forKeyedSubscript:*MEMORY[0x1E4F55510]];
  }
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
}

- (float)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(float)a3
{
  self->_maxFrameRate = a3;
}

- (float)maxBurstFrameRate
{
  return self->_maxBurstFrameRate;
}

- (void)setMaxBurstFrameRate:(float)a3
{
  self->_maxBurstFrameRate = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setMaxBurstDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_maxBurstDuration.value = *(_OWORD *)&a3->var0;
  self->_maxBurstDuration.epoch = var3;
}

- (unsigned)gaussianPyramidOctavesCount
{
  return self->_gaussianPyramidOctavesCount;
}

- (void)setGaussianPyramidOctavesCount:(unsigned int)a3
{
  self->_gaussianPyramidOctavesCount = a3;
}

- (float)gaussianPyramidBaseOctaveDownscalingFactor
{
  return self->_gaussianPyramidBaseOctaveDownscalingFactor;
}

- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3
{
  self->_gaussianPyramidBaseOctaveDownscalingFactor = a3;
}

- (unsigned)maxKeypointsCount
{
  return self->_maxKeypointsCount;
}

- (void)setMaxKeypointsCount:(unsigned int)a3
{
  self->_maxKeypointsCount = a3;
}

- (float)keypointDetectionThreshold
{
  return self->_keypointDetectionThreshold;
}

- (void)setKeypointDetectionThreshold:(float)a3
{
  self->_keypointDetectionThreshold = a3;
}

- (BOOL)featureBinningEnabled
{
  return self->_featureBinningEnabled;
}

- (void)setFeatureBinningEnabled:(BOOL)a3
{
  self->_featureBinningEnabled = a3;
}

- (BOOL)featureOrientationAssignmentEnabled
{
  return self->_featureOrientationAssignmentEnabled;
}

- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3
{
  self->_featureOrientationAssignmentEnabled = a3;
}

- (BOOL)isDynamicThresholdingEnabled
{
  return self->_dynamicThresholdingEnabled;
}

- (void)setDynamicThresholdingEnabled:(BOOL)a3
{
  self->_dynamicThresholdingEnabled = a3;
}

- (unsigned)keypointDetectionFlowType
{
  return self->_keypointDetectionFlowType;
}

- (void)setKeypointDetectionFlowType:(unsigned int)a3
{
  self->_keypointDetectionFlowType = a3;
}

- (unint64_t)subPixelThreshold
{
  return self->_subPixelThreshold;
}

- (void)setSubPixelThreshold:(unint64_t)a3
{
  self->_subPixelThreshold = a3;
}

- (BOOL)isFeatureMatchingEnabled
{
  return self->_featureMatchingEnabled;
}

- (void)setFeatureMatchingEnabled:(BOOL)a3
{
  self->_featureMatchingEnabled = a3;
}

- (int)featureMatchingDescriptorSize
{
  return self->_featureMatchingDescriptorSize;
}

- (void)setFeatureMatchingDescriptorSize:(int)a3
{
  self->_featureMatchingDescriptorSize = a3;
}

- (float)orientationDistanceThreshold
{
  return self->_orientationDistanceThreshold;
}

- (void)setOrientationDistanceThreshold:(float)a3
{
  self->_orientationDistanceThreshold = a3;
}

- (float)sigmaDistanceThreshold
{
  return self->_sigmaDistanceThreshold;
}

- (void)setSigmaDistanceThreshold:(float)a3
{
  self->_sigmaDistanceThreshold = a3;
}

- (float)squareDistanceDisparityFraction
{
  return self->_squareDistanceDisparityFraction;
}

- (void)setSquareDistanceDisparityFraction:(float)a3
{
  self->_squareDistanceDisparityFraction = a3;
}

- (unint64_t)hammingDistanceThreshold
{
  return self->_hammingDistanceThreshold;
}

- (void)setHammingDistanceThreshold:(unint64_t)a3
{
  self->_hammingDistanceThreshold = a3;
}

- (NSData)laccConfigAndMetadata
{
  return self->_laccConfigAndMetadata;
}

- (void)setLaccConfigAndMetadata:(id)a3
{
}

@end
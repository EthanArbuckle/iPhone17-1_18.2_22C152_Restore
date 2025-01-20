@interface VNFgBgE5MLInstanceSegmenterThresholds
- (VNFgBgE5MLInstanceSegmenterThresholds)initWithRevision:(unint64_t)a3 error:(id *)a4;
- (float)IoUThreshold;
- (float)cocoConfidenceThreshold;
- (float)defaultValidMinimumMaskPixelCount;
- (float)fillGapsAreaRatio;
- (float)maskThreshold;
- (float)matchScoreThreshold;
- (float)miyoshiConfidenceThreshold;
- (float)stabilityScoreThreshold;
- (float)validMinMaskRatio;
- (id)initDefaultConfigRevision1;
- (void)setCocoConfidenceThreshold:(float)a3;
- (void)setDefaultValidMinimumMaskPixelCount:(float)a3;
- (void)setFillGapsAreaRatio:(float)a3;
- (void)setIoUThreshold:(float)a3;
- (void)setMaskThreshold:(float)a3;
- (void)setMatchScoreThreshold:(float)a3;
- (void)setMiyoshiConfidenceThreshold:(float)a3;
- (void)setStabilityScoreThreshold:(float)a3;
- (void)setValidMinMaskRatio:(float)a3;
@end

@implementation VNFgBgE5MLInstanceSegmenterThresholds

- (void)setFillGapsAreaRatio:(float)a3
{
  self->_fillGapsAreaRatio = a3;
}

- (float)fillGapsAreaRatio
{
  return self->_fillGapsAreaRatio;
}

- (void)setDefaultValidMinimumMaskPixelCount:(float)a3
{
  self->_defaultValidMinimumMaskPixelCount = a3;
}

- (float)defaultValidMinimumMaskPixelCount
{
  return self->_defaultValidMinimumMaskPixelCount;
}

- (void)setValidMinMaskRatio:(float)a3
{
  self->_validMinMaskRatio = a3;
}

- (float)validMinMaskRatio
{
  return self->_validMinMaskRatio;
}

- (void)setMatchScoreThreshold:(float)a3
{
  self->_matchScoreThreshold = a3;
}

- (float)matchScoreThreshold
{
  return self->_matchScoreThreshold;
}

- (void)setStabilityScoreThreshold:(float)a3
{
  self->_stabilityScoreThreshold = a3;
}

- (float)stabilityScoreThreshold
{
  return self->_stabilityScoreThreshold;
}

- (void)setIoUThreshold:(float)a3
{
  self->_IoUThreshold = a3;
}

- (float)IoUThreshold
{
  return self->_IoUThreshold;
}

- (void)setMaskThreshold:(float)a3
{
  self->_maskThreshold = a3;
}

- (float)maskThreshold
{
  return self->_maskThreshold;
}

- (void)setMiyoshiConfidenceThreshold:(float)a3
{
  self->_miyoshiConfidenceThreshold = a3;
}

- (float)miyoshiConfidenceThreshold
{
  return self->_miyoshiConfidenceThreshold;
}

- (void)setCocoConfidenceThreshold:(float)a3
{
  self->_cocoConfidenceThreshold = a3;
}

- (float)cocoConfidenceThreshold
{
  return self->_cocoConfidenceThreshold;
}

- (id)initDefaultConfigRevision1
{
  v3.receiver = self;
  v3.super_class = (Class)VNFgBgE5MLInstanceSegmenterThresholds;
  id result = [(VNFgBgE5MLInstanceSegmenterThresholds *)&v3 init];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_1A410C4A0;
    *(_OWORD *)((char *)result + 24) = xmmword_1A410C4B0;
    *((_DWORD *)result + 10) = 981668463;
  }
  return result;
}

- (VNFgBgE5MLInstanceSegmenterThresholds)initWithRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = self;
  if (a3 == 1)
  {
    v4 = (VNFgBgE5MLInstanceSegmenterThresholds *)[(VNFgBgE5MLInstanceSegmenterThresholds *)self initDefaultConfigRevision1];
    v5 = v4;
  }
  else
  {
    v5 = (VNFgBgE5MLInstanceSegmenterThresholds *)a4;
    if (a4)
    {
      v6 = +[VNFgBgInstanceSegmenterError genericErrorConfigDescription];
      v5->super.isa = +[VNFgBgInstanceSegmenterError errorWithCode:-4 description:v6];

      v5 = 0;
    }
  }

  return v5;
}

@end
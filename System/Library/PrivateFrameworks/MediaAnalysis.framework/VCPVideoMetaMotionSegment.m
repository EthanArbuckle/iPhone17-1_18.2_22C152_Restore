@interface VCPVideoMetaMotionSegment
- (VCPVideoMetaMotionSegment)initWithAbsMotion:(float)a3 atTime:(id *)a4;
- (float)absMotion;
- (float)stabilityScore;
- (void)finalizeAtTime:(id *)a3;
- (void)mergeSegment:(id)a3;
- (void)resetSegment:(float)a3 atTime:(id *)a4;
- (void)setAbsMotion:(float)a3;
- (void)setStabilityScore:(float)a3;
- (void)updateSegment:(float)a3 atTime:(id *)a4;
@end

@implementation VCPVideoMetaMotionSegment

- (VCPVideoMetaMotionSegment)initWithAbsMotion:(float)a3 atTime:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaMotionSegment;
  v6 = [(VCPMetaSegment *)&v12 init];
  v7 = v6;
  if (v6)
  {
    long long v10 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(VCPVideoMetaMotionSegment *)v6 resetSegment:&v10 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v10), LODWORD(a3)))];
    v8 = v7;
  }

  return v7;
}

- (void)resetSegment:(float)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaMotionSegment;
  [(VCPMetaSegment *)&v6 resetSegment:&v7];
  self->_absMotion = a3;
  self->_stabilityScore = expf(a3 * -0.1);
}

- (void)updateSegment:(float)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaMotionSegment;
  [(VCPMetaSegment *)&v6 updateSegment:&v7];
  self->_absMotion = self->_absMotion + a3;
  self->_stabilityScore = expf(a3 * -0.1) + self->_stabilityScore;
}

- (void)finalizeAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoMetaMotionSegment;
  [(VCPMetaSegment *)&v5 finalizeAtTime:&v6];
  float v4 = self->_absMotion / (float)(int)[(VCPMetaSegment *)self numOfFrames];
  self->_absMotion = v4;
  self->_stabilityScore = expf(v4 * -0.1);
}

- (void)mergeSegment:(id)a3
{
  id v4 = a3;
  [v4 absMotion];
  float v6 = v5;
  unint64_t v7 = [v4 numOfFrames];
  float absMotion = self->_absMotion;
  unint64_t v9 = [(VCPMetaSegment *)self numOfFrames];
  uint64_t v10 = [v4 numOfFrames];
  float v11 = (float)((float)(absMotion * (float)v9) + (float)(v6 * (float)v7))
      / (float)([(VCPMetaSegment *)self numOfFrames] + v10);
  self->_float absMotion = v11;
  self->_stabilityScore = expf(v11 * -0.1);
  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaMotionSegment;
  [(VCPMetaSegment *)&v12 mergeSegment:v4];
}

- (float)absMotion
{
  return self->_absMotion;
}

- (void)setAbsMotion:(float)a3
{
  self->_float absMotion = a3;
}

- (float)stabilityScore
{
  return self->_stabilityScore;
}

- (void)setStabilityScore:(float)a3
{
  self->_stabilityScore = a3;
}

@end
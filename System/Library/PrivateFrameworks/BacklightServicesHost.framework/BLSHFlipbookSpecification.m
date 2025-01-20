@interface BLSHFlipbookSpecification
- (BLSHFlipbookSpecification)initWithFrameCapacity:(unint64_t)a3 framesPerSecond:(double)a4 minimumGapDuration:(double)a5 coaelscingEpsilon:(double)a6 minimumPrepareInterval:(double)a7 maximumRenderInterval:(double)a8;
- (BLSHFlipbookSpecification)initWithSoftMemoryLimit:(unint64_t)a3 frameCapacity:(int64_t)a4 framesPerSecond:(double)a5 minimumGapDuration:(double)a6 coaelscingEpsilon:(double)a7 minimumPrepareInterval:(double)a8 maximumRenderInterval:(double)a9;
- (double)coaelscingEpsilon;
- (double)framesPerSecond;
- (double)maximumRenderInterval;
- (double)minimumGapDuration;
- (double)minimumPrepareInterval;
- (id)description;
- (int64_t)frameCapacity;
- (unint64_t)softMemoryLimit;
@end

@implementation BLSHFlipbookSpecification

- (BLSHFlipbookSpecification)initWithSoftMemoryLimit:(unint64_t)a3 frameCapacity:(int64_t)a4 framesPerSecond:(double)a5 minimumGapDuration:(double)a6 coaelscingEpsilon:(double)a7 minimumPrepareInterval:(double)a8 maximumRenderInterval:(double)a9
{
  v17.receiver = self;
  v17.super_class = (Class)BLSHFlipbookSpecification;
  result = [(BLSHFlipbookSpecification *)&v17 init];
  if (result)
  {
    result->_softMemoryLimit = a3;
    result->_frameCapacity = a4;
    result->_framesPerSecond = a5;
    result->_minimumGapDuration = a6;
    result->_coaelscingEpsilon = a7;
    result->_minimumPrepareInterval = a8;
    result->_maximumRenderInterval = a9;
  }
  return result;
}

- (BLSHFlipbookSpecification)initWithFrameCapacity:(unint64_t)a3 framesPerSecond:(double)a4 minimumGapDuration:(double)a5 coaelscingEpsilon:(double)a6 minimumPrepareInterval:(double)a7 maximumRenderInterval:(double)a8
{
  return [(BLSHFlipbookSpecification *)self initWithSoftMemoryLimit:-1 frameCapacity:a3 framesPerSecond:a4 minimumGapDuration:a5 coaelscingEpsilon:a6 minimumPrepareInterval:a7 maximumRenderInterval:a8];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [MEMORY[0x263F29A70] sharedFormatter];
  v5 = [v4 stringFromByteCount:self->_softMemoryLimit];
  id v6 = (id)[v3 appendObject:v5 withName:@"softMemoryLimit"];

  id v7 = (id)[v3 appendUnsignedInteger:self->_frameCapacity withName:@"frameCapacity"];
  id v8 = (id)[v3 appendDouble:@"fps" withName:1 decimalPrecision:self->_framesPerSecond];
  id v9 = (id)[v3 appendTimeInterval:@"minGap" withName:1 decomposeUnits:self->_minimumGapDuration];
  id v10 = (id)[v3 appendTimeInterval:@"coaelscingEpsilon" withName:1 decomposeUnits:self->_coaelscingEpsilon];
  id v11 = (id)[v3 appendTimeInterval:@"minimumPrepareInterval" withName:1 decomposeUnits:self->_minimumPrepareInterval];
  id v12 = (id)[v3 appendTimeInterval:@"maximumRenderInterval" withName:1 decomposeUnits:self->_maximumRenderInterval];
  v13 = [v3 build];

  return v13;
}

- (unint64_t)softMemoryLimit
{
  return self->_softMemoryLimit;
}

- (int64_t)frameCapacity
{
  return self->_frameCapacity;
}

- (double)framesPerSecond
{
  return self->_framesPerSecond;
}

- (double)minimumGapDuration
{
  return self->_minimumGapDuration;
}

- (double)coaelscingEpsilon
{
  return self->_coaelscingEpsilon;
}

- (double)minimumPrepareInterval
{
  return self->_minimumPrepareInterval;
}

- (double)maximumRenderInterval
{
  return self->_maximumRenderInterval;
}

@end
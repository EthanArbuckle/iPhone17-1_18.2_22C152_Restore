@interface VCRateControlAlgorithmStabilizedNOWRD
- (BOOL)setUpVTable;
- (VCRateControlAlgorithmStabilizedNOWRD)init;
- (double)worstRecentRoundTripTime;
- (unsigned)worstRecentBurstLoss;
- (void)dealloc;
- (void)setLocalBandwidthEstimation:(unsigned int)a3;
@end

@implementation VCRateControlAlgorithmStabilizedNOWRD

- (VCRateControlAlgorithmStabilizedNOWRD)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  result = [(VCRateControlAlgorithmBase *)&v3 init];
  if (result)
  {
    result->super._state = 0;
    result->super._rampUpStatus = 0;
    result->super._rampDownStatus = 0;
    result->super._shouldConsiderCongestionLevelForBIF = 1;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  [(VCRateControlAlgorithmBase *)&v3 dealloc];
}

- (BOOL)setUpVTable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!self->super._vTable.configure) {
    self->super._vTable.configure = VCRateControlAlgorithmStabilizedNOWRDPriv_Configure;
  }
  if (!self->super._vTable.doRateControl) {
    self->super._vTable.doRateControl = _VCRateControlAlgorithmStabilizedNOWRD_DoRateControl;
  }
  if (!self->super._vTable.stateEnter) {
    self->super._vTable.stateEnter = _VCRateControlAlgorithmStabilizedNOWRD_StateEnter;
  }
  if (!self->super._vTable.stateExit) {
    self->super._vTable.stateExit = _VCRateControlAlgorithmStabilizedNOWRD_StateExit;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  return [(VCRateControlAlgorithmBase *)&v3 setUpVTable];
}

- (void)setLocalBandwidthEstimation:(unsigned int)a3
{
  self->super._localBandwidthEstimation = a3 / 0x3E8;
}

- (double)worstRecentRoundTripTime
{
  double result = self->super._worstRecentRoundTripTime;
  self->super._worstRecentRoundTripTime = 0.0;
  return result;
}

- (unsigned)worstRecentBurstLoss
{
  unsigned int worstRecentBurstLoss = self->super._worstRecentBurstLoss;
  self->super._unsigned int worstRecentBurstLoss = 0;
  return worstRecentBurstLoss;
}

@end
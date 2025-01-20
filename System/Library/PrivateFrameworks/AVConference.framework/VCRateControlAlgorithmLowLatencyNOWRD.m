@interface VCRateControlAlgorithmLowLatencyNOWRD
- (BOOL)setUpVTable;
- (VCRateControlAlgorithmLowLatencyNOWRD)init;
@end

@implementation VCRateControlAlgorithmLowLatencyNOWRD

- (VCRateControlAlgorithmLowLatencyNOWRD)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLowLatencyNOWRD;
  result = [(VCRateControlAlgorithmBase *)&v3 init];
  if (result)
  {
    result->super._state = 0;
    result->super._rampUpStatus = 0;
    result->super._rampDownStatus = 0;
  }
  return result;
}

- (BOOL)setUpVTable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!self->super._vTable.configure) {
    self->super._vTable.configure = VCRateControlAlgorithmLowLatencyNOWRDPriv_Configure;
  }
  if (!self->super._vTable.doRateControl) {
    self->super._vTable.doRateControl = _VCRateControlAlogirthmLowLatencyNOWRD_DoRateControl;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLowLatencyNOWRD;
  return [(VCRateControlAlgorithmBase *)&v3 setUpVTable];
}

@end
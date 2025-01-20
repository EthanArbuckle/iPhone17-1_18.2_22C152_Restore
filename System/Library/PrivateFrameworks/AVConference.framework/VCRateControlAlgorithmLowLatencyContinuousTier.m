@interface VCRateControlAlgorithmLowLatencyContinuousTier
- (BOOL)setUpVTable;
- (VCRateControlAlgorithmLowLatencyContinuousTier)init;
- (void)dealloc;
@end

@implementation VCRateControlAlgorithmLowLatencyContinuousTier

- (VCRateControlAlgorithmLowLatencyContinuousTier)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLowLatencyContinuousTier;
  result = [(VCRateControlAlgorithmLowLatencyNOWRD *)&v3 init];
  if (result) {
    result->super.super._state = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCRateControlAlgorithmLowLatencyContinuousTier;
  [(VCRateControlAlgorithmBase *)&v2 dealloc];
}

- (BOOL)setUpVTable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->super.super._vTable.configure = _VCRateControlAlgorithmLowLatencyContinuousTier_Configure;
  self->super.super._vTable.doRateControl = _VCRateControlAlgorithmLowLatencyContinuousTier_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLowLatencyContinuousTier;
  return [(VCRateControlAlgorithmLowLatencyNOWRD *)&v3 setUpVTable];
}

@end
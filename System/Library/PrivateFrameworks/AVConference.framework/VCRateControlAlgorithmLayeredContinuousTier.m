@interface VCRateControlAlgorithmLayeredContinuousTier
- (BOOL)setUpVTable;
- (VCRateControlAlgorithmLayeredContinuousTier)init;
- (void)dealloc;
@end

@implementation VCRateControlAlgorithmLayeredContinuousTier

- (VCRateControlAlgorithmLayeredContinuousTier)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  result = [(VCRateControlAlgorithmStabilizedNOWRD *)&v3 init];
  if (result)
  {
    result->super.super._state = 0;
    result->super.super._rampUpStatus = 0;
    result->super.super._rampDownStatus = 0;
    *(&result->super._abnormalNetworkDetected + 1) = 1;
    result->_congestionSeverity = 1.0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  [(VCRateControlAlgorithmStabilizedNOWRD *)&v2 dealloc];
}

- (BOOL)setUpVTable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->super.super._vTable.configure = _VCRateControlAlgorithmLayeredContinuousTier_Configure;
  self->super.super._vTable.doRateControl = _VCRateControlAlgorithmLayeredContinuousTier_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  return [(VCRateControlAlgorithmStabilizedNOWRD *)&v3 setUpVTable];
}

@end
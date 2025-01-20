@interface VCRateControlAlgorithmTelephony
- (BOOL)setUpVTable;
- (VCRateControlAlgorithmTelephony)init;
@end

@implementation VCRateControlAlgorithmTelephony

- (VCRateControlAlgorithmTelephony)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmTelephony;
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
  self->super._vTable.configure = _VCRateControlAlgorithmTelephony_Configure;
  self->super._vTable.doRateControl = _VCRateControlAlgorithmTelephony_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmTelephony;
  return [(VCRateControlAlgorithmBase *)&v3 setUpVTable];
}

@end
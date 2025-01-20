@interface _DPRandomizerUtils
+ (id)auditedDPParametersWithMetadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5;
@end

@implementation _DPRandomizerUtils

+ (id)auditedDPParametersWithMetadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5
{
  id v7 = a3;
  int IsV2 = _DPMetadataIsV2(v7);
  v9 = [_DPDPGaussianMechanismParameter alloc];
  if (IsV2) {
    uint64_t v10 = [(_DPDPGaussianMechanismParameter *)v9 initWithV2Metadata:v7 maxCentralEpsilon:a4 maxCentralDelta:a5];
  }
  else {
    uint64_t v10 = [(_DPDPGaussianMechanismParameter *)v9 initWithV1Metadata:v7 maxCentralEpsilon:a4 maxCentralDelta:a5];
  }
  v11 = (void *)v10;

  if (v11)
  {
    v12 = [v11 auditedMetadata];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
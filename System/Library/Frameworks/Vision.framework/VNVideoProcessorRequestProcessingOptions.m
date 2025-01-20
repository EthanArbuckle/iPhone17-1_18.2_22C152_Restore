@interface VNVideoProcessorRequestProcessingOptions
- (BOOL)isEqual:(id)a3;
- (VNVideoProcessorCadence)cadence;
- (id)_createVCPVideoProcessorRequestConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCadence:(VNVideoProcessorCadence *)cadence;
@end

@implementation VNVideoProcessorRequestProcessingOptions

- (void).cxx_destruct
{
}

- (void)setCadence:(VNVideoProcessorCadence *)cadence
{
}

- (VNVideoProcessorCadence)cadence
{
  return (VNVideoProcessorCadence *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = [(VNVideoProcessorRequestProcessingOptions *)self cadence];
    [v4 setCadence:v5];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNVideoProcessorRequestProcessingOptions *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VNVideoProcessorRequestProcessingOptions *)self cadence];
      v7 = [(VNVideoProcessorRequestProcessingOptions *)v5 cadence];

      char v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(VNVideoProcessorRequestProcessingOptions *)self cadence];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_createVCPVideoProcessorRequestConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VNVideoProcessorRequestProcessingOptions *)self cadence];
  [v4 populateVCPVideoProcessorRequestConfiguration:v3];

  return v3;
}

@end
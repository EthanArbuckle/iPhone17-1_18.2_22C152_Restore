@interface VNSmartCam5CompoundRequestGroupingConfiguration
- (BOOL)preferBackgroundProcessing;
- (VNSmartCam5CompoundRequestGroupingConfiguration)initWithImageCropAndScaleOption:(unint64_t)a3;
- (id)detectorConfigurationOptions;
- (id)originalRequests;
- (id)processingDevice;
- (unint64_t)imageCropAndScaleOption;
- (void)addOriginalRequest:(id)a3;
- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4;
@end

@implementation VNSmartCam5CompoundRequestGroupingConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);

  objc_storeStrong((id *)&self->_originalRequests, 0);
}

- (BOOL)preferBackgroundProcessing
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_originalRequests;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "preferBackgroundProcessing", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)processingDevice
{
  v2 = [(NSMutableSet *)self->_originalRequests anyObject];
  uint64_t v3 = [v2 processingDevice];

  return v3;
}

- (id)detectorConfigurationOptions
{
  v2 = (void *)[(NSMutableDictionary *)self->_detectorConfigurationOptions copy];

  return v2;
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
}

- (id)originalRequests
{
  return (id)[(NSMutableSet *)self->_originalRequests allObjects];
}

- (void)addOriginalRequest:(id)a3
{
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (VNSmartCam5CompoundRequestGroupingConfiguration)initWithImageCropAndScaleOption:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VNSmartCam5CompoundRequestGroupingConfiguration;
  uint64_t v4 = [(VNSmartCam5CompoundRequestGroupingConfiguration *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_imageCropAndScaleOption = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    originalRequests = v5->_originalRequests;
    v5->_originalRequests = v6;

    long long v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectorConfigurationOptions = v5->_detectorConfigurationOptions;
    v5->_detectorConfigurationOptions = v8;
  }
  return v5;
}

@end
@interface BWInferenceSimpleStorage
- (BWInferenceProviderStorage)inferenceStorage;
- (BWInferenceSimpleStorage)initWithRequirementsNeedingPools:(id)a3;
- (BWInferenceTextureStorage)textureStorage;
- (NSArray)requirementsNeedingPixelBufferPools;
- (NSArray)requirementsNeedingPixelBuffers;
- (NSDictionary)inferenceResults;
- (NSDictionary)inputSampleBufferAttachments;
- (__CVBuffer)pixelBufferForRequirement:(id)a3;
- (id)pixelBufferPoolForRequirement:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)setInputSampleBufferAttachments:(id)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3 forRequirement:(id)a4;
- (void)setPixelBufferPool:(id)a3 forRequirement:(id)a4;
@end

@implementation BWInferenceSimpleStorage

- (void)clear
{
  self->_inputSampleBufferAttachments = 0;
}

- (NSArray)requirementsNeedingPixelBufferPools
{
  return self->_requirementsNeedingPixelBufferPools;
}

- (BWInferenceSimpleStorage)initWithRequirementsNeedingPools:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceSimpleStorage;
  v4 = [(BWInferenceSimpleStorage *)&v6 init];
  if (v4)
  {
    v4->_pixelBufferByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_pixelBufferPoolByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_requirementsNeedingPixelBufferPools = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSimpleStorage;
  [(BWInferenceSimpleStorage *)&v3 dealloc];
}

- (NSArray)requirementsNeedingPixelBuffers
{
  return 0;
}

- (BWInferenceProviderStorage)inferenceStorage
{
  return 0;
}

- (BWInferenceTextureStorage)textureStorage
{
  return 0;
}

- (__CVBuffer)pixelBufferForRequirement:(id)a3
{
  return (__CVBuffer *)[(NSMutableDictionary *)self->_pixelBufferByRequirement objectForKeyedSubscript:a3];
}

- (void)setPixelBuffer:(__CVBuffer *)a3 forRequirement:(id)a4
{
  if (a3)
  {
    CFTypeID TypeID = CVPixelBufferGetTypeID();
    CFTypeID v8 = CFGetTypeID(a3);
    if (a4)
    {
      if (TypeID == v8)
      {
        pixelBufferByRequirement = self->_pixelBufferByRequirement;
        [(NSMutableDictionary *)pixelBufferByRequirement setObject:a3 forKeyedSubscript:a4];
      }
    }
  }
}

- (void)setPixelBufferPool:(id)a3 forRequirement:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelBufferPoolByRequirement, "setObject:forKeyedSubscript:");
    }
  }
}

- (NSDictionary)inferenceResults
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (id)pixelBufferPoolForRequirement:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pixelBufferPoolByRequirement objectForKeyedSubscript:a3];
}

- (NSDictionary)inputSampleBufferAttachments
{
  return self->_inputSampleBufferAttachments;
}

- (void)setInputSampleBufferAttachments:(id)a3
{
}

@end
@interface BWInferenceProviderStorage
+ (void)initialize;
- (BWInferenceProviderStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4;
- (BWInferenceTextureStorage)textureStorage;
- (NSArray)requirementsNeedingPixelBufferPools;
- (NSArray)requirementsNeedingPixelBuffers;
- (NSDictionary)inferenceResults;
- (NSDictionary)inputSampleBufferAttachments;
- (__CVBuffer)pixelBufferForRequirement:(id)a3;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (id)pixelBufferPoolForRequirement:(id)a3;
- (opaqueCMSampleBuffer)newSampleBufferSatisfyingCloneRequirement:(id)a3;
- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)clear;
- (void)dealloc;
- (void)setInferenceResults:(id)a3;
- (void)setInputSampleBufferAttachments:(id)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3 forRequirement:(id)a4;
- (void)setPixelBufferPool:(id)a3 forRequirement:(id)a4;
@end

@implementation BWInferenceProviderStorage

- (void)clear
{
  self->_inputSampleBufferAttachments = 0;
}

- (NSArray)requirementsNeedingPixelBufferPools
{
  return self->_requirementsNeedingPixelBufferPools;
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

- (BWInferenceProviderStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BWInferenceProviderStorage;
  v6 = [(BWInferenceProviderStorage *)&v10 init];
  if (v6)
  {
    v6->_requirementsNeedingPixelBuffers = (NSArray *)[a3 copy];
    uint64_t v7 = [a3 count];
    if (v7) {
      v6->_pixelBufferByRequirement = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v7];
    }
    v6->_requirementsNeedingPixelBufferPools = (NSArray *)[a4 copy];
    uint64_t v8 = [a4 count];
    if (v8) {
      v6->_pixelBufferPoolByRequirement = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
    }
  }
  return v6;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceProviderStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (BWInferenceTextureStorage)textureStorage
{
  return 0;
}

- (__CVBuffer)pixelBufferForRequirement:(id)a3
{
  return (__CVBuffer *)[(NSMutableDictionary *)self->_pixelBufferByRequirement objectForKeyedSubscript:a3];
}

- (id)pixelBufferPoolForRequirement:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pixelBufferPoolByRequirement objectForKeyedSubscript:a3];
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

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  CMSampleBufferRef v7 = 0;
  CFTypeRef cf = 0;
  v5 = [(BWInferenceProviderStorage *)self pixelBufferForRequirement:a3];
  if (v5)
  {
    BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a4, v5, 0, &cf, &v7);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v7;
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingCloneRequirement:(id)a3
{
  CFTypeRef v8 = 0;
  CMSampleBufferRef v7 = 0;
  objc_super v3 = -[BWInferenceProviderStorage pixelBufferForRequirement:](self, "pixelBufferForRequirement:", [a3 sourceVideoRequirement]);
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  BWSampleBufferCreateFromPixelBuffer(v3, (uint64_t)&v5, &v8, &v7);
  if (v8) {
    CFRelease(v8);
  }
  return v7;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  return 0;
}

- (NSArray)requirementsNeedingPixelBuffers
{
  return self->_requirementsNeedingPixelBuffers;
}

- (NSDictionary)inferenceResults
{
  return self->_inferenceResults;
}

- (void)setInferenceResults:(id)a3
{
}

- (NSDictionary)inputSampleBufferAttachments
{
  return self->_inputSampleBufferAttachments;
}

- (void)setInputSampleBufferAttachments:(id)a3
{
}

@end
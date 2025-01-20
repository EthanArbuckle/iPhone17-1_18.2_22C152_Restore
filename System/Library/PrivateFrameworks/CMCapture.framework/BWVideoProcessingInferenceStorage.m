@interface BWVideoProcessingInferenceStorage
- (BWVideoProcessingInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (void)dealloc;
- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4;
@end

@implementation BWVideoProcessingInferenceStorage

- (BWVideoProcessingInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BWVideoProcessingInferenceStorage;
  v4 = [(BWInferenceProviderStorage *)&v6 initWithRequirementsNeedingPixelBuffers:a3 requirementsNeedingPixelBufferPools:a4];
  if (v4) {
    v4->_metadataDictionaryForRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoProcessingInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4
{
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_metadataDictionaryForRequirement objectForKeyedSubscript:a3];
  return v3;
}

@end
@interface BWTiledInferenceStorage
- (BWTiledInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5;
- (NSArray)espressoStorages;
- (id)textureStorage;
- (void)clear;
- (void)dealloc;
@end

@implementation BWTiledInferenceStorage

- (BWTiledInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)BWTiledInferenceStorage;
  v6 = [(BWInferenceProviderStorage *)&v8 initWithRequirementsNeedingPixelBuffers:a3 requirementsNeedingPixelBufferPools:a4];
  v6->_espressoStorages = (NSArray *)a5;
  v6->_textureStorage = objc_alloc_init(BWInferenceSimpleTextureStorage);
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (id)textureStorage
{
  return self->_textureStorage;
}

- (void)clear
{
  [(BWInferenceSimpleTextureStorage *)self->_textureStorage clear];
  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 clear];
}

- (NSArray)espressoStorages
{
  return self->_espressoStorages;
}

@end
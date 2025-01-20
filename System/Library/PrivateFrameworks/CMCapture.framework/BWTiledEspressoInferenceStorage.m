@interface BWTiledEspressoInferenceStorage
- (BWTiledEspressoInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5;
- (NSArray)espressoStorages;
- (void)dealloc;
@end

@implementation BWTiledEspressoInferenceStorage

- (BWTiledEspressoInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)BWTiledEspressoInferenceStorage;
  v6 = [(BWInferenceProviderStorage *)&v8 initWithRequirementsNeedingPixelBuffers:a3 requirementsNeedingPixelBufferPools:a4];
  v6->_espressoStorages = (NSArray *)a5;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (NSArray)espressoStorages
{
  return self->_espressoStorages;
}

@end
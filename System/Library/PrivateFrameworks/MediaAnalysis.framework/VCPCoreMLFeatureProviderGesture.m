@interface VCPCoreMLFeatureProviderGesture
- (NSSet)featureNames;
- (VCPCoreMLFeatureProviderGesture)initWith:(id)a3 rotationInDegrees:(int)a4;
- (id)featureValueForName:(id)a3;
- (int)rotationInDegrees;
- (void)setRotationInDegrees:(int)a3;
@end

@implementation VCPCoreMLFeatureProviderGesture

- (VCPCoreMLFeatureProviderGesture)initWith:(id)a3 rotationInDegrees:(int)a4
{
  v6 = (VCPHandObservation *)a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPCoreMLFeatureProviderGesture;
  v7 = [(VCPCoreMLFeatureProviderGesture *)&v10 init];
  observation = v7->_observation;
  v7->_observation = v6;

  v7->_rotationInDegrees = a4;
  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE0D0];
}

- (id)featureValueForName:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F15EE0E8 dataType:65568 error:0];
  for (uint64_t i = 0; i != 21; ++i)
  {
    v6 = [(VCPHandObservation *)self->_observation keypoints];
    v7 = [v6 objectAtIndexedSubscript:i];
    [v7 location];
    transformLocation(v25, 0, self->_rotationInDegrees);
    double v9 = v8;
    double v11 = v10;

    id v12 = v4;
    uint64_t v13 = [v12 dataPointer];
    float v14 = v9;
    *(float *)(v13 + 4 * i) = v14;
    id v15 = v12;
    uint64_t v16 = [v15 dataPointer];
    float v17 = v11;
    *(float *)(v16 + 4 * i + 84) = v17;
    v18 = [(VCPHandObservation *)self->_observation keypoints];
    v19 = [v18 objectAtIndexedSubscript:i];
    [v19 confidence];
    LODWORD(v11) = v20;
    id v21 = v15;
    *(_DWORD *)([v21 dataPointer] + 4 * i + 168) = LODWORD(v11);
  }
  v22 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v21];

  return v22;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_rotationInDegrees = a3;
}

- (void).cxx_destruct
{
}

@end
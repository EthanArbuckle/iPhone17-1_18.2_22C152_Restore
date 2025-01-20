@interface VCPMAMLFeatureProvider
+ (id)featureProviderWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4;
- (NSSet)featureNames;
- (VCPMAMLFeatureProvider)init;
- (VCPMAMLFeatureProvider)initWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
@end

@implementation VCPMAMLFeatureProvider

- (VCPMAMLFeatureProvider)init
{
  return 0;
}

- (VCPMAMLFeatureProvider)initWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VCPMAMLFeatureProvider;
  v8 = [(VCPMAMLFeatureProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_featureName, a4);
    v9->_buffer = CVPixelBufferRetain(a3);
  }

  return v9;
}

+ (id)featureProviderWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4
{
  id v5 = a4;
  v6 = [[VCPMAMLFeatureProvider alloc] initWithCVPixelBuffer:a3 andFeatureName:v5];

  return v6;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)VCPMAMLFeatureProvider;
  [(VCPMAMLFeatureProvider *)&v3 dealloc];
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:self->_featureName];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:self->_featureName] && self->_buffer)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithPixelBuffer:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
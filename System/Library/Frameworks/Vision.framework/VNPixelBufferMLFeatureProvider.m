@interface VNPixelBufferMLFeatureProvider
- (NSSet)featureNames;
- (VNPixelBufferMLFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 originalFeatureProvider:(id)a5;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
@end

@implementation VNPixelBufferMLFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);

  objc_storeStrong((id *)&self->_imageInputKey, 0);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:self->_imageInputKey]) {
    [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_pixelBuffer];
  }
  else {
  v5 = [(MLFeatureProvider *)self->_originalFeatureProvider featureValueForName:v4];
  }

  return v5;
}

- (NSSet)featureNames
{
  v3 = [MEMORY[0x1E4F1CA80] setWithObject:self->_imageInputKey];
  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    v5 = [(MLFeatureProvider *)originalFeatureProvider featureNames];
    [v3 unionSet:v5];
  }

  return (NSSet *)v3;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  self->_pixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferMLFeatureProvider;
  [(VNPixelBufferMLFeatureProvider *)&v3 dealloc];
}

- (VNPixelBufferMLFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 originalFeatureProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VNPixelBufferMLFeatureProvider;
  v10 = [(VNPixelBufferMLFeatureProvider *)&v14 init];
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a3);
    uint64_t v11 = [v8 copy];
    imageInputKey = v10->_imageInputKey;
    v10->_imageInputKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_originalFeatureProvider, a5);
  }

  return v10;
}

@end
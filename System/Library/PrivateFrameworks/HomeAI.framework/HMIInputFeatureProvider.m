@interface HMIInputFeatureProvider
- (HMIInputFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 inputName:(id)a4;
- (NSSet)featureNames;
- (NSString)inputName;
- (__CVBuffer)pixelBuffer;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
@end

@implementation HMIInputFeatureProvider

- (HMIInputFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 inputName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMIInputFeatureProvider;
  v8 = [(HMIInputFeatureProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_pixelBuffer = a3;
    objc_storeStrong((id *)&v8->_inputName, a4);
    CVPixelBufferRetain(a3);
  }

  return v9;
}

- (void)dealloc
{
  CVPixelBufferRelease([(HMIInputFeatureProvider *)self pixelBuffer]);
  v3.receiver = self;
  v3.super_class = (Class)HMIInputFeatureProvider;
  [(HMIInputFeatureProvider *)&v3 dealloc];
}

- (NSSet)featureNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  objc_super v3 = [(HMIInputFeatureProvider *)self inputName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v5 = [(HMIInputFeatureProvider *)self inputName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x263F00D50], "featureValueWithPixelBuffer:", -[HMIInputFeatureProvider pixelBuffer](self, "pixelBuffer"));
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end
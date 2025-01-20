@interface MLCTensorOptimizerDeviceData
+ (id)optimizerDeviceData;
- (MLCTensorOptimizerDeviceData)init;
- (NSArray)centerWeightVectors;
- (NSArray)momentumVectors;
- (NSArray)velocityVectors;
- (NSData)gradientBNNSDesc;
- (NSData)sourceBNNSDesc;
- (NSMutableArray)momentumData;
- (NSMutableArray)momentumDataBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)gpuOps;
- (void)setCenterWeightVectors:(id)a3;
- (void)setGpuOps:(id)a3;
- (void)setGradientBNNSDesc:(id)a3;
- (void)setMomentumData:(id)a3;
- (void)setMomentumDataBytes:(id)a3;
- (void)setMomentumVectors:(id)a3;
- (void)setSourceBNNSDesc:(id)a3;
- (void)setVelocityVectors:(id)a3;
@end

@implementation MLCTensorOptimizerDeviceData

+ (id)optimizerDeviceData
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (MLCTensorOptimizerDeviceData)init
{
  v13.receiver = self;
  v13.super_class = (Class)MLCTensorOptimizerDeviceData;
  id v2 = [(MLCTensorOptimizerDeviceData *)&v13 init];
  v3 = v2;
  if (v2)
  {
    momentumVectors = v2->_momentumVectors;
    v2->_momentumVectors = 0;

    velocityVectors = v3->_velocityVectors;
    v3->_velocityVectors = 0;

    centerWeightVectors = v3->_centerWeightVectors;
    v3->_centerWeightVectors = 0;

    id gpuOps = v3->_gpuOps;
    v3->_id gpuOps = 0;

    momentumData = v3->_momentumData;
    v3->_momentumData = 0;

    momentumDataBytes = v3->_momentumDataBytes;
    v3->_momentumDataBytes = 0;

    sourceBNNSDesc = v3->_sourceBNNSDesc;
    v3->_sourceBNNSDesc = 0;

    gradientBNNSDesc = v3->_gradientBNNSDesc;
    v3->_gradientBNNSDesc = 0;
  }
  return v3;
}

- (id)description
{
  id v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (NSArray)momentumVectors
{
  return self->_momentumVectors;
}

- (void)setMomentumVectors:(id)a3
{
}

- (NSArray)velocityVectors
{
  return self->_velocityVectors;
}

- (void)setVelocityVectors:(id)a3
{
}

- (NSArray)centerWeightVectors
{
  return self->_centerWeightVectors;
}

- (void)setCenterWeightVectors:(id)a3
{
}

- (id)gpuOps
{
  return self->_gpuOps;
}

- (void)setGpuOps:(id)a3
{
}

- (NSMutableArray)momentumData
{
  return self->_momentumData;
}

- (void)setMomentumData:(id)a3
{
}

- (NSMutableArray)momentumDataBytes
{
  return self->_momentumDataBytes;
}

- (void)setMomentumDataBytes:(id)a3
{
}

- (NSData)sourceBNNSDesc
{
  return self->_sourceBNNSDesc;
}

- (void)setSourceBNNSDesc:(id)a3
{
}

- (NSData)gradientBNNSDesc
{
  return self->_gradientBNNSDesc;
}

- (void)setGradientBNNSDesc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientBNNSDesc, 0);
  objc_storeStrong((id *)&self->_sourceBNNSDesc, 0);
  objc_storeStrong((id *)&self->_momentumDataBytes, 0);
  objc_storeStrong((id *)&self->_momentumData, 0);
  objc_storeStrong(&self->_gpuOps, 0);
  objc_storeStrong((id *)&self->_centerWeightVectors, 0);
  objc_storeStrong((id *)&self->_velocityVectors, 0);

  objc_storeStrong((id *)&self->_momentumVectors, 0);
}

@end
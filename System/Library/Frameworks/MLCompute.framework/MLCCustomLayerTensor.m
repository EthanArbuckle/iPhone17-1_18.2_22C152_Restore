@interface MLCCustomLayerTensor
+ (id)customLayerTensorWithDescriptor:(id)a3 cpuBuffer:(id)a4;
+ (id)customLayerTensorWithDescriptor:(id)a3 gpuBuffer:(id)a4;
- (MLCCustomLayerTensor)initWithTensorDescriptor:(id)a3 cpuBuffer:(id)a4 gpuBuffer:(id)a5;
- (MLCTensorData)hostData;
- (MLCTensorDescriptor)descriptor;
- (NSData)cpuBuffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)gpuBuffer;
- (void)setCpuBuffer:(id)a3;
- (void)setGpuBuffer:(id)a3;
@end

@implementation MLCCustomLayerTensor

+ (id)customLayerTensorWithDescriptor:(id)a3 gpuBuffer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTensorDescriptor:v7 cpuBuffer:0 gpuBuffer:v6];

  return v8;
}

+ (id)customLayerTensorWithDescriptor:(id)a3 cpuBuffer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTensorDescriptor:v7 cpuBuffer:v6 gpuBuffer:0];

  return v8;
}

- (MLCCustomLayerTensor)initWithTensorDescriptor:(id)a3 cpuBuffer:(id)a4 gpuBuffer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLCCustomLayerTensor;
  v12 = [(MLCCustomLayerTensor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_descriptor, a3);
    objc_storeStrong((id *)&v13->_cpuBuffer, a4);
    objc_storeStrong(&v13->_gpuBuffer, a5);
  }

  return v13;
}

- (MLCTensorData)hostData
{
  id v3 = [(MLCCustomLayerTensor *)self cpuBuffer];
  uint64_t v4 = [v3 bytes];
  v5 = [(MLCCustomLayerTensor *)self cpuBuffer];
  id v6 = +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", v4, [v5 length]);

  return (MLCTensorData *)v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCCustomLayerTensor *)self descriptor];
  id v7 = [(MLCCustomLayerTensor *)self cpuBuffer];
  uint64_t v8 = [v7 bytes];
  id v9 = [(MLCCustomLayerTensor *)self gpuBuffer];
  id v10 = [v3 stringWithFormat:@"%@: { tensorDescriptor=%@ : cpuBuffer=%@ : gpuBuffer=%@}", v5, v6, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MLCCustomLayerTensor *)self descriptor];
  id v6 = [(MLCCustomLayerTensor *)self cpuBuffer];
  id v7 = [(MLCCustomLayerTensor *)self gpuBuffer];
  uint64_t v8 = (void *)[v4 initWithTensorDescriptor:v5 cpuBuffer:v6 gpuBuffer:v7];

  return v8;
}

- (MLCTensorDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSData)cpuBuffer
{
  return self->_cpuBuffer;
}

- (void)setCpuBuffer:(id)a3
{
}

- (id)gpuBuffer
{
  return self->_gpuBuffer;
}

- (void)setGpuBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_gpuBuffer, 0);
  objc_storeStrong((id *)&self->_cpuBuffer, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
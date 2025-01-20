@interface MLGPUComputeDevice
+ (MLGPUComputeDevice)deviceWithMetalDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MLGPUComputeDevice)initWithMetalDevice:(id)a3;
- (NSString)description;
- (id)metalDevice;
- (unint64_t)hash;
@end

@implementation MLGPUComputeDevice

- (MLGPUComputeDevice)initWithMetalDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLGPUComputeDevice;
  v6 = [(MLGPUComputeDevice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metalDevice, a3);
  }

  return v7;
}

+ (MLGPUComputeDevice)deviceWithMetalDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMetalDevice:v4];

  return (MLGPUComputeDevice *)v5;
}

- (void).cxx_destruct
{
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (unint64_t)hash
{
  v2 = NSNumber;
  v3 = [(MLGPUComputeDevice *)self metalDevice];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "registryID"));
  unint64_t v5 = [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLGPUComputeDevice *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(MLGPUComputeDevice *)v4 metalDevice];
      uint64_t v6 = [v5 registryID];
      v7 = [(MLGPUComputeDevice *)self metalDevice];
      BOOL v8 = v6 == [v7 registryID];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(MLGPUComputeDevice *)self metalDevice];
  unint64_t v5 = [v4 name];
  uint64_t v6 = [v3 stringWithFormat:@"<MLGPUComputeDevice: %p> %@", self, v5];

  return (NSString *)v6;
}

@end
@interface MLCDevice
+ (MLCDevice)aneDevice;
+ (MLCDevice)cpuDevice;
+ (MLCDevice)deviceWithGPUDevices:(NSArray *)gpus;
+ (MLCDevice)deviceWithType:(MLCDeviceType)type;
+ (MLCDevice)deviceWithType:(MLCDeviceType)type selectsMultipleComputeDevices:(BOOL)selectsMultipleComputeDevices;
+ (MLCDevice)gpuDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (MLCDevice)init;
- (MLCDevice)initWithGPUs:(id)a3;
- (MLCDevice)initWithType:(int)a3 engine:(id)a4;
- (MLCDevice)initWithType:(int)a3 selectsMultipleComputeDevices:(BOOL)a4;
- (MLCDeviceProperties)engine;
- (MLCDeviceType)actualDeviceType;
- (MLCDeviceType)type;
- (MLComputeEngineControl)computeEngine;
- (NSArray)gpuDevices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setComputeEngine:(id)a3;
- (void)setEngine:(id)a3;
- (void)setType:(int)a3;
- (void)switchToCPUDevice;
@end

@implementation MLCDevice

+ (MLCDevice)cpuDevice
{
  return (MLCDevice *)[a1 deviceWithType:0];
}

+ (MLCDevice)gpuDevice
{
  return (MLCDevice *)[a1 deviceWithType:1];
}

+ (MLCDevice)aneDevice
{
  return (MLCDevice *)[a1 deviceWithType:3];
}

+ (MLCDevice)deviceWithType:(MLCDeviceType)type
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:*(void *)&type selectsMultipleComputeDevices:0];

  return (MLCDevice *)v3;
}

+ (MLCDevice)deviceWithType:(MLCDeviceType)type selectsMultipleComputeDevices:(BOOL)selectsMultipleComputeDevices
{
  v4 = (void *)[objc_alloc((Class)a1) initWithType:*(void *)&type selectsMultipleComputeDevices:selectsMultipleComputeDevices];

  return (MLCDevice *)v4;
}

+ (MLCDevice)deviceWithGPUDevices:(NSArray *)gpus
{
  v5 = gpus;
  if ([(NSArray *)v5 count])
  {
    v6 = (void *)[objc_alloc((Class)a1) initWithGPUs:v5];
  }
  else
  {
    v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MLCDevice deviceWithGPUDevices:](a2, v7);
    }

    v6 = 0;
  }

  return (MLCDevice *)v6;
}

- (MLCDevice)init
{
  return [(MLCDevice *)self initWithType:2 selectsMultipleComputeDevices:0];
}

- (MLCDevice)initWithType:(int)a3 selectsMultipleComputeDevices:(BOOL)a4
{
  if (a3 == 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a3;
  }
  if (v5 == 3)
  {
    v6 = [[MLCDeviceANE alloc] initWithType:3];
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v5)
    {
      v6 = [[MLCDeviceCPU alloc] initWithType:0];
LABEL_10:
      self = [(MLCDevice *)self initWithType:v5 engine:v6];
      v7 = self;
      goto LABEL_11;
    }
    v6 = [[MLCDeviceGPU alloc] initWithType:v5 selectsMultipleComputeDevices:a4];
    v8 = [(MLCDeviceANE *)v6 deviceList];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_10;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (MLCDevice)initWithGPUs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MLCDeviceGPU alloc] initWithDeviceList:v4];

  if (v5
    && (v6 = v5,
        [(MLCDeviceGPU *)v6 deviceList],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    self = [(MLCDevice *)self initWithType:1 engine:v6];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (MLCDevice)initWithType:(int)a3 engine:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLCDevice;
  uint64_t v8 = [(MLCDevice *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_engine, a4);
    objc_storeStrong((id *)&v9->_computeEngine, a4);
  }

  return v9;
}

- (void)switchToCPUDevice
{
  [(MLCDevice *)self setType:0];
  id v4 = [[MLCDeviceCPU alloc] initWithType:0];
  v3 = (void *)MEMORY[0x1E01B11E0]();
  [(MLCDevice *)self setEngine:v4];
  [(MLCDevice *)self setComputeEngine:v4];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCDevice *)self type];
  id v7 = [(MLCDevice *)self computeEngine];
  uint64_t v8 = [v3 stringWithFormat:@"%@: { deviceType=%d : computeEngine=%@ }", v5, v6, v7];

  return v8;
}

- (NSArray)gpuDevices
{
  v3 = [(MLCDevice *)self engine];
  id v4 = [v3 deviceList];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  int v6 = [v5 conformsToProtocol:&unk_1F3894530];

  if (v6)
  {
    id v7 = [(MLCDevice *)self engine];
    uint64_t v8 = [v7 deviceList];
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CBF0] copy];
  }

  return (NSArray *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCDevice *)self type];
  int v6 = [(MLCDevice *)self computeEngine];
  id v7 = (void *)[v4 initWithType:v5 engine:v6];

  return v7;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  if (v4 && (MLCDeviceType v5 = -[MLCDevice type](self, "type"), v5 == [v4 type]))
  {
    int v6 = [(MLCDevice *)self computeEngine];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(MLCDevice *)self computeEngine];
      uint64_t v9 = [v4 computeEngine];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLCDevice *)a3;
  MLCDeviceType v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MLCDevice *)self isEqualToDevice:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(MLCDevice *)self type];
}

- (MLCDeviceType)actualDeviceType
{
  MLCDeviceType result = [(MLCDevice *)self type];
  if (result == MLCDeviceTypeAny)
  {
    id v4 = [(MLCDevice *)self engine];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    return isKindOfClass & 1;
  }
  return result;
}

- (MLCDeviceType)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (MLCDeviceProperties)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (MLComputeEngineControl)computeEngine
{
  return self->_computeEngine;
}

- (void)setComputeEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeEngine, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

+ (void)deviceWithGPUDevices:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  MLCDeviceType v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: No GPUs specified", (uint8_t *)&v4, 0xCu);
}

@end
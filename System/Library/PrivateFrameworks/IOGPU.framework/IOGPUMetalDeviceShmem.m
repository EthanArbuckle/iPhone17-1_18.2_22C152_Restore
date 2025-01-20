@interface IOGPUMetalDeviceShmem
- (IOGPUMetalDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4 shmemType:(int)a5;
- (unsigned)shmemID;
- (unsigned)shmemSize;
- (void)dealloc;
- (void)virtualAddress;
@end

@implementation IOGPUMetalDeviceShmem

- (IOGPUMetalDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4 shmemType:(int)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.6();
  }
  v12.receiver = self;
  v12.super_class = (Class)IOGPUMetalDeviceShmem;
  v9 = [(IOGPUMetalDeviceShmem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    if (!a4) {
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]();
    }
    v9->_device = (IOGPUMetalDevice *)a3;
    if (IOGPUDeviceCreateDeviceShmem([a3 deviceRef], a4, a5, &v9->_virtualAddress, &v9->_shmemSize, &v9->_shmemID))-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.5(); {
    v10->_priv.trim_level = 0;
    }
    if (!v10->_virtualAddress) {
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]();
    }
    if (![(IOGPUMetalDeviceShmem *)v10 shmemSize]) {
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]();
    }
    if (![(IOGPUMetalDeviceShmem *)v10 shmemID]) {
      -[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:].cold.4();
    }
  }
  return v10;
}

- (unsigned)shmemSize
{
  return self->_shmemSize;
}

- (unsigned)shmemID
{
  return self->_shmemID;
}

- (void)dealloc
{
}

- (void)virtualAddress
{
  return self->_virtualAddress;
}

- (void)initWithDevice:shmemSize:shmemType:.cold.1()
{
}

- (void)initWithDevice:shmemSize:shmemType:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDeviceShmem initWithDevice:shmemSize:shmemType:]", "IOGPUMetalDeviceShmem.m", 57, "NULL != _virtualAddress");
}

- (void)initWithDevice:shmemSize:shmemType:.cold.3()
{
}

- (void)initWithDevice:shmemSize:shmemType:.cold.4()
{
}

- (void)initWithDevice:shmemSize:shmemType:.cold.5()
{
}

- (void)initWithDevice:shmemSize:shmemType:.cold.6()
{
}

@end
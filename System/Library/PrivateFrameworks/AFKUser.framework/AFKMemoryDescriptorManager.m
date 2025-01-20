@interface AFKMemoryDescriptorManager
+ (id)withService:(unsigned int)a3;
- (AFKMemoryDescriptorManager)initWithService:(unsigned int)a3;
- (unint64_t)regID;
- (unsigned)connect;
- (void)dealloc;
@end

@implementation AFKMemoryDescriptorManager

+ (id)withService:(unsigned int)a3
{
  v3 = [[AFKMemoryDescriptorManager alloc] initWithService:*(void *)&a3];
  return v3;
}

- (AFKMemoryDescriptorManager)initWithService:(unsigned int)a3
{
  output[1] = *MEMORY[0x1E4F143B8];
  uint32_t outputCnt = 1;
  v8.receiver = self;
  v8.super_class = (Class)AFKMemoryDescriptorManager;
  v4 = [(AFKMemoryDescriptorManager *)&v8 init];
  if (!v4 || IOObjectRetain(a3)) {
    goto LABEL_16;
  }
  v4->_service = a3;
  if (IOServiceOpen(a3, *MEMORY[0x1E4F14960], 0x6D646D72u, &v4->_connect))
  {
    v6 = _AFKUserLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptorManager *)v4 regID];
      -[AFKMemoryDescriptorManager initWithService:]();
    }
    goto LABEL_15;
  }
  if (IOConnectCallScalarMethod(v4->_connect, 9u, 0, 0, output, &outputCnt))
  {
    v6 = _AFKUserLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptorManager *)v4 regID];
      -[AFKMemoryDescriptorManager initWithService:]();
    }
    goto LABEL_15;
  }
  if (outputCnt != 1)
  {
    v6 = _AFKUserLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AFKMemoryDescriptorManager *)(uint64_t)&outputCnt initWithService:[(AFKMemoryDescriptorManager *)v4 regID]];
    }
LABEL_15:

LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  v4->_regID = output[0];
  v5 = v4;
LABEL_17:

  return v5;
}

- (void)dealloc
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AFKMemoryDescriptorManager;
  [(AFKMemoryDescriptorManager *)&v5 dealloc];
}

- (unint64_t)regID
{
  return self->_regID;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)initWithService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(3.8521e-34, a1, a2, a3);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kGetIDMethod outputCount %u", v3, v4);
}

- (void)initWithService:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kGetIDMethod:0x%x", v3, v4);
}

- (void)initWithService:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: IOServiceOpen:0x%x", v3, v4);
}

@end
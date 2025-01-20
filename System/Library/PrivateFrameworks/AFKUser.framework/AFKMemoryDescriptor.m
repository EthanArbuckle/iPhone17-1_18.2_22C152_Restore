@interface AFKMemoryDescriptor
+ (id)withManager:(id)a3 capacity:(unint64_t)a4;
+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (AFKMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5;
- (AFKMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (AFKMemoryDescriptorManager)manager;
- (BOOL)isEqual:(id)a3;
- (BOOL)mapDescriptor;
- (char)buffer;
- (int)assertPower:(BOOL)a3;
- (int)assumeControl;
- (int)readBytes:(void *)a3 size:(unint64_t)a4 fromOffset:(unint64_t)a5;
- (int)releaseControl:(BOOL)a3;
- (int)writeBytes:(const void *)a3 size:(unint64_t)a4 toOffset:(unint64_t)a5;
- (unint64_t)capacity;
- (unint64_t)length;
- (unint64_t)regID;
- (unint64_t)token;
- (void)assumeControl;
- (void)dealloc;
- (void)handleEnqueue;
- (void)mapDescriptor;
- (void)setLength:(unint64_t)a3;
@end

@implementation AFKMemoryDescriptor

+ (id)withManager:(id)a3 capacity:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[AFKMemoryDescriptor alloc] initWithManager:v5 capacity:a4 buffer:0];

  return v6;
}

- (AFKMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5
{
  kern_return_t v13;
  AFKMemoryDescriptor *v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint32_t outputCnt;
  unsigned char v20[32];
  uint64_t output;
  uint64_t input[3];

  BOOL v5 = a5;
  input[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  input[0] = a4;
  input[1] = v5;
  outputCnt = 1;
  v18.receiver = self;
  v18.super_class = (Class)AFKMemoryDescriptor;
  v10 = [(AFKMemoryDescriptor *)&v18 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v10->_manager, a3);
  v11->_capacity = a4;
  v11->_regID = [v9 regID];
  v11->_cachedLength = 0;
  v12 = [(AFKMemoryDescriptor *)v11 manager];
  v13 = IOConnectCallScalarMethod([v12 connect], 0, input, 2u, &output, &outputCnt);

  if (v13)
  {
    v15 = _AFKUserLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)v11 regID];
      -[AFKMemoryDescriptor initWithManager:capacity:buffer:]();
    }

    goto LABEL_12;
  }
  if (outputCnt != 1)
  {
    v16 = _AFKUserLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AFKMemoryDescriptor initWithManager:capacity:buffer:]((uint64_t)&outputCnt, (uint64_t)v20, [(AFKMemoryDescriptor *)v11 regID]);
    }

    goto LABEL_12;
  }
  v11->_token = output;
  if (![(AFKMemoryDescriptor *)v11 mapDescriptor])
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = v11;
LABEL_13:

  return v14;
}

+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  id v7 = a3;
  v8 = [[AFKMemoryDescriptor alloc] initWithManager:v7 capacity:a4 token:a5];

  return v8;
}

- (AFKMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFKMemoryDescriptor;
  v10 = [(AFKMemoryDescriptor *)&v14 init];
  v11 = v10;
  if (v10
    && (objc_storeStrong((id *)&v10->_manager, a3),
        v11->_token = a5,
        v11->_cachedLength = 0,
        v11->_capacity = a4,
        [(AFKMemoryDescriptor *)v11 mapDescriptor]))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)mapDescriptor
{
  kern_return_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  objc_super v14 = 0;
  v15 = 0;
  v3 = [(AFKMemoryDescriptor *)self manager];
  v4 = IOConnectCallScalarMethod([v3 connect], 1u, input, 1u, 0, 0);

  if (v4)
  {
    v10 = _AFKUserLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)self regID];
      -[AFKMemoryDescriptor mapDescriptor]();
    }
  }
  else
  {
    BOOL v5 = [(AFKMemoryDescriptor *)self manager];
    v6 = [v5 connect];
    id v7 = MEMORY[0x1E0190D80](v6, 0, *MEMORY[0x1E4F14960], &v15, &v14, 1);

    if (v7)
    {
      v10 = _AFKUserLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [(AFKMemoryDescriptor *)self regID];
        -[AFKMemoryDescriptor mapDescriptor]();
      }
    }
    else
    {
      v8 = v14;
      self->_buffer = v15;
      if (v8 == [(AFKMemoryDescriptor *)self capacity]) {
        return 1;
      }
      v10 = _AFKUserLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [(AFKMemoryDescriptor *)self regID];
        v12 = v14;
        v13 = [(AFKMemoryDescriptor *)self capacity];
        *(_DWORD *)buf = 134218496;
        v17 = v11;
        v18 = 2048;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        _os_log_error_impl(&dword_1DB6F4000, v10, OS_LOG_TYPE_ERROR, "0x%llx: IOConnectMapMemory size mismatch:0x%zx,0x%zx", buf, 0x20u);
      }
    }
  }

  return 0;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kFreeMethod:0x%x", v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(AFKMemoryDescriptor *)self manager];
    v6 = [v4 manager];
    if ([v5 isEqual:v6])
    {
      unint64_t v7 = [(AFKMemoryDescriptor *)self token];
      BOOL v8 = v7 == [v4 token];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setLength:(unint64_t)a3
{
  kern_return_t v6;
  NSObject *v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  input[1] = a3;
  BOOL v5 = [(AFKMemoryDescriptor *)self manager];
  v6 = IOConnectCallScalarMethod([v5 connect], 2u, input, 2u, 0, 0);

  if (v6)
  {
    unint64_t v7 = _AFKUserLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)self regID];
      -[AFKMemoryDescriptor setLength:]();
    }
  }
  else
  {
    self->_cachedLength = a3;
  }
}

- (unint64_t)length
{
  kern_return_t v5;
  NSObject *v6;
  unint64_t v7;
  uint32_t outputCnt;
  uint8_t buf[4];
  unint64_t v10;
  __int16 v11;
  kern_return_t v12;
  __int16 v13;
  uint32_t v14;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_cachedLength;
  if (!result)
  {
    input[0] = [(AFKMemoryDescriptor *)self token];
    outputCnt = 1;
    id v4 = [(AFKMemoryDescriptor *)self manager];
    BOOL v5 = IOConnectCallScalarMethod([v4 connect], 3u, input, 1u, &output, &outputCnt);

    if (v5 || outputCnt != 1)
    {
      v6 = _AFKUserLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v7 = [(AFKMemoryDescriptor *)self regID];
        *(_DWORD *)buf = 134218496;
        v10 = v7;
        v11 = 1024;
        v12 = v5;
        v13 = 1024;
        objc_super v14 = outputCnt;
        _os_log_error_impl(&dword_1DB6F4000, v6, OS_LOG_TYPE_ERROR, "0x%llx: kGetLengthMethod:0x%x cnt:%u", buf, 0x18u);
      }

      return 0;
    }
    else
    {
      unint64_t result = output;
      self->_cachedLength = output;
    }
  }
  return result;
}

- (int)assertPower:(BOOL)a3
{
  kern_return_t v6;
  NSObject *v8;
  uint64_t input[3];

  BOOL v3 = a3;
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  input[1] = v3;
  BOOL v5 = [(AFKMemoryDescriptor *)self manager];
  v6 = IOConnectCallScalarMethod([v5 connect], 0xAu, input, 2u, 0, 0);

  if (v6)
  {
    BOOL v8 = _AFKUserLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)self regID];
      -[AFKMemoryDescriptor assertPower:]();
    }
  }
  return v6;
}

- (int)assumeControl
{
  kern_return_t v4;
  NSObject *v6;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  BOOL v3 = [(AFKMemoryDescriptor *)self manager];
  id v4 = IOConnectCallScalarMethod([v3 connect], 4u, input, 1u, 0, 0);

  if (v4)
  {
    v6 = _AFKUserLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)self regID];
      -[AFKMemoryDescriptor assumeControl]();
    }
  }
  return v4;
}

- (int)releaseControl:(BOOL)a3
{
  kern_return_t v6;
  NSObject *v8;
  uint64_t input[3];

  BOOL v3 = a3;
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  input[1] = v3;
  BOOL v5 = [(AFKMemoryDescriptor *)self manager];
  v6 = IOConnectCallScalarMethod([v5 connect], 5u, input, 2u, 0, 0);

  if (v6)
  {
    BOOL v8 = _AFKUserLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(AFKMemoryDescriptor *)self regID];
      -[AFKMemoryDescriptor releaseControl:]();
    }
  }
  return v6;
}

- (int)readBytes:(void *)a3 size:(unint64_t)a4 fromOffset:(unint64_t)a5
{
  int v5 = -536870206;
  if (!__CFADD__(a5, a4) && a5 + a4 <= [(AFKMemoryDescriptor *)self length])
  {
    memcpy(a3, [(AFKMemoryDescriptor *)self buffer] + a5, a4);
    return 0;
  }
  return v5;
}

- (int)writeBytes:(const void *)a3 size:(unint64_t)a4 toOffset:(unint64_t)a5
{
  int v5 = -536870206;
  if (!__CFADD__(a5, a4) && a5 + a4 <= [(AFKMemoryDescriptor *)self length])
  {
    memcpy([(AFKMemoryDescriptor *)self buffer] + a5, a3, a4);
    return 0;
  }
  return v5;
}

- (void)handleEnqueue
{
  self->_cachedLength = 0;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)regID
{
  return self->_regID;
}

- (unint64_t)token
{
  return self->_token;
}

- (AFKMemoryDescriptorManager)manager
{
  return self->_manager;
}

- (char)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
}

- (void)initWithManager:(uint64_t)a1 capacity:(uint64_t)a2 buffer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(3.8521e-34, a1, a2, a3);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kCreateMethod outputCount %u", v3, v4);
}

- (void)initWithManager:capacity:buffer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kCreateMethod:0x%x", v3, v4);
}

- (void)mapDescriptor
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kSetMapTokenMethod:0x%x", v3, v4);
}

- (void)setLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kSetLengthMethod:0x%x", v3, v4);
}

- (void)assertPower:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kAssertPowerMethod:0x%x", v3, v4);
}

- (void)assumeControl
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kAssumeMethod:0x%x", v3, v4);
}

- (void)releaseControl:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kReleaseMethod:0x%x", v3, v4);
}

@end
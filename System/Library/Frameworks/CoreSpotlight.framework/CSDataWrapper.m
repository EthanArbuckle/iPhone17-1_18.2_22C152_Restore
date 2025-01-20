@interface CSDataWrapper
- (BOOL)mapped;
- (CSDataWrapper)initWithData:(id)a3;
- (CSDataWrapper)initWithXPCValue:(id)a3;
- (CSDataWrapper)initWithXPCValue:(id)a3 allowWritableSharedMemory:(BOOL)a4;
- (NSData)data;
- (OS_xpc_object)xpcData;
- (const)dataPtr;
- (unint64_t)dataSize;
- (unint64_t)mapSize;
- (void)dealloc;
- (void)setDataSize:(unint64_t)a3;
@end

@implementation CSDataWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcData, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)dealloc
{
  dataPtr = (void *)self->_dataPtr;
  if (dataPtr && self->_mapped) {
    munmap(dataPtr, self->_mapSize);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSDataWrapper;
  [(CSDataWrapper *)&v4 dealloc];
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    dataPtr = self->_dataPtr;
    if (dataPtr)
    {
      v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataPtr length:self->_dataSize freeWhenDone:0];
      v6 = self->_data;
      self->_data = v5;

      data = self->_data;
    }
    else
    {
      data = 0;
    }
  }

  return data;
}

- (CSDataWrapper)initWithXPCValue:(id)a3 allowWritableSharedMemory:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSDataWrapper;
  v8 = [(CSDataWrapper *)&v15 init];
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = MEMORY[0x192F9A3C0](v7);
      if (v9 == MEMORY[0x1E4F145E8])
      {
        if (a4)
        {
          size_t v11 = xpc_shmem_map(v7, (void **)&v8->_dataPtr);
          v8->_mapSize = v11;
          if (v8->_dataPtr)
          {
            v8->_dataSize = v11;
            v8->_mapped = 1;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          -[CSDataWrapper initWithXPCValue:allowWritableSharedMemory:]();
        }
      }
      else if (v9 == MEMORY[0x1E4F14580])
      {
        size_t length = xpc_data_get_length(v7);
        v8->_dataSize = length;
        if (length)
        {
          v8->_dataPtr = xpc_data_get_bytes_ptr(v7);
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F1C9B8] data];
          data = v8->_data;
          v8->_data = (NSData *)v12;
        }
      }
      if (v8->_dataPtr)
      {
        objc_storeStrong((id *)&v8->_xpcData, a3);
        goto LABEL_17;
      }
      if (v8->_data) {
        goto LABEL_17;
      }
    }

    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (void)setDataSize:(unint64_t)a3
{
  if (self->_dataSize > a3) {
    self->_dataSize = a3;
  }
}

- (OS_xpc_object)xpcData
{
  return self->_xpcData;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (CSDataWrapper)initWithXPCValue:(id)a3
{
  return [(CSDataWrapper *)self initWithXPCValue:a3 allowWritableSharedMemory:1];
}

- (CSDataWrapper)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSDataWrapper;
  v6 = [(CSDataWrapper *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_data, a3);
      id v8 = v5;
      v7->_dataPtr = (const void *)[v8 bytes];
      v7->_dataSize = [v8 length];
    }
    else
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (const)dataPtr
{
  return self->_dataPtr;
}

- (unint64_t)mapSize
{
  return self->_mapSize;
}

- (BOOL)mapped
{
  return self->_mapped;
}

- (void)initWithXPCValue:allowWritableSharedMemory:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "XPC_TYPE_SHMEM not allowed", v0, 2u);
}

@end
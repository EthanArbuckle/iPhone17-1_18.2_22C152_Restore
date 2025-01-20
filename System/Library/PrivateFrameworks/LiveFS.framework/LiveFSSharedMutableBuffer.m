@interface LiveFSSharedMutableBuffer
+ (BOOL)supportsSecureCoding;
+ (id)bufferWithCapacity:(unint64_t)a3;
+ (id)bufferWithLength:(unint64_t)a3;
+ (id)dataWithCapacity:(unint64_t)a3;
+ (id)dataWithLength:(unint64_t)a3;
+ (id)newByCopyingPort:(unsigned int)a3;
- (BOOL)ensureMapped;
- (BOOL)ensureMappedIOMD;
- (BOOL)ensureMappedMB:(unint64_t)a3;
- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3;
- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4;
- (LiveFSSharedMutableBuffer)initWithCoder:(id)a3;
- (LiveFSSharedMutableBuffer)initWithLength:(unint64_t)a3;
- (LiveFSSharedMutableBuffer)initWithMachPort:(unsigned int)a3 capacity:(unint64_t)a4 length:(unint64_t)a5 wrapsIOWMD:(BOOL)a6;
- (id)createDispatchData;
- (unint64_t)length;
- (void)createMappingAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7;
- (void)createMappingForVMAAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)detachBytes;
- (void)encodeWithCoder:(id)a3;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation LiveFSSharedMutableBuffer

- (LiveFSSharedMutableBuffer)initWithMachPort:(unsigned int)a3 capacity:(unint64_t)a4 length:(unint64_t)a5 wrapsIOWMD:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)LiveFSSharedMutableBuffer;
  v10 = [(LiveFSSharedMutableBuffer *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_mp = a3;
    v10->_capacity = a4;
    v10->_length = a5;
    v10->_isIOWMD = a6;
    memMap = v10->_memMap;
    v10->_memMap = 0;
  }
  return v11;
}

- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)LiveFSSharedMutableBuffer;
  v6 = [(LiveFSSharedMutableBuffer *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_capacity = a3;
    v6->_length = a4;
    p_capacity = &v6->_capacity;
    v6->_isIOWMD = 0;
    memMap = v6->_memMap;
    v6->_memMap = 0;

    v10 = (vm_map_t *)MEMORY[0x263EF8960];
    if (vm_allocate(*MEMORY[0x263EF8960], &v7->_vma, *p_capacity, -1778384895))
    {

      livefs_std_log();
      v7 = (LiveFSSharedMutableBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:]();
      }
LABEL_12:

      return 0;
    }
    memory_object_offset_t vma = v7->_vma;
    memory_object_size_t size = v7->_capacity;
    if (mach_make_memory_entry_64(*v10, &size, vma, 4194371, &v7->_mp, 0))
    {

      livefs_std_log();
      v7 = (LiveFSSharedMutableBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:]();
      }
      goto LABEL_12;
    }
    if (size < *p_capacity)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSSharedMutableBuffer initWithCapacity:andLength:]((uint64_t *)&size, (uint64_t *)&v7->_capacity, v12);
      }

      goto LABEL_12;
    }
  }
  return v7;
}

- (LiveFSSharedMutableBuffer)initWithCapacity:(unint64_t)a3
{
  return [(LiveFSSharedMutableBuffer *)self initWithCapacity:a3 andLength:0];
}

- (LiveFSSharedMutableBuffer)initWithLength:(unint64_t)a3
{
  return [(LiveFSSharedMutableBuffer *)self initWithCapacity:a3 andLength:a3];
}

+ (id)bufferWithLength:(unint64_t)a3
{
  v3 = [[LiveFSSharedMutableBuffer alloc] initWithLength:a3];

  return v3;
}

+ (id)bufferWithCapacity:(unint64_t)a3
{
  v3 = [[LiveFSSharedMutableBuffer alloc] initWithCapacity:a3];

  return v3;
}

+ (id)dataWithLength:(unint64_t)a3
{
  v3 = [[LiveFSSharedMutableBuffer alloc] initWithLength:a3];

  return v3;
}

+ (id)dataWithCapacity:(unint64_t)a3
{
  v3 = [[LiveFSSharedMutableBuffer alloc] initWithCapacity:a3];

  return v3;
}

+ (id)newByCopyingPort:(unsigned int)a3
{
  kern_return_t v4;
  kern_return_t v5;
  LiveFSSharedMutableBuffer *v7;
  _DWORD v8[2];
  uint64_t v9;
  uint64_t vars8;

  uint64_t v3 = *(void *)&a3;
  v9 = *MEMORY[0x263EF8340];
  v4 = mach_port_mod_refs(*MEMORY[0x263EF8960], a3, 0, 1);
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "mach_port_mod_refs failed, returned %d", (uint8_t *)v8, 8u);
    }
    return 0;
  }
  else
  {
    v7 = [LiveFSSharedMutableBuffer alloc];
    return [(LiveFSSharedMutableBuffer *)v7 initWithMachPort:v3 capacity:0 length:0 wrapsIOWMD:1];
  }
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23AB0B000, a2, OS_LOG_TYPE_DEBUG, "LiveFSSharedMutableBuffer: dealloc: error %d", (uint8_t *)v2, 8u);
}

- (void)detachBytes
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23AB0B000, log, OS_LOG_TYPE_FAULT, "detatchBytes called on LiveFSSharedMutableBuffer wrapping an IOMD, which won't work well", v1, 2u);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  if (self->_capacity >= a3) {
    self->_length = a3;
  }
}

- (void)createMappingForVMAAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7
{
  v11 = (void (**)(id, uint64_t, void))a7;
  objc_super v14 = v11;
  if (a6 + a5 <= self->_length)
  {
    unint64_t vma = self->_vma;
    if (!vma)
    {
      if (![(LiveFSSharedMutableBuffer *)self ensureMappedMB:a3])
      {
        v14[2](v14, 3, 0);
        goto LABEL_8;
      }
      unint64_t vma = self->_vma;
    }
    id v13 = +[LiveFSMemoryMap newWithPort:0 address:vma + a5 andSize:a6];
    ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v13);

    goto LABEL_8;
  }
  v11[2](v11, 18, 0);
LABEL_8:
}

- (void)createMappingAt:(unint64_t)a3 options:(unsigned int)a4 startingAtOffset:(unint64_t)a5 forLength:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  v12 = (void (**)(id, uint64_t, id))a7;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v18 = 24;
  if (self->_isIOWMD)
  {
    *((void *)&v19 + 1) = a3;
    LODWORD(v19) = self->_mp;
    LODWORD(v20) = 0;
    *((void *)&v20 + 1) = a5;
    *(void *)&long long v21 = a6;
    id v13 = +[LiveFSUserClient defaultClient];
    objc_super v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 callStructMethod:0 inStruct:&v19 inSize:40 outStruct:&v19 outStructSize:&v18];
      if (v15)
      {
        uint64_t v16 = v15;
        id v17 = 0;
      }
      else
      {
        id v17 = +[LiveFSMemoryMap newWithPort:address:andSize:](LiveFSMemoryMap, "newWithPort:address:andSize:", v20, v19);
        uint64_t v16 = 0;
      }
    }
    else
    {
      id v17 = 0;
      uint64_t v16 = 9;
    }
    v12[2](v12, v16, v17);
  }
  else
  {
    [(LiveFSSharedMutableBuffer *)self createMappingForVMAAt:a3 options:v9 startingAtOffset:a5 forLength:a6 completionHandler:v12];
  }
}

- (BOOL)ensureMappedMB:(unint64_t)a3
{
  kern_return_t v4;
  NSObject *v5;
  mach_vm_address_t address;

  address = a3;
  v4 = mach_vm_map(*MEMORY[0x263EF8960], &address, self->_capacity, 0, 1, self->_mp, 0, 0, 67, 67, 2u);
  if (v4)
  {
    v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LiveFSSharedMutableBuffer ensureMappedMB:]();
    }
  }
  else
  {
    self->_unint64_t vma = address;
  }
  return v4 == 0;
}

- (BOOL)ensureMappedIOMD
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__LiveFSSharedMutableBuffer_ensureMappedIOMD__block_invoke;
  v4[3] = &unk_264DC7A18;
  v4[4] = self;
  v4[5] = &v5;
  [(LiveFSSharedMutableBuffer *)self createMappingAt:0 options:0 startingAtOffset:0 forLength:0 completionHandler:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__LiveFSSharedMutableBuffer_ensureMappedIOMD__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    char v7 = 0;
  }
  else
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a3);
    *(void *)(*(void *)(a1 + 32) + 8) = [v9 address];
    uint64_t v8 = [v9 size];
    *(void *)(*(void *)(a1 + 32) + 24) = v8;
    *(void *)(*(void *)(a1 + 32) + 16) = v8;
    id v6 = v9;
    char v7 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
}

- (BOOL)ensureMapped
{
  if (self->_vma) {
    return 1;
  }
  if (self->_isIOWMD) {
    return [(LiveFSSharedMutableBuffer *)self ensureMappedIOMD];
  }
  return [(LiveFSSharedMutableBuffer *)self ensureMappedMB:0];
}

- (id)createDispatchData
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  char v2 = self;
  v11 = v2;
  if ([(LiveFSSharedMutableBuffer *)v2 ensureMapped])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__LiveFSSharedMutableBuffer_createDispatchData__block_invoke;
    aBlock[3] = &unk_264DC7A40;
    aBlock[4] = v10;
    uint64_t v3 = _Block_copy(aBlock);
    unint64_t vma = (const void *)v2->_vma;
    size_t length = v2->_length;
    id v6 = dispatch_get_global_queue(0, 0);
    dispatch_data_t v7 = dispatch_data_create(vma, length, v6, v3);
  }
  else
  {
    dispatch_data_t v7 = 0;
  }
  _Block_object_dispose(v10, 8);

  return v7;
}

void __47__LiveFSSharedMutableBuffer_createDispatchData__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  char v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)mutableBytes
{
  if ([(LiveFSSharedMutableBuffer *)self ensureMapped]) {
    return (void *)self->_vma;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v5);
  }
  v4 = (void *)xpc_mach_send_create();
  [v6 encodeInteger:self->_capacity forKey:@"LiveFSSMBuff.cap"];
  [v6 encodeInteger:self->_length forKey:@"LiveFSSMBuff.len"];
  [v6 encodeXPCObject:v4 forKey:@"LiveFSSMBuff.mp"];
  [v6 encodeBool:self->_isIOWMD forKey:@"LiveFSSMBuff.isIOWMD"];
}

- (LiveFSSharedMutableBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v12);
  }
  unint64_t v5 = [v4 decodeIntegerForKey:@"LiveFSSMBuff.cap"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"LiveFSSMBuff.len"];
  dispatch_data_t v7 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"LiveFSSMBuff.mp"];
  uint64_t v8 = [v4 decodeBoolForKey:@"LiveFSSMBuff.isIOWMD"];
  if (v6 > v5)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[LiveFSSharedMutableBuffer initWithCoder:](v9);
    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[LiveFSSharedMutableBuffer initWithCoder:](v9);
    }
    goto LABEL_9;
  }
  self = [(LiveFSSharedMutableBuffer *)self initWithMachPort:xpc_mach_send_copy_right() capacity:v5 length:v6 wrapsIOWMD:v8];
  v10 = self;
LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
}

- (void)initWithCapacity:(os_log_t)log andLength:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 136315650;
  unint64_t v6 = "-[LiveFSSharedMutableBuffer initWithCapacity:andLength:]";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_23AB0B000, log, OS_LOG_TYPE_ERROR, "%s: mach_make_memory_entry_64 gave us size %lu instead of %lu", (uint8_t *)&v5, 0x20u);
}

- (void)initWithCapacity:andLength:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_23AB0B000, v0, v1, "%s: mach_make_memory_entry_64 returned %x", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:andLength:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_23AB0B000, v0, v1, "%s: vm_allocate returned %x", v2, v3, v4, v5, 2u);
}

- (void)ensureMappedMB:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_23AB0B000, v0, v1, "%s: failed with error %x", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[LiveFSSharedMutableBuffer initWithCoder:]";
  _os_log_error_impl(&dword_23AB0B000, log, OS_LOG_TYPE_ERROR, "%s: supplied length is greater than supplied capacity", (uint8_t *)&v1, 0xCu);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[LiveFSSharedMutableBuffer initWithCoder:]";
  _os_log_error_impl(&dword_23AB0B000, log, OS_LOG_TYPE_ERROR, "%s: didn't get the wrapper", (uint8_t *)&v1, 0xCu);
}

@end
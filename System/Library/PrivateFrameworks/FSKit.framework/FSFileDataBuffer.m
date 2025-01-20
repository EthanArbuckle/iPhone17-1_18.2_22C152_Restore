@interface FSFileDataBuffer
+ (BOOL)supportsSecureCoding;
+ (id)dataWithLength:(unint64_t)a3;
- (BOOL)ensureMapped;
- (BOOL)ensureMappedMB:(unint64_t)a3;
- (FSFileDataBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4;
- (FSFileDataBuffer)initWithCoder:(id)a3;
- (FSFileDataBuffer)initWithLength:(unint64_t)a3;
- (const)bytes;
- (unint64_t)internalCapacity;
- (unint64_t)length;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)withBytes:(id)a3;
@end

@implementation FSFileDataBuffer

- (FSFileDataBuffer)initWithCapacity:(unint64_t)a3 andLength:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)FSFileDataBuffer;
  v6 = [(FSFileDataBuffer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_internalCapacity = a3;
    v6->_length = a4;
    p_internalCapacity = &v6->_internalCapacity;
    v9 = (vm_map_t *)MEMORY[0x263EF8960];
    if (vm_allocate(*MEMORY[0x263EF8960], &v6->_vma, a3, -1778384895))
    {

      fskit_std_log();
      v7 = (FSFileDataBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[FSFileDataBuffer initWithCapacity:andLength:]();
      }
LABEL_12:

      return 0;
    }
    memory_object_size_t size = v7->_internalCapacity;
    if (mach_make_memory_entry_64(*v9, &size, v7->_vma, 4194371, &v7->_mp, 0))
    {

      fskit_std_log();
      v7 = (FSFileDataBuffer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[FSFileDataBuffer initWithCapacity:andLength:]();
      }
      goto LABEL_12;
    }
    if (size < *p_internalCapacity)
    {
      v10 = fskit_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[FSFileDataBuffer initWithCapacity:andLength:]((uint64_t *)&size, (uint64_t *)&v7->_internalCapacity, v10);
      }

      goto LABEL_12;
    }
  }
  return v7;
}

- (unint64_t)internalCapacity
{
  return self->_internalCapacity;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_DEBUG, "FSFileDataBuffer: dealloc: error %d", (uint8_t *)v2, 8u);
}

+ (id)dataWithLength:(unint64_t)a3
{
  uint64_t v3 = [[FSFileDataBuffer alloc] initWithLength:a3];
  return v3;
}

- (FSFileDataBuffer)initWithLength:(unint64_t)a3
{
  return [(FSFileDataBuffer *)self initWithCapacity:a3 andLength:a3];
}

- (BOOL)ensureMappedMB:(unint64_t)a3
{
  kern_return_t v4;
  NSObject *v5;
  mach_vm_address_t address;

  address = a3;
  v4 = mach_vm_map(*MEMORY[0x263EF8960], &address, self->_internalCapacity, 0, 1, self->_mp, 0, 0, 67, 67, 2u);
  if (v4)
  {
    v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FSFileDataBuffer ensureMappedMB:]();
    }
  }
  else
  {
    self->_vma = address;
  }
  return v4 == 0;
}

- (BOOL)ensureMapped
{
  return self->_vma || [(FSFileDataBuffer *)self ensureMappedMB:0];
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
  [v6 encodeInteger:self->_length forKey:@"FSKitBuff.len"];
  [v6 encodeXPCObject:v4 forKey:@"FSKitBuff.mp"];
  [v6 encodeInteger:self->_internalCapacity forKey:@"FSKitMBuff.cap"];
}

- (FSFileDataBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSFileDataBuffer;
  id v5 = [(FSFileDataBuffer *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
      objc_exception_throw(v12);
    }
    uint64_t v6 = [v4 decodeIntegerForKey:@"FSKitBuff.len"];
    v5->_internalCapacity = v6;
    v5->_length = v6;
    v7 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"FSKitBuff.mp"];
    unint64_t v8 = [v4 decodeIntegerForKey:@"FSKitMBuff.cap"];
    v5->_internalCapacity = v8;
    if (v5->_length > v8)
    {
      v9 = fskit_std_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FSFileDataBuffer initWithCoder:](v9);
      }
LABEL_11:

      v10 = 0;
      goto LABEL_12;
    }
    if (!v7)
    {
      v9 = fskit_std_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FSFileDataBuffer initWithCoder:](v9);
      }
      goto LABEL_11;
    }
    v5->_mp = xpc_mach_send_copy_right();
  }
  v10 = v5;
LABEL_12:

  return v10;
}

- (const)bytes
{
  if ([(FSFileDataBuffer *)self ensureMapped]) {
    return (const void *)self->_vma;
  }
  else {
    return 0;
  }
}

- (void)withBytes:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, const void *))a3 + 2))(v5, [(FSFileDataBuffer *)self bytes]);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (void)initWithCapacity:(os_log_t)log andLength:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 136315650;
  uint64_t v6 = "-[FSFileDataBuffer initWithCapacity:andLength:]";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_24DDB2000, log, OS_LOG_TYPE_ERROR, "%s: mach_make_memory_entry_64 gave us size %lu instead of %lu", (uint8_t *)&v5, 0x20u);
}

- (void)initWithCapacity:andLength:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: mach_make_memory_entry_64 returned %x", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:andLength:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: vm_allocate returned %x", v2, v3, v4, v5, 2u);
}

- (void)ensureMappedMB:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: failed with error %x", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FSFileDataBuffer initWithCoder:]";
  _os_log_error_impl(&dword_24DDB2000, log, OS_LOG_TYPE_ERROR, "%s: supplied length is greater than supplied capacity", (uint8_t *)&v1, 0xCu);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FSFileDataBuffer initWithCoder:]";
  _os_log_error_impl(&dword_24DDB2000, log, OS_LOG_TYPE_ERROR, "%s: didn't get the wrapper", (uint8_t *)&v1, 0xCu);
}

@end
@interface LiveFSMachPort
+ (BOOL)supportsSecureCoding;
+ (id)newByCopyingPort:(unsigned int)a3;
- (LiveFSMachPort)init;
- (LiveFSMachPort)initWithCoder:(id)a3;
- (LiveFSMachPort)initWithPort:(unsigned int)a3;
- (unsigned)machPort;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LiveFSMachPort

- (LiveFSMachPort)init
{
  return [(LiveFSMachPort *)self initWithPort:0];
}

- (LiveFSMachPort)initWithPort:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LiveFSMachPort;
  result = [(LiveFSMachPort *)&v5 init];
  if (result) {
    result->_machPort = a3;
  }
  return result;
}

+ (id)newByCopyingPort:(unsigned int)a3
{
  kern_return_t v5;
  kern_return_t v6;
  id v8;
  _DWORD v9[2];
  uint64_t v10;
  uint64_t vars8;

  uint64_t v3 = *(void *)&a3;
  v10 = *MEMORY[0x263EF8340];
  if (a3 - 1 <= 0xFFFFFFFD && (objc_super v5 = mach_port_mod_refs(*MEMORY[0x263EF8960], a3, 0, 1)) != 0)
  {
    v6 = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "mach_port_mod_refs failed, returned %d", (uint8_t *)v9, 8u);
    }
    return 0;
  }
  else
  {
    v8 = objc_alloc((Class)a1);
    return (id)[v8 initWithPort:v3];
  }
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23AB0B000, a2, OS_LOG_TYPE_DEBUG, "LiveFSMachPort: dealloc: error %d", (uint8_t *)v2, 8u);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  uint64_t v3 = (void *)xpc_mach_send_create();
  [v5 encodeXPCObject:v3 forKey:@"LiveFSmp.mp"];
}

- (LiveFSMachPort)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"LiveFSmp.mp"];
  if (v5)
  {
    self = [(LiveFSMachPort *)self initWithPort:xpc_mach_send_copy_right()];
    v6 = self;
  }
  else
  {
    v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LiveFSMachPort initWithCoder:](v7);
    }

    v6 = 0;
  }

  return v6;
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[LiveFSMachPort initWithCoder:]";
  _os_log_error_impl(&dword_23AB0B000, log, OS_LOG_TYPE_ERROR, "%s: didn't get the wrapper", (uint8_t *)&v1, 0xCu);
}

@end
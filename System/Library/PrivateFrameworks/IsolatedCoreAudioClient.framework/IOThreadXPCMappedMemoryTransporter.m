@interface IOThreadXPCMappedMemoryTransporter
+ (BOOL)supportsSecureCoding;
+ (id)memory:(const MappedMemory *)a3;
- (BOOL)isEqual:(id)a3;
- (IOThreadXPCMappedMemoryTransporter)initWithCoder:(id)a3;
- (IOThreadXPCMappedMemoryTransporter)initWithObject:(id)a3;
- (MappedMemory)getMappedMemory;
- (OS_xpc_object)serverMemory;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setServerMemory:(id)a3;
@end

@implementation IOThreadXPCMappedMemoryTransporter

- (void).cxx_destruct
{
}

- (void)setServerMemory:(id)a3
{
}

- (OS_xpc_object)serverMemory
{
  return self->_serverMemory;
}

- (MappedMemory)getMappedMemory
{
  v7 = 0;
  size_t v8 = 0;
  v3 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];

  if (v3)
  {
    v4 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];
    size_t v8 = xpc_shmem_map(v4, &v7);

    v5 = v7;
    unint64_t v6 = v8;
  }
  else
  {
    unint64_t v6 = 0;
    v5 = 0;
  }
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];

    if (v6)
    {
      v7 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];
      size_t v8 = [v5 serverMemory];
      LOBYTE(v9) = xpc_equal(v7, v8);
    }
    else
    {
      v7 = [v5 serverMemory];
      BOOL v9 = v7 == 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  id v7 = v4;
  id v5 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];

  if (v5)
  {
    unint64_t v6 = [(IOThreadXPCMappedMemoryTransporter *)self serverMemory];
  }
  else
  {
    unint64_t v6 = xpc_null_create();
  }
  [v7 encodeXPCObject:v6 forKey:@"IOThreadXPCMappedMemoryTransporter"];
}

- (void)dealloc
{
  serverMemory = self->_serverMemory;
  self->_serverMemory = 0;

  v4.receiver = self;
  v4.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  [(IOThreadXPCMappedMemoryTransporter *)&v4 dealloc];
}

- (IOThreadXPCMappedMemoryTransporter)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  v12.receiver = self;
  v12.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  id v5 = [(IOThreadXPCMappedMemoryTransporter *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 decodeXPCObjectForKey:@"IOThreadXPCMappedMemoryTransporter"];
    serverMemory = v5->_serverMemory;
    v5->_serverMemory = (OS_xpc_object *)v7;

    if (!v5->_serverMemory)
    {

      v10 = 0;
      goto LABEL_10;
    }
    if (MEMORY[0x25A277570]() == MEMORY[0x263EF8758])
    {
      BOOL v9 = v5->_serverMemory;
      v5->_serverMemory = 0;
    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (IOThreadXPCMappedMemoryTransporter)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  id v6 = [(IOThreadXPCMappedMemoryTransporter *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverMemory, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)memory:(const MappedMemory *)a3
{
  xpc_object_t v3 = xpc_shmem_create(a3->var0, a3->var1);
  id v4 = [[IOThreadXPCMappedMemoryTransporter alloc] initWithObject:v3];

  return v4;
}

@end
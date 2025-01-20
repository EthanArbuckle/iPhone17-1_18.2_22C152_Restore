@interface NEFlowDivertFileHandle
- (NSData)keyMaterial;
- (NSNumber)controlUnit;
- (id)description;
- (id)dictionary;
- (id)getUnitForSocket:(int)a1;
- (id)initFlowDivertControlSocket;
- (id)initFlowDivertControlSocketDisableAppMap:(BOOL)a3;
- (id)initFlowDivertControlSocketWithParams:(BOOL)a3 order:(int)a4;
- (id)initFlowDivertDataSocket;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEFlowDivertFileHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMaterial, 0);

  objc_storeStrong((id *)&self->_controlUnit, 0);
}

- (NSData)keyMaterial
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)controlUnit
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)type
{
  return 3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NEFileHandle *)self handle];
  uint64_t v5 = [v4 fileDescriptor];
  v6 = [(NEFlowDivertFileHandle *)self controlUnit];
  v7 = [v3 stringWithFormat:@"Flow Divert socket (%d) control unit %@", v5, v6];

  return v7;
}

- (id)dictionary
{
  v11.receiver = self;
  v11.super_class = (Class)NEFlowDivertFileHandle;
  v3 = [(NEFileHandle *)&v11 dictionary];
  v4 = [(NEFlowDivertFileHandle *)self controlUnit];
  xpc_dictionary_set_uint64(v3, "control-unit", [v4 unsignedLongLongValue]);

  uint64_t v5 = [(NEFlowDivertFileHandle *)self keyMaterial];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [(NEFlowDivertFileHandle *)self keyMaterial];
    v8 = (const void *)[v7 bytes];
    v9 = [(NEFlowDivertFileHandle *)self keyMaterial];
    xpc_dictionary_set_data(v3, "key-material", v8, [v9 length]);
  }

  return v3;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEFlowDivertFileHandle;
  uint64_t v5 = [(NEFileHandle *)&v14 initFromDictionary:v4];
  if (v5)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "control-unit");
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "key-material", &length);
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:uint64];
    v9 = (void *)v5[3];
    v5[3] = v8;

    if (data)
    {
      if (length)
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
        objc_super v11 = (void *)v5[4];
        v5[4] = v10;
      }
    }
  }

  return v5;
}

- (id)initFlowDivertDataSocket
{
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    int v4 = KernelControlSocket;
    v10.receiver = self;
    v10.super_class = (Class)NEFlowDivertFileHandle;
    uint64_t v5 = [(NEFileHandle *)&v10 initWithFileDescriptor:KernelControlSocket launchOwnerWhenReadable:1];
    if (v5)
    {
      uint64_t v6 = -[NEFlowDivertFileHandle getUnitForSocket:](v4);
      controlUnit = v5->_controlUnit;
      v5->_controlUnit = (NSNumber *)v6;
    }
    self = v5;
    uint64_t v8 = self;
  }

  return v8;
}

- (id)getUnitForSocket:(int)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  socklen_t v6 = 32;
  sockaddr v7 = (sockaddr)0;
  long long v8 = 0u;
  if (getpeername(a1, &v7, &v6))
  {
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v4 = __error();
      uint64_t v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      objc_super v10 = v5;
      _os_log_error_impl(&dword_19DDAF000, v1, OS_LOG_TYPE_ERROR, "getpeername on control socket failed: %s", buf, 0xCu);
    }

    v2 = 0;
  }
  else
  {
    v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&v7.sa_data[6]];
  }

  return v2;
}

- (id)initFlowDivertControlSocketWithParams:(BOOL)a3 order:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v18 = a4;
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0) {
    goto LABEL_11;
  }
  int v6 = KernelControlSocket;
  v17.receiver = self;
  v17.super_class = (Class)NEFlowDivertFileHandle;
  self = [(NEFileHandle *)&v17 initWithFileDescriptor:KernelControlSocket launchOwnerWhenReadable:1];
  if (!self) {
    goto LABEL_10;
  }
  -[NEFlowDivertFileHandle getUnitForSocket:](v6);
  sockaddr v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  controlUnit = self->_controlUnit;
  self->_controlUnit = v7;

  arc4random_buf(__buf, 0x100uLL);
  v9 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  nelog_is_debug_logging_enabled();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  ssize_t v10 = send(v6, v9, 0, 0);
  if (v10 < 0)
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 136315138;
      v20 = v16;
      _os_log_error_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_ERROR, "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__buf length:256];
    p_super = &self->_keyMaterial->super;
    self->_keyMaterial = v11;
  }

  if (v9) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9);
  }
  if (v10 < 0)
  {
LABEL_11:
    v13 = 0;
  }
  else
  {
LABEL_10:
    self = self;
    v13 = self;
  }

  return v13;
}

- (id)initFlowDivertControlSocketDisableAppMap:(BOOL)a3
{
  return [(NEFlowDivertFileHandle *)self initFlowDivertControlSocketWithParams:a3 order:0x7FFFFFFFLL];
}

- (id)initFlowDivertControlSocket
{
  return [(NEFlowDivertFileHandle *)self initFlowDivertControlSocketDisableAppMap:0];
}

@end
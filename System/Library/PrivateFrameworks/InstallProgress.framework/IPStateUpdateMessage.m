@interface IPStateUpdateMessage
- (IPStateUpdateMessage)initWithType:(unint64_t)a3 identity:(id)a4;
- (IPStateUpdateMessage)initWithXPCDictionaryRepresentation:(id)a3 error:(id *)a4;
- (LSApplicationIdentity)identity;
- (id)XPCDictionaryRepresentation;
- (id)description;
- (unint64_t)type;
- (void)XPCDictionaryRepresentation;
@end

@implementation IPStateUpdateMessage

- (IPStateUpdateMessage)initWithType:(unint64_t)a3 identity:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IPStateUpdateMessage;
  v8 = [(IPStateUpdateMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_identity, a4);
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p type: %u identity: %@>", objc_opt_class(), self, self->_type, self->_identity];
}

- (id)XPCDictionaryRepresentation
{
  keys[2] = *(char **)MEMORY[0x263EF8340];
  identity = self->_identity;
  id v12 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:identity requiringSecureCoding:1 error:&v12];
  id v5 = v12;
  if (!v4)
  {
    v6 = _IPDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(IPStateUpdateMessage *)(uint64_t)v5 XPCDictionaryRepresentation];
    }
  }
  keys[0] = (char *)[@"type" UTF8String];
  keys[1] = (char *)[@"data" UTF8String];
  values[0] = xpc_uint64_create(self->_type);
  if (v4)
  {
    id v7 = v4;
    xpc_object_t v8 = xpc_data_create((const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
  }
  values[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (IPStateUpdateMessage)initWithXPCDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (MEMORY[0x2533C83D0]() != MEMORY[0x263EF8708])
  {
    id v7 = (void *)*MEMORY[0x263F07F70];
    uint64_t v8 = 70;
LABEL_8:
    _IPMakeNSErrorImpl(v7, 4864, (uint64_t)"-[IPStateUpdateMessage initWithXPCDictionaryRepresentation:error:]", v8, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, (const char *)[@"type" UTF8String]);
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, (const char *)[@"data" UTF8String], &length);
  if (!uint64 || !data)
  {
    id v7 = (void *)*MEMORY[0x263F07F70];
    uint64_t v8 = 67;
    goto LABEL_8;
  }
  objc_super v11 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  id v17 = 0;
  id v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v17];
  id v13 = v17;

  if (v12)
  {
    v14 = [(IPStateUpdateMessage *)self initWithType:uint64 identity:v12];
    goto LABEL_12;
  }
LABEL_9:

  if (a4)
  {
    id v13 = v13;
    id v12 = 0;
    v14 = 0;
    *a4 = v13;
  }
  else
  {
    id v12 = 0;
    v14 = 0;
  }
LABEL_12:
  v15 = v14;

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
}

- (void)XPCDictionaryRepresentation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_252AA9000, a2, OS_LOG_TYPE_FAULT, "Could not encode identity: %@", (uint8_t *)&v2, 0xCu);
}

@end
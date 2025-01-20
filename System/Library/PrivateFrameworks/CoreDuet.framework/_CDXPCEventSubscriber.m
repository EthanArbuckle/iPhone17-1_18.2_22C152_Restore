@interface _CDXPCEventSubscriber
- (BOOL)isEqual:(id)a3;
- (NSString)clientIdentifier;
- (NSString)streamName;
- (OS_xpc_object)descriptor;
- (_CDXPCEventSubscriber)initWithToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5 streamName:(id)a6;
- (id)description;
- (unint64_t)hash;
- (unint64_t)token;
- (unsigned)uid;
@end

@implementation _CDXPCEventSubscriber

- (_CDXPCEventSubscriber)initWithToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5 streamName:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_CDXPCEventSubscriber;
  v13 = [(_CDXPCEventSubscriber *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_token = a3;
    objc_storeStrong((id *)&v13->_descriptor, a4);
    v14->_uid = a5;
    objc_storeStrong((id *)&v14->_streamName, a6);
  }

  return v14;
}

- (NSString)clientIdentifier
{
  descriptor = self->_descriptor;
  if (descriptor)
  {
    uint64_t v3 = xpc_dictionary_get_value(descriptor, "client-identifier");
    v4 = (void *)v3;
    if (v3 && MEMORY[0x192FB3850](v3) == MEMORY[0x1E4F145F0] && (string_ptr = xpc_string_get_string_ptr(v4)) != 0)
    {
      v5 = [NSString stringWithUTF8String:string_ptr];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_CDXPCEventSubscriber *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t token = self->_token;
      BOOL v6 = token == [(_CDXPCEventSubscriber *)v4 token];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_token;
}

- (id)description
{
  uint64_t v3 = self->_descriptor;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x192FB36A0](v3);
    BOOL v6 = NSString;
    uint64_t v7 = objc_opt_class();
    streamName = self->_streamName;
    v9 = [NSNumber numberWithUnsignedLongLong:self->_token];
    v10 = [NSNumber numberWithUnsignedInt:self->_uid];
    id v11 = [v6 stringWithFormat:@"<<%@: %p>: { streamName=%@, token=%@, uid=%@, descriptor=%s", v7, self, streamName, v9, v10, v5];

    if (v5) {
      free(v5);
    }
  }
  else
  {
    id v12 = NSString;
    uint64_t v13 = objc_opt_class();
    v14 = self->_streamName;
    v15 = [NSNumber numberWithUnsignedLongLong:self->_token];
    objc_super v16 = [NSNumber numberWithUnsignedInt:self->_uid];
    id v11 = [v12 stringWithFormat:@"<<%@: %p>: { streamName=%@, token=%@, uid=%@", v13, self, v14, v15, v16];
  }
  return v11;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (unsigned)uid
{
  return self->_uid;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
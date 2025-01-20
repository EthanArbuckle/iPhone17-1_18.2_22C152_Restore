@interface IDSGroupSessionBroadcastParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSGroupSessionBroadcastParameter)initWithCoder:(id)a3;
- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 salt:(id)a4 serviceName:(id)a5;
- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 serviceName:(id)a4;
- (NSData)salt;
- (NSString)groupSessionID;
- (NSString)serviceName;
- (OS_nw_endpoint)endpoint;
- (OS_nw_parameters)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSGroupSessionBroadcastParameter

- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 serviceName:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 data];
  v10 = [(IDSGroupSessionBroadcastParameter *)self initWithGroupSessionID:v8 salt:v9 serviceName:v7];

  return v10;
}

- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 salt:(id)a4 serviceName:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IDSGroupSessionBroadcastParameter;
  v10 = [(IDSGroupSessionBroadcastParameter *)&v29 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_groupSessionID, a3);
    objc_storeStrong((id *)&v11->_serviceName, a5);
    v12 = [v9 dataUsingEncoding:4];
    memset(md, 170, 20);
    id v13 = v12;
    CC_SHA1((const void *)[v13 bytes], objc_msgSend(v13, "length"), md);
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    uint64_t v15 = *(unsigned __int16 *)[v14 bytes];

    objc_msgSend(NSString, "stringWithFormat:", @"%d", v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    nw_endpoint_t host = nw_endpoint_create_host("::", (const char *)[v16 UTF8String]);
    endpoint = v11->_endpoint;
    v11->_endpoint = (OS_nw_endpoint *)host;

    nw_parameters_t v19 = nw_parameters_create();
    parameters = v11->_parameters;
    v11->_parameters = (OS_nw_parameters *)v19;

    objc_msgSend(NSString, "stringWithFormat:", @"%d", v15);
    id v21 = objc_claimAutoreleasedReturnValue();
    nw_endpoint_t v22 = nw_endpoint_create_host("::", (const char *)[v21 UTF8String]);

    id v23 = objc_alloc_init(MEMORY[0x1E4F6B488]);
    [v23 setMultiplexer:@"groupsession"];
    [v23 setSessionID:v11->_groupSessionID];
    [v23 setParticipantID:0];
    [v23 setSalt:v11->_salt];
    id v24 = [v23 stringRepresentation];
    [v24 UTF8String];
    nw_parameters_set_account_id();

    MEMORY[0x192FDFFD0](v11->_parameters, v22);
    nw_parameters_set_indefinite();
    xpc_object_t v25 = xpc_array_create(0, 0);
    xpc_object_t v26 = xpc_array_create(0, 0);
    id v27 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
    xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v27 UTF8String]);

    xpc_array_set_string(v26, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
    nw_parameters_set_data_mode();
    nw_parameters_set_required_netagent_classes();
  }
  return v11;
}

- (void)_requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3
{
  v10 = (void (**)(id, nw_connection_t, void *))a3;
  v4 = [(IDSGroupSessionBroadcastParameter *)self endpoint];
  v5 = [(IDSGroupSessionBroadcastParameter *)self parameters];
  nw_connection_t v6 = nw_connection_create(v4, v5);

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", @"Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket.", *MEMORY[0x1E4F28568], 0);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v9];
  }
  if (v10) {
    v10[2](v10, v6, v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IDSGroupSessionBroadcastParameter *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      groupSessionID = self->_groupSessionID;
      id v7 = [(IDSGroupSessionBroadcastParameter *)v5 groupSessionID];
      if ([(NSString *)groupSessionID isEqual:v7])
      {
        salt = self->_salt;
        id v9 = [(IDSGroupSessionBroadcastParameter *)v5 salt];
        if ([(NSData *)salt isEqual:v9])
        {
          serviceName = self->_serviceName;
          v11 = [(IDSGroupSessionBroadcastParameter *)v5 serviceName];
          char v12 = [(NSString *)serviceName isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupSessionID hash];
  NSUInteger v4 = [(NSString *)self->_serviceName hash] ^ v3;
  return v4 ^ [(NSData *)self->_salt hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  groupSessionID = self->_groupSessionID;
  id v5 = a3;
  [v5 encodeObject:groupSessionID forKey:@"groupSessionID"];
  [v5 encodeObject:self->_salt forKey:@"salt"];
  [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
}

- (IDSGroupSessionBroadcastParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupSessionID"];
  nw_connection_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];

  id v8 = [(IDSGroupSessionBroadcastParameter *)self initWithGroupSessionID:v5 salt:v6 serviceName:v7];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSGroupSessionBroadcastParameter alloc];
  groupSessionID = self->_groupSessionID;
  salt = self->_salt;
  serviceName = self->_serviceName;

  return [(IDSGroupSessionBroadcastParameter *)v4 initWithGroupSessionID:groupSessionID salt:salt serviceName:serviceName];
}

- (NSString)groupSessionID
{
  return self->_groupSessionID;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_salt, 0);

  objc_storeStrong((id *)&self->_groupSessionID, 0);
}

@end
@interface NENetworkAgentRegistrationFileHandle
- (BOOL)isRegisteredHandle;
- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6;
- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6 name:(id)a7;
- (NSNumber)sessionType;
- (NSString)name;
- (NSUUID)agentUUID;
- (NSUUID)configurationIdentifier;
- (id)description;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)agentFlags;
- (unint64_t)type;
- (void)setAgentFlags:(unint64_t)a3;
@end

@implementation NENetworkAgentRegistrationFileHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);

  objc_storeStrong((id *)&self->_sessionType, 0);
}

- (void)setAgentFlags:(unint64_t)a3
{
  self->_agentFlags = a3;
}

- (unint64_t)agentFlags
{
  return self->_agentFlags;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)agentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)configurationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)sessionType
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isRegisteredHandle
{
  v2 = [(NEFileHandle *)self handle];
  v3 = v2;
  if (!v2 || (int v4 = [v2 fileDescriptor], v4 < 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    socklen_t v7 = 4;
    int v8 = 0;
    BOOL v5 = getsockopt(v4, 2, 23, &v8, &v7) == 0;
  }

  return v5;
}

- (unint64_t)type
{
  return 2;
}

- (id)description
{
  v3 = NSString;
  int v4 = [(NEFileHandle *)self handle];
  uint64_t v5 = [v4 fileDescriptor];
  v6 = [(NENetworkAgentRegistrationFileHandle *)self configurationIdentifier];
  socklen_t v7 = [v6 UUIDString];
  int v8 = [(NENetworkAgentRegistrationFileHandle *)self agentUUID];
  v9 = [v8 UUIDString];
  v10 = [(NENetworkAgentRegistrationFileHandle *)self sessionType];
  v11 = [(NENetworkAgentRegistrationFileHandle *)self name];
  v12 = [v3 stringWithFormat:@"Network Agent Registration socket (%d) %@ %@ %@ %@ agent flags %#llx", v5, v7, v9, v10, v11, -[NENetworkAgentRegistrationFileHandle agentFlags](self, "agentFlags")];

  return v12;
}

- (id)dictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)uuid = 0;
  uint64_t v14 = 0;
  *(void *)v11 = 0;
  uint64_t v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)NENetworkAgentRegistrationFileHandle;
  v3 = [(NEFileHandle *)&v10 dictionary];
  int v4 = [(NENetworkAgentRegistrationFileHandle *)self sessionType];
  xpc_dictionary_set_uint64(v3, "session-type", [v4 unsignedLongLongValue]);

  uint64_t v5 = [(NENetworkAgentRegistrationFileHandle *)self configurationIdentifier];
  [v5 getUUIDBytes:uuid];

  xpc_dictionary_set_uuid(v3, "configuration-identifier", uuid);
  v6 = [(NENetworkAgentRegistrationFileHandle *)self agentUUID];
  [v6 getUUIDBytes:v11];

  xpc_dictionary_set_uuid(v3, "agent-uuid", v11);
  xpc_dictionary_set_uint64(v3, "agent-flags", [(NENetworkAgentRegistrationFileHandle *)self agentFlags]);
  socklen_t v7 = [(NENetworkAgentRegistrationFileHandle *)self name];

  if (v7)
  {
    id v8 = [(NENetworkAgentRegistrationFileHandle *)self name];
    xpc_dictionary_set_string(v3, "agent-name", (const char *)[v8 UTF8String]);
  }

  return v3;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NENetworkAgentRegistrationFileHandle;
  uint64_t v5 = [(NEFileHandle *)&v19 initFromDictionary:v4];
  if (v5)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "session-type");
    uuid = xpc_dictionary_get_uuid(v4, "configuration-identifier");
    id v8 = xpc_dictionary_get_uuid(v4, "agent-uuid");
    string = xpc_dictionary_get_string(v4, "agent-name");
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:uint64];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
    v13 = (void *)v5[4];
    v5[4] = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
    uint64_t v15 = (void *)v5[5];
    v5[5] = v14;

    v5[7] = xpc_dictionary_get_uint64(v4, "agent-flags");
    if (string)
    {
      uint64_t v16 = [NSString stringWithUTF8String:string];
      v17 = (void *)v5[6];
      v5[6] = v16;
    }
  }

  return v5;
}

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6
{
  return [(NENetworkAgentRegistrationFileHandle *)self initWithNetworkAgentRegistration:a3 sessionType:a4 configurationIdentifier:a5 agentUUID:a6 name:0];
}

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6 name:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [a3 dupRegistrationFileDescriptor];
  if ((v17 & 0x80000000) != 0)
  {
    v21 = 0;
  }
  else
  {
    int v18 = v17;
    v23.receiver = self;
    v23.super_class = (Class)NENetworkAgentRegistrationFileHandle;
    objc_super v19 = [(NEFileHandle *)&v23 initWithFileDescriptor:v17 launchOwnerWhenReadable:1];
    p_isa = (id *)&v19->super.super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_sessionType, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }
    else
    {
      close(v18);
    }
    self = p_isa;
    v21 = self;
  }

  return v21;
}

@end
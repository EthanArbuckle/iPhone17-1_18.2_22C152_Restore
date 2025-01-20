@interface IDSGroupSessionUnicastParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSGroupSessionUnicastParameter)initWithCoder:(id)a3;
- (IDSGroupSessionUnicastParameter)initWithConnectedSocket:(int)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5;
- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 dataMode:(int64_t)a6 connectionIndex:(unint64_t)a7;
- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 salt:(id)a6 dataMode:(int64_t)a7 connectionIndex:(unint64_t)a8;
- (NSData)salt;
- (NSString)groupSessionID;
- (OS_nw_endpoint)endpoint;
- (OS_nw_parameters)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (int)socket;
- (int64_t)dataMode;
- (unint64_t)connectionIndex;
- (unint64_t)hash;
- (unint64_t)localParticipantID;
- (unint64_t)remoteParticipantID;
- (void)_requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3;
- (void)_setUpNWConnectionforTesting:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3;
- (void)setSocket:(int)a3;
@end

@implementation IDSGroupSessionUnicastParameter

- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 dataMode:(int64_t)a6 connectionIndex:(unint64_t)a7
{
  v12 = (void *)MEMORY[0x1E4F1C9B8];
  id v13 = a3;
  v14 = [v12 data];
  v15 = [(IDSGroupSessionUnicastParameter *)self initWithGroupSessionID:v13 localParticipantID:a4 remoteParticipantID:a5 salt:v14 dataMode:a6 connectionIndex:a7];

  return v15;
}

- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 salt:(id)a6 dataMode:(int64_t)a7 connectionIndex:(unint64_t)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  v49.receiver = self;
  v49.super_class = (Class)IDSGroupSessionUnicastParameter;
  v17 = [(IDSGroupSessionUnicastParameter *)&v49 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_groupSessionID, a3);
    v18->_localParticipantID = a4;
    v18->_remoteParticipantID = a5;
    objc_storeStrong((id *)&v18->_salt, a6);
    v18->_connectionIndex = a8;
    v18->_dataMode = a7;
    v18->_socket = -1;
    v19 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [NSNumber numberWithUnsignedLongLong:a4];
      [NSNumber numberWithUnsignedLongLong:a5];
      v22 = id v21 = v15;
      *(_DWORD *)buf = 138412546;
      v51 = v20;
      __int16 v52 = 2112;
      v53 = v22;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Creating IDSGroupSessionUnicastParameter with local id %@ and remote id %@", buf, 0x16u);

      id v15 = v21;
    }

    switch(a7)
    {
      case 0:
        unsigned __int16 v23 = a8 - 25536;
        __int16 v24 = -20536;
        goto LABEL_12;
      case 1:
        __int16 v25 = 30000;
        goto LABEL_10;
      case 2:
        unsigned __int16 v23 = a8 - 15536;
        __int16 v24 = -10536;
        goto LABEL_12;
      case 3:
        unsigned __int16 v23 = a8 - 23536;
        __int16 v24 = -18536;
        goto LABEL_12;
      case 4:
        __int16 v25 = 32000;
LABEL_10:
        unsigned __int16 v23 = a8 + v25;
        unsigned __int16 v26 = v23;
        goto LABEL_13;
      case 5:
        unsigned __int16 v23 = a8 - 13536;
        __int16 v24 = -8536;
LABEL_12:
        unsigned __int16 v26 = a8 + v24;
LABEL_13:
        if (a4 <= a5) {
          unsigned __int16 v27 = v23;
        }
        else {
          unsigned __int16 v27 = v26;
        }
        if (a4 <= a5) {
          unsigned __int16 v23 = v26;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%d", v23);
        id v28 = objc_claimAutoreleasedReturnValue();
        nw_endpoint_t host = nw_endpoint_create_host("::", (const char *)[v28 UTF8String]);
        endpoint = v18->_endpoint;
        v18->_endpoint = (OS_nw_endpoint *)host;

        nw_parameters_t v31 = nw_parameters_create();
        parameters = v18->_parameters;
        v18->_parameters = (OS_nw_parameters *)v31;

        objc_msgSend(NSString, "stringWithFormat:", @"%d", v27);
        id v33 = objc_claimAutoreleasedReturnValue();
        nw_endpoint_t v34 = nw_endpoint_create_host("::", (const char *)[v33 UTF8String]);

        id v35 = objc_alloc_init(MEMORY[0x1E4F6B488]);
        [v35 setMultiplexer:@"groupsession"];
        [v35 setSessionID:v18->_groupSessionID];
        [v35 setParticipantID:v18->_remoteParticipantID];
        [v35 setSalt:v18->_salt];
        id v36 = [v35 stringRepresentation];
        [v36 UTF8String];
        nw_parameters_set_account_id();

        MEMORY[0x192FDFFD0](v18->_parameters, v34);
        nw_parameters_set_indefinite();
        xpc_object_t v37 = xpc_array_create(0, 0);
        xpc_object_t v38 = xpc_array_create(0, 0);
        id v39 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
        xpc_array_set_string(v37, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v39 UTF8String]);

        xpc_array_set_string(v38, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
        if ((unint64_t)a7 <= 5)
        {
          if (((1 << a7) & 9) == 0 && ((1 << a7) & 0x12) == 0)
          {
            v40 = nw_parameters_copy_default_protocol_stack((nw_parameters_t)v18->_parameters);
            v48 = v34;
            id v41 = v16;
            id v42 = v15;
            v43 = sub_19191D518();
            options = nw_framer_create_options(v43);
            nw_protocol_stack_prepend_application_protocol(v40, options);

            id v15 = v42;
            id v16 = v41;
            nw_endpoint_t v34 = v48;
          }
          nw_parameters_set_data_mode();
          nw_parameters_set_required_netagent_classes();
          if ((unint64_t)(a7 - 3) <= 2)
          {
            v45 = IDSRealTimeContext();
            nw_parameters_set_context();
          }
          goto LABEL_25;
        }

LABEL_28:
        v46 = 0;
        break;
      default:
        goto LABEL_28;
    }
  }
  else
  {
LABEL_25:
    v46 = v18;
  }

  return v46;
}

- (IDSGroupSessionUnicastParameter)initWithConnectedSocket:(int)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)IDSGroupSessionUnicastParameter;
  v8 = [(IDSGroupSessionUnicastParameter *)&v14 init];
  v9 = v8;
  if (v8)
  {
    groupSessionID = v8->_groupSessionID;
    v8->_groupSessionID = 0;

    *(_OWORD *)&v9->_localParticipantID = xmmword_191A52280;
    v9->_connectionIndex = a5;
    v9->_dataMode = a4;
    v9->_socket = a3;
    endpoint = v9->_endpoint;
    v9->_endpoint = 0;

    parameters = v9->_parameters;
    v9->_parameters = 0;
  }
  return v9;
}

- (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3
{
}

- (void)_requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3
{
  v10 = (void (**)(id, nw_connection_t, void *))a3;
  if ([(IDSGroupSessionUnicastParameter *)self socket] < 1)
  {
    v4 = [(IDSGroupSessionUnicastParameter *)self endpoint];
    v5 = [(IDSGroupSessionUnicastParameter *)self parameters];
    nw_connection_t v6 = nw_connection_create(v4, v5);

    if (v6)
    {
      v7 = 0;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", @"Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket.", *MEMORY[0x1E4F28568], 0);
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v9];
    }
    if (v10) {
      v10[2](v10, v6, v7);
    }
  }
  else
  {
    [(IDSGroupSessionUnicastParameter *)self _setUpNWConnectionforTesting:v10];
  }
}

- (void)_setUpNWConnectionforTesting:(id)a3
{
  v12 = (void (**)(id, void *, void *))a3;
  if ([(IDSGroupSessionUnicastParameter *)self dataMode]
    && [(IDSGroupSessionUnicastParameter *)self dataMode] != 1)
  {
    if ([(IDSGroupSessionUnicastParameter *)self dataMode] == 2)
    {
      secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
      v7 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      id v8 = sub_19191D518();
      options = nw_framer_create_options(v8);
      nw_protocol_stack_prepend_application_protocol(v7, options);

      [(IDSGroupSessionUnicastParameter *)self socket];
      v4 = (void *)nw_connection_create_with_connected_socket_and_parameters();

      if (v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
    [(IDSGroupSessionUnicastParameter *)self socket];
    v4 = (void *)nw_connection_create_with_connected_socket();
    if (v4)
    {
LABEL_4:
      v5 = 0;
      goto LABEL_8;
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", @"Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket.", *MEMORY[0x1E4F28568], 0);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v11];

  v4 = 0;
LABEL_8:
  if (v12) {
    v12[2](v12, v4, v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  groupSessionID = self->_groupSessionID;
  id v5 = a3;
  [v5 encodeObject:groupSessionID forKey:@"groupSessionID"];
  [v5 encodeInt64:self->_localParticipantID forKey:@"localParticipantID"];
  [v5 encodeInt64:self->_remoteParticipantID forKey:@"remoteParticipantID"];
  [v5 encodeObject:self->_salt forKey:@"salt"];
  [v5 encodeInt64:self->_connectionIndex forKey:@"connectionIndex"];
  [v5 encodeInt:LODWORD(self->_dataMode) forKey:@"dataMode"];
}

- (IDSGroupSessionUnicastParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupSessionID"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"localParticipantID"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"remoteParticipantID"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
  uint64_t v9 = [v4 decodeInt64ForKey:@"connectionIndex"];
  int v10 = [v4 decodeIntForKey:@"dataMode"];

  v11 = [(IDSGroupSessionUnicastParameter *)self initWithGroupSessionID:v5 localParticipantID:v6 remoteParticipantID:v7 salt:v8 dataMode:v10 connectionIndex:v9];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IDSGroupSessionUnicastParameter *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      groupSessionID = self->_groupSessionID;
      uint64_t v7 = [(IDSGroupSessionUnicastParameter *)v5 groupSessionID];
      if ([(NSString *)groupSessionID isEqual:v7]
        && (unint64_t localParticipantID = self->_localParticipantID,
            localParticipantID == [(IDSGroupSessionUnicastParameter *)v5 localParticipantID])
        && (unint64_t remoteParticipantID = self->_remoteParticipantID,
            remoteParticipantID == [(IDSGroupSessionUnicastParameter *)v5 remoteParticipantID])
        && (unint64_t connectionIndex = self->_connectionIndex,
            connectionIndex == [(IDSGroupSessionUnicastParameter *)v5 connectionIndex]))
      {
        int64_t dataMode = self->_dataMode;
        BOOL v12 = dataMode == [(IDSGroupSessionUnicastParameter *)v5 dataMode];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_dataMode + 32 * ([(NSString *)self->_groupSessionID hash] + 31);
  salt = self->_salt;
  unint64_t v5 = self->_remoteParticipantID + 32 * (self->_localParticipantID + 32 * (self->_connectionIndex + 32 * v3));
  return [(NSData *)salt hash] + 32 * v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSGroupSessionUnicastParameter alloc];
  groupSessionID = self->_groupSessionID;
  unint64_t localParticipantID = self->_localParticipantID;
  unint64_t remoteParticipantID = self->_remoteParticipantID;
  salt = self->_salt;
  unint64_t connectionIndex = self->_connectionIndex;
  int64_t dataMode = self->_dataMode;

  return [(IDSGroupSessionUnicastParameter *)v4 initWithGroupSessionID:groupSessionID localParticipantID:localParticipantID remoteParticipantID:remoteParticipantID salt:salt dataMode:dataMode connectionIndex:connectionIndex];
}

- (NSString)groupSessionID
{
  return self->_groupSessionID;
}

- (unint64_t)localParticipantID
{
  return self->_localParticipantID;
}

- (unint64_t)remoteParticipantID
{
  return self->_remoteParticipantID;
}

- (NSData)salt
{
  return self->_salt;
}

- (unint64_t)connectionIndex
{
  return self->_connectionIndex;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_salt, 0);

  objc_storeStrong((id *)&self->_groupSessionID, 0);
}

@end
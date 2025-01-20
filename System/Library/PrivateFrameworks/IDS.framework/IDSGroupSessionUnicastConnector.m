@interface IDSGroupSessionUnicastConnector
+ (BOOL)supportsSecureCoding;
+ (id)extractDictionaryFromDataBlobFrom:(id)a3 error:(id *)a4;
+ (void)requestNWConnectionToVirtualParticipant:(unint64_t)a3 forSession:(id)a4 completionHandler:(id)a5;
+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (IDSGroupSessionUnicastConnector)initWithCoder:(id)a3;
- (IDSGroupSessionUnicastConnector)initWithGroupSessionID:(id)a3 participantID:(unint64_t)a4 dataMode:(int64_t)a5;
- (IDSGroupSessionUnicastConnector)initWithGroupSessionIDAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 dataMode:(int64_t)a6;
- (NSData)salt;
- (NSString)groupSessionIDAlias;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)cachedConnection;
- (id)connectionReadyCallback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDataBlobFrom:(id)a3 port:(unsigned __int16)a4;
- (int64_t)dataMode;
- (unint64_t)hash;
- (unint64_t)participantIDAlias;
- (void)encodeWithCoder:(id)a3;
- (void)listenForIncomingConnection:(id)a3;
- (void)requestDataBlob:(id)a3;
- (void)setCachedConnection:(id)a3;
- (void)setConnectionReadyCallback:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSalt:(id)a3;
@end

@implementation IDSGroupSessionUnicastConnector

- (IDSGroupSessionUnicastConnector)initWithGroupSessionID:(id)a3 participantID:(unint64_t)a4 dataMode:(int64_t)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  id v9 = a3;
  v10 = [v8 data];
  v11 = [(IDSGroupSessionUnicastConnector *)self initWithGroupSessionIDAlias:v9 participantIDAlias:a4 salt:v10 dataMode:a5];

  return v11;
}

- (IDSGroupSessionUnicastConnector)initWithGroupSessionIDAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 dataMode:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSGroupSessionUnicastConnector;
  v12 = [(IDSGroupSessionUnicastConnector *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    groupSessionIDAlias = v12->_groupSessionIDAlias;
    v12->_groupSessionIDAlias = (NSString *)v13;

    v12->_participantIDAlias = a4;
    uint64_t v15 = [v11 copy];
    salt = v12->_salt;
    v12->_salt = (NSData *)v15;

    id connectionReadyCallback = v12->_connectionReadyCallback;
    v12->_dataMode = a6;
    v12->_id connectionReadyCallback = 0;

    cachedConnection = v12->_cachedConnection;
    v12->_cachedConnection = 0;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("IDSGroupSessionUnicastConnector", v19);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v20;
  }
  return v12;
}

- (id)createDataBlobFrom:(id)a3 port:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = NSString;
  unint64_t participantIDAlias = self->_participantIDAlias;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "stringWithFormat:", @"%llu", participantIDAlias);
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = (void *)[v8 copy];

  v12 = [NSNumber numberWithUnsignedShort:v4];
  groupSessionIDAlias = self->_groupSessionIDAlias;
  salt = self->_salt;
  uint64_t v15 = [NSNumber numberWithInteger:self->_dataMode];
  v16 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"psk", v12, @"listeningPort", groupSessionIDAlias, @"groupSessionIDAlias", v9, @"participantIDAlias", salt, @"salt", v15, @"dataMode", 0);

  v17 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "createDataBlobFrom: encoded %@", buf, 0xCu);
  }

  v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];

  return v18;
}

+ (id)extractDictionaryFromDataBlobFrom:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28DC0];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v12 = [v6 _strictlyUnarchivedObjectOfClasses:v11 fromData:v5 error:a4];

  if (v12)
  {
    uint64_t v13 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v12;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "extractDictionaryFromDataBlobFrom: decoded %@", buf, 0xCu);
    }

    v14 = [v12 objectForKeyedSubscript:@"psk"];
    BOOL v15 = [v14 length] == 32;

    if (!v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", @"PreSharedKey has Unexpected size.", *MEMORY[0x1E4F28568], 0);
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v17];

      v12 = 0;
    }
  }

  return v12;
}

- (void)requestDataBlob:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = nw_parameters_create();
  xpc_object_t v6 = xpc_array_create(0, 0);
  xpc_object_t v7 = xpc_array_create(0, 0);
  id v8 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
  xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v8 UTF8String]);

  xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
  nw_parameters_set_required_netagent_classes();
  unint64_t dataMode = self->_dataMode;
  if (dataMode > 5)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v32 = objc_msgSend(v31, "initWithObjectsAndKeys:", @"Unknown parameter", *MEMORY[0x1E4F28568], 0);
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v32];
    v4[2](v4, 0, v33);
  }
  else
  {
    if (((1 << dataMode) & 9) == 0 && ((1 << dataMode) & 0x12) == 0)
    {
      uint64_t v10 = nw_parameters_copy_default_protocol_stack(v5);
      id v11 = sub_19191D518();
      options = nw_framer_create_options(v11);
      nw_protocol_stack_prepend_application_protocol(v10, options);

      unint64_t dataMode = self->_dataMode;
    }
    if (dataMode - 3 <= 2)
    {
      uint64_t v13 = IDSRealTimeContext();
      nw_parameters_set_context();
    }
    nw_parameters_set_data_mode();
    id v14 = objc_alloc_init(MEMORY[0x1E4F6B488]);
    [v14 setMultiplexer:@"groupsession"];
    [v14 setSessionID:self->_groupSessionIDAlias];
    [v14 setSalt:self->_salt];
    id v15 = [v14 stringRepresentation];
    [v15 UTF8String];
    nw_parameters_set_account_id();

    id v16 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    v17 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    id v18 = v16;
    if (SecRandomCopyBytes(v17, 0x20uLL, (void *)[v18 mutableBytes]))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      dispatch_queue_t v20 = objc_msgSend(v19, "initWithObjectsAndKeys:", @"Unable to create PSK.", *MEMORY[0x1E4F28568], 0);
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v20];
      v4[2](v4, 0, v21);
    }
    else
    {
      nw_protocol_stack_t v34 = nw_parameters_copy_default_protocol_stack(v5);
      nw_protocol_options_t v22 = nw_tls_create_options();
      parameters = v5;
      objc_super v23 = v22;
      id v35 = v18;
      xpc_object_t v24 = v7;
      xpc_object_t v25 = v6;
      v26 = v4;
      v27 = dispatch_data_create((const void *)[v35 bytes], 0x20uLL, 0, 0);
      v28 = dispatch_data_create("IDSToolTestOnlyPSKIdentity", 0x1AuLL, 0, 0);
      sec_protocol_options_add_pre_shared_key(v23, v27, v28);

      uint64_t v4 = v26;
      xpc_object_t v6 = v25;
      xpc_object_t v7 = v24;
      nw_protocol_stack_append_application_protocol();
      v29 = nw_listener_create_with_port("0", parameters);
      nw_listener_set_queue(v29, (dispatch_queue_t)self->_queue);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_19199FD60;
      handler[3] = &unk_1E572BAD0;
      v39 = v29;
      v40 = self;
      id v41 = v35;
      v42 = v4;
      v30 = v29;
      nw_listener_set_state_changed_handler(v30, handler);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_19199FF4C;
      v37[3] = &unk_1E572BAF8;
      v37[4] = self;
      nw_listener_set_new_connection_handler(v30, v37);
      nw_listener_start(v30);

      id v5 = parameters;
    }
  }
}

- (void)listenForIncomingConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919A005C;
  v7[3] = &unk_1E5729230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void, id))a4;
  id v57 = 0;
  id v6 = +[IDSGroupSessionUnicastConnector extractDictionaryFromDataBlobFrom:a3 error:&v57];
  id v7 = v57;
  if (v7) {
    v5[2](v5, 0, v7);
  }
  id v53 = v5;
  uint64_t v55 = [v6 objectForKeyedSubscript:@"groupSessionIDAlias"];
  id v8 = [v6 objectForKeyedSubscript:@"participantIDAlias"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"salt"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"dataMode"];
  unint64_t v11 = [v10 integerValue];

  id v54 = [v6 objectForKeyedSubscript:@"psk"];
  v12 = [v6 objectForKeyedSubscript:@"listeningPort"];
  unsigned __int16 v48 = [v12 integerValue];

  uint64_t v13 = nw_parameters_create();
  xpc_object_t v14 = xpc_array_create(0, 0);
  xpc_object_t v15 = xpc_array_create(0, 0);
  id v16 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
  xpc_array_set_string(v14, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v16 UTF8String]);

  xpc_array_set_string(v15, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
  v50 = v15;
  v51 = v14;
  nw_parameters_set_required_netagent_classes();
  v52 = (void *)v9;
  if (v11 > 5)
  {
    id v44 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v23 = (id)objc_msgSend(v44, "initWithObjectsAndKeys:", @"Unknown parameter", *MEMORY[0x1E4F28568], 0);
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v23];
    v37 = (void (**)(void, void, void))v53;
    (*((void (**)(id, void, void *))v53 + 2))(v53, 0, v43);
    id v41 = v54;
    v42 = (void *)v55;
  }
  else
  {
    if (((1 << v11) & 9) == 0 && ((1 << v11) & 0x12) == 0)
    {
      v17 = nw_parameters_copy_default_protocol_stack(v13);
      id v18 = sub_19191D518();
      uint64_t v19 = v9;
      dispatch_queue_t v20 = v8;
      options = nw_framer_create_options(v18);
      nw_protocol_stack_prepend_application_protocol(v17, options);

      id v8 = v20;
      uint64_t v9 = v19;
    }
    if (v11 - 3 <= 2)
    {
      nw_protocol_options_t v22 = IDSRealTimeContext();
      nw_parameters_set_context();
    }
    id v46 = v7;
    v47 = v6;
    nw_parameters_set_data_mode();
    id v23 = objc_alloc_init(MEMORY[0x1E4F6B488]);
    [v23 setMultiplexer:@"groupsession"];
    [v23 setSessionID:v55];
    [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    v45 = uint64_t v56 = 0;
    [v45 scanUnsignedLongLong:&v56];
    [v23 setParticipantID:v56];
    xpc_object_t v24 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v23 participantID];
      *(_DWORD *)buf = 134218242;
      uint64_t v59 = v25;
      __int16 v60 = 2112;
      v61 = v8;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "requestNWConnectionWithDataBlob: decoded participantIDAlias %llu from %@", buf, 0x16u);
    }

    [v23 setSalt:v9];
    id v26 = [v23 stringRepresentation];
    [v26 UTF8String];
    nw_parameters_set_account_id();

    objc_msgSend(NSString, "stringWithFormat:", @"%d", v48);
    id v27 = objc_claimAutoreleasedReturnValue();
    host = nw_endpoint_create_host("::", (const char *)[v27 UTF8String]);

    objc_msgSend(NSString, "stringWithFormat:", @"%d", v48 + 1);
    id v29 = objc_claimAutoreleasedReturnValue();
    nw_endpoint_t v30 = nw_endpoint_create_host("::", (const char *)[v29 UTF8String]);

    nw_endpoint_t v49 = v30;
    MEMORY[0x192FDFFD0](v13, v30);
    nw_protocol_stack_t v31 = nw_parameters_copy_default_protocol_stack(v13);
    nw_protocol_options_t v32 = nw_tls_create_options();
    v33 = v32;
    nw_protocol_stack_t v34 = dispatch_data_create((const void *)[v54 bytes], 0x20uLL, 0, 0);
    id v35 = dispatch_data_create("IDSToolTestOnlyPSKIdentity", 0x1AuLL, 0, 0);
    sec_protocol_options_add_pre_shared_key(v33, v34, v35);

    nw_protocol_stack_append_application_protocol();
    nw_connection_t v36 = nw_connection_create(host, v13);
    v37 = (void (**)(void, void, void))v53;
    (*((void (**)(id, nw_connection_t, void))v53 + 2))(v53, v36, 0);
    v38 = 0;
    if (!v36)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v40 = objc_msgSend(v39, "initWithObjectsAndKeys:", @"Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket.", *MEMORY[0x1E4F28568], 0);
      v38 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v40];

      v37 = (void (**)(void, void, void))v53;
    }
    ((void (**)(void, nw_connection_t, void *))v37)[2](v37, v36, v38);

    id v7 = v46;
    id v6 = v47;
    id v41 = v54;
    v42 = (void *)v55;
    v43 = v45;
  }
}

+ (void)requestNWConnectionToVirtualParticipant:(unint64_t)a3 forSession:(id)a4 completionHandler:(id)a5
{
  nw_protocol_options_t v22 = (void (**)(id, nw_connection_t, void *))a5;
  id v7 = a4;
  quic_stream = nw_parameters_create_quic_stream();
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v10 = xpc_array_create(0, 0);
  id v11 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
  xpc_array_set_string(v9, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v11 UTF8String]);

  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
  nw_parameters_set_required_netagent_classes();
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  uint64_t v13 = [NSString stringWithFormat:@"groupsession:%@:ids:%@:L", v7, v12];

  id v14 = v13;
  [v14 UTF8String];
  nw_parameters_set_account_id();
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3030);
  id v15 = objc_claimAutoreleasedReturnValue();
  host = nw_endpoint_create_host("::", (const char *)[v15 UTF8String]);

  nw_endpoint_t v17 = nw_endpoint_create_host("::", "0");
  MEMORY[0x192FDFFD0](quic_stream, v17);
  nw_connection_t v18 = nw_connection_create(host, quic_stream);
  uint64_t v19 = 0;
  if (!v18)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v21 = objc_msgSend(v20, "initWithObjectsAndKeys:", @"Unable to create connection to the virtual participant.", *MEMORY[0x1E4F28568], 0);
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:42 userInfo:v21];
  }
  if (v22) {
    v22[2](v22, v18, v19);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IDSGroupSessionUnicastConnector *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(IDSGroupSessionUnicastConnector *)v5 groupSessionIDAlias];
      id v7 = [(IDSGroupSessionUnicastConnector *)self groupSessionIDAlias];
      int v8 = [v6 isEqual:v7];

      if (v8
        && (uint64_t v9 = [(IDSGroupSessionUnicastConnector *)v5 participantIDAlias],
            v9 == [(IDSGroupSessionUnicastConnector *)self participantIDAlias]))
      {
        uint64_t v10 = [(IDSGroupSessionUnicastConnector *)v5 dataMode];
        BOOL v11 = v10 == [(IDSGroupSessionUnicastConnector *)self dataMode];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(IDSGroupSessionUnicastConnector *)self groupSessionIDAlias];
  uint64_t v4 = [v3 hash];
  id v5 = [(IDSGroupSessionUnicastConnector *)self salt];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(IDSGroupSessionUnicastConnector *)self participantIDAlias];
  unint64_t v8 = v6 ^ ([(IDSGroupSessionUnicastConnector *)self dataMode] + v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  groupSessionIDAlias = self->_groupSessionIDAlias;
  id v5 = a3;
  [v5 encodeObject:groupSessionIDAlias forKey:@"groupSessionIDAlias"];
  [v5 encodeInt64:self->_participantIDAlias forKey:@"participantIDAlias"];
  [v5 encodeObject:self->_salt forKey:@"salt"];
  [v5 encodeInt:LODWORD(self->_dataMode) forKey:@"dataMode"];
}

- (IDSGroupSessionUnicastConnector)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupSessionIDAlias"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"participantIDAlias"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
  int v8 = [v4 decodeIntForKey:@"dataMode"];

  uint64_t v9 = [(IDSGroupSessionUnicastConnector *)self initWithGroupSessionIDAlias:v5 participantIDAlias:v6 salt:v7 dataMode:v8];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSGroupSessionUnicastConnector alloc];
  groupSessionIDAlias = self->_groupSessionIDAlias;
  unint64_t participantIDAlias = self->_participantIDAlias;
  salt = self->_salt;
  int64_t dataMode = self->_dataMode;

  return [(IDSGroupSessionUnicastConnector *)v4 initWithGroupSessionIDAlias:groupSessionIDAlias participantIDAlias:participantIDAlias salt:salt dataMode:dataMode];
}

- (NSString)groupSessionIDAlias
{
  return self->_groupSessionIDAlias;
}

- (unint64_t)participantIDAlias
{
  return self->_participantIDAlias;
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (id)connectionReadyCallback
{
  return self->_connectionReadyCallback;
}

- (void)setConnectionReadyCallback:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_nw_connection)cachedConnection
{
  return self->_cachedConnection;
}

- (void)setCachedConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_connectionReadyCallback, 0);
  objc_storeStrong((id *)&self->_salt, 0);

  objc_storeStrong((id *)&self->_groupSessionIDAlias, 0);
}

@end
@interface GEOXPCReply
- (GEOXPCReply)init;
- (GEOXPCReply)initWithReplyObject:(id)a3;
- (GEOXPCReply)initWithRequest:(id)a3;
- (GEOXPCReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)description;
- (OS_xpc_object)object;
- (OS_xpc_object)replyDictionary;
- (unsigned)flags;
- (void)encodeToXPCDictionary:(id)a3;
- (void)send;
- (void)setError:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation GEOXPCReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_peerBundleId, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

- (NSError)error
{
  return self->_error;
}

- (void)send
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((self->_flags & 2) != 0
    && [(GEOXPCReply *)self conformsToProtocol:&unk_1ED7477F0]
    && [(GEOXPCReply *)self isValid])
  {
    v3 = [(GEOXPCReply *)self replyDictionary];
    if (v3)
    {
      GEOEncodeModernXPCMessage(self, v3);
      xpc_dictionary_get_remote_connection(v3);
      v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        xpc_connection_send_message(v4, v3);
        if (self->_signpostId != -1)
        {
          v6 = GEOGetGEODaemonLog();
          v7 = v6;
          os_signpost_id_t signpostId = self->_signpostId;
          if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
          {
            peerBundleId = self->_peerBundleId;
            serviceName = self->_serviceName;
            methodName = self->_methodName;
            int v12 = 138412802;
            v13 = peerBundleId;
            __int16 v14 = 2112;
            v15 = serviceName;
            __int16 v16 = 2112;
            v17 = methodName;
            _os_signpost_emit_with_name_impl(&dword_188D96000, v7, OS_SIGNPOST_INTERVAL_END, signpostId, "HandleRequest", "type=xpc_message,peer=%@,message=%@.%@", (uint8_t *)&v12, 0x20u);
          }
        }
      }
    }
  }
}

- (OS_xpc_object)replyDictionary
{
  if ((self->_flags & 2) != 0) {
    v2 = self->_object;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if ((self->_flags & 2) != 0)
  {
    error = self->_error;
    if (error)
    {
      v5 = (void *)MEMORY[0x1E4F28DB0];
      v6 = _geo_NSErrorXPCSafeRepresentationCopy(error);
      v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

      id v8 = v7;
      xpc_dictionary_set_data(xdict, "__error", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    }
  }
}

- (GEOXPCReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GEOXPCReply;
  v7 = [(GEOXPCReply *)&v42 init];
  p_isa = (id *)&v7->super.isa;
  if (!v7) {
    goto LABEL_17;
  }
  v7->_flags = 1;
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "__error", &length);
  if (!data) {
    goto LABEL_16;
  }
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  v11 = (void *)MEMORY[0x1E4F28DC0];
  int v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  __int16 v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  uint64_t v15 = [v11 unarchivedObjectOfClasses:v14 fromData:v10 error:a4];
  id v16 = p_isa[3];
  p_isa[3] = (id)v15;

  id v17 = p_isa[3];
  if ([v17 code] == -3)
  {
    uint64_t v18 = [v17 domain];
    v19 = GEOErrorDomain();
    int v20 = [v18 isEqual:v19];

    if (v20)
    {
      v21 = [v17 userInfo];
      v22 = [v21 objectForKeyedSubscript:@"requestKind"];

      unsigned int v23 = [v22 intValue];
      unsigned int v24 = (v23 >> 8) & 0x7F;
      if (v24 > 0xB || ((1 << v24) & 0xC05) == 0 || v23 != 1)
      {
        v25 = [v17 userInfo];
        v26 = [v25 objectForKeyedSubscript:@"details"];
        v27 = [v26 firstObject];

        if ([v27 count])
        {
          v28 = [v27 objectForKeyedSubscript:@"maxRequests"];
          uint64_t v29 = [v28 unsignedIntValue];

          v30 = [v27 objectForKeyedSubscript:@"windowSize"];
          uint64_t v31 = [v30 unsignedIntValue];

          v32 = [v27 objectForKeyedSubscript:@"timeUntilReset"];
          uint64_t v33 = [v32 unsignedIntValue];

          v34 = [NSString stringWithFormat:@"Tried to make more than %u requests in %u seconds, will reset in %u seconds", v29, v31, v33];
        }
        else
        {
          v34 = @"No details found";
        }
        v35 = [v17 userInfo];
        v36 = [v35 objectForKeyedSubscript:@"requestKindString"];

        v37 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v36;
          __int16 v45 = 2112;
          v46 = v34;
          __int16 v47 = 2112;
          id v48 = v17;
          _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_FAULT, "Throttled \"%@\" request: %@ - %@", buf, 0x20u);
        }
      }
    }
  }

  id v38 = p_isa[3];
  if (v38) {
LABEL_16:
  }
    v39 = p_isa;
  else {
LABEL_17:
  }
    v39 = 0;

  return v39;
}

- (void)setError:(id)a3
{
}

- (GEOXPCReply)initWithRequest:(id)a3
{
  v4 = (xpc_object_t *)a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOXPCReply;
  v5 = [(GEOXPCReply *)&v18 init];
  id v6 = v5;
  if (v5)
  {
    v5->_flags = 2;
    if (v4 && ((_BYTE)v4[1] & 2) != 0) {
      reply = (OS_xpc_object *)xpc_dictionary_create_reply(v4[2]);
    }
    else {
      reply = 0;
    }
    object = v6->_object;
    v6->_object = reply;

    uint64_t v9 = [(xpc_object_t *)v4 signpostId];
    v6->_os_signpost_id_t signpostId = v9;
    if (v9 != -1)
    {
      v10 = [(xpc_object_t *)v4 peer];
      uint64_t v11 = [v10 bundleIdentifier];
      peerBundleId = v6->_peerBundleId;
      v6->_peerBundleId = (NSString *)v11;

      uint64_t v13 = [(xpc_object_t *)v4 service];
      serviceName = v6->_serviceName;
      v6->_serviceName = (NSString *)v13;

      uint64_t v15 = [(xpc_object_t *)v4 method];
      methodName = v6->_methodName;
      v6->_methodName = (NSString *)v15;
    }
  }

  return v6;
}

- (GEOXPCReply)init
{
  result = (GEOXPCReply *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOXPCReply)initWithReplyObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOXPCReply;
  id v6 = [(GEOXPCReply *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_flags = 2;
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p {flags: 0x%x object: %@ error: %@}>", v5, self, self->_flags, self->_object, self->_error];

  return (NSString *)v6;
}

- (OS_xpc_object)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

@end
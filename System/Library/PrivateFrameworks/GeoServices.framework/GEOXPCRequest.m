@interface GEOXPCRequest
+ (BOOL)reportsProgress;
- (GEOApplicationAuditToken)preferredAuditToken;
- (GEODataRequestThrottlerToken)throttleToken;
- (GEOMapServiceTraits)traits;
- (GEOPeer)peer;
- (GEOXPCRequest)init;
- (GEOXPCRequest)initWithMessage:(id)a3 traits:(id)a4 auditToken:(id)a5 throttleToken:(id)a6;
- (GEOXPCRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)description;
- (NSString)method;
- (NSString)service;
- (id)_createConnectionWithQueue:(id)a1;
- (id)_prepareRequest;
- (id)sendSync:(id)a3 error:(id *)a4;
- (unint64_t)signpostId;
- (void)encodeToXPCDictionary:(id)a3;
- (void)send:(id)a3;
- (void)send:(id)a3 withReply:(id)a4 handler:(id)a5;
- (void)setMethod:(id)a3;
- (void)setPeer:(id)a3;
- (void)setService:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
@end

@implementation GEOXPCRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
  objc_storeStrong((id *)&self->_progressToMirrorOverXPC, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void)setService:(id)a3
{
}

- (void)setMethod:(id)a3
{
}

- (GEOApplicationAuditToken)preferredAuditToken
{
  return self->_preferredAuditToken;
}

- (void)setPeer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_peer, a3);
  if (!self->_preferredAuditToken)
  {
LABEL_6:
    v9 = [v5 auditToken];
    preferredAuditToken = self->_preferredAuditToken;
    self->_preferredAuditToken = v9;

    goto LABEL_7;
  }
  if (![(GEOPeer *)self->_peer hasEntitlement:@"com.apple.private.network.socket-delegate"])
  {
    v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      peer = self->_peer;
      v8 = self->_preferredAuditToken;
      int v11 = 138543875;
      v12 = peer;
      __int16 v13 = 2113;
      v14 = @"com.apple.private.network.socket-delegate";
      __int16 v15 = 2113;
      v16 = v8;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "peer %{public}@ is missing entitlement \"%{private}@\"; will not attribute to \"%{private}@\"",
        (uint8_t *)&v11,
        0x20u);
    }

    goto LABEL_6;
  }
LABEL_7:
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (id)sendSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(GEOXPCRequest *)self conformsToProtocol:&unk_1ED7475A8])
  {
    if ([(GEOXPCRequest *)self reply])
    {
      v7 = (objc_class *)[(id)objc_opt_class() replyClass];
      if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
      {
        if ([(objc_class *)v7 conformsToProtocol:&unk_1ED7477F0])
        {
          v8 = -[GEOXPCRequest _prepareRequest]((uint64_t)self);
          GEOSetThrottleToken(v8, self->_throttleToken, 0);
          if (!v6)
          {
            -[GEOXPCRequest _createConnectionWithQueue:](self, 0);
            id v6 = (id)objc_claimAutoreleasedReturnValue();
          }
          v9 = [v6 sendMessageWithReplySync:v8];
          if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
          {
            id v21 = 0;
            __int16 v13 = GEODecodeModernXPCMessage(v9, v7, (uint64_t)&v21);
            id v14 = v21;
            uint64_t v15 = [v13 error];
            v16 = (void *)v15;
            if (v15) {
              uint64_t v17 = (void *)v15;
            }
            else {
              uint64_t v17 = v14;
            }
            id v18 = v17;

            if (!a4) {
              goto LABEL_19;
            }
          }
          else
          {
            v10 = GEOXPCErrorFromReply(v9);
            int v11 = v10;
            if (v10)
            {
              id v12 = v10;
            }
            else
            {
              id v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unexpected response from geod"];
            }
            id v18 = v12;

            __int16 v13 = 0;
            if (!a4) {
              goto LABEL_19;
            }
          }
          if (v18)
          {
            id v19 = 0;
            *a4 = v18;
LABEL_20:

            goto LABEL_21;
          }
LABEL_19:
          id v19 = v13;
          goto LABEL_20;
        }
      }
    }
  }
  id v19 = 0;
LABEL_21:

  return v19;
}

- (void)send:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(GEOXPCRequest *)self conformsToProtocol:&unk_1ED7475A8])
  {
    if ([(GEOXPCRequest *)self reply] == 1)
    {
      id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        service = self->_service;
        method = self->_method;
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        int v11 = 138412802;
        id v12 = service;
        __int16 v13 = 2112;
        id v14 = method;
        __int16 v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Request %@.%@ %@ expects reply but sending without reply handler", (uint8_t *)&v11, 0x20u);
      }
    }
    v10 = -[GEOXPCRequest _prepareRequest]((uint64_t)self);
    GEOSetThrottleToken(v10, self->_throttleToken, 0);
    if (!v4)
    {
      -[GEOXPCRequest _createConnectionWithQueue:](self, 0);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v4 sendMessage:v10];
  }
}

- (id)_prepareRequest
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a1
    && (*(unsigned char *)(a1 + 8) & 1) != 0
    && [(id)a1 conformsToProtocol:&unk_1ED7475A8]
    && [(id)a1 isValid])
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    GEOEncodeModernXPCMessage((void *)a1, v2);
    if ([(id)objc_opt_class() reportsProgress])
    {
      v3 = [MEMORY[0x1E4F28F90] currentProgress];

      if (v3)
      {
        id v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
        id v12 = 0;
        id v5 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_mirroredProgressForReceivingOverXPC:", &v12);
        id v6 = v12;
        [v4 addChild:v5 withPendingUnitCount:1];

        if (v6)
        {
          xpc_dictionary_set_value(v2, "progress_observer_endpoint", v6);
        }
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    v13[0] = *(void *)(a1 + 32);
    v13[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v9 = [v8 componentsJoinedByString:@"."];

    id v10 = v9;
    xpc_dictionary_set_string(v2, "message", (const char *)[v10 UTF8String]);
  }
  else
  {
    xpc_object_t v2 = 0;
  }

  return v2;
}

+ (BOOL)reportsProgress
{
  return 0;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (self->_flags)
  {
    traits = self->_traits;
    if (traits)
    {
      id v5 = [(GEOMapServiceTraits *)traits data];
      xpc_dictionary_set_data(xdict, "__traits", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
    }
    if (self->_preferredAuditToken)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      [(GEOApplicationAuditToken *)self->_preferredAuditToken encodeToXPCDictionary:v6];
      xpc_dictionary_set_value(xdict, "__audit_token", v6);
    }
  }
}

- (GEOXPCRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOXPCRequest;
  xpc_object_t v6 = [(GEOXPCRequest *)&v18 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_signpostId = -1;
    v6->_flags = 2;
    size_t length = 0;
    data = xpc_dictionary_get_data(v5, "__traits", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      id v10 = [[GEOMapServiceTraits alloc] initWithData:v9];
      traits = v7->_traits;
      v7->_traits = v10;
    }
    id v12 = xpc_dictionary_get_dictionary(v5, "__audit_token");
    if (v12)
    {
      __int16 v13 = [[GEOApplicationAuditToken alloc] initWithXPCDictionary:v12 error:0];
      preferredAuditToken = v7->_preferredAuditToken;
      v7->_preferredAuditToken = v13;
    }
    __int16 v15 = v7;
  }
  return v7;
}

- (GEOXPCRequest)initWithMessage:(id)a3 traits:(id)a4 auditToken:(id)a5 throttleToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOXPCRequest;
  id v14 = [(GEOXPCRequest *)&v24 init];
  if (v14)
  {
    __int16 v15 = [v10 componentsSeparatedByString:@"."];
    if ([v15 count] != 2)
    {

      v22 = 0;
      goto LABEL_5;
    }
    v14->_signpostId = -1;
    v14->_flags = 1;
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];
    service = v14->_service;
    v14->_service = (NSString *)v16;

    uint64_t v18 = [v15 objectAtIndexedSubscript:1];
    method = v14->_method;
    v14->_method = (NSString *)v18;

    objc_storeStrong((id *)&v14->_traits, a4);
    objc_storeStrong((id *)&v14->_preferredAuditToken, a5);
    objc_storeStrong((id *)&v14->_throttleToken, a6);
    v20 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    object = v14->_object;
    v14->_object = v20;
  }
  v22 = v14;
LABEL_5:

  return v22;
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (void)send:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  if (([(GEOXPCRequest *)self conformsToProtocol:&unk_1ED7475A8] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v31 = v10;
    dispatch_async(v9, block);
    id v13 = v31;
    goto LABEL_10;
  }
  if (![(GEOXPCRequest *)self reply])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_2;
    v28[3] = &unk_1E53DA028;
    id v29 = v10;
    dispatch_async(v9, v28);
    id v13 = v29;
    goto LABEL_10;
  }
  id v11 = (void *)[(id)objc_opt_class() replyClass];
  if (([v11 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_3;
    v26[3] = &unk_1E53DA028;
    id v27 = v10;
    dispatch_async(v9, v26);
    id v13 = v27;
    goto LABEL_10;
  }
  if (([v11 conformsToProtocol:&unk_1ED7477F0] & 1) == 0)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_4;
    v24[3] = &unk_1E53DA028;
    id v25 = v10;
    dispatch_async(v9, v24);
    id v13 = v25;
    goto LABEL_10;
  }
  id v12 = -[GEOXPCRequest _prepareRequest]((uint64_t)self);
  id v13 = v12;
  if (!v12)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_5;
    v22[3] = &unk_1E53DA028;
    id v14 = &v23;
    id v23 = v10;
    __int16 v15 = v22;
LABEL_17:
    dispatch_async(v9, v15);
    goto LABEL_9;
  }
  GEOSetThrottleToken(v12, self->_throttleToken, 0);
  if (!v8)
  {
    -[GEOXPCRequest _createConnectionWithQueue:](self, v9);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_6;
      v20[3] = &unk_1E53DA028;
      id v14 = &v21;
      id v21 = v10;
      __int16 v15 = v20;
      goto LABEL_17;
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_7;
  v16[3] = &unk_1E53E1428;
  id v14 = &v17;
  id v8 = v8;
  id v17 = v8;
  id v19 = v11;
  id v18 = v10;
  [v8 sendMessage:v13 withReply:v9 handler:v16];

LABEL_9:
LABEL_10:
}

- (id)_createConnectionWithQueue:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = GEOXPCServerTypeForIdentifier();
    id v5 = (objc_class *)objc_opt_class();
    xpc_object_t v6 = NSStringFromClass(v5);
    id v2 = +[GEOXPCConnection createServerConnectionFor:v4 debugIdentifier:v6 queue:v3 eventHandler:0];
  }

  return v2;
}

- (GEOPeer)peer
{
  return self->_peer;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (NSString)method
{
  return self->_method;
}

- (NSString)service
{
  return self->_service;
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
  {
    id v8 = *(objc_class **)(a1 + 48);
    id v15 = 0;
    v9 = GEODecodeModernXPCMessage(v5, v8, (uint64_t)&v15);

    id v10 = v15;
    uint64_t v11 = [v9 error];
    id v12 = (void *)v11;
    if (v11) {
      id v13 = (void *)v11;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
  }
  else
  {
    xpc_object_t v6 = GEOXPCErrorFromReply(v5);

    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unexpected response from geod"];
    }
    id v14 = v7;

    v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (GEOXPCRequest)init
{
  result = (GEOXPCRequest *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-301];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  xpc_object_t v6 = [v3 stringWithFormat:@"<%@: %p {flags: 0x%x service: %@ method: %@ peer: %@ token: %@ object: %@ error: %@}>", v5, self, self->_flags, self->_service, self->_method, self->_peer, self->_preferredAuditToken, self->_object, self->_error];

  return (NSString *)v6;
}

@end
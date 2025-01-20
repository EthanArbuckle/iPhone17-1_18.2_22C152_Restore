@interface GEOMessage
- (GEOApplicationAuditToken)preferredAuditToken;
- (GEODataRequestThrottlerToken)throttleToken;
- (GEOMessage)init;
- (GEOMessage)initWithXPCMessage:(id)a3 peer:(id)a4;
- (GEOPeer)peer;
- (NSDictionary)userInfo;
- (NSString)messageName;
- (unint64_t)signpostId;
- (void)_endSignpost;
- (void)sendReply:(id)a3;
- (void)sendReplyWithXPCUserInfo:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
@end

@implementation GEOMessage

- (void)sendReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_dictionary_get_remote_connection(self->_xpcMessage);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = (OS_xpc_object *)xpc_dictionary_create_reply(self->_xpcMessage);
  BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (reply)
  {
    if (v7)
    {
      xpcMessage = self->_xpcMessage;
      int v11 = 134218240;
      v12 = reply;
      __int16 v13 = 2048;
      v14 = xpcMessage;
      _os_log_debug_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned %p. %p", (uint8_t *)&v11, 0x16u);
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (v4)
    {
LABEL_4:
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v8) {
        xpc_dictionary_set_value(reply, "userInfo", v8);
      }
    }
    xpc_connection_send_message(v5, reply);
    [(GEOMessage *)self _endSignpost];
    goto LABEL_10;
  }
  if (v7)
  {
    v10 = self->_xpcMessage;
    int v11 = 134217984;
    v12 = v10;
    _os_log_debug_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned NULL. %p", (uint8_t *)&v11, 0xCu);
  }
LABEL_10:
}

- (void)_endSignpost
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_signpostId != -1)
  {
    v3 = GEOGetGEODaemonLog();
    id v4 = v3;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      v6 = [(GEOPeer *)self->_peer bundleIdentifier];
      messageName = self->_messageName;
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      int v11 = messageName;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v4, OS_SIGNPOST_INTERVAL_END, signpostId, "HandleRequest", "type=geo_message,peer=%@,message=%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (GEOMessage)initWithXPCMessage:(id)a3 peer:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)GEOMessage;
  v9 = [(GEOMessage *)&v34 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcMessage, a3);
    objc_storeStrong((id *)&v10->_peer, a4);
    string = xpc_dictionary_get_string(v7, "message");
    if (string)
    {
      uint64_t v12 = [NSString stringWithUTF8String:string];
      messageName = v10->_messageName;
      v10->_messageName = (NSString *)v12;
    }
    v14 = xpc_dictionary_get_dictionary(v10->_xpcMessage, "userInfo");
    if (v14)
    {
      uint64_t v15 = _CFXPCCreateCFObjectFromXPCObject();
      userInfo = v10->_userInfo;
      v10->_userInfo = (NSDictionary *)v15;
    }
    if (!v10->_userInfo) {
      v10->_userInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v17 = [v8 auditToken];
    preferredAuditToken = v10->_preferredAuditToken;
    v10->_preferredAuditToken = (GEOApplicationAuditToken *)v17;

    v19 = xpc_dictionary_get_string(v7, "proxiedBundleId");
    if (v19)
    {
      v20 = v19;
      if ([v8 hasEntitlement:@"com.apple.private.network.socket-delegate"])
      {
        v21 = v10->_preferredAuditToken;
        v22 = [NSString stringWithUTF8String:v20];
        uint64_t v23 = [(GEOApplicationAuditToken *)v21 overrideTokenWithProxiedBundleId:v22];
        v24 = v10->_preferredAuditToken;
        v10->_preferredAuditToken = (GEOApplicationAuditToken *)v23;
      }
      else
      {
        v22 = GEOGetGEODaemonLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v25 = [v8 peerID];
          *(_DWORD *)buf = 138543875;
          v36 = v25;
          __int16 v37 = 2113;
          v38 = @"com.apple.private.network.socket-delegate";
          __int16 v39 = 2081;
          v40 = v20;
          _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "peerID %{public}@ is missing entitlement \"%{private}@\"; will not attribute to \"%{private}s\"",
            buf,
            0x20u);
        }
      }
    }
    id v33 = 0;
    uint64_t v26 = GEOGetThrottleToken(v7, (uint64_t)&v33);
    v27 = (__CFString *)v33;
    throttleToken = v10->_throttleToken;
    v10->_throttleToken = (GEODataRequestThrottlerToken *)v26;

    if (v27)
    {
      v29 = GEOGetGEODaemonLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = [v8 peerID];
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        __int16 v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "peerID %{public}@ sent invalid throttle token %{public}@", buf, 0x16u);
      }
    }
    v31 = v10;
  }
  return v10;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_os_signpost_id_t signpostId = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (GEOPeer)peer
{
  return self->_peer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_messageName, 0);

  objc_storeStrong((id *)&self->_xpcMessage, 0);
}

- (GEOMessage)init
{
  result = (GEOMessage *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)sendReplyWithXPCUserInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_dictionary_get_remote_connection(self->_xpcMessage);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = (OS_xpc_object *)xpc_dictionary_create_reply(self->_xpcMessage);
  if (reply)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      xpcMessage = self->_xpcMessage;
      int v9 = 134218240;
      __int16 v10 = reply;
      __int16 v11 = 2048;
      uint64_t v12 = xpcMessage;
      _os_log_debug_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned %p. %p", (uint8_t *)&v9, 0x16u);
      if (!v4) {
        goto LABEL_5;
      }
    }
    else if (!v4)
    {
LABEL_5:
      xpc_connection_send_message(v5, reply);
      [(GEOMessage *)self _endSignpost];
      goto LABEL_8;
    }
    xpc_dictionary_set_value(reply, "userInfo", v4);
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v8 = self->_xpcMessage;
    int v9 = 134217984;
    __int16 v10 = v8;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "xpc_dictionary_create_reply(3) returned NULL. %p", (uint8_t *)&v9, 0xCu);
  }
LABEL_8:
}

- (NSString)messageName
{
  return self->_messageName;
}

- (GEOApplicationAuditToken)preferredAuditToken
{
  return self->_preferredAuditToken;
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

@end
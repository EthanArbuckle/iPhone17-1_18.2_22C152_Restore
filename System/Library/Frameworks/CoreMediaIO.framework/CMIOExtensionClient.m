@interface CMIOExtensionClient
+ (id)clientInfoWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasPendingCameraAuthorizationRequest;
- (BOOL)hasPendingMicrophoneAuthorizationRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromProxyExtensionManager;
- (BOOL)isToProxy;
- (CMIOExtensionClient)initWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8;
- (CMIOExtensionClient)initWithXPCDictionary:(id)a3;
- (NSString)signingID;
- (NSUUID)clientID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (id)redactedDescription;
- (int64_t)authorizationStatusForMediaType:(unsigned int)a3;
- (int64_t)cameraAuthorizationStatus;
- (int64_t)microphoneAuthorizationStatus;
- (pid_t)pid;
- (unint64_t)hash;
- (void)copyXPCDictionary;
- (void)dealloc;
- (void)requestAccessForMediaType:(unsigned int)a3 performPreFlightTest:(BOOL)a4 reply:(id)a5;
- (void)requestAccessForMediaType:(unsigned int)a3 reply:(id)a4;
- (void)setCameraAuthorizationStatus:(int64_t)a3;
- (void)setHasPendingCameraAuthorizationRequest:(BOOL)a3;
- (void)setHasPendingMicrophoneAuthorizationRequest:(BOOL)a3;
- (void)setMicrophoneAuthorizationStatus:(int64_t)a3;
@end

@implementation CMIOExtensionClient

+ (id)clientInfoWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v13 = *(void *)&a3;
  id v14 = objc_alloc((Class)objc_opt_class());
  long long v15 = *(_OWORD *)&a5->var0[4];
  v17[0] = *(_OWORD *)a5->var0;
  v17[1] = v15;
  return (id)[v14 initWithPID:v13 clientID:a4 auditToken:v17 stAttribution:a6 isToProxy:v9 isFromProxyExtensionManager:v8];
}

- (CMIOExtensionClient)initWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8
{
  v19.receiver = self;
  v19.super_class = (Class)CMIOExtensionClient;
  uint64_t v13 = [(CMIOExtensionClient *)&v19 init];
  id v14 = v13;
  if (v13)
  {
    v13->_pid = a3;
    v13->_clientID = (NSUUID *)[a4 copy];
    long long v15 = *(_OWORD *)&a5->var0[4];
    v18[0] = *(_OWORD *)a5->var0;
    v18[1] = v15;
    v14->_signingID = (NSString *)+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:v18];
    long long v16 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)v14->_auditToken.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&v14->_auditToken.val[4] = v16;
    v14->_isToProxy = a7;
    v14->_isFromProxyExtensionManager = a8;
    v14->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionClient: pid %d, clientID %@>", v14->_pid, v14->_clientID];
    v14->_redactedDescription = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionClient: pid -, clientID ->"];
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionClient;
  [(CMIOExtensionClient *)&v3 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (id)redactedDescription
{
  v2 = self->_redactedDescription;

  return v2;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isToProxy
{
  return self->_isToProxy;
}

- (BOOL)isFromProxyExtensionManager
{
  return self->_isFromProxyExtensionManager;
}

- (int64_t)microphoneAuthorizationStatus
{
  return self->_microphoneAuthorizationStatus;
}

- (void)setMicrophoneAuthorizationStatus:(int64_t)a3
{
  self->_microphoneAuthorizationStatus = a3;
}

- (int64_t)cameraAuthorizationStatus
{
  return self->_cameraAuthorizationStatus;
}

- (void)setCameraAuthorizationStatus:(int64_t)a3
{
  self->_cameraAuthorizationStatus = a3;
}

- (BOOL)hasPendingMicrophoneAuthorizationRequest
{
  return self->_hasPendingMicrophoneAuthorizationRequest;
}

- (void)setHasPendingMicrophoneAuthorizationRequest:(BOOL)a3
{
  self->_hasPendingMicrophoneAuthorizationRequest = a3;
}

- (BOOL)hasPendingCameraAuthorizationRequest
{
  return self->_hasPendingCameraAuthorizationRequest;
}

- (void)setHasPendingCameraAuthorizationRequest:(BOOL)a3
{
  self->_hasPendingCameraAuthorizationRequest = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  if (a3) {
    [a3 auditToken];
  }
  clientID = self->_clientID;
  if (clientID == (NSUUID *)objc_msgSend(a3, "clientID", 0)
    || (int v6 = -[NSUUID isEqual:](self->_clientID, "isEqual:", [a3 clientID])) != 0)
  {
    signingID = self->_signingID;
    if (signingID == (NSString *)[a3 signingID]
      || (int v6 = -[NSString isEqual:](self->_signingID, "isEqual:", [a3 signingID])) != 0)
    {
      if (*(void *)self->_auditToken.val == v15
        && *(void *)&self->_auditToken.val[2] == 0
        && *(void *)&self->_auditToken.val[4] == 0
        && *(void *)&self->_auditToken.val[6] == 0)
      {
        int pid = self->_pid;
        if (pid == [a3 pid])
        {
          int isToProxy = self->_isToProxy;
          if (isToProxy == [a3 isToProxy])
          {
            int isFromProxyExtensionManager = self->_isFromProxyExtensionManager;
            LOBYTE(v6) = isFromProxyExtensionManager == [a3 isFromProxyExtensionManager];
            return v6;
          }
        }
      }
LABEL_23:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_clientID hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CMIOExtensionClient allocWithZone:a3];
  uint64_t pid = self->_pid;
  clientID = self->_clientID;
  stAttribution = self->_stAttribution;
  BOOL isToProxy = self->_isToProxy;
  BOOL isFromProxyExtensionManager = self->_isFromProxyExtensionManager;
  long long v10 = *(_OWORD *)&self->_auditToken.val[4];
  v12[0] = *(_OWORD *)self->_auditToken.val;
  v12[1] = v10;
  return [(CMIOExtensionClient *)v4 initWithPID:pid clientID:clientID auditToken:v12 stAttribution:stAttribution isToProxy:isToProxy isFromProxyExtensionManager:isFromProxyExtensionManager];
}

- (id)copyXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "pid", self->_pid);
  if (cmio_XPCMessageSetCFString(v3, "clientID", [(NSUUID *)self->_clientID UUIDString]))
  {
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionClient copyXPCDictionary]();
      }
    }
  }
  signingID = self->_signingID;
  if (signingID)
  {
    if (cmio_XPCMessageSetCFString(v3, "signingID", signingID))
    {
      int v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionClient copyXPCDictionary]();
        }
      }
    }
  }
  return v3;
}

- (CMIOExtensionClient)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "pid");
    CFTypeRef cf = 0;
    if (cmio_XPCMessageCopyCFString(a3, "clientID", (NSObject **)&cf))
    {
      int v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionClient initWithXPCDictionary:]();
        }
      }
    }
    if (cf)
    {
      id v7 = objc_alloc(MEMORY[0x263F08C38]);
      id v8 = (id)[v7 initWithUUIDString:cf];
      CFRelease(cf);
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x263F08C38]);
    }
    memset(v12, 0, sizeof(v12));
    BOOL v9 = [(CMIOExtensionClient *)self initWithPID:uint64 clientID:v8 auditToken:v12 stAttribution:0 isToProxy:1 isFromProxyExtensionManager:0];
    if (!v9->_signingID)
    {
      *(void *)&v12[0] = 0;
      if (cmio_XPCMessageCopyCFString(a3, "signingID", (NSObject **)v12))
      {
        long long v10 = CMIOLog();
        if (v10)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionClient initWithXPCDictionary:]();
          }
        }
      }
      if (*(void *)&v12[0]) {
        v9->_signingID = *(NSString **)&v12[0];
      }
    }
    [(CMIOExtensionClient *)v9 setMicrophoneAuthorizationStatus:3];
    [(CMIOExtensionClient *)v9 setCameraAuthorizationStatus:3];
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
  return v9;
}

- (int64_t)authorizationStatusForMediaType:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 1936684398)
  {
    int64_t result = self->_microphoneAuthorizationStatus;
    if (result) {
      return result;
    }
  }
  else
  {
    int64_t result = self->_cameraAuthorizationStatus;
    if (result) {
      return result;
    }
  }
  long long v6 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)uint64_t v13 = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v13[16] = v6;
  int v7 = TCCAccessPreflightWithAuditToken();
  id v8 = CMIOLog();
  if (v8)
  {
    BOOL v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
      int pid = self->_pid;
      *(_DWORD *)uint64_t v13 = 136316163;
      *(void *)&v13[4] = v10;
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = 2585;
      *(_WORD *)&v13[18] = 2080;
      *(void *)&v13[20] = "-[CMIOExtensionClient authorizationStatusForMediaType:]";
      *(_WORD *)&v13[28] = 1024;
      *(_DWORD *)&v13[30] = v7;
      __int16 v14 = 1025;
      int v15 = pid;
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_INFO, "%s:%d:%s TCC preflight access returned %d for pid %{private}d", v13, 0x28u);
    }
  }
  if (v7)
  {
    if (v7 == 1)
    {
      if (TCCAccessRestricted()) {
        int64_t result = 1;
      }
      else {
        int64_t result = 2;
      }
    }
    else
    {
      int64_t result = v7 == 2 && TCCAccessRestricted() != 0;
    }
  }
  else
  {
    int64_t result = 3;
  }
  uint64_t v12 = 64;
  if (a3 == 1936684398) {
    uint64_t v12 = 56;
  }
  *(Class *)((char *)&self->super.isa + v12) = (Class)result;
  return result;
}

- (void)requestAccessForMediaType:(unsigned int)a3 reply:(id)a4
{
}

- (void)requestAccessForMediaType:(unsigned int)a3 performPreFlightTest:(BOOL)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a4
    && (int64_t v8 = [(CMIOExtensionClient *)self authorizationStatusForMediaType:*(void *)&a3]) != 0)
  {
    int64_t v9 = v8;
    long long v10 = CMIOLog();
    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
        int pid = self->_pid;
        *(_DWORD *)buf = 136317187;
        v25 = v12;
        __int16 v26 = 1024;
        int v27 = 2618;
        __int16 v28 = 2080;
        v29 = "-[CMIOExtensionClient requestAccessForMediaType:performPreFlightTest:reply:]";
        __int16 v30 = 1025;
        int v31 = pid;
        __int16 v32 = 1024;
        unsigned int v33 = HIBYTE(a3);
        __int16 v34 = 1024;
        int v35 = BYTE2(a3);
        __int16 v36 = 1024;
        int v37 = BYTE1(a3);
        __int16 v38 = 1024;
        int v39 = a3;
        __int16 v40 = 1024;
        int v41 = v9;
        _os_log_impl(&dword_2432B6000, v11, OS_LOG_TYPE_INFO, "%s:%d:%s authorizationStatus status for pid %{private}d type %c%c%c%c status %d", buf, 0x40u);
      }
    }
    (*((void (**)(id, int64_t))a5 + 2))(a5, v9);
  }
  else
  {
    int v14 = self->_pid;
    uint64_t v15 = 72;
    uint64_t v16 = (uint64_t *)MEMORY[0x263F7C598];
    if (a3 != 1936684398)
    {
      uint64_t v15 = 73;
      uint64_t v16 = (uint64_t *)MEMORY[0x263F7C510];
    }
    uint64_t v17 = *v16;
    *((unsigned char *)&self->super.isa + v15) = 1;
    global_queue = dispatch_get_global_queue(17, 0);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__CMIOExtensionClient_requestAccessForMediaType_performPreFlightTest_reply___block_invoke;
    v19[3] = &unk_26517C5E8;
    v19[5] = a5;
    v19[6] = v17;
    long long v20 = *(_OWORD *)self->_auditToken.val;
    long long v21 = *(_OWORD *)&self->_auditToken.val[4];
    int v22 = v14;
    unsigned int v23 = a3;
    v19[4] = self;
    dispatch_async(global_queue, v19);
  }
}

uint64_t __76__CMIOExtensionClient_requestAccessForMediaType_performPreFlightTest_reply___block_invoke(uint64_t a1)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  keys[0] = *(void **)MEMORY[0x263F7C4B0];
  values = (void *)*MEMORY[0x263EFFB40];
  CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  long long v3 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)int v14 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v14[16] = v3;
  int v4 = TCCAccessCheckAuditToken();
  if (v4)
  {
    uint64_t v5 = 3;
  }
  else if (TCCAccessRestricted())
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 2;
  }
  long long v6 = CMIOLog();
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int64_t v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
      int v9 = *(_DWORD *)(a1 + 88);
      *(_DWORD *)int v14 = 136316163;
      if (v4) {
        int v10 = 89;
      }
      else {
        int v10 = 78;
      }
      *(void *)&v14[4] = v8;
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 2644;
      *(_WORD *)&v14[18] = 2080;
      *(void *)&v14[20] = "-[CMIOExtensionClient requestAccessForMediaType:performPreFlightTest:reply:]_block_invoke";
      *(_WORD *)&v14[28] = 1024;
      *(_DWORD *)&v14[30] = v10;
      __int16 v15 = 1025;
      int v16 = v9;
      _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s TCC access returned %c for pid %{private}d", v14, 0x28u);
    }
  }
  CFRelease(v2);
  uint64_t v11 = 64;
  if (*(_DWORD *)(a1 + 92) == 1936684398) {
    uint64_t v11 = 56;
  }
  uint64_t v12 = 72;
  if (*(_DWORD *)(a1 + 92) != 1936684398) {
    uint64_t v12 = 73;
  }
  *(void *)(*(void *)(a1 + 32) + v11) = v5;
  *(unsigned char *)(*(void *)(a1 + 32) + v12) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)signingID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (pid_t)pid
{
  return self->_pid;
}

- (void)copyXPCDictionary
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, invalid clientID", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, invalid signingID", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, invalid clientID", v2, v3, v4, v5, v6);
}

@end
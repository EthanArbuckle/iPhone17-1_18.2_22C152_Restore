@interface _EXNSExtensionContextShimImplementation
+ (id)makeContextWithSceneSession:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken;
- (BOOL)shoudAcceptConnection:(id)a3;
- (NSArray)inputItems;
- (NSUUID)_UUID;
- (NSXPCConnection)_auxiliaryConnection;
- (_EXNSExtensionContextShimImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6;
- (_EXNSExtensionContextShimImplementation)initWithSceneSession:(id)a3;
- (_EXNSExtensionShimExtension)extension;
- (_EXSceneSession)sceneSession;
- (id)__principalObject;
- (id)_principalObject;
- (id)_requestCleanUpBlock;
- (id)makeXPCConnectionWithError:(id *)a3;
- (void)_setRequestCleanUpBlock:(id)a3;
- (void)beginContextRequest:(id)a3 endpoint:(id)a4 reply:(id)a5;
- (void)cancelRequestWithError:(id)a3;
- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)setExtension:(id)a3;
- (void)setSceneSession:(id)a3;
- (void)set__principalObject:(id)a3;
@end

@implementation _EXNSExtensionContextShimImplementation

+ (id)makeContextWithSceneSession:(id)a3
{
  id v3 = a3;
  v4 = [[_EXNSExtensionContextShimImplementation alloc] initWithSceneSession:v3];
  v5 = [_EXDecoderHack alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71___EXNSExtensionContextShimImplementation_makeContextWithSceneSession___block_invoke;
  v12[3] = &unk_1E573D440;
  v13 = v4;
  v6 = v4;
  v7 = [(_EXDecoderHack *)v5 initWithContextFactory:v12];
  v8 = [v3 extension];

  v9 = [v8 internalRep];
  v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "extensionContextClass")), "initWithCoder:", v7);

  return v10;
}

- (_EXNSExtensionContextShimImplementation)initWithSceneSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXNSExtensionContextShimImplementation;
  v5 = [(_EXNSExtensionContextShimImplementation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_storeWeak((id *)&v5->_sceneSession, v4);
  }

  return v5;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  id v4 = [(_EXNSExtensionContextShimImplementation *)self sceneSession];
  v5 = [v4 makeXPCConnectionWithError:a3];

  return v5;
}

- (void)invalidate
{
  id v2 = [(_EXNSExtensionContextShimImplementation *)self sceneSession];
  [v2 invalidate];
}

- (BOOL)shoudAcceptConnection:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315650;
    v7 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v8 = 1024;
    int v9 = 89;
    __int16 v10 = 2080;
    v11 = "-[_EXNSExtensionContextShimImplementation shoudAcceptConnection:]";
    _os_log_fault_impl(&dword_191F29000, v4, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v6, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (void)beginContextRequest:(id)a3 endpoint:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = _EXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v11 = 136315650;
    v12 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Int"
          "ernal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v13 = 1024;
    int v14 = 96;
    __int16 v15 = 2080;
    v16 = "-[_EXNSExtensionContextShimImplementation beginContextRequest:endpoint:reply:]";
    _os_log_fault_impl(&dword_191F29000, v10, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v11, 0x1Cu);
  }

  __break(1u);
}

- (void)cancelRequestWithError:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315650;
    int v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v7 = 1024;
    int v8 = 101;
    __int16 v9 = 2080;
    __int16 v10 = "-[_EXNSExtensionContextShimImplementation cancelRequestWithError:]";
    _os_log_fault_impl(&dword_191F29000, v4, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v5, 0x1Cu);
  }

  __break(1u);
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int16 v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v10 = 1024;
    int v11 = 105;
    __int16 v12 = 2080;
    __int16 v13 = "-[_EXNSExtensionContextShimImplementation completeRequestReturningItems:completionHandler:]";
    _os_log_fault_impl(&dword_191F29000, v7, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v8, 0x1Cu);
  }

  __break(1u);
}

- (_EXNSExtensionContextShimImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = _EXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    int v15 = 136315650;
    v16 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Int"
          "ernal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v17 = 1024;
    int v18 = 110;
    __int16 v19 = 2080;
    v20 = "-[_EXNSExtensionContextShimImplementation initWithInputItems:listenerEndpoint:contextUUID:extensionContext:]";
    _os_log_fault_impl(&dword_191F29000, v13, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported initializer: %s", (uint8_t *)&v15, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
}

- (NSArray)inputItems
{
  id v2 = _EXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315650;
    id v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v6 = 1024;
    int v7 = 120;
    __int16 v8 = 2080;
    id v9 = "-[_EXNSExtensionContextShimImplementation inputItems]";
    _os_log_fault_impl(&dword_191F29000, v2, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported property access: %s", (uint8_t *)&v4, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (id)_principalObject
{
  return self->__principalObject;
}

- (NSXPCConnection)_auxiliaryConnection
{
  id v2 = _EXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315650;
    id v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    __int16 v6 = 1024;
    int v7 = 134;
    __int16 v8 = 2080;
    id v9 = "-[_EXNSExtensionContextShimImplementation _auxiliaryConnection]";
    _os_log_fault_impl(&dword_191F29000, v2, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported property access: %s", (uint8_t *)&v4, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)_requestCleanUpBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)_setRequestCleanUpBlock:(id)a3
{
}

- (id)__principalObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)set__principalObject:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  objc_copyStruct(retstr, &self->_extensionHostAuditToken, 32, 1, 0);
  return result;
}

- (_EXNSExtensionShimExtension)extension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);

  return (_EXNSExtensionShimExtension *)WeakRetained;
}

- (void)setExtension:(id)a3
{
}

- (_EXSceneSession)sceneSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneSession);

  return (_EXSceneSession *)WeakRetained;
}

- (void)setSceneSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneSession);
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong(&self->__principalObject, 0);
  objc_storeStrong(&self->_requestCleanUpBlock, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
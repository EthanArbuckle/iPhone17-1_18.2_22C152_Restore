@interface _ANEDaemonConnection
+ (id)daemonConnection;
+ (id)daemonConnectionRestricted;
+ (id)userDaemonConnection;
- (BOOL)restricted;
- (NSXPCConnection)daemonConnection;
- (_ANEDaemonConnection)init;
- (_ANEDaemonConnection)initWithMachServiceName:(id)a3 restricted:(BOOL)a4;
- (void)beginRealTimeTaskWithReply:(id)a3;
- (void)compileModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)compiledModelExistsFor:(id)a3 withReply:(id)a4;
- (void)compiledModelExistsMatchingHash:(id)a3 withReply:(id)a4;
- (void)dealloc;
- (void)echo:(id)a3 withReply:(id)a4;
- (void)endRealTimeTaskWithReply:(id)a3;
- (void)loadModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)prepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)purgeCompiledModel:(id)a3 withReply:(id)a4;
- (void)purgeCompiledModelMatchingHash:(id)a3 withReply:(id)a4;
- (void)reportTelemetryToPPS:(id)a3 playload:(id)a4;
- (void)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 withReply:(id)a6;
@end

@implementation _ANEDaemonConnection

- (void)loadModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  int v17 = +[_ANEQoSMapper programPriorityForQoS:v8];
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority]
    && ![(_ANEDaemonConnection *)self restricted])
  {
    v20 = NSStringFromSelector(a2);
    v21 = +[_ANEErrors priorityErrorForMethod:v20];

    (*((void (**)(id, void, void, void, void, void, void, void *))v16 + 2))(v16, 0, MEMORY[0x1E4F1CC08], 0, 0, 0, 0, v21);
  }
  else
  {
    daemonConnection = self->_daemonConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke;
    v24[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v24[4] = a2;
    v19 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke_13;
    v22[3] = &unk_1E6C1C2D8;
    id v23 = v16;
    [v19 loadModel:v13 sandboxExtension:v14 options:v15 qos:v8 withReply:v22];
  }
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (_ANEDaemonConnection)init
{
  v3 = +[_ANEStrings machServiceName];
  v4 = [(_ANEDaemonConnection *)self initWithMachServiceName:v3 restricted:0];

  return v4;
}

- (_ANEDaemonConnection)initWithMachServiceName:(id)a3 restricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ANEDaemonConnection;
  v7 = [(_ANEDaemonConnection *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v6 options:4096];
    daemonConnection = v7->_daemonConnection;
    v7->_daemonConnection = (NSXPCConnection *)v8;

    v7->_restricted = v4;
    if (v4) {
      _ANEDaemonInterfacePrivate();
    }
    else {
    v10 = _ANEDaemonInterface();
    }
    [(NSXPCConnection *)v7->_daemonConnection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v7->_daemonConnection resume];
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_daemonConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_ANEDaemonConnection;
  [(_ANEDaemonConnection *)&v3 dealloc];
}

+ (id)daemonConnection
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)daemonConnectionRestricted
{
  id v2 = objc_alloc((Class)objc_opt_class());
  objc_super v3 = +[_ANEStrings machServiceNamePrivate];
  BOOL v4 = (void *)[v2 initWithMachServiceName:v3 restricted:1];

  return v4;
}

+ (id)userDaemonConnection
{
  id v2 = objc_alloc((Class)objc_opt_class());
  objc_super v3 = +[_ANEStrings userMachServiceName];
  BOOL v4 = (void *)[v2 initWithMachServiceName:v3 restricted:0];

  return v4;
}

- (void)beginRealTimeTaskWithReply:(id)a3
{
  id v5 = a3;
  if ([(_ANEDaemonConnection *)self restricted])
  {
    daemonConnection = self->_daemonConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke;
    v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v11[4] = a2;
    v7 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke_6;
    v9[3] = &unk_1E6C1C288;
    id v10 = v5;
    [v7 beginRealTimeTaskWithReply:v9];
  }
  else
  {
    v7 = NSStringFromSelector(a2);
    uint64_t v8 = +[_ANEErrors entitlementErrorForMethod:v7];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v8);
  }
}

- (void)endRealTimeTaskWithReply:(id)a3
{
  id v5 = a3;
  if ([(_ANEDaemonConnection *)self restricted])
  {
    daemonConnection = self->_daemonConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke;
    v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v11[4] = a2;
    v7 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke_8;
    v9[3] = &unk_1E6C1C288;
    id v10 = v5;
    [v7 endRealTimeTaskWithReply:v9];
  }
  else
  {
    v7 = NSStringFromSelector(a2);
    uint64_t v8 = +[_ANEErrors entitlementErrorForMethod:v7];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v8);
  }
}

- (void)echo:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(_ANEDaemonConnection *)self restricted])
  {
    daemonConnection = self->_daemonConnection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39___ANEDaemonConnection_echo_withReply___block_invoke;
    v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v14[4] = a2;
    id v10 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39___ANEDaemonConnection_echo_withReply___block_invoke_9;
    v12[3] = &unk_1E6C1C288;
    id v13 = v8;
    [v10 echo:v7 withReply:v12];
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    v11 = +[_ANEErrors entitlementErrorForMethod:v10];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

- (void)compileModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  int v17 = +[_ANEQoSMapper programPriorityForQoS:v8];
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority]
    && ![(_ANEDaemonConnection *)self restricted])
  {
    v20 = NSStringFromSelector(a2);
    v21 = +[_ANEErrors priorityErrorForMethod:v20];

    (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, MEMORY[0x1E4F1CC08], 0, v21);
  }
  else
  {
    daemonConnection = self->_daemonConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke;
    v24[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v24[4] = a2;
    v19 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke_11;
    v22[3] = &unk_1E6C1C2B0;
    id v23 = v16;
    [v19 compileModel:v13 sandboxExtension:v14 options:v15 qos:v8 withReply:v22];
  }
}

- (void)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  int v17 = +[_ANEQoSMapper programPriorityForQoS:v8];
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority]
    && ![(_ANEDaemonConnection *)self restricted])
  {
    v20 = NSStringFromSelector(a2);
    v21 = +[_ANEErrors priorityErrorForMethod:v20];

    (*((void (**)(id, void, void, void, void, void, void, void *))v16 + 2))(v16, 0, MEMORY[0x1E4F1CC08], 0, 0, 0, 0, v21);
  }
  else
  {
    daemonConnection = self->_daemonConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke;
    v24[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v24[4] = a2;
    v19 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke_15;
    v22[3] = &unk_1E6C1C2D8;
    id v23 = v16;
    [v19 loadModelNewInstance:v13 options:v14 modelInstParams:v15 qos:v8 withReply:v22];
  }
}

- (void)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 withReply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = +[_ANELog framework];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[_ANEDaemonConnection unloadModel:options:qos:withReply:]";
    __int16 v28 = 2048;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_INFO, "%s: START model[%p]=%@", buf, 0x20u);
  }

  int v15 = +[_ANEQoSMapper programPriorityForQoS:v7];
  if (v15 == +[_ANEQoSMapper realTimeProgramPriority]
    && ![(_ANEDaemonConnection *)self restricted])
  {
    v19 = NSStringFromSelector(a2);
    int v17 = +[_ANEErrors priorityErrorForMethod:v19];

    v13[2](v13, 0, v17);
  }
  else
  {
    daemonConnection = self->_daemonConnection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke;
    v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v25[4] = a2;
    int v17 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v25];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16;
    id v23 = &unk_1E6C1C288;
    v24 = v13;
    [v17 unloadModel:v11 options:v12 qos:v7 withReply:&v20];
    v18 = +[_ANELog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[_ANEDaemonConnection unloadModel:options:qos:withReply:]";
      __int16 v28 = 2048;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl(&dword_1DB8AB000, v18, OS_LOG_TYPE_INFO, "%s: END model[%p]=%@", buf, 0x20u);
    }
  }
}

- (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  daemonConnection = self->_daemonConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54___ANEDaemonConnection_reportTelemetryToPPS_playload___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a2;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v9];
  [v8 reportTelemetryToPPS:v7 playload:v6];
}

- (void)compiledModelExistsFor:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  daemonConnection = self->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke;
  v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v14[4] = a2;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke_17;
  v12[3] = &unk_1E6C1C300;
  id v13 = v7;
  id v11 = v7;
  [v10 compiledModelExistsFor:v9 withReply:v12];
}

- (void)purgeCompiledModel:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  daemonConnection = self->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke;
  v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v14[4] = a2;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19;
  v12[3] = &unk_1E6C1C288;
  id v13 = v7;
  id v11 = v7;
  [v10 purgeCompiledModel:v9 withReply:v12];
}

- (void)prepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, void, void *))a7;
  int v17 = +[_ANEQoSMapper programPriorityForQoS:v8];
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority]
    && ![(_ANEDaemonConnection *)self restricted])
  {
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = NSStringFromSelector(a2);
    v22 = [v20 priorityErrorForMethod:v21];

    v16[2](v16, 0, v22);
  }
  else
  {
    daemonConnection = self->_daemonConnection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke;
    v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v25[4] = a2;
    v19 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20;
    v23[3] = &unk_1E6C1C288;
    v24 = v16;
    [v19 prepareChainingWithModel:v13 options:v14 chainingReq:v15 qos:v8 withReply:v23];
  }
}

- (void)compiledModelExistsMatchingHash:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  daemonConnection = self->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke;
  v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v14[4] = a2;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21;
  v12[3] = &unk_1E6C1C288;
  id v13 = v7;
  id v11 = v7;
  [v10 compiledModelExistsMatchingHash:v9 withReply:v12];
}

- (void)purgeCompiledModelMatchingHash:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  daemonConnection = self->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke;
  v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v14[4] = a2;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22;
  v12[3] = &unk_1E6C1C288;
  id v13 = v7;
  id v11 = v7;
  [v10 purgeCompiledModelMatchingHash:v9 withReply:v12];
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void).cxx_destruct
{
}

@end
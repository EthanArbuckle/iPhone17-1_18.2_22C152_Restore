@interface DYBaseDaemon
- (BOOL)capturingInferior;
- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 withAPI:(unsigned int)a4 uniqueIdentifier:(id)a5 error:(id *)a6;
- (BOOL)isAppleInternal;
- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5;
- (BOOL)ownsInferior;
- (BOOL)shouldLoadCapture;
- (BOOL)shouldLoadDiagnostics;
- (DYBaseDaemon)init;
- (DYBaseSocketTransport)transport;
- (DYCaptureAPISupport)captureApiSupport;
- (NSString)inferiorName;
- (id)captureAPISupportForAPI:(unsigned int)a3;
- (id)getApplications;
- (int)inferiorPid;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)invalidate;
- (void)observeInferior;
- (void)run;
- (void)setApplications:(id)a3;
- (void)setCaptureApiSupport:(id)a3;
- (void)setCapturingInferior:(BOOL)a3;
- (void)setInferiorName:(id)a3;
- (void)setInferiorPid:(int)a3;
- (void)setOwnsInferior:(BOOL)a3;
- (void)setShouldLoadCapture:(BOOL)a3;
- (void)setShouldLoadDiagnostics:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)terminate:(int)a3;
@end

@implementation DYBaseDaemon

- (DYBaseDaemon)init
{
  v4.receiver = self;
  v4.super_class = (Class)DYBaseDaemon;
  v2 = [(DYBaseDaemon *)&v4 init];
  if (v2) {
    v2->_isAppleInternal = os_variant_allows_internal_security_policies();
  }
  return v2;
}

- (void)observeInferior
{
  v3 = dispatch_source_create(MEMORY[0x263EF83E0], self->_inferiorPid, 0x80000000uLL, MEMORY[0x263EF83A0]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__DYBaseDaemon_observeInferior__block_invoke;
  v4[3] = &unk_265333B48;
  v4[4] = self;
  v4[5] = v3;
  dispatch_source_set_event_handler(v3, v4);
  dispatch_resume(v3);
  dispatch_retain(v3);
  self->_process_source = (OS_dispatch_source *)v3;
}

void __31__DYBaseDaemon_observeInferior__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(int *)(v2 + 32) >= 1)
  {
    [*(id *)(v2 + 40) destroySharedMemoryTransport];
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:*(void *)(*(void *)(a1 + 32) + 48) forKeyedSubscript:@"GTErrorKeyProcessName"];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)(a1 + 32) + 32)), @"GTErrorKeyPID");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF910], "now"), @"GTErrorKeyCrashDate");
    uint64_t v4 = [MEMORY[0x263F3F9E8] messageWithKind:1282 attributes:v3];
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = 0;
    [*(id *)(*(void *)(a1 + 32) + 40) send:v4 inReplyTo:0 error:0];
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__DYBaseDaemon_observeInferior__block_invoke_2;
    block[3] = &unk_265333698;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v6)
  {
    dispatch_release(v6);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

unsigned char *__31__DYBaseDaemon_observeInferior__block_invoke_2(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result terminate:0];
  }
  return result;
}

- (id)captureAPISupportForAPI:(unsigned int)a3
{
  return 0;
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 withAPI:(unsigned int)a4 uniqueIdentifier:(id)a5 error:(id *)a6
{
  v10 = self;
  [(DYBaseDaemon *)self setCaptureApiSupport:[(DYBaseDaemon *)self captureAPISupportForAPI:*(void *)&a4]];
  if (a4 || (DYCheckGLDispatchTableSize() & 1) != 0)
  {
    v11 = (void *)[(DYBaseSocketTransport *)v10->_transport createNewSharedMemoryTransportWithUniqueIdentifier:a5 loadCapture:v10->_shouldLoadCapture loadDiagnostics:v10->_shouldLoadDiagnostics];
    v13 = v12;
    uint64_t v14 = [v11 absoluteString];
    uint64_t v15 = [v13 absoluteString];
    if (v10->_shouldLoadCapture)
    {
      if (!v14)
      {
        v10 = (DYBaseDaemon *)v10->_transport;
        v20 = v10;
        uint64_t v21 = objc_msgSend((id)-[DYBaseDaemon debugDescription](v10, "debugDescription"), "UTF8String");
        DYLog();
        dy_abort();
LABEL_15:
        objc_msgSend((id)-[DYBaseSocketTransport debugDescription](v10->_transport, "debugDescription", v20, v21), "UTF8String");
        DYLog();
        v18 = (DYBaseDaemon *)dy_abort();
        [(DYBaseDaemon *)v18 run];
        return result;
      }
      objc_msgSend(a3, "setObject:forKeyedSubscript:", v14, -[DYCaptureAPISupport transportEnvironmentVariable](-[DYBaseDaemon captureApiSupport](v10, "captureApiSupport"), "transportEnvironmentVariable"));
      [(DYCaptureAPISupport *)v10->_captureApiSupport interposeDylibPath];
      DYAppendInsertLibrary();
    }
    if (!v10->_shouldLoadDiagnostics
      || !objc_msgSend((id)-[DYCaptureAPISupport diagnosticsDylibPath](v10->_captureApiSupport, "diagnosticsDylibPath"), "length"))
    {
      return 1;
    }
    if (v15)
    {
      objc_msgSend(a3, "setObject:forKeyedSubscript:", v15, -[DYCaptureAPISupport diagnosticsTransportEnvironmentVariable](-[DYBaseDaemon captureApiSupport](v10, "captureApiSupport"), "diagnosticsTransportEnvironmentVariable"));
      DYAppendInsertLibrary();
      return 1;
    }
    goto LABEL_15;
  }
  if (!a6) {
    return 0;
  }
  v17 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:517 userInfo:0];
  BOOL result = 0;
  *a6 = v17;
  return result;
}

- (void)run
{
  id v3 = (void *)[(DYBaseSocketTransport *)self->_transport newSourceWithQueue:MEMORY[0x263EF83A0]];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)-[DYBaseSocketTransport error](self->_transport, "error"), "description"), "UTF8String");
    DYLog();
    -[DYBaseDaemon terminate:](self, "terminate:", 1, v4);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __19__DYBaseDaemon_run__block_invoke;
  v7[3] = &unk_265333698;
  v7[4] = self;
  [v3 setCancellationHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __19__DYBaseDaemon_run__block_invoke_2;
  v6[3] = &unk_265333B70;
  v6[4] = self;
  [v3 setMessageHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __19__DYBaseDaemon_run__block_invoke_3;
  v5[3] = &unk_265333698;
  v5[4] = self;
  [v3 setRegistrationHandler:v5];
  [v3 resume];
  self->_source = (DYTransportSource *)v3;
}

unsigned char *__19__DYBaseDaemon_run__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  BOOL result = *(unsigned char **)(a1 + 32);
  if (!result[24])
  {
    return (unsigned char *)[result terminate:0];
  }
  return result;
}

void __19__DYBaseDaemon_run__block_invoke_2(uint64_t a1, id a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) handleMessage:a2];
}

uint64_t __19__DYBaseDaemon_run__block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "connect"), "BOOLResult");
  if ((result & 1) == 0)
  {
    DYLog();
    uint64_t result = *(void *)(a1 + 32);
    if (!*(unsigned char *)(result + 24))
    {
      return [(id)result terminate:1];
    }
  }
  return result;
}

- (void)handleMessage:(id)a3
{
  if ([a3 kind] == 4353)
  {
    transport = self->_transport;
    [(DYBaseSocketTransport *)transport relayMessageOverSecondarySharedMemoryTransport:a3 error:0];
    return;
  }
  int v6 = [a3 kind];
  switch(v6)
  {
    case 1280:
      uint64_t v7 = [a3 plistPayload];
      if (!v7) {
        [(DYBaseDaemon *)self terminate:1];
      }
      v8 = objc_opt_new();
      *(void *)target_task = 0;
      if (self->_inferiorPid)
      {
        id v9 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:516 userInfo:0];
        BOOL v10 = 0;
        *(void *)target_task = v9;
        if (!v9)
        {
LABEL_11:
          -[DYBaseSocketTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", objc_msgSend(MEMORY[0x263F3F9E8], "messageWithKind:attributes:objectPayload:", 1280, v8, objc_msgSend(NSNumber, "numberWithBool:", v10)), a3, 0);
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v33 = 0;
        BOOL v10 = [(DYBaseDaemon *)self launchInferior:v7 finalEnvironment:&v33 error:target_task];
        if (v33) {
          [v8 setObject:v33 forKey:@"final environment"];
        }
        id v9 = *(id *)target_task;
        if (!*(void *)target_task) {
          goto LABEL_11;
        }
      }
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v9, "domain"), @"error domain");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)target_task, "code")), @"error code");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(*(id *)target_task, "localizedDescription"), @"error description");
      goto LABEL_11;
    case 1281:
      pid_t inferiorPid = self->_inferiorPid;
      if (inferiorPid >= 1)
      {
        if (self->_ownsInferior)
        {
          v13 = self->_transport;
          [(DYBaseSocketTransport *)v13 sendNewMessage:1282 error:0];
        }
        else
        {
          kill(inferiorPid, 9);
        }
      }
      return;
    case 1282:
    case 1285:
    case 1287:
    case 1288:
    case 1289:
    case 1290:
    case 1291:
    case 1292:
      goto LABEL_14;
    case 1283:
      [(DYBaseDaemon *)self terminate:0];
      return;
    case 1284:
      uint64_t v14 = [a3 plistPayload];
      if (v14)
      {
        [(DYBaseDaemon *)self setApplications:v14];
      }
      else
      {
        id v24 = [(DYBaseDaemon *)self getApplications];
        uint64_t v25 = [MEMORY[0x263F3F9E8] messageWithKind:1284 plistPayload:v24];
        v26 = self->_transport;
        [(DYBaseSocketTransport *)v26 send:v25 inReplyTo:a3 error:0];
      }
      return;
    case 1286:
      v8 = objc_opt_new();
      *(void *)target_task = 0;
      if (self->_inferiorPid)
      {
        id v15 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:516 userInfo:0];
        v16 = 0;
        *(void *)target_task = v15;
        if (!v15) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      v27 = (void *)[a3 plistPayload];
      if ([v27 objectForKey:*MEMORY[0x263F3FC10]]) {
        char v28 = objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x263F3FBE8]), "BOOLValue");
      }
      else {
        char v28 = 1;
      }
      self->_shouldLoadCapture = v28;
      self->_shouldLoadDiagnostics = objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x263F3FBF8]), "BOOLValue");
      v16 = objc_msgSend((id)objc_msgSend(v27, "objectForKey:", *MEMORY[0x263F3FC00]), "mutableCopy");
      v29 = (void *)[v16 objectForKey:@"GPUTOOLS_LOAD_GTMTLCAPTURE"];
      uint64_t v30 = [v27 objectForKey:*MEMORY[0x263F3FC20]];
      [v29 intValue];
      DYSetGTMTLCaptureMode();
      [(DYBaseDaemon *)self createInferiorTransportAndSetEnvironment:v16 uniqueIdentifier:v30 error:target_task];
      DYModifyEnvironmentForDualCaptureSupport();
      id v15 = *(id *)target_task;
      if (*(void *)target_task)
      {
LABEL_31:
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v15, "domain"), @"error domain");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)target_task, "code")), @"error code");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(*(id *)target_task, "localizedDescription"), @"error description");
      }
LABEL_32:
      id v17 = objc_alloc(MEMORY[0x263F3F9E8]);
      if (v16)
      {
        v18 = (void *)[v17 initWithKind:1286 attributes:v8 plistPayload:v16];
      }
      else
      {
        v18 = (void *)[v17 initWithKind:1286 attributes:v8 payload:0];
      }
      [(DYBaseSocketTransport *)self->_transport send:v18 inReplyTo:a3 error:0];

LABEL_50:
      return;
    case 1293:
      int v19 = self->_inferiorPid;
      if (v19)
      {
        self->_capturingInferior = 0;
        target_task[0] = 0;
        mach_error_t v20 = task_for_pid(*MEMORY[0x263EF8960], v19, target_task);
        if (v20)
        {
          uint64_t v21 = self->_inferiorPid;
          v31 = mach_error_string(v20);
          DYLog();
          -[DYBaseDaemon terminate:](self, "terminate:", 1, v21, v31);
        }
        mach_error_t v22 = task_resume(target_task[0]);
        if (v22)
        {
          uint64_t v23 = self->_inferiorPid;
          v32 = mach_error_string(v22);
          DYLog();
          -[DYBaseDaemon terminate:](self, "terminate:", 1, v23, v32);
        }
      }
      return;
    default:
      if (v6 == 264) {
        self->_capturingInferior = 1;
      }
LABEL_14:
      v11 = self->_transport;
      [(DYBaseSocketTransport *)v11 relayMessageOverSharedMemoryTransport:a3 error:0];
      return;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYBaseDaemon;
  [(DYBaseDaemon *)&v3 dealloc];
}

- (void)invalidate
{
  [(DYTransportSource *)self->_source cancel];

  self->_source = 0;
  process_source = self->_process_source;
  if (process_source)
  {
    dispatch_source_cancel(process_source);
    dispatch_release((dispatch_object_t)self->_process_source);
    self->_process_source = 0;
  }
  self->_invalidated = 1;
}

- (void)terminate:(int)a3
{
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)setApplications:(id)a3
{
}

- (id)getApplications
{
  return 0;
}

- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5
{
  return 0;
}

- (DYBaseSocketTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (int)inferiorPid
{
  return self->_inferiorPid;
}

- (void)setInferiorPid:(int)a3
{
  self->_pid_t inferiorPid = a3;
}

- (NSString)inferiorName
{
  return self->_inferiorName;
}

- (void)setInferiorName:(id)a3
{
}

- (BOOL)ownsInferior
{
  return self->_ownsInferior;
}

- (void)setOwnsInferior:(BOOL)a3
{
  self->_ownsInferior = a3;
}

- (DYCaptureAPISupport)captureApiSupport
{
  return self->_captureApiSupport;
}

- (void)setCaptureApiSupport:(id)a3
{
}

- (BOOL)capturingInferior
{
  return self->_capturingInferior;
}

- (void)setCapturingInferior:(BOOL)a3
{
  self->_capturingInferior = a3;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (BOOL)shouldLoadCapture
{
  return self->_shouldLoadCapture;
}

- (void)setShouldLoadCapture:(BOOL)a3
{
  self->_shouldLoadCapture = a3;
}

- (BOOL)shouldLoadDiagnostics
{
  return self->_shouldLoadDiagnostics;
}

- (void)setShouldLoadDiagnostics:(BOOL)a3
{
  self->_shouldLoadDiagnostics = a3;
}

@end
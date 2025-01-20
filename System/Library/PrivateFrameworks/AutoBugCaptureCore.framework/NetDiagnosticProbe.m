@interface NetDiagnosticProbe
- (BOOL)netDiagnosticsTaskInProgress:(id)a3;
- (BOOL)startNetDiagnosticsTask:(id)a3;
- (BOOL)stopNetDiagnosticsTask:(id)a3;
- (NSMutableDictionary)netDiagsTaskDict;
- (NSString)ndFilePath;
- (NSString)taskName;
- (NetDiagnosticsShim)netDiags;
- (id)setUpDefaultTaskDictionary;
- (void)cancelTest:(id)a3;
- (void)dealloc;
- (void)disconnectFromNetDiagnostics;
- (void)setNdFilePath:(id)a3;
- (void)setNetDiags:(id)a3;
- (void)setNetDiagsTaskDict:(id)a3;
- (void)setTaskName:(id)a3;
@end

@implementation NetDiagnosticProbe

- (void)setNetDiags:(id)a3
{
  v5 = (NetDiagnosticsShim *)a3;
  netDiags = self->_netDiags;
  if (netDiags != v5)
  {
    v7 = v5;
    if (netDiags)
    {
      [(NetDiagnosticsShim *)netDiags setDelegate:0];
      [(NetDiagnosticsShim *)self->_netDiags invalidateConnections];
      v5 = v7;
    }
    if (v5) {
      [(NetDiagnosticsShim *)v7 setDelegate:self];
    }
    objc_storeStrong((id *)&self->_netDiags, a3);
  }

  MEMORY[0x270F9A758]();
}

- (NetDiagnosticsShim)netDiags
{
  netDiags = self->_netDiags;
  if (!netDiags)
  {
    v4 = [NetDiagnosticsShim alloc];
    taskName = self->_taskName;
    v6 = [(TestProbe *)self queue];
    v7 = [(NetDiagnosticsShim *)v4 initWithTaskName:taskName queue:v6];
    [(NetDiagnosticProbe *)self setNetDiags:v7];

    netDiags = self->_netDiags;
  }

  return netDiags;
}

- (void)dealloc
{
  [(NetDiagnosticProbe *)self setNetDiags:0];
  v3.receiver = self;
  v3.super_class = (Class)NetDiagnosticProbe;
  [(NetDiagnosticProbe *)&v3 dealloc];
}

- (void)disconnectFromNetDiagnostics
{
}

- (id)setUpDefaultTaskDictionary
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(NetDiagnosticProbe *)self taskName];
  [v3 setObject:v4 forKeyedSubscript:@"taskName"];

  id v12 = 0;
  id v13 = 0;
  id v11 = 0;
  +[TestProbe autoBugCapturePath:&v13 autoBugCaptureUID:&v12 autoBugCaptureGID:&v11];
  id v5 = v13;
  id v6 = v12;
  id v7 = v11;
  v8 = v7;
  if (v5 && v6 && v7)
  {
    v9 = [v5 stringByAppendingString:@"/"];
    [v3 setObject:v9 forKeyedSubscript:@"filename"];

    [v3 setObject:v6 forKeyedSubscript:@"taskFileUserID"];
    [v3 setObject:v8 forKeyedSubscript:@"taskFileGroupID"];
  }
  [v3 setObject:&unk_26BDF5888 forKeyedSubscript:@"taskFileMode"];
  [(NetDiagnosticProbe *)self setNetDiagsTaskDict:v3];

  return v3;
}

- (BOOL)startNetDiagnosticsTask:(id)a3
{
  id v4 = a3;
  [(TestProbe *)self setStatus:1];
  id v5 = [(NetDiagnosticProbe *)self netDiags];
  id v6 = [(NetDiagnosticProbe *)self netDiagsTaskDict];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke;
  v9[3] = &unk_263FC3480;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  LOBYTE(v4) = [v5 startNetDiagnosticTaskWithOptions:v6 reply:v9];

  return (char)v4;
}

void __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    if (!v6) {
      goto LABEL_13;
    }
    v18 = symptomsLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [v7 userInfo];
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v8 = [NSString stringWithUTF8String:"filename"];
  v9 = [v5 objectForKeyedSubscript:v8];
  [*(id *)(a1 + 32) setNdFilePath:v9];

  id v10 = [NSString stringWithUTF8String:kNetDiagStatus[0]];
  id v11 = [v5 objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 longLongValue];

  if (v12)
  {
    if (v12 != -1)
    {
      id v13 = symptomsLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [*(id *)(a1 + 32) taskName];
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = v12;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "%@ (%p) Unknown kNetDiagStatus %lld\n", buf, 0x20u);
      }
      v16 = *(void **)(a1 + 32);
      uint64_t v17 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }
LABEL_11:
    v16 = *(void **)(a1 + 32);
    uint64_t v17 = 3;
LABEL_12:
    [v16 setStatus:v17];
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) setRunning:1];
  if ([*(id *)(a1 + 32) status] == 5)
  {
    v21 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke_2;
    v22[3] = &unk_263FC3458;
    v22[4] = v21;
    [v21 stopNetDiagnosticsTask:v22];
  }
LABEL_13:
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, [*(id *)(a1 + 32) status]);
  }
}

uint64_t __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeProbeOutputFiles];
  [*(id *)(a1 + 32) setStatus:4];
  v2 = *(void **)(a1 + 32);

  return [v2 disconnectFromNetDiagnostics];
}

- (void)cancelTest:(id)a3
{
  id v4 = a3;
  if ([(TestProbe *)self isRunning])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __33__NetDiagnosticProbe_cancelTest___block_invoke;
    v5[3] = &unk_263FC34A8;
    v5[4] = self;
    id v6 = v4;
    [(NetDiagnosticProbe *)self stopNetDiagnosticsTask:v5];
  }
  else
  {
    [(TestProbe *)self setStatus:5];
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, [(TestProbe *)self status]);
    }
  }
}

uint64_t __33__NetDiagnosticProbe_cancelTest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStatus:4];
  [*(id *)(a1 + 32) removeProbeOutputFiles];
  uint64_t result = [*(id *)(a1 + 32) disconnectFromNetDiagnostics];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) status];
    id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
    return v5(v3, v4);
  }
  return result;
}

- (BOOL)stopNetDiagnosticsTask:(id)a3
{
  id v4 = a3;
  [(TestProbe *)self setRunning:0];
  id v5 = [(NetDiagnosticProbe *)self netDiags];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__NetDiagnosticProbe_stopNetDiagnosticsTask___block_invoke;
  v8[3] = &unk_263FC3480;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(v4) = [v5 stopNetDiagnosticTaskWithReply:v8];

  return (char)v4;
}

void __45__NetDiagnosticProbe_stopNetDiagnosticsTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v8 = [NSString stringWithUTF8String:kNetDiagStatus[0]];
    id v9 = [v5 objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 longLongValue];

    if (!v10)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = 2;
      goto LABEL_13;
    }
    if (v10 != -1)
    {
      id v11 = symptomsLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        uint64_t v18 = v10;
        _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Unknown kNetDiagStatus %lld\n", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = 0xFFFFFFFFLL;
      goto LABEL_13;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    v14 = symptomsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v7 userInfo];
      int v17 = 138412290;
      uint64_t v18 = (uint64_t)v15;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = 3;
LABEL_13:
  [v12 setStatus:v13];
LABEL_14:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, [*(id *)(a1 + 32) status]);
  }
}

- (BOOL)netDiagnosticsTaskInProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(NetDiagnosticProbe *)self netDiags];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__NetDiagnosticProbe_netDiagnosticsTaskInProgress___block_invoke;
  v8[3] = &unk_263FC3480;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(v4) = [v5 netDiagnosticTaskStatusWithReply:v8];

  return (char)v4;
}

void __51__NetDiagnosticProbe_netDiagnosticsTaskInProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) status] != 5)
  {
    if (!v5)
    {
      if (!v6) {
        goto LABEL_20;
      }
      uint64_t v10 = symptomsLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 64);
        uint64_t v13 = [v6 userInfo];
        int v23 = 138412546;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v13;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "%@ kNetDiagCmdTasksStatus %@", (uint8_t *)&v23, 0x16u);
      }
      goto LABEL_9;
    }
    id v7 = [NSString stringWithUTF8String:kNetDiagStatus[0]];
    v8 = [v5 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 longLongValue];

    if (v9)
    {
      uint64_t v10 = symptomsLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 64);
        int v23 = 138412546;
        uint64_t v24 = v11;
        __int16 v25 = 2048;
        uint64_t v26 = v9;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "%@ kNetDiagStatus is %lld\n", (uint8_t *)&v23, 0x16u);
      }
LABEL_9:

      [*(id *)(a1 + 32) setStatus:3];
      goto LABEL_20;
    }
    v14 = [NSString stringWithUTF8String:kNetDiagKeyValues[0]];
    uint64_t v15 = [v5 objectForKeyedSubscript:v14];

    if (v15)
    {
      uint64_t v16 = [v15 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 64)];
      uint64_t v17 = [v16 longLongValue];

      switch(v17)
      {
        case 0:
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = 0;
          break;
        case 1:
        case 2:
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = 1;
          break;
        case 3:
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = 2;
          break;
        default:
          uint64_t v20 = symptomsLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 64);
            int v23 = 138412546;
            uint64_t v24 = v21;
            __int16 v25 = 2048;
            uint64_t v26 = v17;
            _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_INFO, "%@  UNEXPECTED status %lld", (uint8_t *)&v23, 0x16u);
          }

          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = 0xFFFFFFFFLL;
          break;
      }
      [v18 setStatus:v19];
    }
  }
LABEL_20:
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, [*(id *)(a1 + 32) status]);
  }
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)ndFilePath
{
  return self->_ndFilePath;
}

- (void)setNdFilePath:(id)a3
{
}

- (NSMutableDictionary)netDiagsTaskDict
{
  return self->_netDiagsTaskDict;
}

- (void)setNetDiagsTaskDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netDiagsTaskDict, 0);
  objc_storeStrong((id *)&self->_ndFilePath, 0);
  objc_storeStrong((id *)&self->_taskName, 0);

  objc_storeStrong((id *)&self->_netDiags, 0);
}

@end
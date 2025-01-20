@interface TCPDumpProbe
- (BOOL)startNetDiagnosticsTask:(id)a3;
- (BOOL)stopNetDiagnosticsTask:(id)a3;
- (NSString)destinationPath;
- (OS_dispatch_source)tcpDumpTimer;
- (TCPDumpProbe)initWithQueue:(id)a3;
- (double)duration;
- (id)probeOutputFilePaths;
- (id)tcpDumpCompletedBlock;
- (void)setDestinationPath:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTcpDumpCompletedBlock:(id)a3;
- (void)setTcpDumpTimer:(id)a3;
- (void)startTCPDumpWithDuration:(double)a3 destinationPath:(id)a4 tcpDumpStarted:(id)a5 tcpDumpCompleted:(id)a6;
- (void)stopTest;
@end

@implementation TCPDumpProbe

- (TCPDumpProbe)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TCPDumpProbe;
  v3 = [(TestProbe *)&v6 initWithQueue:a3];
  if (v3)
  {
    v4 = [NSString stringWithUTF8String:kNetDiagTaskSymptomsPcap[0]];
    [(NetDiagnosticProbe *)v3 setTaskName:v4];

    [(TCPDumpProbe *)v3 setDuration:30.0];
  }
  return v3;
}

- (void)startTCPDumpWithDuration:(double)a3 destinationPath:(id)a4 tcpDumpStarted:(id)a5 tcpDumpCompleted:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  v13 = symptomsLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v26 = a3;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "TCPDumpProbe startTCPDumpWithDuration - duration (%f)", buf, 0xCu);
  }

  [(TCPDumpProbe *)self setDuration:a3];
  [(TCPDumpProbe *)self setDestinationPath:v12];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke;
  aBlock[3] = &unk_263FC34F8;
  aBlock[4] = self;
  id v23 = v11;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  v16 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_193;
  v19[3] = &unk_263FC3520;
  v19[4] = self;
  id v20 = v14;
  v17 = v16;
  id v21 = v17;
  id v18 = v14;
  if (![(NetDiagnosticProbe *)self netDiagnosticsTaskInProgress:v19]) {
    v17[2](v17);
  }
}

void __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_2;
  v6[3] = &unk_263FC34D0;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  if (([v2 startNetDiagnosticsTask:v6] & 1) == 0)
  {
    v3 = symptomsLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Could not even start the TCP Dump", v5, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 3);
    }
  }
}

uint64_t __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = symptomsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = +[TestProbe testProbeStatusString:a2];
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "startTCPDumpWithDuration Status Update %@", (uint8_t *)&v8, 0xCu);
  }
  if ((a2 - 3) > 2)
  {
    objc_super v6 = *(const void **)(a1 + 40);
    if (v6) {
      *(void *)(*(void *)(a1 + 32) + 96) = _Block_copy(v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeProbeOutputFiles];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_193(uint64_t result, int a2)
{
  if ((a2 + 1) <= 6)
  {
    uint64_t v2 = result;
    if (((1 << (a2 + 1)) & 0x1B) != 0)
    {
      v3 = *(uint64_t (**)(void))(*(void *)(result + 48) + 16);
      return v3();
    }
    else if (a2 == 1)
    {
      v5 = symptomsLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "A TCP Dump is already in progress. We cannot stop it.", v7, 2u);
      }

      uint64_t v6 = *(void *)(v2 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 3);
      }
      return [*(id *)(v2 + 32) disconnectFromNetDiagnostics];
    }
    else if (a2 == 5)
    {
      uint64_t v4 = *(void **)(result + 32);
      return [v4 disconnectFromNetDiagnostics];
    }
  }
  return result;
}

- (BOOL)startNetDiagnosticsTask:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NetDiagnosticProbe *)self setUpDefaultTaskDictionary];
  v14.receiver = self;
  v14.super_class = (Class)TCPDumpProbe;
  [(NetDiagnosticProbe *)&v14 startNetDiagnosticsTask:v4];

  double duration = self->_duration;
  if (duration < 5.0 || duration > 900.0)
  {
    id v7 = symptomsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v8 = self->_duration;
      *(_DWORD *)buf = 134218240;
      double v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = 0x403E000000000000;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Unsupported TCP dump duration (%f) request. Resetting to %f", buf, 0x16u);
    }

    self->_double duration = 30.0;
  }
  v9 = [(TestProbe *)self queue];
  uint64_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v9);

  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(self->_duration * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40__TCPDumpProbe_startNetDiagnosticsTask___block_invoke;
  handler[3] = &unk_263FC2DC0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  [(TCPDumpProbe *)self setTcpDumpTimer:v10];
  dispatch_resume(v10);

  return 1;
}

uint64_t __40__TCPDumpProbe_startNetDiagnosticsTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = symptomsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEFAULT, "TCP Dump Duration completed", v4, 2u);
  }

  return [*(id *)(a1 + 32) stopNetDiagnosticsTask:0];
}

- (void)stopTest
{
}

- (BOOL)stopNetDiagnosticsTask:(id)a3
{
  id v4 = a3;
  id v5 = symptomsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "TCPDumpProbe stopNetDiagnosticsTask", buf, 2u);
  }

  uint64_t v6 = [(TCPDumpProbe *)self tcpDumpTimer];

  if (v6)
  {
    id v7 = [(TCPDumpProbe *)self tcpDumpTimer];
    dispatch_source_cancel(v7);

    [(TCPDumpProbe *)self setTcpDumpTimer:0];
  }
  if ([(TestProbe *)self isRunning])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__TCPDumpProbe_stopNetDiagnosticsTask___block_invoke;
    v10[3] = &unk_263FC34A8;
    v10[4] = self;
    id v11 = v4;
    v9.receiver = self;
    v9.super_class = (Class)TCPDumpProbe;
    [(NetDiagnosticProbe *)&v9 stopNetDiagnosticsTask:v10];
  }
  return 1;
}

void __39__TCPDumpProbe_stopNetDiagnosticsTask___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) disconnectFromNetDiagnostics];
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (!v4) {
      goto LABEL_6;
    }
    if (a2 == 4)
    {
      [*(id *)(a1 + 32) removeProbeOutputFiles];
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
LABEL_6:
  id v5 = *(const void **)(*(void *)(a1 + 32) + 96);
  if (v5)
  {
    _Block_release(v5);
    *(void *)(*(void *)(a1 + 32) + 96) = 0;
  }
}

- (id)probeOutputFilePaths
{
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(NetDiagnosticProbe *)self ndFilePath];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 lastPathComponent];
    id v7 = [v6 stringByDeletingPathExtension];

    uint64_t v8 = [v7 rangeOfString:@"-" options:4];
    if (v9 == 1)
    {
      uint64_t v10 = [v7 substringToIndex:v8];
    }
    else
    {

      id v11 = symptomsLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Could not parse pcapng file name", buf, 2u);
      }

      uint64_t v10 = 0;
    }
    id v12 = NSURL;
    v13 = [v5 stringByDeletingLastPathComponent];
    objc_super v14 = [v12 URLWithString:v13];

    if (v14)
    {
      id v15 = [MEMORY[0x263F08850] defaultManager];
      double v16 = [v15 enumeratorAtURL:v14 includingPropertiesForKeys:0 options:1 errorHandler:0];

      if (v16)
      {
        uint64_t v17 = [v16 nextObject];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          uint64_t v27 = v14;
          uint64_t v19 = v3;
          id v20 = 0;
          do
          {
            id v21 = v20;
            v22 = (void *)MEMORY[0x21050CEB0]();
            id v20 = [v18 lastPathComponent];

            id v23 = [v20 pathExtension];
            LODWORD(v21) = [v23 isEqualToString:@"pcapng"];

            if (v21 && (!v10 || [v20 containsString:v10]))
            {
              id v24 = [v18 path];
              [v19 addObject:v24];
            }
            uint64_t v25 = [v16 nextObject];

            uint64_t v18 = (void *)v25;
          }
          while (v25);

          v3 = v19;
          objc_super v14 = v27;
        }
      }
    }
  }

  return v3;
}

- (OS_dispatch_source)tcpDumpTimer
{
  return self->_tcpDumpTimer;
}

- (void)setTcpDumpTimer:(id)a3
{
}

- (id)tcpDumpCompletedBlock
{
  return self->_tcpDumpCompletedBlock;
}

- (void)setTcpDumpCompletedBlock:(id)a3
{
  self->_tcpDumpCompletedBlock = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPath, 0);

  objc_storeStrong((id *)&self->_tcpDumpTimer, 0);
}

@end
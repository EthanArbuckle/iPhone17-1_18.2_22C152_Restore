@interface NetworkDiagnosticsReportGenerator
- (BOOL)startNetDiagnosticsTaskWithReply:(id)a3;
- (BOOL)startReportGeneration;
- (NSDate)reportStart;
- (NSDictionary)netDiagsResults;
- (NSMutableDictionary)options;
- (NetDiagnosticsShim)netDiags;
- (NetworkDiagnosticsReportGenerator)initWithQueue:(id)a3;
- (id)createDefaultTaskDictionaryWithTaskName:(const char *)a3;
- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4;
- (void)setNetDiags:(id)a3;
- (void)setNetDiagsResults:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReportStart:(id)a3;
@end

@implementation NetworkDiagnosticsReportGenerator

- (NetworkDiagnosticsReportGenerator)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NetworkDiagnosticsReportGenerator;
  v3 = [(DiagnosticReportGenerator *)&v6 initWithQueue:a3];
  v4 = v3;
  if (v3) {
    [(DiagnosticReportGenerator *)v3 setTimeoutSeconds:600.0];
  }
  return v4;
}

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
    v5 = v7;
  }

  MEMORY[0x270F9A758](netDiags, v5);
}

- (NetDiagnosticsShim)netDiags
{
  netDiags = self->_netDiags;
  if (!netDiags)
  {
    v4 = [NetDiagnosticsShim alloc];
    v5 = [(NetworkDiagnosticsReportGenerator *)self options];
    objc_super v6 = [v5 objectForKeyedSubscript:@"taskName"];
    v7 = [(DiagnosticReportGenerator *)self queue];
    v8 = [(NetDiagnosticsShim *)v4 initWithTaskName:v6 queue:v7];
    [(NetworkDiagnosticsReportGenerator *)self setNetDiags:v8];

    netDiags = self->_netDiags;
  }

  return netDiags;
}

- (BOOL)startNetDiagnosticsTaskWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(NetworkDiagnosticsReportGenerator *)self netDiags];
  objc_super v6 = [(NetworkDiagnosticsReportGenerator *)self options];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__NetworkDiagnosticsReportGenerator_startNetDiagnosticsTaskWithReply___block_invoke;
  v10[3] = &unk_263FC51A0;
  id v11 = v4;
  id v7 = v4;
  char v8 = [v5 startNetDiagnosticTaskWithOptions:v6 reply:v10];

  return v8;
}

void __70__NetworkDiagnosticsReportGenerator_startNetDiagnosticsTaskWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    unint64_t v8 = 0x263F08000uLL;
    v9 = [NSString stringWithUTF8String:kNetDiagTaskFilePath[0]];
    v10 = [v5 objectForKeyedSubscript:v9];

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v10)
    {
      v13 = [NSURL fileURLWithPath:v10];
      v14 = [v13 absoluteString];
      [v12 addObject:v14];
    }
    else
    {
      v23 = [v5 objectForKeyedSubscript:@"filepaths"];
      v10 = v23;
      if (v23)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v39 = a1;
          v40 = v7;
          id v26 = 0;
          uint64_t v27 = *(void *)v42;
          do
          {
            uint64_t v28 = 0;
            v29 = v26;
            do
            {
              if (*(void *)v42 != v27) {
                objc_enumerationMutation(v10);
              }
              id v26 = *(id *)(*((void *)&v41 + 1) + 8 * v28);

              v30 = [NSURL fileURLWithPath:v26];
              v31 = [v30 absoluteString];
              [v12 addObject:v31];

              ++v28;
              v29 = v26;
            }
            while (v25 != v28);
            uint64_t v25 = [v10 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v25);

          id v7 = v40;
          a1 = v39;
          unint64_t v8 = 0x263F08000;
        }
      }
    }

    [v11 setObject:v12 forKeyedSubscript:@"attachments"];
    v15 = [*(id *)(v8 + 2880) stringWithUTF8String:kNetDiagStatus[0]];
    v16 = [v5 objectForKeyedSubscript:v15];
    uint64_t v17 = [v16 longLongValue];

    if (!v17)
    {
      uint64_t v32 = *(void *)(a1 + 32);
      if (v32) {
        (*(void (**)(uint64_t, id, void))(v32 + 16))(v32, v11, 0);
      }
      goto LABEL_29;
    }
    if (v17 == -1)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      if (!v18)
      {
LABEL_29:

        goto LABEL_30;
      }
      v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:&unk_26BDF5808];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
    else
    {
      v33 = diagreportLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v48 = v17;
        _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "Unknown kNetDiagStatus %lld\n", buf, 0xCu);
      }

      uint64_t v34 = *(void *)(a1 + 32);
      if (!v34) {
        goto LABEL_29;
      }
      v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08438];
      v45 = @"error";
      v19 = objc_msgSend(*(id *)(v8 + 2880), "stringWithFormat:", @"Unknown kNetDiagStatus %lld\n", v17);
      v46 = v19;
      v37 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v38 = [v35 errorWithDomain:v36 code:5 userInfo:v37];
      (*(void (**)(uint64_t, void, void *))(v34 + 16))(v34, 0, v38);
    }
    goto LABEL_29;
  }
  if (v6)
  {
    v20 = diagreportLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v7 userInfo];
      *(_DWORD *)buf = 138412290;
      uint64_t v48 = (uint64_t)v21;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    uint64_t v22 = *(void *)(a1 + 32);
    if (v22) {
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v7);
    }
  }
LABEL_30:
}

- (BOOL)startReportGeneration
{
  v2 = self;
  v3 = [(NetworkDiagnosticsReportGenerator *)self options];
  id v4 = [v3 objectForKeyedSubscript:@"taskName"];

  [(DiagnosticReportGenerator *)v2 setReportGenerated:0];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  reportStart = v2->_reportStart;
  v2->_reportStart = (NSDate *)v5;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__NetworkDiagnosticsReportGenerator_startReportGeneration__block_invoke;
  v9[3] = &unk_263FC51C8;
  id v10 = v4;
  id v11 = v2;
  id v7 = v4;
  LOBYTE(v2) = [(NetworkDiagnosticsReportGenerator *)v2 startNetDiagnosticsTaskWithReply:v9];

  return (char)v2;
}

void __58__NetworkDiagnosticsReportGenerator_startReportGeneration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    if (!v6) {
      goto LABEL_21;
    }
    id v10 = diagreportLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Start task %@ failed with error: %@", buf, 0x16u);
    }

    id v12 = [*(id *)(a1 + 40) delegate];
    v13 = [*(id *)(a1 + 40) completionHandler];
    if (v13)
    {
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_20:
      [*(id *)(a1 + 40) setNetDiags:0];
      [*(id *)(a1 + 40) setDiagCase:0];

      goto LABEL_21;
    }
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v14 setObject:*(void *)(*(void *)(a1 + 40) + 80) forKey:@"reportStart"];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 setObject:v16 forKey:@"reportCreator"];

    uint64_t v17 = [MEMORY[0x263EFF910] date];
    [v14 setObject:v17 forKey:@"reportEnd"];

    [v14 setObject:@"Error" forKey:@"reportEndStatus"];
    uint64_t v18 = [v7 description];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = [v7 description];
    }
    else
    {
      v21 = NSString;
      uint64_t v22 = [v7 domain];
      uint64_t v23 = [v7 code];
      uint64_t v24 = [v7 userInfo];
      uint64_t v25 = (void *)v24;
      id v26 = &stru_26BDE2C70;
      if (v24) {
        id v26 = (__CFString *)v24;
      }
      v20 = [v21 stringWithFormat:@"Error Domain: %@ Error Code: %ld %@", v22, v23, v26];
    }
    [v14 setObject:v20 forKey:@"Error"];

    uint64_t v27 = [*(id *)(a1 + 40) completionHandler];

    if (v27)
    {
      uint64_t v28 = [*(id *)(a1 + 40) completionHandler];
      ((void (**)(void, id, void *))v28)[2](v28, v14, v7);

      [*(id *)(a1 + 40) setCompletionHandler:0];
    }
    else
    {
      [v12 reportGeneratorEnded:*(void *)(a1 + 40) reportInfo:v14 error:v7];
    }

    goto LABEL_20;
  }
  unint64_t v8 = diagreportLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v9;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Started task %@ with info: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setNetDiagsResults:v5];
LABEL_21:
}

- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NetworkDiagnosticsReportGenerator *)self options];
  unint64_t v8 = [v7 objectForKeyedSubscript:@"taskName"];

  int v9 = [v6 isEqualToString:v8];
  if (a4 == 3 && v9)
  {
    id v10 = diagreportLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(NetworkDiagnosticsReportGenerator *)self netDiagsResults];
      int v24 = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v11;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "%@ changed to ending. Signaling completion with results %@", (uint8_t *)&v24, 0x16u);
    }
    id v12 = [(DiagnosticReportGenerator *)self delegate];
    v13 = [(DiagnosticReportGenerator *)self completionHandler];
    if (v13) {
      char v14 = 1;
    }
    else {
      char v14 = objc_opt_respondsToSelector();
    }

    v15 = [(NetworkDiagnosticsReportGenerator *)self netDiagsResults];

    if (v15 && (v14 & 1) != 0)
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v16 setObject:self->_reportStart forKey:@"reportStart"];
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      [v16 setObject:v18 forKey:@"reportCreator"];

      uint64_t v19 = [MEMORY[0x263EFF910] date];
      [v16 setObject:v19 forKey:@"reportEnd"];

      [v16 setObject:@"Success" forKey:@"reportEndStatus"];
      v20 = [(NetworkDiagnosticsReportGenerator *)self netDiagsResults];
      v21 = [v20 objectForKeyedSubscript:@"attachments"];
      [v16 setObject:v21 forKey:@"attachments"];

      [(DiagnosticReportGenerator *)self setReportGenerated:1];
      uint64_t v22 = [(DiagnosticReportGenerator *)self completionHandler];

      if (v22)
      {
        uint64_t v23 = [(DiagnosticReportGenerator *)self completionHandler];
        ((void (**)(void, id, void))v23)[2](v23, v16, 0);

        [(DiagnosticReportGenerator *)self setCompletionHandler:0];
      }
      else
      {
        [v12 reportGeneratorEnded:self reportInfo:v16 error:0];
      }
      [(NetworkDiagnosticsReportGenerator *)self setNetDiagsResults:0];
    }
    [(NetworkDiagnosticsReportGenerator *)self setNetDiags:0];
    [(DiagnosticReportGenerator *)self setDiagCase:0];
  }
}

- (id)createDefaultTaskDictionaryWithTaskName:(const char *)a3
{
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [NSString stringWithUTF8String:a3];
  [v4 setObject:v5 forKeyedSubscript:@"taskName"];

  id v6 = +[ABCAdministrator sharedInstance];
  id v7 = [v6 configurationManager];

  unint64_t v8 = [v7 logArchivePath];
  int v9 = [v8 stringByAppendingString:@"/"];
  [v4 setObject:v9 forKeyedSubscript:@"filename"];

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "logArchiveUID"));
  [v4 setObject:v10 forKeyedSubscript:@"taskFileUserID"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "logArchiveGID"));
  [v4 setObject:v11 forKeyedSubscript:@"taskFileGroupID"];

  [v4 setObject:&unk_26BDF5AF8 forKeyedSubscript:@"taskFileMode"];

  return v4;
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)netDiagsResults
{
  return self->_netDiagsResults;
}

- (void)setNetDiagsResults:(id)a3
{
}

- (NSDate)reportStart
{
  return self->_reportStart;
}

- (void)setReportStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportStart, 0);
  objc_storeStrong((id *)&self->_netDiagsResults, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_netDiags, 0);
}

@end
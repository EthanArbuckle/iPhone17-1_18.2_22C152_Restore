@interface DiagnosticReportGenerator
- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4;
- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4 completion:(id)a5;
- (BOOL)reportGenerated;
- (BOOL)startReportGeneration;
- (DiagnosticCase)diagCase;
- (DiagnosticReportGenerator)initWithQueue:(id)a3;
- (DiagnosticReportGeneratorDelegate)delegate;
- (OS_dispatch_queue)queue;
- (double)timeoutSeconds;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagCase:(id)a3;
- (void)setReportGenerated:(BOOL)a3;
- (void)setTimeoutSeconds:(double)a3;
@end

@implementation DiagnosticReportGenerator

- (DiagnosticReportGenerator)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiagnosticReportGenerator;
  v6 = [(DiagnosticReportGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4
{
  return [(DiagnosticReportGenerator *)self generateReportForCase:a3 reportName:a4 completion:0];
}

- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = diagreportLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = [v8 caseId];
    *(_DWORD *)buf = 138412546;
    v44 = v12;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Generating a report for case ID %@, desired report file name %@", buf, 0x16u);
  }
  [(DiagnosticReportGenerator *)self setDiagCase:v8];
  if (v10) {
    [(DiagnosticReportGenerator *)self setCompletionHandler:v10];
  }
  v13 = [MEMORY[0x263EFF910] date];
  v14 = [(DiagnosticReportGenerator *)self delegate];
  BOOL v15 = [(DiagnosticReportGenerator *)self startReportGeneration];
  if (v15)
  {
    [(DiagnosticReportGenerator *)self timeoutSeconds];
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    v18 = [(DiagnosticReportGenerator *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__DiagnosticReportGenerator_generateReportForCase_reportName_completion___block_invoke;
    block[3] = &unk_263FC3018;
    block[4] = self;
    id v39 = v13;
    id v40 = v14;
    dispatch_after(v17, v18, block);
  }
  else
  {
    v35 = v14;
    id v36 = v9;
    id v37 = v8;
    v19 = diagreportLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_INFO, "report generation did not start", buf, 2u);
    }

    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v20 setObject:v13 forKey:@"reportStart"];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 setObject:v22 forKey:@"reportCreator"];

    v23 = [MEMORY[0x263EFF910] date];
    [v20 setObject:v23 forKey:@"reportEnd"];

    [v20 setObject:@"Error" forKey:@"reportEndStatus"];
    [v20 setObject:@"Failed to start report generation." forKey:@"reportError"];
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08438];
    v41 = @"error";
    v26 = NSString;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = [v26 stringWithFormat:@"%@ failed to start", v28];
    v42 = v29;
    v30 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v31 = [v24 errorWithDomain:v25 code:5 userInfo:v30];

    v32 = [(DiagnosticReportGenerator *)self completionHandler];

    if (v32)
    {
      v33 = [(DiagnosticReportGenerator *)self completionHandler];
      ((void (**)(void, id, void *))v33)[2](v33, v20, v31);

      [(DiagnosticReportGenerator *)self setCompletionHandler:0];
      id v9 = v36;
      id v8 = v37;
      v14 = v35;
    }
    else
    {
      v14 = v35;
      id v9 = v36;
      id v8 = v37;
      if (objc_opt_respondsToSelector()) {
        [v35 reportGeneratorEnded:self reportInfo:v20 error:v31];
      }
    }
    [(DiagnosticReportGenerator *)self setDiagCase:0];
  }
  return v15;
}

void __73__DiagnosticReportGenerator_generateReportForCase_reportName_completion___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) reportGenerated] & 1) == 0)
  {
    v2 = diagreportLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "report generator timed out.", buf, 2u);
    }

    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:*(void *)(a1 + 40) forKey:@"reportStart"];
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    [v3 setObject:v5 forKey:@"reportCreator"];

    v6 = [MEMORY[0x263EFF910] date];
    [v3 setObject:v6 forKey:@"reportEnd"];

    [v3 setObject:@"Timeout" forKey:@"reportEndStatus"];
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08438];
    v18 = @"error";
    id v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@ timed out", v11];
    v19[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v14 = [v7 errorWithDomain:v8 code:60 userInfo:v13];

    BOOL v15 = [*(id *)(a1 + 32) completionHandler];

    if (v15)
    {
      double v16 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, id, void *))v16)[2](v16, v3, v14);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [*(id *)(a1 + 48) reportGeneratorEnded:*(void *)(a1 + 32) reportInfo:v3 error:v14];
    }
    [*(id *)(a1 + 32) setDiagCase:0];
  }
}

- (BOOL)startReportGeneration
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (BOOL)reportGenerated
{
  return self->_reportGenerated;
}

- (void)setReportGenerated:(BOOL)a3
{
  self->_reportGenerated = a3;
}

- (DiagnosticReportGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DiagnosticReportGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DiagnosticCase)diagCase
{
  return self->_diagCase;
}

- (void)setDiagCase:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_diagCase, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
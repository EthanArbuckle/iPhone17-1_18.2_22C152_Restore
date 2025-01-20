@interface CellularDataDiagnosticsSuiteController
- (void)start;
@end

@implementation CellularDataDiagnosticsSuiteController

- (void)start
{
  v3 = [(DKDiagnosticController *)self result];
  [v3 setStatusCode:&unk_26DD33A58];

  v4 = objc_alloc_init(SpeedTestConfig);
  cellularTestStartRef = self->cellularTestStartRef;
  self->cellularTestStartRef = v4;

  v6 = self->cellularTestStartRef;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CellularDataDiagnosticsSuiteController_start__block_invoke;
  v7[3] = &unk_264854378;
  v7[4] = self;
  [(SpeedTestConfig *)v6 startDownloadTest:v7];
}

uint64_t __47__CellularDataDiagnosticsSuiteController_start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_228C6D000, v2, OS_LOG_TYPE_INFO, "CellularThroughput: speed test passed", (uint8_t *)&v8, 2u);
  }

  v3 = [*(id *)(a1 + 32) result];
  [v3 setStatusCode:&unk_26DD33A70];

  v4 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [*(id *)(a1 + 32) result];
    v6 = [v5 statusCode];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_228C6D000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: status code: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) setFinished:1];
  }
  return result;
}

- (void).cxx_destruct
{
}

@end
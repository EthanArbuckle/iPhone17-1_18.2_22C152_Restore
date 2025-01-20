@interface GTMTLDiagnosticsService
- (GTMTLDiagnosticsService)init;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)init;
- (void)notifyCommandBufferIssue:(id)a3;
- (void)notifyDiagnosticsIssue:(id)a3;
- (void)raiseRuntimeIssue:(id)a3;
@end

@implementation GTMTLDiagnosticsService

- (GTMTLDiagnosticsService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GTMTLDiagnosticsService;
  v2 = [(GTMTLDiagnosticsService *)&v9 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "DiagnosticsService");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[GTMTLDiagnosticsService init](v5);
    }
    uint64_t v6 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (GTObservableService *)v6;
  }
  return v2;
}

- (unint64_t)registerObserver:(id)a3
{
  return [(GTObservableService *)self->_observers registerObserver:a3];
}

- (void)deregisterObserver:(unint64_t)a3
{
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
}

- (void)raiseRuntimeIssue:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    -[GTMTLDiagnosticsService raiseRuntimeIssue:](log);
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (v4)
  {
LABEL_3:
    uint64_t v6 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[GTMTLDiagnosticsService raiseRuntimeIssue:](v4, v6);
    }

    goto LABEL_9;
  }
  v7 = self->_log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[GTMTLDiagnosticsService raiseRuntimeIssue:](v7);
  }
LABEL_9:
}

- (void)notifyDiagnosticsIssue:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__GTMTLDiagnosticsService_notifyDiagnosticsIssue___block_invoke;
  v7[3] = &unk_264E28A70;
  id v8 = v4;
  id v6 = v4;
  [(GTObservableService *)observers notifyAll:v7];
}

uint64_t __50__GTMTLDiagnosticsService_notifyDiagnosticsIssue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyDiagnosticsIssue:*(void *)(a1 + 32)];
}

- (void)notifyCommandBufferIssue:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__GTMTLDiagnosticsService_notifyCommandBufferIssue___block_invoke;
  v7[3] = &unk_264E28A70;
  id v8 = v4;
  id v6 = v4;
  [(GTObservableService *)observers notifyAll:v7];
}

uint64_t __52__GTMTLDiagnosticsService_notifyCommandBufferIssue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyCommandBufferIssue:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "Create Diagnostics Service", v1, 2u);
}

- (void)raiseRuntimeIssue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "raiseRuntimeIssue: Invalid messagePrefix:(nil)", v1, 2u);
}

- (void)raiseRuntimeIssue:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 cStringUsingEncoding:4];
  _os_log_fault_impl(&dword_23C048000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v3, 0xCu);
}

- (void)raiseRuntimeIssue:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "raiseRuntimeIssue", v1, 2u);
}

@end
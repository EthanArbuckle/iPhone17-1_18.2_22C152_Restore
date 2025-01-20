@interface CSProcess
- (BOOL)exemptFromMitigations;
- (BOOL)isRunning;
- (CSProcess)initWithIdentifier:(id)a3;
- (CSProcess)initWithIdentifier:(id)a3 andPID:(int)a4;
- (NSString)identifier;
- (OS_dispatch_source)processMonitor;
- (id)description;
- (int)currentPID;
- (void)dealloc;
- (void)monitorForExit;
- (void)performCleanupOnExit;
- (void)setCurrentPID:(int)a3;
- (void)setExemptFromMitigations:(BOOL)a3;
- (void)setProcessMonitor:(id)a3;
@end

@implementation CSProcess

- (int)currentPID
{
  return self->_currentPID;
}

- (void)setCurrentPID:(int)a3
{
  if (a3 < 0)
  {
    v4 = processLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CSProcess setCurrentPID:]((uint64_t)self, v4);
    }
  }
  else
  {
    self->_currentPID = a3;
    [(CSProcess *)self monitorForExit];
  }
}

- (void)monitorForExit
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_24A698000, a2, OS_LOG_TYPE_ERROR, "Monitor for pid:%d already exists", (uint8_t *)v3, 8u);
}

- (void)performCleanupOnExit
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24A698000, a2, OS_LOG_TYPE_ERROR, "Attmpted cleanup on Process:%@ with no currentPID", (uint8_t *)&v3, 0xCu);
}

- (CSProcess)initWithIdentifier:(id)a3 andPID:(int)a4
{
  uint64_t v5 = [(CSProcess *)self initWithIdentifier:a3];
  v5->_currentPID = a4;
  [(CSProcess *)v5 monitorForExit];
  return v5;
}

- (CSProcess)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSProcess;
  v6 = [(CSProcess *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_currentPID = -1;
    v7->_exemptFromMitigations = 0;
    processMonitor = v7->_processMonitor;
    v7->_processMonitor = 0;
  }
  return v7;
}

- (BOOL)exemptFromMitigations
{
  return self->_exemptFromMitigations;
}

- (void)dealloc
{
  processMonitor = self->_processMonitor;
  if (processMonitor) {
    dispatch_source_cancel(processMonitor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSProcess;
  [(CSProcess *)&v4 dealloc];
}

- (BOOL)isRunning
{
  return self->_currentPID != -1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CSProcess with nameIdentifier: %@, pid: %d", self->_identifier, self->_currentPID];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setExemptFromMitigations:(BOOL)a3
{
  self->_exemptFromMitigations = a3;
}

- (OS_dispatch_source)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCurrentPID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24A698000, a2, OS_LOG_TYPE_ERROR, "Attmpted setting invalid PID for Process:%@", (uint8_t *)&v3, 0xCu);
}

@end
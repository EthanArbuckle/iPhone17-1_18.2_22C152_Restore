@interface DKDiagnosticServiceRequest
- (BOOL)completed;
- (DKDiagnosticHostContext)context;
- (DKDiagnosticServiceRequest)initWithHostServicesDelegate:(id)a3;
- (NSXPCConnection)connection;
- (id)completion;
- (id)hostServicesDelegate;
- (void)_completeWithDiagnosticResult:(id)a3 error:(id)a4;
- (void)cancelExtensionRequest;
- (void)completeWithPayload:(id)a3 completion:(id)a4;
- (void)didFailStart;
- (void)didInterrupt;
- (void)didInvalidate;
- (void)dismissViewControllerWithCompletion:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setContext:(id)a3;
- (void)setHostServicesDelegate:(id)a3;
@end

@implementation DKDiagnosticServiceRequest

- (DKDiagnosticServiceRequest)initWithHostServicesDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKDiagnosticServiceRequest;
  v5 = [(DKDiagnosticServiceRequest *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_completed = 0;
    objc_storeWeak(&v5->_hostServicesDelegate, v4);
  }

  return v6;
}

- (void)didInvalidate
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  id v4 = DKErrorLocalizedDescriptionForCode(-1001);
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [v3 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v5];

  [(DKDiagnosticServiceRequest *)self _completeWithDiagnosticResult:0 error:v6];
}

- (void)didInterrupt
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  id v4 = DKErrorLocalizedDescriptionForCode(-1001);
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [v3 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v5];

  [(DKDiagnosticServiceRequest *)self _completeWithDiagnosticResult:0 error:v6];
}

- (void)didFailStart
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  id v4 = DKErrorLocalizedDescriptionForCode(-1001);
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [v3 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v5];

  [(DKDiagnosticServiceRequest *)self _completeWithDiagnosticResult:0 error:v6];
}

- (void)completeWithPayload:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  objc_super v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[DKDiagnosticServiceRequest completeWithPayload:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7);
  [(DKDiagnosticServiceRequest *)self _completeWithDiagnosticResult:v6 error:0];
}

- (void)cancelExtensionRequest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[DKDiagnosticServiceRequest cancelExtensionRequest]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(DKDiagnosticServiceRequest *)self _completeWithDiagnosticResult:0 error:0];
}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = (void (**)(void))a3;
  int v4 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[DKDiagnosticServiceRequest dismissViewControllerWithCompletion:]";
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)_completeWithDiagnosticResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (![(DKDiagnosticServiceRequest *)self completed])
  {
    [(DKDiagnosticServiceRequest *)self setCompleted:1];
    uint64_t v7 = [(DKDiagnosticServiceRequest *)self completion];

    if (v7)
    {
      objc_super v8 = [(DKDiagnosticServiceRequest *)self completion];
      ((void (**)(void, id, id))v8)[2](v8, v10, v6);
    }
    int v9 = [(DKDiagnosticServiceRequest *)self connection];
    [v9 invalidate];
  }
}

- (id)hostServicesDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_hostServicesDelegate);
  return WeakRetained;
}

- (void)setHostServicesDelegate:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (DKDiagnosticHostContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak(&self->_hostServicesDelegate);
}

@end
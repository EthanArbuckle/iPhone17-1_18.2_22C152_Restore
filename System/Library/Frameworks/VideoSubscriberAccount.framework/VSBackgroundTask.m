@interface VSBackgroundTask
- (BOOL)begin;
- (NSString)name;
- (RBSAssertion)assertion;
- (VSBackgroundTask)init;
- (VSBackgroundTaskDelegate)delegate;
- (void)begin;
- (void)end;
- (void)setAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VSBackgroundTask

- (VSBackgroundTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSBackgroundTask;
  v2 = [(VSBackgroundTask *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1F34B2EC8;
  }
  return v3;
}

- (BOOL)begin
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F96478] currentProcess];
  v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
  id v5 = objc_alloc(MEMORY[0x1E4F96318]);
  objc_super v6 = [(VSBackgroundTask *)self name];
  v14[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v8 = (void *)[v5 initWithExplanation:v6 target:v3 attributes:v7];

  id v13 = 0;
  LOBYTE(v7) = [v8 acquireWithError:&v13];
  id v9 = v13;
  if ((v7 & 1) == 0)
  {
    v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(VSBackgroundTask *)(uint64_t)v9 begin];
    }

    v11 = [(VSBackgroundTask *)self delegate];
    [v11 backgroundTaskExpired:self];
  }
  [(VSBackgroundTask *)self setAssertion:v8];

  return 1;
}

- (void)end
{
  v3 = [(VSBackgroundTask *)self assertion];
  [v3 invalidate];

  [(VSBackgroundTask *)self setAssertion:0];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (VSBackgroundTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSBackgroundTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)begin
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire assertion: %@", (uint8_t *)&v2, 0xCu);
}

@end
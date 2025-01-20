@interface _AAURLSessionConfigurationTask
- (AAURLSession)session;
- (NSString)description;
- (NSURLRequest)originalRequest;
- (_AAURLSessionConfigurationTask)init;
- (_AAURLSessionConfigurationTask)initWithSession:(id)a3 request:(id)a4 completion:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_initiateSessionTaskWithConfiguration:(id)a3;
- (void)_invokeCompletionWithData:(id)a3 response:(id)a4 error:(id)a5;
- (void)_unfairLock_initiateConfigurationTask;
- (void)cancel;
- (void)resume;
- (void)suspend;
@end

@implementation _AAURLSessionConfigurationTask

- (_AAURLSessionConfigurationTask)init
{
  return 0;
}

- (_AAURLSessionConfigurationTask)initWithSession:(id)a3 request:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"AAURLSessionConfigurationTask.m", 47, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"AAURLSessionConfigurationTask.m", 46, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"AAURLSessionConfigurationTask.m", 48, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)_AAURLSessionConfigurationTask;
  v13 = [(_AAURLSessionConfigurationTask *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_session, a3);
    objc_storeStrong((id *)&v14->_originalRequest, a4);
    uint64_t v15 = MEMORY[0x1A622F430](v12);
    id completion = v14->_completion;
    v14->_id completion = (id)v15;

    v14->_unfairLock._os_unfair_lock_opaque = 0;
    *(unsigned char *)&v14->_flags &= 0xFCu;
  }

  return v14;
}

- (void)_unfairLock_initiateConfigurationTask
{
  os_unfair_lock_assert_owner(&self->_unfairLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    v3 = +[AARemoteServer sharedServer];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71___AAURLSessionConfigurationTask__unfairLock_initiateConfigurationTask__block_invoke;
    v4[3] = &unk_1E5A4AD60;
    v4[4] = self;
    [v3 configurationWithCompletion:v4];

    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void)_initiateSessionTaskWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AAURLSessionConfigurationTask.m", 87, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v6 = [(NSURLRequest *)self->_originalRequest URL];
  v7 = objc_msgSend(v6, "aa_endpoint");

  if (v7)
  {
    v8 = [v5 urlForEndpoint:v7];
    if (v8)
    {
      v9 = (void *)[(NSURLRequest *)self->_originalRequest mutableCopy];
      [v9 setURL:v8];
      session = self->_session;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke;
      v16[3] = &unk_1E5A489F0;
      v16[4] = self;
      id v11 = [(AAURLSession *)session dataTaskWithRequest:v9 completion:v16];
      sessionTask = self->_sessionTask;
      self->_sessionTask = v11;

      [(AAURLSessionTaskProtocol *)self->_sessionTask resume];
    }
    else
    {
      v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_AAURLSessionConfigurationTask _initiateSessionTaskWithConfiguration:]((uint64_t)v7, v14);
      }

      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4401);
      [(_AAURLSessionConfigurationTask *)self _invokeCompletionWithData:0 response:0 error:v9];
    }
  }
  else
  {
    v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_AAURLSessionConfigurationTask _initiateSessionTaskWithConfiguration:]((id *)&self->_originalRequest, v13);
    }

    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4401);
    [(_AAURLSessionConfigurationTask *)self _invokeCompletionWithData:0 response:0 error:v8];
  }
}

- (void)_invokeCompletionWithData:(id)a3 response:(id)a4 error:(id)a5
{
  p_unfairLock = &self->_unfairLock;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  os_unfair_lock_lock(p_unfairLock);
  if (!self->_completion)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"AAURLSessionConfigurationTask.m" lineNumber:120 description:@"Attempted to call completion twice!"];
  }
  uint64_t v15 = (void (**)(id, id, id, id))MEMORY[0x1A622F430]();
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock(p_unfairLock);
  v15[2](v15, v12, v11, v10);
}

- (void)suspend
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41___AAURLSessionConfigurationTask_suspend__block_invoke;
  v3[3] = &unk_1E5A4AD88;
  p_unfairLock = &self->_unfairLock;
  v3[4] = self;
  v3[5] = a2;
  os_unfair_lock_lock(&self->_unfairLock);
  __41___AAURLSessionConfigurationTask_suspend__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)resume
{
  p_unfairLock = &self->_unfairLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40___AAURLSessionConfigurationTask_resume__block_invoke;
  v3[3] = &unk_1E5A48358;
  v3[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __40___AAURLSessionConfigurationTask_resume__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)cancel
{
  *(unsigned char *)&self->_flags |= 1u;
}

- (NSString)description
{
  p_unfairLock = &self->_unfairLock;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __45___AAURLSessionConfigurationTask_description__block_invoke;
  v13 = &unk_1E5A4ADB0;
  v14 = self;
  os_unfair_lock_lock(&self->_unfairLock);
  v4 = __45___AAURLSessionConfigurationTask_description__block_invoke((uint64_t)&v10);
  os_unfair_lock_unlock(p_unfairLock);
  id v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"<%@: %p {taskDescription: %@}>", v7, self, v4, v10, v11];

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  session = self->_session;
  originalRequest = self->_originalRequest;
  id completion = self->_completion;

  return (id)[v4 initWithSession:session request:originalRequest completion:completion];
}

- (AAURLSession)session
{
  return self->_session;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
  objc_storeStrong((id *)&self->_configurationTask, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)_initiateSessionTaskWithConfiguration:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [*a1 URL];
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Failed to find endpoint in URL: %{private}@", (uint8_t *)&v4, 0xCu);
}

- (void)_initiateSessionTaskWithConfiguration:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Failed to find URL for endpoint: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
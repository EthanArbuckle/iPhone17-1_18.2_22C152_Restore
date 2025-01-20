@interface VSViewServiceRequestOperation
- (BOOL)viewServiceHostViewController:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4;
- (NSUUID)requestID;
- (VSOptional)result;
- (VSViewServiceHostViewController)viewServiceHostViewController;
- (VSViewServiceRequest)viewServiceRequest;
- (VSViewServiceRequestOperation)init;
- (VSViewServiceRequestOperation)initWithViewServiceRequest:(id)a3;
- (VSViewServiceRequestOperationDelegate)delegate;
- (void)_dismissViewController;
- (void)_dismissViewControllerIfRequired;
- (void)_presentViewController;
- (void)cancel;
- (void)dismissViewServiceHostViewController:(id)a3;
- (void)executionDidBegin;
- (void)finishExecutionIfPossible;
- (void)presentViewServiceHostViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResult:(id)a3;
- (void)setViewServiceHostViewController:(id)a3;
- (void)viewServiceHostViewController:(id)a3 didCancelRequest:(id)a4;
- (void)viewServiceHostViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4;
- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5;
- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5;
@end

@implementation VSViewServiceRequestOperation

- (VSViewServiceRequestOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSViewServiceRequestOperation)initWithViewServiceRequest:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The viewServiceRequest parameter must not be nil."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VSViewServiceRequestOperation;
  v5 = [(VSViewServiceRequestOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    viewServiceRequest = v5->_viewServiceRequest;
    v5->_viewServiceRequest = (VSViewServiceRequest *)v6;

    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v8;

    v10 = objc_alloc_init(VSOptional);
    v11 = v5->_result;
    v5->_result = v10;
  }
  return v5;
}

- (void)_presentViewController
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  VSRequireMainThread();
  v3 = [(VSViewServiceRequestOperation *)self viewServiceHostViewController];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will present view controller: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [(VSViewServiceRequestOperation *)self delegate];
  [v5 viewServiceRequestOperation:self presentViewController:v3];

  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Did present view controller: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_dismissViewController
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  VSRequireMainThread();
  v3 = [(VSViewServiceRequestOperation *)self viewServiceHostViewController];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will dismiss view controller: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [(VSViewServiceRequestOperation *)self delegate];
  [v5 viewServiceRequestOperation:self dismissViewController:v3];

  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Did dismiss view controller: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_dismissViewControllerIfRequired
{
  if (self->_isPresentingViewController)
  {
    [(VSViewServiceRequestOperation *)self _dismissViewController];
    self->_isPresentingViewController = 0;
  }
  else
  {
    v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "No view controller to dismiss.", v4, 2u);
    }
  }
}

- (void)presentViewServiceHostViewController:(id)a3
{
  VSRequireMainThread();
  self->_isPresentingViewController = 1;

  [(VSViewServiceRequestOperation *)self _presentViewController];
}

- (void)dismissViewServiceHostViewController:(id)a3
{
  VSRequireMainThread();

  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
}

- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "View service returned response: %@.", (uint8_t *)&v11, 0xCu);
  }

  VSRequireMainThread();
  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
  uint64_t v8 = (void *)[v6 copy];
  uint64_t v9 = +[VSFailable failableWithObject:v8];
  v10 = +[VSOptional optionalWithObject:v9];
  [(VSViewServiceRequestOperation *)self setResult:v10];

  [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
}

- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v6 = a5;
  int v7 = VSErrorLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[VSViewServiceRequestOperation viewServiceHostViewController:request:didFailWithError:]((uint64_t)v6, v7);
  }

  VSRequireMainThread();
  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
  uint64_t v8 = +[VSFailable failableWithError:v6];
  uint64_t v9 = +[VSOptional optionalWithObject:v8];
  [(VSViewServiceRequestOperation *)self setResult:v9];

  [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
}

- (void)viewServiceHostViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4
{
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "View service chose additional providers.", v9, 2u);
  }

  VSRequireMainThread();
  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
  id v6 = VSPublicUnsupportedProviderError(0, 0);
  int v7 = +[VSFailable failableWithError:v6];
  uint64_t v8 = +[VSOptional optionalWithObject:v7];
  [(VSViewServiceRequestOperation *)self setResult:v8];

  [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
}

- (void)viewServiceHostViewController:(id)a3 didCancelRequest:(id)a4
{
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "View service cancelled.", v9, 2u);
  }

  VSRequireMainThread();
  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
  id v6 = VSPublicError(0, 2, 0);
  int v7 = +[VSFailable failableWithError:v6];
  uint64_t v8 = +[VSOptional optionalWithObject:v7];
  [(VSViewServiceRequestOperation *)self setResult:v8];

  [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
}

- (BOOL)viewServiceHostViewController:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4
{
  id v5 = a4;
  VSRequireMainThread();
  id v6 = [(VSViewServiceRequestOperation *)self delegate];
  LOBYTE(self) = [v6 viewServiceRequestOperation:self shouldAuthenticateAccountProviderWithIdentifier:v5];

  return (char)self;
}

- (void)executionDidBegin
{
  id v11 = 0;
  int v3 = VSLoadInterfaceFramework((uint64_t)&v11);
  id v4 = v11;
  id v5 = v4;
  if (v3)
  {
    Class v6 = NSClassFromString((NSString *)@"VSViewServiceHostViewController");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__VSViewServiceRequestOperation_executionDidBegin__block_invoke;
    v10[3] = &unk_1E6BD3308;
    v10[4] = self;
    v10[5] = v6;
    VSPerformBlockOnMainThread(v10);
  }
  else
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
    }
    id v7 = v5;
    uint64_t v8 = +[VSFailable failableWithError:v7];
    uint64_t v9 = +[VSOptional optionalWithObject:v8];
    [(VSViewServiceRequestOperation *)self setResult:v9];

    [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
  }
}

void __50__VSViewServiceRequestOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) viewServiceRequest];
  id v2 = [*(id *)(a1 + 32) viewServiceHostViewController];
  if (!v2)
  {
    id v2 = objc_alloc_init(*(Class *)(a1 + 40));
    [*(id *)(a1 + 32) setViewServiceHostViewController:v2];
  }
  [v2 setDelegate:*(void *)(a1 + 32)];
  int v3 = [*(id *)(a1 + 32) requestID];
  [v2 enqueueViewServiceRequest:v4 withIdentifier:v3];
}

- (void)finishExecutionIfPossible
{
  v4.receiver = self;
  v4.super_class = (Class)VSViewServiceRequestOperation;
  [(VSAsyncOperation *)&v4 finishExecutionIfPossible];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__VSViewServiceRequestOperation_finishExecutionIfPossible__block_invoke;
  v3[3] = &unk_1E6BD29A8;
  v3[4] = self;
  VSPerformBlockOnMainThread(v3);
}

uint64_t __58__VSViewServiceRequestOperation_finishExecutionIfPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewServiceHostViewController:0];
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceRequestOperation;
  [(VSAsyncOperation *)&v6 cancel];
  [(VSViewServiceRequestOperation *)self _dismissViewControllerIfRequired];
  int v3 = VSPublicError(0, 2, 0);
  objc_super v4 = +[VSFailable failableWithError:v3];
  id v5 = +[VSOptional optionalWithObject:v4];
  [(VSViewServiceRequestOperation *)self setResult:v5];

  [(VSViewServiceRequestOperation *)self finishExecutionIfPossible];
}

- (VSViewServiceRequest)viewServiceRequest
{
  return self->_viewServiceRequest;
}

- (VSViewServiceRequestOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSViewServiceRequestOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (VSViewServiceHostViewController)viewServiceHostViewController
{
  return self->_viewServiceHostViewController;
}

- (void)setViewServiceHostViewController:(id)a3
{
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_viewServiceHostViewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_viewServiceRequest, 0);
}

- (void)viewServiceHostViewController:(uint64_t)a1 request:(NSObject *)a2 didFailWithError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "View service failed: %@", (uint8_t *)&v2, 0xCu);
}

@end
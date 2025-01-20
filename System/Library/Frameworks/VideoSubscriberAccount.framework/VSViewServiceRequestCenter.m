@interface VSViewServiceRequestCenter
+ (id)sharedViewServiceRequestCenter;
- (NSOperationQueue)completionQueue;
- (NSOperationQueue)requestQueue;
- (VSViewServiceRequestCenter)init;
- (id)enqueueCompletionHandlerBlock:(id)a3;
- (id)enqueueRequest:(id)a3 withAccountManagerDelegate:(id)a4 operationDelegate:(id)a5 completionHandler:(id)a6;
- (void)setCompletionQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation VSViewServiceRequestCenter

+ (id)sharedViewServiceRequestCenter
{
  if (sharedViewServiceRequestCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedViewServiceRequestCenter___vs_lazy_init_predicate, &__block_literal_global_36);
  }
  v2 = (void *)sharedViewServiceRequestCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __60__VSViewServiceRequestCenter_sharedViewServiceRequestCenter__block_invoke()
{
  sharedViewServiceRequestCenter___vs_lazy_init_variable = objc_alloc_init(VSViewServiceRequestCenter);

  return MEMORY[0x1F41817F8]();
}

- (VSViewServiceRequestCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSViewServiceRequestCenter;
  v2 = [(VSViewServiceRequestCenter *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;

    [(NSOperationQueue *)v2->_requestQueue setName:@"VSViewServiceRequestCenter.Request"];
    [(NSOperationQueue *)v2->_requestQueue setMaxConcurrentOperationCount:1];
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = v5;

    [(NSOperationQueue *)v2->_completionQueue setName:@"VSViewServiceRequestCenter.Completion"];
  }
  return v2;
}

- (id)enqueueCompletionHandlerBlock:(id)a3
{
  v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
  v5 = [(VSViewServiceRequestCenter *)self completionQueue];
  [v5 addOperation:v4];

  v6 = [[VSAccountManagerResult alloc] initWithOperation:v4];

  return v6;
}

- (id)enqueueRequest:(id)a3 withAccountManagerDelegate:(id)a4 operationDelegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The viewServiceRequest parameter must not be nil."];
  }
  int v14 = [v10 allowsAuthenticationUI];
  if (!v11 && v14) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This kind of request requires a delegate."];
  }
  uint64_t v15 = [v10 localizedVideoTitle];
  if (v15)
  {
    v16 = (void *)v15;
    char v17 = [v10 allowsAuthenticationUI];

    if ((v17 & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A localized video title is not appropriate for this kind of request."];
    }
  }
  v18 = [[VSViewServiceRequestOperation alloc] initWithViewServiceRequest:v10];
  [(VSViewServiceRequestOperation *)v18 setDelegate:v12];
  v19 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke;
  v30 = &unk_1E6BD2E90;
  v31 = v18;
  id v32 = v13;
  id v20 = v13;
  v21 = v18;
  v22 = [v19 blockOperationWithBlock:&v27];
  objc_msgSend(v22, "addDependency:", v21, v27, v28, v29, v30);
  v23 = [(VSViewServiceRequestCenter *)self completionQueue];
  [v23 addOperation:v22];

  v24 = [(VSViewServiceRequestCenter *)self requestQueue];
  [v24 addOperation:v21];

  v25 = [[VSAccountManagerResult alloc] initWithOperation:v21];

  return v25;
}

void __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke_2;
  v3[3] = &unk_1E6BD30B0;
  id v4 = *(id *)(a1 + 40);
  [v2 conditionallyUnwrapObject:v3];
}

uint64_t __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (NSOperationQueue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
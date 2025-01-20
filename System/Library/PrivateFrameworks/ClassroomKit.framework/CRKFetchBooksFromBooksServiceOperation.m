@interface CRKFetchBooksFromBooksServiceOperation
+ (id)defaultRequest;
- (BOOL)isAsynchronous;
- (CRKFetchBooksFromBooksServiceOperation)init;
- (CRKFetchBooksFromBooksServiceOperation)initWithRequest:(id)a3;
- (void)main;
@end

@implementation CRKFetchBooksFromBooksServiceOperation

+ (id)defaultRequest
{
  v2 = objc_opt_new();
  [v2 setIncludeImages:1];

  return v2;
}

- (CRKFetchBooksFromBooksServiceOperation)init
{
  v3 = [(id)objc_opt_class() defaultRequest];
  v4 = [(CRKFetchBooksFromBooksServiceOperation *)self initWithRequest:v3];

  return v4;
}

- (CRKFetchBooksFromBooksServiceOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchBooksFromBooksServiceOperation;
  v6 = [(CRKFetchBooksFromBooksServiceOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mRequest, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 376);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke_2;
  v5[3] = &unk_2646F53C8;
  v5[4] = v3;
  [v2 fetchBooksWithRequest:v4 completion:v5];
}

uint64_t __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "endOperationWithError:");
  }
  else {
    return [v3 endOperationWithResultObject:a2];
  }
}

- (void).cxx_destruct
{
}

@end
@interface VSVerificationDataOperation
- (AKAnisetteProvisioningController)provisioningController;
- (VSOptional)result;
- (VSVerificationDataOperation)init;
- (void)_finishWithData:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_finishWithResult:(int)a3 bytes:(char *)a4 length:(unsigned int)a5;
- (void)executionDidBegin;
- (void)setProvisioningController:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSVerificationDataOperation

- (VSVerificationDataOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSVerificationDataOperation;
  v2 = [(VSVerificationDataOperation *)&v8 init];
  if (v2)
  {
    v3 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x1E4F4EF58]);
    provisioningController = v2->_provisioningController;
    v2->_provisioningController = v3;

    v5 = objc_alloc_init(VSOptional);
    v6 = v2->_result;
    v2->_result = v5;
  }
  return v2;
}

- (void)_finishWithData:(id)a3
{
  v4 = +[VSFailable failableWithObject:a3];
  v5 = +[VSOptional optionalWithObject:v4];
  [(VSVerificationDataOperation *)self setResult:v5];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  v5 = VSErrorLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VSVerificationDataOperation _finishWithError:]((uint64_t)v4, v5);
  }

  v6 = +[VSFailable failableWithError:v4];
  v7 = +[VSOptional optionalWithObject:v6];
  [(VSVerificationDataOperation *)self setResult:v7];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (void)_finishWithResult:(int)a3 bytes:(char *)a4 length:(unsigned int)a5
{
  if (a3 || !a5)
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
    [(VSVerificationDataOperation *)self _finishWithError:v7];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a5];
    jEHf8Xzsv8K((uint64_t)a4);
    [(VSVerificationDataOperation *)self _finishWithData:v7];
  }
}

- (void)executionDidBegin
{
  uint64_t v8 = 0;
  unsigned int v7 = 0;
  pggRSNuJfiTW0g((uint64_t)&v8, (uint64_t)&v7);
  if (v3 == -45061 || v3 == -45065)
  {
    v5 = [(VSVerificationDataOperation *)self provisioningController];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__VSVerificationDataOperation_executionDidBegin__block_invoke;
    v6[3] = &unk_1E6BD3F48;
    v6[4] = self;
    [v5 provisionWithCompletion:v6];
  }
  else
  {
    [(VSVerificationDataOperation *)self _finishWithResult:v3 bytes:v8 length:v7];
  }
}

void __48__VSVerificationDataOperation_executionDidBegin__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    uint64_t v9 = 0;
    unsigned int v8 = 0;
    pggRSNuJfiTW0g((uint64_t)&v9, (uint64_t)&v8);
    [*(id *)(a1 + 32) _finishWithResult:v7 bytes:v9 length:v8];
  }
  else
  {
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
    }
    [*(id *)(a1 + 32) _finishWithError:v6];
  }
}

- (VSOptional)result
{
  return (VSOptional *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResult:(id)a3
{
}

- (AKAnisetteProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)_finishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain verification data: %@", (uint8_t *)&v2, 0xCu);
}

@end
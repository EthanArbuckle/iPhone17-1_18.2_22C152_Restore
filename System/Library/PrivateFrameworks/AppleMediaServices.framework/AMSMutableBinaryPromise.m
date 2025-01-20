@interface AMSMutableBinaryPromise
+ (BOOL)cancelPromise:(id)a3;
+ (BOOL)finishPromise:(id)a3 withError:(id)a4;
+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4;
+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4;
+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithPromise:(id)a3;
- (BOOL)finishWithSuccess;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation AMSMutableBinaryPromise

+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F1CC38];
  if (!a4) {
    v7 = 0;
  }
  id v8 = v7;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 backingPromise];
  char v12 = [v11 finishWithResult:v8 error:v9];

  [v10 stopRetainingSelf];
  return v12;
}

+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 backingPromise];
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  char v8 = [v6 finishWithResult:v7];

  [v5 stopRetainingSelf];
  return v8;
}

- (BOOL)finishWithSuccess
{
  return [(AMSMutableBinaryPromise *)self finishWithSuccess:1 error:0];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  LOBYTE(v4) = [(id)objc_opt_class() finishPromise:self withSuccess:v4 error:v6];

  return v4;
}

- (BOOL)cancel
{
  v3 = objc_opt_class();
  return [v3 cancelPromise:self];
}

- (BOOL)finishWithError:(id)a3
{
  return [(AMSMutableBinaryPromise *)self finishWithSuccess:0 error:a3];
}

- (BOOL)finishWithPromise:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class() finishPromise:self withPromise:v4];

  return (char)self;
}

+ (BOOL)cancelPromise:(id)a3
{
  id v3 = a3;
  id v4 = [v3 backingPromise];
  char v5 = [v4 cancel];

  [v3 stopRetainingSelf];
  return v5;
}

+ (BOOL)finishPromise:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 backingPromise];
  char v8 = [v7 finishWithError:v5];

  [v6 stopRetainingSelf];
  return v8;
}

+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__AMSMutableBinaryPromise_finishPromise_withPromise___block_invoke;
  v10[3] = &unk_1E55A4D58;
  char v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 addFinishBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __53__AMSMutableBinaryPromise_finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) finishWithSuccess:a2 error:a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
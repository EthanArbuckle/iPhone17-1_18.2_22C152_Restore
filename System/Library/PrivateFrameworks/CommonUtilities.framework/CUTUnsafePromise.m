@interface CUTUnsafePromise
+ (id)all:(id)a3;
+ (id)allWithPartialSuccesses:(id)a3;
+ (id)failedPromiseWithError:(id)a3;
+ (id)fulfilledPromiseWithValue:(id)a3;
- (id)_init;
- (id)then:(id)a3;
- (void)registerResultBlock:(id)a3;
@end

@implementation CUTUnsafePromise

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CUTUnsafePromise;
  return [(CUTUnsafePromise *)&v3 init];
}

- (void)registerResultBlock:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"CUTPromise.m" lineNumber:60 description:@"CUTUnsafePromise is abstract and should never be created"];
}

+ (id)failedPromiseWithError:(id)a3
{
  id v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  id v5 = [[CUTResult alloc] initWithError:v3];

  v6 = [(_CUTStaticPromise *)v4 initWithResult:v5 safe:0];
  return v6;
}

+ (id)fulfilledPromiseWithValue:(id)a3
{
  id v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  id v5 = [[CUTResult alloc] initWithSuccess:v3];

  v6 = [(_CUTStaticPromise *)v4 initWithResult:v5 safe:0];
  return v6;
}

+ (id)all:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CUTUnsafePromiseSeal);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [MEMORY[0x1E4F1CA98] null];
      [v5 addObject:v7];

      ++v6;
    }
    while ([v3 count] > v6);
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  if (![v3 count])
  {
    [(CUTUnsafePromiseSeal *)v4 fulfillWithValue:v5];
    *((unsigned char *)v22 + 24) = 1;
  }
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    v9 = [v3 objectAtIndexedSubscript:i];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A35622A0;
    v13[3] = &unk_1E5AFEFA0;
    v16 = &v21;
    v14 = v4;
    id v10 = v5;
    int v18 = i;
    id v15 = v10;
    v17 = v19;
    [v9 registerResultBlock:v13];
  }
  v11 = [(CUTUnsafePromiseSeal *)v4 promise];
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

+ (id)allWithPartialSuccesses:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CUTUnsafePromiseSeal);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [MEMORY[0x1E4F1CA98] null];
      [v5 addObject:v7];

      ++v6;
    }
    while ([v3 count] > v6);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  if (![v3 count]) {
    [(CUTUnsafePromiseSeal *)v4 fulfillWithValue:v5];
  }
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    v9 = [v3 objectAtIndexedSubscript:i];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A35625B8;
    v13[3] = &unk_1E5AFEFC8;
    id v10 = v5;
    int v17 = i;
    id v14 = v10;
    v16 = v18;
    id v15 = v4;
    [v9 registerResultBlock:v13];
  }
  v11 = [(CUTUnsafePromiseSeal *)v4 promise];
  _Block_object_dispose(v18, 8);

  return v11;
}

- (id)then:(id)a3
{
  return sub_1A35618E4(self, a3);
}

@end
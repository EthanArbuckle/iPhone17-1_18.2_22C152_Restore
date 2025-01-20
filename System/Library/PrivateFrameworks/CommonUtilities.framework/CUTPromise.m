@interface CUTPromise
+ (id)all:(id)a3;
+ (id)allWithPartialSuccesses:(id)a3;
+ (id)failedPromiseWithError:(id)a3;
+ (id)fulfilledPromiseWithValue:(id)a3;
- (id)then:(id)a3;
- (void)registerResultBlock:(id)a3;
@end

@implementation CUTPromise

- (void)registerResultBlock:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"CUTPromise.m" lineNumber:168 description:@"CUTPromise is abstract and should never be created"];
}

+ (id)failedPromiseWithError:(id)a3
{
  id v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  id v5 = [[CUTResult alloc] initWithError:v3];

  v6 = [(_CUTStaticPromise *)v4 initWithResult:v5 safe:1];
  return v6;
}

+ (id)fulfilledPromiseWithValue:(id)a3
{
  id v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  id v5 = [[CUTResult alloc] initWithSuccess:v3];

  v6 = [(_CUTStaticPromise *)v4 initWithResult:v5 safe:1];
  return v6;
}

+ (id)all:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CUTLockingPromise);
  id v5 = [(_CUTLockingPromise *)v4 lock];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v6 addObject:v8];

      ++v7;
    }
    while ([v3 count] > v7);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  if (![v3 count])
  {
    v9 = [[CUTResult alloc] initWithSuccess:v6];
    [(_CUTLockingPromise *)v4 _fulfillWithResult:v9];

    *((unsigned char *)v27 + 24) = 1;
  }
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    v11 = [v3 objectAtIndexedSubscript:i];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, a1, @"CUTPromise.m", 195, @"Invalid parameter not satisfying: %@", @"[promise isKindOfClass:[CUTPromise class]]" object file lineNumber description];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1A3562C28;
    v17[3] = &unk_1E5AFEFF0;
    id v18 = v5;
    v21 = &v26;
    v19 = v4;
    id v12 = v6;
    int v23 = i;
    id v20 = v12;
    v22 = v24;
    [v11 registerResultBlock:v17];
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v4;
}

+ (id)allWithPartialSuccesses:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CUTLockingPromise);
  id v5 = [(_CUTLockingPromise *)v4 lock];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v6 addObject:v8];

      ++v7;
    }
    while ([v3 count] > v7);
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  if (![v3 count])
  {
    v9 = [[CUTResult alloc] initWithSuccess:v6];
    [(_CUTLockingPromise *)v4 _fulfillWithResult:v9];
  }
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    v11 = [v3 objectAtIndexedSubscript:i];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, a1, @"CUTPromise.m", 232, @"Invalid parameter not satisfying: %@", @"[promise isKindOfClass:[CUTPromise class]]" object file lineNumber description];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1A3563028;
    v17[3] = &unk_1E5AFF018;
    id v18 = v5;
    id v12 = v6;
    int v22 = i;
    id v19 = v12;
    v21 = v23;
    id v20 = v4;
    [v11 registerResultBlock:v17];
  }
  _Block_object_dispose(v23, 8);

  return v4;
}

- (id)then:(id)a3
{
  return sub_1A3561BA4(self, a3);
}

@end
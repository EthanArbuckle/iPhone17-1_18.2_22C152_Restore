@interface _EFMergingObservable
+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5;
@end

@implementation _EFMergingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v21 = a4;
  id v22 = a5;
  v7 = objc_alloc_init(EFCancelationToken);
  v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v21;
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v39;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        v12 = +[EFPromise promise];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke;
        v36[3] = &unk_1E6121C08;
        id v37 = v24;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
        v34[3] = &unk_1E6121B40;
        id v35 = v12;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
        v32[3] = &unk_1E6121B68;
        id v13 = v35;
        id v33 = v13;
        v14 = +[EFObserver observerWithResultBlock:v36 completionBlock:v34 failureBlock:v32];
        v15 = [v11 subscribe:v14];

        [v25 addObject:v13];
        [(EFCancelationToken *)v7 addCancelable:v13];
        [(EFCancelationToken *)v7 addCancelable:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v8);
  }

  v16 = +[EFFuture join:v25];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_4;
  v29[3] = &unk_1E6121AA0;
  v17 = v7;
  v30 = v17;
  id v18 = v24;
  id v31 = v18;
  [v16 addSuccessBlock:v29];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_5;
  v26[3] = &unk_1E6121AF0;
  v19 = v17;
  v27 = v19;
  id v20 = v18;
  id v28 = v20;
  [v16 addFailureBlock:v26];
  [v22 addCancelable:v19];
}

@end
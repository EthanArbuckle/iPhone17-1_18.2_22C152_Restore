@interface _EFConcatenatingObservable
+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5;
@end

@implementation _EFConcatenatingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 firstObject];
  if (v11)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke;
    v26[3] = &unk_1E6121AA0;
    id v27 = v10;
    id v28 = v8;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
    v21[3] = &unk_1E6121AC8;
    id v22 = v27;
    id v25 = a1;
    id v23 = v28;
    id v24 = v9;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
    v18 = &unk_1E6121AF0;
    id v12 = v22;
    id v19 = v12;
    id v20 = v23;
    v13 = +[EFObserver observerWithResultBlock:v26 completionBlock:v21 failureBlock:&v15];
    v14 = objc_msgSend(v11, "subscribe:", v13, v15, v16, v17, v18);
    [v12 addCancelable:v14];
  }
  else if (([v10 isCanceled] & 1) == 0)
  {
    [v8 observerDidComplete];
  }
}

@end
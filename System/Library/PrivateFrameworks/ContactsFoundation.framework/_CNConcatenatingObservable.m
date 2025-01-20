@interface _CNConcatenatingObservable
+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5;
@end

@implementation _CNConcatenatingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 firstObject];
  if (v11)
  {
    objc_initWeak(location, v10);
    v12 = objc_msgSend(v9, "_cn_tail");
    uint64_t v13 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke;
    v26[3] = &unk_1E56A2158;
    objc_copyWeak(&v28, location);
    id v14 = v8;
    id v27 = v14;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
    v22[3] = &unk_1E56A2180;
    objc_copyWeak(v25, location);
    v25[1] = a1;
    id v15 = v14;
    id v23 = v15;
    id v16 = v12;
    id v24 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
    v19[3] = &unk_1E56A1D58;
    objc_copyWeak(&v21, location);
    id v20 = v15;
    v17 = +[CNObserver blockObserverOfClass:v13 withResultBlock:v26 completionBlock:v22 failureBlock:v19];
    v18 = [v11 subscribe:v17];

    [v10 addCancelable:v18];
    objc_destroyWeak(&v21);

    objc_destroyWeak(v25);
    objc_destroyWeak(&v28);

    objc_destroyWeak(location);
  }
  else if (([v10 isCanceled] & 1) == 0)
  {
    [v8 observerDidComplete];
  }
}

@end
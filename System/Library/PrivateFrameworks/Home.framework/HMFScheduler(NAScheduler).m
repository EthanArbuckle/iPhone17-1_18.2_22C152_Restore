@interface HMFScheduler(NAScheduler)
- (id)afterDelay:()NAScheduler performBlock:;
- (id)performCancelableBlock:()NAScheduler;
@end

@implementation HMFScheduler(NAScheduler)

- (id)afterDelay:()NAScheduler performBlock:
{
  id v6 = a4;
  objc_initWeak(&location, a1);
  v7 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__HMFScheduler_NAScheduler__afterDelay_performBlock___block_invoke;
  v11[3] = &unk_264093660;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  v9 = [v7 afterDelay:v11 performBlock:a2];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (id)performCancelableBlock:()NAScheduler
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58168]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke;
  v15[3] = &unk_26408DF88;
  id v17 = v4;
  id v6 = v5;
  id v16 = v6;
  id v7 = v4;
  id v8 = [a1 performBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke_2;
  v13[3] = &unk_26408DDE0;
  v14 = v8;
  id v9 = v8;
  [v6 addCancelationBlock:v13];
  v10 = v14;
  id v11 = v6;

  return v11;
}

@end
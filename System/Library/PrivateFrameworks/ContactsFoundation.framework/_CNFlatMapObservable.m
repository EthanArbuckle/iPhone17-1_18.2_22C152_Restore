@interface _CNFlatMapObservable
+ (id)concatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5;
+ (id)flatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5;
+ (id)observableWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6;
- (CNObservable)observable;
- (CNSchedulerProvider)schedulerProvider;
- (_CNFlatMapObservable)initWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6;
- (id)decoratorGenerator;
- (id)subscribe:(id)a3;
- (id)subscribeInnerObservable:(id)a3 observer:(id)a4 context:(id)a5;
@end

@implementation _CNFlatMapObservable

+ (id)concatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5
{
  return (id)[a1 observableWithObservable:a3 transform:a4 decoratorGenerator:&__block_literal_global_80 schedulerProvider:a5];
}

+ (id)flatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5
{
  return (id)[a1 observableWithObservable:a3 transform:a4 decoratorGenerator:&__block_literal_global_12_1 schedulerProvider:a5];
}

+ (id)observableWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithObservable:v13 transform:v12 decoratorGenerator:v11 schedulerProvider:v10];

  return v14;
}

- (_CNFlatMapObservable)initWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_CNFlatMapObservable;
  v14 = [(_CNFlatMapObservable *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 map:v11];
    observable = v14->_observable;
    v14->_observable = (CNObservable *)v15;

    uint64_t v17 = [v12 copy];
    id decoratorGenerator = v14->_decoratorGenerator;
    v14->_id decoratorGenerator = (id)v17;

    objc_storeStrong((id *)&v14->_schedulerProvider, a6);
    v19 = v14;
  }

  return v14;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNFlatMapSubscribeCancelationToken);
  v6 = [_CNFlatMapSubscriptionContext alloc];
  v7 = [(_CNFlatMapObservable *)self schedulerProvider];
  v8 = [(_CNFlatMapSubscriptionContext *)v6 initWithSchedulerProvider:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34___CNFlatMapObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E569FB88;
  v9 = v8;
  v37 = v9;
  id v10 = v4;
  id v38 = v10;
  id v11 = _Block_copy(aBlock);
  objc_initWeak(&location, v5);
  uint64_t v12 = objc_opt_class();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34___CNFlatMapObservable_subscribe___block_invoke_7;
  v29[3] = &unk_1E56A2300;
  v30 = v9;
  v31 = self;
  id v13 = v11;
  id v33 = v13;
  id v32 = v10;
  objc_copyWeak(&v34, &location);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __34___CNFlatMapObservable_subscribe___block_invoke_9;
  v26[3] = &unk_1E569F310;
  v14 = v30;
  v27 = v14;
  id v15 = v32;
  id v28 = v15;
  v16 = +[CNObserver blockObserverOfClass:v12 withResultBlock:v29 completionBlock:v26 failureBlock:v13];
  uint64_t v17 = [(_CNFlatMapObservable *)self observable];
  v18 = [v17 subscribe:v16];

  v19 = [(_CNFlatMapSubscriptionContext *)v14 resourceLock];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __34___CNFlatMapObservable_subscribe___block_invoke_12;
  v23[3] = &unk_1E569F310;
  v20 = v14;
  v24 = v20;
  id v21 = v18;
  id v25 = v21;
  [v19 performBlock:v23];

  [(CNCancelationToken *)v5 addCancelable:v21];
  objc_destroyWeak(&v34);

  objc_destroyWeak(&location);

  return v5;
}

- (id)subscribeInnerObservable:(id)a3 observer:(id)a4 context:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(location, v9);
  id v10 = [(_CNFlatMapObservable *)self decoratorGenerator];
  id v11 = [v9 downstream];
  uint64_t v12 = ((void (**)(void, void *))v10)[2](v10, v11);

  id v13 = [v9 resourceLock];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke;
  v45[3] = &unk_1E569F310;
  id v14 = v9;
  id v46 = v14;
  id v15 = v12;
  id v47 = v15;
  [v13 performBlock:v45];

  v16 = objc_alloc_init(CNFlatMapSubscribeInnerObservableCancelationToken);
  objc_initWeak(&from, v15);
  objc_initWeak(&v43, v16);
  uint64_t v17 = objc_opt_class();
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_2;
  v39[3] = &unk_1E56A0978;
  objc_copyWeak(&v41, &from);
  objc_copyWeak(&v42, &v43);
  id v18 = v8;
  id v40 = v18;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_5;
  v33[3] = &unk_1E56A2378;
  id v19 = v15;
  id v34 = v19;
  id v20 = v14;
  id v35 = v20;
  objc_copyWeak(&v37, location);
  objc_copyWeak(&v38, &v43);
  id v21 = v18;
  id v36 = v21;
  v22 = +[CNObserver blockObserverOfClass:v17 withResultBlock:v39 completionBlock:v33 failureBlock:0];
  v23 = [v29 subscribe:v22];

  [(CNCancelationToken *)v16 addCancelable:v23];
  v24 = [v20 resourceLock];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_9;
  v30[3] = &unk_1E569F310;
  id v25 = v20;
  id v31 = v25;
  v26 = v16;
  id v32 = v26;
  [v24 performBlock:v30];

  v27 = [[_CNFlatMapInnerSubscriptionContext alloc] initWithDecorator:v19 token:v26];
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&from);

  objc_destroyWeak(location);

  return v27;
}

- (CNObservable)observable
{
  return self->_observable;
}

- (id)decoratorGenerator
{
  return self->_decoratorGenerator;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong(&self->_decoratorGenerator, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

@end
@interface _CNSamplingObservable
- (CNCancelable)timer;
- (CNObservable)observable;
- (CNObservable)sampler;
- (_CNSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4;
- (id)sample;
- (id)subscribe:(id)a3;
- (void)receiveResult:(id)a3;
- (void)sendSampleToObserver:(id)a3;
- (void)setSample:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _CNSamplingObservable

- (_CNSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNSamplingObservable;
  v9 = [(_CNSamplingObservable *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_sampler, a4);
    v11 = v10;
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [(_CNSamplingObservable *)self sampler];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35___CNSamplingObservable_subscribe___block_invoke;
  v30[3] = &unk_1E56A0518;
  v30[4] = self;
  id v6 = v4;
  id v31 = v6;
  id v7 = +[CNObserver observerWithResultBlock:v30];
  id v8 = [v5 subscribe:v7];

  observable = self->_observable;
  uint64_t v10 = objc_opt_class();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __35___CNSamplingObservable_subscribe___block_invoke_2;
  v29[3] = &unk_1E56A0AD8;
  v29[4] = self;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __35___CNSamplingObservable_subscribe___block_invoke_3;
  v25[3] = &unk_1E569F988;
  id v26 = v8;
  v27 = self;
  id v28 = v6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __35___CNSamplingObservable_subscribe___block_invoke_4;
  v22[3] = &unk_1E569FB88;
  id v11 = v26;
  id v23 = v11;
  id v24 = v28;
  id v12 = v28;
  objc_super v13 = +[CNObserver blockObserverOfClass:v10 withResultBlock:v29 completionBlock:v25 failureBlock:v22];
  v14 = [(CNObservable *)observable subscribe:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35___CNSamplingObservable_subscribe___block_invoke_5;
  v19[3] = &unk_1E569F310;
  id v20 = v11;
  id v21 = v14;
  id v15 = v14;
  id v16 = v11;
  v17 = +[CNCancelationToken tokenWithCancelationBlock:v19];

  return v17;
}

- (void)receiveResult:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(_CNSamplingObservable *)v4 setSample:v5];
  objc_sync_exit(v4);
}

- (void)sendSampleToObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(_CNSamplingObservable *)v4 sample];
  [(_CNSamplingObservable *)v4 setSample:0];
  objc_sync_exit(v4);

  if (v5) {
    [v6 observerDidReceiveResult:v5];
  }
}

- (CNObservable)observable
{
  return self->_observable;
}

- (CNObservable)sampler
{
  return self->_sampler;
}

- (id)sample
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setSample:(id)a3
{
}

- (CNCancelable)timer
{
  return (CNCancelable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_sample, 0);
  objc_storeStrong((id *)&self->_sampler, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

@end
@interface _EFSamplingObservable
- (_EFSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4;
- (id)subscribe:(id)a3;
@end

@implementation _EFSamplingObservable

- (_EFSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFSamplingObservable;
  v9 = [(_EFSamplingObservable *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_sampler, a4);
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v27 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy_;
  v57[4] = __Block_byref_object_dispose_;
  id v58 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35___EFSamplingObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E6121C30;
  id v5 = v4;
  id v55 = v5;
  v56 = v57;
  v6 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __35___EFSamplingObservable_subscribe___block_invoke_2;
  v50[3] = &unk_1E6121C58;
  id v7 = v5;
  id v51 = v7;
  v53 = v57;
  id v8 = v27;
  id v52 = v8;
  v9 = _Block_copy(v50);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __35___EFSamplingObservable_subscribe___block_invoke_3;
  v47[3] = &unk_1E6121C80;
  id v28 = v7;
  id v48 = v28;
  v49 = v57;
  v29 = _Block_copy(v47);
  sampler = self->_sampler;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __35___EFSamplingObservable_subscribe___block_invoke_4;
  v45[3] = &unk_1E6121BE0;
  id v11 = v9;
  id v46 = v11;
  objc_super v12 = +[EFObserver observerWithResultBlock:](EFObserver, "observerWithResultBlock:", v45, v6, v27);
  v13 = [(EFObservable *)sampler subscribe:v12];

  observable = self->_observable;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __35___EFSamplingObservable_subscribe___block_invoke_5;
  v43[3] = &unk_1E6121BE0;
  id v15 = v6;
  id v44 = v15;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35___EFSamplingObservable_subscribe___block_invoke_6;
  v38[3] = &unk_1E6121CA8;
  id v39 = v13;
  id v16 = v11;
  id v41 = v16;
  id v40 = v8;
  id v42 = v29;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __35___EFSamplingObservable_subscribe___block_invoke_7;
  v34[3] = &unk_1E6121CD0;
  id v17 = v39;
  id v35 = v17;
  id v18 = v40;
  id v36 = v18;
  id v19 = v42;
  id v37 = v19;
  v20 = +[EFObserver observerWithResultBlock:v43 completionBlock:v38 failureBlock:v34];
  v21 = [(EFObservable *)observable subscribe:v20];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35___EFSamplingObservable_subscribe___block_invoke_8;
  v30[3] = &unk_1E6121CF8;
  id v22 = v17;
  id v31 = v22;
  id v32 = v21;
  id v23 = v19;
  id v33 = v23;
  id v24 = v21;
  v25 = +[EFCancelationToken tokenWithCancelationBlock:v30];

  _Block_object_dispose(v57, 8);
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
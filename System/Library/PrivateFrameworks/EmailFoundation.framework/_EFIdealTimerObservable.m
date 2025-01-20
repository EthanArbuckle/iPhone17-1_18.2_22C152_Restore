@interface _EFIdealTimerObservable
- (_EFIdealTimerObservable)initWithObservable:(id)a3 timeInterval:(double)a4 scheduler:(id)a5;
- (id)subscribe:(id)a3;
@end

@implementation _EFIdealTimerObservable

- (_EFIdealTimerObservable)initWithObservable:(id)a3 timeInterval:(double)a4 scheduler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_EFIdealTimerObservable;
  v11 = [(_EFIdealTimerObservable *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_input, a3);
    objc_storeStrong((id *)&v12->_scheduler, a5);
    v12->_interval = a4;
  }

  return v12;
}

- (id)subscribe:(id)a3
{
  id v23 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  double interval = self->_interval;
  v7 = self->_scheduler;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0x10000000000000;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37___EFIdealTimerObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E6121B40;
  id v9 = v23;
  id v40 = v9;
  id v10 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_2;
  v32[3] = &unk_1E6121BB8;
  id v11 = v8;
  id v33 = v11;
  v36 = v41;
  double v37 = interval;
  uint64_t v38 = v5;
  v12 = v7;
  v34 = v12;
  id v13 = v10;
  id v35 = v13;
  objc_super v14 = _Block_copy(v32);
  input = self->_input;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_3;
  v30[3] = &unk_1E6121BE0;
  id v16 = v14;
  id v31 = v16;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_4;
  v28[3] = &unk_1E6121B40;
  id v29 = v9;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_5;
  v26[3] = &unk_1E6121B68;
  id v17 = v29;
  id v27 = v17;
  v18 = +[EFObserver observerWithResultBlock:v30 completionBlock:v28 failureBlock:v26];
  v19 = [(EFObservable *)input subscribe:v18];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_6;
  v24[3] = &unk_1E6121B40;
  id v25 = v19;
  id v20 = v19;
  v21 = +[EFCancelationToken tokenWithCancelationBlock:v24];

  _Block_object_dispose(v41, 8);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
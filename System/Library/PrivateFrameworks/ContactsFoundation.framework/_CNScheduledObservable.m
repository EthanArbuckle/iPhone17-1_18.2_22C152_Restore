@interface _CNScheduledObservable
- (CNObservable)observable;
- (CNScheduler)scheduler;
- (_CNScheduledObservable)initWithObservable:(id)a3 scheduler:(id)a4;
- (id)subscribe:(id)a3;
- (void)setObservable:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation _CNScheduledObservable

- (_CNScheduledObservable)initWithObservable:(id)a3 scheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNScheduledObservable;
  v9 = [(_CNScheduledObservable *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    v11 = v10;
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [(_CNScheduledObservable *)self observable];
  v6 = [(_CNScheduledObservable *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36___CNScheduledObservable_subscribe___block_invoke;
  v11[3] = &unk_1E56A0020;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  v9 = [v6 performCancelableBlock:v11];

  return v9;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNObservable)observable
{
  return self->_observable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

- (void)setObservable:(id)a3
{
}

- (void)setScheduler:(id)a3
{
}

@end
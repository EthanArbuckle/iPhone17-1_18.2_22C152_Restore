@interface LazyPromise
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)joinWithPromise:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation LazyPromise

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LazyPromise;
  v9 = [(Promise *)&v13 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id executor = v9->_executor;
    v9->_id executor = v10;

    objc_storeStrong((id *)&v9->_scheduler, a3);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  stateLock = self->super._stateLock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002035AC;
  v13[3] = &unk_100521388;
  v13[4] = self;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  sub_100010468(stateLock, v13);
  v12.receiver = self;
  v12.super_class = (Class)LazyPromise;
  [(Promise *)&v12 thenPerform:v11 orCatchError:v10 onScheduler:v9];
}

- (id)joinWithPromise:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100203704;
  v8[3] = &unk_1005218E8;
  v8[4] = self;
  id v9 = a3;
  id v3 = v9;
  v4 = objc_retainBlock(v8);
  v5 = sub_10023B3FC();
  v6 = sub_100202278((uint64_t)LazyPromise, v5, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_executor, 0);
}

@end
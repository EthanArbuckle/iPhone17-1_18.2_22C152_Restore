@interface Promise
- (Promise)init;
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)joinWithPromise:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation Promise

- (Promise)init
{
  return (Promise *)sub_100202460((id *)&self->super.isa, 0, 0);
}

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(Promise *)self init];
  v9 = v8;
  if (v8) {
    sub_100202578((uint64_t)v8, v7, v6);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  stateLock = self->_stateLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100202830;
  v15[3] = &unk_100521A18;
  id v18 = v8;
  id v19 = v9;
  id v16 = v10;
  v17 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_100010468(stateLock, v15);
}

- (id)joinWithPromise:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100202E64;
  v12[3] = &unk_100521AB8;
  id v13 = a3;
  id v14 = objc_alloc_init(Promise);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100203030;
  v10[3] = &unk_100521910;
  v4 = v14;
  v11 = v4;
  id v5 = v13;
  id v6 = objc_opt_new();
  [(Promise *)self thenPerform:v12 orCatchError:v10 onScheduler:v6];

  id v7 = v11;
  id v8 = v4;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
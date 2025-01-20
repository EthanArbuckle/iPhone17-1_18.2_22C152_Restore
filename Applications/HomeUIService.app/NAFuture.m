@interface NAFuture
- (id)_commitConfigurationReturningDirective:(unint64_t)a3 withContextMessage:(id)a4;
- (id)hs_commitConfigurationAndDismissFutureWithContextMessage:(id)a3;
- (id)hs_commitConfigurationFutureWithContextMessage:(id)a3;
@end

@implementation NAFuture

- (id)hs_commitConfigurationFutureWithContextMessage:(id)a3
{
  return [(NAFuture *)self _commitConfigurationReturningDirective:0 withContextMessage:a3];
}

- (id)hs_commitConfigurationAndDismissFutureWithContextMessage:(id)a3
{
  return [(NAFuture *)self _commitConfigurationReturningDirective:1 withContextMessage:a3];
}

- (id)_commitConfigurationReturningDirective:(unint64_t)a3 withContextMessage:(id)a4
{
  id v6 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004CA6C;
  v18[3] = &unk_1000AAF50;
  v18[4] = a3;
  v7 = [(NAFuture *)self flatMap:v18];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10004CAD8;
  v16 = &unk_1000A90D8;
  id v17 = v6;
  id v8 = v6;
  v9 = [v7 recover:&v13];
  v10 = +[NAScheduler mainThreadScheduler];
  v11 = [v9 reschedule:v10];

  return v11;
}

@end
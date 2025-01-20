@interface CPLCloudKitTaskGroupThrottler
- (BOOL)shouldRunOperationsForTask:(id)a3 error:(id *)a4;
- (BOOL)shouldRunOperationsNow:(id)a3 forGroupName:(id)a4 error:(id *)a5;
- (CPLCloudKitTaskGroupThrottler)init;
- (double)minimumThrottlingInterval;
- (id)statusWithIndent:(id)a3;
- (void)operation:(id)a3 forTask:(id)a4 didFinishWithError:(id)a5;
- (void)operationWithGroupName:(id)a3 didFinishNow:(id)a4 withError:(id)a5;
- (void)setMinimumThrottlingInterval:(double)a3;
@end

@implementation CPLCloudKitTaskGroupThrottler

- (CPLCloudKitTaskGroupThrottler)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCloudKitTaskGroupThrottler;
  v2 = [(CPLCloudKitTaskGroupThrottler *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    throttlers = v3->_throttlers;
    v3->_throttlers = v4;
  }
  return v3;
}

- (BOOL)shouldRunOperationsForTask:(id)a3 error:(id *)a4
{
  v6 = [a3 operationGroup];
  objc_super v7 = [v6 name];

  if (v7)
  {
    v8 = +[NSDate date];
    BOOL v9 = [(CPLCloudKitTaskGroupThrottler *)self shouldRunOperationsNow:v8 forGroupName:v7 error:a4];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)shouldRunOperationsNow:(id)a3 forGroupName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100049C20;
  v28 = sub_100049C30;
  id v29 = 0;
  p_lock = &self->_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_100049C38;
  v18 = &unk_100277CE8;
  v19 = self;
  id v10 = a4;
  id v20 = v10;
  v22 = &v30;
  id v11 = v8;
  id v21 = v11;
  v23 = &v24;
  v12 = v16;
  os_unfair_lock_lock(p_lock);
  v17(v12);
  os_unfair_lock_unlock(p_lock);

  int v13 = *((unsigned __int8 *)v31 + 24);
  if (a5 && !*((unsigned char *)v31 + 24))
  {
    *a5 = (id) v25[5];
    int v13 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

- (void)operation:(id)a3 forTask:(id)a4 didFinishWithError:(id)a5
{
  id v10 = a5;
  objc_super v7 = [a4 operationGroup];
  id v8 = [v7 name];

  if (v8)
  {
    BOOL v9 = +[NSDate date];
    [(CPLCloudKitTaskGroupThrottler *)self operationWithGroupName:v8 didFinishNow:v9 withError:v10];
  }
}

- (void)operationWithGroupName:(id)a3 didFinishNow:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_lock = &self->_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_100049ECC;
  v18 = &unk_100277038;
  id v12 = v10;
  id v19 = v12;
  id v20 = self;
  id v13 = v8;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  v15 = v16;
  os_unfair_lock_lock(p_lock);
  v17(v15);
  os_unfair_lock_unlock(p_lock);
}

- (id)statusWithIndent:(id)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100049C20;
  v18 = sub_100049C30;
  id v19 = 0;
  p_lock = &self->_lock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v9 = sub_10004A0B4;
  id v10 = &unk_100277D10;
  id v11 = self;
  id v4 = a3;
  id v12 = v4;
  id v13 = &v14;
  v5 = v8;
  os_unfair_lock_lock(p_lock);
  v9(v5);
  os_unfair_lock_unlock(p_lock);

  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (double)minimumThrottlingInterval
{
  return self->_minimumThrottlingInterval;
}

- (void)setMinimumThrottlingInterval:(double)a3
{
  self->_minimumThrottlingInterval = a3;
}

- (void).cxx_destruct
{
}

@end
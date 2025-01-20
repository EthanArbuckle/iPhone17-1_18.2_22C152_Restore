@interface Environment
+ (id)sharedInstance;
- (Environment)init;
- (SQLiteDatabase)userDatabase;
@end

@implementation Environment

- (SQLiteDatabase)userDatabase
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100085218;
  v10 = sub_100085228;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021270;
  v5[3] = &unk_100358058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SQLiteDatabase *)v3;
}

+ (id)sharedInstance
{
  if (qword_1003A0320 != -1) {
    dispatch_once(&qword_1003A0320, &stru_10035A150);
  }
  v2 = (void *)qword_1003A0318;

  return v2;
}

- (Environment)init
{
  v6.receiver = self;
  v6.super_class = (Class)Environment;
  v2 = [(Environment *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storekit.Environment", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDatabase, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
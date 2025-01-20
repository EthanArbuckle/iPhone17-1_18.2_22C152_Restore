@interface GSUserDefaults
+ (id)defaults;
- (BOOL)BOOLForKey:(id)a3 byDefault:(BOOL)a4;
- (GSUserDefaults)init;
- (double)doubleForKey:(id)a3 min:(double)a4 max:(double)a5 byDefault:(double)a6;
- (id)objectForKey:(id)a3 validateWithBlock:(id)a4;
- (int)intForKey:(id)a3 min:(int)a4 max:(int)a5 byDefault:(int)a6;
- (int64_t)longLongForKey:(id)a3 min:(int64_t)a4 max:(int64_t)a5 byDefault:(int64_t)a6;
@end

@implementation GSUserDefaults

+ (id)defaults
{
  if (qword_10004CED0 != -1) {
    dispatch_once(&qword_10004CED0, &stru_100040EB0);
  }
  v2 = (void *)qword_10004CED8;
  return v2;
}

- (GSUserDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)GSUserDefaults;
  v2 = [(GSUserDefaults *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)objectForKey:(id)a3 validateWithBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = self->_cache;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v6];
  if (v9)
  {
    id v10 = +[NSNull null];

    if (v9 == v10) {
      id v11 = 0;
    }
    else {
      id v11 = v9;
    }
    objc_sync_exit(v8);
  }
  else
  {
    objc_sync_exit(v8);

    v12 = +[NSUserDefaults standardUserDefaults];
    v13 = [v12 valueForKey:v6];
    if (v13)
    {
      v14 = sub_100002D4C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] user default for %@: %@", (uint8_t *)&v19, 0x16u);
      }
    }
    if (v7)
    {
      uint64_t v15 = v7[2](v7, v13);

      v13 = (void *)v15;
    }
    v16 = self->_cache;
    objc_sync_enter(v16);
    v17 = v13;
    if (!v13)
    {
      v17 = +[NSNull null];
    }
    [(NSMutableDictionary *)self->_cache setObject:v17 forKeyedSubscript:v6];
    if (!v13) {

    }
    objc_sync_exit(v16);
    id v9 = v13;

    id v11 = v9;
  }

  return v11;
}

- (int)intForKey:(id)a3 min:(int)a4 max:(int)a5 byDefault:(int)a6
{
  id v10 = a3;
  if (a4 >= a5) {
    sub_100027CAC();
  }
  if (a4 > a6) {
    sub_100027C54();
  }
  if (a6 > a5) {
    sub_100027C80();
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B750;
  v15[3] = &unk_100040ED8;
  int v17 = a4;
  int v18 = a5;
  id v16 = v10;
  int v19 = a6;
  id v11 = v10;
  v12 = [(GSUserDefaults *)self objectForKey:v11 validateWithBlock:v15];
  int v13 = [v12 intValue];

  return v13;
}

- (int64_t)longLongForKey:(id)a3 min:(int64_t)a4 max:(int64_t)a5 byDefault:(int64_t)a6
{
  id v10 = a3;
  if (a4 >= a5) {
    sub_100027DD4();
  }
  if (a4 > a6) {
    sub_100027D7C();
  }
  if (a6 > a5) {
    sub_100027DA8();
  }
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  int v17 = sub_10000B94C;
  int v18 = &unk_100040F00;
  id v19 = v10;
  int64_t v20 = a4;
  int64_t v21 = a5;
  int64_t v22 = a6;
  id v11 = v10;
  v12 = [(GSUserDefaults *)self objectForKey:v11 validateWithBlock:&v15];
  id v13 = objc_msgSend(v12, "longLongValue", v15, v16, v17, v18);

  return (int64_t)v13;
}

- (double)doubleForKey:(id)a3 min:(double)a4 max:(double)a5 byDefault:(double)a6
{
  id v10 = a3;
  if (a4 >= a5) {
    sub_100027E70();
  }
  if (a4 > a6) {
    sub_100027E9C();
  }
  if (a6 > a5) {
    sub_100027EC8();
  }
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  int v18 = sub_10000BB54;
  id v19 = &unk_100040F00;
  double v21 = a4;
  double v22 = a5;
  id v20 = v10;
  double v23 = a6;
  id v11 = v10;
  v12 = [(GSUserDefaults *)self objectForKey:v11 validateWithBlock:&v16];
  objc_msgSend(v12, "doubleValue", v16, v17, v18, v19);
  double v14 = v13;

  return v14;
}

- (BOOL)BOOLForKey:(id)a3 byDefault:(BOOL)a4
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000BD04;
  double v13 = &unk_100040F28;
  id v14 = a3;
  BOOL v15 = a4;
  id v6 = v14;
  v7 = [(GSUserDefaults *)self objectForKey:v6 validateWithBlock:&v10];
  unsigned __int8 v8 = objc_msgSend(v7, "BOOLValue", v10, v11, v12, v13);

  return v8;
}

- (void).cxx_destruct
{
}

@end
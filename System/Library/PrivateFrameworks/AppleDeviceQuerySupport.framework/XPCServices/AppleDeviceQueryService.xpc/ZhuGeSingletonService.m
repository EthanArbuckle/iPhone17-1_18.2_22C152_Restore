@interface ZhuGeSingletonService
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)sharedInstance;
@end

@implementation ZhuGeSingletonService

+ (id)sharedInstance
{
  if (qword_10001A0B0 != -1) {
    dispatch_once(&qword_10001A0B0, &stru_100014440);
  }
  pthread_mutex_lock(&stru_10001A0B8);
  v3 = (void *)qword_10001A0F8;
  if (!qword_10001A0F8)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)qword_10001A0F8;
    qword_10001A0F8 = (uint64_t)v4;

    v3 = (void *)qword_10001A0F8;
  }
  v6 = NSStringFromClass((Class)a1);
  v7 = [v3 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)a1);
    v9 = (void *)qword_10001A0F8;
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v8 forKeyedSubscript:v10];

    v11 = (void *)qword_10001A0F8;
    v12 = NSStringFromClass((Class)a1);
    v13 = [v11 objectForKeyedSubscript:v12];
    [v13 initData];
  }
  pthread_mutex_unlock(&stru_10001A0B8);
  v14 = (void *)qword_10001A0F8;
  v15 = NSStringFromClass((Class)a1);
  v16 = [v14 objectForKeyedSubscript:v15];

  return v16;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
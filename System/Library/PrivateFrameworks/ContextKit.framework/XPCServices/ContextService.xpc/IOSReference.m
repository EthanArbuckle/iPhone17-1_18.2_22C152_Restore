@interface IOSReference
+ (id)getReferent:(id)a3;
+ (void)clearReferent:(id)a3;
+ (void)handleMemoryWarning:(id)a3;
+ (void)initReferent:(id)a3;
+ (void)initialize;
@end

@implementation IOSReference

+ (void)initReferent:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100180E88;
  v3[3] = &unk_100407B30;
  v3[4] = a3;
  pthread_mutex_lock(&stru_100560968);
  sub_100180E88((uint64_t)v3);
  pthread_mutex_unlock(&stru_100560968);
}

+ (id)getReferent:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1001811D8;
  v10 = sub_1001811E8;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001811F4;
  v5[3] = &unk_100407B58;
  v5[4] = a3;
  v5[5] = &v6;
  pthread_mutex_lock(&stru_100560968);
  sub_1001811F4((uint64_t)v5);
  pthread_mutex_unlock(&stru_100560968);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)clearReferent:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001812DC;
  v3[3] = &unk_100407B30;
  v3[4] = a3;
  pthread_mutex_lock(&stru_100560968);
  sub_1001812DC((uint64_t)v3);
  pthread_mutex_unlock(&stru_100560968);
}

+ (void)handleMemoryWarning:(id)a3
{
  pthread_mutex_lock(&stru_100560968);
  byte_100560958 = 1;

  qword_100560960 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
  byte_100560958 = 0;
  pthread_mutex_unlock(&stru_100560968);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2.__sig = 0;
    *(void *)v2.__opaque = 0;
    pthread_mutexattr_init(&v2);
    pthread_mutexattr_settype(&v2, 2);
    pthread_mutex_init(&stru_100560968, &v2);
    pthread_mutexattr_destroy(&v2);
    qword_1005609A8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
    qword_1005609B0 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    qword_1005609B8 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
    qword_100560960 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
  }
}

@end
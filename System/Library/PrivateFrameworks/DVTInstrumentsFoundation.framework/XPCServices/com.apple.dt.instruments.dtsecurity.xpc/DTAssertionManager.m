@interface DTAssertionManager
+ (id)sharedInstance;
+ (void)defaultAssertionFactories:(id *)a3 andDisableKeys:(id *)a4;
- (DTAssertionManager)init;
- (DTAssertionManager)initWithAssertionFactories:(id)a3 andDisableKeys:(id)a4;
- (void)removeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4;
- (void)removeClaimsHeldByClient:(id)a3;
- (void)takeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4 withOptions:(id)a5;
@end

@implementation DTAssertionManager

+ (void)defaultAssertionFactories:(id *)a3 andDisableKeys:(id *)a4
{
  if (qword_1000196B0 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1000196B0, &stru_100015180);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) qword_1000196B8;
LABEL_4:
  if (a4) {
    *a4 = (id) qword_1000196C0;
  }
}

+ (id)sharedInstance
{
  if (qword_1000196C8 != -1) {
    dispatch_once(&qword_1000196C8, &stru_1000151A0);
  }
  v2 = (void *)qword_1000196D0;
  return v2;
}

- (DTAssertionManager)init
{
  id v7 = 0;
  id v8 = 0;
  +[DTAssertionManager defaultAssertionFactories:&v8 andDisableKeys:&v7];
  id v3 = v8;
  id v4 = v7;
  v5 = [(DTAssertionManager *)self initWithAssertionFactories:v3 andDisableKeys:v4];

  return v5;
}

- (DTAssertionManager)initWithAssertionFactories:(id)a3 andDisableKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DTAssertionManager;
  id v8 = [(DTAssertionManager *)&v18 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    assertionFactories = v8->_assertionFactories;
    v8->_assertionFactories = v9;

    v11 = (NSArray *)[v7 copy];
    disableKeys = v8->_disableKeys;
    v8->_disableKeys = v11;

    dispatch_queue_t v13 = dispatch_queue_create("DTAssertionManager", 0);
    guard = v8->_guard;
    v8->_guard = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    pidInfosByPid = v8->_pidInfosByPid;
    v8->_pidInfosByPid = (NSMutableDictionary *)v15;
  }
  return v8;
}

- (void)takeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4 withOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    guard = self->_guard;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CEE0;
    v11[3] = &unk_1000150F0;
    int v14 = a3;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    dispatch_sync(guard, v11);
  }
}

- (void)removeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    guard = self->_guard;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D394;
    block[3] = &unk_1000151F0;
    int v11 = a3;
    block[4] = self;
    id v10 = v6;
    dispatch_sync(guard, block);
  }
}

- (void)removeClaimsHeldByClient:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    guard = self->_guard;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D4E4;
    v7[3] = &unk_100015240;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(guard, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidInfosByPid, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_disableKeys, 0);
  objc_storeStrong((id *)&self->_assertionFactories, 0);
}

@end
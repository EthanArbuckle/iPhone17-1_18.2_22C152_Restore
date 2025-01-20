@interface APUniversalSingleton
+ (BOOL)isSingletonSet;
+ (id)sharedInstance;
+ (void)resetSingleton;
- (APUniversalSingleton)init;
- (id)_valueForSingletonKey:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_setValue:(id)a3 forSingletonKey:(id)a4;
- (void)forwardInvocation:(id)a3;
@end

@implementation APUniversalSingleton

- (APUniversalSingleton)init
{
  v8.receiver = self;
  v8.super_class = (Class)APUniversalSingleton;
  v2 = [(APUniversalSingleton *)&v8 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    singletons = v2->_singletons;
    v2->_singletons = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ap.universalsingleton", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_setValue:(id)a3 forSingletonKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(APUniversalSingleton *)self _valueForSingletonKey:v7];

  if (v8)
  {
    APSimulateCrashNoKillProcess(5, @"Error - Singleton instance for %@ already exists.", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70B462C;
    block[3] = &unk_1E6A6B4D0;
    block[4] = self;
    id v17 = v6;
    id v18 = v7;
    dispatch_barrier_async(queue, block);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)APUniversalSingleton;
  v4 = -[APUniversalSingleton methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v4)
  {
    dispatch_queue_t v5 = NSStringFromSelector(a3);
    if ([v5 hasPrefix:@"set"]) {
      id v6 = "v@:@";
    }
    else {
      id v6 = "@@:";
    }
    v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v6];
  }
  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = NSStringFromSelector((SEL)[v4 selector]);
  id v6 = objc_msgSend(v5, "ap_propertyName");
  if (v6)
  {
    if ([v5 hasPrefix:@"set"])
    {
      id location = 0;
      [v4 getArgument:&location atIndex:2];
      id v7 = objc_loadWeakRetained(&location);
      [(APUniversalSingleton *)self _setValue:v7 forSingletonKey:v6];

      objc_destroyWeak(&location);
    }
    else
    {
      id location = [(APUniversalSingleton *)self _valueForSingletonKey:v5];
      [v4 setReturnValue:&location];
    }
  }
}

- (id)_valueForSingletonKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1D70C4860;
  v16 = sub_1D70C4870;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D70B548C;
  block[3] = &unk_1E6A6B560;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)sharedInstance
{
  if (qword_1EB789B60 != -1) {
    dispatch_once(&qword_1EB789B60, &unk_1F2E9CC10);
  }
  [(id)qword_1EB789B58 lock];
  v2 = (APUniversalSingleton *)(id)qword_1EB789B68;
  if (!qword_1EB789B68)
  {
    v3 = objc_alloc_init(APUniversalSingleton);

    objc_storeStrong((id *)&qword_1EB789B68, v3);
    v2 = v3;
  }
  [(id)qword_1EB789B58 unlock];
  return v2;
}

+ (void)resetSingleton
{
  if (qword_1EB789B60 != -1) {
    dispatch_once(&qword_1EB789B60, &unk_1F2E9CC10);
  }
  [(id)qword_1EB789B58 lock];
  v2 = (void *)qword_1EB789B68;
  qword_1EB789B68 = 0;

  v3 = (void *)qword_1EB789B58;
  [v3 unlock];
}

+ (BOOL)isSingletonSet
{
  if (qword_1EB789B60 != -1) {
    dispatch_once(&qword_1EB789B60, &unk_1F2E9CC10);
  }
  [(id)qword_1EB789B58 lock];
  BOOL v2 = qword_1EB789B68 != 0;
  [(id)qword_1EB789B58 unlock];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_singletons, 0);
}

@end
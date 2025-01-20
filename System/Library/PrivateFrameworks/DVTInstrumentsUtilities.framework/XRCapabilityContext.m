@interface XRCapabilityContext
+ (id)currentContextSet;
+ (void)announceUsedCapability:(id)a3 version:(unint64_t)a4;
+ (void)enterContextSet:(id)a3;
+ (void)leaveContextSet:(id)a3;
- (XRCapabilityContext)init;
- (void)addToCurrentContextSet;
- (void)announceUsedCapability:(id)a3 version:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateRequiredCapabilities:(id)a3;
- (void)removeFromCurrentContextSet;
@end

@implementation XRCapabilityContext

+ (void)announceUsedCapability:(id)a3 version:(unint64_t)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23457B818;
  v7[3] = &unk_264BF0CF8;
  id v8 = v5;
  unint64_t v9 = a4;
  id v6 = v5;
  sub_23457B5BC(v7);
}

+ (id)currentContextSet
{
  id v5 = [MEMORY[0x263F088B0] objc_msgSend_weakObjectsHashTable:a2 v2 v3 v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23457B8CC;
  v8[3] = &unk_264BF0D20;
  id v6 = v5;
  id v9 = v6;
  sub_23457B5BC(v8);

  return v6;
}

+ (void)enterContextSet:(id)a3
{
  id v3 = a3;
  sub_23457B934(0, v4, v5, v6, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 addObject:v8];
}

+ (void)leaveContextSet:(id)a3
{
  id v3 = a3;
  sub_23457B934(1, v4, v5, v6, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 removeObject:v8];
}

- (XRCapabilityContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)XRCapabilityContext;
  uint64_t v2 = [(XRCapabilityContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    capabilities = v2->_capabilities;
    v2->_capabilities = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    unimplementedResponses = v2->_unimplementedResponses;
    v2->_unimplementedResponses = (NSMutableDictionary *)v5;

    pthread_rwlock_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)XRCapabilityContext;
  [(XRCapabilityContext *)&v3 dealloc];
}

- (void)announceUsedCapability:(id)a3 version:(unint64_t)a4
{
  id v39 = a3;
  pthread_rwlock_rdlock(&self->_lock);
  uint64_t v9 = [self->_capabilities objectForKey:v6 forKey:v39];
  v13 = v9;
  if (!v9)
  {
    pthread_rwlock_unlock(&self->_lock);
    goto LABEL_5;
  }
  char v14 = [v9 containsIndex:v10 inRange:a4];
  pthread_rwlock_unlock(&self->_lock);
  if ((v14 & 1) == 0)
  {
LABEL_5:
    pthread_rwlock_wrlock(&self->_lock);
    v18 = [self->_capabilities objectForKey:v15 withTransitionContext:v16 completion:v17];

    if (v18)
    {
      [v18 addObject:v19 atIndex:a4];
      v13 = v18;
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x263F089C8]);
      v13 = [v22 initWithIndex:v23 a:a4 b:v24 c:v25];
      [self->_capabilities setObject:v26 forKey:(uint64_t)v13];
      v32 = [XRCapabilityRegistry applicationCapabilities:v28 withOptions:v29 forApplication:v30 withError:v31];
      v36 = [v32 _unimplementedRecoveryForCapability:v33 withTransitionContext:v34 completion:v35];
      [self->_unimplementedResponses setObject:v37 forKeyedSubscript:v36];
    }
    pthread_rwlock_unlock(&self->_lock);
  }
}

- (void)enumerateRequiredCapabilities:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  capabilities = self->_capabilities;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23457BD18;
  v11[3] = &unk_264BF0D48;
  v11[4] = self;
  id v12 = v4;
  id v7 = v4;
  [capabilities enumerateKeysAndObjectsUsingBlock:v8, v11, v9, v10];
  pthread_rwlock_unlock(p_lock);
}

- (void)addToCurrentContextSet
{
  sub_23457BE44(0, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 addObject:[self class] withTransitionContext:v7 completion:v8];
}

- (void)removeFromCurrentContextSet
{
  sub_23457BE44(1, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 removeObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unimplementedResponses, 0);

  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
@interface _LSDeviceIdentifierManager
+ (id)sharedInstance;
- (_LSDeviceIdentifierManager)init;
- (id)cacheForPersona:(id)a3;
@end

@implementation _LSDeviceIdentifierManager

+ (id)sharedInstance
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDeviceIdentifierManager sharedInstance]");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___LSDeviceIdentifierManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_LSDeviceIdentifierManager sharedInstance]::once != -1) {
    dispatch_once(&+[_LSDeviceIdentifierManager sharedInstance]::once, block);
  }
  v3 = (void *)+[_LSDeviceIdentifierManager sharedInstance]::result;

  return v3;
}

- (id)cacheForPersona:(id)a3
{
  id v4 = a3;
  if (v4 && (getUMUserPersonaClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    if ([v5 isEnterprisePersona])
    {
      v6 = [v5 userPersonaUniqueString];
    }
    else
    {
      v6 = &stru_1ECB1A570;
    }
  }
  else
  {
    v6 = &stru_1ECB1A570;
  }
  v7 = self->_sharedCaches;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)self->_sharedCaches objectForKey:v6];
  if (!v8)
  {
    v8 = [[_LSDeviceIdentifierCache alloc] initWithPersona:v6];
    [(NSMutableDictionary *)self->_sharedCaches setObject:v8 forKey:v6];
  }
  objc_sync_exit(v7);

  return v8;
}

- (_LSDeviceIdentifierManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_LSDeviceIdentifierManager;
  v2 = [(_LSDeviceIdentifierManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedCaches = v2->_sharedCaches;
    v2->_sharedCaches = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
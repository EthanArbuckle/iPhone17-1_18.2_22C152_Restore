@interface SecItemRateLimit
+ (id)getStaticRateLimit;
+ (id)instance;
+ (void)resetStaticRateLimit;
- (BOOL)consumeTokenFromBucket:(BOOL)a3;
- (BOOL)isEnabled;
- (BOOL)isModifyingAPICallWithinLimits;
- (BOOL)isReadOnlyAPICallWithinLimits;
- (BOOL)shouldCountAPICalls;
- (NSDate)roBucket;
- (NSDate)rwBucket;
- (SecItemRateLimit)init;
- (double)limitMultiplier;
- (double)roRate;
- (double)rwRate;
- (int)roCapacity;
- (int)rwCapacity;
- (void)forceEnabled:(BOOL)a3;
@end

@implementation SecItemRateLimit

+ (id)instance
{
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_8855);
  }
  v2 = (void *)ratelimit;

  return v2;
}

- (BOOL)isReadOnlyAPICallWithinLimits
{
  BOOL v2 = [(SecItemRateLimit *)self consumeTokenFromBucket:0];
  if (!v2)
  {
    v3 = secLogObjForScope("secitemratelimit");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "Readonly API rate exceeded", v5, 2u);
    }
  }
  return v2;
}

- (BOOL)consumeTokenFromBucket:(BOOL)a3
{
  if (![(SecItemRateLimit *)self shouldCountAPICalls] && !self->_forceEnabled) {
    return 1;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke;
  block[3] = &unk_1E547E9B0;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(dataQueue, block);
  BOOL v6 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)shouldCountAPICalls
{
  if (shouldCountAPICalls_shouldCountToken != -1) {
    dispatch_once(&shouldCountAPICalls_shouldCountToken, &__block_literal_global_7);
  }
  return shouldCountAPICalls_shouldCount;
}

- (BOOL)isModifyingAPICallWithinLimits
{
  BOOL v2 = [(SecItemRateLimit *)self consumeTokenFromBucket:1];
  if (!v2)
  {
    v3 = secLogObjForScope("secitemratelimit");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "Modifying API rate exceeded", v5, 2u);
    }
  }
  return v2;
}

uint64_t __28__SecItemRateLimit_instance__block_invoke()
{
  ratelimit = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (SecItemRateLimit)init
{
  v10.receiver = self;
  v10.super_class = (Class)SecItemRateLimit;
  BOOL v2 = [(SecItemRateLimit *)&v10 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_roCapacity = 0x1900000019;
    *(_OWORD *)&v2->_roRate = xmmword_18B414B60;
    roBucket = v2->_roBucket;
    v2->_roBucket = 0;

    rwBucket = v3->_rwBucket;
    v3->_rwBucket = 0;

    v3->_forceEnabled = 0;
    v3->_limitMultiplier = 5.0;
    BOOL v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.keychain.secitemratelimit.dataqueue", v6);
    dataQueue = v3->_dataQueue;
    v3->_dataQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

void __39__SecItemRateLimit_shouldCountAPICalls__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_variant_allows_internal_security_policies())
  {
    if (gSecurityd)
    {
      v0 = secLogObjForScope("secitemratelimit");
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5) = 0;
        v1 = "gSecurityd non-nil, disabling SIRL for testing";
LABEL_7:
        _os_log_impl(&dword_18B299000, v0, OS_LOG_TYPE_DEFAULT, v1, (uint8_t *)&v5, 2u);
      }
    }
    else
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v0 = secLogObjForScope("secitemratelimit");
        if (!os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        LOWORD(v5) = 0;
        v1 = "SIRL disabled via feature flag";
        goto LABEL_7;
      }
      SecTaskRef v2 = SecTaskCreateFromSelf(0);
      v0 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1ED86CBA0];
      if (v2)
      {
        int v5 = 0;
        csops_task((uint64_t)v2);
        v4 = secLogObjForScope("secitemratelimit");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "Not valid/debugged platform binary, disabling SIRL", (uint8_t *)&v5, 2u);
        }

        CFRelease(v2);
      }
      else
      {
        v3 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "secitemratelimit: unable to get task from self, disabling SIRL", (uint8_t *)&v5, 2u);
        }
      }
    }
  }
  else
  {
    v0 = secLogObjForScope("secitemratelimit");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      v1 = "Not internal release, disabling SIRL";
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rwBucket, 0);
  objc_storeStrong((id *)&self->_roBucket, 0);

  objc_storeStrong((id *)&self->_dataQueue, 0);
}

- (NSDate)rwBucket
{
  return self->_rwBucket;
}

- (NSDate)roBucket
{
  return self->_roBucket;
}

- (double)limitMultiplier
{
  return self->_limitMultiplier;
}

- (double)rwRate
{
  return self->_rwRate;
}

- (int)rwCapacity
{
  return self->_rwCapacity;
}

- (double)roRate
{
  return self->_roRate;
}

- (int)roCapacity
{
  return self->_roCapacity;
}

void __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 28;
  }
  else {
    uint64_t v3 = 24;
  }
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = 40;
  }
  else {
    uint64_t v4 = 32;
  }
  uint64_t v5 = 64;
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v5 = 56;
  }
  uint64_t v6 = (id *)(v2 + v5);
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_queue_t v7 = [v13 dateByAddingTimeInterval:-1.0 / *(double *)(v2 + v4) * (double)*(int *)(v2 + v3)];
  if (!*v6 || ([*v6 timeIntervalSinceDate:v7], v8 < 0.0)) {
    objc_storeStrong(v6, v7);
  }
  uint64_t v9 = [*v6 dateByAddingTimeInterval:1.0 / *(double *)(v2 + v4)];
  id v10 = *v6;
  *uint64_t v6 = (id)v9;

  [*v6 timeIntervalSinceDate:v13];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11 <= 0.0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v12 = *v6;
    *uint64_t v6 = 0;

    *(_DWORD *)(v2 + v3) = (int)(*(double *)(*(void *)(a1 + 32) + 48) * (double)*(int *)(v2 + v3));
    *(double *)(v2 + v4) = *(double *)(*(void *)(a1 + 32) + 48) * *(double *)(v2 + v4);
  }
}

- (void)forceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_forceEnabled = a3;
  uint64_t v5 = secLogObjForScope("secitemratelimit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      uint64_t v6 = "F";
    }
    else {
      uint64_t v6 = "Not f";
    }
    int v7 = 136315394;
    double v8 = v6;
    __int16 v9 = 1024;
    BOOL v10 = [(SecItemRateLimit *)self isEnabled];
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "%sorcing SIRL to be enabled (effective: %i)", (uint8_t *)&v7, 0x12u);
  }
}

- (BOOL)isEnabled
{
  return self->_forceEnabled || [(SecItemRateLimit *)self shouldCountAPICalls];
}

+ (void)resetStaticRateLimit
{
  ratelimit = objc_opt_new();

  MEMORY[0x1F41817F8]();
}

+ (id)getStaticRateLimit
{
  return +[SecItemRateLimit instance];
}

@end
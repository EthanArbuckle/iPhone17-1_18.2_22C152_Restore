@interface HMMRTCSessionManager
+ (id)sharedManager;
- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5;
- (void)addCommonField:(id)a3 withValue:(id)a4;
- (void)removeCommonField:(id)a3;
- (void)setSessionFactory:(id)a3;
- (void)submitEventWithName:(id)a3 serviceName:(id)a4 payload:(id)a5;
- (void)submitEventWithName:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 payload:(id)a6;
@end

@implementation HMMRTCSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonFields, 0);
  objc_storeStrong((id *)&self->_sessionFactory, 0);
}

- (void)submitEventWithName:(id)a3 serviceName:(id)a4 payload:(id)a5
{
}

- (void)submitEventWithName:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 payload:(id)a6
{
  BOOL v6 = a5;
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 UUID];
  id v15 = [(HMMRTCSessionManager *)self sessionWithUUID:v14 serviceName:v12 uploadImmediately:v6];

  [v15 submitEventWithName:v13 payload:v11];
}

- (void)removeCommonField:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_commonFields];
  [v4 removeObjectForKey:v7];
  v5 = (NSDictionary *)[v4 copy];
  commonFields = self->_commonFields;
  self->_commonFields = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)addCommonField:(id)a3 withValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  if (self->_commonFields) {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  }
  else {
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v7 setObject:v6 forKey:v10];
  v8 = (NSDictionary *)[v7 copy];
  commonFields = self->_commonFields;
  self->_commonFields = v8;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  sessionFactory = self->_sessionFactory;
  if (!sessionFactory)
  {
    id v12 = objc_alloc_init(HMMRTCSessionFactory);
    id v13 = self->_sessionFactory;
    self->_sessionFactory = v12;

    sessionFactory = self->_sessionFactory;
  }
  v14 = self->_commonFields;
  id v15 = sessionFactory;
  os_unfair_lock_unlock(p_lock);
  v16 = [(HMMRTCSessionFactory *)v15 sessionWithUUID:v8 serviceName:v9 uploadImmediately:v5 commonFields:v14];

  return v16;
}

- (void)setSessionFactory:(id)a3
{
  v4 = (HMMRTCSessionFactory *)a3;
  os_unfair_lock_lock_with_options();
  sessionFactory = self->_sessionFactory;
  self->_sessionFactory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

+ (id)sharedManager
{
  if (sharedManager__hmf_once_t0 != -1) {
    dispatch_once(&sharedManager__hmf_once_t0, &__block_literal_global_764);
  }
  v2 = (void *)sharedManager__hmf_once_v1;
  return v2;
}

uint64_t __37__HMMRTCSessionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HMMRTCSessionManager);
  uint64_t v1 = sharedManager__hmf_once_v1;
  sharedManager__hmf_once_uint64_t v1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
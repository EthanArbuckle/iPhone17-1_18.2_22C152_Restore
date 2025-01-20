@interface IDSDependencyProvider
+ (id)XPCAdapter;
+ (id)keychainAdapter;
+ (id)pushAdapter;
+ (id)registeredObjectForProtocol:(id)a3;
+ (id)serviceLoader;
+ (id)sharedProvider;
+ (id)systemMonitorAdapter;
+ (id)userDefaults;
+ (void)registerObject:(id)a3 forProtocol:(id)a4;
- (BOOL)getKeychainData:(id *)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 error:(int *)a7;
- (BOOL)removeKeychainDataOnService:(id)a3 account:(id)a4 error:(int *)a5;
- (BOOL)setKeychainData:(id)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 allowSync:(BOOL)a7 error:(int *)a8;
- (id)_init;
- (id)apsConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 queue:(id)a6;
- (id)createServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7;
- (id)createSim2HostServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7;
- (id)placeholderMachPort;
- (id)registeredObjectForProtocol:(id)a3;
- (void)registerObject:(id)a3 forProtocol:(id)a4;
@end

@implementation IDSDependencyProvider

+ (id)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19D9E68E0;
  block[3] = &unk_1E5970A28;
  block[4] = a1;
  if (qword_1EB2BB8A8 != -1) {
    dispatch_once(&qword_1EB2BB8A8, block);
  }
  v2 = (void *)qword_1EB2BB8A0;
  return v2;
}

- (id)createServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7
{
  v7 = (void *)IMXPCCreateServerConnection();
  v8 = [IDSXPCConnectionWrapper alloc];
  v11 = objc_msgSend_initWithConnection_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

+ (id)XPCAdapter
{
  v4 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF050A10, v2);
  v8 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = v9;

  return v10;
}

- (id)registeredObjectForProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredAdapters = self->_registeredAdapters;
  if (registeredAdapters)
  {
    double v7 = NSStringFromProtocol(v4);
    registeredAdapters = objc_msgSend_objectForKey_(registeredAdapters, v8, (uint64_t)v7, v9);
  }
  os_unfair_lock_unlock(p_lock);

  return registeredAdapters;
}

+ (id)registeredObjectForProtocol:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_sharedProvider(a1, v5, v6, v7);
  v11 = objc_msgSend_registeredObjectForProtocol_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSDependencyProvider;
  id result = [(IDSDependencyProvider *)&v3 init];
  if (result) {
    *((_DWORD *)result + 4) = 0;
  }
  return result;
}

- (void)registerObject:(id)a3 forProtocol:(id)a4
{
  uint64_t v6 = (Protocol *)a4;
  if (a3 && v6)
  {
    proto = v6;
    p_lock = &self->_lock;
    id v8 = a3;
    os_unfair_lock_lock(&self->_lock);
    registeredAdapters = self->_registeredAdapters;
    if (!registeredAdapters)
    {
      double v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_registeredAdapters;
      self->_registeredAdapters = v10;

      registeredAdapters = self->_registeredAdapters;
    }
    v12 = NSStringFromProtocol(proto);
    objc_msgSend_setObject_forKey_(registeredAdapters, v13, (uint64_t)v8, v14, v12);

    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = proto;
  }
}

+ (id)pushAdapter
{
  id v4 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF050AD8, v2);
  id v8 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = v9;

  return v10;
}

+ (id)serviceLoader
{
  id v4 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF050C58, v2);
  id v8 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = v9;

  return v10;
}

+ (id)keychainAdapter
{
  id v4 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF050BE0, v2);
  id v8 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = v9;

  return v10;
}

+ (id)systemMonitorAdapter
{
  objc_super v3 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF059D68, v2);
  double v7 = v3;
  if (v3)
  {
    id v8 = v3;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v4, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return v9;
}

+ (id)userDefaults
{
  objc_super v3 = objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EF056930, v2);
  double v7 = v3;
  if (v3)
  {
    id v8 = v3;
  }
  else
  {
    objc_msgSend_sharedDefaults(MEMORY[0x1E4F6C408], v4, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return v9;
}

+ (void)registerObject:(id)a3 forProtocol:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_sharedProvider(a1, v8, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObject_forProtocol_(v13, v11, (uint64_t)v7, v12, v6);
}

- (void).cxx_destruct
{
}

- (BOOL)setKeychainData:(id)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 allowSync:(BOOL)a7 error:(int *)a8
{
  return IMSetKeychainData();
}

- (BOOL)getKeychainData:(id *)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 error:(int *)a7
{
  return IMGetKeychainData();
}

- (BOOL)removeKeychainDataOnService:(id)a3 account:(id)a4 error:(int *)a5
{
  return IMRemoveKeychainData();
}

- (id)placeholderMachPort
{
  id v2 = *(id *)MEMORY[0x19F3ADAF0]("APSConnectionOverrideNamedDelegatePort", @"ApplePushService");
  return v2;
}

- (id)apsConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 queue:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)CUTWeakLinkClass());
  double v14 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v11, v12, (uint64_t)v10, v13, v9, v8);

  return v14;
}

- (id)createSim2HostServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7
{
  id v7 = (void *)IMXPCCreateSim2HostServerConnection();
  id v8 = [IDSXPCConnectionWrapper alloc];
  id v11 = objc_msgSend_initWithConnection_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

@end
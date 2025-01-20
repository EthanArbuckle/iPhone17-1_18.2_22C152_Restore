@interface __HMFSystemConfigurationDataSource
- (HMFSystemInfoNameDataSourceDelegate)delegate;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (__HMFSystemConfigurationDataSource)init;
- (__SCDynamicStore)store;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation __HMFSystemConfigurationDataSource

- (__HMFSystemConfigurationDataSource)init
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)__HMFSystemConfigurationDataSource;
  v2 = [(__HMFSystemConfigurationDataSource *)&v32 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3;
    memset(&context, 0, sizeof(context));
    v9 = v8;
    context.info = v9;
    SCDynamicStoreRef v10 = SCDynamicStoreCreate(0, @"HostNameChange", (SCDynamicStoreCallBack)__updateName, &context);
    if (!v10)
    {
      v23 = (void *)MEMORY[0x19F3A87A0]();
      v24 = v9;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier(v24);
        *(_DWORD *)buf = 138543362;
        v34 = v26;
        _os_log_impl(&dword_19D57B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create store", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v11 = v10;
    v9->_store = (__SCDynamicStore *)CFRetain(v10);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      v13 = Mutable;
      CFStringRef HostNames = SCDynamicStoreKeyCreateHostNames(0);
      if (HostNames)
      {
        CFStringRef v15 = HostNames;
        CFArrayAppendValue(v13, HostNames);
        if (SCDynamicStoreSetNotificationKeys(v11, v13, 0))
        {
          v16 = [(__HMFSystemConfigurationDataSource *)v9 queue];
          int v17 = SCDynamicStoreSetDispatchQueue(v11, v16);

          if (v17)
          {
LABEL_18:
            CFRelease(v11);
            CFRelease(v13);
            v27 = (__CFArray *)v15;
            goto LABEL_19;
          }
          v18 = (void *)MEMORY[0x19F3A87A0]();
          v19 = v9;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = HMFGetLogIdentifier(v19);
            LODWORD(context.version) = 138543362;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v21;
            v22 = "%{public}@Failed to set DispatchQueue on DynamicStore";
LABEL_16:
            _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&context, 0xCu);
          }
        }
        else
        {
          v18 = (void *)MEMORY[0x19F3A87A0]();
          v28 = v9;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = HMFGetLogIdentifier(v28);
            LODWORD(context.version) = 138543362;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v21;
            v22 = "%{public}@Failed to set Notification on DynamicStore";
            goto LABEL_16;
          }
        }

        goto LABEL_18;
      }
      CFRelease(v11);
      v27 = v13;
    }
    else
    {
      v27 = v11;
    }
LABEL_19:
    CFRelease(v27);
LABEL_20:

    CFStringRef v29 = SCDynamicStoreCopyLocalHostName(0);
    name = v9->_name;
    v9->_name = &v29->isa;
  }
  return v3;
}

- (void)dealloc
{
  store = self->_store;
  if (store) {
    CFRelease(store);
  }
  v4.receiver = self;
  v4.super_class = (Class)__HMFSystemConfigurationDataSource;
  [(__HMFSystemConfigurationDataSource *)&v4 dealloc];
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFSystemInfoNameDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFSystemInfoNameDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
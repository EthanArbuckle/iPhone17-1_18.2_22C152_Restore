@interface HMFActivity
+ (HMFActivity)_currentActivity;
+ (HMFActivity)activityWithName:(id)a3 block:(id)a4;
+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 block:(id)a5;
+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5 block:(id)a6;
+ (NSString)currentClientMetricIdentifier;
+ (id)bundleIdentifier;
+ (id)logCategory;
+ (id)shortDescription;
+ (void)initialize;
+ (void)markCurrentActivity;
+ (void)markCurrentActivityWithFormat:(id)a3;
+ (void)markCurrentActivityWithReason:(id)a3;
- (BOOL)hasStarted;
- (BOOL)isValid;
- (HMFActivity)init;
- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 assertions:(id)a6;
- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 options:(unint64_t)a6;
- (HMFActivity)initWithName:(id)a3;
- (HMFActivity)initWithName:(id)a3 parent:(id)a4;
- (HMFActivity)initWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5;
- (HMFActivity)parent;
- (NSArray)attributeDescriptions;
- (NSString)clientMetricIdentifier;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (id)_associatedObjectForKey:(id)a3;
- (id)blockWithBlock:(id)a3;
- (id)blockWithQualityOfService:(int64_t)a3 block:(id)a4;
- (id)logIdentifier;
- (unint64_t)assertions;
- (unint64_t)hash;
- (unint64_t)options;
- (void)_setAssociatedObject:(id)a3 forKey:(id)a4;
- (void)begin;
- (void)dealloc;
- (void)end;
- (void)invalidate;
- (void)mark;
- (void)markWithFormat:(id)a3;
- (void)markWithReason:(id)a3;
- (void)performBlock:(id)a3;
- (void)setClientMetricIdentifier:(id)a3;
- (void)start;
- (void)synchronizeWithActivityLock:(id)a3;
@end

@implementation HMFActivity

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_valid)
  {
    self->_valid = 0;
    __HMFActivityInvalidate(self);
  }
  os_unfair_lock_unlock(p_lock);
  id v8 = (id)__manager;
  v4 = self;
  identifier = (const void *)os_activity_get_identifier((os_activity_t)v4->_internal, 0);
  uint64_t v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x19F3A87A0](v6);
  NSMapRemove(*((NSMapTable **)v8 + 2), identifier);
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
}

+ (NSString)currentClientMetricIdentifier
{
  v2 = +[HMFActivity _currentActivity];
  v3 = [v2 clientMetricIdentifier];

  return (NSString *)v3;
}

- (NSString)clientMetricIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HMFActivity_ClientMetricIdentifier__clientMetricIdentifier__block_invoke;
  v4[3] = &unk_1E5958478;
  v4[4] = self;
  v4[5] = &v5;
  [(HMFActivity *)self synchronizeWithActivityLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setClientMetricIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HMFActivity_ClientMetricIdentifier__setClientMetricIdentifier___block_invoke;
  v6[3] = &unk_1E5957730;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMFActivity *)self synchronizeWithActivityLock:v6];
}

- (void)synchronizeWithActivityLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock_with_options();
  v4[2]();
  os_unfair_lock_unlock(&self->_lock);
}

void __65__HMFActivity_ClientMetricIdentifier__setClientMetricIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _associatedObjectForKey:@"HMFClientMetricIdentifier"];
  if (v2)
  {
    v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543874;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v2;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_ERROR, "%{public}@Using existing clientMetricIdentifier: %@ and dropping: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _setAssociatedObject:*(void *)(a1 + 40) forKey:@"HMFClientMetricIdentifier"];
  }
}

- (id)_associatedObjectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_associatedObjects objectForKey:v5];

  return v6;
}

- (void)_setAssociatedObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  associatedObjects = self->_associatedObjects;
  if (!associatedObjects)
  {
    int v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = self->_associatedObjects;
    self->_associatedObjects = v8;

    associatedObjects = self->_associatedObjects;
  }
  [(NSMutableDictionary *)associatedObjects setObject:v10 forKeyedSubscript:v6];
}

uint64_t __61__HMFActivity_ClientMetricIdentifier__clientMetricIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _associatedObjectForKey:@"HMFClientMetricIdentifier"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 80) & 4) != 0) {
    uint64_t v2 = voucher_copy_without_importance();
  }
  else {
    uint64_t v2 = voucher_copy();
  }
  *(void *)(*(void *)(a1 + 32) + 16) = v2;
  return MEMORY[0x1F41817F8]();
}

void __20__HMFActivity_start__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Started", (uint8_t *)&v6, 0xCu);
  }
}

void __30__HMFActivity_markWithReason___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x19F3A87A0]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = HMFGetLogIdentifier(v4);
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    v9 = "%{public}@Marked with reason: %@";
    id v10 = v5;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = HMFGetLogIdentifier(v4);
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    v9 = "%{public}@Marked";
    id v10 = v5;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);

LABEL_7:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  __int16 v12 = *(void **)(a1 + 40);
  if (v12) {
    __int16 v12 = (void *)v12[11];
  }
  uint64_t v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "mark", (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAssertions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_associatedObjects, 0);
  objc_storeStrong((id *)&self->_threadContexts, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)markWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_valid)
  {
    BOOL v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();

    BOOL v8 = os_signpost_enabled(v7);
    if (v8)
    {
      v9 = v6;
      id v10 = HMFGetOSLogHandle();

      uint32_t v11 = v9;
      os_signpost_id_t v20 = 0;
      *(_OWORD *)buf = 0uLL;
      [v11[7] getUUIDBytes:buf];
      __int16 v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:buf length:16 freeWhenDone:0];
      objc_msgSend(v12, "getBytes:range:", &v20, objc_msgSend(v12, "length") - 8, 8);

      os_signpost_id_t v13 = v20;
      if (os_signpost_enabled(v10))
      {
        if (v13 + 1 >= 2) {
          os_signpost_id_t v14 = v13;
        }
        else {
          os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_signpost_emit_with_name_impl(&dword_19D57B000, v10, OS_SIGNPOST_EVENT, v14, "HMFActivity", "Reason = %@", buf, 0xCu);
      }
    }
    uint64_t v15 = (void *)MEMORY[0x19F3A87A0]();
    internal = v6->_internal;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HMFActivity_markWithReason___block_invoke;
    block[3] = &unk_1E5957730;
    id v18 = v4;
    long long v19 = v6;
    os_activity_apply(internal, block);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1 && ([(os_unfair_lock_s *)a1 hasStarted] & 1) == 0)
  {
    uint64_t v2 = NSStringFromSelector(sel_hasStarted);
    [(os_unfair_lock_s *)a1 willChangeValueForKey:v2];

    lock = a1 + 8;
    os_unfair_lock_lock_with_options();
    *(void *)&a1[24]._os_unfair_lock_opaque = mach_continuous_time();
    id v3 = [(os_unfair_lock_s *)a1 parent];
    id v4 = a1;
    id v5 = HMFGetOSLogHandle();

    BOOL v6 = os_signpost_enabled(v5);
    if (v6)
    {
      uint64_t v7 = v4;
      BOOL v8 = HMFGetOSLogHandle();

      v9 = v7;
      os_signpost_id_t v42 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      [v9[7] getUUIDBytes:buf];
      id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:buf length:16 freeWhenDone:0];
      objc_msgSend(v10, "getBytes:range:", &v42, objc_msgSend(v10, "length") - 8, 8);

      if (v42 + 1 >= 2) {
        os_signpost_id_t v11 = v42;
      }
      else {
        os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;
      }

      if (os_signpost_enabled(v8))
      {
        __int16 v12 = [v9 identifier];
        id v13 = [v12 UUIDString];
        os_signpost_id_t v14 = [v3 identifier];
        id v15 = [v14 UUIDString];
        uint64_t v16 = [v9 name];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        __int16 v44 = 2112;
        v45 = v16;
        _os_signpost_emit_with_name_impl(&dword_19D57B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HMFActivity", "Identifier = %@, Parent = %@, Name = %@", buf, 0x20u);
      }
    }
    v17 = (void *)MEMORY[0x19F3A87A0]();
    id v18 = *(NSObject **)&v4[2]._os_unfair_lock_opaque;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__HMFActivity_start__block_invoke;
    block[3] = &unk_1E5957698;
    void block[4] = v4;
    os_activity_apply(v18, block);
    uint64_t v19 = [(os_unfair_lock_s *)v4 options];
    if ((v19 & 4) != 0
      || ([(os_unfair_lock_s *)v4 shortDescription],
          os_signpost_id_t v20 = objc_claimAutoreleasedReturnValue(),
          [v3 markWithFormat:@"Started child activity: %@", v20],
          v20,
          v19))
    {
      long long v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      uint64_t v22 = NSString;
      v23 = [(os_unfair_lock_s *)v4 name];
      v24 = [(os_unfair_lock_s *)v4 identifier];
      __int16 v25 = [v24 UUIDString];
      uint64_t v26 = [v22 stringWithFormat:@"%@.%@", v23, v25];

      if (v19)
      {
        uint64_t v27 = [[HMFMemoryAssertion alloc] initWithName:v26];
        if (v27)
        {
          [v21 addObject:v27];
        }
        else
        {
          context = (void *)MEMORY[0x19F3A87A0]();
          v28 = v4;
          HMFGetOSLogHandle();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier(v28);
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v30;
            _os_log_impl(&dword_19D57B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create memory assertion", buf, 0xCu);
          }
        }
      }
      if ((v19 & 2) != 0)
      {
        v31 = [[HMFPowerAssertion alloc] initWithName:v26];
        if (v31)
        {
          [v21 addObject:v31];
        }
        else
        {
          v32 = (void *)MEMORY[0x19F3A87A0]();
          v33 = v4;
          HMFGetOSLogHandle();
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = HMFGetLogIdentifier(v33);
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v35;
            _os_log_impl(&dword_19D57B000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create power assertion", buf, 0xCu);
          }
        }
      }
      if ((objc_msgSend(v21, "hmf_isEmpty") & 1) == 0)
      {
        uint64_t v36 = [v21 copy];
        v37 = *(void **)&v4[22]._os_unfair_lock_opaque;
        *(void *)&v4[22]._os_unfair_lock_opaque = v36;
      }
    }

    os_unfair_lock_unlock(lock);
    v38 = NSStringFromSelector(sel_hasStarted);
    [(os_unfair_lock_s *)v4 didChangeValueForKey:v38];
  }
}

- (BOOL)hasStarted
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v2) {
    LOBYTE(v2) = v2->_startMachTime != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMFActivity *)self name];
  BOOL v6 = [(HMFActivity *)self identifier];
  uint64_t v7 = [v6 UUIDString];
  BOOL v8 = [v3 stringWithFormat:@"%@ %@ (%@)", v4, v5, v7];

  return (NSString *)v8;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

+ (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (qword_1EB4EEC18 != -1) {
    dispatch_once(&qword_1EB4EEC18, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)qword_1EB4EEC20;
  return v2;
}

- (HMFActivity)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (HMFActivity *)WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_valid) {
    __HMFActivityInvalidate(self);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_threadContexts;
  uint64_t v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v8 = (void *)MEMORY[0x19F3A87A0]();
        v9 = self;
        id v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          os_signpost_id_t v11 = HMFGetLogIdentifier(v9);
          uint64_t v12 = [v7 count];
          id v13 = [v7 thread];
          *(_DWORD *)buf = 138543874;
          long long v21 = v11;
          __int16 v22 = 2048;
          uint64_t v23 = v12;
          __int16 v24 = 2112;
          __int16 v25 = v13;
          _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Thread left active (%tu): %@", buf, 0x20u);
        }
      }
      uint64_t v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }

  v15.receiver = self;
  v15.super_class = (Class)HMFActivity;
  [(HMFActivity *)&v15 dealloc];
}

- (void)markWithFormat:(id)a3
{
  uint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  BOOL v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(HMFActivity *)self markWithReason:v6];
}

+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5 block:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x19F3A87A0]();
  id v13 = [[HMFActivity alloc] initWithName:v9 parent:v10 options:a5];
  internal = v13->_internal;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HMFActivity_activityWithName_parent_options_block___block_invoke;
  block[3] = &unk_1E5957E40;
  id v15 = v11;
  id v18 = v15;
  os_activity_apply(internal, block);
  [(HMFActivity *)v13 invalidate];

  return result;
}

- (HMFActivity)initWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5
{
  BOOL v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 UUID];
  uint64_t v12 = [(HMFActivity *)self initWithIdentifier:v11 name:v10 parent:v9 options:a5];

  return v12;
}

- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v46.receiver = self;
  v46.super_class = (Class)HMFActivity;
  os_signpost_id_t v14 = [(HMFActivity *)&v46 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v14->_identifier, a3);
  v15->_valid = 1;
  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  threadContexts = v15->_threadContexts;
  v15->_threadContexts = (NSMutableSet *)v16;

  uint64_t v18 = [v12 copy];
  name = v15->_name;
  v15->_name = (NSString *)v18;

  v15->_unint64_t options = a6;
  if (!v13)
  {
    id v13 = +[HMFActivity _currentActivity];
  }
  objc_storeWeak((id *)&v15->_parent, v13);
  id v20 = MEMORY[0x1E4F144F0];
  unint64_t options = v15->_options;
  id v41 = v12;
  if ((options & 8) != 0)
  {
    int v23 = 2;
    __int16 v22 = (void *)MEMORY[0x1E4F144F8];
  }
  else
  {
    if (!v13 || (__int16 v22 = (void *)*((void *)v13 + 1)) == 0)
    {
      int v23 = 2;
      __int16 v24 = MEMORY[0x1E4F144F0];
      goto LABEL_11;
    }
    int v23 = 0;
  }
  __int16 v24 = v22;

  unint64_t options = v15->_options;
LABEL_11:
  if ((options & 4) != 0) {
    os_activity_flag_t v25 = OS_ACTIVITY_FLAG_DETACHED;
  }
  else {
    os_activity_flag_t v25 = v23;
  }
  os_activity_t v26 = _os_activity_create(&dword_19D57B000, "HMFActivity", v24, v25);
  internal = v15->_internal;
  v15->_internal = (OS_os_activity *)v26;

  id v28 = (id)__manager;
  v29 = v15;
  identifier = (const void *)os_activity_get_identifier((os_activity_t)v15->_internal, 0);
  uint64_t v31 = os_unfair_lock_lock_with_options();
  v32 = (void *)MEMORY[0x19F3A87A0](v31);
  NSMapInsert(*((NSMapTable **)v28 + 2), identifier, v29);
  os_unfair_lock_unlock((os_unfair_lock_t)v28 + 2);

  v33 = (void *)MEMORY[0x19F3A87A0]();
  v34 = v15->_internal;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke;
  block[3] = &unk_1E5957698;
  v35 = v29;
  v45 = v35;
  os_activity_apply(v34, block);

  if (v13)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v36 = (void *)[*((id *)v13 + 5) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)v13 + 8);
    if (v36)
    {
      uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v36];
      associatedObjects = v35->_associatedObjects;
      v35->_associatedObjects = (NSMutableDictionary *)v37;

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke_2;
      v42[3] = &unk_1E5957E90;
      v43 = v35;
      [v36 enumerateKeysAndObjectsUsingBlock:v42];
      if (![(NSMutableDictionary *)v35->_associatedObjects count])
      {
        v39 = v35->_associatedObjects;
        v35->_associatedObjects = 0;
      }
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
  id v12 = v41;
  if ((v15->_options & 0x10) == 0)
  {
    -[HMFActivity start]((os_unfair_lock_s *)v35);
    __HMFActivityBegin(v35);
  }

LABEL_23:
  return v15;
}

+ (HMFActivity)_currentActivity
{
  id v2 = (id)__manager;
  identifier = (void *)os_activity_get_identifier(MEMORY[0x1E4F144F0], 0);
  if (identifier)
  {
    uint64_t v4 = os_unfair_lock_lock_with_options();
    id v5 = (void *)MEMORY[0x19F3A87A0](v4);
    identifier = NSMapGet(*((NSMapTable **)v2 + 2), identifier);
    os_unfair_lock_unlock((os_unfair_lock_t)v2 + 2);
    if (([identifier isValid] & 1) == 0)
    {

      identifier = 0;
    }
  }

  return (HMFActivity *)identifier;
}

- (HMFActivity)initWithName:(id)a3
{
  return [(HMFActivity *)self initWithName:a3 parent:0 options:0];
}

- (void)end
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __HMFActivityEnd(self);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isValid
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __53__HMFActivity_activityWithName_parent_options_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (HMFActivity)activityWithName:(id)a3 block:(id)a4
{
  return (HMFActivity *)[a1 activityWithName:a3 parent:0 options:0 block:a4];
}

- (void)begin
{
  -[HMFActivity start]((os_unfair_lock_s *)self);
  os_unfair_lock_lock_with_options();
  __HMFActivityBegin(self);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)blockWithQualityOfService:(int64_t)a3 block:(id)a4
{
  id v5 = a4;
  if (!v5) {
    _HMFPreconditionFailure(@"block");
  }
  BOOL v6 = v5;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  uint64_t v7 = (void *)dispatch_block_create_with_voucher_and_qos_class();

  return v7;
}

uint64_t __26__HMFActivity_logCategory__block_invoke()
{
  qword_1EB4EEC20 = HMFCreateOSLogHandle(@"Activity", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  __manager = objc_alloc_init(__HMFActivityManager);
  MEMORY[0x1F41817F8]();
}

+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 block:(id)a5
{
  return (HMFActivity *)[a1 activityWithName:a3 parent:a4 options:0 block:a5];
}

+ (id)bundleIdentifier
{
  if (qword_1EB4EEC10 != -1) {
    dispatch_once(&qword_1EB4EEC10, &__block_literal_global_19);
  }
  id v2 = (void *)_MergedGlobals_7;
  return v2;
}

void __31__HMFActivity_bundleIdentifier__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3A87A0]();
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 bundleIdentifier];
  uint64_t v3 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v2;
}

+ (void)markCurrentActivity
{
  id v2 = [a1 currentActivityForMarking];
  [v2 mark];
}

+ (void)markCurrentActivityWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [a1 currentActivityForMarking];
  [v5 markWithReason:v4];
}

+ (void)markCurrentActivityWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [a1 currentActivityForMarking];
  BOOL v6 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v7];

  [v5 markWithReason:v6];
}

- (HMFActivity)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFActivity)initWithName:(id)a3 parent:(id)a4
{
  return [(HMFActivity *)self initWithName:a3 parent:a4 options:0];
}

- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 assertions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v13 count]) {
    _HMFPreconditionFailure(@"assertions.count");
  }
  os_signpost_id_t v14 = [(HMFActivity *)self initWithIdentifier:v10 name:v11 parent:v12 options:0];
  if (v14->_internalAssertions) {
    _HMFPreconditionFailure(@"nil == self->_internalAssertions");
  }
  id v15 = v14;
  uint64_t v16 = [v13 copy];
  internalAssertions = v15->_internalAssertions;
  v15->_internalAssertions = (NSArray *)v16;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__HMFActivity_initWithIdentifier_name_parent_assertions___block_invoke;
  v20[3] = &unk_1E5957E68;
  uint64_t v18 = v15;
  long long v21 = v18;
  [v13 enumerateObjectsUsingBlock:v20];

  return v18;
}

void __57__HMFActivity_initWithIdentifier_name_parent_assertions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 acquire:0] & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier(v5);
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to acquire the assertion : %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 objectForChildActivity];
  if (v5) {
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKey:v6];
  }
}

- (unint64_t)hash
{
  return os_activity_get_identifier((os_activity_t)self->_internal, 0);
}

- (NSArray)attributeDescriptions
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFActivity *)self parent];
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];
  id v7 = [(HMFAttributeDescription *)v3 initWithName:@"Parent" value:v6];
  int v8 = [HMFAttributeDescription alloc];
  unint64_t v9 = [(HMFActivity *)self assertions];
  if (v9)
  {
    char v10 = v9;
    id v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = v11;
    if (v10) {
      [v11 addObject:@"Memory"];
    }
    if ((v10 & 2) != 0) {
      [v12 addObject:@"Power"];
    }
    if ([v12 count])
    {
      id v13 = [v12 componentsJoinedByString:@", "];
    }
    else
    {
      id v13 = @"Unknown";
    }
  }
  else
  {
    id v13 = @"None";
  }
  os_signpost_id_t v14 = [(HMFAttributeDescription *)v8 initWithName:@"Assertions" value:v13];
  v20[1] = v14;
  id v15 = [HMFAttributeDescription alloc];
  uint64_t v16 = HMFBooleanToString([(HMFActivity *)self isValid]);
  long long v17 = [(HMFAttributeDescription *)v15 initWithName:@"Valid" value:v16];
  v20[2] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  return (NSArray *)v18;
}

- (unint64_t)assertions
{
  return self->_options & 3;
}

- (void)mark
{
}

- (id)blockWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"block");
  }
  id v5 = v4;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  id v6 = (void *)dispatch_block_create_with_voucher();

  return v6;
}

- (void)performBlock:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[HMFActivity start]((os_unfair_lock_s *)self);
    id v5 = [(HMFActivity *)self blockWithBlock:v4];

    v5[2]();
  }
}

- (id)logIdentifier
{
  id v2 = NSString;
  name = self->_name;
  id v4 = [(NSUUID *)self->_identifier UUIDString];
  id v5 = [v2 stringWithFormat:@"%@ (%@)", name, v4];

  return v5;
}

@end
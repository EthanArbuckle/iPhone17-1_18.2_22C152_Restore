@interface BKIOHIDServicePersistentPropertyController
+ (id)digitizerServicePersistentPropertyController;
+ (id)sharedInstances;
+ (id)touchSensitiveButtonServicePersistentPropertyController;
- (BKIOHIDServicePersistentPropertyController)initWithClientEntitlement:(id)a3 defaults:(id)a4 defaultsKey:(id)a5;
- (NSString)clientEntitlement;
- (id)allPersistentPropertiesForServicesMatchingDescriptor:(id)a3;
- (id)persistentPropertiesForKeys:(id)a3 forSenderDescriptor:(id)a4;
- (void)registerHandler:(id)a3;
- (void)setPersistentProperties:(id)a3 forSenderDescriptor:(id)a4;
@end

@implementation BKIOHIDServicePersistentPropertyController

- (id)allPersistentPropertiesForServicesMatchingDescriptor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_unfair_lock_t lock = &self->_defaultsLock;
  os_unfair_lock_lock(&self->_defaultsLock);
  v5 = [(BKSLocalDefaults *)self->_defaultsLock_defaults valueForKey:self->_defaultsKey defaultValueProvider:&__block_literal_global_33_2201];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"sender", lock);
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F4F308]) initFromPropertyList:v11];
        if ([v4 matchesDescriptor:v12 failureReason:0])
        {
          v13 = [v10 objectForKeyedSubscript:@"props"];
          if ([v13 count]) {
            [v16 addEntriesFromDictionary:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  os_unfair_lock_unlock(lock);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_clientEntitlement, 0);
  objc_storeStrong((id *)&self->_handlersLock_handlers, 0);

  objc_storeStrong((id *)&self->_defaultsLock_defaults, 0);
}

- (NSString)clientEntitlement
{
  return self->_clientEntitlement;
}

uint64_t __99__BKIOHIDServicePersistentPropertyController_allPersistentPropertiesForServicesMatchingDescriptor___block_invoke()
{
  return 0;
}

- (id)persistentPropertiesForKeys:(id)a3 forSenderDescriptor:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_defaultsLock = &self->_defaultsLock;
  os_unfair_lock_lock(&self->_defaultsLock);
  v9 = [v7 propertyListEncoded];
  [(BKSLocalDefaults *)self->_defaultsLock_defaults valueForKey:self->_defaultsKey defaultValueProvider:&__block_literal_global_24_2211];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v33 = &self->_defaultsLock;
    uint64_t v12 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:@"sender"];
        if ([v15 isEqual:v9])
        {
          v30 = v9;
          id v31 = v7;
          long long v17 = [v14 objectForKeyedSubscript:@"props"];
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v32 = v6;
          id v18 = v6;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v36 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * j);
                v24 = [v17 objectForKeyedSubscript:v23];
                v25 = v24;
                if (v24)
                {
                  v26 = (void *)[v24 copy];
                  [v16 setObject:v26 forKeyedSubscript:v23];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v20);
          }

          id v7 = v31;
          id v6 = v32;
          v9 = v30;
          goto LABEL_20;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    id v16 = 0;
LABEL_20:
    p_defaultsLock = v33;
  }
  else
  {
    id v16 = 0;
  }

  os_unfair_lock_unlock(p_defaultsLock);
  if (v16) {
    v27 = v16;
  }
  else {
    v27 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v28 = v27;

  return v28;
}

uint64_t __94__BKIOHIDServicePersistentPropertyController_persistentPropertiesForKeys_forSenderDescriptor___block_invoke()
{
  return 0;
}

- (void)setPersistentProperties:(id)a3 forSenderDescriptor:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!CFPropertyListIsValid(v7, kCFPropertyListXMLFormat_v1_0))
  {
    v43 = [NSString stringWithFormat:@"non-plistable type in %@", v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v44 = NSStringFromSelector(a2);
      uint64_t v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2048;
      v65 = self;
      *(_WORD *)v66 = 2114;
      *(void *)&v66[2] = @"BKIOHIDServicePersistentPropertyController.m";
      __int16 v67 = 1024;
      int v68 = 141;
      __int16 v69 = 2114;
      v70 = v43;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE001E4);
  }
  id v9 = v8;
  if (self)
  {
    os_unfair_lock_lock(&self->_handlersLock);
    uint64_t v10 = (void *)[(NSMutableArray *)self->_handlersLock_handlers copy];
    os_unfair_lock_unlock(&self->_handlersLock);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __75__BKIOHIDServicePersistentPropertyController__handlersForSenderDescriptor___block_invoke;
    v65 = (BKIOHIDServicePersistentPropertyController *)&unk_1E6871678;
    *(void *)v66 = v9;
    uint64_t v11 = objc_msgSend(v10, "bs_filter:", buf);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke;
  v54[3] = &unk_1E68716A0;
  id v12 = v7;
  id v55 = v12;
  v13 = (BKIOHIDServicePersistentPropertyController *)v9;
  v56 = v13;
  v57 = self;
  v14 = objc_msgSend(v11, "bs_filter:", v54);

  uint64_t v15 = [v14 count];
  id v16 = BKLogHID();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      defaultsKey = self->_defaultsKey;
      uint64_t v19 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v12];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = defaultsKey;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2114;
      v65 = v13;
      _os_log_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): %{public}@ forServicesMatching:(%{public}@)", buf, 0x20u);
    }
    os_unfair_lock_t lock = &self->_defaultsLock;
    os_unfair_lock_lock(&self->_defaultsLock);
    v51 = v13;
    uint64_t v20 = [(BKIOHIDServicePersistentPropertyController *)v13 propertyListEncoded];
    uint64_t v21 = [(BKSLocalDefaults *)self->_defaultsLock_defaults valueForKey:self->_defaultsKey defaultValueProvider:&__block_literal_global_22];
    uint64_t v22 = objc_opt_class();
    id v23 = v21;
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    v50 = v14;
    v53 = self;
    id v26 = v24;

    id v27 = (id)[v26 mutableCopy];
    if (!v27) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v16 = v20;
    id v52 = v12;
    id v47 = v12;
    v48 = v27;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v27, 1uLL);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v29 = DeepCopy;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v58 objects:buf count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v59;
      while (2)
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v58 + 1) + 8 * v33);
          uint64_t v35 = objc_opt_class();
          id v36 = v34;
          if (v35)
          {
            if (objc_opt_isKindOfClass()) {
              long long v37 = v36;
            }
            else {
              long long v37 = 0;
            }
          }
          else
          {
            long long v37 = 0;
          }
          id v38 = v37;

          if (v38)
          {
            long long v39 = [v38 objectForKeyedSubscript:@"sender"];
            long long v40 = [v38 objectForKeyedSubscript:@"props"];
            if ([v39 isEqual:v16])
            {
              long long v41 = v47;
              [v40 addEntriesFromDictionary:v47];

              long long v42 = v29;
              goto LABEL_33;
            }
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:buf count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    v62[0] = @"sender";
    v62[1] = @"props";
    long long v41 = v47;
    v63[0] = v16;
    v63[1] = v47;
    long long v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    [v29 addObject:v42];
LABEL_33:

    [(BKSLocalDefaults *)v53->_defaultsLock_defaults setValue:v29 forKey:v53->_defaultsKey];
    os_unfair_lock_unlock(lock);

    v13 = v51;
    id v12 = v52;
    v14 = v50;
  }
  else if (v17)
  {
    v25 = self->_defaultsKey;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): no support for <%{public}@>", buf, 0x16u);
  }
}

uint64_t __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 setPersistentProperties:a1[4] forServicesMatchingDescriptor:a1[5]];
  if (v4 == 1)
  {
    v5 = BKLogHID();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1[6] + 40);
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2048;
      id v16 = v3;
      id v7 = v14;
      _os_log_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): properties disallowed by handler <%{public}@: %p>", (uint8_t *)&v11, 0x20u);
      goto LABEL_7;
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v9 = 1;
      goto LABEL_10;
    }
    v5 = BKLogHID();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1[6] + 40);
      int v11 = 138543874;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2048;
      id v16 = v3;
      id v7 = v14;
      _os_log_debug_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEBUG, "setPersistentProperties(%{public}@): handler <%{public}@: %p> does not handle this sender descriptor", (uint8_t *)&v11, 0x20u);
LABEL_7:
    }
  }

  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

uint64_t __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke_19()
{
  return 0;
}

uint64_t __75__BKIOHIDServicePersistentPropertyController__handlersForSenderDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handlesPersistentPropertiesForSenderDescriptor:*(void *)(a1 + 32)];
}

- (void)registerHandler:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_handlersLock);
  handlersLock_handlers = self->_handlersLock_handlers;
  if (!handlersLock_handlers)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = self->_handlersLock_handlers;
    self->_handlersLock_handlers = v5;

    handlersLock_handlers = self->_handlersLock_handlers;
  }
  [(NSMutableArray *)handlersLock_handlers addObject:v7];
  os_unfair_lock_unlock(&self->_handlersLock);
}

- (BKIOHIDServicePersistentPropertyController)initWithClientEntitlement:(id)a3 defaults:(id)a4 defaultsKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKIOHIDServicePersistentPropertyController;
  uint64_t v12 = [(BKIOHIDServicePersistentPropertyController *)&v15 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientEntitlement, a3);
    objc_storeStrong((id *)&v13->_defaultsLock_defaults, a4);
    objc_storeStrong((id *)&v13->_defaultsKey, a5);
    *(void *)&v13->_handlersLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

+ (id)touchSensitiveButtonServicePersistentPropertyController
{
  if (touchSensitiveButtonServicePersistentPropertyController_onceToken != -1) {
    dispatch_once(&touchSensitiveButtonServicePersistentPropertyController_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)touchSensitiveButtonServicePersistentPropertyController_sharedController;

  return v2;
}

void __101__BKIOHIDServicePersistentPropertyController_touchSensitiveButtonServicePersistentPropertyController__block_invoke()
{
  v0 = [BKIOHIDServicePersistentPropertyController alloc];
  id v3 = [MEMORY[0x1E4F4F240] localDefaults];
  uint64_t v1 = [(BKIOHIDServicePersistentPropertyController *)v0 initWithClientEntitlement:@"com.apple.backboardd.hidPersistentProperty-TouchSensitiveButton" defaults:v3 defaultsKey:@"BKTouchSensitiveButtonPersistentServiceProperties"];
  v2 = (void *)touchSensitiveButtonServicePersistentPropertyController_sharedController;
  touchSensitiveButtonServicePersistentPropertyController_sharedController = v1;
}

+ (id)digitizerServicePersistentPropertyController
{
  if (digitizerServicePersistentPropertyController_onceToken != -1) {
    dispatch_once(&digitizerServicePersistentPropertyController_onceToken, &__block_literal_global_2239);
  }
  v2 = (void *)digitizerServicePersistentPropertyController_sharedController;

  return v2;
}

void __90__BKIOHIDServicePersistentPropertyController_digitizerServicePersistentPropertyController__block_invoke()
{
  v0 = [BKIOHIDServicePersistentPropertyController alloc];
  id v3 = [MEMORY[0x1E4F4F240] localDefaults];
  uint64_t v1 = [(BKIOHIDServicePersistentPropertyController *)v0 initWithClientEntitlement:@"com.apple.backboardd.hidPersistentProperty-digitizer" defaults:v3 defaultsKey:@"BKDigitizerPersistentServiceProperties"];
  v2 = (void *)digitizerServicePersistentPropertyController_sharedController;
  digitizerServicePersistentPropertyController_sharedController = v1;
}

+ (id)sharedInstances
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BKIOHIDServicePersistentPropertyController_sharedInstances__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstances_onceToken != -1) {
    dispatch_once(&sharedInstances_onceToken, block);
  }
  v2 = (void *)sharedInstances_sharedInstances;

  return v2;
}

void __61__BKIOHIDServicePersistentPropertyController_sharedInstances__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v6 = [*(id *)(a1 + 32) digitizerServicePersistentPropertyController];
  id v3 = [*(id *)(a1 + 32) touchSensitiveButtonServicePersistentPropertyController];
  uint64_t v4 = objc_msgSend(v2, "initWithObjects:", v6, v3, 0);
  v5 = (void *)sharedInstances_sharedInstances;
  sharedInstances_sharedInstances = v4;
}

@end
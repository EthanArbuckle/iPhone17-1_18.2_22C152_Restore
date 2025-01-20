@interface ICDeviceHardwareHandler
- (ICDeviceHardwareHandler)init;
- (void)addDeviceContext:(id)a3;
- (void)removeDeviceContext:(id)a3;
@end

@implementation ICDeviceHardwareHandler

- (ICDeviceHardwareHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICDeviceHardwareHandler;
  v2 = [(ICDeviceHardwareHandler *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_deviceContextsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deviceContexts = v3->_deviceContexts;
    v3->_deviceContexts = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    disabledContexts = v3->_disabledContexts;
    v3->_disabledContexts = v6;
  }
  return v3;
}

- (void)addDeviceContext:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __ICOSLogCreate();
  v5 = @"addDeviceContext";
  if ((unint64_t)[@"addDeviceContext" length] >= 0x15)
  {
    v6 = objc_msgSend(@"addDeviceContext", "substringWithRange:", 0, 18);
    v5 = [v6 stringByAppendingString:@".."];
  }
  v7 = NSString;
  v8 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
  objc_super v9 = [v4 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
  v10 = [v7 stringWithFormat:@"Handle: %@ | Identifier: %@", v8, v9];

  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v5;
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    uint64_t v57 = [(__CFString *)v12 UTF8String];
    __int16 v58 = 2114;
    v59 = v10;
    _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  lock = &self->_deviceContextsLock;
  os_unfair_lock_lock(&self->_deviceContextsLock);
  v48 = self;
  v14 = (void *)[(NSMutableArray *)self->_deviceContexts copy];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v52 != v17) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v51 + 1) + 8 * v18);
      v20 = [v19 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
      v21 = [v4 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
      int v22 = [v20 isEqualToString:v21];

      v23 = [v19 objectForKeyedSubscript:@"ICDeviceHandle"];
      v24 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
      char v25 = [v23 isEqualToString:v24];

      if (v22 & 1) != 0 || (v25) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v16) {
          goto LABEL_7;
        }
        goto LABEL_14;
      }
    }

    if (v22)
    {
      v27 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
      [(NSMutableArray *)v48->_disabledContexts addObject:v4];
      __ICOSLogCreate();
      v28 = @"adding (disabled)";
      v26 = lock;
      if ((unint64_t)[@"adding (disabled)" length] >= 0x15)
      {
        v29 = objc_msgSend(@"adding (disabled)", "substringWithRange:", 0, 18);
        v28 = [v29 stringByAppendingString:@".."];
      }
      v30 = NSString;
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      v33 = [v30 stringWithFormat:@"%@ -> %@", v32, v27];

      v34 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v28;
        v36 = v34;
        uint64_t v37 = [(__CFString *)v35 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v57 = v37;
        __int16 v58 = 2114;
        v59 = v33;
        _os_log_impl(&dword_1BEEFF000, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      goto LABEL_27;
    }
    v26 = lock;
    if (v25) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_14:

    v26 = lock;
  }
  [(NSMutableArray *)v48->_deviceContexts addObject:v4];
  v27 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
  __ICOSLogCreate();
  v38 = @"adding (new)";
  if ((unint64_t)[@"adding (new)" length] >= 0x15)
  {
    v39 = objc_msgSend(@"adding (new)", "substringWithRange:", 0, 18);
    v38 = [v39 stringByAppendingString:@".."];
  }
  v40 = NSString;
  v41 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v41);
  v43 = [v40 stringWithFormat:@"%@ -> %@", v42, v27];

  v44 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v38;
    v46 = v44;
    uint64_t v47 = [(__CFString *)v45 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v57 = v47;
    __int16 v58 = 2114;
    v59 = v43;
    _os_log_impl(&dword_1BEEFF000, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v28 = [v4 objectForKeyedSubscript:@"ICDeviceDelegate"];
  [(__CFString *)v28 openDeviceHandle:v27];
LABEL_27:

LABEL_28:
  os_unfair_lock_unlock(v26);
}

- (void)removeDeviceContext:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __ICOSLogCreate();
  v5 = @"removeDeviceContext";
  if ((unint64_t)[@"removeDeviceContext" length] >= 0x15)
  {
    v6 = objc_msgSend(@"removeDeviceContext", "substringWithRange:", 0, 18);
    v5 = [v6 stringByAppendingString:@".."];
  }
  v7 = NSString;
  v8 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
  objc_super v9 = [v4 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
  v10 = [v7 stringWithFormat:@"Handle: %@ | Identifier: %@", v8, v9];

  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v5;
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    uint64_t v90 = [(__CFString *)v12 UTF8String];
    __int16 v91 = 2114;
    v92 = v10;
    _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  os_unfair_lock_t lock = &self->_deviceContextsLock;
  os_unfair_lock_lock(&self->_deviceContextsLock);
  v73 = self;
  v14 = (void *)[(NSMutableArray *)self->_disabledContexts copy];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v83;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v83 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v21 = [v20 objectForKeyedSubscript:@"ICDeviceHandle"];
        int v22 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
        int v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          [(NSMutableArray *)v73->_disabledContexts removeObject:v20];
          __ICOSLogCreate();
          v36 = @"removing (disabled)";
          if ((unint64_t)[@"removing (disabled)" length] >= 0x15)
          {
            uint64_t v37 = objc_msgSend(@"removing (disabled)", "substringWithRange:", 0, 18);
            v36 = [v37 stringByAppendingString:@".."];
          }
          v38 = NSString;
          v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          v41 = [v38 stringWithFormat:@"%@ -> %@", v40, v20];

          v42 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v43 = v36;
            v44 = v42;
            uint64_t v45 = [(__CFString *)v43 UTF8String];
            *(_DWORD *)buf = 136446466;
            uint64_t v90 = v45;
            __int16 v91 = 2114;
            v92 = v41;
            _os_log_impl(&dword_1BEEFF000, v44, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          os_unfair_lock_unlock(lock);
          goto LABEL_49;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  v24 = v73;
  char v25 = (void *)[(NSMutableArray *)v73->_deviceContexts copy];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v87 count:16];
  id v71 = v15;
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v79;
    while (2)
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v79 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        v32 = [v31 objectForKeyedSubscript:@"ICDeviceHandle"];
        v33 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
        int v34 = [v32 isEqualToString:v33];

        if (v34)
        {
          v46 = [v31 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
          v35 = (void *)[v46 copy];

          uint64_t v47 = [v31 objectForKeyedSubscript:@"ICDeviceDelegate"];
          v48 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
          [v47 closeDeviceHandle:v48];

          v24 = v73;
          [(NSMutableArray *)v73->_deviceContexts removeObject:v31];

          goto LABEL_28;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v78 objects:v87 count:16];
      if (v28) {
        continue;
      }
      break;
    }
    v35 = 0;
    v24 = v73;
LABEL_28:
    id v15 = v71;
  }
  else
  {
    v35 = 0;
  }

  v49 = lock;
  os_unfair_lock_unlock(lock);
  if (v35)
  {
    os_unfair_lock_lock(lock);
    v50 = (void *)[(NSMutableArray *)v24->_disabledContexts copy];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v51 = v50;
    long long v52 = (void *)[v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v75;
      while (2)
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v75 != v53) {
            objc_enumerationMutation(v51);
          }
          v55 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
          v56 = [v55 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
          int v57 = [v56 isEqualToString:v35];

          if (v57)
          {
            uint64_t v58 = [v55 objectForKeyedSubscript:@"ICDeviceHandle"];
            __ICOSLogCreate();
            v59 = @"re-enabling (disabled)";
            if ((unint64_t)[@"re-enabling (disabled)" length] >= 0x15)
            {
              uint64_t v60 = objc_msgSend(@"re-enabling (disabled)", "substringWithRange:", 0, 18);
              v59 = [v60 stringByAppendingString:@".."];
            }
            v61 = NSString;
            v62 = (objc_class *)objc_opt_class();
            v63 = NSStringFromClass(v62);
            v70 = (void *)v58;
            v64 = [v61 stringWithFormat:@"%@ -> %@", v63, v58];

            v65 = (void *)_gICOSLog;
            id v15 = v71;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v66 = v59;
              v67 = v65;
              uint64_t v68 = [(__CFString *)v66 UTF8String];
              *(_DWORD *)buf = 136446466;
              uint64_t v90 = v68;
              __int16 v91 = 2114;
              v92 = v64;
              _os_log_impl(&dword_1BEEFF000, v67, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            long long v52 = (void *)[v55 copy];
            [(NSMutableArray *)v73->_disabledContexts removeObject:v55];

            goto LABEL_45;
          }
        }
        long long v52 = (void *)[v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
        if (v52) {
          continue;
        }
        break;
      }
      id v15 = v71;
LABEL_45:
      v49 = lock;
    }

    os_unfair_lock_unlock(v49);
    if (v52)
    {
      v69 = [v52 objectForKeyedSubscript:@"ICDeviceDelegate"];
      [v69 notifyAddedDevice:v52];
    }
  }
LABEL_49:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledContexts, 0);

  objc_storeStrong((id *)&self->_deviceContexts, 0);
}

@end
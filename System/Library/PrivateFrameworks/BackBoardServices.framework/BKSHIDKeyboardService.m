@interface BKSHIDKeyboardService
+ (id)new;
+ (id)sharedInstance;
- (BKSHIDKeyboardService)init;
- (_BKSHIDKeyboardDeviceClientProxy)_proxyDeviceForConcreteDevice:(uint64_t)a1;
- (id)_addObserver:(uint64_t)a3 forReason:;
- (id)_proxyDevicesForConcreteDevices:(void *)a1;
- (id)addKeyboardObserver:(id)a3;
- (id)allKeyboardDevices;
- (id)keyboardDeviceForSenderID:(unint64_t)a3;
- (void)_evaluateObservationStateAfterReconnect:(uint64_t)a1;
- (void)_updateKeyboards:(uint64_t)a1;
- (void)setConnectedKeyboards:(id)a3 withReply:(id)a4;
@end

@implementation BKSHIDKeyboardService

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke(uint64_t a1)
{
}

- (void)_updateKeyboards:(uint64_t)a1
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v5 = [v3 count];
    uint64_t v6 = [*(id *)(a1 + 40) count];
    uint64_t v71 = a1;
    if (v5)
    {
      v64 = (os_unfair_lock_s *)(a1 + 8);
      if (v6)
      {
        id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v63 = *(id *)(a1 + 40);
        id v7 = objc_alloc_init(MEMORY[0x1E4F4F798]);
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v65 = v3;
        obuint64_t j = v3;
        uint64_t v8 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v88;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v88 != v10) {
                objc_enumerationMutation(obj);
              }
              v12 = *(void **)(*((void *)&v87 + 1) + 8 * i);
              v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "senderID", v62));
              uint64_t v14 = [*(id *)(a1 + 40) objectForKey:v13];
              if (v14)
              {
                id v15 = (id)v14;
                v16 = [v12 layout];
                v17 = [v15 layout];
                char v18 = [v16 isEqual:v17];

                if ((v18 & 1) == 0)
                {
                  [v67 addObject:v15];
                  [v15 _replaceProperties:v12];
                }
                a1 = v71;
              }
              else
              {
                id v15 = [[BKSHIDKeyboardDevice alloc] _initWithProperties:v12];
                [v68 addObject:v15];
              }
              [v7 setObject:v15 forKey:v13];
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
          }
          while (v9);
        }

        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __42__BKSHIDKeyboardService__updateKeyboards___block_invoke;
        v84[3] = &unk_1E5440808;
        id v19 = v7;
        id v85 = v19;
        id v20 = v62;
        id v86 = v20;
        [v63 enumerateKeysAndObjectsUsingBlock:v84];
        v21 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v19;
        id v22 = v19;
        id v23 = v67;
        id v24 = v20;
        id v25 = v68;

        id v3 = v65;
      }
      else
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4F4F798]);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v28 = v3;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v91 objects:v101 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v92;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v92 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v91 + 1) + 8 * j);
              v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v33, "senderID"));
              id v35 = [[BKSHIDKeyboardDevice alloc] _initWithProperties:v33];
              [v27 setObject:v35 forKey:v34];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v91 objects:v101 count:16];
          }
          while (v30);
        }

        id v25 = [v27 allValues];
        v36 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v27;

        id v23 = 0;
        id v24 = 0;
      }
      v4 = v64;
    }
    else
    {
      if (v6)
      {
        id v24 = [*(id *)(a1 + 40) allValues];
        v26 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;

        id v23 = 0;
      }
      else
      {
        id v23 = 0;
        id v24 = 0;
      }
      id v25 = 0;
    }
    v37 = objc_msgSend(*(id *)(a1 + 16), "orderedContext", v62);
    v38 = (void *)[v37 copy];

    os_unfair_lock_unlock(v4);
    if ([v25 count])
    {
      v39 = BKLogKeyboard();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v99 = v25;
        _os_log_impl(&dword_18AA0B000, v39, OS_LOG_TYPE_DEFAULT, "connected: %{public}@", buf, 0xCu);
      }

      if ([v38 count])
      {
        v40 = -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v25);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v41 = v38;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v80 objects:v97 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v81;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v81 != v44) {
                objc_enumerationMutation(v41);
              }
              [*(id *)(*((void *)&v80 + 1) + 8 * k) keyboardDevicesDidConnect:v40];
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v80 objects:v97 count:16];
          }
          while (v43);
        }

        a1 = v71;
      }
    }
    if ([v23 count])
    {
      v46 = BKLogKeyboard();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v99 = v23;
        _os_log_impl(&dword_18AA0B000, v46, OS_LOG_TYPE_DEFAULT, "layouts did change: %{public}@", buf, 0xCu);
      }

      if ([v38 count])
      {
        id v69 = v25;
        id v66 = v3;
        v47 = -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v23);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v48 = v38;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v76 objects:v96 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v77;
          do
          {
            for (uint64_t m = 0; m != v50; ++m)
            {
              if (*(void *)v77 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v76 + 1) + 8 * m);
              if (objc_opt_respondsToSelector()) {
                [v53 keyboardDeviceLayoutsDidChange:v47];
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v76 objects:v96 count:16];
          }
          while (v50);
        }

        id v3 = v66;
        a1 = v71;
        id v25 = v69;
      }
    }
    if ([v24 count])
    {
      v54 = BKLogKeyboard();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v99 = v24;
        _os_log_impl(&dword_18AA0B000, v54, OS_LOG_TYPE_DEFAULT, "disconnected: %{public}@", buf, 0xCu);
      }

      if ([v38 count])
      {
        id v55 = v25;
        v56 = -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v24);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v57 = v38;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v72 objects:v95 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v73;
          do
          {
            for (uint64_t n = 0; n != v59; ++n)
            {
              if (*(void *)v73 != v60) {
                objc_enumerationMutation(v57);
              }
              [*(id *)(*((void *)&v72 + 1) + 8 * n) keyboardDevicesDidDisconnect:v56];
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v72 objects:v95 count:16];
          }
          while (v59);
        }

        id v25 = v55;
      }
    }
  }
}

- (void)_evaluateObservationStateAfterReconnect:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if ([*(id *)(a1 + 16) isActive]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [*(id *)(a1 + 24) isActive];
    }
    if ((v5 & a2 & 1) != 0 || *(unsigned __int8 *)(a1 + 32) != v5)
    {
      *(unsigned char *)(a1 + 32) = v5;
      uint64_t v6 = BKLogKeyboard();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v5;
        _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "currently observing: %{BOOL}u", (uint8_t *)v10, 8u);
      }

      os_unfair_lock_unlock(v4);
      id v7 = [*(id *)(a1 + 48) remoteTarget];
      uint64_t v8 = [NSNumber numberWithBool:v5];
      uint64_t v9 = [v7 setObservingUsableKeyboardConnections:v8];

      -[BKSHIDKeyboardService _updateKeyboards:](a1, v9);
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (id)allKeyboardDevices
{
  id v3 = -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, 0, @"allKeyboardDevices");
  os_unfair_lock_lock(&self->_lock);
  v4 = [(BSOrderedDictionary *)self->_lock_senderIDToDevice allValues];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:](self, v5);
  [v3 invalidate];

  return v6;
}

- (id)_proxyDevicesForConcreteDevices:(void *)a1
{
  if (a1)
  {
    var28[0] = MEMORY[0x1E4F143A8];
    var28[1] = 3221225472;
    var28[2] = __57__BKSHIDKeyboardService__proxyDevicesForConcreteDevices___block_invoke;
    var28[3] = &unk_1E5440830;
    var28[4] = a1;
    a1 = objc_msgSend(a2, "bs_map:", var28);
    uint64_t v2 = var28[6];
  }
  return a1;
}

- (id)_addObserver:(uint64_t)a3 forReason:
{
  if (a1)
  {
    a1 = [a1[2] acquireForReason:a3 withContext:a2];
    uint64_t v3 = vars8;
  }
  return a1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_147);
  }
  uint64_t v2 = (void *)sharedInstance_service;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_senderIDToDevice, 0);
  objc_storeStrong((id *)&self->_proxiesAssertion, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

- (void)setConnectedKeyboards:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  -[BKSHIDKeyboardService _updateKeyboards:]((uint64_t)self, a3);
  uint64_t v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    uint64_t v6 = v7;
  }
}

void __42__BKSHIDKeyboardService__updateKeyboards___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:a2];

  if (!v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

_BKSHIDKeyboardDeviceClientProxy *__57__BKSHIDKeyboardService__proxyDevicesForConcreteDevices___block_invoke(uint64_t a1, void *a2)
{
  return -[BKSHIDKeyboardService _proxyDeviceForConcreteDevice:](*(void *)(a1 + 32), a2);
}

- (_BKSHIDKeyboardDeviceClientProxy)_proxyDeviceForConcreteDevice:(uint64_t)a1
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    v4 = NSString;
    id v5 = a2;
    id v6 = objc_msgSend(v4, "stringWithFormat:", @"proxy:%p", v5);
    id v7 = [v3 acquireForReason:v6];

    uint64_t v2 = [[_BKSHIDKeyboardDeviceClientProxy alloc] initWithDevice:v5 lifetimeAssertion:v7];
  }
  return v2;
}

- (id)keyboardDeviceForSenderID:(unint64_t)a3
{
  if (keyboardDeviceForSenderID__onceToken != -1) {
    dispatch_once(&keyboardDeviceForSenderID__onceToken, &__block_literal_global_166);
  }
  id v5 = -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, 0, @"keyboardDeviceWithSenderID:");
  os_unfair_lock_lock(&self->_lock);
  if (a3
    && (id v6 = (void *)keyboardDeviceForSenderID__axSenders,
        [NSNumber numberWithUnsignedLongLong:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 containsObject:v7],
        v7,
        !v6))
  {
    lock_senderIDToDevice = self->_lock_senderIDToDevice;
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
    uint64_t v9 = [(BSOrderedDictionary *)lock_senderIDToDevice objectForKey:v8];
  }
  else
  {
    uint64_t v8 = [(BSOrderedDictionary *)self->_lock_senderIDToDevice allValues];
    uint64_t v9 = [v8 lastObject];
  }
  uint64_t v11 = (void *)v9;

  os_unfair_lock_unlock(&self->_lock);
  v12 = -[BKSHIDKeyboardService _proxyDeviceForConcreteDevice:]((uint64_t)self, v11);
  [v5 invalidate];

  return v12;
}

uint64_t __51__BKSHIDKeyboardService_keyboardDeviceForSenderID___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1ED76C850, &unk_1ED76C868, &unk_1ED76C880, &unk_1ED76C898, &unk_1ED76C8B0, &unk_1ED76C8C8, &unk_1ED76C8E0, &unk_1ED76C8F8, 0);
  uint64_t v1 = keyboardDeviceForSenderID__axSenders;
  keyboardDeviceForSenderID__axSenders = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)addKeyboardObserver:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"<%@: %p>", objc_opt_class(), v5];
  id v7 = -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, (uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (BKSHIDKeyboardService)init
{
  v4 = [NSString stringWithFormat:@"cannot -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDKeyboardService.m";
    __int16 v17 = 1024;
    int v18 = 169;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDKeyboardService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __39__BKSHIDKeyboardService_sharedInstance__block_invoke()
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:@"BKKeyboardService"];
  uint64_t v1 = [BKSHIDKeyboardService alloc];
  id v23 = v0;
  if (v1)
  {
    v30.receiver = v1;
    v30.super_class = (Class)BKSHIDKeyboardService;
    id v2 = objc_msgSendSuper2(&v30, sel_init);
    if (v2)
    {
      uint64_t v3 = v2;
      if (v23)
      {
        v4 = (void *)MEMORY[0x1E4F4F6E8];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke;
        v28[3] = &unk_1E5440EC8;
        id v5 = v2;
        uint64_t v29 = v5;
        uint64_t v6 = [v4 assertionWithIdentifier:@"BKSKeyboardServiceObservers" stateDidChangeHandler:v28];
        id v7 = (void *)v5[2];
        v5[2] = v6;

        uint64_t v8 = (void *)MEMORY[0x1E4F4F6E8];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_2;
        v26[3] = &unk_1E5440EC8;
        int v9 = v5;
        id v27 = v9;
        uint64_t v10 = [v8 assertionWithIdentifier:@"BKSKeyboardServiceProxies" stateDidChangeHandler:v26];
        __int16 v11 = (void *)v9[3];
        v9[3] = v10;

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_3;
        v24[3] = &unk_1E5441878;
        uint64_t v1 = v9;
        id v25 = v1;
        [v23 configureConnection:v24];
        v12 = BKLogKeyboard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          connectiouint64_t n = v1->_connection;
          *(_DWORD *)buf = 138543362;
          v32 = connection;
          _os_log_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_DEFAULT, "Activating connection to server: %{public}@", buf, 0xCu);
        }

        [v23 activate];
        uint64_t v14 = BKLogKeyboard();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [v23 remoteTarget];
          *(_DWORD *)buf = 138543362;
          v32 = v15;
          _os_log_impl(&dword_18AA0B000, v14, OS_LOG_TYPE_DEFAULT, "server remote target %{public}@", buf, 0xCu);
        }
        v16 = [v23 remoteTarget];

        if (!v16)
        {
          __int16 v19 = [NSString stringWithFormat:@"we must have a remote target"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithConnection_);
            id v20 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            id v22 = NSStringFromClass(v21);
            *(_DWORD *)buf = 138544642;
            v32 = v20;
            __int16 v33 = 2114;
            v34 = v22;
            __int16 v35 = 2048;
            v36 = v1;
            __int16 v37 = 2114;
            v38 = @"BKSHIDKeyboardService.m";
            __int16 v39 = 1024;
            int v40 = 233;
            __int16 v41 = 2114;
            uint64_t v42 = v19;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA26C20);
        }
        objc_storeStrong((id *)&v1->_connection, v0);

        uint64_t v3 = v29;
      }
      else
      {
        __int16 v17 = BKLogKeyboard();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AA0B000, v17, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
        }

        uint64_t v1 = 0;
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }

  int v18 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v1;
}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_2(uint64_t a1)
{
}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4F7B8];
  id v4 = a2;
  id v5 = [v3 protocolForProtocol:&unk_1ED7791F0];
  uint64_t v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED76DCD8];
  id v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"BKKeyboardService"];
  [v7 setServer:v5];
  [v7 setClient:v6];
  [v4 setInterface:v7];
  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v4 setServiceQuality:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_4;
  v9[3] = &unk_1E5441590;
  id v10 = *(id *)(a1 + 32);
  [v4 setInterruptionHandler:v9];
  [v4 setInvalidationHandler:&__block_literal_global];
}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = BKLogKeyboard();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_ERROR, "keyboard service reconnecting", v3, 2u);
    }

    [*(id *)(v1 + 48) activate];
    -[BKSHIDKeyboardService _evaluateObservationStateAfterReconnect:](v1, 1);
  }
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"cannot +new"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSHIDKeyboardService.m";
    __int16 v17 = 1024;
    int v18 = 164;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
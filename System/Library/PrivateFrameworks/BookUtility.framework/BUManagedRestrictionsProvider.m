@interface BUManagedRestrictionsProvider
- (BOOL)isAccountModificationAllowed;
- (BOOL)isBookStoreAllowed;
- (BOOL)isExplicitContentAllowed;
- (BUManagedRestrictionsProvider)init;
- (NSHashTable)observers;
- (id)_currentObserversCopy;
- (void)_uq_notifyObserversForAccountModificationRestrictionsChange;
- (void)_uq_notifyObserversForBookStoreRestrictionsChange;
- (void)_uq_notifyObserversForExplicitContentRestrictionsChange;
- (void)_uq_updateRestrictionsIfNeeded;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setIsAccountModificationAllowed:(BOOL)a3;
- (void)setIsBookStoreAllowed:(BOOL)a3;
- (void)setIsExplicitContentAllowed:(BOOL)a3;
- (void)setObservers:(id)a3;
@end

@implementation BUManagedRestrictionsProvider

- (BUManagedRestrictionsProvider)init
{
  v16.receiver = self;
  v16.super_class = (Class)BUManagedRestrictionsProvider;
  v2 = [(BUManagedRestrictionsProvider *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("BUManagedRestrictionsProvider.accessQueue", v5);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v6;

    uint64_t v10 = objc_msgSend_weakObjectsHashTable(MEMORY[0x263F088B0], v8, v9);
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    v12 = v3->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1E7718;
    block[3] = &unk_26449D948;
    v15 = v3;
    dispatch_async(v12, block);
  }
  return v3;
}

- (void)dealloc
{
  v4 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], a2, v2);
  objc_msgSend_unregisterObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)BUManagedRestrictionsProvider;
  [(BUManagedRestrictionsProvider *)&v6 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1E7928;
  v7[3] = &unk_26449D808;
  p_observersLock = &self->_observersLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(void *))sub_21E1E7928)(v7);
  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E1E79E4;
  v7[3] = &unk_26449D808;
  p_observersLock = &self->_observersLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(void *))sub_21E1E79E4)(v7);
  os_unfair_lock_unlock(p_observersLock);
}

- (id)_currentObserversCopy
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_21E1E7B1C;
  v15 = sub_21E1E7B2C;
  id v16 = 0;
  p_observersLock = &self->_observersLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v7 = sub_21E1E7B34;
  id v8 = &unk_26449D600;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_observersLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)_uq_notifyObserversForBookStoreRestrictionsChange
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL isBookStoreAllowed = self->_isBookStoreAllowed;
  id v6 = objc_msgSend__currentObserversCopy(self, v4, v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = sub_21E1E7D2C;
          v15[3] = &unk_26449DA80;
          v15[4] = v13;
          BOOL v16 = isBookStoreAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }
}

- (void)_uq_notifyObserversForExplicitContentRestrictionsChange
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL isExplicitContentAllowed = self->_isExplicitContentAllowed;
  id v6 = objc_msgSend__currentObserversCopy(self, v4, v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = sub_21E1E7ECC;
          v15[3] = &unk_26449DA80;
          v15[4] = v13;
          BOOL v16 = isExplicitContentAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }
}

- (void)_uq_notifyObserversForAccountModificationRestrictionsChange
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL isAccountModificationAllowed = self->_isAccountModificationAllowed;
  id v6 = objc_msgSend__currentObserversCopy(self, v4, v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = sub_21E1E806C;
          v15[3] = &unk_26449DA80;
          v15[4] = v13;
          BOOL v16 = isAccountModificationAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }
}

- (BOOL)isAccountModificationAllowed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1E8128;
  v5[3] = &unk_26449D600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBookStoreAllowed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1E81E8;
  v5[3] = &unk_26449D600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExplicitContentAllowed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1E82A8;
  v5[3] = &unk_26449D600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_uq_updateRestrictionsIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v5 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v3, v4);
  BOOL v7 = objc_msgSend_effectiveBoolValueForSetting_(v5, v6, *MEMORY[0x263F537C8]) != 2;

  uint64_t v10 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v8, v9);
  BOOL v12 = objc_msgSend_effectiveBoolValueForSetting_(v10, v11, *MEMORY[0x263F537D0]) != 2;

  v15 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v13, v14);
  BOOL v17 = objc_msgSend_effectiveBoolValueForSetting_(v15, v16, *MEMORY[0x263F53710]) != 2;

  if (self->_isBookStoreAllowed != v7)
  {
    self->_BOOL isBookStoreAllowed = v7;
    objc_msgSend__uq_notifyObserversForBookStoreRestrictionsChange(self, v18, v19);
  }
  if (self->_isExplicitContentAllowed != v12)
  {
    self->_BOOL isExplicitContentAllowed = v12;
    objc_msgSend__uq_notifyObserversForExplicitContentRestrictionsChange(self, v18, v19);
  }
  if (self->_isAccountModificationAllowed != v17)
  {
    self->_BOOL isAccountModificationAllowed = v17;
    MEMORY[0x270F9A6D0](self, sel__uq_notifyObserversForAccountModificationRestrictionsChange, v19);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1E8458;
  block[3] = &unk_26449D948;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)setIsBookStoreAllowed:(BOOL)a3
{
  self->_BOOL isBookStoreAllowed = a3;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  self->_BOOL isExplicitContentAllowed = a3;
}

- (void)setIsAccountModificationAllowed:(BOOL)a3
{
  self->_BOOL isAccountModificationAllowed = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
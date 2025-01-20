@interface BKHIDClientConnectionManager
- (BKHIDClientConnectionManager)initWithHIDEventSystem:(__IOHIDEventSystem *)a3;
- (__IOHIDEventSystemConnection)copyClientForDestination:(id)a3;
- (__IOHIDEventSystemConnection)copyClientForTaskPort:(unsigned int)a3;
- (id)addRemovalObserverForConnectionWithVersionedPID:(int64_t)a3 observerBlock:(id)a4;
- (id)bundleIDForPID:(int)a3;
- (id)clientForDestination:(id)a3;
- (id)clientForTaskPort:(unsigned int)a3;
- (id)description;
- (int)pidForBundleID:(id)a3;
- (int64_t)versionedPIDForPID:(int)a3;
- (void)dealloc;
@end

@implementation BKHIDClientConnectionManager

- (__IOHIDEventSystemConnection)copyClientForDestination:(id)a3
{
  v3 = [(BKHIDClientConnectionManager *)self clientForDestination:a3];
  v4 = (__IOHIDEventSystemConnection *)[v3 connection];

  if (v4) {
    CFRetain(v4);
  }
  return v4;
}

- (__IOHIDEventSystemConnection)copyClientForTaskPort:(unsigned int)a3
{
  v3 = [(BKHIDClientConnectionManager *)self clientForTaskPort:*(void *)&a3];
  v4 = (__IOHIDEventSystemConnection *)[v3 connection];

  if (v4) {
    CFRetain(v4);
  }
  return v4;
}

- (id)clientForTaskPort:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v6 = [(BSMutableIntegerMap *)self->_taskPortToClientConnectionMapping objectForKey:a3];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)clientForDestination:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [v4 versionedPID];
  if (v6 == -1)
  {
    v9 = -[BSMutableIntegerMap objectForKey:](self->_pidToClientConnectionMapping, "objectForKey:", (int)[v4 pid]);
  }
  else
  {
    versionedPIDToClientConnectionMapping = self->_versionedPIDToClientConnectionMapping;
    v8 = [NSNumber numberWithLongLong:v6];
    v9 = [(NSMutableDictionary *)versionedPIDToClientConnectionMapping objectForKey:v8];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionedPIDToClientConnectionMapping, 0);
  objc_storeStrong((id *)&self->_pidToClientConnectionMapping, 0);

  objc_storeStrong((id *)&self->_taskPortToClientConnectionMapping, 0);
}

- (id)addRemovalObserverForConnectionWithVersionedPID:(int64_t)a3 observerBlock:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  versionedPIDToClientConnectionMapping = self->_versionedPIDToClientConnectionMapping;
  v9 = [NSNumber numberWithLongLong:a3];
  v10 = [(NSMutableDictionary *)versionedPIDToClientConnectionMapping objectForKey:v9];

  v11 = [v10 addDisconnectionObserverBlock:v7];

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (int64_t)versionedPIDForPID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(BSMutableIntegerMap *)self->_pidToClientConnectionMapping objectForKey:a3];
  int64_t v7 = [v6 versionedPID];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)bundleIDForPID:(int)a3
{
  if (a3 < 1)
  {
    int64_t v7 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(p_lock);
    uint64_t v6 = [(BSMutableIntegerMap *)self->_pidToClientConnectionMapping objectForKey:a3];
    int64_t v7 = [v6 bundleID];
    os_unfair_lock_unlock(p_lock);
  }

  return v7;
}

- (int)pidForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -1;
  if ([v4 length])
  {
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    pidToClientConnectionMapping = self->_pidToClientConnectionMapping;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__BKHIDClientConnectionManager_pidForBundleID___block_invoke;
    v9[3] = &unk_1E68710D8;
    id v10 = v4;
    v11 = &v12;
    [(BSMutableIntegerMap *)pidToClientConnectionMapping enumerateWithBlock:v9];
    os_unfair_lock_unlock(p_lock);
  }
  int v7 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__BKHIDClientConnectionManager_pidForBundleID___block_invoke(uint64_t a1, int a2, void *a3, unsigned char *a4)
{
  int v7 = *(void **)(a1 + 32);
  v8 = [a3 bundleID];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_taskPortToClientConnectionMapping withName:@"TaskPort->ClientConnection"];
  id v5 = (id)[v3 appendObject:self->_pidToClientConnectionMapping withName:@"pid->ClientConnection"];
  id v6 = (id)[v3 appendObject:self->_versionedPIDToClientConnectionMapping withName:@"vpid->ClientConnection"];
  id v7 = (id)[v3 appendPointer:self->_hidConnectionToBKConnection withName:@"HIDConnection->BKConnection"];
  v8 = [v3 build];

  return v8;
}

- (void)dealloc
{
  IOHIDEventSystemUnregisterConnectionAdditionCallback();
  IOHIDEventSystemUnregisterConnectionRemovalCallback();
  hidEventSystem = self->_hidEventSystem;
  if (hidEventSystem)
  {
    CFRelease(hidEventSystem);
    self->_hidEventSystem = 0;
  }
  hidConnectionToBKConnection = self->_hidConnectionToBKConnection;
  if (hidConnectionToBKConnection) {
    CFRelease(hidConnectionToBKConnection);
  }
  v5.receiver = self;
  v5.super_class = (Class)BKHIDClientConnectionManager;
  [(BKHIDClientConnectionManager *)&v5 dealloc];
}

- (BKHIDClientConnectionManager)initWithHIDEventSystem:(__IOHIDEventSystem *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)BKHIDClientConnectionManager;
  id v4 = [(BKHIDClientConnectionManager *)&v20 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    if (a3)
    {
      v4->_hidEventSystem = a3;
      CFRetain(a3);
    }
    id v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    taskPortToClientConnectionMapping = v5->_taskPortToClientConnectionMapping;
    v5->_taskPortToClientConnectionMapping = v6;

    v8 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    pidToClientConnectionMapping = v5->_pidToClientConnectionMapping;
    v5->_pidToClientConnectionMapping = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    versionedPIDToClientConnectionMapping = v5->_versionedPIDToClientConnectionMapping;
    v5->_versionedPIDToClientConnectionMapping = v10;

    v5->_hidConnectionToBKConnection = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v5->_hidEventSystem)
    {
      IOHIDEventSystemRegisterConnectionAdditionCallback();
      IOHIDEventSystemRegisterConnectionRemovalCallback();
      CFArrayRef v12 = (const __CFArray *)IOHIDEventSystemCopyConnections();
      if (v12)
      {
        CFArrayRef v13 = v12;
        CFIndex Count = CFArrayGetCount(v12);
        if (Count >= 1)
        {
          CFIndex v15 = Count;
          for (CFIndex i = 0; i != v15; ++i)
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(v13, i);
            BKHIDClientConnectionAdditionCallback((uint64_t)v5, v18, ValueAtIndex);
          }
        }
        CFRelease(v13);
      }
    }
  }
  return v5;
}

@end
@interface CFPDObserverOnlyTombstone
+ (BOOL)replaceObserved:(uint64_t)a3 withObserved:(_xpc_connection_s *)a4 forConnection:;
- (BOOL)isEqual:(id)a3;
- (BOOL)managed;
- (id)description;
- (id)initMatchingSource:(id)a3;
- (unint64_t)hash;
- (void)_operateOnObservingConnectionsAsMultiple:(uint64_t)a3 asSingle:;
- (void)_sendNotificationToConnection:(uint64_t)a1;
- (void)alreadyLocked_transferObservingConnectionsFromSource:(id)a3;
- (void)dealloc;
- (void)notifyObservers;
- (void)removeObservingConnection:(id)a3 daemon:(id)a4;
- (void)transferObservingConnectionsToSource:(id)a3;
@end

@implementation CFPDObserverOnlyTombstone

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self == a3) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_shmemIndex != *((unsigned __int16 *)a3 + 18))
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  domain = self->_domain;
  v6 = (__CFString *)*((void *)a3 + 1);
  if (domain == v6 || (LOBYTE(v7) = 0, domain) && v6 && (int v7 = CFEqual(self->_domain, v6)) != 0)
  {
    userOrContainer = self->_userOrContainer;
    v9 = (__CFString *)*((void *)a3 + 2);
    if (userOrContainer != v9)
    {
      LOBYTE(v7) = 0;
      if (userOrContainer && v9) {
        LOBYTE(v7) = CFEqual(self->_userOrContainer, v9) != 0;
      }
      return v7;
    }
LABEL_15:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)hash
{
  domain = self->_domain;
  if (domain) {
    CFHashCode v4 = CFHash(domain);
  }
  else {
    CFHashCode v4 = 0;
  }
  CFHashCode userOrContainer = (CFHashCode)self->_userOrContainer;
  if (userOrContainer) {
    CFHashCode userOrContainer = CFHash((CFTypeRef)userOrContainer);
  }
  return userOrContainer ^ v4 ^ self->_shmemIndex;
}

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke(uint64_t *a1, void *a2)
{
  if (+[CFPDObserverOnlyTombstone replaceObserved:withObserved:forConnection:]((uint64_t)CFPDObserverOnlyTombstone, a1[4], a1[5], (_xpc_connection_s *)a2))
  {
    CFHashCode v4 = *(__CFSet **)(*(void *)(a1[7] + 8) + 24);
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      if (v4) {
        __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1();
      }
      *(void *)(*(void *)(a1[7] + 8) + 24) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
      CFSetAddValue(*(CFMutableSetRef *)(*(void *)(a1[7] + 8) + 24), *(const void **)(*(void *)(a1[6] + 8) + 40));
      xpc_release(*(xpc_object_t *)(*(void *)(a1[6] + 8) + 40));
      *(void *)(*(void *)(a1[6] + 8) + 40) = 0;
      CFHashCode v4 = *(__CFSet **)(*(void *)(a1[7] + 8) + 24);
    }
    else if (!v4)
    {
      *(void *)(*(void *)(a1[6] + 8) + 40) = xpc_retain(a2);
      return;
    }
    CFSetAddValue(v4, a2);
  }
}

+ (BOOL)replaceObserved:(uint64_t)a3 withObserved:(_xpc_connection_s *)a4 forConnection:
{
  v8[6] = *(void *)off_1ECE0A5B0;
  self;
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v8[3] = &unk_1ECE002F8;
  v8[4] = a2;
  v8[5] = a3;
  return withClientContext(a4, (uint64_t)v8);
}

void __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(__CFSet **)(a2 + 24);
  if (v3)
  {
    v5 = *(const void **)(a1 + 32);
    if (v5 != *(const void **)(a1 + 40))
    {
      CFSetRemoveValue(v3, v5);
      v6 = *(__CFSet **)(a2 + 24);
      int v7 = *(const void **)(a1 + 40);
      CFSetAddValue(v6, v7);
    }
  }
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke(uint64_t a1, void *a2)
{
  if (+[CFPDObserverOnlyTombstone replaceObserved:withObserved:forConnection:]((uint64_t)CFPDObserverOnlyTombstone, *(void *)(a1 + 32), *(void *)(a1 + 40), (_xpc_connection_s *)a2))
  {
    CFHashCode v4 = *(__CFSet **)(*(void *)(a1 + 40) + 72);
    if (!v4)
    {
      *(void *)(*(void *)(a1 + 40) + 72) = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
      CFHashCode v4 = *(__CFSet **)(*(void *)(a1 + 40) + 72);
    }
    CFSetAddValue(v4, a2);
  }
}

xpc_object_t __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke(uint64_t a1, xpc_object_t object, unsigned char *a3)
{
  xpc_object_t result = xpc_retain(object);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

- (id)initMatchingSource:(id)a3
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  v8.receiver = self;
  v8.super_class = (Class)CFPDObserverOnlyTombstone;
  CFHashCode v4 = [(CFPDObserverOnlyTombstone *)&v8 init];
  if (v4)
  {
    v5 = (const void *)[a3 domain];
    if (v5) {
      v4->_domain = (__CFString *)CFRetain(v5);
    }
    v6 = (const void *)[a3 container];
    if (v6 || (v6 = (const void *)[a3 user]) != 0) {
      v4->_CFHashCode userOrContainer = (__CFString *)CFRetain(v6);
    }
    v4->_shmemIndex = [a3 shmemIndex];
    v4->_lock._os_unfair_lock_opaque = 0;
    *((unsigned char *)v4 + 38) = *((unsigned char *)v4 + 38) & 0xFE | [a3 managed];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  domain = self->_domain;
  if (domain) {
    CFRelease(domain);
  }
  CFHashCode userOrContainer = self->_userOrContainer;
  if (userOrContainer) {
    CFRelease(userOrContainer);
  }
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]((uint64_t)self, (uint64_t)&__block_literal_global_285, (uint64_t)&__block_literal_global_288);
  v5.receiver = self;
  v5.super_class = (Class)CFPDObserverOnlyTombstone;
  [(CFPDObserverOnlyTombstone *)&v5 dealloc];
}

- (void)_operateOnObservingConnectionsAsMultiple:(uint64_t)a3 asSingle:
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    uint64_t v9 = *(const void **)(a1 + 24);
    objc_super v8 = (CFSetRef *)(a1 + 24);
    int v7 = v9;
    if (v9)
    {
      CFTypeID v10 = CFGetTypeID(v7);
      if (v10 == CFSetGetTypeID())
      {
        (*(void (**)(uint64_t, CFSetRef))(a2 + 16))(a2, *v8);
        CFIndex Count = CFSetGetCount(*v8);
        if (Count)
        {
          if (Count == 1)
          {
            uint64_t v14 = 0;
            v15 = &v14;
            uint64_t v16 = 0x3052000000;
            v17 = __Block_byref_object_copy__4;
            v18 = __Block_byref_object_dispose__4;
            uint64_t v19 = 0;
            CFSetRef v12 = *v8;
            v13[0] = off_1ECE0A5A0;
            v13[1] = 3221225472;
            v13[2] = __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke;
            v13[3] = &unk_1ECDAB878;
            v13[4] = &v14;
            CFSetApply(v12, (uint64_t)v13);
            CFRelease(*v8);
            *objc_super v8 = (CFSetRef)v15[5];
            _Block_object_dispose(&v14, 8);
          }
        }
        else
        {
          CFRelease(*v8);
          *objc_super v8 = 0;
        }
      }
      else if (*v8)
      {
        (*(void (**)(uint64_t, CFSetRef *))(a3 + 16))(a3, v8);
      }
    }
    os_unfair_lock_unlock(v6);
  }
}

- (void)transferObservingConnectionsToSource:(id)a3
{
  v8[6] = *(void *)off_1ECE0A5B0;
  objc_super v5 = (os_unfair_lock_s *)((char *)a3 + 108);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 27);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 25);
  if (*((void *)a3 + 9)) {
    -[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:]();
  }
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke;
  v8[3] = &unk_1ECE00280;
  v8[4] = self;
  v8[5] = a3;
  v6[4] = v8;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2;
  v7[3] = &unk_1ECE002A8;
  v7[4] = v8;
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3;
  v6[3] = &unk_1ECE002D0;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]((uint64_t)self, (uint64_t)v7, (uint64_t)v6);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 25);
  os_unfair_lock_unlock(v5);
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2(uint64_t a1, void *a2)
{
  CFSetApply(a2, *(void *)(a1 + 32));

  CFSetRemoveAllValues((CFMutableSetRef)a2);
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3(uint64_t a1, xpc_object_t *a2)
{
  *a2 = 0;
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2(uint64_t a1, CFMutableSetRef theSet)
{
}

- (void)alreadyLocked_transferObservingConnectionsFromSource:(id)a3
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)a3 + 25);
  objc_super v5 = (void *)*((void *)a3 + 9);
  if (v5)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__4;
    uint64_t v16 = __Block_byref_object_dispose__4;
    uint64_t v17 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke;
    v7[3] = &unk_1ECE001A0;
    v7[4] = a3;
    void v7[5] = self;
    v7[6] = &v12;
    v7[7] = &v8;
    CFSetApply(v5, (uint64_t)v7);
    uint64_t v6 = (OS_xpc_object *)v13[5];
    if (!v6) {
      uint64_t v6 = (OS_xpc_object *)v9[3];
    }
    self->_observers._single = v6;
    CFRelease(v5);
    *((void *)a3 + 9) = 0;
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)removeObservingConnection:(id)a3 daemon:(id)a4
{
  v5[6] = *(void *)off_1ECE0A5B0;
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke;
  v5[3] = &unk_1ECE00258;
  v5[4] = self;
  v5[5] = a3;
  os_unfair_lock_lock((os_unfair_lock_t)a4 + 12);
  ((void (*)(void *, void, void))__62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke)(v5, *((void *)a4 + 4), *((void *)a4 + 5));
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 12);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke(uint64_t a1, __CFSet *a2)
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2;
  v7[3] = &unk_1ECE00208;
  uint64_t v8 = *(void *)(a1 + 40);
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3;
  v6[3] = &unk_1ECE00230;
  v6[4] = v8;
  void v6[5] = &v9;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:](v4, (uint64_t)v7, (uint64_t)v6);
  if (*((unsigned char *)v10 + 24))
  {
    id v5 = *(id *)(a1 + 32);
    CFSetRemoveValue(a2, *(const void **)(a1 + 32));
  }
  _Block_object_dispose(&v9, 8);
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke(int a1, CFTypeRef cf)
{
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke_2(uint64_t a1, xpc_object_t *a2)
{
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3(uint64_t a1, xpc_object_t *a2)
{
  if (*a2 == *(xpc_object_t *)(a1 + 32))
  {
    xpc_release(*a2);
    *a2 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:](&off_1ECF63898, "stringWithFormat:", @"Tombstone for CFPDSource (domain: %@, "), self->_domain;
  if (CFStringHasPrefix(self->_userOrContainer, @"/")) {
    uint64_t v4 = @"container: %@, ";
  }
  else {
    uint64_t v4 = @"user: %@, ";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", v4, self->_userOrContainer);
  [(NSMutableString *)v3 appendFormat:@"shmemIndex: %d"], self->_shmemIndex);
  return v3;
}

- (BOOL)managed
{
  return *((unsigned char *)self + 38) & 1;
}

- (void)_sendNotificationToConnection:(uint64_t)a1
{
  location[1] = *(id *)off_1ECE0A5B0;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    char v4 = *(unsigned char *)(a1 + 38);
    if ((v4 & 2) != 0)
    {
      *(unsigned char *)(a1 + 38) = v4 | 4;
    }
    else
    {
      *(unsigned char *)(a1 + 38) = v4 & 0xF9 | 2;
      objc_initWeak(location, (id)a1);
      keys = "CFPreferencesDomain";
      xpc_object_t values = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 8));
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
      handler[0] = off_1ECE0A5A0;
      handler[1] = 3221225472;
      handler[2] = __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke;
      handler[3] = &unk_1ECE00320;
      objc_copyWeak(&v7, location);
      handler[4] = a1;
      handler[5] = a2;
      xpc_connection_send_message_with_reply(a2, v5, 0, handler);
      xpc_release(values);
      xpc_release(v5);
      objc_destroyWeak(&v7);
      objc_destroyWeak(location);
    }
  }
}

void __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    v3 = WeakRetained + 8;
    os_unfair_lock_lock(WeakRetained + 8);
    *(unsigned char *)(*(void *)(a1 + 32) + 38) &= ~2u;
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 38) & 4) != 0) {
      -[CFPDObserverOnlyTombstone _sendNotificationToConnection:]();
    }
    os_unfair_lock_unlock(v3);
  }
}

- (void)notifyObservers
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(unsigned char *)(a1 + 38) & 1;
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_debug_impl(&dword_182B90000, a2, OS_LOG_TYPE_DEBUG, "Notifying observers of { %{public}@, managed: %d }", (uint8_t *)&v4, 0x12u);
}

void __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_2(uint64_t a1, void *a2)
{
  v3[5] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3;
  v3[3] = &unk_1ECE00370;
  v3[4] = *(void *)(a1 + 32);
  return CFSetApply(a2, (uint64_t)v3);
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1()
{
}

- (void)transferObservingConnectionsToSource:.cold.1()
{
  __assert_rtn("-[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:]", "CFPDSource.m", 3180, "source->_observingConnections == NULL");
}

@end
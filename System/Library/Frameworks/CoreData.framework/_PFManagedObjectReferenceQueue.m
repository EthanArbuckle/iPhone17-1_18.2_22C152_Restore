@interface _PFManagedObjectReferenceQueue
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFManagedObjectReferenceQueue)retain;
- (uint64_t)_queueForDealloc:(uint64_t)a1;
- (unint64_t)retainCount;
- (void)_processReferenceQueue:(uint64_t)a1;
- (void)_unregisterRunloopObservers;
- (void)dealloc;
- (void)release;
@end

@implementation _PFManagedObjectReferenceQueue

- (void)_processReferenceQueue:(uint64_t)a1
{
  int v38 = a2;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (v38)
    {
      int v3 = 9999;
LABEL_6:
      int v37 = v3;
      v34 = (os_unfair_lock_s *)(a1 + 12);
      while (1)
      {
        v5 = v34;
        os_unfair_lock_lock_with_options();
        CFArrayRef v6 = *(const __CFArray **)(a1 + 32);
        *(void *)(a1 + 32) = 0;
        os_unfair_lock_unlock(v5);
        if (!v6) {
          return;
        }
        CFArrayRef v40 = v6;
        uint64_t Count = CFArrayGetCount(v6);
        if (!Count)
        {
          CFRelease(v40);
          return;
        }
        uint64_t v7 = *(void *)(a1 + 24);
        if ((v38 & 1) == 0 && v7)
        {
          if (!*(_DWORD *)(v7 + 16))
          {
            int v31 = [*(id *)(a1 + 24) _isDeallocating];
            if ((v31 & 1) == 0) {
              id v32 = (id)v7;
            }
            id v33 = objc_alloc(MEMORY[0x1E4F1CA48]);
            v8 = (void *)[v33 initWithCapacity:Count];
            char v9 = 0;
            int v36 = v31 ^ 1;
            goto LABEL_16;
          }
          uint64_t v7 = 0;
        }
        int v36 = 0;
        v8 = 0;
        if (v7) {
          char v9 = v38;
        }
        else {
          char v9 = 1;
        }
LABEL_16:
        id v44 = v8;
        v35 = &v34;
        MEMORY[0x1F4188790]();
        v12 = (char *)&v34 - v10;
        if (v11 > 0x200) {
          v12 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v34 - v10, 8 * v11);
        }
        v51.location = 0;
        v51.length = Count;
        v42 = v12;
        CFArrayGetValues(v40, v51, (const void **)v12);
        v39 = (void *)MEMORY[0x18C127630]();
        *(_DWORD *)(a1 + 48) = 1;
        if (Count >= 1)
        {
          for (uint64_t i = 0; i < Count; ++i)
          {
            uint64_t v14 = v42[i];
            if (v14 == 1)
            {
              uint64_t v41 = i + 1;
              v18 = (void *)v42[i + 1];
              long long v47 = 0u;
              long long v48 = 0u;
              long long v46 = 0u;
              long long v45 = 0u;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v46;
                do
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v46 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    int v22 = 0;
                    uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * j);
                    atomic_compare_exchange_strong((atomic_uint *volatile)(v23 + 8), (unsigned int *)&v22, 1u);
                    if (v22)
                    {
                      if (!*(void *)(v23 + 56))
                      {
                        atomic_fetch_add((atomic_uint *volatile)(a1 + 8), 1u);
                        *(void *)(v23 + 56) = a1;
                      }
                    }
                    else
                    {
                      if ((v9 & 1) == 0)
                      {
                        v24 = (void *)[(id)v23 objectID];
                        if (v23)
                        {
                          if ((*(unsigned char *)(v23 + 17) & 2) != 0)
                          {
                            v25 = v24;
                            if (([v24 isTemporaryID] & 1) == 0) {
                              [v44 addObject:v25];
                            }
                          }
                        }
                        objc_msgSend((id)v7, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v23, 0, 1, v34, v35);
                      }
                      if (*MEMORY[0x1E4F1CBC0]) {
                        NSRecordAllocationEvent();
                      }
                      objc_msgSend((id)v23, "dealloc", v34);
                    }
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
                }
                while (v19);
              }
              if (v18) {
                CFRelease(v18);
              }
              uint64_t i = v41;
            }
            else
            {
              int v15 = 0;
              atomic_compare_exchange_strong((atomic_uint *volatile)(v14 + 8), (unsigned int *)&v15, 1u);
              if (v15)
              {
                if (!*(void *)(v14 + 56))
                {
                  atomic_fetch_add((atomic_uint *volatile)(a1 + 8), 1u);
                  *(void *)(v14 + 56) = a1;
                }
              }
              else
              {
                v16 = (void *)[(id)v14 objectID];
                if ((v9 & 1) == 0)
                {
                  if (v14)
                  {
                    if ((*(unsigned char *)(v14 + 17) & 2) != 0)
                    {
                      v17 = v16;
                      if (([v16 isTemporaryID] & 1) == 0) {
                        [v44 addObject:v17];
                      }
                    }
                  }
                  objc_msgSend((id)v7, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v14, 0, 1, v34);
                }
                if (*MEMORY[0x1E4F1CBC0]) {
                  NSRecordAllocationEvent();
                }
                objc_msgSend((id)v14, "dealloc", v34);
              }
            }
          }
        }
        if ((v9 & 1) != 0 || ![v44 count])
        {
          int v27 = 0;
        }
        else
        {
          -[NSManagedObjectContext lockObjectStore](v7);
          v26 = *(void **)(v7 + 32);
          int v27 = 1;
          uint64_t v28 = [(id)v7 _queryGenerationToken];
          [v26 managedObjectContextDidUnregisterObjectsWithIDs:v44 generation:v28];
        }
        if (v44) {

        }
        if (v27) {
          -[NSManagedObjectContext unlockObjectStore](v7);
        }
        if ((unint64_t)Count >= 0x201) {
          NSZoneFree(0, v42);
        }
        if (v36) {

        }
        if (v39) {
        *(_DWORD *)(a1 + 48) = 0;
        }
        __dmb(0xBu);
        id v29 = 0;
        CFRelease(v40);
        if (v37-- <= 0) {
          return;
        }
      }
    }
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(void *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    if (v4)
    {
      int v3 = 9;
      goto LABEL_6;
    }
  }
}

- (uint64_t)_queueForDealloc:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock_with_options();
  uint64_t v6 = *(void *)(a1 + 24);
  Mutable = *(__CFArray **)(a1 + 32);
  if (v6)
  {
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
      *(void *)(a1 + 32) = Mutable;
    }
    CFArrayAppendValue(Mutable, a2);
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = Mutable != 0;
  }
  if (*(void *)(a1 + 40) && !*(_DWORD *)(a1 + 20) && *(void *)(a1 + 24)) {
    *(_DWORD *)(a1 + 20) = 1;
  }
  os_unfair_lock_unlock(v4);
  if (v6) {
    return 0;
  }
  if (*MEMORY[0x1E4F1CBC0]) {
    NSRecordAllocationEvent();
  }
  int v9 = 0;
  atomic_compare_exchange_strong(a2 + 2, (unsigned int *)&v9, 1u);
  if (!v9) {
    [(atomic_uint *)a2 dealloc];
  }
  uint64_t v8 = 1;
  if (v7) {
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](a1, 1);
  }
  return v8;
}

- (_PFManagedObjectReferenceQueue)retain
{
  return self;
}

- (void)release
{
  if (self)
  {
    if ((int)atomic_fetch_add(&self->_cd_rc, 0xFFFFFFFF) <= 0)
    {
      self->_cd_rc += 0x20000000;
      [(_PFManagedObjectReferenceQueue *)self dealloc];
    }
  }
}

- (void)_unregisterRunloopObservers
{
  if (a1)
  {
    *(_DWORD *)(a1 + 20) = -1;
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock_with_options();
    int v3 = *(__CFRunLoopObserver **)(a1 + 40);
    *(void *)(a1 + 40) = 0;
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopObserverInvalidate(v3);
      CFRunLoopRemoveObserver(Main, v3, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __61___PFManagedObjectReferenceQueue__unregisterRunloopObservers__block_invoke;
      v5[3] = &unk_1E544C720;
      v5[4] = a1;
      v5[5] = v3;
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
  }
}

- (void)dealloc
{
  if (!self->_context)
  {
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)self, 1);
    v3.receiver = self;
    v3.super_class = (Class)_PFManagedObjectReferenceQueue;
    [(_PFManagedObjectReferenceQueue *)&v3 dealloc];
  }
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

@end
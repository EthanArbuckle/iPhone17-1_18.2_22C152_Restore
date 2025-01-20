@interface NSObject(LockingAdditions)
+ (uint64_t)mf_clearLocks;
- (BOOL)_mf_ntsIsLocked;
- (uint64_t)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions;
- (uint64_t)_mf_checkToAllowLock:()LockingAdditions;
- (uint64_t)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions;
- (uint64_t)_mf_ntsCheckToAllowLock:()LockingAdditions;
- (uint64_t)mf_exclusiveLocks;
- (uint64_t)mf_lock;
- (uint64_t)mf_lockOrdering;
- (uint64_t)mf_lockWithPriority;
- (uint64_t)mf_strictLockOrdering;
- (uint64_t)mf_tryLock;
- (uint64_t)mf_tryLockWithPriority;
- (uint64_t)mf_unlock;
- (unint64_t)_mf_checkToAllowOrderingWithLock:()LockingAdditions;
- (void)_mf_dumpLockCallStacks:()LockingAdditions ordering:;
- (void)_mf_lockOrderingForType:()LockingAdditions;
@end

@implementation NSObject(LockingAdditions)

+ (uint64_t)mf_clearLocks
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&sMutex);
  if (sFirstLock)
  {
    pthread_t v0 = pthread_self();
    uint64_t v1 = sFirstLock;
    if (sFirstLock)
    {
      pthread_t v2 = v0;
      do
      {
        if (*(pthread_t *)(v1 + 16) == v2)
        {
          v3 = MFLogGeneral();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            int v4 = *(_WORD *)(v1 + 72) & 0x7FFF;
            uint64_t v5 = *(void *)(v1 + 8);
            uint64_t v6 = *(void *)(v1 + 16);
            *(_DWORD *)buf = 134218496;
            uint64_t v38 = v5;
            __int16 v39 = 1024;
            int v40 = v4;
            __int16 v41 = 2048;
            uint64_t v42 = v6;
            _os_log_impl(&dword_1AFB03000, v3, OS_LOG_TYPE_INFO, "object %p still holds lock (count=%u) in thread %p", buf, 0x1Cu);
          }
          v7 = *(void **)(v1 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
            objc_setAssociatedObject(v7, @"MFLock Call Stack Symbols", 0, (void *)0x301);
            [v8 drain];
          }
          int v9 = *(__int16 *)(v1 + 72);
          if (v9 < 0)
          {
            *(_WORD *)(v1 + 72) = v9 & 0x8000;
            *(void *)(v1 + 16) = 0;
            CFArrayRef v12 = *(const __CFArray **)(v1 + 80);
            if (!v12 || !CFArrayGetCount(v12)) {
              goto LABEL_18;
            }
            pthread_cond_broadcast((pthread_cond_t *)(v1 + 24));
          }
          else
          {
            __int16 v10 = *(_WORD *)(v1 + 80);
            if (*(_WORD *)(v1 + 72))
            {
              do
              {
                __int16 v11 = v9 - 1;
                LOWORD(v9) = v9 & 0x8000 | (v9 - 1) & 0x7FFF;
                --v10;
              }
              while ((v11 & 0x7FFF) != 0);
              *(_WORD *)(v1 + 72) = v9;
              *(_WORD *)(v1 + 80) = v10;
            }
            *(void *)(v1 + 16) = 0;
            if (!v10)
            {
LABEL_18:
              _MFRecycleObjectLock(v1);
              goto LABEL_19;
            }
            pthread_cond_signal((pthread_cond_t *)(v1 + 24));
          }
        }
LABEL_19:
        uint64_t v1 = *(void *)v1;
      }
      while (v1);
    }
  }
  pthread_mutex_unlock(&sMutex);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  pthread_mutex_lock(&__threadLockRelationsLock);
  v14 = &OBJC_METACLASS___MFMimePart;
  CFDictionaryRef v15 = (const __CFDictionary *)__threadLockRelations;
  pthread_t v16 = pthread_self();
  Value = (void *)CFDictionaryGetValue(v15, v16);
  id v18 = (id)[Value copy];
  pthread_mutex_unlock(&__threadLockRelationsLock);
  if (Value)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:buf count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v24 = [v18 countForObject:v23];
          if (v24)
          {
            uint64_t v25 = v24;
            do
            {
              v26 = MFLogGeneral();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v35 = 138412290;
                v36 = v23;
                _os_log_impl(&dword_1AFB03000, v26, OS_LOG_TYPE_DEFAULT, "#Warning Unlocking blown lock %@", v35, 0xCu);
              }
              --v25;
              [v23 unlock];
            }
            while (v25);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:buf count:16];
      }
      while (v20);
    }
    if ([Value count])
    {
      v27 = MFLogGeneral();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v35 = 138412290;
        v36 = Value;
        _os_log_impl(&dword_1AFB03000, v27, OS_LOG_TYPE_DEFAULT, "#Warning ERROR: We released all locks tracked, but we still have %@", v35, 0xCu);
      }
    }
    [Value removeAllObjects];
    pthread_mutex_lock(&__threadLockRelationsLock);
    v14 = &OBJC_METACLASS___MFMimePart;
    if (CFArrayGetCount((CFArrayRef)__threadLockEmptySets) <= 19) {
      CFArrayAppendValue((CFMutableArrayRef)__threadLockEmptySets, Value);
    }
  }
  else
  {
    pthread_mutex_lock(&__threadLockRelationsLock);
  }
  isa = (__CFDictionary *)v14[39].isa;
  pthread_t v29 = pthread_self();
  CFDictionaryRemoveValue(isa, v29);
  pthread_mutex_unlock(&__threadLockRelationsLock);
  return [v13 drain];
}

- (uint64_t)_mf_checkToAllowLock:()LockingAdditions
{
  pthread_mutex_lock(&sMutex);
  objc_msgSend(a1, "_mf_ntsCheckToAllowLock:", a3);
  return pthread_mutex_unlock(&sMutex);
}

- (uint64_t)mf_lock
{
  pthread_mutex_lock(&sMutex);
  objc_msgSend(a1, "_mf_ntsCheckToAllowLock:", a1);
  pthread_t v2 = _MFFindObjectLock((uint64_t)a1, 1);
  return _MFAcquireObjectLock((uint64_t)v2);
}

- (uint64_t)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == a1) {
    int v4 = @"com.apple.Message.MFLockOrderingSelfReference";
  }
  else {
    int v4 = a3;
  }
  uint64_t v5 = (void *)[(__CFString *)a1 _mf_lockOrderingForType:3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(__CFString **)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 != v4)
        {
          if (v10 == @"com.apple.Message.MFLockOrderingSelfReference") {
            __int16 v11 = a1;
          }
          else {
            __int16 v11 = *(__CFString **)(*((void *)&v12 + 1) + 8 * v9);
          }
          if ([(__CFString *)v11 conformsToProtocol:&unk_1F08515D8])
          {
            if ([(__CFString *)v11 isLockedByMe]) {
              -[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:](v5, a1);
            }
          }
          else if ([(__CFString *)v11 _mf_ntsIsLocked])
          {
            -[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:](v5, a1);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_mf_lockOrderingForType:()LockingAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 3:
      uint64_t v4 = objc_msgSend(a1, "mf_exclusiveLocks");
      goto LABEL_7;
    case 2:
      uint64_t v4 = objc_msgSend(a1, "mf_strictLockOrdering");
      goto LABEL_7;
    case 1:
      uint64_t v4 = objc_msgSend(a1, "mf_lockOrdering");
LABEL_7:
      uint64_t v5 = (void *)v4;
      goto LABEL_9;
  }
  uint64_t v5 = 0;
LABEL_9:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void **)(*((void *)&v11 + 1) + 8 * v9) == a1) {
          -[NSObject(LockingAdditions) _mf_lockOrderingForType:]();
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

- (uint64_t)mf_strictLockOrdering
{
  return 0;
}

- (uint64_t)mf_exclusiveLocks
{
  return 0;
}

- (uint64_t)_mf_ntsCheckToAllowLock:()LockingAdditions
{
  objc_msgSend(a1, "_mf_checkToAllowOrderingWithLock:");
  objc_msgSend(a1, "_mf_checkToAllowStrictProgressionWithLock:", a3);
  return objc_msgSend(a1, "_mf_checkToAllowExclusiveLocksWithLock:", a3);
}

- (uint64_t)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions
{
  if (a3 == a1) {
    uint64_t v4 = @"com.apple.Message.MFLockOrderingSelfReference";
  }
  else {
    uint64_t v4 = a3;
  }
  uint64_t v5 = (void *)[(__CFString *)a1 _mf_lockOrderingForType:2];
  uint64_t result = [v5 indexOfObject:v4];
  if (v5)
  {
    uint64_t v7 = (const char *)result;
    if (result != 0x7FFFFFFFFFFFFFFFLL && result != 0)
    {
      uint64_t v9 = 0;
      do
      {
        __int16 v10 = (__CFString *)[v5 objectAtIndex:v9];
        if (v10 == @"com.apple.Message.MFLockOrderingSelfReference") {
          long long v11 = a1;
        }
        else {
          long long v11 = v10;
        }
        if ([(__CFString *)v11 conformsToProtocol:&unk_1F08515D8])
        {
          uint64_t result = [(__CFString *)v11 isLockedByMe];
          if (result) {
            [(NSObject(LockingAdditions) *)a1 _mf_checkToAllowStrictProgressionWithLock:(uint64_t)v5];
          }
        }
        else
        {
          uint64_t result = [(__CFString *)v11 _mf_ntsIsLocked];
          if (result) {
            [(NSObject(LockingAdditions) *)a1 _mf_checkToAllowStrictProgressionWithLock:(uint64_t)v5];
          }
        }
        ++v9;
      }
      while (v7 != v9);
    }
  }
  return result;
}

- (unint64_t)_mf_checkToAllowOrderingWithLock:()LockingAdditions
{
  if (a3 == a1) {
    uint64_t v4 = @"com.apple.Message.MFLockOrderingSelfReference";
  }
  else {
    uint64_t v4 = a3;
  }
  uint64_t v5 = (void *)[(__CFString *)a1 _mf_lockOrderingForType:1];
  unint64_t result = [v5 indexOfObject:v4];
  if (v5)
  {
    uint64_t v7 = (const char *)result;
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t result = [v5 count];
      uint64_t v8 = v7 + 1;
      if ((unint64_t)(v7 + 1) < result)
      {
        unint64_t v9 = result;
        do
        {
          __int16 v10 = (__CFString *)[v5 objectAtIndex:v8];
          if (v10 == @"com.apple.Message.MFLockOrderingSelfReference") {
            long long v11 = a1;
          }
          else {
            long long v11 = v10;
          }
          if ([(__CFString *)v11 conformsToProtocol:&unk_1F08515D8])
          {
            unint64_t result = [(__CFString *)v11 isLockedByMe];
            if (result) {
              [(NSObject(LockingAdditions) *)a1 _mf_checkToAllowOrderingWithLock:(uint64_t)v5];
            }
          }
          else
          {
            unint64_t result = [(__CFString *)v11 _mf_ntsIsLocked];
            if (result) {
              [(NSObject(LockingAdditions) *)a1 _mf_checkToAllowOrderingWithLock:(uint64_t)v5];
            }
          }
          ++v8;
        }
        while ((const char *)v9 != v8);
      }
    }
  }
  return result;
}

- (uint64_t)mf_unlock
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&sMutex);
  pthread_t v2 = (void *)sFirstLock;
  if (!sFirstLock) {
    goto LABEL_14;
  }
  do
  {
    if (v2[1] == a1) {
      uint64_t v3 = (uint64_t)v2;
    }
    else {
      uint64_t v3 = 0;
    }
    pthread_t v2 = (void *)*v2;
    if (v2) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 0;
    }
  }
  while (v4);
  if (v3)
  {
    if (pthread_self() == *(pthread_t *)(v3 + 16))
    {
      int v12 = *(__int16 *)(v3 + 72);
      if ((v12 & 0x7FFF) != 0)
      {
        *(_WORD *)(v3 + 72) = v12 & 0x8000 | (v12 - 1) & 0x7FFF;
        if (v12 < 0)
        {
          if ((((_WORD)v12 - 1) & 0x7FFF) != 0) {
            return pthread_mutex_unlock(&sMutex);
          }
          uint64_t v17 = *(void **)(v3 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F28B28]);
            objc_setAssociatedObject(v17, @"MFLock Call Stack Symbols", 0, (void *)0x301);
            [v18 drain];
          }
          CFArrayRef v19 = *(const __CFArray **)(v3 + 80);
          if (v19 && CFArrayGetCount(v19))
          {
            *(void *)(v3 + 16) = 0;
            pthread_cond_broadcast((pthread_cond_t *)(v3 + 24));
            return pthread_mutex_unlock(&sMutex);
          }
        }
        else
        {
          --*(_WORD *)(v3 + 80);
          if ((((_WORD)v12 - 1) & 0x7FFF) != 0) {
            return pthread_mutex_unlock(&sMutex);
          }
          long long v13 = *(void **)(v3 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F28B28]);
            objc_setAssociatedObject(v13, @"MFLock Call Stack Symbols", 0, (void *)0x301);
            [v14 drain];
          }
          if (*(_WORD *)(v3 + 80))
          {
            *(void *)(v3 + 16) = 0;
            pthread_cond_signal((pthread_cond_t *)(v3 + 24));
            return pthread_mutex_unlock(&sMutex);
          }
        }
        _MFRecycleObjectLock(v3);
        return pthread_mutex_unlock(&sMutex);
      }
      uint64_t v5 = MFLogGeneral();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        return pthread_mutex_unlock(&sMutex);
      }
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = *(void *)(v3 + 8);
      int v20 = 138412546;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = v16;
      uint64_t v8 = "*** Can't unlock <%@:%p>: it's already been unlocked.";
      goto LABEL_13;
    }
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(v3 + 8);
      int v20 = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      uint64_t v8 = "*** Can't unlock <%@:%p>: it was locked by another thread.";
LABEL_13:
      unint64_t v9 = v5;
LABEL_16:
      _os_log_impl(&dword_1AFB03000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
LABEL_14:
    __int16 v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2048;
      uint64_t v23 = a1;
      uint64_t v8 = "*** Can't unlock <%@:%p>: it's not locked.";
      unint64_t v9 = v10;
      goto LABEL_16;
    }
  }
  return pthread_mutex_unlock(&sMutex);
}

- (uint64_t)mf_lockOrdering
{
  return 0;
}

- (BOOL)_mf_ntsIsLocked
{
  uint64_t v1 = (void *)sFirstLock;
  if (!sFirstLock) {
    return 0;
  }
  do
  {
    if (v1[1] == a1) {
      pthread_t v2 = v1;
    }
    else {
      pthread_t v2 = 0;
    }
    uint64_t v1 = (void *)*v1;
    if (v1) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 0;
    }
  }
  while (v3);
  return v2 && pthread_self() == (pthread_t)v2[2];
}

- (void)_mf_dumpLockCallStacks:()LockingAdditions ordering:
{
  unint64_t v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = @"<exclusive locks>";
  }
  else {
    uint64_t v7 = (__CFString *)[a4 objectAtIndex:a3];
  }
  if (_mfCallStackLoggingEnabled())
  {
    __int16 v22 = v7;
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    unint64_t v9 = [a4 count];
    if (v9 > v5)
    {
      unint64_t v10 = v9;
      unint64_t v11 = v9 - 1;
      do
      {
        int v12 = (__CFString *)[a4 objectAtIndex:v5];
        if (v12 == @"com.apple.Message.MFLockOrderingSelfReference")
        {
          id v14 = (void *)[[NSString alloc] initWithFormat:@"<MFLockOrderingSelfReference: %@: %p>", objc_opt_class(), a1];
          long long v13 = a1;
        }
        else
        {
          long long v13 = v12;
          id v14 = objc_msgSend((id)-[__CFString description](v12, "description"), "copy");
        }
        if (_mfCallStackLoggingEnabled())
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v16 = (__CFString *)objc_getAssociatedObject(v13, @"MFLock Call Stack Symbols");
          [v15 drain];
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v17 = @"<no call stack recorded>";
        if (v16) {
          uint64_t v17 = v16;
        }
        unint64_t v18 = v5 + 1;
        CFArrayRef v19 = "\n";
        if (v11 == v5) {
          CFArrayRef v19 = "";
        }
        [v8 appendFormat:@"\t%@ callstack=%@%s", v14, v17, v19];

        ++v5;
      }
      while (v10 != v18);
    }
    int v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v22;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_1AFB03000, v20, OS_LOG_TYPE_DEFAULT, "#Warning MFLock Ordering Violation while taking lock! --> %@\nDumping lock call stack symbols.\n%@", buf, 0x16u);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"))
  {
    uint64_t v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1AFB03000, v21, OS_LOG_TYPE_DEFAULT, "#Warning MFLock Ordering Violation while taking lock! --> %@\nTurn on MFLockCallStackLoggingEnabled to dump call stack information.", buf, 0xCu);
    }
  }
}

- (uint64_t)mf_tryLock
{
  pthread_mutex_lock(&sMutex);
  pthread_t v2 = _MFFindObjectLock(a1, 1);
  return _MFTryObjectLock((uint64_t)v2);
}

- (uint64_t)mf_lockWithPriority
{
  pthread_mutex_lock(&sMutex);
  pthread_t v2 = _MFFindObjectLock(a1, 2);
  return _MFAcquireObjectLock((uint64_t)v2);
}

- (uint64_t)mf_tryLockWithPriority
{
  pthread_mutex_lock(&sMutex);
  pthread_t v2 = _MFFindObjectLock(a1, 1);
  return _MFTryObjectLock((uint64_t)v2);
}

- (void)_mf_lockOrderingForType:()LockingAdditions .cold.1()
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_lockOrderingForType:]", "NSLockAdditions.m", 661, "item != self && \"Don't use self in a lock ordering array - use MFLockOrderingSelfReference.\"");
}

- (void)_mf_checkToAllowOrderingWithLock:()LockingAdditions .cold.1(void *a1, const char *a2, uint64_t a3)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:]", "NSLockAdditions.m", 716, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowOrderingWithLock:()LockingAdditions .cold.2(void *a1, const char *a2, uint64_t a3)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:]", "NSLockAdditions.m", 722, "isLocked == NO");
}

- (void)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions .cold.1(void *a1, const char *a2, uint64_t a3)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:]", "NSLockAdditions.m", 747, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions .cold.2(void *a1, const char *a2, uint64_t a3)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:]", "NSLockAdditions.m", 753, "isLocked == NO");
}

- (void)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions .cold.1(void *a1, void *a2)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:]", "NSLockAdditions.m", 774, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions .cold.2(void *a1, void *a2)
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:]", "NSLockAdditions.m", 780, "isLocked == NO");
}

@end
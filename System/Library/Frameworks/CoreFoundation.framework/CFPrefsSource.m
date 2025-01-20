@interface CFPrefsSource
- (BOOL)alreadylocked_requestNewData;
- (BOOL)isByHost;
- (BOOL)isDirectModeEnabled;
- (BOOL)isVolatile;
- (BOOL)managed;
- (BOOL)servedByUserSessionDaemon;
- (BOOL)synchronize;
- (CFPrefsSource)initWithContainingPreferences:(id)a3;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)container;
- (__CFString)copyOSLogDescription;
- (__CFString)domainIdentifier;
- (__CFString)userIdentifier;
- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4;
- (id)copyVolatileSourceWithContainingPreferences:(id)a3;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)description;
- (int)alreadylocked_updateObservingRemoteChanges;
- (int64_t)alreadylocked_generationCount;
- (int64_t)generationCount;
- (os_unfair_lock_s)copyDictionary;
- (os_unfair_lock_s)copyKeyList;
- (uint64_t)alreadylocked_addPreferencesObserver:(uint64_t)a1;
- (uint64_t)alreadylocked_removePreferencesObserver:(uint64_t)a1;
- (uint64_t)enabled;
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)copyValueForKey:(__CFString *)a3;
- (void)dealloc;
- (void)forEachObserver:(uint64_t)a1;
- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3;
- (void)lock;
- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5;
- (void)removeAllValues_from:(os_unfair_lock_s *)a1;
- (void)replaceAllValuesWithValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(uint64_t)a5 from:;
- (void)setValue:(uint64_t)a3 forKey:(uint64_t)a4 from:;
- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 from:;
- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 removeValuesForKeys:(unint64_t)a7 count:(uint64_t)a8 from:;
- (void)unlock;
@end

@implementation CFPrefsSource

void __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, a3);
  v5 = *(__CFDictionary **)(a1 + 48);
  if (v5)
  {
    v6 = *(const void **)(a1 + 32);
    CFDictionaryAddValue(v5, a2, v6);
  }
}

- (os_unfair_lock_s)copyDictionary
{
  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    uint64_t v3 = [(os_unfair_lock_s *)v1 alreadylocked_copyDictionary];
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5
{
  v11[7] = *(void *)off_1ECE0A5B0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(CFPrefsSource *)self alreadylocked_copyDictionary];
  if (v9)
  {
    v10 = v9;
    v11[0] = off_1ECE0A5A0;
    v11[1] = 3221225472;
    v11[2] = __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke;
    v11[3] = &unk_1ECDFD370;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = self;
    _CFPrefsDictionaryApplyBlock(v9, v11);
    CFRelease(v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  os_unfair_lock_assert_owner(&self->_lock);
  dict = self->_dict;
  if (!dict || CFDictionaryGetCount(dict) < 1) {
    return 0;
  }
  v4 = self->_dict;

  return CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v4);
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  v4[6] = *(void *)off_1ECE0A5B0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v4[3] = &unk_1ECDFD348;
  v4[4] = a3;
  v4[5] = a4;
  -[CFPrefsSource forEachObserver:]((uint64_t)self, (uint64_t)v4);
}

- (CFPrefsSource)initWithContainingPreferences:(id)a3
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  v5.receiver = self;
  v5.super_class = (Class)CFPrefsSource;
  result = [(CFPrefsSource *)&v5 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store((unint64_t)&sentinelGeneration, (unint64_t *)&result->shmemEntry);
    result->_containingPreferences = (_CFXPreferences *)a3;
    result->_isSearchList = 0;
  }
  return result;
}

- (BOOL)synchronize
{
  return 1;
}

- (void)copyValueForKey:(__CFString *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(CFPrefsSource *)self alreadylocked_copyValueForKey:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  dict = self->_dict;
  if (dict) {
    Value = CFDictionaryGetValue(dict, a3);
  }
  else {
    Value = 0;
  }
  v7 = _CFPrefsClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [(CFPrefsSource *)self copyOSLogDescription];
    if (Value)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v9 = _CFPrefsClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138478339;
        v13 = Value;
        __int16 v14 = 2114;
        v15 = a3;
        __int16 v16 = 2114;
        v17 = v8;
        _os_log_debug_impl(&dword_182B90000, v9, OS_LOG_TYPE_DEBUG, "looked up value %{private}@ for key %{public}@ in %{public}@", (uint8_t *)&v12, 0x20u);
      }
      _CFSetTSD(0xFu, 0, 0);
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v10 = _CFPrefsClientLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CFPrefsSource alreadylocked_copyValueForKey:]();
      }
      _CFSetTSD(0xFu, 0, 0);
    }
    CFRelease(v8);
  }
  if (Value) {
    return (void *)CFRetain(Value);
  }
  else {
    return 0;
  }
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  return 0;
}

- (BOOL)managed
{
  return 0;
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  dict = self->_dict;
  if (dict) {
    CFRelease(dict);
  }
  self->_dict = 0;

  v4.receiver = self;
  v4.super_class = (Class)CFPrefsSource;
  [(CFPrefsSource *)&v4 dealloc];
}

- (void)setValue:(uint64_t)a3 forKey:(uint64_t)a4 from:
{
  v5[1] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v4 = a3;
    v5[0] = a2;
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](a1, (uint64_t)v5, (uint64_t)&v4, 1uLL, 1, 0, 0, a4);
  }
}

- (uint64_t)alreadylocked_addPreferencesObserver:(uint64_t)a1
{
  if (!a1 || !a2) {
    return 0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
  uint64_t v4 = *(__CFPrefsWeakObservers **)(a1 + 24);
  if (!v4)
  {
    uint64_t v4 = objc_alloc_init(__CFPrefsWeakObservers);
    *(void *)(a1 + 24) = v4;
  }
  [(__CFPrefsWeakObservers *)v4 addObject:a2];

  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 from:
{
  if (a1) {
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](a1, a2, a3, a4, a5, 0, 0, a6);
  }
}

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 removeValuesForKeys:(unint64_t)a7 count:(uint64_t)a8 from:
{
  uint64_t v36 = a8;
  v39[1] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return;
  }
  if (a7 >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", a7);
    v30 = +[NSException exceptionWithName:@"NSGenericException" reason:v29 userInfo:0];
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  v33[1] = v33;
  if (a7 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = a7;
  }
  unint64_t v16 = MEMORY[0x1F4188790](v15, a2);
  uint64_t v18 = (char *)v33 - v17;
  if (a7 > 0x100)
  {
    v39[0] = 0;
    uint64_t v18 = (char *)_CFCreateArrayStorage(v16, 1, v39);
    v35 = v18;
  }
  else
  {
    bzero((char *)v33 - v17, 8 * v16);
    v35 = 0;
    v39[0] = 0;
  }
  if (a4 >> 60)
  {
    CFStringRef v31 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", a4);
    v32 = +[NSException exceptionWithName:@"NSGenericException" reason:v31 userInfo:0];
    CFRelease(v31);
    objc_exception_throw(v32);
  }
  if (a4 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = a4;
  }
  unint64_t v21 = MEMORY[0x1F4188790](v20, v19);
  v23 = (CFTypeRef *)((char *)v33 - v22);
  size_t v38 = 0;
  if (a4 >= 0x101)
  {
    v23 = (CFTypeRef *)_CFCreateArrayStorage(v21, 0, &v38);
    v34 = v23;
    goto LABEL_17;
  }
  if (a4)
  {
    v34 = 0;
LABEL_17:
    uint64_t v24 = 0;
    do
    {
      CFStringRef DeepCopyOfValueForKey = *(const __CFString **)(a2 + 8 * v24);
      if (DeepCopyOfValueForKey)
      {
        if (a5) {
          CFStringRef DeepCopyOfValueForKey = createDeepCopyOfValueForKey(DeepCopyOfValueForKey, *(void *)(a3 + 8 * v24));
        }
        else {
          CFStringRef DeepCopyOfValueForKey = (const __CFString *)CFRetain(DeepCopyOfValueForKey);
        }
      }
      v23[v24++] = DeepCopyOfValueForKey;
    }
    while (a4 != v24);
    v26 = a1 + 13;
    os_unfair_lock_lock(a1 + 13);
    uint64_t v27 = v36;
    [(os_unfair_lock_s *)a1 alreadylocked_setPrecopiedValues:v23 forKeys:a3 count:a4 from:v36];
    if (!a7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v26 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  v34 = 0;
  uint64_t v27 = v36;
  if (a7) {
LABEL_26:
  }
    [(os_unfair_lock_s *)a1 alreadylocked_setPrecopiedValues:v18 forKeys:a6 count:a7 from:v27];
LABEL_27:
  os_unfair_lock_unlock(v26);
  for (unint64_t i = a4; i; --i)
  {
    if (*v23) {
      CFRelease(*v23);
    }
    ++v23;
  }
  v37[0] = off_1ECE0A5A0;
  v37[1] = 3221225472;
  v37[2] = __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke;
  v37[3] = &unk_1ECDFD348;
  v37[4] = v27;
  v37[5] = a1;
  -[CFPrefsSource forEachObserver:]((uint64_t)a1, (uint64_t)v37);
  free(v34);
  free(v35);
}

- (void)forEachObserver:(uint64_t)a1
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 52);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    uint64_t v5 = *(void **)(a1 + 24);
    if (v5)
    {
      unint64_t v6 = [v5 approximateCount];
      unint64_t v8 = v6;
      if (v6 >> 60)
      {
        CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
        uint64_t v15 = +[NSException exceptionWithName:@"NSGenericException" reason:v14 userInfo:0];
        CFRelease(v14);
        objc_exception_throw(v15);
      }
      if (v6 <= 1) {
        unint64_t v6 = 1;
      }
      unint64_t v9 = MEMORY[0x1F4188790](v6, v7);
      v11 = (id *)((char *)&v16 - v10);
      size_t v16 = 0;
      if (v8 >= 0x101)
      {
        v11 = (id *)_CFCreateArrayStorage(v9, 0, &v16);
        int v12 = v11;
      }
      else
      {
        int v12 = 0;
      }
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 24), "borrowObjects:count:", v11, v8, v16, v17);
      os_unfair_lock_unlock(v4);
      for (; v13; --v13)
      {
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, *v11);
      }
      free(v12);
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

uint64_t __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2)
  {
    uint64_t v3 = result;
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = [*(id *)(v3 + 40) domainIdentifier];
      return [a2 handleChangeNotificationForDomainIdentifier:v4 isRemote:0];
    }
  }
  return result;
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  return 0;
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  return 0;
}

uint64_t __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _notifyObserversOfChangeFromValuesForKeys:*(void *)(a1 + 32) toValuesForKeys:*(void *)(a1 + 40)];
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_dict) {
    self->_dict = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  if (a5 >= 1)
  {
    do
    {
      CFStringRef v10 = *a4;
      v11 = *a3;
      dict = self->_dict;
      if (*a3) {
        CFDictionarySetValue(dict, *a4, *a3);
      }
      else {
        CFDictionaryRemoveValue(dict, *a4);
      }
      uint64_t v13 = _CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v14 = [(CFPrefsSource *)self copyOSLogDescription];
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        uint64_t v15 = _CFPrefsClientLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478339;
          uint64_t v17 = v11;
          __int16 v18 = 2113;
          CFStringRef v19 = v10;
          __int16 v20 = 2114;
          unint64_t v21 = v14;
          _os_log_debug_impl(&dword_182B90000, v15, OS_LOG_TYPE_DEBUG, "setting new value %{private}@ for key %{private}@ in %{public}@", buf, 0x20u);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v14);
      }
      ++a3;
      ++a4;
      --a5;
    }
    while (a5);
    atomic_fetch_add(&self->_generationCount, 1uLL);
  }
}

- (__CFString)domainIdentifier
{
  return @"Volatile";
}

- (id)copyVolatileSourceWithContainingPreferences:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(CFPrefsSource *)self isVolatile])
  {
    unint64_t v6 = [[CFPrefsSource alloc] initWithContainingPreferences:a3];
    dict = self->_dict;
    if (dict)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
      if (MutableCopy)
      {
        unint64_t v9 = MutableCopy;
        CFStringRef v10 = v6->_dict;
        if (v10) {
          CFRelease(v10);
        }
        v6->_dict = v9;
      }
    }
    unint64_t v11 = atomic_load((unint64_t *)&self->_generationCount);
    atomic_store(v11, (unint64_t *)&v6->_generationCount);
  }
  else
  {
    unint64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isVolatile
{
  return 1;
}

- (void)replaceAllValuesWithValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(uint64_t)a5 from:
{
  v48[1] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return;
  }
  uint64_t v41 = a5;
  unint64_t v9 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  CFArrayRef v10 = (const __CFArray *)[(os_unfair_lock_s *)a1 alreadylocked_copyKeyList];
  os_unfair_lock_t v44 = v9;
  os_unfair_lock_unlock(v9);
  CFArrayRef v45 = v10;
  unint64_t Count = CFArrayGetCount(v10);
  unint64_t v13 = Count;
  if (Count >> 60)
  {
    CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
    v37 = +[NSException exceptionWithName:@"NSGenericException" reason:v36 userInfo:0];
    CFRelease(v36);
    objc_exception_throw(v37);
  }
  if (Count <= 1) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = Count;
  }
  if (Count >= 0x101) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = 8 * v15;
  MEMORY[0x1F4188790](Count, v12);
  __int16 v18 = (const void **)((char *)&v40 - v17);
  v48[0] = 0;
  if (v13 >= 0x101)
  {
    __int16 v18 = (const void **)_CFCreateArrayStorage(v14, 0, v48);
    CFStringRef v19 = v18;
  }
  else
  {
    CFStringRef v19 = 0;
  }
  v49.location = 0;
  v49.length = v13;
  CFArrayGetValues(v45, v49, v18);
  v42 = (void **)&v40;
  MEMORY[0x1F4188790](v20, v21);
  uint64_t v22 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v13 > 0x100)
  {
    size_t v47 = 0;
    uint64_t v24 = (char *)_CFCreateArrayStorage(v14, 1, &v47);
  }
  else
  {
    bzero(v22, 8 * v14);
    uint64_t v24 = 0;
    size_t v47 = 0;
  }
  if (v13 >= 0x101) {
    v25 = v24;
  }
  else {
    v25 = v22;
  }
  if (a4 >> 60)
  {
    v40 = v24;
    CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", a4);
    v39 = +[NSException exceptionWithName:@"NSGenericException" reason:v38 userInfo:0];
    CFRelease(v38);
    objc_exception_throw(v39);
  }
  if (a4 <= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = a4;
  }
  unint64_t v27 = MEMORY[0x1F4188790](v26, v23);
  CFStringRef v29 = (CFTypeRef *)((char *)&v40 - v28);
  size_t v46 = 0;
  if (a4 >= 0x101)
  {
    v40 = v24;
    CFStringRef v29 = (CFTypeRef *)_CFCreateArrayStorage(v27, 0, &v46);
    v30 = v19;
    v43 = v29;
LABEL_26:
    uint64_t v31 = 0;
    do
    {
      CFStringRef v32 = *(const __CFString **)(a2 + 8 * v31);
      if (v32) {
        v29[v31] = createDeepCopyOfValueForKey(v32, *(void *)(a3 + 8 * v31));
      }
      ++v31;
    }
    while (a4 != v31);
    int v33 = 1;
    CFStringRef v19 = v30;
    uint64_t v24 = v40;
    goto LABEL_31;
  }
  v43 = 0;
  if (a4)
  {
    v40 = v24;
    v30 = v19;
    goto LABEL_26;
  }
  int v33 = 0;
LABEL_31:
  os_unfair_lock_lock(v44);
  v34 = v18;
  uint64_t v35 = v41;
  [(os_unfair_lock_s *)a1 alreadylocked_setPrecopiedValues:v25 forKeys:v34 count:v13 from:v41];
  [(os_unfair_lock_s *)a1 alreadylocked_setPrecopiedValues:v29 forKeys:a3 count:a4 from:v35];
  os_unfair_lock_unlock(v44);
  CFRelease(v45);
  if (v33)
  {
    do
    {
      if (*v29) {
        CFRelease(*v29);
      }
      ++v29;
      --a4;
    }
    while (a4);
  }
  free(v43);
  free(v24);
  free(v19);
}

- (os_unfair_lock_s)copyKeyList
{
  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    uint64_t v3 = [(os_unfair_lock_s *)v1 alreadylocked_copyKeyList];
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (__CFArray)alreadylocked_copyKeyList
{
  v15[1] = *(void *)off_1ECE0A5B0;
  v2 = [(CFPrefsSource *)self alreadylocked_copyDictionary];
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    unint64_t Count = CFDictionaryGetCount(v2);
    unint64_t v6 = Count;
    if (Count >> 60)
    {
      CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
      unint64_t v14 = +[NSException exceptionWithName:@"NSGenericException" reason:v13 userInfo:0];
      CFRelease(v13);
      objc_exception_throw(v14);
    }
    if (Count <= 1) {
      unint64_t Count = 1;
    }
    unint64_t v7 = MEMORY[0x1F4188790](Count, v5);
    unint64_t v9 = (const void **)((char *)v15 - v8);
    v15[0] = 0;
    if (v6 >= 0x101)
    {
      unint64_t v9 = (const void **)_CFCreateArrayStorage(v7, 0, v15);
      CFArrayRef v10 = v9;
    }
    else
    {
      CFArrayRef v10 = 0;
    }
    CFDictionaryGetKeysAndValues(v3, v9, 0);
    uint64_t v12 = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, v6, &kCFTypeArrayCallBacks);
    CFRelease(v3);
    free(v10);
    return v12;
  }
  else
  {
    return CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, &kCFTypeArrayCallBacks);
  }
}

- (__CFString)copyOSLogDescription
{
  ClassName = object_getClassName(self);
  uint64_t v4 = [(CFPrefsSource *)self domainIdentifier];
  uint64_t v5 = [(CFPrefsSource *)self userIdentifier];
  BOOL v6 = [(CFPrefsSource *)self isByHost];
  unint64_t v7 = [(CFPrefsSource *)self container];
  uint64_t v8 = (unsigned int *)atomic_load((unint64_t *)&self->shmemEntry);
  unint64_t v9 = "No";
  if (v8 && ((unsigned int v10 = atomic_load(v8), v10 == -1) || (v11 = atomic_load(&self->lastKnownShmemState), v10 == v11))) {
    uint64_t v12 = "No";
  }
  else {
    uint64_t v12 = "Yes";
  }
  if (v6) {
    unint64_t v9 = "Yes";
  }
  return (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@, Contents Need Refresh: %s)", ClassName, self, v4, v5, v9, v7, v12);
}

- (uint64_t)alreadylocked_removePreferencesObserver:(uint64_t)a1
{
  if (!a1 || !a2) {
    return 0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
  [*(id *)(a1 + 24) removeObject:a2];

  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (void)removeAllValues_from:(os_unfair_lock_s *)a1
{
  if (a1) {
    -[CFPrefsSource replaceAllValuesWithValues:forKeys:count:from:](a1, 0, 0, 0, a2);
  }
}

- (BOOL)alreadylocked_requestNewData
{
  if (a1) {
    os_unfair_lock_assert_owner(a1 + 13);
  }
  return a1 != 0;
}

- (uint64_t)enabled
{
  return 0;
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
}

- (int64_t)alreadylocked_generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (int64_t)generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)isDirectModeEnabled
{
  return 0;
}

- (__CFString)userIdentifier
{
  return &stru_1ECE10768;
}

- (BOOL)servedByUserSessionDaemon
{
  return 0;
}

- (BOOL)isByHost
{
  return 0;
}

- (__CFString)container
{
  return &stru_1ECE10768;
}

- (id)description
{
  v17[1] = *(void *)off_1ECE0A5B0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  os_unfair_lock_lock(&self->_lock);
  ClassName = object_getClassName(self);
  uint64_t v5 = [(CFPrefsSource *)self domainIdentifier];
  BOOL v6 = [(CFPrefsSource *)self userIdentifier];
  if ([(CFPrefsSource *)self isByHost]) {
    unint64_t v7 = "Yes";
  }
  else {
    unint64_t v7 = "No";
  }
  CFStringAppendFormat(Mutable, 0, @"%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@)", ClassName, self, v5, v6, v7, [(CFPrefsSource *)self container]);
  CFDictionaryRef dict = self->_dict;
  if (dict)
  {
    CFDictionaryRef dict = (const __CFDictionary *)CFDictionaryGetCount(dict);
    uint64_t v10 = (uint64_t)dict;
  }
  else
  {
    uint64_t v10 = 0;
  }
  MEMORY[0x1F4188790](dict, v8);
  CFStringRef v13 = (const void **)((char *)v17 - v12);
  if (v11 >= 0x200) {
    size_t v14 = 512;
  }
  else {
    size_t v14 = v11;
  }
  bzero((char *)v17 - v12, v14);
  if (v10 <= 0)
  {
    CFStringAppend(Mutable, @" Keys: [");
  }
  else
  {
    CFDictionaryGetKeysAndValues(self->_dict, v13, 0);
    CFStringAppend(Mutable, @" Keys: [");
    do
    {
      CFStringRef v15 = (const __CFString *)*v13++;
      CFStringAppend(Mutable, v15);
      CFStringAppend(Mutable, @", ");
      --v10;
    }
    while (v10);
  }
  CFStringAppend(Mutable, @"]\n");
  os_unfair_lock_unlock(&self->_lock);
  return (id)CFAutorelease(Mutable);
}

- (void)alreadylocked_copyValueForKey:.cold.1()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_0_8();
  _os_log_debug_impl(&dword_182B90000, v0, OS_LOG_TYPE_DEBUG, "found no value for key %{public}@ in %{public}@", v1, 0x16u);
}

@end
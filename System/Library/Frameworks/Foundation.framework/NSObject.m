@interface NSObject
+ (BOOL)_shouldAddObservationForwardersForKey:(id)a3;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key;
+ (BOOL)implementsSelector:(SEL)a3;
+ (BOOL)instancesImplementSelector:(SEL)a3;
+ (NSArray)classFallbacksForKeyedArchiver;
+ (NSInteger)version;
+ (NSSet)keyPathsForValuesAffectingValueForKey:(NSString *)key;
+ (id)_createMutableArrayValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createMutableOrderedSetValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createMutableSetValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createOtherValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createOtherValueSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValuePrimitiveGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValuePrimitiveSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValueSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_keysForValuesAffectingValueForKey:(id)a3;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;
+ (void)setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKey:(NSString *)dependentKey;
+ (void)setVersion:(NSInteger)aVersion;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_isKVOA;
- (BOOL)_isToManyChangeInformation;
- (BOOL)_overrideUseFastBlockObservers;
- (BOOL)implementsSelector:(SEL)a3;
- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError *)outError;
- (BOOL)validateValue:(id *)ioValue forKeyPath:(NSString *)inKeyPath error:(NSError *)outError;
- (NSDictionary)dictionaryWithValuesForKeys:(NSArray *)keys;
- (NSMutableArray)mutableArrayValueForKey:(NSString *)key;
- (NSMutableArray)mutableArrayValueForKeyPath:(NSString *)keyPath;
- (NSMutableOrderedSet)mutableOrderedSetValueForKey:(NSString *)key;
- (NSMutableOrderedSet)mutableOrderedSetValueForKeyPath:(NSString *)keyPath;
- (NSMutableSet)mutableSetValueForKey:(NSString *)key;
- (NSMutableSet)mutableSetValueForKeyPath:(NSString *)keyPath;
- (id)_implicitObservationInfo;
- (id)_observerStorage;
- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4;
- (id)addChainedObservers:(id)a3;
- (id)addObservationTransformer:(id)a3;
- (id)addObserver:(id)a3;
- (id)addObserver:(id)a3 forObservableKeyPath:(id)a4;
- (id)addObserverBlock:(id)a3;
- (id)autoContentAccessingProxy;
- (id)newTaggedNSStringWithASCIIBytes_:(const char *)a3 length_:(int64_t)a4;
- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver;
- (id)replacementObjectForPortCoder:(NSPortCoder *)coder;
- (id)valueForKey:(NSString *)key;
- (id)valueForKeyPath:(NSString *)keyPath;
- (id)valueForUndefinedKey:(NSString *)key;
- (void)_addObserver:(id)a3 forProperty:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)_changeValueForKey:(id)a3 key:(id)a4 key:(id)a5 usingBlock:(id)a6;
- (void)_changeValueForKey:(id)a3 usingBlock:(id)a4;
- (void)_changeValueForKeys:(id *)a3 count:(unint64_t)a4 maybeOldValuesDict:(id)a5 maybeNewValuesDict:(id)a6 usingBlock:(id)a7;
- (void)_destroyObserverList;
- (void)_didChangeValuesForKeys:(id)a3;
- (void)_notifyObserversForKeyPath:(id)a3 change:(id)a4;
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)_receiveBox:(id)a3;
- (void)_removeObserver:(id)a3 forProperty:(id)a4;
- (void)_setSharedObservationInfo:(uint64_t)a1;
- (void)_willChangeValuesForKeys:(id)a3;
- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key;
- (void)didChangeValueForKey:(NSString *)key;
- (void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects;
- (void)finishObserving;
- (void)observationInfo;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes;
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array;
- (void)receiveObservedError:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)removeObservation:(id)a3;
- (void)removeObservation:(id)a3 forObservableKeyPath:(id)a4;
- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;
- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;
- (void)setNilValueForKey:(NSString *)key;
- (void)setObservation:(id)a3 forObservingKeyPath:(id)a4;
- (void)setObservationInfo:(void *)observationInfo;
- (void)setSharedObservers:(id)a3;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues;
- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key;
- (void)willChangeValueForKey:(NSString *)key;
- (void)willChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects;
@end

@implementation NSObject

- (id)newTaggedNSStringWithASCIIBytes_:(const char *)a3 length_:(int64_t)a4
{
  return (id)MEMORY[0x1F40D9138](a3, a4);
}

- (id)valueForKey:(NSString *)key
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!key)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to retrieve a value for a nil key", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!_MergedGlobals_98)
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v6;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    _MergedGlobals_98 = (uint64_t)CFSetCreateMutable(0, 0, &callBacks);
  }
  callBacks.version = 0;
  callBacks.copyDescription = 0;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  Value = CFSetGetValue((CFSetRef)_MergedGlobals_98, &callBacks);
  if (!Value)
  {
    Value = objc_msgSend(Class, sel__createValueGetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, Value);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (id)_NSGetUsingKeyValueGetter((uint64_t)self, Value);
}

- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver
{
  if ((dyld_program_sdk_at_least() & 1) != 0 || dyld_program_sdk_at_least())
  {
    return [self replacementObjectForCoder:archiver];
  }
  else
  {
    return [self replacementObjectForArchiver:0];
  }
}

+ (NSArray)classFallbacksForKeyedArchiver
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

uint64_t __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKey:a2];
  if (!result)
  {
    --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(void *)(*(void *)(a1 + 64) + 8 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) = a2;
    uint64_t v7 = *(void *)(a1 + 56);
    goto LABEL_6;
  }
  if ((void *)result != a3)
  {
    uint64_t result = [a3 isEqual:result];
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 64)
                + 8 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + *(void *)(a1 + 72))) = a2;
      uint64_t v7 = *(void *)(a1 + 40);
LABEL_6:
      ++*(void *)(*(void *)(v7 + 8) + 24);
    }
  }
  return result;
}

- (void)willChangeValueForKey:(NSString *)key
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting, 0, 0);
}

- (void)_changeValueForKeys:(id *)a3 count:(unint64_t)a4 maybeOldValuesDict:(id)a5 maybeNewValuesDict:(id)a6 usingBlock:(id)a7
{
  id v33 = a6;
  v34 = (void (**)(void))a7;
  id v36 = a5;
  v32 = a3;
  v43[160] = *MEMORY[0x1E4F143B8];
  bzero(v43, 0x500uLL);
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v9 = (uint64_t)_NSKeyValueRetainedObservationInfoForObject(self, 0);
  id v10 = [self _implicitObservationInfo];
  uint64_t v11 = (uint64_t)v10;
  if (v9)
  {
    uint64_t v12 = [*(id *)(v9 + 8) count];
    if (v11)
    {
LABEL_3:
      uint64_t v13 = [*(id *)(v11 + 8) count];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v35 = v13;
  uint64_t v14 = v13 + v12;
  MEMORY[0x1F4188790](v13);
  v16 = (uint64_t *)((char *)&v30 - v15);
  if (v9) {
    _NSKeyValueObservationInfoGetObservances(v9, (uint64_t)&v30 - v15, v12);
  }
  if (v11) {
    _NSKeyValueObservationInfoGetObservances(v11, (uint64_t)&v16[v12], v35);
  }
  if (v14)
  {
    v17 = (id **)v16;
    uint64_t v18 = v14;
    do
    {
      if (-[NSKeyValueObservance retainedObserver](*v17))
      {
        v19 = *v17;
        if (*v17)
        {
          if (((_BYTE)v19[5] & 0x20) != 0) {
            v19 = (id *)v19[4];
          }
          else {
            v19 = 0;
          }
        }
      }
      else
      {
        v19 = 0;
        *v17 = 0;
      }
      v20 = v19;
      ++v17;
      --v18;
    }
    while (v18);
  }
  uint64_t v21 = v9 | v11;
  os_unfair_recursive_lock_unlock();
  v22 = v43;
  if (v9 | v11)
  {
    v31 = (id *)v9;
    uint64_t v38 = 1;
    long long v40 = 0u;
    uint64_t v37 = 16;
    v39 = v43;
    BYTE8(v40) = 1;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    if (a4 && v31)
    {
      v23 = (uint64_t *)v32;
      unint64_t v24 = a4;
      do
      {
        if (*v23) {
          NSKeyValueWillChange((uint64_t)self, *v23, 0, v16, v12, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting, (uint64_t)v36, (void (*)(uint64_t, uint64_t, uint64_t, long long *, uint64_t, uint64_t, uint64_t))NSKeyValuePushPendingNotificationLocal, (uint64_t)&v37, 0);
        }
        ++v23;
        --v24;
      }
      while (v24);
    }
    uint64_t v25 = v35;
    if (v11)
    {
      BYTE8(v40) = 0;
      if ((uint64_t)(a4 - 1) >= 0)
      {
        v26 = v32 - 1;
        do
        {
          uint64_t v27 = (uint64_t)v26[a4];
          if (v27) {
            NSKeyValueWillChange((uint64_t)self, v27, 0, &v16[v12], v25, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting, (uint64_t)v36, (void (*)(uint64_t, uint64_t, uint64_t, long long *, uint64_t, uint64_t, uint64_t))NSKeyValuePushPendingNotificationLocal, (uint64_t)&v37, 0);
          }
          --a4;
        }
        while ((uint64_t)a4 > 0);
      }
    }
    v22 = v39;
    uint64_t v21 = v40;
    uint64_t v9 = (uint64_t)v31;
  }
  if (v34) {
    v34[2]();
  }
  if (v21 >= 1)
  {
    uint64_t v37 = (uint64_t)v22;
    uint64_t v38 = v21;
    v39 = 0;
    long long v40 = 0uLL;
    uint64_t v41 = v9;
    NSKeyValueDidChange((uint64_t)self, 0, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, (uint64_t)v33, (uint64_t (*)(uint64_t, uint64_t, uint64_t *, long long *, uint64_t *, CFTypeRef *, uint64_t))NSKeyValuePopPendingNotificationLocal, (uint64_t)&v37);
  }
  for (; v14; --v14)
  {
    if (!*v16) {
      goto LABEL_43;
    }
    BOOL isClass = object_isClass((id)*v16);
    uint64_t v29 = *v16;
    if (!isClass)
    {

      uint64_t v29 = *v16;
    }
    if (!v29) {
      goto LABEL_45;
    }
    if ((*(unsigned char *)(v29 + 40) & 0x20) != 0) {
      uint64_t v29 = *(void *)(v29 + 32);
    }
    else {
LABEL_43:
    }
      uint64_t v29 = 0;
LABEL_45:

    ++v16;
  }

  if (v22 != v43) {
    free(v22);
  }
}

- (id)_implicitObservationInfo
{
  unint64_t Value = (unint64_t)self;
  if (self)
  {
    os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
    if (NSKeyValueSharedObservationInfoPerObject) {
      unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)NSKeyValueSharedObservationInfoPerObject, (const void *)~Value);
    }
    else {
      unint64_t Value = 0;
    }
    os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
  }
  return (id)Value;
}

- (void)observationInfo
{
  if (NSKeyValueObservationInfoPerObject) {
    return (void *)CFDictionaryGetValue((CFDictionaryRef)NSKeyValueObservationInfoPerObject, (const void *)~(unint64_t)self);
  }
  else {
    return 0;
  }
}

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  return NSKVOPendingPerThreadNotificationStack(a4);
}

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
  uint64_t v11 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  -[_NSKeyValueDebugging object:willAddObserver:forKeyPath:context:](v11, self, observer, keyPath, (uint64_t)context);
  os_unfair_recursive_lock_lock_with_options();
  Class = object_getClass(self);
  [self _addObserver:observer forProperty:NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath) options:options context:context];

  os_unfair_recursive_lock_unlock();
}

- (void)_addObserver:(id)a3 forProperty:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  if ((a5 & 4) != 0)
  {
    v23[0] = 0;
    uint64_t v11 = [a4 keyPath];
    os_unfair_recursive_lock_unlock();
    if (a5)
    {
      id v12 = [self valueForKeyPath:v11];
      if (!v12) {
        id v12 = (id)[MEMORY[0x1E4F1CA98] null];
      }
    }
    else
    {
      id v12 = 0;
    }
    v22[0] = 1;
    v22[1] = 0;
    v22[3] = 0;
    v22[4] = 0;
    v22[2] = v12;
    NSKeyValueNotifyObserver(a3, v11, (uint64_t)self, (uint64_t)a6, 0, 0, v22, (uint64_t *)v23);

    os_unfair_recursive_lock_lock_with_options();
  }
  uint64_t v13 = (NSKeyValueObservationInfo *)_NSKeyValueRetainedObservationInfoForObject(self, *((void *)a4 + 1));
  if ((a5 & 0x100) != 0 && (uint64_t v14 = _CFGetTSD()) != 0) {
    uint64_t v15 = *(NSObject **)(v14 + 16);
  }
  else {
    uint64_t v15 = 0;
  }
  +[_NSKVODeallocSentinel _havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:self];
  v23[0] = 0;
  char v21 = 0;
  v16 = _NSKeyValueObservationInfoCreateByAdding(v13, a3, (NSKeyValueProperty *)a4, a5, a6, v15, &v21, v23);
  _NSKeyValueReplaceObservationInfoForObject(self, *((void *)a4 + 1), v13, v16);
  [a4 object:self didAddObservance:v23[0] recurse:1];
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    Class = object_getClass(self);
    uint64_t v18 = (objc_class *)[a4 isaForAutonotifying];
    if (!v18 || Class == v18)
    {
      if (!_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
      {
        uint64_t v19 = _NSKeyValueContainerClassForIsa(Class);
        v20 = (objc_class *)_NSKeyValueContainerClassGetNotifyingInfo(v19)[1];
        if (v20)
        {
          if (v20 != Class) {
            object_setClass(self, v20);
          }
        }
      }
    }
    else
    {
      object_setClass(self, v18);
      objc_setAssociatedObject(self, &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc, MEMORY[0x1E4F1CC38], (void *)1);
    }
  }

  if (v13) {
}
  }

- (void)setObservationInfo:(void *)observationInfo
{
  Mutable = (__CFDictionary *)NSKeyValueObservationInfoPerObject;
  if (!NSKeyValueObservationInfoPerObject)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    NSKeyValueObservationInfoPerObject = (uint64_t)Mutable;
  }
  unint64_t v6 = ~(unint64_t)self;
  if (observationInfo)
  {
    CFDictionarySetValue(Mutable, (const void *)v6, observationInfo);
  }
  else
  {
    CFDictionaryRemoveValue(Mutable, (const void *)v6);
  }
}

+ (NSSet)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke;
  v8 = &unk_1E51F8D90;
  id v9 = a1;
  if _class_isSwift() && (objc_opt_respondsToSelector()) {
    return (NSSet *)objc_msgSend(a1, "__NS_swiftOverlay_keyPathsForValuesAffectingValueForKey:foundationImplementation:", key, v6);
  }
  else {
    return (NSSet *)v7((uint64_t)v6, key);
  }
}

uint64_t __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 lengthOfBytesUsingEncoding:4];
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    double v6 = MEMORY[0x1F4188790](-1);
    uint64_t v7 = &v18;
    LOBYTE(v18) = 0;
  }
  else
  {
    uint64_t v7 = (uint64_t *)malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = v5;
  }
  BOOL v9 = v8 < 2 || v7 == 0;
  if (!v9 && memchr(v7, 0, v8 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([a2 length]) {
    *(unsigned char *)uint64_t v7 = __toupper(*(char *)v7);
  }
  size_t v10 = strlen((const char *)v7);
  MEMORY[0x1F4188790](v10);
  id v12 = (char *)v19 - ((v11 + 44) & 0xFFFFFFFFFFFFFFF0);
  snprintf(v12, v13, "keyPathsForValuesAffecting%s", (const char *)v7);
  uint64_t v14 = NSResolvedSelectorForName(*(void **)(a1 + 32), v12);
  if (v14 && class_getClassMethod(*(Class *)(a1 + 32), v14)) {
    method_invoke();
  }
  else {
    uint64_t v15 = [*(id *)(a1 + 32) _keysForValuesAffectingValueForKey:a2];
  }
  uint64_t v16 = v15;
  if (v5) {
    free(v7);
  }
  return v16;
}

+ (id)_keysForValuesAffectingValueForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  CFDictionaryRef v4 = (const __CFDictionary *)qword_1EB1ED2F8;
  if (qword_1EB1ED2F8
    && (v5 = (const void *)objc_opt_class(), (CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(v4, v5)) != 0))
  {
    unint64_t Value = (void *)CFDictionaryGetValue(v6, a3);
  }
  else
  {
    unint64_t Value = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
  unint64_t v8 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [Value countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(Value);
        }
        size_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v13 rangeOfString:@"."];
        if (!v14) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [Value countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v10);
  }
  return v8;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke;
  unint64_t v8 = &unk_1E51F8DB8;
  id v9 = a1;
  if _class_isSwift() && (objc_opt_respondsToSelector()) {
    return objc_msgSend(a1, "__NS_swiftOverlay_automaticallyNotifiesObserversForKey:foundationImplementation:", key, v6);
  }
  else {
    return v7((uint64_t)v6, key);
  }
}

uint64_t __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 lengthOfBytesUsingEncoding:4];
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    double v6 = MEMORY[0x1F4188790](-1);
    uint64_t v7 = &v17;
    LOBYTE(v17) = 0;
  }
  else
  {
    uint64_t v7 = (uint64_t *)malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = v5;
  }
  BOOL v9 = v8 < 2 || v7 == 0;
  if (!v9 && memchr(v7, 0, v8 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([a2 length]) {
    *(unsigned char *)uint64_t v7 = __toupper(*(char *)v7);
  }
  size_t v10 = strlen((const char *)v7);
  size_t v11 = v10 + 35;
  if (v10 + 35 < 0x101)
  {
    if (v10 == -35)
    {
      id v12 = 0;
    }
    else
    {
      MEMORY[0x1F4188790](v10);
      id v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v12, v11);
    }
  }
  else
  {
    id v12 = (char *)malloc_type_malloc(v10 + 35, 0x100004077774924uLL);
  }
  snprintf(v12, v11, "automaticallyNotifiesObserversOf%s", (const char *)v7);
  size_t v13 = NSResolvedSelectorForName(*(void **)(a1 + 32), v12);
  if (!v13 || !class_getClassMethod(*(Class *)(a1 + 32), v13))
  {
    uint64_t v15 = 1;
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  method_invoke();
  uint64_t v15 = v14;
  if (v5) {
LABEL_24:
  }
    free(v7);
LABEL_25:
  if (v11 >= 0x101) {
    free(v12);
  }
  return v15;
}

- (void)didChangeValueForKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, 0);
}

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait
{
  BOOL v5 = wait;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
  id v10 = (id)[v9 initWithObjects:MEMORY[0x1E4F1D410] count:1];
  [self performSelector:aSelector onThread:+[NSThread mainThread] withObject:arg waitUntilDone:v5 modes:v10];
}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
  BOOL v8 = wait;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem & 1) == 0) {
    performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem = 1;
  }
  NSUInteger v13 = [(NSArray *)array count];
  if (array && v13)
  {
    if (v8 && +[NSThread currentThread] == thr)
    {
      id v33 = self;
      id v34 = arg;
      objc_msgSend(self, aSelector, arg);

      id v35 = arg;
    }
    else
    {
      uint64_t v14 = [_NSThreadPerformInfo alloc];
      uint64_t v37 = a2;
      uint64_t v38 = self;
      if (v14)
      {
        v41.receiver = v14;
        v41.super_class = (Class)_NSThreadPerformInfo;
        id v15 = [&v41 init];
        if (isBlock(self)) {
          uint64_t v16 = [self copy];
        }
        else {
          uint64_t v16 = self;
        }
        *((void *)v15 + 1) = v16;
        if (aSelector) {
          SEL v17 = aSelector;
        }
        else {
          SEL v17 = 0;
        }
        *((void *)v15 + 2) = v17;
        v39 = thr;
        if (isBlock(arg)) {
          id v18 = (id)[arg copy];
        }
        else {
          id v18 = arg;
        }
        *((void *)v15 + 3) = v18;
        *((_DWORD *)v15 + 14) = 0;
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v20 = [(NSArray *)array countByEnumeratingWithState:&v43 objects:v42 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v44;
          v23 = (void *)*MEMORY[0x1E4F1D418];
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(array);
              }
              uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if ([v25 isEqual:@"NSDefaultRunLoopMode"]) {
                v26 = v23;
              }
              else {
                v26 = v25;
              }
              [v19 addObject:v26];
            }
            uint64_t v21 = [(NSArray *)array countByEnumeratingWithState:&v43 objects:v42 count:16];
          }
          while (v21);
        }
        *((void *)v15 + 5) = [v19 copy];
        if (v8) {
          *((void *)v15 + 6) = objc_alloc_init(NSCondition);
        }

        thr = v39;
        atomic_store(*((void *)v15 + 1), (unint64_t *)v15 + 4);
        if (v8) {
          goto LABEL_30;
        }
      }
      else
      {
        id v15 = 0;
        if (v8)
        {
LABEL_30:
          NSQualityOfService v27 = [(NSThread *)thr qualityOfService];
          if (v27 == NSQualityOfServiceDefault) {
            uint64_t v28 = 25;
          }
          else {
            uint64_t v28 = v27;
          }
          NSQualityOfService v29 = [+[NSThread currentThread] qualityOfService];
          if (v29 == NSQualityOfServiceDefault) {
            uint64_t v30 = 25;
          }
          else {
            uint64_t v30 = v29;
          }
          if (v30 <= v28) {
            v31 = 0;
          }
          else {
            v31 = -[NSThread _beginQoSOverride:relativePriority:](thr, "_beginQoSOverride:relativePriority:");
          }
          [(NSThread *)thr _nq:v15];
          int v32 = [v15 wait];
          [(NSThread *)thr _endQoSOverride:v31];

          if (v32 == 1)
          {
            id v36 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSDestinationInvalidException", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: target thread exited while waiting for the perform", _NSMethodExceptionProem((objc_class *)v38, v37)), 0 reason userInfo];
            objc_exception_throw(v36);
          }
          return;
        }
      }
      [(NSThread *)thr _nq:v15];
      id v35 = v15;
    }
  }
}

- (NSDictionary)dictionaryWithValuesForKeys:(NSArray *)keys
{
  NSUInteger v5 = [(NSArray *)keys count];
  double v6 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  uint64_t v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  -[NSArray getObjects:range:](keys, "getObjects:range:", v6, 0, v5);
  uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  if (v5)
  {
    uint64_t v9 = v8;
    id v10 = v6;
    size_t v11 = v7;
    NSUInteger v12 = v5;
    do
    {
      uint64_t v13 = *v10++;
      id v14 = [self valueForKey:v13];
      if (v14) {
        uint64_t v15 = (uint64_t)v14;
      }
      else {
        uint64_t v15 = v9;
      }
      *v11++ = v15;
      --v12;
    }
    while (v12);
  }
  uint64_t v16 = (NSDictionary *)(id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v7 forKeys:v6 count:v5];
  free(v7);
  free(v6);
  return v16;
}

- (id)valueForKeyPath:(NSString *)keyPath
{
  size_t v5 = [(NSString *)keyPath length];
  if (!keyPath) {
    goto LABEL_7;
  }
  double v6 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v7 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    uint64_t v9 = CStringPtr;
    id v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      size_t v11 = (char *)(v10 - v9);
LABEL_9:
      id v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      id v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (void)v14, 0);
      SEL v17 = objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "valueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = [(NSString *)keyPath rangeOfString:@".", 2, 0, v5 options range];
    if (v13)
    {
      size_t v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return [self valueForKey:keyPath];
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
  size_t v7 = [(NSString *)keyPath length];
  if (!keyPath) {
    goto LABEL_7;
  }
  uint64_t v8 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v9 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v9 = *v8;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v9);
  if (CStringPtr)
  {
    size_t v11 = CStringPtr;
    uint64_t v12 = (char *)memchr(CStringPtr, 46, v7);
    if (v12)
    {
      uint64_t v13 = (char *)(v12 - v11);
LABEL_9:
      id v16 = v13 + 1;
      id v18 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      id v17 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v16, v7 - (void)v16, 0);
      objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v18), "setValue:forKeyPath:", value, v17);

      return;
    }
  }
  else
  {
LABEL_7:
    uint64_t v14 = [(NSString *)keyPath rangeOfString:@".", 2, 0, v7 options range];
    if (v15)
    {
      uint64_t v13 = (char *)v14;
      goto LABEL_9;
    }
  }

  [self setValue:value forKey:keyPath];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!key)
  {
    id v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to set a value for a nil key", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!NSKeyValueCachedSetters)
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v8;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    NSKeyValueCachedSetters = (uint64_t)CFSetCreateMutable(0, 0, &callBacks);
  }
  callBacks.version = 0;
  callBacks.copyDescription = 0;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  id v9 = (id)CFSetGetValue((CFSetRef)NSKeyValueCachedSetters, &callBacks);
  if (!v9)
  {
    id v9 = objc_msgSend(Class, sel__createValueSetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v9);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  _NSSetUsingKeyValueSetter((uint64_t)self, (uint64_t)v9, (uint64_t)value);
}

+ (BOOL)_shouldAddObservationForwardersForKey:(id)a3
{
  return 1;
}

+ (void)setVersion:(NSInteger)aVersion
{
}

+ (id)_createMutableSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    size_t v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    if (!NSKeyValueCachedMutableSetGetters)
    {
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      CFSetRef v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableSetGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    }
    else
    {
      CFHashCode v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableSetValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);
    }
    return [[NSKeyValueNotifyingMutableCollectionGetter alloc] initWithContainerClassID:a3 key:a4 mutableCollectionGetter:Value proxyClass:self];
  }
  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    double v13 = MEMORY[0x1F4188790](-1);
    uint64_t v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([a4 length]) {
    *(unsigned char *)uint64_t v14 = __toupper(*(char *)v14);
  }
  CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    CFHashCode v18 = CFHash(a4);
    CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    CFHashCode v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  id v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
  }
  Method v22 = NSKeyValueMethodForPattern(a1, "add%sObject:", (const char *)v14);
  Method v23 = NSKeyValueMethodForPattern(a1, "remove%s:", (const char *)v14);
  Method v24 = NSKeyValueMethodForPattern(a1, "remove%sObject:", (const char *)v14);
  Method v25 = NSKeyValueMethodForPattern(a1, "add%s:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v25 && (unint64_t)v24 | (unint64_t)v23)
  {
    v26 = v25;
    id v40 = a3;
    NSQualityOfService v27 = objc_alloc_init(NSKeyValueMutatingSetMethodSet);
    v27->addObject = v22;
    v27->intersectSet = NSKeyValueMethodForPattern(a1, "intersect%s:", (const char *)v14);
    v27->minusSet = v23;
    v27->removeObject = v24;
    v27->setSet = NSKeyValueMethodForPattern(a1, "set%s:", (const char *)v14);
    v27->unionSet = v26;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = [NSKeyValueFastMutableCollection1Getter alloc];
      uint64_t v29 = [v21 methods];
      uint64_t v30 = [(NSKeyValueFastMutableCollection1Getter *)v28 initWithContainerClassID:v40 key:a4 nonmutatingMethods:v29 mutatingMethods:v27 proxyClass:self];
    }
    else
    {
      uint64_t v38 = [NSKeyValueFastMutableCollection2Getter alloc];
      uint64_t v30 = [(NSKeyValueFastMutableCollection2Getter *)v38 initWithContainerClassID:v40 key:a4 baseGetter:v21 mutatingMethods:v27 proxyClass:self];
    }
    uint64_t v20 = (void *)v30;

    if (!v12) {
      return v20;
    }
LABEL_43:
    free(v14);
    return v20;
  }
  CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  id v33 = a3;
  if (a4)
  {
    CFHashCode v34 = CFHash(a4);
    CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    CFHashCode v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  id v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
  }
  if (objc_opt_isKindOfClass()) {
    id v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, [v35 ivar], self);
  }
  else {
    id v36 = [[NSKeyValueSlowMutableCollectionGetter alloc] initWithContainerClassID:v33 key:a4 baseGetter:v21 baseSetter:v35 containerIsa:a1 proxyClass:self];
  }
  uint64_t v20 = v36;
  if (v12) {
    goto LABEL_43;
  }
  return v20;
}

+ (id)_createMutableOrderedSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    size_t v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    if (!NSKeyValueCachedMutableOrderedSetGetters)
    {
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      CFSetRef v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    }
    else
    {
      CFHashCode v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableOrderedValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);
    }
    return [[NSKeyValueNotifyingMutableCollectionGetter alloc] initWithContainerClassID:a3 key:a4 mutableCollectionGetter:Value proxyClass:self];
  }
  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    double v13 = MEMORY[0x1F4188790](-1);
    uint64_t v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([a4 length]) {
    *(unsigned char *)uint64_t v14 = __toupper(*(char *)v14);
  }
  CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    CFHashCode v18 = CFHash(a4);
    CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    CFHashCode v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  id v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
  }
  Method v22 = NSKeyValueMethodForPattern(a1, "insertObject:in%sAtIndex:", (const char *)v14);
  Method v23 = NSKeyValueMethodForPattern(a1, "insert%s:atIndexes:", (const char *)v14);
  Method v24 = NSKeyValueMethodForPattern(a1, "removeObjectFrom%sAtIndex:", (const char *)v14);
  Method v25 = NSKeyValueMethodForPattern(a1, "remove%sAtIndexes:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v26 = v25;
    if ((unint64_t)v24 | (unint64_t)v25)
    {
      id v40 = a3;
      NSQualityOfService v27 = objc_alloc_init(NSKeyValueMutatingOrderedSetMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern(a1, "replaceObjectIn%sAtIndex:withObject:", (const char *)v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern(a1, "replace%sAtIndexes:with%s:", (const char *)v14, (const char *)v14);
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [NSKeyValueFastMutableCollection1Getter alloc];
        uint64_t v29 = [v21 methods];
        uint64_t v30 = [(NSKeyValueFastMutableCollection1Getter *)v28 initWithContainerClassID:v40 key:a4 nonmutatingMethods:v29 mutatingMethods:v27 proxyClass:self];
      }
      else
      {
        uint64_t v38 = [NSKeyValueFastMutableCollection2Getter alloc];
        uint64_t v30 = [(NSKeyValueFastMutableCollection2Getter *)v38 initWithContainerClassID:v40 key:a4 baseGetter:v21 mutatingMethods:v27 proxyClass:self];
      }
      uint64_t v20 = (void *)v30;

      if (!v12) {
        return v20;
      }
LABEL_43:
      free(v14);
      return v20;
    }
  }
  CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  id v33 = a3;
  if (a4)
  {
    CFHashCode v34 = CFHash(a4);
    CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    CFHashCode v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  id v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
  }
  if (objc_opt_isKindOfClass()) {
    id v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, [v35 ivar], self);
  }
  else {
    id v36 = [[NSKeyValueSlowMutableCollectionGetter alloc] initWithContainerClassID:v33 key:a4 baseGetter:v21 baseSetter:v35 containerIsa:a1 proxyClass:self];
  }
  uint64_t v20 = v36;
  if (v12) {
    goto LABEL_43;
  }
  return v20;
}

+ (id)_createMutableArrayValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    size_t v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    if (!NSKeyValueCachedMutableArrayGetters)
    {
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      CFSetRef v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableArrayGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      CFSetRef v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    }
    else
    {
      CFHashCode v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableArrayValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);
    }
    return [[NSKeyValueNotifyingMutableCollectionGetter alloc] initWithContainerClassID:a3 key:a4 mutableCollectionGetter:Value proxyClass:self];
  }
  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    double v13 = MEMORY[0x1F4188790](-1);
    uint64_t v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([a4 length]) {
    *(unsigned char *)uint64_t v14 = __toupper(*(char *)v14);
  }
  CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    CFHashCode v18 = CFHash(a4);
    CFSetRef v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    CFHashCode v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  id v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
  }
  Method v22 = NSKeyValueMethodForPattern(a1, "insertObject:in%sAtIndex:", (const char *)v14);
  Method v23 = NSKeyValueMethodForPattern(a1, "insert%s:atIndexes:", (const char *)v14);
  Method v24 = NSKeyValueMethodForPattern(a1, "removeObjectFrom%sAtIndex:", (const char *)v14);
  Method v25 = NSKeyValueMethodForPattern(a1, "remove%sAtIndexes:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v26 = v25;
    if ((unint64_t)v24 | (unint64_t)v25)
    {
      id v40 = a3;
      NSQualityOfService v27 = objc_alloc_init(NSKeyValueMutatingArrayMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern(a1, "replaceObjectIn%sAtIndex:withObject:", (const char *)v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern(a1, "replace%sAtIndexes:with%s:", (const char *)v14, (const char *)v14);
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [NSKeyValueFastMutableCollection1Getter alloc];
        uint64_t v29 = [v21 methods];
        uint64_t v30 = [(NSKeyValueFastMutableCollection1Getter *)v28 initWithContainerClassID:v40 key:a4 nonmutatingMethods:v29 mutatingMethods:v27 proxyClass:self];
      }
      else
      {
        uint64_t v38 = [NSKeyValueFastMutableCollection2Getter alloc];
        uint64_t v30 = [(NSKeyValueFastMutableCollection2Getter *)v38 initWithContainerClassID:v40 key:a4 baseGetter:v21 mutatingMethods:v27 proxyClass:self];
      }
      uint64_t v20 = (void *)v30;

      if (!v12) {
        return v20;
      }
LABEL_43:
      free(v14);
      return v20;
    }
  }
  CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  id v33 = a3;
  if (a4)
  {
    CFHashCode v34 = CFHash(a4);
    CFSetRef v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    CFHashCode v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  id v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
  }
  if (objc_opt_isKindOfClass()) {
    id v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, [v35 ivar], self);
  }
  else {
    id v36 = [[NSKeyValueSlowMutableCollectionGetter alloc] initWithContainerClassID:v33 key:a4 baseGetter:v21 baseSetter:v35 containerIsa:a1 proxyClass:self];
  }
  uint64_t v20 = v36;
  if (v12) {
    goto LABEL_43;
  }
  return v20;
}

+ (id)_createValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    double v9 = MEMORY[0x1F4188790](-1);
    CFHashCode v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    CFHashCode v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_37;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    *CFHashCode v10 = v14;
  }
  if (v8)
  {
    unint64_t v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    unint64_t v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_37:
    }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  Method v16 = NSKeyValueMethodForPattern(a1, "set%s:", v10);
  if (v16
    || (Method v16 = NSKeyValueMethodForPattern(a1, "_set%s:", v10)) != 0
    || (Method v16 = NSKeyValueMethodForPattern(a1, "setIs%s:", v10)) != 0)
  {
    long long v17 = [[NSKeyValueMethodSetter alloc] initWithContainerClassID:a3 key:a4 method:v16];
    goto LABEL_26;
  }
  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      long long v17 = [[NSKeyValueIvarSetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a1 ivar:v20];
LABEL_26:
      CFHashCode v18 = v17;
      if (v17) {
        goto LABEL_28;
      }
    }
  }
  CFHashCode v18 = (NSKeyValueMethodSetter *)[a1 _createValuePrimitiveSetterWithContainerClassID:a3 key:a4];
LABEL_28:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v18;
}

+ (id)_createValuePrimitiveSetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    double v9 = MEMORY[0x1F4188790](-1);
    CFHashCode v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    CFHashCode v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_35;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    *CFHashCode v10 = v14;
  }
  if (v8)
  {
    unint64_t v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    unint64_t v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_35:
    }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  Method v16 = NSKeyValueMethodForPattern(a1, "setPrimitive%s:", v10);
  if (v16)
  {
    long long v17 = [[NSKeyValueMethodSetter alloc] initWithContainerClassID:a3 key:a4 method:v16];
    goto LABEL_30;
  }
  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v18
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      long long v17 = [[NSKeyValueIvarSetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a1 ivar:v18];
LABEL_30:
      id v19 = v17;
      if (v17) {
        goto LABEL_32;
      }
    }
  }
  id v19 = (NSKeyValueMethodSetter *)[a1 _createOtherValueSetterWithContainerClassID:a3 key:a4];
LABEL_32:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v19;
}

+ (id)_createValuePrimitiveGetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    double v9 = MEMORY[0x1F4188790](-1);
    CFHashCode v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    CFHashCode v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_36;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    *CFHashCode v10 = v14;
  }
  if (v8)
  {
    unint64_t v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    unint64_t v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_36:
    }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  Method v16 = NSKeyValueMethodForPattern(a1, "getPrimitive%s", v10);
  if (v16 || (Method v16 = NSKeyValueMethodForPattern(a1, "primitive%s", v10)) != 0)
  {
    long long v17 = [[NSKeyValueMethodGetter alloc] initWithContainerClassID:a3 key:a4 method:v16];
    goto LABEL_25;
  }
  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      long long v17 = [[NSKeyValueIvarGetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a1 ivar:v20];
LABEL_25:
      Ivar v18 = v17;
      if (v17) {
        goto LABEL_27;
      }
    }
  }
  Ivar v18 = (NSKeyValueMethodGetter *)[a1 _createOtherValueGetterWithContainerClassID:a3 key:a4];
LABEL_27:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v18;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 1;
}

+ (id)_createOtherValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7 = [NSKeyValueUndefinedGetter alloc];

  return [(NSKeyValueUndefinedGetter *)v7 initWithContainerClassID:a3 key:a4 containerIsa:a1];
}

+ (id)_createValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    double v9 = MEMORY[0x1F4188790](-1);
    CFHashCode v10 = v34;
    LOBYTE(v34[0]) = 0;
  }
  else
  {
    CFHashCode v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_53;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    *CFHashCode v10 = v14;
  }
  if (v8)
  {
    unint64_t v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    unint64_t v15 = (char *)v34;
    LOBYTE(v34[0]) = 0;
  }
  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_53:
    }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  Method v16 = NSKeyValueMethodForPattern(a1, "get%s", v10);
  if (v16
    || (Method v17 = NSKeyValueMethodForPattern(a1, "%s", v15)) != 0
    && (Method v16 = v17, ![&unk_1ECAB6170 containsObject:a4])
    || (Method v16 = NSKeyValueMethodForPattern(a1, "is%s", v10)) != 0
    || (Method v16 = NSKeyValueMethodForPattern(a1, "_get%s", v10)) != 0
    || (Method v16 = NSKeyValueMethodForPattern(a1, "_%s", v15)) != 0)
  {
    Ivar v18 = [[NSKeyValueMethodGetter alloc] initWithContainerClassID:a3 key:a4 method:v16];
LABEL_29:
    id v19 = (NSKeyValueCollectionGetter *)v18;
    goto LABEL_30;
  }
  Method v21 = NSKeyValueMethodForPattern(a1, "countOf%s", v10);
  Method v22 = NSKeyValueMethodForPattern(a1, "objectIn%sAtIndex:", v10);
  Method v23 = NSKeyValueMethodForPattern(a1, "%sAtIndexes:", v15);
  Method v24 = NSKeyValueMethodForPattern(a1, "indexIn%sOfObject:", v10);
  if (v24 && v21)
  {
    if ((unint64_t)v22 | (unint64_t)v23)
    {
      Method v25 = v24;
      v26 = objc_alloc_init(NSKeyValueNonmutatingOrderedSetMethodSet);
      v26->count = v21;
      v26->objectAtIndex = v22;
      v26->indexOfObject = v25;
      v26->objectsAtIndexes = v23;
      NSQualityOfService v27 = v26;
      v26->getObjectsRange = NSKeyValueMethodForPattern(a1, "get%s:range:", v10);
      id v19 = [[NSKeyValueCollectionGetter alloc] initWithContainerClassID:a3 key:a4 methods:v27 proxyClass:self];

      goto LABEL_30;
    }
  }
  else if (!v21)
  {
    goto LABEL_42;
  }
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    uint64_t v28 = objc_alloc_init(NSKeyValueNonmutatingArrayMethodSet);
    v28->count = v21;
    v28->objectAtIndex = v22;
    v28->objectsAtIndexes = v23;
    v28->getObjectsRange = NSKeyValueMethodForPattern(a1, "get%s:range:", v10);
    uint64_t v29 = [NSKeyValueCollectionGetter alloc];
LABEL_46:
    id v19 = [(NSKeyValueCollectionGetter *)v29 initWithContainerClassID:a3 key:a4 methods:v28 proxyClass:self];

LABEL_30:
    if (v19) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_42:
  Method v30 = NSKeyValueMethodForPattern(a1, "enumeratorOf%s", v10);
  Method v31 = NSKeyValueMethodForPattern(a1, "memberOf%s:", v10);
  if (v21)
  {
    if (v30)
    {
      long long v32 = v31;
      if (v31)
      {
        uint64_t v28 = objc_alloc_init(NSKeyValueNonmutatingSetMethodSet);
        v28->count = v21;
        v28->objectAtIndex = v30;
        v28->getObjectsRange = v32;
        uint64_t v29 = [NSKeyValueCollectionGetter alloc];
        goto LABEL_46;
      }
    }
  }
  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v33 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v33
      || (Ivar v33 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (Ivar v33 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (Ivar v33 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      Ivar v18 = [[NSKeyValueIvarGetter alloc] initWithContainerClassID:a3 key:a4 containerIsa:a1 ivar:v33];
      goto LABEL_29;
    }
  }
LABEL_31:
  id v19 = (NSKeyValueCollectionGetter *)[a1 _createValuePrimitiveGetterWithContainerClassID:a3 key:a4];
LABEL_32:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v19;
}

+ (id)_createOtherValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7 = [NSKeyValueUndefinedSetter alloc];

  return [(NSKeyValueUndefinedSetter *)v7 initWithContainerClassID:a3 key:a4 containerIsa:a1];
}

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (v4)
  {
    size_t v5 = v4;
    objc_sync_enter(v4);
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v5 _dperf]);
    if (Count)
    {
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1C4B0];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D410];
      id v17 = aTarget;
      do
      {
        memset(&context, 0, sizeof(context));
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex((CFArrayRef)[v5 _dperf], --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          info = context.info;
          if (*(id *)context.info == aTarget || [*(id *)context.info isEqual:aTarget])
          {
            CFRetain(ValueAtIndex);
            Ivar v18 = info;
            CFIndex v19 = Count;
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            unint64_t v11 = (void *)info[3];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v23;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v23 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  CFStringRef v15 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * i);
                  CFStringRef v16 = v8;
                  if (v15 != v7)
                  {
                    if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"])CFStringRef v16 = v8; {
                    else
                    }
                      CFStringRef v16 = v15;
                  }
                  CFRunLoopRemoveTimer((CFRunLoopRef)[v5 getCFRunLoop], ValueAtIndex, v16);
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
              }
              while (v12);
            }
            aTarget = v17;
            CFIndex Count = v19;
            if (v18[6]) {
              [+[NSProcessInfo processInfo] endActivity:v18[6]];
            }
            CFRunLoopTimerInvalidate(ValueAtIndex);
            CFRelease(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)[v5 _dperf], v19);
          }
        }
      }
      while (Count);
    }
    objc_sync_exit(v5);
  }
}

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (v8)
  {
    double v9 = v8;
    objc_sync_enter(v8);
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v9 _dperf]);
    if (Count)
    {
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1C4B0];
      CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D410];
      long long v23 = aSelector;
      id v24 = anArgument;
      id v22 = aTarget;
      do
      {
        memset(&context, 0, sizeof(context));
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex((CFArrayRef)[v9 _dperf], --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          id v14 = *(id *)context.info;
          if (*((SEL *)context.info + 1) == aSelector)
          {
            id v16 = (id)*((void *)context.info + 2);
            CFStringRef v15 = (void *)*((void *)context.info + 3);
            uint64_t v26 = *((void *)context.info + 6);
            if ((v14 == aTarget || [v14 isEqual:aTarget])
              && (v16 == anArgument || [v16 isEqual:anArgument]))
            {
              CFRetain(ValueAtIndex);
              CFIndex v25 = Count;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v28 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v30;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v30 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    CFStringRef v20 = *(const __CFString **)(*((void *)&v29 + 1) + 8 * i);
                    CFStringRef v21 = v12;
                    if (v20 != v11)
                    {
                      if ([*(id *)(*((void *)&v29 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"])CFStringRef v21 = v12; {
                      else
                      }
                        CFStringRef v21 = v20;
                    }
                    CFRunLoopRemoveTimer((CFRunLoopRef)[v9 getCFRunLoop], ValueAtIndex, v21);
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v28 count:16];
                }
                while (v17);
              }
              aSelector = v23;
              anArgument = v24;
              aTarget = v22;
              CFIndex Count = v25;
              if (v26) {
                [+[NSProcessInfo processInfo] endActivity:v26];
              }
              CFRunLoopTimerInvalidate(ValueAtIndex);
              CFRelease(ValueAtIndex);
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)[v9 _dperf], v25);
            }
          }
        }
      }
      while (Count);
    }
    objc_sync_exit(v9);
  }
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id obj = (id)[MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (obj)
  {
    CFRunLoopTimerContext context = *(CFRunLoopTimerContext *)byte_1ECA5C108;
    if ([(NSArray *)modes count])
    {
      objc_sync_enter(obj);
      CFStringRef v11 = malloc_default_zone();
      CFStringRef v12 = malloc_type_zone_calloc(v11, 1uLL, 0x38uLL, 0xC2E5A2B2uLL);
      context.info = v12;
      *CFStringRef v12 = self;
      v12[1] = aSelector;
      v12[2] = anArgument;
      v12[3] = [(NSArray *)modes copyWithZone:0];
      v12[5] = obj;
      if (delay == 0.0) {
        v12[6] = [+[NSProcessInfo processInfo] beginActivityWithOptions:0x400000000FFLL reason:@"Delayed perform with delay 0"];
      }
      double Current = CFAbsoluteTimeGetCurrent();
      double v14 = 0.0;
      if (delay >= 0.0) {
        double v14 = delay;
      }
      CFStringRef v15 = CFRunLoopTimerCreate(0, v14 + Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)__NSFireDelayedPerform, &context);
      v12[4] = v15;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = modes;
      uint64_t v17 = [(NSArray *)modes countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v28;
        CFIndex v19 = (__CFString *)*MEMORY[0x1E4F1D418];
        CFStringRef v20 = (__CFString *)*MEMORY[0x1E4F1C4B0];
        CFStringRef v21 = (__CFString *)*MEMORY[0x1E4F1D410];
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v16);
            }
            long long v23 = *(__CFString **)(*((void *)&v27 + 1) + 8 * i);
            if ([(__CFString *)v23 isEqual:@"NSDefaultRunLoopMode"]) {
              long long v23 = v19;
            }
            if (v23 == v20 || [(__CFString *)v23 isEqual:@"kCFRunLoopCommonModes"]) {
              long long v23 = v21;
            }
            CFRunLoopAddTimer((CFRunLoopRef)[obj getCFRunLoop], v15, v23);
          }
          uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v26 count:16];
        }
        while (v17);
      }
      CFArrayAppendValue((CFMutableArrayRef)[obj _dperf], v15);
      CFRelease(v15);
      objc_sync_exit(obj);
    }
  }
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  id v5 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  uint64_t v8 = [a4 count];
  unint64_t v9 = v8 + v7;
  if ((unint64_t)(v8 + v7) >> 60)
  {
    CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v8 + v7);
    CFStringRef v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v20 userInfo:0];
    CFRelease(v20);
    objc_exception_throw(v21);
  }
  if (v9 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v8 + v7;
  }
  MEMORY[0x1F4188790](v10);
  CFStringRef v12 = (char *)&v22 - v11;
  uint64_t v35 = 0;
  long long v23 = self;
  if (v9 >= 0x101)
  {
    CFStringRef v12 = (char *)_CFCreateArrayStorage();
    id v24 = v12;
  }
  else
  {
    id v24 = 0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = 0;
  uint64_t v14 = [a4 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(a4);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (![v5 objectForKey:v17]) {
          *(void *)&v12[8 * v13++] = v17;
        }
      }
      uint64_t v14 = [a4 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v14);
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = v9;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v25[3] = &unk_1E51F8DE0;
  v25[8] = v12;
  v25[9] = v13;
  v25[4] = a4;
  v25[5] = &v31;
  v25[6] = v26;
  v25[7] = &v27;
  [v5 enumerateKeysAndObjectsUsingBlock:v25];
  uint64_t v18 = v28[3];
  unint64_t v19 = v32[3] + v13;
  if (v9 < v18 + v19) {
    __assert_rtn("-[NSObject(NSKeyValueObservingPrivate) _notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:]", "NSKeyValueObserving.m", 2610, "changedKeyCount + removedKeyCount + addedKeyCount <= countSum");
  }
  if (v19 + v18)
  {
    if (!v18)
    {
      if (v5)
      {
        if (a4)
        {
LABEL_29:
          [v23 _changeValueForKeys:v12 count:v19 maybeOldValuesDict:v5 maybeNewValuesDict:a4 usingBlock:0];
          goto LABEL_30;
        }
      }
      else
      {
        id v5 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
        if (a4) {
          goto LABEL_29;
        }
      }
      a4 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
      goto LABEL_29;
    }
    bzero(&v12[8 * v19], 8 * (v9 - (v18 + v19)));
    if (v5)
    {
      if (!a4) {
        goto LABEL_27;
      }
    }
    else
    {
      id v5 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
      if (!a4) {
LABEL_27:
      }
        a4 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    unint64_t v19 = v9;
    goto LABEL_29;
  }
LABEL_30:
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  free(v24);
}

- (void)_changeValueForKey:(id)a3 key:(id)a4 key:(id)a5 usingBlock:(id)a6
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = a3;
  v6[1] = a4;
  void v6[2] = a5;
  [self _changeValueForKeys:v6 count:3 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:a6];
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay
{
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1D418]];

  [self performSelector:aSelector withObject:anArgument afterDelay:v9 inModes:delay];
}

- (id)addObserver:(id)a3 forObservableKeyPath:(id)a4
{
  int v7 = [a3 conformsToProtocol:&unk_1ECACB590];
  uint64_t v8 = off_1E51F4718;
  if (!v7) {
    uint64_t v8 = off_1E51F46E8;
  }
  uint64_t v9 = (void *)[objc_alloc(*v8) initWithObservable:self observer:a3 keyPath:a4];

  return v9;
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
  uint64_t v9 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  uint64_t v18 = context;
  -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:](v9, (uint64_t)self, observer, (uint64_t)keyPath, (uint64_t)context);
  uint64_t v10 = _CFGetTSD();
  if (!v10)
  {
    uint64_t v11 = malloc_default_zone();
    uint64_t v10 = (uint64_t)malloc_type_zone_calloc(v11, 1uLL, 0x58uLL, 0xC2E5A2B2uLL);
    _CFSetTSD();
  }
  uint64_t v12 = *(void *)(v10 + 32);
  uint64_t v13 = *(void *)(v10 + 40);
  uint64_t v15 = *(void *)(v10 + 48);
  uint64_t v14 = *(void *)(v10 + 56);
  uint64_t v16 = *(void *)(v10 + 64);
  char v17 = *(unsigned char *)(v10 + 72);
  *(void *)(v10 + 32) = self;
  *(void *)(v10 + 40) = observer;
  *(void *)(v10 + 48) = keyPath;
  *(void *)(v10 + 56) = 0;
  *(void *)(v10 + 64) = v18;
  *(unsigned char *)(v10 + 72) = 1;
  [self removeObserver:observer forKeyPath:keyPath];
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v13;
  *(void *)(v10 + 48) = v15;
  *(void *)(v10 + 56) = v14;
  *(void *)(v10 + 64) = v16;
  *(unsigned char *)(v10 + 72) = v17;
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
  uint64_t v7 = _NSKeyValueDebugger();
  if (v7)
  {
    uint64_t v8 = (os_unfair_lock_s *)v7;
    uint64_t v9 = _CFGetTSD();
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 64);
    }
    else {
      uint64_t v10 = 0;
    }
    -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:](v8, (uint64_t)self, observer, (uint64_t)keyPath, v10);
  }
  os_unfair_recursive_lock_lock_with_options();
  Class = object_getClass(self);
  [self _removeObserver:observer forProperty:NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath)];

  os_unfair_recursive_lock_unlock();
}

- (void)_removeObserver:(id)a3 forProperty:(id)a4
{
  v25[1] = *(NSKeyValueObservance **)MEMORY[0x1E4F143B8];
  uint64_t v7 = *((void *)a4 + 1);
  uint64_t v8 = _NSKeyValueRetainedObservationInfoForObject(self, v7);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = _CFGetTSD();
    if (v10
      && (uint64_t v11 = v10, *(NSObject **)(v10 + 32) == self)
      && *(id *)(v10 + 40) == a3
      && objc_msgSend(*(id *)(v10 + 48), "isEqualToString:", objc_msgSend(a4, "keyPath")))
    {
      uint64_t v13 = *(void *)(v11 + 56);
      uint64_t v12 = *(void *)(v11 + 64);
      char v14 = *(unsigned char *)(v11 + 72) != 0;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      char v14 = 0;
    }
    v25[0] = 0;
    char v24 = 0;
    uint64_t v15 = _NSKeyValueObservationInfoCreateByRemoving((uint64_t)v9, (uint64_t)a3, (uint64_t)a4, v12, v14, v13, &v24, v25);
    if (v25[0])
    {
      uint64_t v16 = v15;
      char v17 = v25[0];
      _NSKeyValueReplaceObservationInfoForObject(self, *((void *)a4 + 1), v9, v16);
      [a4 object:self didRemoveObservance:v25[0] recurse:1];
      if (!v16)
      {
        Class Class = object_getClass(self);
        CFStringRef v21 = *(objc_class **)(v7 + 8);
        if (Class != v21)
        {
          if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(v21)) {
            object_setClass(self, *(Class *)(v7 + 8));
          }
          objc_setAssociatedObject(self, &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc, 0, (void *)1);
        }
      }

      return;
    }
LABEL_24:
    uint64_t v22 = objc_opt_class();
    long long v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot remove an observer <%@ %p> for the key path \"%@\" from <%@ %p> because it is not registered as an observer.", v22, a3, objc_msgSend(a4, "keyPath"), objc_opt_class(), self), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v18 = _CFGetTSD();
  if (v18)
  {
    uint64_t v19 = *(void *)(v18 + 8);
    if (v19)
    {
      while (*(NSObject **)v19 != self)
      {
        uint64_t v19 = *(void *)(v19 + 16);
        if (!v19) {
          return;
        }
      }

      *(void *)(v19 + 8) = 0;
    }
  }
}

- (void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetMutation, 0);
}

- (void)_didChangeValuesForKeys:(id)a3
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)a3, 1, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, 0);
}

- (void)_willChangeValuesForKeys:(id)a3
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)a3, 1, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting, 0, 0);
}

- (void)willChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = mutationKind;
  v5[1] = objects;
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetMutation, (uint64_t)v5, 0);
}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait
{
  BOOL v6 = wait;
  id v11 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
  id v12 = (id)[v11 initWithObjects:MEMORY[0x1E4F1D410] count:1];
  [self performSelector:aSelector onThread:thr withObject:arg waitUntilDone:v6 modes:v12];
}

- (id)addObserverBlock:(id)a3
{
  if (qword_1EB1EC9A0 != -1) {
    dispatch_once(&qword_1EB1EC9A0, &__block_literal_global_12);
  }
  Class Class = object_getClass(self);
  if (class_getMethodImplementation(Class, sel_addObserver_) == (IMP)_MergedGlobals_19_1
    || [self _overrideUseFastBlockObservers])
  {
    BOOL v6 = (NSObservation *)+[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 1);
    uint64_t v7 = -[_NSObserverList addBlockSink:toObservableObject:forTag:](v6, (uint64_t)a3, (uint64_t)self, 1);

    return v7;
  }
  else
  {
    id v9 = +[NSObservationSink handleValuesWithBlock:a3];
    return [self addObserver:v9];
  }
}

- (BOOL)_overrideUseFastBlockObservers
{
  return 0;
}

- (void)receiveObservedValue:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __68__NSObject_DefaultObservationImplementations__receiveObservedValue___block_invoke;
  id v12 = &unk_1E51F76A8;
  uint64_t v13 = self;
  v14[0] = 0;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v14);
  MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
  uint64_t v8 = objc_constructInstance(v7, (char *)&v10[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8[6] = 1;
  *((void *)v8 + 1) = a3;
  *((void *)v8 + 2) = self;
  v11((uint64_t)v10, (uint64_t)v8);
}

void __68__NSObject_DefaultObservationImplementations__receiveObservedValue___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, *(void **)(a1 + 32), 0);
  [v3 _receiveBox:a2];
}

- (void)_receiveBox:(id)a3
{
  int v3 = *((_DWORD *)a3 + 6);
  switch(v3)
  {
    case 3:
      [self finishObserving];
      break;
    case 2:
      uint64_t v5 = *((void *)a3 + 1);
      [self receiveObservedError:v5];
      break;
    case 1:
      uint64_t v4 = *((void *)a3 + 1);
      [self receiveObservedValue:v4];
      break;
    default:
      abort();
  }
}

- (id)_observerStorage
{
  return 0;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  return 0;
}

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
  BOOL v7 = wait;
  id v11 = +[NSThread mainThread];

  [self performSelector:aSelector onThread:v11 withObject:arg waitUntilDone:v7 modes:array];
}

- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeByOrderedToManyMutation, 0);
}

IMP __64__NSObject_DefaultObservationImplementations__addObserverBlock___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v0, sel_addObserver_);
  _MergedGlobals_19_1 = (uint64_t)result;
  return result;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  NSUInteger v6 = [(NSDictionary *)keyedValues countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(keyedValues);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(NSDictionary *)keyedValues objectForKey:v10];
        if (v11 == (id)v5) {
          id v12 = 0;
        }
        else {
          id v12 = v11;
        }
        [self setValue:v12 forKey:v10];
      }
      NSUInteger v7 = [(NSDictionary *)keyedValues countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v7);
  }
}

- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = changeKind;
  v5[1] = indexes;
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeByOrderedToManyMutation, (uint64_t)v5, 0);
}

- (void)removeObservation:(id)a3 forObservableKeyPath:(id)a4
{
}

- (void)setObservation:(id)a3 forObservingKeyPath:(id)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&setObservation_forObservingKeyPath__lock);
  AssociatedObject = (NSMapTable *)objc_getAssociatedObject(self, "strongObservingKeyPathsAssociationKey");
  if (!AssociatedObject)
  {
    AssociatedObject = [[NSMapTable alloc] initWithKeyOptions:0 valueOptions:0 capacity:0];
    objc_setAssociatedObject(self, "strongObservingKeyPathsAssociationKey", AssociatedObject, (void *)0x301);
  }
  if (a3) {
    [(NSMapTable *)AssociatedObject setObject:a3 forKey:a4];
  }
  else {
    [(NSMapTable *)AssociatedObject removeObjectForKey:a4];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&setObservation_forObservingKeyPath__lock);
}

- (void)setSharedObservers:(id)a3
{
  if (a3) {
    [a3 _assignToObject:self];
  }
  else {
    -[NSObject _setSharedObservationInfo:]((uint64_t)self, 0);
  }
}

- (void)finishObserving
{
  v2 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  [v2 finishObserving];
}

- (id)addChainedObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = (void *)[a3 reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    NSUInteger v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v7) {
          uint64_t v10 = (void *)[v10 addObserver:v7];
        }
        NSUInteger v7 = v10;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  else
  {
    NSUInteger v7 = 0;
  }
  return [self addObserver:v7];
}

- (id)addObservationTransformer:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke;
  v4[3] = &unk_1E51F8340;
  v4[4] = a3;
  return [self addObserver:+[NSObservationTransformer mapValuesWithBlock:v4]];
}

uint64_t __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_destroyObserverList
{
}

- (BOOL)_isToManyChangeInformation
{
  return 0;
}

- (void)receiveObservedError:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __68__NSObject_DefaultObservationImplementations__receiveObservedError___block_invoke;
  id v12 = &unk_1E51F76A8;
  long long v13 = self;
  v14[0] = 0;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v14);
  MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
  uint64_t v8 = objc_constructInstance(v7, (char *)&v10[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8[6] = 2;
  *((void *)v8 + 1) = a3;
  *((void *)v8 + 2) = self;
  v11((uint64_t)v10, (uint64_t)v8);
}

void __68__NSObject_DefaultObservationImplementations__receiveObservedError___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, *(void **)(a1 + 32), 0);
  [v3 _receiveBox:a2];
}

- (id)addObserver:(id)a3
{
  uint64_t v5 = (NSObservation *)+[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 1);
  uint64_t v6 = -[_NSObserverList addObserver:toObservableObject:](v5, a3, self);

  return v6;
}

- (void)removeObservation:(id)a3
{
  uint64_t v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  [v4 removeObservation:a3];
}

- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError *)outError
{
  v17[3] = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = [(NSString *)inKey lengthOfBytesUsingEncoding:4];
  unint64_t v8 = v7 + 1;
  if (v7 == -1)
  {
    double v9 = MEMORY[0x1F4188790](-1);
    uint64_t v10 = v17;
    LOBYTE(v17[0]) = 0;
  }
  else
  {
    uint64_t v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  -[NSString getCString:maxLength:encoding:](inKey, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }
  if ([(NSString *)inKey length]) {
    *uint64_t v10 = __toupper((char)*v10);
  }
  Class Class = object_getClass(self);
  if (!NSKeyValueMethodForPattern(Class, "validate%s:error:", v10))
  {
    BOOL v15 = 1;
    if (!v8) {
      return v15;
    }
    goto LABEL_16;
  }
  method_invoke();
  BOOL v15 = v14;
  if (v8) {
LABEL_16:
  }
    free(v10);
  return v15;
}

- (NSMutableArray)mutableArrayValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  if (!NSKeyValueCachedMutableArrayGetters)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableArrayGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  }
  else
  {
    CFHashCode v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend(Class, sel__createMutableArrayValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableArray *)_NSGetUsingKeyValueGetter((uint64_t)self, Value);
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  if (!NSKeyValueCachedMutableOrderedSetGetters)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  }
  else
  {
    CFHashCode v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend(Class, sel__createMutableOrderedSetValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableOrderedSet *)_NSGetUsingKeyValueGetter((uint64_t)self, Value);
}

- (NSMutableSet)mutableSetValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  if (!NSKeyValueCachedMutableSetGetters)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    CFSetRef v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableSetGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    CFSetRef v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  }
  else
  {
    CFHashCode v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend(Class, sel__createMutableSetValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableSet *)_NSGetUsingKeyValueGetter((uint64_t)self, Value);
}

- (BOOL)validateValue:(id *)ioValue forKeyPath:(NSString *)inKeyPath error:(NSError *)outError
{
  size_t v9 = [(NSString *)inKeyPath length];
  if (!inKeyPath) {
    goto LABEL_7;
  }
  uint64_t v10 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v11 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v11 = *v10;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)inKeyPath, v11);
  if (CStringPtr)
  {
    long long v13 = CStringPtr;
    BOOL v14 = (char *)memchr(CStringPtr, 46, v9);
    if (v14)
    {
      BOOL v15 = (char *)(v14 - v13);
LABEL_9:
      uint64_t v18 = v15 + 1;
      id v19 = -[NSString _newSubstringWithRange:zone:](inKeyPath, "_newSubstringWithRange:zone:", 0);
      id v20 = -[NSString _newSubstringWithRange:zone:](inKeyPath, "_newSubstringWithRange:zone:", v18, v9 - (void)v18, 0);
      char v21 = objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v19), "validateValue:forKeyPath:error:", ioValue, v20, outError);

      return v21;
    }
  }
  else
  {
LABEL_7:
    uint64_t v16 = [(NSString *)inKeyPath rangeOfString:@".", 2, 0, v9 options range];
    if (v17)
    {
      BOOL v15 = (char *)v16;
      goto LABEL_9;
    }
  }

  return [self validateValue:ioValue forKey:inKeyPath error:outError];
}

- (NSMutableArray)mutableArrayValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = [(NSString *)keyPath length];
  if (!keyPath) {
    goto LABEL_7;
  }
  CFSetRef v6 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v7 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    uint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      BOOL v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      id v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (void)v14, 0);
      uint64_t v17 = (NSMutableArray *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableArrayValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = [(NSString *)keyPath rangeOfString:@".", 2, 0, v5 options range];
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return [self mutableArrayValueForKey:keyPath];
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = [(NSString *)keyPath length];
  if (!keyPath) {
    goto LABEL_7;
  }
  CFSetRef v6 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v7 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    uint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      BOOL v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      id v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (void)v14, 0);
      uint64_t v17 = (NSMutableOrderedSet *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableOrderedSetValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = [(NSString *)keyPath rangeOfString:@".", 2, 0, v5 options range];
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return [self mutableOrderedSetValueForKey:keyPath];
}

- (NSMutableSet)mutableSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = [(NSString *)keyPath length];
  if (!keyPath) {
    goto LABEL_7;
  }
  CFSetRef v6 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v7 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    uint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      BOOL v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      id v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (void)v14, 0);
      uint64_t v17 = (NSMutableSet *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableSetValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = [(NSString *)keyPath rangeOfString:@".", 2, 0, v5 options range];
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return [self mutableSetValueForKey:keyPath];
}

- (id)valueForUndefinedKey:(NSString *)key
{
  int v3 = key;
  size_t v5 = +[NSString stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: this class is not key value coding-compliant for the key %@.", objc_opt_class(), self, key];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!v3) {
    int v3 = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  CFStringEncoding v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", v3, @"NSUnknownUserInfoKey", 0);
  CFHashCode v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSUnknownKeyException" reason:v5 userInfo:v7];

  [v8 raise];
  return 0;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  uint64_t v4 = key;
  id v6 = +[NSString stringWithFormat:@"[<%@ %p> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key %@.", objc_opt_class(), self, key];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!v4) {
    uint64_t v4 = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  CFHashCode v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", v4, @"NSUnknownUserInfoKey", 0);
  size_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSUnknownKeyException" reason:v6 userInfo:v8];

  [v9 raise];
}

- (void)setNilValueForKey:(NSString *)key
{
  int v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> setNilValueForKey]: could not set nil as the value for the key %@.", objc_opt_class(), self, key), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (BOOL)_isKVOA
{
  return 0;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  unsigned __int8 v6 = atomic_load(_NSKVO51127338RequiresSilencingExceptions);
  if ((v6 & 1) == 0)
  {
    id v7 = +[NSString stringWithFormat:@"%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p", self, keyPath, object, change, context];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0]);
  }
  NSLog((NSString *)@"%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p", a2, self, keyPath, object, change, context);
}

+ (void)setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKey:(NSString *)dependentKey
{
  os_unfair_lock_lock_with_options();
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:keys];
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_1EB1ED2F8;
  if (!qword_1EB1ED2F8)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    qword_1EB1ED2F8 = (uint64_t)Mutable;
  }
  id Value = (void *)CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    id Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1EB1ED2F8, a1, Value);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)Value, dependentKey, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
}

- (void)_notifyObserversForKeyPath:(id)a3 change:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  long long v38 = self;
  unsigned __int8 v6 = (id *)_NSKeyValueRetainedObservationInfoForObject(self, 0);
  if (v6)
  {
    id v7 = v6;
    v44[0] = 0;
    uint64_t v8 = [v6[1] count];
    MEMORY[0x1F4188790](v8);
    uint64_t v10 = (id **)((char *)&v35 - v9);
    _NSKeyValueObservationInfoGetObservances((uint64_t)v7, (uint64_t)&v35 - v9, v8);
    if (v8)
    {
      uint64_t v35 = (uint64_t)&v35;
      id v36 = v7;
      long long v37 = v41;
      id v39 = a4;
      while (1)
      {
        CFStringEncoding v11 = *v10;
        uint64_t v12 = -[NSKeyValueObservance retainedObserver](*v10);
        if (v12) {
          break;
        }
LABEL_29:
        ++v10;
        if (!--v8)
        {
          uint64_t v34 = (void *)v44[0];
          id v7 = v36;
          goto LABEL_32;
        }
      }
      uint64_t v13 = v12;
      BOOL v14 = objc_msgSend(v11[2], "restOfKeyPathIfContainedByValueForKeyPath:", a3, v35);
      if (v14)
      {
        id v15 = v14;
        id v16 = a3;
        uint64_t v17 = [v14 length];
        uint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kind"), "integerValue");
        if (((_BYTE)v11[5] & 2) != 0)
        {
          char v24 = (void *)[a4 objectForKey:@"old"];
          uint64_t v19 = (uint64_t)v24;
          if (v17) {
            uint64_t v19 = [v24 valueForKeyPath:v15];
          }
          if (!v19) {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
          }
        }
        else
        {
          uint64_t v19 = 0;
        }
        if ((_BYTE)v11[5])
        {
          uint64_t v26 = (void *)[a4 objectForKey:@"new"];
          uint64_t v25 = (uint64_t)v26;
          if (v17) {
            uint64_t v25 = [v26 valueForKeyPath:v15];
          }
          if (!v25) {
            uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
          }
        }
        else
        {
          uint64_t v25 = 0;
        }
        uint64_t v27 = [v39 objectForKey:@"indexes"];
        uint64_t v28 = [v11[2] keyPath];
        uint64_t v29 = (uint64_t)v11[3];
        if (((_BYTE)v11[5] & 0x20) != 0) {
          uint64_t v30 = (uint64_t)v11[4];
        }
        else {
          uint64_t v30 = 0;
        }
        uint64_t v40 = v18;
        v41[0] = v19;
        v41[1] = v25;
        uint64_t v42 = v27;
        uint64_t v43 = 0;
        NSKeyValueNotifyObserver(v13, v28, (uint64_t)v38, v29, v30, 0, &v40, v44);
        a3 = v16;
      }
      else
      {
        if (![v11[2] matchesWithoutOperatorComponentsKeyPath:a3])
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kind"), "integerValue");
        uint64_t v21 = [a4 objectForKey:@"indexes"];
        uint64_t v22 = [v11[2] keyPath];
        if (((_BYTE)v11[5] & 0x20) != 0) {
          uint64_t v23 = (uint64_t)v11[4];
        }
        else {
          uint64_t v23 = 0;
        }
        uint64_t v31 = (uint64_t)v11[3];
        uint64_t v33 = v37;
        long long v32 = v38;
        *long long v37 = 0;
        v33[1] = 0;
        uint64_t v40 = v20;
        uint64_t v42 = v21;
        uint64_t v43 = 0;
        NSKeyValueNotifyObserver(v13, v22, (uint64_t)v32, v31, v23, 0, &v40, v44);
      }
      a4 = v39;
      goto LABEL_28;
    }
    uint64_t v34 = 0;
LABEL_32:
  }
}

- (void)_changeValueForKey:(id)a3 usingBlock:(id)a4
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  [self _changeValueForKeys:v4 count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:a4];
}

- (void)_setSharedObservationInfo:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
  CFDictionaryRef Mutable = (__CFDictionary *)NSKeyValueSharedObservationInfoPerObject;
  if (!NSKeyValueSharedObservationInfoPerObject)
  {
    if (!a2) {
      goto LABEL_8;
    }
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    NSKeyValueSharedObservationInfoPerObject = (uint64_t)Mutable;
LABEL_7:
    CFDictionarySetValue(Mutable, (const void *)~a1, a2);
    goto LABEL_8;
  }
  if (a2) {
    goto LABEL_7;
  }
  CFDictionaryRemoveValue((CFMutableDictionaryRef)NSKeyValueSharedObservationInfoPerObject, (const void *)~a1);
LABEL_8:

  os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
}

+ (BOOL)instancesImplementSelector:(SEL)a3
{
  if (!a3) {
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  }
  return class_getMethodImplementation((Class)a1, a3) != (IMP)MEMORY[0x1E4FBA8C8];
}

+ (BOOL)implementsSelector:(SEL)a3
{
  if (!a3) {
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  }
  Class Class = object_getClass(a1);
  return class_getMethodImplementation(Class, a3) != (IMP)MEMORY[0x1E4FBA8C8];
}

- (BOOL)implementsSelector:(SEL)a3
{
  if (!a3) {
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  }
  uint64_t v4 = (objc_class *)objc_opt_class();
  return class_getMethodImplementation(v4, a3) != (IMP)MEMORY[0x1E4FBA8C8];
}

+ (NSInteger)version
{
  return class_getVersion((Class)a1);
}

- (id)autoContentAccessingProxy
{
  return +[NSAutoContentAccessingProxy proxyWithTarget:self];
}

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg
{
  id v4 = (id)[objc_allocWithZone((Class)NSThread) initWithTarget:self selector:aSelector object:arg];
  [v4 setQualityOfService:17];

  [v4 start];
}

- (id)replacementObjectForPortCoder:(NSPortCoder *)coder
{
  id result = -[NSObject replacementObjectForCoder:](self, "replacementObjectForCoder:");
  if (result)
  {
    return (id)[(NSPortCoder *)coder _proxyForLocalObject:result];
  }
  return result;
}

@end
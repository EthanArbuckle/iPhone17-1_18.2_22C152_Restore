@interface NSNotificationCenter
+ (NSNotificationCenter)defaultCenter;
+ (id)_defaultCenterWithoutCreating;
+ (void)load;
- (BOOL)isEmpty;
- (NSNotificationCenter)init;
- (id)_initWithCFNotificationCenter:(__CFNotificationCenter *)a3;
- (id)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void *)block;
- (id)debugDescription;
- (id)description;
- (unint64_t)_addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6 options:(unint64_t)a7;
- (void)_removeObserver:(unint64_t)a3;
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject;
- (void)dealloc;
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject;
@end

@implementation NSNotificationCenter

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject
{
}

+ (id)_defaultCenterWithoutCreating
{
  if (!atomic_load(&qword_1EB1ECFA0)) {
    return 0;
  }
  if (qword_1EB1ECFA8 != -1) {
    dispatch_once(&qword_1EB1ECFA8, &__block_literal_global_166);
  }
  return (id)atomic_load(&qword_1EB1ECFA0);
}

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  if (aName)
  {
    v5 = [[NSNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    _CFXNotificationPost();
  }
}

- (void)postNotification:(NSNotification *)notification
{
  if (!notification)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: notification is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
  }

  _CFXNotificationPost();
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
  if (observer && aSelector)
  {
    if (@"NSWillBecomeMultiThreadedNotification" == (__CFString *)aName && _NSIsMultiThreaded == 0)
    {
      _NSIsMultiThreaded = 1;
      v10 = [[NSNotification alloc] initWithName:aName object:0 userInfo:0];
      objc_msgSend(observer, aSelector, v10);
    }
    else
    {
      if (addObserver_selector_name_object__once != -1) {
        dispatch_once(&addObserver_selector_name_object__once, &__block_literal_global_101);
      }
      Class = object_getClass(observer);
      class_isMetaClass(Class);
      _CFXNotificationRegisterObserver();
    }
  }
}

+ (NSNotificationCenter)defaultCenter
{
  if (NSNotificationCenter == a1)
  {
    if (qword_1EB1ECFA8 != -1) {
      dispatch_once(&qword_1EB1ECFA8, &__block_literal_global_166);
    }
    return (NSNotificationCenter *)atomic_load(&qword_1EB1ECFA0);
  }
  else
  {
    os_unfair_lock_lock_with_options();
    CFDictionaryRef Mutable = (const __CFDictionary *)qword_1EB1ECF90;
    if (!qword_1EB1ECF90)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      qword_1EB1ECF90 = (uint64_t)Mutable;
    }
    Value = (NSNotificationCenter *)CFDictionaryGetValue(Mutable, a1);
    if (!Value)
    {
      Value = (NSNotificationCenter *)objc_alloc_init((Class)a1);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1EB1ECF90, a1, Value);
    }
    os_unfair_lock_unlock(&stru_1EB1ECF7C);
  }
  return Value;
}

- (unint64_t)_addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6 options:(unint64_t)a7
{
  Class = object_getClass(a3);
  class_isMetaClass(Class);

  return _CFXNotificationRegisterObserver();
}

- (void)removeObserver:(id)observer
{
}

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject
{
  if (!observer) {
    return;
  }
  self;
  os_unfair_lock_lock(&_MergedGlobals_9);
  if (qword_1EB1ECF88)
  {
    int v9 = CFSetContainsValue((CFSetRef)qword_1EB1ECF88, observer);
    os_unfair_lock_unlock(&_MergedGlobals_9);
    if (v9)
    {
      self;
      os_unfair_lock_lock(&_MergedGlobals_9);
      if (qword_1EB1ECF88 && CFSetContainsValue((CFSetRef)qword_1EB1ECF88, observer))
      {
        CFSetRemoveValue((CFMutableSetRef)qword_1EB1ECF88, observer);
        id v14 = (id)*((void *)observer + 1);
        *((void *)observer + 1) = 0;
        uint64_t v10 = [observer token];
        os_unfair_lock_unlock(&_MergedGlobals_9);
        if (v14)
        {
          [v14 _removeObserver:v10];
        }
      }
      else
      {
        os_unfair_lock_unlock(&_MergedGlobals_9);
      }
      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(&_MergedGlobals_9);
  }
  impl = self->_impl;
  if (aName) {
    NSNotificationName v12 = aName;
  }
  else {
    NSNotificationName v12 = (NSNotificationName)*MEMORY[0x1E4F1D250];
  }
  if (anObject) {
    id v13 = anObject;
  }
  else {
    id v13 = (id)*MEMORY[0x1E4F1D258];
  }

  MEMORY[0x1F40D9418](impl, v12, v13, observer);
}

- (void)_removeObserver:(unint64_t)a3
{
}

- (id)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void *)block
{
  if (!block)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  v7 = +[__NSObserver observerWithCenter:]((uint64_t)__NSObserver, self);
  if (_CFAppVersionCheck())
  {
    [v7 setBlock:block];
    [v7 block];
  }
  v8 = (objc_class *)objc_opt_class();
  class_isMetaClass(v8);
  [v7 setToken:_CFXNotificationRegisterObserver()];
  return v7;
}

+ (void)load
{
}

- (NSNotificationCenter)init
{
  self->_impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl) {
    CFRelease(impl);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSNotificationCenter;
  [(NSNotificationCenter *)&v4 dealloc];
}

- (id)_initWithCFNotificationCenter:(__CFNotificationCenter *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSNotificationCenter;
  objc_super v4 = [(NSNotificationCenter *)&v6 init];
  v4->_impl = (__CFNotificationCenter *)CFRetain(a3);
  return v4;
}

- (id)description
{
  v2 = (__CFString *)CFCopyDescription(self->_impl);

  return v2;
}

- (BOOL)isEmpty
{
  return _CFXNotificationCenterIsEmpty() != 0;
}

- (id)debugDescription
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  memset(buffer, 0, sizeof(buffer));
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 13, 0, buffer, 64) != 64 || (v11 & 2) == 0)
  {
    uint64_t v5 = _NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "-[NSNotificationCenter debugDescription] should not be used programmatically and only be used in the debugger.", buf, 2u);
    }
    return +[NSString stringWithFormat:@"<%@:%p>\n", objc_opt_class(), self];
  }
  else
  {
    objc_super v6 = +[NSString stringWithFormat:@"<%@:%p>\n", objc_opt_class(), self];
    uint64_t v7 = (const void *)_CFXNotificationCenterCopyDebugInfo();
    [(NSMutableString *)v6 appendString:v7];
    CFRelease(v7);
  }
  return v6;
}

@end
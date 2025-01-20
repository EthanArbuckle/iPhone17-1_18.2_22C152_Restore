@interface NSDistributedNotificationCenter
+ (NSDistributedNotificationCenter)defaultCenter;
+ (NSDistributedNotificationCenter)notificationCenterForType:(NSDistributedNotificationCenterType)notificationCenterType;
- (BOOL)suspended;
- (NSDistributedNotificationCenter)init;
- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (id)addObserverForName:(id)a3 object:(id)a4 suspensionBehavior:(unint64_t)a5 queue:(id)a6 usingBlock:(id)a7;
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(NSString *)anObject;
- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object suspensionBehavior:(NSNotificationSuspensionBehavior)suspensionBehavior;
- (void)postNotification:(id)a3;
- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject userInfo:(NSDictionary *)aUserInfo;
- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately;
- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo options:(NSDistributedNotificationOptions)options;
- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(NSString *)anObject;
- (void)setSuspended:(BOOL)suspended;
@end

@implementation NSDistributedNotificationCenter

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo options:(NSDistributedNotificationOptions)options
{
  v6 = [[NSNotification alloc] initWithName:name object:object userInfo:userInfo];
  _CFXNotificationPost();
}

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(NSString *)anObject
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSDistributedNotificationCenter;
  [(NSNotificationCenter *)&v5 removeObserver:observer name:aName object:anObject];
}

+ (NSDistributedNotificationCenter)defaultCenter
{
  return (NSDistributedNotificationCenter *)[a1 notificationCenterForType:@"_NSLocalNotificationCenter"];
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(NSString *)anObject
{
}

- (id)addObserverForName:(id)a3 object:(id)a4 suspensionBehavior:(unint64_t)a5 queue:(id)a6 usingBlock:(id)a7
{
  if (!a7)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  v7 = +[__NSObserver observerWithCenter:]((uint64_t)__NSObserver, self);
  [v7 setToken:_CFXNotificationRegisterObserver()];
  return v7;
}

- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  return [(NSDistributedNotificationCenter *)self addObserverForName:a3 object:a4 suspensionBehavior:2 queue:a5 usingBlock:a6];
}

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately
{
}

+ (NSDistributedNotificationCenter)notificationCenterForType:(NSDistributedNotificationCenterType)notificationCenterType
{
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_1EB1ECF98;
  if (!qword_1EB1ECF98)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    qword_1EB1ECF98 = (uint64_t)Mutable;
  }
  Value = (NSDistributedNotificationCenter *)CFDictionaryGetValue(Mutable, notificationCenterType);
  if (!Value)
  {
    v7 = NSClassFromString(notificationCenterType);
    if (!v7) {
      v7 = (objc_class *)a1;
    }
    Value = (NSDistributedNotificationCenter *)objc_alloc_init(v7);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1EB1ECF98, notificationCenterType, Value);
    }
  }
  os_unfair_lock_unlock(&stru_1EB1ECF7C);
  return Value;
}

- (NSDistributedNotificationCenter)init
{
  self->super._impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object suspensionBehavior:(NSNotificationSuspensionBehavior)suspensionBehavior
{
  Class = object_getClass(observer);
  class_isMetaClass(Class);

  _CFXNotificationRegisterObserver();
}

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject
{
}

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject userInfo:(NSDictionary *)aUserInfo
{
}

- (void)setSuspended:(BOOL)suspended
{
}

- (void)postNotification:(id)a3
{
  if (!a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: notification is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
  }

  _CFXNotificationPost();
}

- (BOOL)suspended
{
  return MEMORY[0x1F40D93F8](self->super._impl, a2);
}

@end
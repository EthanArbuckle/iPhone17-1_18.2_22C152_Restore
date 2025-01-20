@interface FAFamilyNotificationObserver
+ (id)familyNotificationObserverWithNotificationHandler:(id)a3;
+ (void)initialize;
- (FAFamilyNotificationObserver)init;
- (id)_initWithNotificationHandler:(id)a3;
- (void)_didReceiveNotification;
- (void)_startObserving;
- (void)dealloc;
- (void)stopObserving;
@end

@implementation FAFamilyNotificationObserver

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___FAFamilyNotificationObserver;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_8);
  }
}

CFMutableArrayRef __42__FAFamilyNotificationObserver_initialize__block_invoke()
{
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
  s_knownObservers = (uint64_t)result;
  return result;
}

+ (id)familyNotificationObserverWithNotificationHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithNotificationHandler:v4];

  [v5 _startObserving];
  return v5;
}

- (FAFamilyNotificationObserver)init
{
  return (FAFamilyNotificationObserver *)[(FAFamilyNotificationObserver *)self _initWithNotificationHandler:0];
}

- (id)_initWithNotificationHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyNotificationObserver;
  v5 = [(FAFamilyNotificationObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id notificationHandler = v5->_notificationHandler;
    v5->_id notificationHandler = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(FAFamilyNotificationObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)FAFamilyNotificationObserver;
  [(FAFamilyNotificationObserver *)&v3 dealloc];
}

- (void)_startObserving
{
  if (!self->_observing)
  {
    self->_observing = 1;
    CFArrayAppendValue((CFMutableArrayRef)s_knownObservers, self);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = (const __CFString *)getINFamilyDidChangeNotification();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AAUIHandleFamilyDidChangeNotification, v4, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)stopObserving
{
  if (self->_observing)
  {
    self->_observing = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = (const __CFString *)getINFamilyDidChangeNotification();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
    CFArrayRef v5 = (const __CFArray *)s_knownObservers;
    v10.length = CFArrayGetCount((CFArrayRef)s_knownObservers);
    v10.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v10, self);
    if (FirstIndexOfValue != -1)
    {
      CFIndex v7 = FirstIndexOfValue;
      v8 = (__CFArray *)s_knownObservers;
      CFArrayRemoveValueAtIndex(v8, v7);
    }
  }
}

- (void)_didReceiveNotification
{
}

- (void).cxx_destruct
{
}

@end
@interface _ReachabilityRequest
- (BOOL)hasObservers;
- (NSString)hostname;
- (_ReachabilityRequest)initWithHostname:(id)a3;
- (id)description;
- (void)addObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)reachabilityChangedWithFlags:(unsigned int)a3;
- (void)removeObserver:(id)a3;
@end

@implementation _ReachabilityRequest

- (_ReachabilityRequest)initWithHostname:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ReachabilityRequest;
  v4 = [(_ReachabilityRequest *)&v6 init];
  if (v4)
  {
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v4->_hostname = (NSString *)[a3 copy];
    v4->_observers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  }
  return v4;
}

- (void)dealloc
{
  [(NSLock *)self->_lock lock];

  self->_hostname = 0;
  observers = self->_observers;
  if (observers)
  {
    CFRelease(observers);
    self->_observers = 0;
  }
  [(NSLock *)self->_lock unlock];

  v4.receiver = self;
  v4.super_class = (Class)_ReachabilityRequest;
  [(_ReachabilityRequest *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)_ReachabilityRequest;
  return (id)[NSString stringWithFormat:@"%@ (%@)", -[_ReachabilityRequest description](&v3, sel_description), self->_hostname];
}

- (void)reachabilityChangedWithFlags:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((a3 & 2) != 0 && (self->_flags & 2) != 0)
  {
    v13[0] = a3 & 0xFFFFFFFD;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  unint64_t v5 = 0;
  self->_flags = a3;
  v13[v4] = a3;
  uint64_t v6 = 4 * v4 + 4;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    if (((v13[v5 / 4] >> 1) & 1) != self->_isReachable || !self->_receivedAtLeastOneCallback)
    {
      self->_isReachable = (v13[v5 / 4] & 2) != 0;
      self->_receivedAtLeastOneCallback = 1;
      [(NSLock *)self->_lock lock];
      observers = self->_observers;
      if (observers && CFDictionaryGetCount(observers) > 0)
      {
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v7, self->_observers);
        [(NSLock *)self->_lock unlock];
        if (Copy)
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v13[v5 / 4] length:4];
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", self->_isReachable), @"CPNetworkObserverReachable", self->_hostname, @"CPNetworkObserverHostname", v11, @"CPNetworkObserverReachableFlags", 0);
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)[MEMORY[0x1E4F28EA0] notificationWithName:@"CPNetworkObserverHostnameReachableNotification" object:0 userInfo:v12]);
          CFRelease(Copy);
          [v10 drain];
        }
      }
      else
      {
        [(NSLock *)self->_lock unlock];
      }
    }
    v5 += 4;
  }
  while (v6 != v5);
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  [(NSLock *)self->_lock lock];
  observers = self->_observers;
  if (observers)
  {
    CFDictionaryAddValue(observers, a3, a4);
    if (!self->_reachability)
    {
      context.version = 0;
      context.info = self;
      context.retain = (const void *(__cdecl *)(const void *))_RetainReachabilityContextInfo;
      context.release = (void (__cdecl *)(const void *))_ReleaseReachabilityContextInfo;
      context.copyDescription = 0;
      v8 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(NSString *)self->_hostname UTF8String]);
      self->_reachability = v8;
      if (v8)
      {
        hostname = self->_hostname;
        v17 = 0;
        memset(&v18, 0, sizeof(v18));
        v18.int ai_flags = 4;
        if (!getaddrinfo([(NSString *)hostname UTF8String], 0, &v18, &v17))
        {
          if (v17)
          {
            ai_addr = v17->ai_addr;
            freeaddrinfo(v17);
            if (ai_addr)
            {
              v18.int ai_flags = 0;
              if (SCNetworkReachabilityGetFlags(self->_reachability, (SCNetworkReachabilityFlags *)&v18))
              {
                v14[0] = MEMORY[0x1E4F143A8];
                v14[1] = 3221225472;
                v14[2] = __45___ReachabilityRequest_addObserver_selector___block_invoke;
                v14[3] = &unk_1E56690B8;
                v14[4] = self;
                int ai_flags = v18.ai_flags;
                dispatch_async(MEMORY[0x1E4F14428], v14);
              }
            }
          }
        }
        SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_ReachabilityCallback, &context);
        reachability = self->_reachability;
        Main = CFRunLoopGetMain();
        SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
      }
    }
    [(NSLock *)self->_lock unlock];
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)removeObserver:(id)a3
{
  [(NSLock *)self->_lock lock];
  observers = self->_observers;
  if (observers)
  {
    CFDictionaryRemoveValue(observers, a3);
    if (self->_reachability)
    {
      if (!CFDictionaryGetCount(self->_observers))
      {
        SCNetworkReachabilitySetCallback(self->_reachability, 0, 0);
        reachability = self->_reachability;
        Main = CFRunLoopGetMain();
        SCNetworkReachabilityUnscheduleFromRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
        CFRelease(self->_reachability);
        self->_reachability = 0;
      }
    }
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (BOOL)hasObservers
{
  [(NSLock *)self->_lock lock];
  observers = self->_observers;
  if (observers) {
    BOOL v4 = CFDictionaryGetCount(observers) > 0;
  }
  else {
    BOOL v4 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (NSString)hostname
{
  return self->_hostname;
}

@end
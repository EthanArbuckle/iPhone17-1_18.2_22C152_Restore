@interface NSNetServiceBrowser
- (BOOL)includesPeerToPeer;
- (NSNetServiceBrowser)init;
- (__CFNetServiceBrowser)_internalNetServiceBrowser;
- (id)delegate;
- (void)_dispatchCallBack:(void *)a3 flags:(unint64_t)a4 error:(id)a5;
- (void)_setIncludesAWDL:(BOOL)a3;
- (void)dealloc;
- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)searchForBrowsableDomains;
- (void)searchForRegistrationDomains;
- (void)searchForServicesOfType:(NSString *)type inDomain:(NSString *)domainString;
- (void)setDelegate:(id)delegate;
- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer;
- (void)stop;
@end

@implementation NSNetServiceBrowser

- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer
{
  self->_includesPeerToPeer = includesPeerToPeer;
}

- (BOOL)includesPeerToPeer
{
  return self->_includesPeerToPeer;
}

- (void)dealloc
{
  if (self->_netServiceBrowser)
  {
    CFNetServiceBrowserInvalidate([(NSNetServiceBrowser *)self _internalNetServiceBrowser]);
  }
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSNetServiceBrowser;
  [(NSNetServiceBrowser *)&v3 dealloc];
}

- (void)_dispatchCallBack:(void *)a3 flags:(unint64_t)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  int64_t var0 = a5.var0;
  v10 = (void *)MEMORY[0x18531D6D0](self, a2);
  if (v5 == -72005)
  {
    if ([(NSNetServiceBrowser *)self delegate])
    {
      [(NSNetServiceBrowser *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserDidStopSearch:", self);
      }
    }
  }
  else if (v5)
  {
    if ([(NSNetServiceBrowser *)self delegate])
    {
      [(NSNetServiceBrowser *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v12 = [NSNumber numberWithInt:v5];
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", var0), @"NSNetServicesErrorDomain", 0));
      }
    }
  }
  else
  {
    switch((a4 >> 1) & 5)
    {
      case 1uLL:
        if ([(NSNetServiceBrowser *)self delegate])
        {
          [(NSNetServiceBrowser *)self delegate];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didFindDomain:moreComing:", self, objc_msgSend(NSString, "stringWithString:", a3), a4 & 1);
          }
        }
        break;
      case 2uLL:
      case 3uLL:
        __break(1u);
        JUMPOUT(0x184282430);
      case 4uLL:
        if ([(NSNetServiceBrowser *)self delegate])
        {
          [(NSNetServiceBrowser *)self delegate];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didRemoveService:moreComing:", self, -[NSNetService initWithCFNetService:]([NSNetService alloc], "initWithCFNetService:", a3), a4 & 1);
          }
        }
        break;
      case 5uLL:
        if ([(NSNetServiceBrowser *)self delegate])
        {
          [(NSNetServiceBrowser *)self delegate];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didRemoveDomain:moreComing:", self, objc_msgSend(NSString, "stringWithString:", a3), a4 & 1);
          }
        }
        break;
      default:
        if ([(NSNetServiceBrowser *)self delegate])
        {
          [(NSNetServiceBrowser *)self delegate];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didFindService:moreComing:", self, -[NSNetService initWithCFNetService:]([NSNetService alloc], "initWithCFNetService:", a3), a4 & 1);
          }
        }
        break;
    }
  }
}

- (__CFNetServiceBrowser)_internalNetServiceBrowser
{
  return (__CFNetServiceBrowser *)self->_netServiceBrowser;
}

- (void)stop
{
  v2 = [(NSNetServiceBrowser *)self _internalNetServiceBrowser];

  CFNetServiceBrowserStopSearch(v2, 0);
}

- (void)searchForServicesOfType:(NSString *)type inDomain:(NSString *)domainString
{
  if (self->_netServiceBrowser)
  {
    CFTypeRef cf = 0;
    if ([(NSNetServiceBrowser *)self includesPeerToPeer])
    {
      uint64_t AssociatedObject = 1;
    }
    else
    {
      uint64_t AssociatedObject = (uint64_t)objc_getAssociatedObject(self, "kNSNetServiceBrowserIncludesAWDLKey");
      if (AssociatedObject)
      {
        if (objc_opt_respondsToSelector())
        {
          if ([(id)AssociatedObject BOOLValue]) {
            uint64_t AssociatedObject = 2;
          }
          else {
            uint64_t AssociatedObject = 0;
          }
        }
        else
        {
          uint64_t AssociatedObject = 0;
        }
      }
    }
    BOOL v8 = _CFNetServiceBrowserSearchForServices((char *)[(NSNetServiceBrowser *)self _internalNetServiceBrowser], (uint64_t)domainString, (uint64_t)type, AssociatedObject, (CFErrorRef *)&cf);
    id v9 = [(NSNetServiceBrowser *)self delegate];
    if (v8)
    {
      if (v9)
      {
        [(NSNetServiceBrowser *)self delegate];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
        }
      }
    }
    else
    {
      if (v9)
      {
        [(NSNetServiceBrowser *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = _CFStreamErrorFromCFError((__CFError *)cf);
          v11 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v13 = [NSNumber numberWithInt:v12];
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v13, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", v10), @"NSNetServicesErrorDomain", 0));
        }
      }
      CFRelease(cf);
    }
  }
}

- (void)_setIncludesAWDL:(BOOL)a3
{
  v4 = (void *)[NSNumber numberWithBool:a3];

  objc_setAssociatedObject(self, "kNSNetServiceBrowserIncludesAWDLKey", v4, (void *)0x301);
}

- (void)searchForRegistrationDomains
{
  if (self->_netServiceBrowser)
  {
    error.domain = 0;
    *(void *)&error.CFStreamError error = 0;
    int v3 = CFNetServiceBrowserSearchForDomains([(NSNetServiceBrowser *)self _internalNetServiceBrowser], 1u, &error);
    id v4 = [(NSNetServiceBrowser *)self delegate];
    if (v3)
    {
      if (v4)
      {
        [(NSNetServiceBrowser *)self delegate];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
        }
      }
    }
    else if (v4)
    {
      [(NSNetServiceBrowser *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v6 = [NSNumber numberWithInt:error.error];
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", error.domain), @"NSNetServicesErrorDomain", 0));
      }
    }
  }
}

- (void)searchForBrowsableDomains
{
  if (self->_netServiceBrowser)
  {
    error.domain = 0;
    *(void *)&error.CFStreamError error = 0;
    int v3 = CFNetServiceBrowserSearchForDomains([(NSNetServiceBrowser *)self _internalNetServiceBrowser], 0, &error);
    id v4 = [(NSNetServiceBrowser *)self delegate];
    if (v3)
    {
      if (v4)
      {
        [(NSNetServiceBrowser *)self delegate];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
        }
      }
    }
    else if (v4)
    {
      [(NSNetServiceBrowser *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v6 = [NSNumber numberWithInt:error.error];
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", error.domain), @"NSNetServicesErrorDomain", 0));
      }
    }
  }
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  uint64_t v6 = [(NSRunLoop *)aRunLoop getCFRunLoop];
  if (v6)
  {
    v7 = v6;
    BOOL v8 = [(NSNetServiceBrowser *)self _internalNetServiceBrowser];
    CFNetServiceBrowserUnscheduleFromRunLoop(v8, v7, (CFStringRef)mode);
  }
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  uint64_t v6 = [(NSRunLoop *)aRunLoop getCFRunLoop];
  if (v6)
  {
    v7 = v6;
    BOOL v8 = [(NSNetServiceBrowser *)self _internalNetServiceBrowser];
    CFNetServiceBrowserScheduleWithRunLoop(v8, v7, (CFStringRef)mode);
  }
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (NSNetServiceBrowser)init
{
  v10.receiver = self;
  v10.super_class = (Class)NSNetServiceBrowser;
  v2 = [(NSNetServiceBrowser *)&v10 init];
  if (!v2) {
    goto LABEL_8;
  }
  clientContext.version = 0;
  clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v2);
  clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
  clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
  clientContext.copyDescription = 0;
  CFNetServiceBrowserRef v3 = CFNetServiceBrowserCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFNetServiceBrowserClientCallBack)_netServiceBrowserDispatchCallBack, &clientContext);
  v2->_id netServiceBrowser = v3;
  if (!v3)
  {
    id netServiceBrowser = 0;
    v2->_reserved = 0;
LABEL_7:

    v2->_id netServiceBrowser = 0;
LABEL_8:

    return 0;
  }
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  if (!Current)
  {
    v2->_reserved = 0;
    id netServiceBrowser = v2->_netServiceBrowser;
    goto LABEL_7;
  }
  uint64_t v5 = Current;
  uint64_t v6 = [(NSNetServiceBrowser *)v2 _internalNetServiceBrowser];
  CFNetServiceBrowserScheduleWithRunLoop(v6, v5, (CFStringRef)*MEMORY[0x1E4F1D410]);
  v2->_reserved = 0;
  return v2;
}

@end
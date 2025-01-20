@interface _CSDBThreadObject
- (BOOL)isCurrentThreadOtherwiseAssert:(BOOL)a3;
- (_CSDBThreadObject)initWithIdentifier:(id)a3 qosClass:(unsigned __int16)a4;
- (id)thread;
- (void)_threadedMain;
- (void)dealloc;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
@end

@implementation _CSDBThreadObject

- (BOOL)isCurrentThreadOtherwiseAssert:(BOOL)a3
{
  BOOL v3 = a3;
  if ((NSThread *)objc_msgSend_currentThread(MEMORY[0x263F08B88], a2, a3) == self->_thread) {
    return 1;
  }
  v7 = (const void *)objc_msgSend_UTF8String(self->_queueContext, v5, v6);
  specific = dispatch_get_specific(v7);
  BOOL v10 = specific == 0;
  BOOL result = specific != 0;
  BOOL v10 = !v10 || !v3;
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21527C000, v11, OS_LOG_TYPE_INFO, "**************************************************************************", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_21527C000, v12, OS_LOG_TYPE_INFO, "****** Database access off the database thread, please file a radar ******", v15, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, "**************************************************************************", v14, 2u);
        abort();
      }
    }
    abort();
  }
  return result;
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  if (a4)
  {
    if (a3)
    {
      uint64_t v6 = (const void *)objc_msgSend_UTF8String(self->_queueContext, a2, (uint64_t)a3);
      if (dispatch_get_specific(v6))
      {
        v7 = (void (*)(id))*((void *)a3 + 2);
        v7(a3);
      }
      else
      {
        queue = self->_queue;
        dispatch_sync(queue, a3);
      }
    }
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_performBlock_, a3);
  }
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  if (a3)
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    queue = self->_queue;
    dispatch_after(v6, queue, a3);
  }
}

- (void)_threadedMain
{
  BOOL v3 = (void *)MEMORY[0x2166B6390](self, a2);
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9.version) = 0;
      _os_log_impl(&dword_21527C000, v4, OS_LOG_TYPE_INFO, "Starting up database thread", (uint8_t *)&v9, 2u);
    }
  }
  self->_runLoop = (NSRunLoop *)(id)objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v5, v6);
  memset(&v9, 0, sizeof(v9));
  self->_runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v9);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  while (1)
  {
    v8 = (void *)MEMORY[0x2166B6390]();
    CFRunLoopRun();
  }
}

- (_CSDBThreadObject)initWithIdentifier:(id)a3 qosClass:(unsigned __int16)a4
{
  dispatch_qos_class_t v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_CSDBThreadObject;
  v7 = [(_CSDBThreadObject *)&v22 init];
  if (v7)
  {
    v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"_CSDBThreadObjectQueue-%@", a3);
    if (v4)
    {
      uint64_t v11 = objc_msgSend_UTF8String(v8, v9, v10);
      v12 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
      v13 = (const char *)v11;
    }
    else
    {
      v13 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
      v12 = 0;
    }
    v7->_queue = (OS_dispatch_queue *)dispatch_queue_create(v13, v12);
    id v14 = [NSString alloc];
    v16 = (NSString *)objc_msgSend_initWithFormat_(v14, v15, @"%s-%@", "_CSDBThreadObjectQueueContext", a3);
    v7->_queueContext = v16;
    queue = v7->_queue;
    v20 = (const void *)objc_msgSend_UTF8String(v16, v18, v19);
    dispatch_queue_set_specific(queue, v20, (void *)1, 0);
    v7->_identifier = (NSString *)a3;
  }
  return v7;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)_CSDBThreadObject;
  [(_CSDBThreadObject *)&v4 dealloc];
}

- (id)thread
{
  return self->_thread;
}

- (void)performBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

@end
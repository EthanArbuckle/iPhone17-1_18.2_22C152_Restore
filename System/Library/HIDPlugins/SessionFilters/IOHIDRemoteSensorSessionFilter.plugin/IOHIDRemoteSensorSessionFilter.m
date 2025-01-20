dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}
)&v10 init];
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.hidrc", 0);
    [(IOHIDRemoteSensorSessionFilter *)v3 setQueue:v4];

    v5 = objc_alloc((Class)HIDRemoteDeviceAACPServer);
    v6 = [(IOHIDRemoteSensorSessionFilter *)v3 queue];
    v7 = [v5 initWithQueue:v6];
    [(IOHIDRemoteSensorSessionFilter *)v3 setServer:v7];

    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IOHIDRemoteSensorSessionFilter;
  [(IOHIDRemoteSensorSessionFilter *)&v2 dealloc];
}

- (void)activate
{
  id v2 = [(IOHIDRemoteSensorSessionFilter *)self server];
  [v2 activate];
}

- (void)cancel
{
  id v2 = [(IOHIDRemoteSensorSessionFilter *)self server];
  [v2 cancel];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (HIDRemoteDeviceAACPServer)server
{
  return (HIDRemoteDeviceAACPServer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
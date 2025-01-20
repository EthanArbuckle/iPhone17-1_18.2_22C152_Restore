@interface _GCHIDEventIOKitClient
- (_GCHIDEventIOKitClient)init;
- (_GCHIDEventIOKitClient)initWithClient:(__IOHIDEventSystemClient *)a3 queue:(id)a4;
- (void)dealloc;
@end

@implementation _GCHIDEventIOKitClient

- (_GCHIDEventIOKitClient)initWithClient:(__IOHIDEventSystemClient *)a3 queue:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"_GCHIDEventIOKitClient.m", 46, @"Invalid parameter not satisfying: %@", @"client != NULL" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_GCHIDEventIOKitClient;
  v8 = [(_GCHIDEventSubject *)&v11 init];
  if (v8)
  {
    v8->_ioClient = (__IOHIDEventSystemClient *)CFRetain(a3);
    IOHIDEventSystemClientRegisterEventCallback();
  }

  return v8;
}

- (_GCHIDEventIOKitClient)init
{
  return 0;
}

- (void)dealloc
{
  CFRelease(self->_ioClient);
  self->_ioClient = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCHIDEventIOKitClient;
  [(_GCHIDEventIOKitClient *)&v3 dealloc];
}

@end
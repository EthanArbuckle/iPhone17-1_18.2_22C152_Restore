@interface IOHIDObsoleteQueueClass
- (IOHIDObsoleteQueueClass)initWithDevice:(id)a3;
- (int)getNextEvent:(IOHIDEventStruct *)a3;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)setEventCallout:(void *)a3 callbackTarget:(void *)a4 callbackRefcon:(void *)a5;
- (void)dealloc;
@end

@implementation IOHIDObsoleteQueueClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (!CFEqual(v6, v7))
  {
    int v8 = -2147483644;
    if (!v6) {
      return v8;
    }
    goto LABEL_3;
  }
  *a4 = &self->_interface;
  CFRetain(self);
  int v8 = 0;
  if (v6) {
LABEL_3:
  }
    CFRelease(v6);
  return v8;
}

- (int)getNextEvent:(IOHIDEventStruct *)a3
{
  IOHIDValueRef value = 0;
  if (a3)
  {
    int v6 = objc_msgSend_copyNextValue_(self, a2, (uint64_t)&value, v3, v4);
    CFUUIDRef v7 = 0;
    if (!v6 && value)
    {
      IOHIDElementRef Element = IOHIDValueGetElement(value);
      v9 = [HIDLibElement alloc];
      CFUUIDRef v7 = objc_msgSend_initWithElementRef_(v9, v10, (uint64_t)Element, v11, v12);
      objc_msgSend_setValueRef_(v7, v13, (uint64_t)value, v14, v15);
      uint32_t v20 = objc_msgSend_length(v7, v16, v17, v18, v19);
      a3->type = objc_msgSend_type(v7, v21, v22, v23, v24);
      a3->elementCookie = objc_msgSend_elementCookie(v7, v25, v26, v27, v28);
      a3->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v7, v29, v30, v31, v32);
      if (v20 < 5uLL)
      {
        a3->longValueSize = 0;
        a3->longValue = 0;
        a3->IOHIDValueRef value = objc_msgSend_integerValue(v7, v33, v34, v35, v36);
      }
      else
      {
        a3->longValueSize = v20;
        a3->longValue = malloc_type_malloc(v20, 0xC0F2EF42uLL);
        BytePtr = IOHIDValueGetBytePtr(value);
        memmove(a3->longValue, BytePtr, v20);
      }
      CFRelease(value);
      int v6 = 0;
    }
  }
  else
  {
    CFUUIDRef v7 = 0;
    int v6 = -536870206;
  }

  return v6;
}

- (int)setEventCallout:(void *)a3 callbackTarget:(void *)a4 callbackRefcon:(void *)a5
{
  self->_eventCallbackTarget = a4;
  self->_eventCallbackRefcon = a5;
  self->_eventCallback = a3;
  return objc_msgSend_setValueAvailableCallback_context_(self, a2, (uint64_t)sub_24076C58C, (uint64_t)self, (uint64_t)a5);
}

- (IOHIDObsoleteQueueClass)initWithDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IOHIDObsoleteQueueClass;
  v5 = [(IOHIDQueueClass *)&v12 initWithDevice:v4];
  if (v5)
  {
    int v6 = (char *)malloc_type_malloc(0x90uLL, 0x80040BBECCAC1uLL);
    v5->_interface = (IOHIDQueueInterface *)v6;
    vtbl = v5->super.super._vtbl;
    Release = vtbl->Release;
    long long v9 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)int v6 = v5;
    *(_OWORD *)(v6 + 8) = v9;
    *((void *)v6 + 3) = Release;
    *((void *)v6 + 4) = sub_24076C7D4;
    *((void *)v6 + 5) = sub_24076C854;
    *((void *)v6 + 6) = sub_24076C86C;
    *((void *)v6 + 7) = sub_24076C88C;
    *((void *)v6 + 8) = sub_24076C8A4;
    *((void *)v6 + 9) = sub_24076C8AC;
    *((void *)v6 + 10) = sub_24076C8B4;
    *((void *)v6 + 11) = sub_24076C938;
    *((void *)v6 + 12) = sub_24076C9BC;
    *((void *)v6 + 13) = sub_24076CA50;
    *((void *)v6 + 14) = sub_24076CA5C;
    *((void *)v6 + 15) = sub_24076CA68;
    *((void *)v6 + 16) = sub_24076CA78;
    *((void *)v6 + 17) = sub_24076CA90;
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  free(self->_interface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDObsoleteQueueClass;
  [(IOHIDQueueClass *)&v3 dealloc];
}

@end
@interface IOHIDObsoleteDeviceClass
- (IOHIDObsoleteDeviceClass)init;
- (IOHIDOutputTransactionInterface)allocOutputTransaction;
- (IOHIDQueueInterface)allocQueue;
- (int)copyMatchingElements:(__CFDictionary *)a3 element:(const __CFArray *)a4;
- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4;
- (int)setInterruptReportHandlerCallback:(void *)a3 reportBufferSize:(unsigned int)a4 callback:(void *)a5 callbackTarget:(void *)a6 callbackRefcon:(void *)a7;
- (int)setRemovalCallback:(void *)a3 removalTarget:(void *)a4 removalRefcon:(void *)a5;
- (int)start:(id)a3 service:(unsigned int)a4;
- (void)dealloc;
@end

@implementation IOHIDObsoleteDeviceClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  uint64_t v5 = *(void *)&a3.var8;
  uint64_t v6 = *(void *)&a3.var0;
  CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v8, v9)
    || (CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v8, v10)))
  {
    uint64_t v11 = 16;
LABEL_4:
    *a4 = (char *)self + v11;
    CFRetain(self);
    int Interface_outInterface = 0;
    goto LABEL_5;
  }
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v14)
    || (CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xB7u, 0xAu, 0xBFu, 0x31u, 0x16u, 0xD5u, 0x11u, 0xD7u, 0xABu, 0x35u, 0, 3u, 0x93u, 0x99u, 0x2Eu, 0x38u), CFEqual(v8, v15)))
  {
    uint64_t v11 = 176;
    goto LABEL_4;
  }
  CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v16))
  {
    v17 = IOHIDObsoleteQueueClass;
LABEL_15:
    id v19 = [v17 alloc];
    v23 = objc_msgSend_initWithDevice_(v19, v20, (uint64_t)self, v21, v22);
    int Interface_outInterface = objc_msgSend_queryInterface_outInterface_(v23, v24, v6, v5, (uint64_t)a4);

    goto LABEL_5;
  }
  CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v18))
  {
    v17 = IOHIDOutputTransactionClass;
    goto LABEL_15;
  }
  int Interface_outInterface = -2147483644;
LABEL_5:
  if (v8) {
    CFRelease(v8);
  }
  return Interface_outInterface;
}

- (int)setRemovalCallback:(void *)a3 removalTarget:(void *)a4 removalRefcon:(void *)a5
{
  self->_removalTarget = a4;
  self->_removalRefcon = a5;
  self->_removalCallback = a3;
  if (self->_notification) {
    return 0;
  }
  else {
    return IOServiceAddInterestNotification(self->_notifyPort, self->super._service, "IOGeneralInterest", (IOServiceInterestCallback)sub_240774378, self, &self->_notification);
  }
}

- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  int v5 = -536870206;
  if (a4)
  {
    uint64_t v6 = *(void *)&a5;
    v47.receiver = self;
    v47.super_class = (Class)IOHIDObsoleteDeviceClass;
    CFUUIDRef v9 = [(IOHIDDeviceClass *)&v47 getElement:*(void *)&a3];
    IOHIDValueRef value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
    if (v9)
    {
      v45.receiver = self;
      v45.super_class = (Class)IOHIDObsoleteDeviceClass;
      int v10 = [(IOHIDDeviceClass *)&v45 getValue:v9 value:&value timeout:0 callback:0 context:0 options:v6];
      if (v10)
      {
        return v10;
      }
      else
      {
        IOHIDElementRef Element = IOHIDValueGetElement(value);
        v12 = [HIDLibElement alloc];
        CFUUIDRef v16 = objc_msgSend_initWithElementRef_(v12, v13, (uint64_t)Element, v14, v15);
        objc_msgSend_setValueRef_(v16, v17, (uint64_t)value, v18, v19);
        uint32_t v24 = objc_msgSend_length(v16, v20, v21, v22, v23);
        a4->type = objc_msgSend_type(v16, v25, v26, v27, v28);
        a4->elementCookie = objc_msgSend_elementCookie(v16, v29, v30, v31, v32);
        a4->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v16, v33, v34, v35, v36);
        size_t v41 = v24;
        if (v24 < 5uLL)
        {
          a4->longValueSize = 0;
          a4->longValue = 0;
          a4->IOHIDValueRef value = objc_msgSend_integerValue(v16, v37, v38, v39, v40);
        }
        else
        {
          a4->longValueSize = v24;
          v42 = malloc_type_malloc(v24, 0xC99CBB23uLL);
          a4->longValue = v42;
          BytePtr = IOHIDValueGetBytePtr(value);
          memmove(v42, BytePtr, v41);
        }

        return 0;
      }
    }
  }
  return v5;
}

- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4
{
  int v4 = -536870212;
  if (!a4) {
    return -536870206;
  }
  v12.receiver = self;
  v12.super_class = (Class)IOHIDObsoleteDeviceClass;
  uint64_t v6 = [(IOHIDDeviceClass *)&v12 getElement:*(void *)&a3];
  uint64_t v7 = _IOHIDValueCreateWithStruct();
  CFUUIDRef v8 = (const void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (!v7) {
      return v4;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOHIDObsoleteDeviceClass;
    int v4 = [(IOHIDDeviceClass *)&v11 setValue:v6 value:v7 timeout:0 callback:0 context:0 options:0];
  }
  CFRelease(v8);
  return v4;
}

- (IOHIDQueueInterface)allocQueue
{
  uint64_t v6 = 0;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_(self, *(const char **)&v4.byte8, *(uint64_t *)&v4.byte0, *(uint64_t *)&v4.byte8, (uint64_t)&v6);
  return v6;
}

- (IOHIDOutputTransactionInterface)allocOutputTransaction
{
  uint64_t v6 = 0;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_(self, *(const char **)&v4.byte8, *(uint64_t *)&v4.byte0, *(uint64_t *)&v4.byte8, (uint64_t)&v6);
  return v6;
}

- (int)copyMatchingElements:(__CFDictionary *)a3 element:(const __CFArray *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IOHIDObsoleteDeviceClass;
  return [(IOHIDDeviceClass *)&v5 copyMatchingElements:a3 elements:a4 options:1];
}

- (int)setInterruptReportHandlerCallback:(void *)a3 reportBufferSize:(unsigned int)a4 callback:(void *)a5 callbackTarget:(void *)a6 callbackRefcon:(void *)a7
{
  self->_reportCallbackTarget = a6;
  self->_reportCallbackRefcon = a7;
  self->_reportCallback = a5;
  return MEMORY[0x270F9A6D0](self, sel_setInputReportCallback_reportLength_callback_context_options_, a3, a4, sub_2407747F0);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IOHIDObsoleteDeviceClass;
  [(IOHIDDeviceClass *)&v10 start:a3 service:*(void *)&a4];
  objc_msgSend_initQueue(self, v5, v6, v7, v8);
  return 0;
}

- (IOHIDObsoleteDeviceClass)init
{
  v10.receiver = self;
  v10.super_class = (Class)IOHIDObsoleteDeviceClass;
  v2 = [(IOHIDDeviceClass *)&v10 init];
  if (v2)
  {
    CFUUIDRef v3 = (char *)malloc_type_malloc(0xB0uLL, 0x80040F50BA72EuLL);
    v2->_interface = (IOHIDDeviceInterface122 *)v3;
    vtbl = v2->super.super.super._vtbl;
    Release = vtbl->Release;
    long long v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)CFUUIDRef v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((void *)v3 + 3) = Release;
    *((void *)v3 + 4) = sub_240774A5C;
    *((void *)v3 + 5) = sub_240774AD4;
    *((void *)v3 + 6) = sub_240774AF0;
    *((void *)v3 + 7) = sub_240774B14;
    *((void *)v3 + 8) = sub_240774B30;
    *((void *)v3 + 9) = sub_240774B40;
    *((void *)v3 + 10) = sub_240774B50;
    *((void *)v3 + 11) = sub_240774B68;
    *((void *)v3 + 12) = sub_240774B80;
    *((void *)v3 + 13) = sub_240774B94;
    *((void *)v3 + 14) = sub_240774BAC;
    *((void *)v3 + 15) = sub_240774BC8;
    *((void *)v3 + 16) = sub_240774BE4;
    *((void *)v3 + 17) = sub_240774BF0;
    *((void *)v3 + 18) = sub_240774BFC;
    *((void *)v3 + 19) = sub_240774C48;
    *((void *)v3 + 20) = sub_240774D14;
    *((void *)v3 + 21) = sub_240774D28;
    uint64_t v7 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    v2->_notifyPort = v7;
    IONotificationPortSetDispatchQueue(v7, MEMORY[0x263EF83A0]);
    uint64_t v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  free(self->_interface);
  notifyPort = self->_notifyPort;
  if (notifyPort) {
    IONotificationPortDestroy(notifyPort);
  }
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  v5.receiver = self;
  v5.super_class = (Class)IOHIDObsoleteDeviceClass;
  [(IOHIDDeviceClass *)&v5 dealloc];
}

@end
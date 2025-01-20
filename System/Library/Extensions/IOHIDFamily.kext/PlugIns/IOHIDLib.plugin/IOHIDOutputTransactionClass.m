@interface IOHIDOutputTransactionClass
- (IOHIDOutputTransactionClass)initWithDevice:(id)a3;
- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5;
- (void)dealloc;
@end

@implementation IOHIDOutputTransactionClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (!CFEqual(v6, v7))
  {
    int v8 = -2147483644;
    if (!v6) {
      return v8;
    }
    goto LABEL_3;
  }
  *a4 = &self->_outputInterface;
  CFRetain(self);
  int v8 = 0;
  if (v6) {
LABEL_3:
  }
    CFRelease(v6);
  return v8;
}

- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  int v5 = -536870212;
  if (!a4) {
    return -536870206;
  }
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._device);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v10, v7, v11, v12);

  uint64_t v14 = _IOHIDValueCreateWithStruct();
  v16 = (const void *)v14;
  if (Element) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (!v14) {
      return v5;
    }
  }
  else
  {
    int v5 = objc_msgSend_setValue_value_options_(self, v15, Element, v14, v6);
  }
  CFRelease(v16);
  return v5;
}

- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  if (!a4) {
    return -536870206;
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._device);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v10, v7, v11, v12);

  IOHIDValueRef value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
  int Value_value_options = objc_msgSend_getValue_value_options_(self, v14, Element, (uint64_t)&value, v5);
  if (!Value_value_options)
  {
    IOHIDElementRef v16 = IOHIDValueGetElement(value);
    BOOL v17 = [HIDLibElement alloc];
    v21 = objc_msgSend_initWithElementRef_(v17, v18, (uint64_t)v16, v19, v20);
    objc_msgSend_setValueRef_(v21, v22, (uint64_t)value, v23, v24);
    uint32_t v29 = objc_msgSend_length(v21, v25, v26, v27, v28);
    a4->type = objc_msgSend_type(v21, v30, v31, v32, v33);
    a4->elementCookie = objc_msgSend_elementCookie(v21, v34, v35, v36, v37);
    a4->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v21, v38, v39, v40, v41);
    size_t v46 = v29;
    if (v29 < 5uLL)
    {
      a4->longValueSize = 0;
      a4->longValue = 0;
      a4->IOHIDValueRef value = objc_msgSend_integerValue(v21, v42, v43, v44, v45);
    }
    else
    {
      a4->longValueSize = v29;
      v47 = malloc_type_malloc(v29, 0x791AB51BuLL);
      a4->longValue = v47;
      BytePtr = IOHIDValueGetBytePtr(value);
      memmove(v47, BytePtr, v46);
    }
  }
  return Value_value_options;
}

- (IOHIDOutputTransactionClass)initWithDevice:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IOHIDOutputTransactionClass;
  v3 = [(IOHIDTransactionClass *)&v11 initWithDevice:a3];
  v4 = v3;
  if (v3)
  {
    v3->super._direction = 1;
    uint64_t v5 = (char *)malloc_type_malloc(0x98uLL, 0x800407567D3B1uLL);
    v4->_outputInterface = (IOHIDOutputTransactionInterface *)v5;
    vtbl = v4->super.super._vtbl;
    Release = vtbl->Release;
    long long v8 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)uint64_t v5 = v4;
    *(_OWORD *)(v5 + 8) = v8;
    *((void *)v5 + 3) = Release;
    *((void *)v5 + 4) = sub_24076A278;
    *((void *)v5 + 5) = sub_24076A2F8;
    *((void *)v5 + 6) = sub_24076A340;
    *((void *)v5 + 7) = sub_24076A38C;
    *((void *)v5 + 8) = sub_24076A3D4;
    *((void *)v5 + 9) = sub_24076A3DC;
    *((void *)v5 + 10) = sub_24076A3E4;
    *((void *)v5 + 11) = sub_24076A458;
    *((void *)v5 + 12) = sub_24076A4CC;
    *((void *)v5 + 13) = sub_24076A54C;
    *((void *)v5 + 14) = sub_24076A564;
    *((void *)v5 + 15) = sub_24076A57C;
    *((void *)v5 + 16) = sub_24076A594;
    *((void *)v5 + 17) = sub_24076A5AC;
    *((void *)v5 + 18) = sub_24076A5C8;
    v9 = v4;
  }

  return v4;
}

- (void)dealloc
{
  free(self->_outputInterface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDOutputTransactionClass;
  [(IOHIDTransactionClass *)&v3 dealloc];
}

@end
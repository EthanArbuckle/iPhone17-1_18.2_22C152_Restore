@interface GCHIDInputElement
- (BOOL)isEqual:(id)a3;
- (GCHIDInputElement)init;
- (GCHIDInputElement)initWithElement:(id)a3;
- (HIDElement)element;
- (__IOHIDValue)value;
- (double)scaledValue:(int64_t)a3;
- (id)description;
- (id)registerScaled:(int64_t)a3 valueChangedHandler:(id)a4;
- (id)registerValueChangedHandler:(id)a3;
- (unint64_t)hash;
- (void)addScaled:(int64_t)a3 valueChangedHandler:(id)a4;
- (void)addValueChangedHandler:(id)a3;
- (void)dealloc;
- (void)valueChanged:(void *)a1;
@end

@implementation GCHIDInputElement

- (GCHIDInputElement)initWithElement:(id)a3
{
  v4 = (HIDElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GCHIDInputElement;
  v5 = [(GCHIDInputElement *)&v8 init];
  element = v5->_element;
  v5->_element = v4;

  v5->_observers.tqh_first = 0;
  v5->_observers.tqh_last = &v5->_observers.tqh_first;
  return v5;
}

- (GCHIDInputElement)init
{
  return 0;
}

- (void)dealloc
{
  tqh_first = self->_observers.tqh_first;
  if (tqh_first)
  {
    p_firstObserver = &self->_firstObserver;
    do
    {
      tqe_next = tqh_first->pointers.tqe_next;
      tqe_prev = tqh_first->pointers.tqe_prev;
      if (tqe_next)
      {
        tqe_next->pointers.tqe_prev = tqe_prev;
        tqe_prev = tqh_first->pointers.tqe_prev;
      }
      else
      {
        self->_observers.tqh_last = tqe_prev;
      }
      *tqe_prev = tqe_next;
      handler = tqh_first->_handler;
      tqh_first->_handler = 0;

      tqh_first->var0 = 0x8000000000000000;
      if (tqh_first != p_firstObserver) {
        free(tqh_first);
      }
      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  value = self->_value;
  if (value)
  {
    CFRelease(value);
    self->_value = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)GCHIDInputElement;
  [(GCHIDInputElement *)&v9 dealloc];
}

- (double)scaledValue:(int64_t)a3
{
  v5 = [(GCHIDInputElement *)self value];
  IOHIDValueRef pValue = v5;
  if (!v5)
  {
    v6 = [(GCHIDInputElement *)self element];

    Device = IOHIDElementGetDevice((IOHIDElementRef)v6);
    IOHIDDeviceGetValue(Device, (IOHIDElementRef)v6, &pValue);
    v5 = pValue;
    if (!pValue) {
      return 0.0;
    }
  }
  switch(a3)
  {
    case -2:
      double result = (double)IOHIDValueGetIntegerValue(v5);
      break;
    case -1:
      CFIndex IntegerValue = IOHIDValueGetIntegerValue(v5);
      Element = IOHIDValueGetElement(pValue);
      CFIndex LogicalMin = IOHIDElementGetLogicalMin(Element);
      v12 = IOHIDValueGetElement(pValue);
      CFIndex LogicalMax = IOHIDElementGetLogicalMax(v12);
      if (LogicalMax >= IntegerValue) {
        uint64_t v14 = IntegerValue;
      }
      else {
        uint64_t v14 = LogicalMax;
      }
      if (LogicalMin > v14) {
        uint64_t v14 = LogicalMin;
      }
      double result = (double)v14;
      break;
    case 0:
    case 1:
    case 2:
      double result = IOHIDValueGetScaledValue(v5, a3);
      break;
    default:
      IOHIDValueGetBytePtr(v5);
      IOHIDValueGetLength(pValue);
      __memcpy_chk();
      double result = (double)0;
      break;
  }
  return result;
}

- (void)addValueChangedHandler:(id)a3
{
  id v5 = _Block_copy(a3);
  id v4 = PushValueChangedHandler(self, v5, 0x8000000000000000, 0);
}

- (void)addScaled:(int64_t)a3 valueChangedHandler:(id)a4
{
  id v7 = _Block_copy(a4);
  id v6 = PushValueChangedHandler(self, v7, a3, 0);
}

- (id)registerValueChangedHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id v5 = PushValueChangedHandler(self, v4, 0x8000000000000000, 1);

  return v5;
}

- (id)registerScaled:(int64_t)a3 valueChangedHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = PushValueChangedHandler(self, v6, a3, 1);

  return v7;
}

- (void)valueChanged:(void *)a1
{
  if (a1)
  {
    objc_setProperty(a1, sel_valueChanged_, 16, newValue, 0, 0);
    id v4 = (void *)a1[3];
    if (v4)
    {
      while (2)
      {
        id v5 = v4;
        id v4 = (void *)v4[2];
        uint64_t v6 = v5[1];
        switch(v6)
        {
          case -3:
            IOHIDValueGetBytePtr((IOHIDValueRef)newValue);
            IOHIDValueGetLength((IOHIDValueRef)newValue);
            __memcpy_chk();
            uint64_t v8 = *v5;
            v7.n128_f64[0] = (double)0;
            goto LABEL_16;
          case -2:
            v7.n128_f64[0] = (double)IOHIDValueGetIntegerValue((IOHIDValueRef)newValue);
            goto LABEL_15;
          case -1:
            CFIndex IntegerValue = IOHIDValueGetIntegerValue((IOHIDValueRef)newValue);
            Element = IOHIDValueGetElement((IOHIDValueRef)newValue);
            CFIndex LogicalMin = IOHIDElementGetLogicalMin(Element);
            v12 = IOHIDValueGetElement((IOHIDValueRef)newValue);
            CFIndex LogicalMax = IOHIDElementGetLogicalMax(v12);
            if (LogicalMax >= IntegerValue) {
              uint64_t v14 = IntegerValue;
            }
            else {
              uint64_t v14 = LogicalMax;
            }
            if (LogicalMin > v14) {
              uint64_t v14 = LogicalMin;
            }
            v7.n128_f64[0] = (double)v14;
            goto LABEL_15;
          case 0:
          case 1:
          case 2:
            v7.n128_f64[0] = IOHIDValueGetScaledValue((IOHIDValueRef)newValue, v6);
LABEL_15:
            uint64_t v8 = *v5;
LABEL_16:
            (*(void (**)(uint64_t, void *, id, __n128))(v8 + 16))(v8, a1, newValue, v7);
            if (!v4) {
              return;
            }
            continue;
          default:
            (*(void (**)(void))(*v5 + 16))();
            if (v4) {
              continue;
            }
            return;
        }
      }
    }
  }
}

- (unint64_t)hash
{
  v2 = [(GCHIDInputElement *)self element];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(GCHIDInputElement *)self element];
    uint64_t v6 = [v4 element];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFTypeID v8 = CFGetTypeID(v4);
      if (v8 != IOHIDElementGetTypeID())
      {
        char v7 = 0;
        goto LABEL_7;
      }
    }
    id v5 = [(GCHIDInputElement *)self element];
    char v7 = [v5 isEqual:v4];
  }

LABEL_7:
  return v7;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(GCHIDInputElement *)self element];
  uint64_t Cookie = IOHIDElementGetCookie(v5);
  char v7 = [(GCHIDInputElement *)self element];
  CFTypeID v8 = [v7 description];
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"<%@; cookie: %u %@>",
    v4,
    Cookie,
  objc_super v9 = v8);

  return v9;
}

- (HIDElement)element
{
  return (HIDElement *)objc_getProperty(self, a2, 8, 1);
}

- (__IOHIDValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
}

@end
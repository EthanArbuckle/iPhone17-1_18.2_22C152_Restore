@interface HIDLibElement
- (BOOL)isConstant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHIDLibElement:(id)a3;
- (BOOL)isUpdated;
- (HIDLibElement)initWithElementRef:(__IOHIDElement *)a3;
- (HIDLibElement)initWithElementStruct:(IOHIDElementStruct *)a3 parent:(__IOHIDElement *)a4 index:(unsigned int)a5;
- (IOHIDElementStruct)elementStruct;
- (NSData)dataValue;
- (NSString)psKey;
- (__IOHIDElement)elementRef;
- (__IOHIDValue)defaultValueRef;
- (__IOHIDValue)valueRef;
- (id)description;
- (int)collectionType;
- (int)type;
- (int64_t)integerValue;
- (int64_t)length;
- (unint64_t)timestamp;
- (unsigned)collectionCookie;
- (unsigned)elementCookie;
- (unsigned)reportID;
- (unsigned)unit;
- (unsigned)unitExponent;
- (unsigned)usage;
- (unsigned)usageMax;
- (unsigned)usageMin;
- (unsigned)usagePage;
- (void)dealloc;
- (void)setDataValue:(id)a3;
- (void)setDefaultValueRef:(__IOHIDValue *)a3;
- (void)setElementRef:(__IOHIDElement *)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setIsConstant:(BOOL)a3;
- (void)setIsUpdated:(BOOL)a3;
- (void)setPsKey:(id)a3;
- (void)setValueRef:(__IOHIDValue *)a3;
@end

@implementation HIDLibElement

- (HIDLibElement)initWithElementRef:(__IOHIDElement *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HIDLibElement;
  v4 = [(HIDLibElement *)&v8 init];
  if (v4) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    CFRetain(a3);
    v4->_element = a3;
    v6 = v4;
  }

  return v6;
}

- (HIDLibElement)initWithElementStruct:(IOHIDElementStruct *)a3 parent:(__IOHIDElement *)a4 index:(unsigned int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)HIDLibElement;
  v6 = [(HIDLibElement *)&v11 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  v6->_element = 0;
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1);
  memmove(&v7->_elementStruct, a3, 0x60uLL);
  if (Mutable)
  {
    v7->_element = (__IOHIDElement *)_IOHIDElementCreateWithParentAndData();
    CFRelease(Mutable);
  }
  if (v7->_element) {
    v9 = v7;
  }
  else {
LABEL_6:
  }
    v9 = 0;

  return v9;
}

- (void)dealloc
{
  defaultValue = self->_defaultValue;
  if (defaultValue) {
    CFRelease(defaultValue);
  }
  element = self->_element;
  if (element) {
    CFRelease(element);
  }
  v5.receiver = self;
  v5.super_class = (Class)HIDLibElement;
  [(HIDLibElement *)&v5 dealloc];
}

- (id)description
{
  v6 = NSString;
  element = self->_element;
  uint64_t v8 = objc_msgSend_type(self, a2, v2, v3, v4);
  uint64_t v13 = objc_msgSend_usagePage(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_usage(self, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_elementCookie(self, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_integerValue(self, v24, v25, v26, v27);
  return (id)objc_msgSend_stringWithFormat_(v6, v29, @"element: %p type: %d uP: 0x%02x u: 0x%02x cookie: %d val: %ld", v30, v31, element, v8, v13, v18, v23, v28);
}

- (BOOL)isEqualToHIDLibElement:(id)a3
{
  return a3 && self->_element == (__IOHIDElement *)*((void *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HIDLibElement *)a3;
  if (self == v4)
  {
    char isEqualToHIDLibElement = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToHIDLibElement = objc_msgSend_isEqualToHIDLibElement_(self, v5, (uint64_t)v4, v6, v7);
    }
    else {
      char isEqualToHIDLibElement = 0;
    }
  }

  return isEqualToHIDLibElement;
}

- (__IOHIDElement)elementRef
{
  return self->_element;
}

- (void)setElementRef:(__IOHIDElement *)a3
{
  element = self->_element;
  if (element != a3)
  {
    if (element) {
      CFRelease(element);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_element = a3;
  }
}

- (__IOHIDValue)valueRef
{
  result = self->_element;
  if (result) {
    return (__IOHIDValue *)MEMORY[0x270EF4B80](result, a2);
  }
  return result;
}

- (void)setValueRef:(__IOHIDValue *)a3
{
  if (self->_element) {
    MEMORY[0x270EF4B90]();
  }
}

- (__IOHIDValue)defaultValueRef
{
  return self->_defaultValue;
}

- (void)setDefaultValueRef:(__IOHIDValue *)a3
{
  defaultValue = self->_defaultValue;
  if (defaultValue != a3)
  {
    if (defaultValue) {
      CFRelease(defaultValue);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_defaultValue = a3;
  }
}

- (int64_t)integerValue
{
  int64_t result = objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (result)
  {
    uint64_t v11 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    return IOHIDValueGetIntegerValue(v11);
  }
  return result;
}

- (void)setIntegerValue:(int64_t)a3
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  element = self->_element;
  uint64_t v7 = mach_absolute_time();
  IOHIDValueRef v8 = IOHIDValueCreateWithIntegerValue(v5, element, v7, a3);
  objc_msgSend_setValueRef_(self, v9, (uint64_t)v8, v10, v11);
  if (v8)
  {
    CFRelease(v8);
  }
}

- (NSData)dataValue
{
  uint64_t v6 = objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (v6)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v12 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    BytePtr = IOHIDValueGetBytePtr(v12);
    uint64_t v18 = (__IOHIDValue *)objc_msgSend_valueRef(self, v14, v15, v16, v17);
    CFIndex Length = IOHIDValueGetLength(v18);
    uint64_t v6 = objc_msgSend_dataWithBytes_length_(v11, v20, (uint64_t)BytePtr, Length, v21);
  }

  return (NSData *)v6;
}

- (void)setDataValue:(id)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  element = self->_element;
  id v6 = a3;
  uint64_t v11 = (const uint8_t *)objc_msgSend_bytes(v6, v7, v8, v9, v10);
  CFIndex v16 = objc_msgSend_length(v6, v12, v13, v14, v15);

  IOHIDValueRef v17 = IOHIDValueCreateWithBytes(v4, element, 0, v11, v16);
  objc_msgSend_setValueRef_(self, v18, (uint64_t)v17, v19, v20);
  if (v17)
  {
    CFRelease(v17);
  }
}

- (unint64_t)timestamp
{
  unint64_t result = objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (result)
  {
    uint64_t v11 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    return IOHIDValueGetTimeStamp(v11);
  }
  return result;
}

- (int64_t)length
{
  int64_t result = (int64_t)self->_element;
  if (result) {
    return _IOHIDElementGetLength();
  }
  return result;
}

- (unsigned)elementCookie
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetCookie(element);
  }
  return element;
}

- (unsigned)collectionCookie
{
  return self->_elementStruct.parentCookie;
}

- (int)type
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetType(element);
  }
  return (int)element;
}

- (unsigned)usage
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetUsage(element);
  }
  return element;
}

- (unsigned)usagePage
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetUsagePage(element);
  }
  return element;
}

- (unsigned)unit
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetUnit(element);
  }
  return element;
}

- (unsigned)unitExponent
{
  element = self->_element;
  if (element) {
    LOBYTE(element) = IOHIDElementGetUnitExponent(element);
  }
  return element;
}

- (unsigned)reportID
{
  element = self->_element;
  if (element) {
    LOBYTE(element) = IOHIDElementGetReportID(element);
  }
  return element;
}

- (unsigned)usageMin
{
  return self->_elementStruct.usageMin;
}

- (unsigned)usageMax
{
  return self->_elementStruct.usageMax;
}

- (int)collectionType
{
  element = self->_element;
  if (element) {
    LODWORD(element) = IOHIDElementGetCollectionType(element);
  }
  return (int)element;
}

- (NSString)psKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPsKey:(id)a3
{
}

- (IOHIDElementStruct)elementStruct
{
  objc_copyStruct(retstr, &self->_elementStruct, 96, 1, 0);
  return result;
}

- (BOOL)isConstant
{
  return self->_isConstant;
}

- (void)setIsConstant:(BOOL)a3
{
  self->_isConstant = a3;
}

- (BOOL)isUpdated
{
  return self->_isUpdated;
}

- (void)setIsUpdated:(BOOL)a3
{
  self->_isUpdated = a3;
}

- (void).cxx_destruct
{
}

@end
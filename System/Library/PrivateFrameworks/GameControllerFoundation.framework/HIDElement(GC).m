@interface HIDElement(GC)
- (id)calibrationMax;
- (id)calibrationMin;
- (id)debugDescription;
- (id)valueForElementKey:()GC;
- (id)valueForKey:()GC;
- (uint64_t)flags;
- (uint64_t)setCalibrationMax:()GC;
- (uint64_t)setCalibrationMin:()GC;
- (uint64_t)setName:()GC;
- (uint64_t)size;
- (uint64_t)usageType;
- (uint64_t)usageTypeIndex;
- (uint64_t)valueRef;
@end

@implementation HIDElement(GC)

- (uint64_t)valueRef
{
  return MEMORY[0x270EF4B80]();
}

- (uint64_t)usageType
{
  v1 = IOHIDElementGetProperty(a1, @"UsageType");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)usageTypeIndex
{
  v1 = IOHIDElementGetProperty(a1, @"UsageTypeIndex");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = -1;
  }

  return v2;
}

- (uint64_t)size
{
  return MEMORY[0x270EF4B78]();
}

- (uint64_t)flags
{
  return MEMORY[0x270EF4B70]();
}

- (uint64_t)setName:()GC
{
  return IOHIDElementSetProperty(a1, @"Name", a3);
}

- (id)calibrationMin
{
  id Property = (id)IOHIDElementGetProperty(a1, @"CalibrationMin");
  if (Property)
  {
    uint64_t v2 = Property;
    CFTypeID v3 = CFGetTypeID(Property);
    if (v3 == CFNumberGetTypeID()) {
      id Property = v2;
    }
    else {
      id Property = 0;
    }
  }

  return Property;
}

- (uint64_t)setCalibrationMin:()GC
{
  return IOHIDElementSetProperty(a1, @"CalibrationMin", a3);
}

- (id)calibrationMax
{
  id Property = (id)IOHIDElementGetProperty(a1, @"CalibrationMax");
  if (Property)
  {
    uint64_t v2 = Property;
    CFTypeID v3 = CFGetTypeID(Property);
    if (v3 == CFNumberGetTypeID()) {
      id Property = v2;
    }
    else {
      id Property = 0;
    }
  }

  return Property;
}

- (uint64_t)setCalibrationMax:()GC
{
  return IOHIDElementSetProperty(a1, @"CalibrationMax", a3);
}

- (id)valueForElementKey:()GC
{
  id v4 = a3;
  v5 = GCHIDElementAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v10 = [a1 valueForKey:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForKey:()GC
{
  id v4 = a3;
  v5 = GCHIDElementAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    uint64_t v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);

    id v4 = (id)v9;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&off_26BEEAE00;
  v10 = objc_msgSendSuper2(&v12, sel_valueForKey_, v4);

  return v10;
}

- (id)debugDescription
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26BEEAE00;
  uint64_t v2 = objc_msgSendSuper2(&v8, sel_debugDescription);
  uint64_t v3 = [a1 elementCookie];
  uint64_t v4 = [a1 type];
  v5 = [a1 name];
  int v6 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"%@ {\n\t elementCookie = %u\n\t type = %zi\n\t name = %@\n\t usageType = %zd\n\t usageTypeIndex = %zd\n\t usage = %zd\n\t usagePage = %zd\n}", v2, v3, v4, v5, [a1 usageType], objc_msgSend(a1, "usageTypeIndex"), objc_msgSend(a1, "usage"), objc_msgSend(a1, "usagePage"));

  return v6;
}

@end
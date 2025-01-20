@interface __NSCFNumber
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (BOOL)isNSNumber__;
- (__NSCFNumber)retain;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)stringValue;
- (int)intValue;
- (int64_t)_cfNumberType;
- (int64_t)_reverseCompare:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)_cfTypeID;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)release;
@end

@implementation __NSCFNumber

- (void)release
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    _CFNonObjCRelease();
  }
}

- (__NSCFNumber)retain
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    return (__NSCFNumber *)_CFNonObjCRetain((unint64_t *)self);
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    return _CFNonObjCRetain((unint64_t *)self);
  }
  return self;
}

- (unint64_t)unsignedLongLongValue
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  uint64_t valuePtr = 0;
  unint64_t v4 = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, &valuePtr);
  return v4;
}

- (unint64_t)unsignedLongValue
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  uint64_t valuePtr = 0;
  unint64_t v4 = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, &valuePtr);
  return v4;
}

- (int64_t)longValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (int)intValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (double)doubleValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberDoubleType, v3);
  return *(double *)v3;
}

- (BOOL)isEqualToNumber:(id)a3
{
  return self == a3 || -[__NSCFNumber compare:](self, "compare:", v3, v4) == 0;
}

- (int64_t)compare:(id)a3
{
  if (!a3) {
    -[__NSCFNumber compare:]((objc_class *)self, a2);
  }
  if (self == a3) {
    return 0;
  }
  int v5 = *(unsigned __int8 *)[a3 objCType];
  v6 = [(__NSCFNumber *)self objCType];
  if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
  {
    [(__NSCFNumber *)self doubleValue];
    double v13 = v12;
    [a3 doubleValue];
    if (v13 >= v14) {
      return v14 < v13;
    }
    return -1;
  }
  if (v5 == 81 && v7 == 81)
  {
    unint64_t v8 = [(__NSCFNumber *)self unsignedLongLongValue];
    unint64_t v9 = [a3 unsignedLongLongValue];
    if (v8 >= v9) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = -1;
    }
    if (v8 > v9) {
      return 1;
    }
    else {
      return v10;
    }
  }
  if (v7 == 81 && ([(__NSCFNumber *)self unsignedLongLongValue] & 0x8000000000000000) != 0) {
    return 1;
  }
  if (v5 == 81 && [a3 unsignedLongLongValue] < 0) {
    return -1;
  }
  int64_t v15 = [(__NSCFNumber *)self longLongValue];
  uint64_t v16 = [a3 longLongValue];
  if (v15 >= v16) {
    int64_t v17 = 0;
  }
  else {
    int64_t v17 = -1;
  }
  if (v15 > v16) {
    return 1;
  }
  else {
    return v17;
  }
}

- (const)objCType
{
  result = (const char *)_CFNumberGetType2((unint64_t *)self);
  uint64_t v3 = result - 1;
  if (unint64_t)(result - 1) < 0x11 && ((0x1003Fu >> (char)v3)) {
    return off_1ECDB0198[(void)v3];
  }
  __break(1u);
  return result;
}

- (int64_t)longLongValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (BOOL)BOOLValue
{
  v5[1] = *(double *)off_1ECE0A5B0;
  v5[0] = 0.0;
  if (CFNumberIsFloatType((CFNumberRef)self))
  {
    CFNumberGetValue((CFNumberRef)self, kCFNumberDoubleType, v5);
    BOOL v3 = v5[0] == 0.0;
  }
  else
  {
    CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v5);
    BOOL v3 = *(void *)&v5[0] == 0;
  }
  return !v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      int v5 = _NSIsNSNumber((uint64_t)a3);
      if (v5)
      {
        LOBYTE(v5) = [(__NSCFNumber *)self isEqualToNumber:a3];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isNSNumber__
{
  return 1;
}

- (unsigned)unsignedIntValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (float)floatValue
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  float valuePtr = 0.0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberFloatType, &valuePtr);
  return valuePtr;
}

- (signed)shortValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (unsigned)unsignedShortValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (id)stringValue
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (objc_lookUpClass("NSNumber"))
  {
    v5.receiver = self;
    v5.super_class = (Class)__NSCFNumber;
    return [(__NSCFNumber *)&v5 stringValue];
  }
  else
  {
    FormattingDescription = (__CFString *)__CFNumberCreateFormattingDescription((const __CFAllocator *)&__kCFAllocatorSystemDefault, (uint64_t)self);
    return FormattingDescription;
  }
}

- (id)description
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (objc_lookUpClass("NSNumber"))
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFNumber;
    return [(__NSCFType *)&v4 description];
  }
  else
  {
    return [(__NSCFNumber *)self descriptionWithLocale:0];
  }
}

- (id)descriptionWithLocale:(id)a3
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (objc_lookUpClass("NSNumber"))
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSCFNumber;
    return [(__NSCFNumber *)&v7 descriptionWithLocale:a3];
  }
  else
  {
    uint64_t v6 = (__CFString *)__CFNumberCopyFormattingDescription((uint64_t)self);
    return v6;
  }
}

- (unsigned)unsignedCharValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (char)charValue
{
  v3[1] = *(void *)off_1ECE0A5B0;
  v3[0] = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberSInt64Type, v3);
  return v3[0];
}

- (void)getValue:(void *)a3
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)self);
LABEL_8:
    CFNumberGetValue((CFNumberRef)self, Type, a3);
    return;
  }
  CFNumberType Type = _CFNumberGetType2((unint64_t *)self);
  if (Type != (kCFNumberMaxType|kCFNumberSInt8Type)) {
    goto LABEL_8;
  }
  uint64_t valuePtr = 0;
  uint64_t v8 = 0;
  CFNumberGetValue((CFNumberRef)self, kCFNumberMaxType|kCFNumberSInt8Type, &valuePtr);
  if (valuePtr) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = v8;
  }
  *(void *)a3 = v6;
}

- (int64_t)_reverseCompare:(id)a3
{
  int64_t v3 = [(__NSCFNumber *)self compare:a3];
  if (v3 == 1) {
    int64_t v4 = -1;
  }
  else {
    int64_t v4 = 0;
  }
  if (v3 == -1) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)_cfTypeID
{
  return 22;
}

- (int64_t)_cfNumberType
{
  int v3 = *[(__NSCFNumber *)self objCType];
  int64_t result = 7;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if (([(__NSCFNumber *)self unsignedIntValue] & 0x80000000) != 0) {
          return 11;
        }
        else {
          return 9;
        }
      }
      else
      {
        if (v3 != 76) {
          goto LABEL_24;
        }
        if (([(__NSCFNumber *)self unsignedLongValue] & 0x8000000000000000) == 0) {
          return 10;
        }
        else {
          return 11;
        }
      }
    }
    else if (v3 != 66)
    {
      if (v3 == 67) {
        return 8;
      }
      goto LABEL_24;
    }
  }
  else
  {
    switch(v3)
    {
      case 'c':
        return result;
      case 'd':
        return 13;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_24;
      case 'f':
        return 12;
      case 'i':
        return 9;
      case 'l':
        return 10;
      case 'q':
        return 11;
      case 's':
        return 8;
      default:
        if (v3 != 81)
        {
          if (v3 == 83) {
            return 9;
          }
LABEL_24:
          __break(1u);
          JUMPOUT(0x182CC987CLL);
        }
        int64_t result = 17;
        break;
    }
  }
  return result;
}

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      *(unsigned char *)a3 = [(__NSCFNumber *)self charValue];
      break;
    case 2:
      *(_WORD *)a3 = [(__NSCFNumber *)self shortValue];
      break;
    case 3:
      *(_DWORD *)a3 = [(__NSCFNumber *)self intValue];
      break;
    case 4:
      *(void *)a3 = [(__NSCFNumber *)self longLongValue];
      break;
    case 5:
      [(__NSCFNumber *)self floatValue];
      *(_DWORD *)a3 = v5;
      break;
    case 6:
      [(__NSCFNumber *)self doubleValue];
      *(void *)a3 = v6;
      break;
    case 17:
      uint64_t v7 = [(__NSCFNumber *)self longLongValue];
      *(void *)a3 = v7 >> 63;
      *((void *)a3 + 1) = v7;
      break;
    default:
      __break(1u);
      JUMPOUT(0x182CC9968);
  }
  return 1;
}

- (void)compare:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

@end
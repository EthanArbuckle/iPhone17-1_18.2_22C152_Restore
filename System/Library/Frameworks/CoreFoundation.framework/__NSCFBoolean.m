@interface __NSCFBoolean
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (__NSCFBoolean)retain;
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
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)release;
@end

@implementation __NSCFBoolean

- (void)release
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    _CFNonObjCRelease();
  }
}

- (__NSCFBoolean)retain
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    return (__NSCFBoolean *)_CFNonObjCRetain((unint64_t *)self);
  }
  return self;
}

- (BOOL)BOOLValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
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
        LOBYTE(v5) = [(__NSCFBoolean *)self isEqualToNumber:a3];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (id)descriptionWithLocale:(id)a3
{
  if ([(__NSCFBoolean *)self BOOLValue]) {
    return @"1";
  }
  else {
    return @"0";
  }
}

- (id)description
{
  return [(__NSCFBoolean *)self descriptionWithLocale:0];
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    return _CFNonObjCRetain((unint64_t *)self);
  }
  return self;
}

- (int64_t)_reverseCompare:(id)a3
{
  int64_t v3 = [(__NSCFBoolean *)self compare:a3];
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

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      *(unsigned char *)a3 = [(__NSCFBoolean *)self charValue];
      goto LABEL_9;
    case 2:
      *(_WORD *)a3 = [(__NSCFBoolean *)self shortValue];
      goto LABEL_9;
    case 3:
      *(_DWORD *)a3 = [(__NSCFBoolean *)self intValue];
      goto LABEL_9;
    case 4:
      *(void *)a3 = [(__NSCFBoolean *)self longLongValue];
      goto LABEL_9;
    case 5:
      [(__NSCFBoolean *)self floatValue];
      *(_DWORD *)a3 = v5;
      goto LABEL_9;
    case 6:
      [(__NSCFBoolean *)self doubleValue];
      *(void *)a3 = v6;
      goto LABEL_9;
    case 17:
      uint64_t v7 = [(__NSCFBoolean *)self longLongValue];
      *(void *)a3 = v7 >> 63;
      *((void *)a3 + 1) = v7;
LABEL_9:
      LOBYTE(self) = 1;
      break;
    default:
      __break(1u);
      break;
  }
  return self;
}

- (int)intValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (signed)shortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (char)charValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)_cfNumberType
{
  int v3 = *[(__NSCFBoolean *)self objCType];
  int64_t result = 7;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if (([(__NSCFBoolean *)self unsignedIntValue] & 0x80000000) != 0) {
          return 11;
        }
        else {
          return 9;
        }
      }
      if (v3 == 76)
      {
        if (([(__NSCFBoolean *)self unsignedLongValue] & 0x8000000000000000) == 0) {
          return 10;
        }
        else {
          return 11;
        }
      }
    }
    else
    {
      if (v3 == 66) {
        return result;
      }
      if (v3 == 67) {
        return 8;
      }
    }
LABEL_24:
    __break(1u);
    return result;
  }
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
      goto LABEL_15;
    case 'l':
      return 10;
    case 'q':
      return 11;
    case 's':
      return 8;
    default:
      if (v3 == 81)
      {
        int64_t result = 17;
      }
      else
      {
        if (v3 != 83) {
          goto LABEL_24;
        }
LABEL_15:
        int64_t result = 9;
      }
      break;
  }
  return result;
}

- (BOOL)isEqualToNumber:(id)a3
{
  return self == a3 || -[__NSCFBoolean compare:](self, "compare:", v3, v4) == 0;
}

- (int64_t)compare:(id)a3
{
  if (!a3) {
    -[__NSCFBoolean compare:]((objc_class *)self, a2);
  }
  if (self == a3) {
    return 0;
  }
  int v5 = *(unsigned __int8 *)[a3 objCType];
  uint64_t v6 = [(__NSCFBoolean *)self objCType];
  if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
  {
    [(__NSCFBoolean *)self doubleValue];
    double v13 = v12;
    [a3 doubleValue];
    if (v13 >= v14) {
      return v14 < v13;
    }
    return -1;
  }
  if (v5 == 81 && v7 == 81)
  {
    unint64_t v8 = [(__NSCFBoolean *)self unsignedLongLongValue];
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
  if (v7 == 81 && ([(__NSCFBoolean *)self unsignedLongLongValue] & 0x8000000000000000) != 0) {
    return 1;
  }
  if (v5 == 81 && [a3 unsignedLongLongValue] < 0) {
    return -1;
  }
  int64_t v15 = [(__NSCFBoolean *)self longLongValue];
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
  return "c";
}

- (int64_t)longLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (double)doubleValue
{
  int Value = CFBooleanGetValue((CFBooleanRef)self);
  double result = 0.0;
  if (Value) {
    return 1.0;
  }
  return result;
}

- (unsigned)unsignedIntValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unint64_t)unsignedLongLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)longValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (float)floatValue
{
  int Value = CFBooleanGetValue((CFBooleanRef)self);
  float result = 0.0;
  if (Value) {
    return 1.0;
  }
  return result;
}

- (unint64_t)unsignedLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unsigned)unsignedCharValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (id)stringValue
{
  return [(__NSCFBoolean *)self descriptionWithLocale:0];
}

- (unsigned)unsignedShortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)getValue:(void *)a3
{
  *(unsigned char *)a3 = CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (void)compare:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

@end
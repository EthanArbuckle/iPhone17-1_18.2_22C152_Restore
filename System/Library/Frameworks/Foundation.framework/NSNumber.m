@interface NSNumber
+ (BOOL)supportsSecureCoding;
+ (NSNumber)allocWithZone:(_NSZone *)a3;
+ (NSNumber)numberWithBool:(BOOL)value;
+ (NSNumber)numberWithChar:(char)value;
+ (NSNumber)numberWithDouble:(double)value;
+ (NSNumber)numberWithFloat:(float)value;
+ (NSNumber)numberWithInt:(int)value;
+ (NSNumber)numberWithInteger:(NSInteger)value;
+ (NSNumber)numberWithLong:(uint64_t)value;
+ (NSNumber)numberWithLongLong:(uint64_t)value;
+ (NSNumber)numberWithShort:(__int16)value;
+ (NSNumber)numberWithUnsignedChar:(unsigned __int8)value;
+ (NSNumber)numberWithUnsignedInt:(unsigned int)value;
+ (NSNumber)numberWithUnsignedInteger:(NSUInteger)value;
+ (NSNumber)numberWithUnsignedLong:(unint64_t)value;
+ (NSNumber)numberWithUnsignedLongLong:(unint64_t)value;
+ (NSNumber)numberWithUnsignedShort:(unsigned __int16)value;
+ (void)initialize;
- (BOOL)BOOLValue;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(NSNumber *)number;
- (BOOL)isNSNumber__;
- (Class)classForCoder;
- (NSComparisonResult)compare:(NSNumber *)otherNumber;
- (NSDecimal)decimalValue;
- (NSNumber)initWithBool:(BOOL)value;
- (NSNumber)initWithChar:(char)value;
- (NSNumber)initWithCoder:(NSCoder *)coder;
- (NSNumber)initWithDouble:(double)value;
- (NSNumber)initWithFloat:(float)value;
- (NSNumber)initWithInt:(int)value;
- (NSNumber)initWithInteger:(NSInteger)value;
- (NSNumber)initWithLong:(uint64_t)value;
- (NSNumber)initWithLongLong:(uint64_t)value;
- (NSNumber)initWithShort:(__int16)value;
- (NSNumber)initWithUnsignedChar:(unsigned __int8)value;
- (NSNumber)initWithUnsignedInt:(unsigned int)value;
- (NSNumber)initWithUnsignedInteger:(NSUInteger)value;
- (NSNumber)initWithUnsignedLong:(unint64_t)value;
- (NSNumber)initWithUnsignedLongLong:(unint64_t)value;
- (NSNumber)initWithUnsignedShort:(unsigned __int16)value;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)stringValue;
- (__int16)shortValue;
- (char)charValue;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int)intValue;
- (int64_t)_cfNumberType;
- (int64_t)_reverseCompare:(id)a3;
- (uint64_t)longLongValue;
- (uint64_t)longValue;
- (unint64_t)hash;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSNumber

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = _NSIsNSNumber();
    if (v5)
    {
      LOBYTE(v5) = [(NSNumber *)self isEqualToNumber:a3];
    }
  }
  return v5;
}

- (BOOL)isEqualToNumber:(NSNumber *)number
{
  return self == number || -[NSNumber compare:](self, "compare:", v3, v4) == NSOrderedSame;
}

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      *(unsigned char *)a3 = [(NSNumber *)self charValue];
      break;
    case 2:
      *(_WORD *)a3 = [(NSNumber *)self shortValue];
      break;
    case 3:
      *(_DWORD *)a3 = [(NSNumber *)self intValue];
      break;
    case 4:
      *(void *)a3 = [(NSNumber *)self longLongValue];
      break;
    case 5:
      [(NSNumber *)self floatValue];
      *(_DWORD *)a3 = v5;
      break;
    case 6:
      [(NSNumber *)self doubleValue];
      *(void *)a3 = v6;
      break;
    case 17:
      uint64_t v7 = [(NSNumber *)self longLongValue];
      *(void *)a3 = v7 >> 63;
      *((void *)a3 + 1) = v7;
      break;
    default:
      __break(1u);
      JUMPOUT(0x18179E1B4);
  }
  return 1;
}

- (unint64_t)hash
{
  int v3 = *[(NSValue *)self objCType];
  if (v3 <= 75)
  {
    if (v3 != 66)
    {
      if (v3 != 67 && v3 != 73) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v4 = (v3 - 83);
    if (v4 > 0x20)
    {
LABEL_17:
      if (v3 != 76)
      {
        if (v3 == 81)
        {
          double v6 = (double)[(NSNumber *)self unsignedLongLongValue];
LABEL_25:
          long double v14 = floor(v6 + 0.5);
          double v12 = (v6 - v14) * 1.84467441e19;
          unint64_t result = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
LABEL_26:
          if (v12 >= 0.0)
          {
            if (v12 > 0.0) {
              result += (unint64_t)v12;
            }
          }
          else
          {
            result -= (unint64_t)fabs(v12);
          }
          return result;
        }
LABEL_23:
        [(NSNumber *)self doubleValue];
        double v6 = -v13;
        if (v13 >= 0.0) {
          double v6 = v13;
        }
        goto LABEL_25;
      }
LABEL_20:
      unint64_t v10 = [(NSNumber *)self unsignedIntegerValue];
      if ((v10 & 0x8000000000000000) == 0) {
        return 2654435761u * v10;
      }
      long double v11 = floor((double)v10 + 0.5);
      double v12 = ((double)v10 - v11) * 1.84467441e19;
      unint64_t result = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
      goto LABEL_26;
    }
    if (((1 << (v3 - 83)) & 0x102410000) == 0)
    {
      if (v3 == 83) {
        goto LABEL_20;
      }
      if (v4 == 30)
      {
        uint64_t v5 = [(NSNumber *)self longLongValue];
        double v6 = -(double)v5;
        if (v5 >= 0) {
          double v6 = (double)v5;
        }
        goto LABEL_25;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = [(NSNumber *)self integerValue];
  if (v7 >= 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = -v7;
  }
  return 2654435761 * v8;
}

- (NSComparisonResult)compare:(NSNumber *)otherNumber
{
  if (!otherNumber)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  if (self == otherNumber) {
    return 0;
  }
  int v5 = *(unsigned __int8 *)[(NSValue *)otherNumber objCType];
  double v6 = [(NSValue *)self objCType];
  if ((v5 & 0xFFFFFFFD) == 0x64 || (int v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
  {
    [(NSNumber *)self doubleValue];
    double v13 = v12;
    [(NSNumber *)otherNumber doubleValue];
    if (v13 >= v14) {
      return (unint64_t)(v14 < v13);
    }
    return -1;
  }
  if (v5 == 81 && v7 == 81)
  {
    unint64_t v8 = [(NSNumber *)self unsignedLongLongValue];
    unint64_t v9 = [(NSNumber *)otherNumber unsignedLongLongValue];
    if (v8 >= v9) {
      NSComparisonResult v10 = NSOrderedSame;
    }
    else {
      NSComparisonResult v10 = NSOrderedAscending;
    }
    if (v8 > v9) {
      return 1;
    }
    else {
      return v10;
    }
  }
  if (v7 == 81 && ([(NSNumber *)self unsignedLongLongValue] & 0x8000000000000000) != 0) {
    return 1;
  }
  if (v5 == 81 && ([(NSNumber *)otherNumber unsignedLongLongValue] & 0x8000000000000000) != 0) {
    return -1;
  }
  uint64_t v15 = [(NSNumber *)self longLongValue];
  uint64_t v16 = [(NSNumber *)otherNumber longLongValue];
  if (v15 >= v16) {
    NSComparisonResult v17 = NSOrderedSame;
  }
  else {
    NSComparisonResult v17 = NSOrderedAscending;
  }
  if (v15 > v16) {
    return 1;
  }
  else {
    return v17;
  }
}

- (BOOL)isNSNumber__
{
  return 1;
}

+ (NSNumber)numberWithBool:(BOOL)value
{
  int v3 = (NSNumber **)MEMORY[0x1E4F1CFD0];
  if (!value) {
    int v3 = (NSNumber **)MEMORY[0x1E4F1CFC8];
  }
  return *v3;
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)stringValue
{
  return [(NSNumber *)self descriptionWithLocale:0];
}

+ (NSNumber)numberWithUnsignedInt:(unsigned int)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    unint64_t result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedInt:*(void *)&value];
    return (NSNumber *)v3;
  }
  return result;
}

- (Class)classForCoder
{
  return (Class)NSNumber;
}

+ (NSNumber)numberWithUnsignedLongLong:(unint64_t)value
{
  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedLongLong:value];
    return (NSNumber *)v3;
  }
  else
  {
    unint64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

+ (NSNumber)numberWithDouble:(double)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    uint64_t v5 = (uint64_t)value;
    if ((double)(uint64_t)value == value)
    {
      if (v5)
      {
        if ((unint64_t)(v5 - 0x80000000000000) >= 0xFF00000000000001)
        {
LABEL_11:
          unint64_t result = (NSNumber *)((v5 << 7) | 0x800000000000002BLL);
          unint64_t v6 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
          if ((~v6 & 0xC000000000000007) != 0) {
            return (NSNumber *)(v6 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v6 & 7)));
          }
          return result;
        }
      }
      else if ((*(void *)&value & 0x8000000000000000) == 0)
      {
        goto LABEL_11;
      }
    }
  }
  int v3 = (void *)[objc_allocWithZone((Class)a1) initWithDouble:value];

  return (NSNumber *)v3;
}

+ (NSNumber)allocWithZone:(_NSZone *)a3
{
  if (NSNumber == a1) {
    return (NSNumber *)&__placeholderNumber;
  }
  else {
    return (NSNumber *)NSAllocateObject((Class)a1, 0, a3);
  }
}

+ (NSNumber)numberWithFloat:(float)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    uint64_t v8 = (uint64_t)value;
    if ((float)(uint64_t)value == value)
    {
      if (v8)
      {
        if ((unint64_t)(v8 - 0x80000000000000) >= 0xFF00000000000001)
        {
LABEL_11:
          unint64_t result = (NSNumber *)((v8 << 7) | 0x8000000000000023);
          unint64_t v9 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
          if ((~v9 & 0xC000000000000007) != 0) {
            return (NSNumber *)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v9 & 7)));
          }
          return result;
        }
      }
      else if ((LODWORD(value) & 0x80000000) == 0)
      {
        goto LABEL_11;
      }
    }
  }
  id v4 = objc_allocWithZone((Class)a1);
  *(float *)&double v5 = value;
  unint64_t v6 = (void *)[v4 initWithFloat:v5];

  return (NSNumber *)v6;
}

+ (NSNumber)numberWithUnsignedLong:(unint64_t)value
{
  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedLong:value];
    return (NSNumber *)v3;
  }
  else
  {
    unint64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

- (id)description
{
  return [(NSNumber *)self descriptionWithLocale:0];
}

- (NSString)descriptionWithLocale:(id)locale
{
  int v6 = *[(NSValue *)self objCType];
  if (v6 <= 80)
  {
    if (v6 > 72)
    {
      if (v6 != 73)
      {
        if (v6 == 76)
        {
          unint64_t v9 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", @"%lu", locale, -[NSNumber unsignedLongValue](self, "unsignedLongValue"));
          goto LABEL_25;
        }
        goto LABEL_28;
      }
      id v10 = objc_allocWithZone((Class)NSString);
      unint64_t v16 = [(NSNumber *)self unsignedIntValue];
    }
    else
    {
      if (v6 == 66)
      {
LABEL_11:
        id v10 = objc_allocWithZone((Class)NSString);
        unint64_t v16 = [(NSNumber *)self charValue];
LABEL_19:
        long double v11 = @"%d";
        goto LABEL_24;
      }
      if (v6 != 67) {
        goto LABEL_28;
      }
      id v10 = objc_allocWithZone((Class)NSString);
      unint64_t v16 = [(NSNumber *)self unsignedCharValue];
    }
    long double v11 = @"%u";
  }
  else
  {
    switch(v6)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        id v7 = objc_allocWithZone((Class)NSString);
        [(NSNumber *)self doubleValue];
        unint64_t v9 = objc_msgSend(v7, "initWithFormat:locale:", @"%0.16g", locale, v8);
        goto LABEL_25;
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
        goto LABEL_28;
      case 'f':
        id v12 = objc_allocWithZone((Class)NSString);
        [(NSNumber *)self floatValue];
        unint64_t v9 = objc_msgSend(v12, "initWithFormat:locale:", @"%0.7g", locale, v13);
        goto LABEL_25;
      case 'i':
        id v10 = objc_allocWithZone((Class)NSString);
        unint64_t v16 = [(NSNumber *)self intValue];
        goto LABEL_19;
      case 'l':
        unint64_t v9 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", @"%ld", locale, -[NSNumber longValue](self, "longValue"));
        goto LABEL_25;
      case 'q':
        unint64_t v9 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", @"%lld", locale, -[NSNumber longLongValue](self, "longLongValue"));
        goto LABEL_25;
      case 's':
        unint64_t v9 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", @"%hi", locale, -[NSNumber shortValue](self, "shortValue"));
        goto LABEL_25;
      default:
        if (v6 != 81)
        {
          if (v6 == 83)
          {
            unint64_t v9 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", @"%hu", locale, -[NSNumber unsignedShortValue](self, "unsignedShortValue"));
            goto LABEL_25;
          }
LABEL_28:
          uint64_t v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
          objc_exception_throw(v15);
        }
        id v10 = objc_allocWithZone((Class)NSString);
        unint64_t v16 = [(NSNumber *)self unsignedLongLongValue];
        long double v11 = @"%llu";
        break;
    }
  }
LABEL_24:
  unint64_t v9 = objc_msgSend(v10, "initWithFormat:locale:", v11, locale, v16);
LABEL_25:

  return (NSString *)v9;
}

- (int64_t)_cfNumberType
{
  int v3 = *[(NSValue *)self objCType];
  int64_t result = 7;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if (([(NSNumber *)self unsignedIntValue] & 0x80000000) != 0) {
          return 11;
        }
        else {
          return 9;
        }
      }
      if (v3 == 76)
      {
        if (([(NSNumber *)self unsignedLongValue] & 0x8000000000000000) == 0) {
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

+ (NSNumber)numberWithUnsignedInteger:(NSUInteger)value
{
  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedInteger:value];
    return (NSNumber *)v3;
  }
  else
  {
    int64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

+ (NSNumber)numberWithUnsignedChar:(unsigned __int8)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    int64_t result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000000BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedChar:value];
    return (NSNumber *)v3;
  }
  return result;
}

+ (NSNumber)numberWithInt:(int)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    int64_t result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000013);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithInt:*(void *)&value];
    return (NSNumber *)v3;
  }
  return result;
}

- (id)redactedDescription
{
  return [(NSNumber *)self descriptionWithLocale:0];
}

+ (NSNumber)numberWithLong:(uint64_t)value
{
  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithLong:value];
    return (NSNumber *)v3;
  }
  else
  {
    int64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

+ (NSNumber)numberWithShort:(__int16)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    int64_t result = (NSNumber *)(((uint64_t)value << 7) | 0x800000000000000BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithShort:value];
    return (NSNumber *)v3;
  }
  return result;
}

+ (NSNumber)numberWithLongLong:(uint64_t)value
{
  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithLongLong:value];
    return (NSNumber *)v3;
  }
  else
  {
    int64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

+ (NSNumber)numberWithInteger:(NSInteger)value
{
  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithInteger:value];
    return (NSNumber *)v3;
  }
  else
  {
    int64_t result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

+ (NSNumber)numberWithChar:(char)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    int64_t result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000003);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithChar:value];
    return (NSNumber *)v3;
  }
  return result;
}

+ (NSNumber)numberWithUnsignedShort:(unsigned __int16)value
{
  if (NSNumber == a1 && (_NSNumberTaggedPointersDisabled & 1) == 0)
  {
    int64_t result = (NSNumber *)(((unint64_t)value << 7) | 0x8000000000000013);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    int v3 = (void *)[objc_allocWithZone((Class)a1) initWithUnsignedShort:value];
    return (NSNumber *)v3;
  }
  return result;
}

+ (void)initialize
{
  if (NSNumber == a1 && (!*MEMORY[0x1E4FBA8D8] || !_CFExecutableLinkedOnOrAfter())) {
    _NSNumberTaggedPointersDisabled = 1;
  }
}

- (int64_t)_reverseCompare:(id)a3
{
  NSComparisonResult v3 = [(NSNumber *)self compare:a3];
  if (v3 == NSOrderedDescending) {
    int64_t v4 = -1;
  }
  else {
    int64_t v4 = 0;
  }
  if (v3 == NSOrderedAscending) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  int v9 = *[(NSValue *)self objCType];
  if (v9 <= 80)
  {
    if (v9 > 72)
    {
      if (v9 == 73)
      {
        [(NSNumber *)self unsignedIntValue];
        goto LABEL_16;
      }
      if (v9 == 76)
      {
        [(NSNumber *)self unsignedLongValue];
        int v10 = snprintf(a3, a4, "%lu");
        return v10 < a4;
      }
    }
    else
    {
      if (v9 == 66)
      {
LABEL_11:
        [(NSNumber *)self charValue];
        size_t v11 = a4;
LABEL_19:
        int v10 = snprintf(a3, v11, "%d");
        return v10 < a4;
      }
      if (v9 == 67)
      {
        [(NSNumber *)self unsignedCharValue];
LABEL_16:
        int v10 = snprintf(a3, a4, "%u");
        return v10 < a4;
      }
    }
LABEL_25:
    float v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  switch(v9)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      [(NSNumber *)self doubleValue];
      int v10 = snprintf(a3, a4, "%0.16g");
      return v10 < a4;
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
      goto LABEL_25;
    case 'f':
      [(NSNumber *)self floatValue];
      int v10 = snprintf(a3, a4, "%0.7g");
      return v10 < a4;
    case 'i':
      [(NSNumber *)self intValue];
      size_t v11 = a4;
      goto LABEL_19;
    case 'l':
      [(NSNumber *)self longValue];
      int v10 = snprintf(a3, a4, "%ld");
      return v10 < a4;
    case 'q':
      [(NSNumber *)self longLongValue];
      int v10 = snprintf(a3, a4, "%lld");
      return v10 < a4;
    case 's':
      [(NSNumber *)self shortValue];
      int v10 = snprintf(a3, a4, "%hi");
      return v10 < a4;
    default:
      if (v9 == 81)
      {
        [(NSNumber *)self unsignedLongLongValue];
        int v10 = snprintf(a3, a4, "%llu");
        return v10 < a4;
      }
      if (v9 != 83) {
        goto LABEL_25;
      }
      [(NSNumber *)self unsignedShortValue];
      int v10 = snprintf(a3, a4, "%hu");
      break;
  }
  return v10 < a4;
}

- (NSDecimal)decimalValue
{
  _CFAutoreleasePoolPush();
  unint64_t v5 = +[NSScanner scannerWithString:[(NSNumber *)self stringValue]];
  *(void *)retstr = 0;
  *(void *)&retstr->_mantissa[2] = 0;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
  if (![(NSScanner *)v5 scanDecimal:retstr])
  {
    int v6 = +[NSDecimalNumber notANumber];
    if (v6)
    {
      [(NSDecimalNumber *)v6 decimalValue];
    }
    else
    {
      long long v8 = 0uLL;
      int v9 = 0;
    }
    *(_OWORD *)retstr = v8;
    *(_DWORD *)&retstr->_mantissa[6] = v9;
  }
  return (NSDecimal *)_CFAutoreleasePoolPop();
}

- (BOOL)BOOLValue
{
  unsigned int v4 = *[(NSValue *)self objCType] - 66;
  if (v4 > 0x31) {
    goto LABEL_12;
  }
  if (((1 << v4) & 0x2048200020483) != 0)
  {
    uint64_t v5 = [(NSNumber *)self longValue];
LABEL_4:
    BOOL v6 = v5 == 0;
    return !v6;
  }
  if (((1 << v4) & 0x1400000000) == 0)
  {
    if (((1 << v4) & 0x800000008000) != 0)
    {
      uint64_t v5 = [(NSNumber *)self longLongValue];
      goto LABEL_4;
    }
LABEL_12:
    int v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  [(NSNumber *)self doubleValue];
  BOOL v6 = v8 == 0.0;
  return !v6;
}

- (char)charValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedIntValue];
        return v6;
      }
      if (v4 == 76)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedLongValue];
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOBYTE(v6) = [(NSNumber *)self charValue];
        return v6;
      }
      if (v4 == 67)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedCharValue];
        return v6;
      }
    }
LABEL_25:
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      [(NSNumber *)self doubleValue];
      return (int)v5;
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
      goto LABEL_25;
    case 'f':
      [(NSNumber *)self floatValue];
      return (int)v7;
    case 'i':
      LOBYTE(v6) = [(NSNumber *)self intValue];
      return v6;
    case 'l':
      LOBYTE(v6) = [(NSNumber *)self longValue];
      return v6;
    case 'q':
      LOBYTE(v6) = [(NSNumber *)self longLongValue];
      return v6;
    case 's':
      LOBYTE(v6) = [(NSNumber *)self shortValue];
      return v6;
    default:
      if (v4 == 81)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedLongLongValue];
        return v6;
      }
      if (v4 != 83) {
        goto LABEL_25;
      }
      LOBYTE(v6) = [(NSNumber *)self unsignedShortValue];
      break;
  }
  return v6;
}

- (unsigned)unsignedCharValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedIntValue];
        return v6;
      }
      if (v4 == 76)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedLongValue];
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_13:
        LOBYTE(v6) = [(NSNumber *)self charValue];
        return v6;
      }
      if (v4 == 67)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedCharValue];
        return v6;
      }
    }
LABEL_25:
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_13;
    case 'd':
      [(NSNumber *)self doubleValue];
      return (int)v5;
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
      goto LABEL_25;
    case 'f':
      [(NSNumber *)self floatValue];
      return (int)v7;
    case 'i':
      LOBYTE(v6) = [(NSNumber *)self intValue];
      return v6;
    case 'l':
      LOBYTE(v6) = [(NSNumber *)self longValue];
      return v6;
    case 'q':
      LOBYTE(v6) = [(NSNumber *)self longLongValue];
      return v6;
    case 's':
      LOBYTE(v6) = [(NSNumber *)self shortValue];
      return v6;
    default:
      if (v4 == 81)
      {
        LOBYTE(v6) = [(NSNumber *)self unsignedLongLongValue];
        return v6;
      }
      if (v4 != 83) {
        goto LABEL_25;
      }
      LOBYTE(v6) = [(NSNumber *)self unsignedShortValue];
      break;
  }
  return v6;
}

- (__int16)shortValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedIntValue];
        return v6;
      }
      if (v4 == 76)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedLongValue];
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = [(NSNumber *)self charValue];
        return v6;
      }
      if (v4 == 67)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedCharValue];
        return v6;
      }
    }
LABEL_25:
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      [(NSNumber *)self doubleValue];
      return (int)v5;
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
      goto LABEL_25;
    case 'f':
      [(NSNumber *)self floatValue];
      return (int)v7;
    case 'i':
      LOWORD(v6) = [(NSNumber *)self intValue];
      return v6;
    case 'l':
      LOWORD(v6) = [(NSNumber *)self longValue];
      return v6;
    case 'q':
      LOWORD(v6) = [(NSNumber *)self longLongValue];
      return v6;
    case 's':
      LOWORD(v6) = [(NSNumber *)self shortValue];
      return v6;
    default:
      if (v4 == 81)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedLongLongValue];
        return v6;
      }
      if (v4 != 83) {
        goto LABEL_25;
      }
      LOWORD(v6) = [(NSNumber *)self unsignedShortValue];
      break;
  }
  return v6;
}

- (unsigned)unsignedShortValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedIntValue];
        return v6;
      }
      if (v4 == 76)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedLongValue];
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = [(NSNumber *)self charValue];
        return v6;
      }
      if (v4 == 67)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedCharValue];
        return v6;
      }
    }
LABEL_25:
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      [(NSNumber *)self doubleValue];
      return (int)v5;
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
      goto LABEL_25;
    case 'f':
      [(NSNumber *)self floatValue];
      return (int)v7;
    case 'i':
      LOWORD(v6) = [(NSNumber *)self intValue];
      return v6;
    case 'l':
      LOWORD(v6) = [(NSNumber *)self longValue];
      return v6;
    case 'q':
      LOWORD(v6) = [(NSNumber *)self longLongValue];
      return v6;
    case 's':
      LOWORD(v6) = [(NSNumber *)self shortValue];
      return v6;
    default:
      if (v4 == 81)
      {
        LOWORD(v6) = [(NSNumber *)self unsignedLongLongValue];
        return v6;
      }
      if (v4 != 83) {
        goto LABEL_25;
      }
      LOWORD(v6) = [(NSNumber *)self unsignedShortValue];
      break;
  }
  return v6;
}

- (int)intValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 <= 72)
    {
      if (v4 == 66) {
        return [(NSNumber *)self charValue];
      }
      if (v4 == 67) {
        return [(NSNumber *)self unsignedCharValue];
      }
      goto LABEL_27;
    }
    if (v4 != 73)
    {
      if (v4 == 76) {
        return [(NSNumber *)self unsignedLongValue];
      }
      goto LABEL_27;
    }
    return [(NSNumber *)self unsignedIntValue];
  }
  else
  {
    switch(v4)
    {
      case 'c':
        return [(NSNumber *)self charValue];
      case 'd':
        [(NSNumber *)self doubleValue];
        return (int)v5;
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
        goto LABEL_27;
      case 'f':
        [(NSNumber *)self floatValue];
        return (int)v7;
      case 'i':
        return [(NSNumber *)self intValue];
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        return [(NSNumber *)self shortValue];
      default:
        if (v4 != 81)
        {
          if (v4 == 83) {
            return [(NSNumber *)self unsignedShortValue];
          }
LABEL_27:
          double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
          objc_exception_throw(v8);
        }
        int result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (unsigned)unsignedIntValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 <= 72)
    {
      if (v4 == 66) {
        return [(NSNumber *)self charValue];
      }
      if (v4 == 67) {
        return [(NSNumber *)self unsignedCharValue];
      }
      goto LABEL_27;
    }
    if (v4 != 73)
    {
      if (v4 == 76) {
        return [(NSNumber *)self unsignedLongValue];
      }
      goto LABEL_27;
    }
    return [(NSNumber *)self unsignedIntValue];
  }
  else
  {
    switch(v4)
    {
      case 'c':
        return [(NSNumber *)self charValue];
      case 'd':
        [(NSNumber *)self doubleValue];
        return v5;
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
        goto LABEL_27;
      case 'f':
        [(NSNumber *)self floatValue];
        return v7;
      case 'i':
        return [(NSNumber *)self intValue];
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        return [(NSNumber *)self shortValue];
      default:
        if (v4 != 81)
        {
          if (v4 == 83) {
            return [(NSNumber *)self unsignedShortValue];
          }
LABEL_27:
          double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
          objc_exception_throw(v8);
        }
        unsigned int result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (uint64_t)longValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = [(NSNumber *)self unsignedIntValue];
        return result;
      }
      if (v4 != 76) {
        goto LABEL_33;
      }
      return [(NSNumber *)self unsignedLongValue];
    }
    else
    {
      if (v4 != 66)
      {
        if (v4 == 67)
        {
          LODWORD(result) = [(NSNumber *)self unsignedCharValue];
          return result;
        }
LABEL_33:
        double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
        objc_exception_throw(v8);
      }
LABEL_13:
      LODWORD(result) = [(NSNumber *)self charValue];
      return (int)result;
    }
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_13;
      case 'd':
        [(NSNumber *)self doubleValue];
        return (uint64_t)v5;
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
        goto LABEL_33;
      case 'f':
        [(NSNumber *)self floatValue];
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = [(NSNumber *)self intValue];
        return (int)result;
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        LODWORD(result) = [(NSNumber *)self shortValue];
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = [(NSNumber *)self unsignedShortValue];
            return result;
          }
          goto LABEL_33;
        }
        uint64_t result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (unint64_t)unsignedLongValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = [(NSNumber *)self unsignedIntValue];
        return result;
      }
      if (v4 != 76) {
        goto LABEL_33;
      }
      return [(NSNumber *)self unsignedLongValue];
    }
    else
    {
      if (v4 != 66)
      {
        if (v4 == 67)
        {
          LODWORD(result) = [(NSNumber *)self unsignedCharValue];
          return result;
        }
LABEL_33:
        double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
        objc_exception_throw(v8);
      }
LABEL_13:
      LODWORD(result) = [(NSNumber *)self charValue];
      return (int)result;
    }
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_13;
      case 'd':
        [(NSNumber *)self doubleValue];
        return (unint64_t)v5;
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
        goto LABEL_33;
      case 'f':
        [(NSNumber *)self floatValue];
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = [(NSNumber *)self intValue];
        return (int)result;
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        LODWORD(result) = [(NSNumber *)self shortValue];
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = [(NSNumber *)self unsignedShortValue];
            return result;
          }
          goto LABEL_33;
        }
        unint64_t result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (double)doubleValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (double)[(NSNumber *)self charValue];
      case 'd':
        [(NSNumber *)self doubleValue];
        return result;
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
        goto LABEL_29;
      case 'f':
        [(NSNumber *)self floatValue];
        return v9;
      case 'i':
        return (double)[(NSNumber *)self intValue];
      case 'l':
        return (double)[(NSNumber *)self longValue];
      case 'q':
        return (double)[(NSNumber *)self longLongValue];
      case 's':
        return (double)[(NSNumber *)self shortValue];
      default:
        if (v4 != 81)
        {
          if (v4 == 83) {
            return (double)[(NSNumber *)self unsignedShortValue];
          }
          goto LABEL_29;
        }
        unint64_t v7 = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
    return (double)v7;
  }
  if (v4 > 72)
  {
    if (v4 == 73) {
      return (double)[(NSNumber *)self unsignedIntValue];
    }
    if (v4 != 76) {
      goto LABEL_29;
    }
    return (double)[(NSNumber *)self unsignedLongValue];
  }
  if (v4 != 66)
  {
    if (v4 == 67) {
      return (double)[(NSNumber *)self unsignedCharValue];
    }
LABEL_29:
    size_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  return (double)[(NSNumber *)self charValue];
}

- (float)floatValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (float)[(NSNumber *)self charValue];
      case 'd':
        [(NSNumber *)self doubleValue];
        return v5;
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
        goto LABEL_29;
      case 'f':
        [(NSNumber *)self floatValue];
        return result;
      case 'i':
        return (float)[(NSNumber *)self intValue];
      case 'l':
        return (float)[(NSNumber *)self longValue];
      case 'q':
        return (float)[(NSNumber *)self longLongValue];
      case 's':
        return (float)[(NSNumber *)self shortValue];
      default:
        if (v4 != 81)
        {
          if (v4 == 83) {
            return (float)[(NSNumber *)self unsignedShortValue];
          }
          goto LABEL_29;
        }
        unint64_t v8 = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
    return (float)v8;
  }
  if (v4 > 72)
  {
    if (v4 == 73) {
      return (float)[(NSNumber *)self unsignedIntValue];
    }
    if (v4 != 76) {
      goto LABEL_29;
    }
    return (float)[(NSNumber *)self unsignedLongValue];
  }
  if (v4 != 66)
  {
    if (v4 == 67) {
      return (float)[(NSNumber *)self unsignedCharValue];
    }
LABEL_29:
    size_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  return (float)[(NSNumber *)self charValue];
}

- (uint64_t)longLongValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = [(NSNumber *)self unsignedIntValue];
        return result;
      }
      if (v4 != 76) {
        goto LABEL_33;
      }
      return [(NSNumber *)self unsignedLongValue];
    }
    else
    {
      if (v4 != 66)
      {
        if (v4 == 67)
        {
          LODWORD(result) = [(NSNumber *)self unsignedCharValue];
          return result;
        }
LABEL_33:
        unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
        objc_exception_throw(v8);
      }
LABEL_13:
      LODWORD(result) = [(NSNumber *)self charValue];
      return (int)result;
    }
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_13;
      case 'd':
        [(NSNumber *)self doubleValue];
        return (uint64_t)v5;
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
        goto LABEL_33;
      case 'f':
        [(NSNumber *)self floatValue];
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = [(NSNumber *)self intValue];
        return (int)result;
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        LODWORD(result) = [(NSNumber *)self shortValue];
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = [(NSNumber *)self unsignedShortValue];
            return result;
          }
          goto LABEL_33;
        }
        uint64_t result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (unint64_t)unsignedLongLongValue
{
  int v4 = *[(NSValue *)self objCType];
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = [(NSNumber *)self unsignedIntValue];
        return result;
      }
      if (v4 != 76) {
        goto LABEL_33;
      }
      return [(NSNumber *)self unsignedLongValue];
    }
    else
    {
      if (v4 != 66)
      {
        if (v4 == 67)
        {
          LODWORD(result) = [(NSNumber *)self unsignedCharValue];
          return result;
        }
LABEL_33:
        unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\", _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType"")), 0 reason userInfo];
        objc_exception_throw(v8);
      }
LABEL_13:
      LODWORD(result) = [(NSNumber *)self charValue];
      return (int)result;
    }
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_13;
      case 'd':
        [(NSNumber *)self doubleValue];
        return (unint64_t)v5;
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
        goto LABEL_33;
      case 'f':
        [(NSNumber *)self floatValue];
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = [(NSNumber *)self intValue];
        return (int)result;
      case 'l':
        return [(NSNumber *)self longValue];
      case 'q':
        return [(NSNumber *)self longLongValue];
      case 's':
        LODWORD(result) = [(NSNumber *)self shortValue];
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = [(NSNumber *)self unsignedShortValue];
            return result;
          }
          goto LABEL_33;
        }
        unint64_t result = [(NSNumber *)self unsignedLongLongValue];
        break;
    }
  }
  return result;
}

- (NSNumber)initWithCoder:(NSCoder *)coder
{
  [(NSNumber *)self zone];
  BOOL v5 = [(NSCoder *)coder allowsKeyedCoding];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == self || [(NSCoder *)coder containsValueForKey:@"NS.number"])
    {
      id v10 = (id)[(NSCoder *)coder _decodePropertyListForKey:@"NS.number"];
      if (_NSIsNSNumber())
      {
        return (NSNumber *)v10;
      }
      else
      {
        [(NSCoder *)coder failWithError:+[NSError _readCorruptErrorWithFormat:@"Decoded object is not a number"]];

        return 0;
      }
    }
    else if ([(NSCoder *)coder containsValueForKey:@"NS.BOOLval"])
    {
      BOOL v8 = [(NSCoder *)coder decodeBoolForKey:@"NS.BOOLval"];
      return (NSNumber *)[(NSPlaceholderNumber *)&__placeholderNumber initWithBool:v8];
    }
    else if ([(NSCoder *)coder containsValueForKey:@"NS.intval"])
    {
      int64_t v9 = [(NSCoder *)coder decodeInt64ForKey:@"NS.intval"];
      return (NSNumber *)[(NSPlaceholderNumber *)&__placeholderNumber initWithLongLong:v9];
    }
    else
    {
      if (![(NSCoder *)coder containsValueForKey:@"NS.dblval"]) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"*** -[NSNumber initWithCoder:]: unknown number type" userInfo:0]);
      }
      [(NSCoder *)coder decodeDoubleForKey:@"NS.dblval"];
      return (NSNumber *)-[NSPlaceholderNumber initWithDouble:](&__placeholderNumber, "initWithDouble:");
    }
  }
  else
  {
    return (NSNumber *)newDecodedNumber(coder);
  }
}

- (void)encodeWithCoder:(id)a3
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    float v7 = [(NSValue *)self objCType];
    BOOL v8 = v7;
    unint64_t v16 = v7;
    int v9 = *(unsigned __int8 *)v7;
    if (*v7 && !v7[1])
    {
      if (v9 == 76)
      {
        BOOL v8 = "Q";
        goto LABEL_22;
      }
      if (v9 == 108)
      {
        BOOL v8 = "q";
LABEL_22:
        unint64_t v16 = v8;
      }
    }
    sizep[0] = 0;
    NSGetSizeAndAlignment(v8, sizep, 0);
    NSUInteger v13 = sizep[0];
    if (sizep[0] < 0x401) {
      double v14 = sizep;
    }
    else {
      double v14 = malloc_type_malloc(sizep[0], 0xE5CB23FuLL);
    }
    if (*v8 == 94 && v8[1] == 118)
    {
      uint64_t v15 = +[NSString stringWithFormat:@"cannot encode (void *) value: %@", self];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0]);
    }
    [(NSValue *)self getValue:v14];
    [a3 encodeValueOfObjCType:"*" at:&v16];
    [a3 encodeValueOfObjCType:v16 at:v14];
    if (v13 > 0x400) {
      free(v14);
    }
    return;
  }
  if (object_getClass(a3) == (Class)NSKeyedArchiver)
  {
    [a3 _encodePropertyList:self forKey:@"NS.number"];
  }
  else
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(self))
    {
      BOOL v6 = CFBooleanGetValue((CFBooleanRef)self) != 0;
LABEL_5:
      [a3 encodeBool:v6 forKey:@"NS.BOOLval"];
      return;
    }
    id v10 = [(NSValue *)self objCType];
    unsigned int v11 = *v10 - 66;
    if (v11 > 0x31) {
      return;
    }
    if (((1 << v11) & 0x2848200028482) != 0)
    {
      uint64_t v12 = [(NSNumber *)self longLongValue];
      [a3 encodeInt64:v12 forKey:@"NS.intval"];
    }
    else
    {
      if (((1 << v11) & 0x1400000000) == 0)
      {
        if (*v10 != 66) {
          return;
        }
        BOOL v6 = [(NSNumber *)self BOOLValue];
        goto LABEL_5;
      }
      [(NSNumber *)self doubleValue];
      objc_msgSend(a3, "encodeDouble:forKey:", @"NS.dblval");
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NSValue *)self objCType];
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    float v7 = (unsigned __int8 *)sizep;
  }
  else {
    float v7 = (unsigned __int8 *)malloc_type_malloc(sizep[0], 0x42743BDFuLL);
  }
  [(NSValue *)self getValue:v7];
  int v9 = newNumber(*v5, v7, v8);
  if (!v9)
  {
    unsigned int v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: bad objCType: \"%s\"", _NSMethodExceptionProem((objc_class *)self, a2), v5), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if (v6 >= 0x401) {
    free(v7);
  }
  return v9;
}

- (NSNumber)initWithChar:(char)value
{
}

- (NSNumber)initWithUnsignedChar:(unsigned __int8)value
{
}

- (NSNumber)initWithShort:(__int16)value
{
}

- (NSNumber)initWithUnsignedShort:(unsigned __int16)value
{
}

- (NSNumber)initWithInt:(int)value
{
}

- (NSNumber)initWithUnsignedInt:(unsigned int)value
{
}

- (NSNumber)initWithInteger:(NSInteger)value
{
}

- (NSNumber)initWithUnsignedInteger:(NSUInteger)value
{
}

- (NSNumber)initWithLong:(uint64_t)value
{
}

- (NSNumber)initWithUnsignedLong:(unint64_t)value
{
}

- (NSNumber)initWithLongLong:(uint64_t)value
{
}

- (NSNumber)initWithUnsignedLongLong:(unint64_t)value
{
}

- (NSNumber)initWithFloat:(float)value
{
}

- (NSNumber)initWithDouble:(double)value
{
}

- (NSNumber)initWithBool:(BOOL)value
{
}

@end
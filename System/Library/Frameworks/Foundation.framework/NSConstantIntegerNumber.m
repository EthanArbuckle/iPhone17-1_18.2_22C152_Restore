@interface NSConstantIntegerNumber
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)new;
- ($2F068FC02377E22BA03580A8162C781E)decimalValue;
- (BOOL)BOOLValue;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (int64_t)integerValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)retainCount;
- (unint64_t)unsignedIntegerValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSConstantIntegerNumber

- (const)objCType
{
  return self->_encoding;
}

- (int64_t)longLongValue
{
  return self->_value;
}

- (unint64_t)unsignedLongLongValue
{
  return self->_value;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_value;
}

- (int64_t)integerValue
{
  return self->_value;
}

- (double)doubleValue
{
  return (double)self->_value;
}

- (signed)shortValue
{
  return self->_value;
}

- (int)intValue
{
  return self->_value;
}

- (float)floatValue
{
  return (float)self->_value;
}

- (char)charValue
{
  return self->_value;
}

- (unsigned)unsignedIntValue
{
  return self->_value;
}

- (void)getValue:(void *)a3
{
  int v3 = *self->_encoding;
  size_t v4 = 1;
  if (v3 > 98)
  {
    if (v3 <= 107)
    {
      if (v3 == 99) {
        goto LABEL_19;
      }
      if (v3 == 105)
      {
LABEL_18:
        size_t v4 = 4;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v3 != 108 && v3 != 113)
    {
      if (v3 != 115) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
LABEL_15:
    size_t v4 = 8;
    goto LABEL_19;
  }
  if (v3 <= 75)
  {
    if ((v3 - 66) >= 2)
    {
      if (v3 != 73) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
LABEL_19:
    memmove(a3, &self->_value, v4);
    return;
  }
  if (v3 == 76 || v3 == 81) {
    goto LABEL_15;
  }
  if (v3 == 83)
  {
LABEL_14:
    size_t v4 = 2;
    goto LABEL_19;
  }
LABEL_20:
  qword_1E8EDF350 = (uint64_t)"Should not be possible to have a non supported type encoding! Please file a radar!";
  __break(1u);
}

- (int64_t)longValue
{
  return self->_value;
}

- (unsigned)unsignedShortValue
{
  return self->_value;
}

- (unsigned)unsignedCharValue
{
  return self->_value;
}

- (BOOL)BOOLValue
{
  unsigned int v2 = *self->_encoding - 66;
  BOOL v3 = v2 >= 0x31;
  BOOL v5 = v2 == 49;
  uint64_t v4 = (1 << v2) & 0x2848200028483;
  BOOL v5 = !v5 && v3 || v4 == 0;
  if (v5)
  {
    qword_1E8EDF350 = (uint64_t)"Should not be possible to have a non supported type encoding! Please file a radar!";
    __break(1u);
  }
  else
  {
    LOBYTE(self) = self->_value != 0;
  }
  return (char)self;
}

- (unint64_t)unsignedLongValue
{
  return self->_value;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  int v4 = *self->_encoding;
  uint64_t v5 = 1;
  if (v4 > 98)
  {
    if (v4 <= 107)
    {
      if (v4 == 99) {
        goto LABEL_19;
      }
      if (v4 == 105)
      {
LABEL_18:
        uint64_t v5 = 4;
        goto LABEL_19;
      }
      goto LABEL_24;
    }
    if (v4 != 108 && v4 != 113)
    {
      if (v4 != 115) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v5 = 8;
    goto LABEL_19;
  }
  if (v4 > 75)
  {
    if (v4 != 76 && v4 != 81)
    {
      if (v4 == 83)
      {
LABEL_14:
        uint64_t v5 = 2;
        goto LABEL_19;
      }
LABEL_24:
      qword_1E8EDF350 = (uint64_t)"Should not be possible to have a non supported type encoding! Please file a radar!";
      __break(1u);
      return;
    }
    goto LABEL_15;
  }
  if ((v4 - 66) >= 2)
  {
    if (v4 != 73) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v5 != a4)
  {
    v6 = +[NSString stringWithFormat:@"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes", a4, "d", v5];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }

  memmove(a3, &self->_value, a4);
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  int v4 = [(NSNumber *)[NSDecimalNumber alloc] initWithLongLong:self->_value];
  *(void *)retstr = 0;
  *(void *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v4)
  {
    v6 = v4;
    [(NSDecimalNumber *)v4 decimalValue];
    int v4 = v6;
  }

  return result;
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSNumber allocWithZone:a3];
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
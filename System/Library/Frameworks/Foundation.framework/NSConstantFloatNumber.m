@interface NSConstantFloatNumber
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

@implementation NSConstantFloatNumber

- (double)doubleValue
{
  return self->_value;
}

- (const)objCType
{
  return "f";
}

- (float)floatValue
{
  return self->_value;
}

- (void)getValue:(void *)a3
{
  *(float *)a3 = self->_value;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (a4 != 4)
  {
    v4 = +[NSString stringWithFormat:@"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes", a4, "f", 4];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v4 userInfo:0]);
  }
  *(float *)a3 = self->_value;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  v5 = [NSDecimalNumber alloc];
  *(float *)&double v6 = self->_value;
  v7 = [(NSNumber *)v5 initWithFloat:v6];
  *(void *)retstr = 0;
  *(void *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v7)
  {
    v9 = v7;
    [(NSDecimalNumber *)v7 decimalValue];
    v7 = v9;
  }

  return result;
}

- (BOOL)BOOLValue
{
  return self->_value != 0.0;
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSNumber allocWithZone:a3];
}

- (char)charValue
{
  return (int)self->_value;
}

- (unsigned)unsignedCharValue
{
  return (int)self->_value;
}

- (signed)shortValue
{
  return (int)self->_value;
}

- (unsigned)unsignedShortValue
{
  return (int)self->_value;
}

- (int)intValue
{
  return (int)self->_value;
}

- (unsigned)unsignedIntValue
{
  return self->_value;
}

- (int64_t)longValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongValue
{
  return (unint64_t)self->_value;
}

- (int64_t)longLongValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongLongValue
{
  return (unint64_t)self->_value;
}

- (int64_t)integerValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedIntegerValue
{
  return (unint64_t)self->_value;
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
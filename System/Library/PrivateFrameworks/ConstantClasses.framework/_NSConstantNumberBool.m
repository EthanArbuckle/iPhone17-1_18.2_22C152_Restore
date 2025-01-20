@interface _NSConstantNumberBool
- ($2F068FC02377E22BA03580A8162C781E)decimalValue;
- (BOOL)BOOLValue;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (int64_t)integerValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)getValue:(void *)a3;
@end

@implementation _NSConstantNumberBool

- (void)getValue:(void *)a3
{
  *(unsigned char *)a3 = LOBYTE(self[1].super.super.super.super.isa) != 0;
}

- (const)objCType
{
  return "B";
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithBool:LOBYTE(self[1].super.super.super.super.isa) != 0];
  *(void *)retstr = 0;
  *(void *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v4)
  {
    id v6 = v4;
    [v4 decimalValue];
    v4 = v6;
  }

  return result;
}

- (int)intValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (float)floatValue
{
  return (float)SLOBYTE(self[1].super.super.super.super.isa);
}

- (double)doubleValue
{
  return (double)SLOBYTE(self[1].super.super.super.super.isa);
}

- (BOOL)BOOLValue
{
  return LOBYTE(self[1].super.super.super.super.isa) != 0;
}

- (char)charValue
{
  return (char)self[1].super.super.super.super.isa;
}

- (int64_t)integerValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (int64_t)longValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (int64_t)longLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (signed)shortValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedCharValue
{
  return self[1].super.super.super.super.isa;
}

- (unsigned)unsignedIntValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedShortValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

@end
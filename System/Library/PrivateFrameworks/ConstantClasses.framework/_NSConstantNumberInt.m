@interface _NSConstantNumberInt
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

@implementation _NSConstantNumberInt

- (void)getValue:(void *)a3
{
  *(_DWORD *)a3 = self[1].super.super.super.super.isa;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInt:LODWORD(self[1].super.super.super.super.isa)];
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

- (const)objCType
{
  return "i";
}

- (BOOL)BOOLValue
{
  return LODWORD(self[1].super.super.super.super.isa) != 0;
}

- (char)charValue
{
  return (char)self[1].super.super.super.super.isa;
}

- (int)intValue
{
  return (int)self[1].super.super.super.super.isa;
}

- (float)floatValue
{
  return (float)SLODWORD(self[1].super.super.super.super.isa);
}

- (double)doubleValue
{
  return (double)SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)integerValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)longValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)longLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (signed)shortValue
{
  return (signed __int16)self[1].super.super.super.super.isa;
}

- (unsigned)unsignedCharValue
{
  return self[1].super.super.super.super.isa;
}

- (unsigned)unsignedIntValue
{
  return self[1].super.super.super.super.isa;
}

- (unint64_t)unsignedLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedShortValue
{
  return (unsigned __int16)self[1].super.super.super.super.isa;
}

@end
@interface _NSConstantNumberFloat
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

@implementation _NSConstantNumberFloat

- (BOOL)BOOLValue
{
  return *(float *)&self[1].super.super.super.super.isa != 0.0;
}

- (void)getValue:(void *)a3
{
  *(_DWORD *)a3 = self[1].super.super.super.super.isa;
}

- (const)objCType
{
  return "f";
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  id v5 = objc_alloc(MEMORY[0x263F087B0]);
  LODWORD(v6) = self[1].super.super.super.super.isa;
  v7 = (void *)[v5 initWithFloat:v6];
  *(void *)retstr = 0;
  *(void *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v7)
  {
    id v9 = v7;
    [v7 decimalValue];
    v7 = v9;
  }

  return result;
}

- (int)intValue
{
  return (int)*(float *)&self[1].super.super.super.super.isa;
}

- (float)floatValue
{
  return *(float *)&self[1].super.super.super.super.isa;
}

- (double)doubleValue
{
  return *(float *)&self[1].super.super.super.super.isa;
}

- (char)charValue
{
  return (int)*(float *)&self[1].super.super.super.super.isa;
}

- (int64_t)integerValue
{
  return (uint64_t)*(float *)&self[1].super.super.super.super.isa;
}

- (int64_t)longValue
{
  return (uint64_t)*(float *)&self[1].super.super.super.super.isa;
}

- (int64_t)longLongValue
{
  return (uint64_t)*(float *)&self[1].super.super.super.super.isa;
}

- (signed)shortValue
{
  return (int)*(float *)&self[1].super.super.super.super.isa;
}

- (unsigned)unsignedCharValue
{
  return (int)*(float *)&self[1].super.super.super.super.isa;
}

- (unsigned)unsignedIntValue
{
  return *(float *)&self[1].super.super.super.super.isa;
}

- (unint64_t)unsignedLongValue
{
  return (unint64_t)*(float *)&self[1].super.super.super.super.isa;
}

- (unint64_t)unsignedLongLongValue
{
  return (unint64_t)*(float *)&self[1].super.super.super.super.isa;
}

- (unsigned)unsignedShortValue
{
  return (int)*(float *)&self[1].super.super.super.super.isa;
}

@end
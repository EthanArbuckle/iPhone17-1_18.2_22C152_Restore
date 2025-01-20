@interface NSDecimalNumberPlaceholder
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
- (Class)classForCoder;
- (NSDecimalNumberPlaceholder)init;
- (NSDecimalNumberPlaceholder)initWithBool:(BOOL)a3;
- (NSDecimalNumberPlaceholder)initWithChar:(char)a3;
- (NSDecimalNumberPlaceholder)initWithCoder:(id)a3;
- (NSDecimalNumberPlaceholder)initWithDecimal:(id *)a3;
- (NSDecimalNumberPlaceholder)initWithDouble:(double)a3;
- (NSDecimalNumberPlaceholder)initWithFloat:(float)a3;
- (NSDecimalNumberPlaceholder)initWithInt:(int)a3;
- (NSDecimalNumberPlaceholder)initWithLongLong:(int64_t)a3;
- (NSDecimalNumberPlaceholder)initWithMantissa:(unint64_t)a3 exponent:(signed __int16)a4 isNegative:(BOOL)a5;
- (NSDecimalNumberPlaceholder)initWithShort:(signed __int16)a3;
- (NSDecimalNumberPlaceholder)initWithString:(id)a3;
- (NSDecimalNumberPlaceholder)initWithString:(id)a3 locale:(id)a4;
- (NSDecimalNumberPlaceholder)initWithUnsignedChar:(unsigned __int8)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedInt:(unsigned int)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedLongLong:(unint64_t)a3;
- (NSDecimalNumberPlaceholder)initWithUnsignedShort:(unsigned __int16)a3;
- (unint64_t)retainCount;
@end

@implementation NSDecimalNumberPlaceholder

- (NSDecimalNumberPlaceholder)initWithString:(id)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithString:a3 locale:0];
}

- (NSDecimalNumberPlaceholder)initWithMantissa:(unint64_t)a3 exponent:(signed __int16)a4 isNegative:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v11[4] = 0uLL;
  int v5 = 0;
  if (a3)
  {
    unint64_t v6 = 0;
    do
    {
      *(_WORD *)&v11[2 * v6 + 4] = a3;
      v5 += 256;
      if (v6 > 6) {
        break;
      }
      a3 >>= 16;
      ++v6;
    }
    while (a3);
  }
  if (a5) {
    int v7 = 4096;
  }
  else {
    int v7 = 0;
  }
  *(_DWORD *)v11 = v7 & 0xFFFFFF00 | a4 | v5;
  long long v9 = *(_OWORD *)v11;
  int v10 = *(_DWORD *)&v11[16];
  return [(NSDecimalNumberPlaceholder *)self initWithDecimal:&v9];
}

- (NSDecimalNumberPlaceholder)initWithString:(id)a3 locale:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (void *)[objc_allocWithZone((Class)NSScanner) initWithString:a3];
  int v7 = v6;
  long long v13 = 0uLL;
  int v14 = 0;
  if (a4) {
    [v6 setLocale:a4];
  }
  if ([v7 scanDecimal:&v13])
  {
    long long v11 = v13;
    int v12 = v14;
    v8 = [(NSDecimalNumberPlaceholder *)self initWithDecimal:&v11];
  }
  else
  {
    v8 = [(NSDecimalNumberPlaceholder *)self init];
  }
  long long v9 = v8;

  return v9;
}

- (NSDecimalNumberPlaceholder)initWithDecimal:(id *)a3
{
  _NSDecimalCompact((int *)a3);
  v4 = (objc_class *)self;
  int v5 = (char *)NSAllocateObject(v4, ((unint64_t)*(_DWORD *)a3 >> 7) & 0x1E, 0);
  NSDecimalCopy((NSDecimal *)(v5 + 8), (const NSDecimal *)a3);
  return (NSDecimalNumberPlaceholder *)v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &_cachedPlaceholder;
}

- (unint64_t)retainCount
{
  return -1;
}

- (NSDecimalNumberPlaceholder)init
{
  v2 = +[NSDecimalNumber notANumber];

  return (NSDecimalNumberPlaceholder *)[(NSDecimalNumber *)v2 copyWithZone:0];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumberPlaceholder)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    *(_OWORD *)&v27[4] = 0uLL;
    int v23 = 0;
    int v24 = 0;
    unsigned int v22 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v24 size:4];
    [a3 decodeValueOfObjCType:"S" at:(char *)&v23 + 2 size:2];
    [a3 decodeValueOfObjCType:"C" at:(char *)&v23 + 1 size:1];
    [a3 decodeValueOfObjCType:"C" at:&v23 size:1];
    unsigned int v16 = (BYTE2(v23) & 0xF) << 8;
    if (v16 < 0x801)
    {
      *(_DWORD *)v27 = v24 | v16 | ((BYTE1(v23) != 0) << 12) | (((_BYTE)v23 != 0) << 13);
      [a3 decodeValueOfObjCType:"I" at:&v22 size:4];
      if (v22 < 9)
      {
        objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "S");
        long long v25 = *(_OWORD *)v27;
        int v26 = *(_DWORD *)&v27[16];
        uint64_t v15 = &v25;
        return [(NSDecimalNumberPlaceholder *)self initWithDecimal:v15];
      }
    }
    v19 = +[NSString stringWithFormat:@"%@: critical NSDecimalNumber archived data is wrong size", self];

    v20 = (void *)MEMORY[0x1E4F1CA00];
    v21 = v19;
LABEL_20:
    objc_exception_throw((id)[v20 exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v21 userInfo:0]);
  }
  *(void *)&long long v25 = 0;
  unsigned __int8 v5 = [a3 decodeInt32ForKey:@"NS.exponent"];
  char v6 = [a3 decodeInt32ForKey:@"NS.length"];
  if ((v6 & 0xFu) >= 9
    || ((char v7 = v6, ![a3 decodeBoolForKey:@"NS.negative"]) ? (v8 = 0) : (v8 = 4096),
        ![a3 decodeBoolForKey:@"NS.compact"] ? (int v9 = 0) : (int v9 = 0x2000),
        __int32 v10 = [a3 decodeInt32ForKey:@"NS.mantissa.bo"],
        long long v11 = (int8x16_t *)[a3 decodeBytesForKey:@"NS.mantissa" returnedLength:&v25],
        (void)v25 != 16))
  {
    v18 = +[NSString stringWithFormat:@"%@: critical NSDecimalNumber archived data is wrong size", self];
LABEL_19:
    v21 = v18;
    v20 = (void *)MEMORY[0x1E4F1CA00];
    goto LABEL_20;
  }
  if (!v11)
  {
    v18 = +[NSString stringWithFormat:@"%@: critical NSDecimalNumber archived data is missing", self];
    goto LABEL_19;
  }
  v12.i32[0] = 1;
  v13.i32[0] = v10;
  int8x16_t v14 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v13, v12), 0), *v11, vrev16q_s8(*v11));
  *(_DWORD *)v27 = v5 | ((v7 & 0xF) << 8) | v8 | v9;
  *(int8x16_t *)&v27[4] = v14;
  uint64_t v15 = (long long *)v27;
  return [(NSDecimalNumberPlaceholder *)self initWithDecimal:v15];
}

- (NSDecimalNumberPlaceholder)initWithLongLong:(int64_t)a3
{
  if (a3 >= 0) {
    int64_t v3 = a3;
  }
  else {
    int64_t v3 = -a3;
  }
  return [(NSDecimalNumberPlaceholder *)self initWithMantissa:v3 exponent:0 isNegative:(unint64_t)a3 >> 63];
}

- (NSDecimalNumberPlaceholder)initWithBool:(BOOL)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithChar:(char)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithShort:(signed __int16)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithInt:(int)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithUnsignedLongLong:(unint64_t)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithMantissa:a3 exponent:0 isNegative:0];
}

- (NSDecimalNumberPlaceholder)initWithUnsignedChar:(unsigned __int8)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithUnsignedLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithUnsignedShort:(unsigned __int16)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithUnsignedLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithUnsignedInt:(unsigned int)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithUnsignedLongLong:a3];
}

- (NSDecimalNumberPlaceholder)initWithDouble:(double)a3
{
  double v3 = -a3;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (v3 >= 1.0e-110)
  {
    if (v3 <= 1.8e146)
    {
      for (__int16 i = 0; v3 < 1.84467441e19; --i)
        double v3 = v3 * 10.0;
      for (; v3 > 1.84467441e19; ++i)
        double v3 = v3 / 10.0;
      unint64_t v4 = (unint64_t)v3;
      BOOL v6 = a3 < 0.0;
      uint64_t v5 = i;
    }
    else
    {
      BOOL v6 = a3 < 0.0;
      unint64_t v4 = -1;
      uint64_t v5 = 127;
    }
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v5 = 0;
    BOOL v6 = 0;
  }
  return [(NSDecimalNumberPlaceholder *)self initWithMantissa:v4 exponent:v5 isNegative:v6];
}

- (NSDecimalNumberPlaceholder)initWithFloat:(float)a3
{
  return [(NSDecimalNumberPlaceholder *)self initWithDouble:a3];
}

@end
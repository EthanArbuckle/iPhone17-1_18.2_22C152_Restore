@interface HDHealthServiceCharacteristic
+ (BOOL)uint16:(unsigned __int16)a3 toData:(char *)a4 before:(const char *)a5;
+ (BOOL)uint32:(unsigned int)a3 toData:(char *)a4 before:(const char *)a5;
+ (BOOL)uint8:(unsigned __int8)a3 toData:(char *)a4 before:(const char *)a5;
+ (double)doubleFromFLOAT:(unsigned int)a3;
+ (double)doubleFromFLOATData:(const char *)a3 before:(const char *)a4;
+ (float)floatFromSFLOAT:(unsigned __int16)a3;
+ (float)floatFromSFLOATData:(const char *)a3 before:(const char *)a4;
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)buildWithBinaryValue:(id)a3 updateTime:(id)a4 error:(id *)a5;
+ (id)dateFromData:(const char *)a3 before:(const char *)a4 calendar:(id)a5;
+ (id)uuid;
+ (signed)int16FromData:(const char *)a3 before:(const char *)a4;
+ (unsigned)uint16FromData:(const char *)a3 before:(const char *)a4;
+ (unsigned)uint24FromData:(const char *)a3 before:(const char *)a4;
+ (unsigned)uint32FromData:(const char *)a3 before:(const char *)a4;
+ (unsigned)uint8FromData:(const char *)a3 before:(const char *)a4;
- (NSDate)updateTime;
- (NSString)description;
- (id)_init;
- (id)getBinaryValueWithError:(id *)a3;
- (void)unitTest_setUpdateTime:(id)a3;
@end

@implementation HDHealthServiceCharacteristic

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HDHealthServiceCharacteristic;
  return [(HDHealthServiceCharacteristic *)&v3 init];
}

+ (id)buildWithBinaryValue:(id)a3 updateTime:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _buildWithBinaryValue:v9 error:a5];

  if (v10) {
    objc_storeStrong(v10 + 1, a4);
  }

  return v10;
}

- (id)getBinaryValueWithError:(id *)a3
{
  return +[NSData data];
}

- (NSString)description
{
  objc_super v3 = [(id)objc_opt_class() uuid];
  v4 = [v3 UUIDString];

  v5 = [(id)objc_opt_class() uuid];
  v6 = [v5 description];

  if ([(__CFString *)v6 isEqualToString:v4])
  {

    v6 = &stru_61AE0;
  }
  v10.receiver = self;
  v10.super_class = (Class)HDHealthServiceCharacteristic;
  v7 = [(HDHealthServiceCharacteristic *)&v10 description];
  id v8 = +[NSString stringWithFormat:@"%@ uuid=%@ %@", v7, v4, v6];

  return (NSString *)v8;
}

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  return 0;
}

+ (float)floatFromSFLOAT:(unsigned __int16)a3
{
  unsigned int v3 = a3 & 0xFFF;
  if (v3 - 2046 > 4)
  {
    if ((a3 & 0x8000u) == 0) {
      int v5 = a3 >> 12;
    }
    else {
      int v5 = (a3 >> 12) | 0xFFFFFFF0;
    }
    if (v3 <= 0x7FF) {
      int v6 = 0;
    }
    else {
      int v6 = -4096;
    }
    float v7 = (float)(int)(v6 | v3);
    float v8 = __exp10((double)v5);
    return v7 * v8;
  }
  else
  {
    float result = NAN;
    if (v3 == 2050) {
      float result = -INFINITY;
    }
    if (v3 == 2046) {
      return INFINITY;
    }
  }
  return result;
}

+ (double)doubleFromFLOAT:(unsigned int)a3
{
  unsigned int v3 = a3 & 0xFFFFFF;
  unsigned int v4 = (a3 & 0xFFFFFF) - 8388606;
  if (v4 <= 4) {
    return dbl_59CA0[v4];
  }
  if (v3 >> 23) {
    int v6 = -16777216;
  }
  else {
    int v6 = 0;
  }
  return __exp10((double)((int)a3 >> 24)) * (double)(int)(v6 | v3);
}

+ (unsigned)uint8FromData:(const char *)a3 before:(const char *)a4
{
  int v7 = 0;
  int v4 = sub_23388((uint64_t)a1, &v7, (unsigned __int8 **)a3, 1, (unint64_t)a4);
  unsigned __int8 v5 = v7;
  if (!v4) {
    return 0;
  }
  return v5;
}

+ (signed)int16FromData:(const char *)a3 before:(const char *)a4
{
  int v7 = 0;
  int v4 = sub_23388((uint64_t)a1, &v7, (unsigned __int8 **)a3, 2, (unint64_t)a4);
  signed __int16 v5 = v7;
  if (!v4) {
    return 0;
  }
  return v5;
}

+ (unsigned)uint16FromData:(const char *)a3 before:(const char *)a4
{
  int v7 = 0;
  int v4 = sub_23388((uint64_t)a1, &v7, (unsigned __int8 **)a3, 2, (unint64_t)a4);
  unsigned __int16 v5 = v7;
  if (!v4) {
    return 0;
  }
  return v5;
}

+ (unsigned)uint24FromData:(const char *)a3 before:(const char *)a4
{
  unsigned int v5 = 0;
  if (sub_23388((uint64_t)a1, &v5, (unsigned __int8 **)a3, 3, (unint64_t)a4)) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (unsigned)uint32FromData:(const char *)a3 before:(const char *)a4
{
  unsigned int v5 = 0;
  if (sub_23388((uint64_t)a1, &v5, (unsigned __int8 **)a3, 4, (unint64_t)a4)) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (float)floatFromSFLOATData:(const char *)a3 before:(const char *)a4
{
  self;
  if (!a3 || !a4 || !*a3) {
    return 0.0;
  }
  if (*a3 + 2 > a4)
  {
    *a3 = 0;
    return 0.0;
  }
  id v8 = [a1 uint16FromData:a3 before:a4];

  [a1 floatFromSFLOAT:v8];
  return result;
}

+ (double)doubleFromFLOATData:(const char *)a3 before:(const char *)a4
{
  self;
  if (!a3 || !a4 || !*a3) {
    return 0.0;
  }
  if (*a3 + 4 > a4)
  {
    *a3 = 0;
    return 0.0;
  }
  id v8 = [a1 uint32FromData:a3 before:a4];

  [a1 doubleFromFLOAT:v8];
  return result;
}

+ (id)dateFromData:(const char *)a3 before:(const char *)a4 calendar:(id)a5
{
  id v8 = a5;
  self;
  id v9 = 0;
  if (a3 && a4 && *a3)
  {
    if (*a3 + 7 <= a4)
    {
      unsigned int v10 = [a1 uint16FromData:a3 before:a4];
      unsigned int v11 = [a1 uint8FromData:a3 before:a4];
      unsigned int v12 = [a1 uint8FromData:a3 before:a4];
      unsigned int v13 = [a1 uint8FromData:a3 before:a4];
      unsigned int v14 = [a1 uint8FromData:a3 before:a4];
      unsigned int v15 = [a1 uint8FromData:a3 before:a4];
      id v16 = objc_alloc_init((Class)NSDateComponents);
      [v16 setYear:v10];
      [v16 setMonth:v11];
      [v16 setDay:v12];
      [v16 setHour:v13];
      [v16 setMinute:v14];
      [v16 setSecond:v15];
      id v9 = [v8 dateFromComponents:v16];
    }
    else
    {
      id v9 = 0;
      *a3 = 0;
    }
  }

  return v9;
}

+ (BOOL)uint8:(unsigned __int8)a3 toData:(char *)a4 before:(const char *)a5
{
  self;
  BOOL result = 0;
  if (a4)
  {
    if (a5)
    {
      id v9 = *a4;
      if (*a4)
      {
        if (v9 + 1 <= a5)
        {
          *id v9 = a3;
          ++*a4;
          return 1;
        }
      }
    }
  }
  return result;
}

+ (BOOL)uint16:(unsigned __int16)a3 toData:(char *)a4 before:(const char *)a5
{
  self;
  BOOL result = 0;
  if (a4)
  {
    if (a5)
    {
      id v9 = *a4;
      if (*a4)
      {
        if (v9 + 2 <= a5)
        {
          *(_WORD *)id v9 = a3;
          *a4 += 2;
          return 1;
        }
      }
    }
  }
  return result;
}

+ (BOOL)uint32:(unsigned int)a3 toData:(char *)a4 before:(const char *)a5
{
  self;
  BOOL result = 0;
  if (a4)
  {
    if (a5)
    {
      id v9 = *a4;
      if (*a4)
      {
        if (v9 + 4 <= a5)
        {
          *(_DWORD *)id v9 = a3;
          *a4 += 4;
          return 1;
        }
      }
    }
  }
  return result;
}

- (void)unitTest_setUpdateTime:(id)a3
{
}

- (NSDate)updateTime
{
  return self->_updateTime;
}

- (void).cxx_destruct
{
}

+ (id)uuid
{
  NSRequestConcreteImplementation();
  id v2 = objc_alloc_init((Class)CBUUID);

  return v2;
}

@end
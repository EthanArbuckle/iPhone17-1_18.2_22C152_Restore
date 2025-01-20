@interface JavaLangMath
+ (const)__metadata;
+ (double)absWithDouble:(double)a3;
+ (double)ceilWithDouble:(double)a3;
+ (double)floorWithDouble:(double)a3;
+ (double)maxWithDouble:(double)result withDouble:(double)a4;
+ (double)minWithDouble:(double)a3 withDouble:(double)a4;
+ (double)nextAfterWithDouble:(double)a3 withDouble:(double)a4;
+ (double)rintWithDouble:(double)a3;
+ (double)scalbWithDouble:(double)a3 withInt:(int)a4;
+ (double)signumWithDouble:(double)a3;
+ (double)sqrtWithDouble:(double)a3;
+ (double)toDegreesWithDouble:(double)a3;
+ (double)toRadiansWithDouble:(double)a3;
+ (float)absWithFloat:(float)a3;
+ (float)maxWithFloat:(float)result withFloat:(float)a4;
+ (float)minWithFloat:(float)a3 withFloat:(float)a4;
+ (float)scalbWithFloat:(float)a3 withInt:(int)a4;
+ (float)signumWithFloat:(float)a3;
+ (int)absWithInt:(int)a3;
+ (int)getExponentWithDouble:(double)a3;
+ (int)getExponentWithFloat:(float)a3;
+ (int)maxWithInt:(int)a3 withInt:(int)a4;
+ (int)minWithInt:(int)a3 withInt:(int)a4;
+ (int)roundWithFloat:(float)a3;
+ (int)shiftIntBitsWithInt:(int)a3 withInt:(int)a4;
+ (int64_t)absWithLong:(int64_t)a3;
+ (int64_t)maxWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)minWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)roundWithDouble:(double)a3;
+ (int64_t)shiftLongBitsWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (void)setRandomSeedInternalWithLong:(int64_t)a3;
@end

@implementation JavaLangMath

+ (double)absWithDouble:(double)a3
{
  uint64_t v3 = JavaLangDouble_doubleToRawLongBitsWithDouble_(a3) & 0x7FFFFFFFFFFFFFFFLL;
  return JavaLangDouble_longBitsToDoubleWithLong_(v3);
}

+ (float)absWithFloat:(float)a3
{
  int v3 = JavaLangFloat_floatToRawIntBitsWithFloat_(a3) & 0x7FFFFFFF;
  return JavaLangFloat_intBitsToFloatWithInt_(v3);
}

+ (int)absWithInt:(int)a3
{
  if (a3 >= 0) {
    return a3;
  }
  else {
    return -a3;
  }
}

+ (int64_t)absWithLong:(int64_t)a3
{
  if (a3 >= 0) {
    return a3;
  }
  else {
    return -a3;
  }
}

+ (double)ceilWithDouble:(double)a3
{
  return ceil(a3);
}

+ (double)floorWithDouble:(double)a3
{
  return floor(a3);
}

+ (double)maxWithDouble:(double)result withDouble:(double)a4
{
  if (result <= a4)
  {
    if (result >= a4)
    {
      if (result == a4)
      {
        uint64_t v5 = JavaLangDouble_doubleToRawLongBitsWithDouble_(result);
        result = 0.0;
        if (v5) {
          return a4;
        }
      }
      else
      {
        return NAN;
      }
    }
    else
    {
      return a4;
    }
  }
  return result;
}

+ (float)maxWithFloat:(float)result withFloat:(float)a4
{
  if (result <= a4)
  {
    if (result >= a4)
    {
      if (result == a4)
      {
        int v5 = JavaLangFloat_floatToRawIntBitsWithFloat_(result);
        result = 0.0;
        if (v5) {
          return a4;
        }
      }
      else
      {
        return NAN;
      }
    }
    else
    {
      return a4;
    }
  }
  return result;
}

+ (int)maxWithInt:(int)a3 withInt:(int)a4
{
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (int64_t)maxWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (double)minWithDouble:(double)a3 withDouble:(double)a4
{
  double v4 = a4;
  if (a3 <= a4)
  {
    if (a3 >= a4)
    {
      if (a3 == a4)
      {
        if (JavaLangDouble_doubleToRawLongBitsWithDouble_(a3) == 0x8000000000000000) {
          return -0.0;
        }
      }
      else
      {
        return NAN;
      }
    }
    else
    {
      return a3;
    }
  }
  return v4;
}

+ (float)minWithFloat:(float)a3 withFloat:(float)a4
{
  float v4 = a4;
  if (a3 <= a4)
  {
    if (a3 >= a4)
    {
      if (a3 == a4)
      {
        if (JavaLangFloat_floatToRawIntBitsWithFloat_(a3) == 0x80000000) {
          return -0.0;
        }
      }
      else
      {
        return NAN;
      }
    }
    else
    {
      return a3;
    }
  }
  return v4;
}

+ (int)minWithInt:(int)a3 withInt:(int)a4
{
  if (a3 >= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (int64_t)minWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a3 >= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (double)rintWithDouble:(double)a3
{
  return rint(a3);
}

+ (int64_t)roundWithDouble:(double)a3
{
  double v3 = a3 + 0.5;
  int64_t v4 = vcvtmd_s64_f64(v3);
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (floor(v3) < 0.0) {
    int64_t v5 = 0x8000000000000000;
  }
  if (v4 == 0x8000000000000000) {
    return v5;
  }
  else {
    return v4;
  }
}

+ (int)roundWithFloat:(float)a3
{
  float v3 = a3 + 0.5;
  int v4 = vcvtms_s32_f32(v3);
  if (floorf(v3) < 0.0) {
    int v5 = 0x80000000;
  }
  else {
    int v5 = 0x7FFFFFFF;
  }
  if (v4 == 0x80000000) {
    return v5;
  }
  else {
    return v4;
  }
}

+ (double)signumWithDouble:(double)a3
{
  if (JavaLangDouble_isNaNWithDouble_()) {
    return NAN;
  }
  double result = 1.0;
  double v5 = -1.0;
  if (a3 >= 0.0) {
    double v5 = a3;
  }
  if (a3 <= 0.0) {
    return v5;
  }
  return result;
}

+ (float)signumWithFloat:(float)a3
{
  if (JavaLangFloat_isNaNWithFloat_()) {
    return NAN;
  }
  float result = 1.0;
  float v5 = -1.0;
  if (a3 >= 0.0) {
    float v5 = a3;
  }
  if (a3 <= 0.0) {
    return v5;
  }
  return result;
}

+ (double)sqrtWithDouble:(double)a3
{
  return sqrt(a3);
}

+ (void)setRandomSeedInternalWithLong:(int64_t)a3
{
}

+ (double)toRadiansWithDouble:(double)a3
{
  return a3 / 180.0 * 3.14159265;
}

+ (double)toDegreesWithDouble:(double)a3
{
  return a3 * 180.0 / 3.14159265;
}

+ (int)getExponentWithFloat:(float)a3
{
  return (JavaLangFloat_floatToRawIntBitsWithFloat_(a3) >> 23) - 127;
}

+ (int)getExponentWithDouble:(double)a3
{
  return (((unint64_t)JavaLangDouble_doubleToRawLongBitsWithDouble_(a3) >> 52) & 0x7FF) - 1023;
}

+ (double)nextAfterWithDouble:(double)a3 withDouble:(double)a4
{
  if (a3 == 0.0 && a4 == 0.0) {
    return a4;
  }
  else {
    return nextafter(a3, a4);
  }
}

+ (double)scalbWithDouble:(double)a3 withInt:(int)a4
{
  return JavaLangMath_scalbWithDouble_withInt_(a4, a3);
}

+ (float)scalbWithFloat:(float)a3 withInt:(int)a4
{
  return JavaLangMath_scalbWithFloat_withInt_(a4, a3);
}

+ (int)shiftIntBitsWithInt:(int)a3 withInt:(int)a4
{
  return sub_1001E4844(a3, a4);
}

+ (int64_t)shiftLongBitsWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return sub_1001E48E8(a3, a4);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100433EA0;
}

@end
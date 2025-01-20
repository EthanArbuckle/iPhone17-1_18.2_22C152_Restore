@interface JavaLangStrictMath
+ (const)__metadata;
+ (double)ceilWithDouble:(double)a3;
+ (double)cosWithDouble:(double)a3;
+ (double)floorWithDouble:(double)a3;
+ (double)powWithDouble:(double)a3 withDouble:(double)a4;
+ (double)random;
+ (double)rintWithDouble:(double)a3;
+ (double)scalbWithDouble:(double)a3 withInt:(int)a4;
+ (double)sinWithDouble:(double)a3;
+ (double)sqrtWithDouble:(double)a3;
+ (float)scalbWithFloat:(float)a3 withInt:(int)a4;
+ (int)absWithInt:(int)a3;
+ (int)maxWithInt:(int)a3 withInt:(int)a4;
+ (int)minWithInt:(int)a3 withInt:(int)a4;
+ (int)shiftIntBitsWithInt:(int)a3 withInt:(int)a4;
+ (int64_t)absWithLong:(int64_t)a3;
+ (int64_t)maxWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)minWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)shiftLongBitsWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (void)initialize;
@end

@implementation JavaLangStrictMath

+ (int)absWithInt:(int)a3
{
  return JavaLangStrictMath_absWithInt_(*(uint64_t *)&a3);
}

+ (int64_t)absWithLong:(int64_t)a3
{
  return JavaLangStrictMath_absWithLong_(a3);
}

+ (double)ceilWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return ceil(a3);
}

+ (double)cosWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return cos(a3);
}

+ (double)floorWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return floor(a3);
}

+ (int)maxWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangStrictMath_maxWithInt_withInt_(*(uint64_t *)&a3, a4);
}

+ (int64_t)maxWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (int)minWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangStrictMath_minWithInt_withInt_(*(uint64_t *)&a3, a4);
}

+ (int64_t)minWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 >= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (double)powWithDouble:(double)a3 withDouble:(double)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return pow(a3, a4);
}

+ (double)random
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return JavaLangMath_random();
}

+ (double)rintWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return rint(a3);
}

+ (double)sinWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return sin(a3);
}

+ (double)sqrtWithDouble:(double)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangStrictMath__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return sqrt(a3);
}

+ (double)scalbWithDouble:(double)a3 withInt:(int)a4
{
  return JavaLangStrictMath_scalbWithDouble_withInt_(a4, a3);
}

+ (float)scalbWithFloat:(float)a3 withInt:(int)a4
{
  return JavaLangStrictMath_scalbWithFloat_withInt_(a4, a3);
}

+ (int)shiftIntBitsWithInt:(int)a3 withInt:(int)a4
{
  return sub_100223C1C(a3, a4);
}

+ (int64_t)shiftLongBitsWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return sub_100223CD0(a3, a4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3[0] = xmmword_100320770;
    v3[1] = unk_100320780;
    JreStrongAssignAndConsume((id *)&qword_100560F80, +[IOSDoubleArray newArrayWithDoubles:v3 count:4]);
    v2[0] = xmmword_100320790;
    v2[1] = unk_1003207A0;
    JreStrongAssignAndConsume((id *)&qword_100560F88, +[IOSDoubleArray newArrayWithDoubles:v2 count:4]);
    LODWORD(qword_100560F90) = JavaLangDouble_doubleToRawLongBitsWithDouble_(1.0);
    qword_100560F90 = qword_100560F90;
    atomic_store(1u, (unsigned __int8 *)&JavaLangStrictMath__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100450808;
}

@end
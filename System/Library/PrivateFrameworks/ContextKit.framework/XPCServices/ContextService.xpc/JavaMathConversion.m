@interface JavaMathConversion
+ (const)__metadata;
+ (double)bigInteger2DoubleWithJavaMathBigInteger:(id)a3;
+ (id)bigInteger2StringWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)toDecimalScaledStringWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)toDecimalScaledStringWithLong:(int64_t)a3 withInt:(int)a4;
+ (int64_t)divideLongByBillionWithLong:(int64_t)a3;
+ (void)initialize;
@end

@implementation JavaMathConversion

+ (id)bigInteger2StringWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return (id)JavaMathConversion_bigInteger2StringWithJavaMathBigInteger_withInt_((uint64_t)a3, *(uint64_t *)&a4);
}

+ (id)toDecimalScaledStringWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathConversion_toDecimalScaledStringWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (id)toDecimalScaledStringWithLong:(int64_t)a3 withInt:(int)a4
{
  return JavaMathConversion_toDecimalScaledStringWithLong_withInt_(a3, a4);
}

+ (int64_t)divideLongByBillionWithLong:(int64_t)a3
{
  return JavaMathConversion_divideLongByBillionWithLong_(a3);
}

+ (double)bigInteger2DoubleWithJavaMathBigInteger:(id)a3
{
  return JavaMathConversion_bigInteger2DoubleWithJavaMathBigInteger_((uint64_t)a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    int v5 = 5;
    v4[6] = xmmword_100320480;
    v4[7] = unk_100320490;
    v4[8] = xmmword_1003204A0;
    v4[2] = xmmword_100320440;
    v4[3] = unk_100320450;
    v4[4] = xmmword_100320460;
    v4[5] = unk_100320470;
    v4[0] = xmmword_100320420;
    v4[1] = unk_100320430;
    JreStrongAssignAndConsume((id *)&JavaMathConversion_digitFitInInt_, +[IOSIntArray newArrayWithInts:v4 count:37]);
    v2[6] = xmmword_100320514;
    v3[0] = unk_100320524;
    *(_OWORD *)((char *)v3 + 12) = unk_100320530;
    v2[2] = xmmword_1003204D4;
    v2[3] = unk_1003204E4;
    v2[4] = xmmword_1003204F4;
    v2[5] = unk_100320504;
    v2[0] = xmmword_1003204B4;
    v2[1] = unk_1003204C4;
    JreStrongAssignAndConsume((id *)&JavaMathConversion_bigRadices_, +[IOSIntArray newArrayWithInts:v2 count:35]);
    atomic_store(1u, (unsigned __int8 *)JavaMathConversion__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100446768;
}

@end
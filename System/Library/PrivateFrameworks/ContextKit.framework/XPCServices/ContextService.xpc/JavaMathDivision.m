@interface JavaMathDivision
+ (const)__metadata;
+ (id)divideAndRemainderByIntegerWithJavaMathBigInteger:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)divideWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withIntArray:(id)a7 withInt:(int)a8;
+ (id)evenModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5;
+ (id)finalSubtractionWithIntArray:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)gcdBinaryWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)modInverseHarsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)modInverseMontgomeryWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)modPow2InverseWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)monProWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withInt:(int)a6;
+ (id)oddModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5;
+ (id)pow2ModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5;
+ (id)slidingWindowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withJavaMathBigInteger:(id)a6 withInt:(int)a7;
+ (id)squareAndMultiplyWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withJavaMathBigInteger:(id)a6 withInt:(int)a7;
+ (int)calcNWithJavaMathBigInteger:(id)a3;
+ (int)divideArrayByIntWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)multiplyAndSubtractWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (int)remainderArrayByIntWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)remainderWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (int64_t)divideLongByIntWithLong:(int64_t)a3 withInt:(int)a4;
+ (int64_t)gcdBinaryWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (void)inplaceModPow2WithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (void)monReductionWithIntArray:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5;
@end

@implementation JavaMathDivision

+ (id)divideWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withIntArray:(id)a7 withInt:(int)a8
{
  return JavaMathDivision_divideWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_((uint64_t)a3, a4, (unsigned int *)a5, *(uint64_t *)&a6, (unsigned int *)a7, *(uint64_t *)&a8);
}

+ (int)divideArrayByIntWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return JavaMathDivision_divideArrayByIntWithIntArray_withIntArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int)remainderArrayByIntWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaMathDivision_remainderArrayByIntWithIntArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)remainderWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = *((void *)a3 + 1);
  int v5 = *((_DWORD *)a3 + 4);
  return JavaMathDivision_remainderArrayByIntWithIntArray_withInt_withInt_(v4, v5, a4);
}

+ (int64_t)divideLongByIntWithLong:(int64_t)a3 withInt:(int)a4
{
  return JavaMathDivision_divideLongByIntWithLong_withInt_(a3, a4);
}

+ (id)divideAndRemainderByIntegerWithJavaMathBigInteger:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaMathDivision_divideAndRemainderByIntegerWithJavaMathBigInteger_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)multiplyAndSubtractWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return JavaMathDivision_multiplyAndSubtractWithIntArray_withInt_withIntArray_withInt_withInt_((uint64_t)a3, a4, (uint64_t)a5, a6, a7);
}

+ (id)gcdBinaryWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathDivision_gcdBinaryWithJavaMathBigInteger_withJavaMathBigInteger_(a3, a4);
}

+ (int64_t)gcdBinaryWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return JavaMathDivision_gcdBinaryWithLong_withLong_(a3, a4);
}

+ (id)modInverseMontgomeryWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathDivision_modInverseMontgomeryWithJavaMathBigInteger_withJavaMathBigInteger_(a3, a4);
}

+ (int)calcNWithJavaMathBigInteger:(id)a3
{
  return sub_100157748((uint64_t)a3);
}

+ (id)squareAndMultiplyWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withJavaMathBigInteger:(id)a6 withInt:(int)a7
{
  return JavaMathDivision_squareAndMultiplyWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withInt_((JavaMathBigInteger *)a3, (uint64_t)a4, a5, (uint64_t)a6, a7);
}

+ (id)modInverseHarsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathDivision_modInverseHarsWithJavaMathBigInteger_withJavaMathBigInteger_(a3, a4);
}

+ (id)slidingWindowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withJavaMathBigInteger:(id)a6 withInt:(int)a7
{
  return JavaMathDivision_slidingWindowWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withInt_((JavaMathBigInteger *)a3, a4, a5, (uint64_t)a6, a7);
}

+ (id)oddModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5
{
  return JavaMathDivision_oddModPowWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(a3, a4, (uint64_t)a5);
}

+ (id)evenModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5
{
  return JavaMathDivision_evenModPowWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(a3, a4, a5);
}

+ (id)pow2ModPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5
{
  return JavaMathDivision_pow2ModPowWithJavaMathBigInteger_withJavaMathBigInteger_withInt_(a3, a4, a5);
}

+ (void)monReductionWithIntArray:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5
{
}

+ (id)monProWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withJavaMathBigInteger:(id)a5 withInt:(int)a6
{
  return JavaMathDivision_monProWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_withInt_((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6);
}

+ (id)finalSubtractionWithIntArray:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathDivision_finalSubtractionWithIntArray_withJavaMathBigInteger_((unsigned int *)a3, (uint64_t)a4);
}

+ (id)modPow2InverseWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathDivision_modPow2InverseWithJavaMathBigInteger_withInt_(a3, a4);
}

+ (void)inplaceModPow2WithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F8208;
}

@end
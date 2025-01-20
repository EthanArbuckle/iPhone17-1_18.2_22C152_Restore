@interface JavaMathElementary
+ (const)__metadata;
+ (id)addWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6;
+ (id)addWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)subtractWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6;
+ (id)subtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (int)compareArraysWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5;
+ (int)inplaceAddWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)unsignedArraysCompareWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)addWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7;
+ (void)completeInPlaceAddWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (void)completeInPlaceSubtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (void)inplaceAddWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (void)inplaceAddWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (void)inplaceSubtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (void)inverseSubtractWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7;
+ (void)subtractWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7;
@end

@implementation JavaMathElementary

+ (int)compareArraysWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5
{
  return JavaMathElementary_compareArraysWithIntArray_withIntArray_withInt_((uint64_t)a3, (uint64_t)a4, a5);
}

+ (id)addWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathElementary_addWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (void)addWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7
{
}

+ (id)subtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathElementary_subtractWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (void)subtractWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7
{
}

+ (id)addWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  v10 = +[IOSIntArray arrayWithLength:a4 + 1];
  sub_10025549C((uint64_t)v10, (uint64_t)a3, v8, (uint64_t)a5, v6);
  return v10;
}

+ (void)inplaceAddWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
}

+ (int)inplaceAddWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaMathElementary_inplaceAddWithIntArray_withInt_withInt_((uint64_t)a3, a4, *(unint64_t *)&a5);
}

+ (void)inplaceAddWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
}

+ (void)inplaceSubtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
}

+ (void)inverseSubtractWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7
{
}

+ (id)subtractWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6
{
  v10 = +[IOSIntArray arrayWithLength:a4];
  sub_100255C38((uint64_t)v10, (uint64_t)a3, a4, (uint64_t)a5, a6);
  return v10;
}

+ (void)completeInPlaceSubtractWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
}

+ (void)completeInPlaceAddWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
}

+ (int)unsignedArraysCompareWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_1002568A8((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100467040;
}

@end
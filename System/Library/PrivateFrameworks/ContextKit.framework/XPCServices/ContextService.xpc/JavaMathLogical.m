@interface JavaMathLogical
+ (const)__metadata;
+ (id)andDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNotNegativePositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNotNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNotPositiveNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNotPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andNotWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)andPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)and__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)not__WithJavaMathBigInteger:(id)a3;
+ (id)orDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)orNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)orPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)or__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)xorDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)xorNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)xorPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)xor__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
@end

@implementation JavaMathLogical

+ (id)not__WithJavaMathBigInteger:(id)a3
{
  return JavaMathLogical_not__WithJavaMathBigInteger_((uint64_t)a3);
}

+ (id)and__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_and__WithJavaMathBigInteger_withJavaMathBigInteger_(a3, a4);
}

+ (id)andPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return (id)JavaMathLogical_andPositiveWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)andDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return (id)JavaMathLogical_andDiffSignsWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)andNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_andNegativeWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)andNotWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_andNotWithJavaMathBigInteger_withJavaMathBigInteger_((JavaMathBigInteger *)a3, a4);
}

+ (id)andNotPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_andNotPositiveWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)andNotPositiveNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_andNotPositiveNegativeWithJavaMathBigInteger_withJavaMathBigInteger_((JavaMathBigInteger *)a3, (uint64_t)a4);
}

+ (id)andNotNegativePositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_andNotNegativePositiveWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)andNotNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return (id)JavaMathLogical_andNotNegativeWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)or__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_or__WithJavaMathBigInteger_withJavaMathBigInteger_((JavaMathBigInteger *)a3, (JavaMathBigInteger *)a4);
}

+ (id)orPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_orPositiveWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)orNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_orNegativeWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (JavaMathBigInteger *)a4);
}

+ (id)orDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_orDiffSignsWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (JavaMathBigInteger *)a4);
}

+ (id)xor__WithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_xor__WithJavaMathBigInteger_withJavaMathBigInteger_(a3, a4);
}

+ (id)xorPositiveWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_xorPositiveWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)xorNegativeWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_xorNegativeWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (id)xorDiffSignsWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathLogical_xorDiffSignsWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100401CE0;
}

@end
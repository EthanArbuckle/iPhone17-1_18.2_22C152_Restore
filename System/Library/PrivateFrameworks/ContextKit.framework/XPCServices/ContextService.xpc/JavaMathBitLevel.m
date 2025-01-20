@interface JavaMathBitLevel
+ (BOOL)nonZeroDroppedBitsWithInt:(int)a3 withIntArray:(id)a4;
+ (BOOL)shiftRightWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (BOOL)testBitWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (const)__metadata;
+ (id)flipBitWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)shiftLeftOneBitWithJavaMathBigInteger:(id)a3;
+ (id)shiftLeftWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)shiftRightWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (int)bitCountWithJavaMathBigInteger:(id)a3;
+ (int)bitLengthWithJavaMathBigInteger:(id)a3;
+ (void)inplaceShiftLeftWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (void)inplaceShiftRightWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (void)shiftLeftOneBitWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5;
+ (void)shiftLeftWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation JavaMathBitLevel

+ (int)bitLengthWithJavaMathBigInteger:(id)a3
{
  return JavaMathBitLevel_bitLengthWithJavaMathBigInteger_((uint64_t)a3);
}

+ (int)bitCountWithJavaMathBigInteger:(id)a3
{
  return JavaMathBitLevel_bitCountWithJavaMathBigInteger_((uint64_t)a3);
}

+ (BOOL)testBitWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathBitLevel_testBitWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (BOOL)nonZeroDroppedBitsWithInt:(int)a3 withIntArray:(id)a4
{
  return JavaMathBitLevel_nonZeroDroppedBitsWithInt_withIntArray_(a3, (uint64_t)a4);
}

+ (id)shiftLeftWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathBitLevel_shiftLeftWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (void)inplaceShiftLeftWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
}

+ (void)shiftLeftWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (void)shiftLeftOneBitWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5
{
}

+ (id)shiftLeftOneBitWithJavaMathBigInteger:(id)a3
{
  return JavaMathBitLevel_shiftLeftOneBitWithJavaMathBigInteger_((uint64_t)a3);
}

+ (id)shiftRightWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathBitLevel_shiftRightWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (void)inplaceShiftRightWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
}

+ (BOOL)shiftRightWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return JavaMathBitLevel_shiftRightWithIntArray_withInt_withIntArray_withInt_withInt_((int *)a3, *(uint64_t *)&a4, (int *)a5, *(uint64_t *)&a6, a7);
}

+ (id)flipBitWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathBitLevel_flipBitWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047BB28;
}

@end
@interface JavaMathMultiplication
+ (const)__metadata;
+ (id)karatsubaWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)multiplyByFivePowWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)multiplyByPositiveIntWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)multiplyByTenPowWithJavaMathBigInteger:(id)a3 withLong:(int64_t)a4;
+ (id)multiplyPAPWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)multiplyWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
+ (id)powWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (id)powerOf10WithLong:(int64_t)a3;
+ (id)squareWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5;
+ (int)multiplyByIntWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)multiplyByIntWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int64_t)unsignedMultAddAddWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)initialize;
+ (void)multArraysPAPWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withIntArray:(id)a7;
+ (void)multPAPWithIntArray:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation JavaMathMultiplication

+ (id)multiplyWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathMultiplication_multiplyWithJavaMathBigInteger_withJavaMathBigInteger_((int *)a3, (int *)a4);
}

+ (id)karatsubaWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathMultiplication_karatsubaWithJavaMathBigInteger_withJavaMathBigInteger_((int *)a3, (int *)a4);
}

+ (id)multiplyPAPWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  return JavaMathMultiplication_multiplyPAPWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)a3, (uint64_t)a4);
}

+ (void)multArraysPAPWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withIntArray:(id)a7
{
}

+ (void)multPAPWithIntArray:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
}

+ (int)multiplyByIntWithIntArray:(id)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_1001FEB68((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int)multiplyByIntWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaMathMultiplication_multiplyByIntWithIntArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (id)multiplyByPositiveIntWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathMultiplication_multiplyByPositiveIntWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (id)powWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathMultiplication_powWithJavaMathBigInteger_withInt_((JavaMathBigInteger *)a3, a4);
}

+ (id)squareWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5
{
  return (id)JavaMathMultiplication_squareWithIntArray_withInt_withIntArray_((uint64_t)a3, a4, (uint64_t)a5);
}

+ (id)multiplyByTenPowWithJavaMathBigInteger:(id)a3 withLong:(int64_t)a4
{
  return JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(a3, a4);
}

+ (id)powerOf10WithLong:(int64_t)a3
{
  return JavaMathMultiplication_powerOf10WithLong_(a3);
}

+ (id)multiplyByFivePowWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathMultiplication_multiplyByFivePowWithJavaMathBigInteger_withInt_(a3, *(uint64_t *)&a4);
}

+ (int64_t)unsignedMultAddAddWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  if ((atomic_load_explicit(JavaMathMultiplication__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return a5 + a4 * (unint64_t)a3 + a6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v19[0] = xmmword_1003203C0;
    v19[1] = unk_1003203D0;
    uint64_t v20 = 4294967296100000000;
    JreStrongAssignAndConsume((id *)&JavaMathMultiplication_tenPows_, +[IOSIntArray newArrayWithInts:v19 count:10]);
    v17[0] = xmmword_1003203E8;
    v17[1] = unk_1003203F8;
    v17[2] = xmmword_100320408;
    uint64_t v18 = 0x48C273950E8D4A51;
    JreStrongAssignAndConsume((id *)&JavaMathMultiplication_fivePows_, +[IOSIntArray newArrayWithInts:v17 count:14]);
    id v2 = +[IOSObjectArray newArrayWithLength:32 type:JavaMathBigInteger_class_()];
    JreStrongAssignAndConsume((id *)&JavaMathMultiplication_bigTenPows_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:32 type:JavaMathBigInteger_class_()];
    JreStrongAssignAndConsume((id *)&JavaMathMultiplication_bigFivePows_, v3);
    uint64_t v4 = 0;
    unint64_t v5 = 1;
    do
    {
      uint64_t v6 = JavaMathMultiplication_bigFivePows_;
      v7 = JavaMathBigInteger_valueOfWithLong_(v5);
      IOSObjectArray_Set(v6, v4, v7);
      uint64_t v8 = JavaMathMultiplication_bigTenPows_;
      v9 = JavaMathBigInteger_valueOfWithLong_(v5 << v4);
      IOSObjectArray_Set(v8, v4, v9);
      v5 *= 5;
      ++v4;
    }
    while (v4 != 19);
    if (*(int *)(JavaMathMultiplication_bigTenPows_ + 8) >= 20)
    {
      uint64_t v10 = 18;
      do
      {
        uint64_t v11 = *(int *)(JavaMathMultiplication_bigFivePows_ + 8);
        if (v10 + 1 > v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v10);
        }
        if (!*(void *)(JavaMathMultiplication_bigFivePows_ + 24 + 8 * v10)) {
          goto LABEL_20;
        }
        uint64_t v12 = *(unsigned int *)(JavaMathMultiplication_bigFivePows_ + 8);
        if ((int)v12 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v12, 1);
        }
        IOSObjectArray_Set(JavaMathMultiplication_bigFivePows_, v10 + 1, [*(id *)(JavaMathMultiplication_bigFivePows_ + 24 + 8 * v10) multiplyWithJavaMathBigInteger:*(void *)(JavaMathMultiplication_bigFivePows_ + 32)]);
        uint64_t v13 = JavaMathMultiplication_bigTenPows_;
        uint64_t v14 = *(int *)(JavaMathMultiplication_bigTenPows_ + 8);
        if (v10 + 1 > v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v10);
        }
        v15 = *(void **)(JavaMathMultiplication_bigTenPows_ + 24 + 8 * v10);
        if (!v15) {
LABEL_20:
        }
          JreThrowNullPointerException();
        if ((atomic_load_explicit(JavaMathBigInteger__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        IOSObjectArray_Set(v13, v10 + 1, [v15 multiplyWithJavaMathBigInteger:JavaMathBigInteger_TEN_]);
        uint64_t v16 = v10 + 2;
        ++v10;
      }
      while (v16 < *(int *)(JavaMathMultiplication_bigTenPows_ + 8));
    }
    atomic_store(1u, (unsigned __int8 *)JavaMathMultiplication__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043F8F8;
}

@end
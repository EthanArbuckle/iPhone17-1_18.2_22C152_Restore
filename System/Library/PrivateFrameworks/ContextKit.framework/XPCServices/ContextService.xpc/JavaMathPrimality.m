@interface JavaMathPrimality
+ (BOOL)isProbablePrimeWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (BOOL)millerRabinWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
+ (const)__metadata;
+ (id)consBigIntegerWithInt:(int)a3 withInt:(int)a4 withJavaUtilRandom:(id)a5;
+ (id)nextProbablePrimeWithJavaMathBigInteger:(id)a3;
+ (void)initialize;
@end

@implementation JavaMathPrimality

+ (id)nextProbablePrimeWithJavaMathBigInteger:(id)a3
{
  return JavaMathPrimality_nextProbablePrimeWithJavaMathBigInteger_((uint64_t)a3);
}

+ (id)consBigIntegerWithInt:(int)a3 withInt:(int)a4 withJavaUtilRandom:(id)a5
{
  return JavaMathPrimality_consBigIntegerWithInt_withInt_withJavaUtilRandom_(*(uint64_t *)&a3, a4, a5);
}

+ (BOOL)isProbablePrimeWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return JavaMathPrimality_isProbablePrimeWithJavaMathBigInteger_withInt_((uint64_t)a3, a4);
}

+ (BOOL)millerRabinWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return sub_1001DE8AC(a3, a4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    memcpy(__dst, &unk_10031FFF0, sizeof(__dst));
    JreStrongAssignAndConsume((id *)&qword_100560CF0, +[IOSIntArray newArrayWithInts:__dst count:172]);
    id v2 = +[IOSObjectArray newArrayWithLength:*(int *)(qword_100560CF0 + 8) type:JavaMathBigInteger_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560CF8, v2);
    int v19 = 1;
    v18[10] = xmmword_100320340;
    v18[11] = unk_100320350;
    v18[12] = xmmword_100320360;
    v18[6] = xmmword_100320300;
    v18[7] = unk_100320310;
    v18[8] = xmmword_100320320;
    v18[9] = unk_100320330;
    v18[2] = xmmword_1003202C0;
    v18[3] = unk_1003202D0;
    v18[4] = xmmword_1003202E0;
    v18[5] = unk_1003202F0;
    v18[0] = xmmword_1003202A0;
    v18[1] = unk_1003202B0;
    JreStrongAssignAndConsume((id *)&qword_100560D00, +[IOSIntArray newArrayWithInts:v18 count:53]);
    v17[0] = 0;
    v17[1] = 0;
    uint64_t v16 = 0x200000000;
    v17[2] = +[IOSIntArray arrayWithInts:&v16 count:2];
    uint64_t v15 = 0x200000002;
    v17[3] = +[IOSIntArray arrayWithInts:&v15 count:2];
    uint64_t v14 = 0x200000004;
    v17[4] = +[IOSIntArray arrayWithInts:&v14 count:2];
    uint64_t v13 = 0x500000006;
    v17[5] = +[IOSIntArray arrayWithInts:&v13 count:2];
    uint64_t v12 = 0x70000000BLL;
    v17[6] = +[IOSIntArray arrayWithInts:&v12 count:2];
    uint64_t v11 = 0xD00000012;
    v17[7] = +[IOSIntArray arrayWithInts:&v11 count:2];
    uint64_t v10 = 0x170000001FLL;
    v17[8] = +[IOSIntArray arrayWithInts:&v10 count:2];
    uint64_t v9 = 0x2B00000036;
    v17[9] = +[IOSIntArray arrayWithInts:&v9 count:2];
    uint64_t v8 = 0x4B00000061;
    v17[10] = +[IOSIntArray arrayWithInts:&v8 count:2];
    id v3 = +[IOSObjectArray newArrayWithObjects:count:type:](IOSObjectArray, "newArrayWithObjects:count:type:", v17, 11, IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u));
    JreStrongAssignAndConsume((id *)&qword_100560D08, v3);
    uint64_t v4 = qword_100560CF0;
    if (*(int *)(qword_100560CF0 + 8) >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = qword_100560CF8;
        v7 = JavaMathBigInteger_valueOfWithLong_(*(int *)(v4 + 12 + 4 * v5));
        IOSObjectArray_Set(v6, v5++, v7);
        uint64_t v4 = qword_100560CF0;
      }
      while (v5 < *(int *)(qword_100560CF0 + 8));
    }
    atomic_store(1u, (unsigned __int8 *)&JavaMathPrimality__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100430D20;
}

@end
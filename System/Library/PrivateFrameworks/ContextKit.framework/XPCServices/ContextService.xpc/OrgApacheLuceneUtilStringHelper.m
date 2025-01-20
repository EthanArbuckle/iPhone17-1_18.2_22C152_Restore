@interface OrgApacheLuceneUtilStringHelper
+ (BOOL)endsWithWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (BOOL)equalsWithNSString:(id)a3 withNSString:(id)a4;
+ (BOOL)startsWithWithByteArray:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (BOOL)startsWithWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (id)idToStringWithByteArray:(id)a3;
+ (id)intsRefToBytesRefWithOrgApacheLuceneUtilIntsRef:(id)a3;
+ (int)bytesDifferenceWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (int)murmurhash3_x86_32WithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)murmurhash3_x86_32WithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4;
+ (int)sortKeyLengthWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilStringHelper

+ (int)bytesDifferenceWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_bytesDifferenceWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a4);
}

+ (int)sortKeyLengthWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_sortKeyLengthWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a4);
}

+ (BOOL)equalsWithNSString:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_equalsWithNSString_withNSString_(a3, (uint64_t)a4);
}

+ (BOOL)startsWithWithByteArray:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_startsWithWithByteArray_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a4);
}

+ (BOOL)startsWithWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_startsWithWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a4);
}

+ (BOOL)endsWithWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilStringHelper_endsWithWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a4);
}

+ (int)murmurhash3_x86_32WithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilStringHelper_murmurhash3_x86_32WithByteArray_withInt_withInt_withInt_((uint64_t)a3, a4, a5, a6);
}

+ (int)murmurhash3_x86_32WithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilStringHelper_murmurhash3_x86_32WithOrgApacheLuceneUtilBytesRef_withInt_((uint64_t)a3, a4);
}

+ (id)idToStringWithByteArray:(id)a3
{
  return (id)OrgApacheLuceneUtilStringHelper_idToStringWithByteArray_((uint64_t)a3);
}

+ (id)intsRefToBytesRefWithOrgApacheLuceneUtilIntsRef:(id)a3
{
  return OrgApacheLuceneUtilStringHelper_intsRefToBytesRefWithOrgApacheLuceneUtilIntsRef_((uint64_t)a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"tests.seed");
    if (PropertyWithNSString) {
      unsigned int v3 = [PropertyWithNSString hash];
    }
    else {
      unsigned int v3 = JavaLangSystem_currentTimeMillis();
    }
    OrgApacheLuceneUtilStringHelper_GOOD_FAST_HASH_SEED_ = v3;
    JreStrongAssignAndConsume((id *)&qword_10055FC08, objc_alloc((Class)NSObject));
    v4 = +[IOSByteArray arrayWithLength:16];
    JavaUtilArrays_fillWithByteArray_withByte_((uint64_t)v4, -1);
    v5 = new_JavaMathBigInteger_initWithInt_withByteArray_(1, (uint64_t)v4);
    JreStrongAssignAndConsume((id *)&qword_10055FC10, v5);
    id v6 = JavaLangSystem_getPropertyWithNSString_(@"tests.seed");
    if (v6)
    {
      id v7 = v6;
      if ((int)[v6 length] >= 9) {
        id v7 = objc_msgSend(v7, "substring:", objc_msgSend(v7, "length") - 8);
      }
      unint64_t v14 = JavaLangLong_parseLongWithNSString_withInt_(v7, 16, v8, v9, v10, v11, v12, v13);
      unint64_t v15 = v14;
    }
    else
    {
      uint64_t v16 = arc4random();
      unint64_t v14 = v16 | ((unint64_t)arc4random() << 32);
      uint64_t v17 = arc4random();
      unint64_t v15 = v17 | ((unint64_t)arc4random() << 32);
    }
    int v18 = 10;
    do
    {
      unint64_t v19 = v15;
      v15 ^= (v15 >> 26) ^ ((v14 ^ (v14 << 23)) >> 17) ^ v14 ^ (v14 << 23);
      unint64_t v14 = v19;
      --v18;
    }
    while (v18);
    v20 = +[IOSByteArray arrayWithLength:8];
    JavaUtilArrays_fillWithByteArray_withByte_((uint64_t)v20, -1);
    v21 = new_JavaMathBigInteger_initWithInt_withByteArray_(1, (uint64_t)v20);
    v22 = JavaMathBigInteger_valueOfWithLong_(v19);
    if (!v22
      || (id v23 = [(JavaMathBigInteger *)v22 and__WithJavaMathBigInteger:v21],
          (v24 = JavaMathBigInteger_valueOfWithLong_(v15)) == 0)
      || (id v25 = [(JavaMathBigInteger *)v24 and__WithJavaMathBigInteger:v21], !v23)
      || (id v26 = v25, (v27 = [v23 shiftLeftWithInt:64]) == 0))
    {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)&qword_10055FC18, objc_msgSend(v27, "or__WithJavaMathBigInteger:", v26));
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilStringHelper__initialized);
  }
}

@end
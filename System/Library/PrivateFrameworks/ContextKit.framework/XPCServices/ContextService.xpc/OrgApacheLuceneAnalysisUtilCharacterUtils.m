@interface OrgApacheLuceneAnalysisUtilCharacterUtils
+ (id)getInstance;
+ (id)getJava4Instance;
+ (id)newCharacterBufferWithInt:(int)a3;
+ (int)readFullyWithJavaIoReader:(id)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)initialize;
- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4;
- (int)toCharsWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withCharArray:(id)a6 withInt:(int)a7;
- (int)toCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7;
- (void)toLowerCaseWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)toUpperCaseWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneAnalysisUtilCharacterUtils

+ (id)getInstance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneAnalysisUtilCharacterUtils__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return (id)qword_100560298;
  }
}

+ (id)getJava4Instance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneAnalysisUtilCharacterUtils__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return (id)qword_100560290;
  }
}

+ (id)newCharacterBufferWithInt:(int)a3
{
  return OrgApacheLuceneAnalysisUtilCharacterUtils_newCharacterBufferWithInt_(a3);
}

- (void)toLowerCaseWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a4 < a5)
  {
    uint64_t v21 = v8;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v24 = v5;
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    uint64_t v11 = *(void *)&a5;
    uint64_t v12 = *(void *)&a4;
    do
    {
      uint64_t v15 = JavaLangCharacter_toLowerCaseWithInt_((UChar32)-[OrgApacheLuceneAnalysisUtilCharacterUtils codePointAtWithCharArray:withInt:withInt:](self, "codePointAtWithCharArray:withInt:withInt:", a3, v12, v11, v21, v22, v23, v24, v25, v26));
      uint64_t v12 = JavaLangCharacter_toCharsWithInt_withCharArray_withInt_(v15, (uint64_t)a3, v12, v16, v17, v18, v19, v20)+ v12;
    }
    while ((int)v12 < (int)v11);
  }
}

- (void)toUpperCaseWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a4 < a5)
  {
    uint64_t v21 = v8;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v24 = v5;
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    uint64_t v11 = *(void *)&a5;
    uint64_t v12 = *(void *)&a4;
    do
    {
      uint64_t v15 = JavaLangCharacter_toUpperCaseWithInt_((UChar32)-[OrgApacheLuceneAnalysisUtilCharacterUtils codePointAtWithCharArray:withInt:withInt:](self, "codePointAtWithCharArray:withInt:withInt:", a3, v12, v11, v21, v22, v23, v24, v25, v26));
      uint64_t v12 = JavaLangCharacter_toCharsWithInt_withCharArray_withInt_(v15, (uint64_t)a3, v12, v16, v17, v18, v19, v20)+ v12;
    }
    while ((int)v12 < (int)v11);
  }
}

- (int)toCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withIntArray:(id)a6 withInt:(int)a7
{
  if (a5 < 0)
  {
    uint64_t v20 = new_JavaLangIllegalArgumentException_initWithNSString_(@"srcLen must be >= 0");
    objc_exception_throw(v20);
  }
  if (!a5) {
    return 0;
  }
  int v11 = 0;
  int v12 = 0;
  uint64_t v13 = (a5 + a4);
  do
  {
    int v14 = [(OrgApacheLuceneAnalysisUtilCharacterUtils *)self codePointAtWithCharArray:a3 withInt:(v12 + a4) withInt:v13];
    int v15 = JavaLangCharacter_charCountWithInt_(v14);
    if (!a6) {
      JreThrowNullPointerException();
    }
    int v16 = v15;
    uint64_t v17 = *((unsigned int *)a6 + 2);
    int v18 = a7 + v11;
    if (a7 + v11 < 0 || v18 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v18);
    }
    *((_DWORD *)a6 + a7 + v11 + 3) = v14;
    v12 += v16;
    ++v11;
  }
  while (v12 < a5);
  return v11;
}

- (int)toCharsWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withCharArray:(id)a6 withInt:(int)a7
{
  if (a5 < 0)
  {
    int v16 = new_JavaLangIllegalArgumentException_initWithNSString_(@"srcLen must be >= 0");
    objc_exception_throw(v16);
  }
  if (!a5) {
    return 0;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v11 = 0;
  uint64_t v12 = a5;
  do
  {
    int v13 = a4;
    uint64_t v14 = *((unsigned int *)a3 + 2);
    if (a4 < 0 || a4 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, a4);
    }
    v11 += JavaLangCharacter_toCharsWithInt_withCharArray_withInt_(*((unsigned int *)a3 + a4 + 3), (uint64_t)a6, (v11 + a7), *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6, *(uint64_t *)&a7, v7);
    *(void *)&a4 = (v13 + 1);
    --v12;
  }
  while (v12);
  return v11;
}

- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4
{
  if (!a3 || !*((void *)a3 + 2)) {
    JreThrowNullPointerException();
  }
  return -[OrgApacheLuceneAnalysisUtilCharacterUtils fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:withJavaIoReader:withInt:](self, "fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:withJavaIoReader:withInt:");
}

+ (int)readFullyWithJavaIoReader:(id)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneAnalysisUtilCharacterUtils_readFullyWithJavaIoReader_withCharArray_withInt_withInt_(a3, (uint64_t)a4, a5, a6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560290, [OrgApacheLuceneAnalysisUtilCharacterUtils_Java4CharacterUtils alloc]);
    JreStrongAssignAndConsume((id *)&qword_100560298, [OrgApacheLuceneAnalysisUtilCharacterUtils_Java5CharacterUtils alloc]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneAnalysisUtilCharacterUtils__initialized);
  }
}

@end
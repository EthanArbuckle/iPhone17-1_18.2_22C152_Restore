@interface OrgApacheLuceneAnalysisUtilCharacterUtils_Java4CharacterUtils
- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4 withInt:(int)a5;
- (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
- (int)codePointCountWithJavaLangCharSequence:(id)a3;
- (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneAnalysisUtilCharacterUtils_Java4CharacterUtils

- (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 charAtWithInt:*(void *)&a4];
}

- (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a4 >= a5)
  {
    v7 = new_JavaLangIndexOutOfBoundsException_initWithNSString_(@"offset must be less than limit");
    objc_exception_throw(v7);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *((unsigned int *)a3 + 2);
  if (a4 < 0 || (int)v5 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v5, *(uint64_t *)&a4);
  }
  return *((unsigned __int16 *)a3 + a4 + 6);
}

- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4 withInt:(int)a5
{
  if (a5 < 1 || (uint64_t v7 = *((void *)a3 + 2), *(_DWORD *)(v7 + 8) < a5))
  {
    v10 = new_JavaLangIllegalArgumentException_initWithNSString_(@"numChars must be >= 1 and <= the buffer size");
    objc_exception_throw(v10);
  }
  *((_DWORD *)a3 + 6) = 0;
  int FullyWithJavaIoReader_withCharArray_withInt_withInt = OrgApacheLuceneAnalysisUtilCharacterUtils_readFullyWithJavaIoReader_withCharArray_withInt_withInt_(a4, v7, 0, a5);
  *((_DWORD *)a3 + 7) = FullyWithJavaIoReader_withCharArray_withInt_withInt;
  *((_WORD *)a3 + 4) = 0;
  return FullyWithJavaIoReader_withCharArray_withInt_withInt == a5;
}

- (int)codePointCountWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 length];
}

- (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  int result = a7 + a6;
  if (a7 + a6 < 0 || result > a5)
  {
    v8 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v8);
  }
  return result;
}

@end
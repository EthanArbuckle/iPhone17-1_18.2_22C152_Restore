@interface OrgApacheLuceneAnalysisUtilCharacterUtils_Java5CharacterUtils
- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4 withInt:(int)a5;
- (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
- (int)codePointCountWithJavaLangCharSequence:(id)a3;
- (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneAnalysisUtilCharacterUtils_Java5CharacterUtils

- (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  return JavaLangCharacter_codePointAtWithJavaLangCharSequence_withInt_(a3, *(uint64_t *)&a4);
}

- (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_codePointAtWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

- (BOOL)fillWithOrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer:(id)a3 withJavaIoReader:(id)a4 withInt:(int)a5
{
  if (a5 < 2 || (uint64_t v7 = *((void *)a3 + 2), *(_DWORD *)(v7 + 8) < a5))
  {
    v15 = new_JavaLangIllegalArgumentException_initWithNSString_(@"numChars must be >= 2 and <= the buffer size");
    objc_exception_throw(v15);
  }
  *((_DWORD *)a3 + 6) = 0;
  int v8 = *((unsigned __int16 *)a3 + 4);
  if (*((_WORD *)a3 + 4))
  {
    uint64_t v9 = *(unsigned int *)(v7 + 8);
    if ((int)v9 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v9, 0);
    }
    *(_WORD *)(v7 + 12) = v8;
    *((_WORD *)a3 + 4) = 0;
    int v8 = 1;
  }
  int v10 = OrgApacheLuceneAnalysisUtilCharacterUtils_readFullyWithJavaIoReader_withCharArray_withInt_withInt_(a4, v7, v8, a5 - v8)+ v8;
  *((_DWORD *)a3 + 7) = v10;
  if (v10 >= a5)
  {
    uint64_t v11 = *(unsigned int *)(v7 + 8);
    if (v10 > (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, (v10 - 1));
    }
    if (JavaLangCharacter_isHighSurrogateWithChar_(*(_WORD *)(v7 + 12 + 2 * (v10 - 1))))
    {
      int v12 = *((_DWORD *)a3 + 7) - 1;
      *((_DWORD *)a3 + 7) = v12;
      uint64_t v13 = *(unsigned int *)(v7 + 8);
      if (v12 < 0 || v12 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v12);
      }
      *((_WORD *)a3 + 4) = *(_WORD *)(v7 + 12 + 2 * v12);
    }
  }
  return v10 == a5;
}

- (int)codePointCountWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = [a3 length];
  return JavaLangCharacter_codePointCountWithJavaLangCharSequence_withInt_withInt_(a3, 0, v4);
}

- (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return JavaLangCharacter_offsetByCodePointsWithCharArray_withInt_withInt_withInt_withInt_((uint64_t)a3, a4, a5, *(uint64_t *)&a6, a7);
}

@end
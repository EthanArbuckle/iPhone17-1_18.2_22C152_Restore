@interface JavaLangCharacter
+ (BOOL)isAlphabeticWithInt:(int)a3;
+ (BOOL)isBmpCodePointWithInt:(int)a3;
+ (BOOL)isDefinedWithChar:(unsigned __int16)a3;
+ (BOOL)isDefinedWithInt:(int)a3;
+ (BOOL)isDigitWithChar:(unsigned __int16)a3;
+ (BOOL)isDigitWithInt:(int)a3;
+ (BOOL)isHighSurrogateWithChar:(unsigned __int16)a3;
+ (BOOL)isISOControlWithChar:(unsigned __int16)a3;
+ (BOOL)isISOControlWithInt:(int)a3;
+ (BOOL)isIdentifierIgnorableWithChar:(unsigned __int16)a3;
+ (BOOL)isIdentifierIgnorableWithInt:(int)a3;
+ (BOOL)isIdeographicWithInt:(int)a3;
+ (BOOL)isJavaIdentifierPartWithChar:(unsigned __int16)a3;
+ (BOOL)isJavaIdentifierPartWithInt:(int)a3;
+ (BOOL)isJavaIdentifierStartWithChar:(unsigned __int16)a3;
+ (BOOL)isJavaIdentifierStartWithInt:(int)a3;
+ (BOOL)isJavaLetterOrDigitWithChar:(unsigned __int16)a3;
+ (BOOL)isJavaLetterWithChar:(unsigned __int16)a3;
+ (BOOL)isLetterOrDigitWithChar:(unsigned __int16)a3;
+ (BOOL)isLetterOrDigitWithInt:(int)a3;
+ (BOOL)isLetterWithChar:(unsigned __int16)a3;
+ (BOOL)isLetterWithInt:(int)a3;
+ (BOOL)isLowSurrogateWithChar:(unsigned __int16)a3;
+ (BOOL)isLowerCaseWithChar:(unsigned __int16)a3;
+ (BOOL)isLowerCaseWithInt:(int)a3;
+ (BOOL)isMirroredWithChar:(unsigned __int16)a3;
+ (BOOL)isMirroredWithInt:(int)a3;
+ (BOOL)isSpaceCharWithChar:(unsigned __int16)a3;
+ (BOOL)isSpaceCharWithInt:(int)a3;
+ (BOOL)isSpaceWithChar:(unsigned __int16)a3;
+ (BOOL)isSupplementaryCodePointWithInt:(int)a3;
+ (BOOL)isSurrogatePairWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4;
+ (BOOL)isSurrogateWithChar:(unsigned __int16)a3;
+ (BOOL)isTitleCaseWithChar:(unsigned __int16)a3;
+ (BOOL)isTitleCaseWithInt:(int)a3;
+ (BOOL)isUnicodeIdentifierPartWithChar:(unsigned __int16)a3;
+ (BOOL)isUnicodeIdentifierPartWithInt:(int)a3;
+ (BOOL)isUnicodeIdentifierStartWithChar:(unsigned __int16)a3;
+ (BOOL)isUnicodeIdentifierStartWithInt:(int)a3;
+ (BOOL)isUpperCaseWithChar:(unsigned __int16)a3;
+ (BOOL)isUpperCaseWithInt:(int)a3;
+ (BOOL)isValidCodePointWithInt:(int)a3;
+ (BOOL)isWhitespaceWithChar:(unsigned __int16)a3;
+ (BOOL)isWhitespaceWithInt:(int)a3;
+ (char)getDirectionalityWithChar:(unsigned __int16)a3;
+ (char)getDirectionalityWithInt:(int)a3;
+ (const)__metadata;
+ (id)__annotations_isJavaLetterOrDigitWithChar_;
+ (id)__annotations_isJavaLetterWithChar_;
+ (id)__annotations_isSpaceWithChar_;
+ (id)getNameImplWithInt:(int)a3;
+ (id)getNameWithInt:(int)a3;
+ (id)smallValueOfWithChar:(unsigned __int16)a3;
+ (id)toCharsWithInt:(int)a3;
+ (id)toStringWithChar:(unsigned __int16)a3;
+ (id)valueOfWithChar:(unsigned __int16)a3;
+ (int)binarySearchRangeWithIntArray:(id)a3 withInt:(int)a4;
+ (int)charCountWithInt:(int)a3;
+ (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4;
+ (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
+ (int)codePointBeforeWithCharArray:(id)a3 withInt:(int)a4;
+ (int)codePointBeforeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)codePointBeforeWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
+ (int)codePointCountWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)codePointCountWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)compareWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4;
+ (int)digitWithChar:(unsigned __int16)a3 withInt:(int)a4;
+ (int)digitWithInt:(int)a3 withInt:(int)a4;
+ (int)getNumericValueWithChar:(unsigned __int16)a3;
+ (int)getNumericValueWithInt:(int)a3;
+ (int)getTypeWithChar:(unsigned __int16)a3;
+ (int)getTypeWithInt:(int)a3;
+ (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (int)offsetByCodePointsWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)toCharsWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5;
+ (int)toCodePointWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4;
+ (int)toLowerCaseWithInt:(int)a3;
+ (int)toTitleCaseWithInt:(int)a3;
+ (int)toUpperCaseWithInt:(int)a3;
+ (unsigned)forDigitWithInt:(int)a3 withInt:(int)a4;
+ (unsigned)highSurrogateWithInt:(int)a3;
+ (unsigned)lowSurrogateWithInt:(int)a3;
+ (unsigned)reverseBytesWithChar:(unsigned __int16)a3;
+ (unsigned)toLowerCaseWithChar:(unsigned __int16)a3;
+ (unsigned)toTitleCaseWithChar:(unsigned __int16)a3;
+ (unsigned)toUpperCaseWithChar:(unsigned __int16)a3;
+ (void)checkValidCodePointWithInt:(int)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangCharacter)initWithChar:(unsigned __int16)a3;
- (NSString)description;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (unsigned)charValue;
@end

@implementation JavaLangCharacter

- (JavaLangCharacter)initWithChar:(unsigned __int16)a3
{
  self->value_ = a3;
  return self;
}

- (unsigned)charValue
{
  return self->value_;
}

+ (void)checkValidCodePointWithInt:(int)a3
{
  sub_100261754(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int value = self->value_;
  int v6 = *((unsigned __int16 *)a3 + 4);
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return value - v6;
}

+ (int)compareWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v5 - v4;
}

+ (id)valueOfWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_valueOfWithChar_(a3);
}

+ (id)smallValueOfWithChar:(unsigned __int16)a3
{
  return (id)sub_10026193C(a3);
}

+ (BOOL)isValidCodePointWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return a3 < 0x110000;
}

+ (BOOL)isSupplementaryCodePointWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 - 0x10000) < 0x100000;
}

+ (BOOL)isHighSurrogateWithChar:(unsigned __int16)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 & 0xFC00) == 55296;
}

+ (BOOL)isLowSurrogateWithChar:(unsigned __int16)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 & 0xFC00) == 56320;
}

+ (BOOL)isSurrogateWithChar:(unsigned __int16)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 & 0xF800) == 55296;
}

+ (BOOL)isSurrogatePairWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4
{
  return JavaLangCharacter_isSurrogatePairWithChar_withChar_(a3, a4);
}

+ (int)charCountWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 < 0x10000) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (int)toCodePointWithChar:(unsigned __int16)a3 withChar:(unsigned __int16)a4
{
  return JavaLangCharacter_toCodePointWithChar_withChar_(a3, a4);
}

+ (int)codePointAtWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  return JavaLangCharacter_codePointAtWithJavaLangCharSequence_withInt_(a3, *(uint64_t *)&a4);
}

+ (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4
{
  return JavaLangCharacter_codePointAtWithCharArray_withInt_((uint64_t)a3, a4);
}

+ (int)codePointAtWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_codePointAtWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)codePointBeforeWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  return JavaLangCharacter_codePointBeforeWithJavaLangCharSequence_withInt_(a3, a4);
}

+ (int)codePointBeforeWithCharArray:(id)a3 withInt:(int)a4
{
  return JavaLangCharacter_codePointBeforeWithCharArray_withInt_((uint64_t)a3, a4);
}

+ (int)codePointBeforeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_codePointBeforeWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)toCharsWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5
{
  return JavaLangCharacter_toCharsWithInt_withCharArray_withInt_(*(uint64_t *)&a3, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (id)toCharsWithInt:(int)a3
{
  return JavaLangCharacter_toCharsWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (int)codePointCountWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_codePointCountWithJavaLangCharSequence_withInt_withInt_(a3, *(uint64_t *)&a4, a5);
}

+ (int)codePointCountWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_codePointCountWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)offsetByCodePointsWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaLangCharacter_offsetByCodePointsWithJavaLangCharSequence_withInt_withInt_(a3, *(uint64_t *)&a4, a5);
}

+ (int)offsetByCodePointsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return JavaLangCharacter_offsetByCodePointsWithCharArray_withInt_withInt_withInt_withInt_((uint64_t)a3, a4, a5, *(uint64_t *)&a6, a7);
}

+ (int)digitWithChar:(unsigned __int16)a3 withInt:(int)a4
{
  return JavaLangCharacter_digitWithChar_withInt_(a3, a4);
}

+ (int)digitWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangCharacter_digitWithInt_withInt_(a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((unsigned __int16 *)a3 + 4) == self->value_;
}

+ (unsigned)forDigitWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangCharacter_forDigitWithInt_withInt_(a3, a4);
}

+ (id)getNameWithInt:(int)a3
{
  return (id)JavaLangCharacter_getNameWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)getNameImplWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (int)getNumericValueWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_getNumericValueWithChar_(a3);
}

+ (int)getNumericValueWithInt:(int)a3
{
  return JavaLangCharacter_getNumericValueWithInt_(a3);
}

+ (int)getTypeWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_getTypeWithChar_(a3);
}

+ (int)getTypeWithInt:(int)a3
{
  return JavaLangCharacter_getTypeWithInt_(a3);
}

+ (char)getDirectionalityWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_getDirectionalityWithChar_(a3);
}

+ (char)getDirectionalityWithInt:(int)a3
{
  return JavaLangCharacter_getDirectionalityWithInt_(a3);
}

+ (BOOL)isMirroredWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isMirroredWithChar_(a3);
}

+ (BOOL)isMirroredWithInt:(int)a3
{
  return JavaLangCharacter_isMirroredWithInt_(a3);
}

- (unint64_t)hash
{
  return self->value_;
}

+ (unsigned)highSurrogateWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 >> 10) - 10304;
}

+ (unsigned)lowSurrogateWithInt:(int)a3
{
  __int16 v3 = a3;
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v3 & 0x3FF | 0xDC00;
}

+ (BOOL)isAlphabeticWithInt:(int)a3
{
  return JavaLangCharacter_isAlphabeticWithInt_(a3);
}

+ (BOOL)isBmpCodePointWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return a3 < 0x10000;
}

+ (BOOL)isDefinedWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isDefinedWithChar_(a3);
}

+ (BOOL)isDefinedWithInt:(int)a3
{
  return JavaLangCharacter_isDefinedWithInt_(a3);
}

+ (BOOL)isDigitWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isDigitWithChar_(a3);
}

+ (BOOL)isDigitWithInt:(int)a3
{
  return JavaLangCharacter_isDigitWithInt_(a3);
}

+ (BOOL)isIdentifierIgnorableWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isIdentifierIgnorableWithChar_(a3);
}

+ (BOOL)isIdeographicWithInt:(int)a3
{
  return JavaLangCharacter_isIdeographicWithInt_(a3);
}

+ (BOOL)isIdentifierIgnorableWithInt:(int)a3
{
  return JavaLangCharacter_isIdentifierIgnorableWithInt_(a3);
}

+ (BOOL)isISOControlWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isISOControlWithChar_(a3);
}

+ (BOOL)isISOControlWithInt:(int)a3
{
  return JavaLangCharacter_isISOControlWithInt_(a3);
}

+ (BOOL)isJavaIdentifierPartWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isJavaIdentifierPartWithChar_(a3);
}

+ (BOOL)isJavaIdentifierPartWithInt:(int)a3
{
  return JavaLangCharacter_isJavaIdentifierPartWithInt_(a3);
}

+ (BOOL)isJavaIdentifierStartWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isJavaIdentifierStartWithChar_(a3);
}

+ (BOOL)isJavaIdentifierStartWithInt:(int)a3
{
  return JavaLangCharacter_isJavaIdentifierStartWithInt_(a3);
}

+ (BOOL)isJavaLetterWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isJavaLetterWithChar_(a3);
}

+ (BOOL)isJavaLetterOrDigitWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isJavaLetterOrDigitWithChar_(a3);
}

+ (BOOL)isLetterWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isLetterWithChar_(a3);
}

+ (BOOL)isLetterWithInt:(int)a3
{
  return JavaLangCharacter_isLetterWithInt_(a3);
}

+ (BOOL)isLetterOrDigitWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isLetterOrDigitWithChar_(a3);
}

+ (BOOL)isLetterOrDigitWithInt:(int)a3
{
  return JavaLangCharacter_isLetterOrDigitWithInt_(a3);
}

+ (BOOL)isLowerCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isLowerCaseWithChar_(a3);
}

+ (BOOL)isLowerCaseWithInt:(int)a3
{
  return JavaLangCharacter_isLowerCaseWithInt_(a3);
}

+ (BOOL)isSpaceWithChar:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (v3 < 0x21) & (0x100003600uLL >> v3);
}

+ (BOOL)isSpaceCharWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isSpaceCharWithChar_(a3);
}

+ (BOOL)isSpaceCharWithInt:(int)a3
{
  return JavaLangCharacter_isSpaceCharWithInt_(a3);
}

+ (BOOL)isTitleCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isTitleCaseWithChar_(a3);
}

+ (BOOL)isTitleCaseWithInt:(int)a3
{
  return JavaLangCharacter_isTitleCaseWithInt_(a3);
}

+ (BOOL)isUnicodeIdentifierPartWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isUnicodeIdentifierPartWithChar_(a3);
}

+ (BOOL)isUnicodeIdentifierPartWithInt:(int)a3
{
  return JavaLangCharacter_isUnicodeIdentifierPartWithInt_(a3);
}

+ (BOOL)isUnicodeIdentifierStartWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isUnicodeIdentifierStartWithChar_(a3);
}

+ (BOOL)isUnicodeIdentifierStartWithInt:(int)a3
{
  return JavaLangCharacter_isUnicodeIdentifierStartWithInt_(a3);
}

+ (BOOL)isUpperCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isUpperCaseWithChar_(a3);
}

+ (BOOL)isUpperCaseWithInt:(int)a3
{
  return JavaLangCharacter_isUpperCaseWithInt_(a3);
}

+ (BOOL)isWhitespaceWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_isWhitespaceWithChar_(a3);
}

+ (BOOL)isWhitespaceWithInt:(int)a3
{
  return JavaLangCharacter_isWhitespaceWithInt_(a3);
}

+ (unsigned)reverseBytesWithChar:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  if ((atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __rev16(v3);
}

+ (unsigned)toLowerCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_toLowerCaseWithChar_(a3);
}

+ (int)toLowerCaseWithInt:(int)a3
{
  return JavaLangCharacter_toLowerCaseWithInt_(a3);
}

- (NSString)description
{
  return NSString_valueOfChar_(self->value_);
}

+ (id)toStringWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_toStringWithChar_(a3);
}

+ (unsigned)toTitleCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_toTitleCaseWithChar_(a3);
}

+ (int)toTitleCaseWithInt:(int)a3
{
  return JavaLangCharacter_toTitleCaseWithInt_(a3);
}

+ (unsigned)toUpperCaseWithChar:(unsigned __int16)a3
{
  return JavaLangCharacter_toUpperCaseWithChar_(a3);
}

+ (int)toUpperCaseWithInt:(int)a3
{
  return JavaLangCharacter_toUpperCaseWithInt_(a3);
}

+ (int)binarySearchRangeWithIntArray:(id)a3 withInt:(int)a4
{
  if (atomic_load_explicit(JavaLangCharacter__initialized, memory_order_acquire))
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_18;
  }
LABEL_3:
  int v6 = *((_DWORD *)a3 + 2) - 1;
  if (v6 < 0)
  {
    int v11 = 0;
    int v10 = -1;
  }
  else
  {
    int v7 = 0;
    do
    {
      uint64_t v8 = *((unsigned int *)a3 + 2);
      int v9 = v7 + v6;
      int v10 = (v7 + v6) >> 1;
      if (v7 + v6 < 0 || v10 >= (int)v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, (v9 >> 1));
      }
      int v11 = *((_DWORD *)a3 + ((uint64_t)v9 >> 1) + 3);
      if (v11 >= a4)
      {
        if (v11 == a4) {
          return v10;
        }
        int v6 = v10 - 1;
      }
      else
      {
        int v7 = v10 + 1;
      }
    }
    while (v7 <= v6);
  }
  v10 -= v11 > a4;
  return v10;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass charClass](IOSClass, "charClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    JreStrongAssign(&JavaLangCharacter_TYPE_, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangCharacter__initialized);
  }
}

+ (id)__annotations_isJavaLetterWithChar_
{
  unsigned int v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_isJavaLetterOrDigitWithChar_
{
  unsigned int v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_isSpaceWithChar_
{
  unsigned int v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046E810;
}

@end
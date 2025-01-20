@interface JavaTextChoiceFormat
+ (const)__metadata;
+ (double)nextDoubleWithDouble:(double)a3 withBoolean:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (JavaTextChoiceFormat)formatWithDouble:(double)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextChoiceFormat)formatWithLong:(int64_t)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextChoiceFormat)initWithDoubleArray:(id)a3 withNSStringArray:(id)a4;
- (JavaTextChoiceFormat)initWithNSString:(id)a3;
- (id)clone;
- (id)getFormats;
- (id)getLimits;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)toPattern;
- (int)skipWhitespaceWithNSString:(id)a3 withInt:(int)a4;
- (unint64_t)hash;
- (void)applyPatternWithNSString:(id)a3;
- (void)dealloc;
- (void)setChoicesWithDoubleArray:(id)a3 withNSStringArray:(id)a4;
@end

@implementation JavaTextChoiceFormat

- (JavaTextChoiceFormat)initWithDoubleArray:(id)a3 withNSStringArray:(id)a4
{
  return self;
}

- (JavaTextChoiceFormat)initWithNSString:(id)a3
{
  return self;
}

- (void)applyPatternWithNSString:(id)a3
{
  v5 = +[IOSDoubleArray arrayWithLength:5];
  v6 = new_JavaUtilArrayList_init();
  if (!a3) {
LABEL_42:
  }
    JreThrowNullPointerException();
  v7 = v6;
  id v8 = [a3 length];
  v9 = new_JavaLangStringBuffer_init();
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v53 = self;
  InstanceWithJavaUtilLocale = (void *)JavaTextNumberFormat_getInstanceWithJavaUtilLocale_(JavaUtilLocale_US_);
  v11 = new_JavaTextParsePosition_initWithInt_(0);
  id v12 = sub_1001DC43C(a3, 0);
  if ((int)v12 < (int)v8)
  {
    id v13 = v12;
    int v14 = 0;
    uint64_t v15 = 0;
    v54 = InstanceWithJavaUtilLocale;
    id v55 = a3;
    while (1)
    {
      [(JavaTextParsePosition *)v11 setIndexWithInt:v13];
      if (!InstanceWithJavaUtilLocale) {
        goto LABEL_42;
      }
      id v16 = [InstanceWithJavaUtilLocale parseWithNSString:a3 withJavaTextParsePosition:v11];
      id v17 = sub_1001DC43C(a3, [(JavaTextParsePosition *)v11 getIndex]);
      if ([(JavaTextParsePosition *)v11 getErrorIndex] != -1 || (int)v17 >= (int)v8)
      {
        if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        JreStrongAssign((id *)(&v53->super.minimumFractionDigits_ + 1), (void *)LibcoreUtilEmptyArray_DOUBLE_);
        if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        v50 = (void *)LibcoreUtilEmptyArray_STRING_;
        JreStrongAssign((id *)((char *)&v53->choiceLimits_ + 4), v50);
        return;
      }
      id v18 = a3;
      v19 = v9;
      unsigned int v27 = [v18 charAtWithInt:v17];
      if (v15 == v5->super.size_)
      {
        v28 = +[IOSDoubleArray arrayWithLength:v14];
        v29 = v5;
        v30 = v7;
        id v31 = v8;
        v32 = v28;
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v29, 0, v28, 0, v15);
        v33 = v32;
        id v8 = v31;
        v7 = v30;
        v5 = v33;
      }
      if (v27 == 8804) {
        goto LABEL_14;
      }
      if (v27 != 60) {
        break;
      }
      if (!v16) {
        goto LABEL_42;
      }
      [v16 doubleValue];
      double DoubleWithDouble = JavaTextChoiceFormat_nextDoubleWithDouble_(v42);
LABEL_18:
      double v43 = DoubleWithDouble;
      v9 = v19;
      a3 = v55;
      if ((int)v15 >= 1)
      {
        uint64_t size = v5->super.size_;
        if ((int)v15 > (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (v15 - 1));
        }
        if (DoubleWithDouble <= v5->buffer_[(v15 - 1)])
        {
          CFStringRef v51 = JreStrcat("$$", v34, v35, v36, v37, v38, v39, v40, @"Bad template: ");
          goto LABEL_45;
        }
      }
      [(JavaLangStringBuffer *)v9 setLengthWithInt:0];
      [(JavaTextParsePosition *)v11 setIndexWithInt:(v17 + 1)];
      JavaTextFormat_upToWithNSString_withJavaTextParsePosition_withJavaLangStringBuffer_withChar_(v55, v11, v9, 124);
      uint64_t v45 = [(JavaTextParsePosition *)v11 getIndex];
      uint64_t v46 = v5->super.size_;
      if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v46) {
        IOSArray_throwOutOfBoundsWithMsg(v46, v15);
      }
      v5->buffer_[(int)v15] = v43;
      [(JavaUtilArrayList *)v7 addWithId:[(JavaLangStringBuffer *)v9 description]];
      id v13 = sub_1001DC43C(v55, v45);
      v14 += 2;
      uint64_t v15 = (v15 + 1);
      InstanceWithJavaUtilLocale = v54;
      if ((int)v13 >= (int)v8) {
        goto LABEL_28;
      }
    }
    if (v27 != 35)
    {
      CFStringRef v51 = JreStrcat("$C$$", v20, v21, v22, v23, v24, v25, v26, @"Bad character '");
LABEL_45:
      v52 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v51);
      objc_exception_throw(v52);
    }
LABEL_14:
    if (!v16) {
      goto LABEL_42;
    }
    [v16 doubleValue];
    goto LABEL_18;
  }
  uint64_t v15 = 0;
LABEL_28:
  v47 = (id *)(&v53->super.minimumFractionDigits_ + 1);
  if (v15 == v5->super.size_)
  {
    JreStrongAssign((id *)(&v53->super.minimumFractionDigits_ + 1), v5);
  }
  else
  {
    JreStrongAssignAndConsume(v47, +[IOSDoubleArray newArrayWithLength:(int)v15]);
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v5, 0, *v47, 0, v15);
  }
  id v48 = +[IOSObjectArray newArrayWithLength:[(JavaUtilArrayList *)v7 size] type:NSString_class_()];
  JreStrongAssignAndConsume((id *)((char *)&v53->choiceLimits_ + 4), v48);
  if ([(JavaUtilArrayList *)v7 size] >= 1)
  {
    uint64_t v49 = 0;
    do
    {
      IOSObjectArray_Set(*(uint64_t *)((char *)&v53->choiceLimits_ + 4), v49, [(JavaUtilArrayList *)v7 getWithInt:v49]);
      ++v49;
    }
    while (v49 < [(JavaUtilArrayList *)v7 size]);
  }
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaTextChoiceFormat;
  v3 = [(JavaTextNumberFormat *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_6;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v4 = *(void **)(&self->super.minimumFractionDigits_ + 1);
  if (!v4
    || (JreStrongAssign((id *)(v3 + 28), [v4 clone]),
        (v5 = *(IOSDoubleArray **)((char *)&self->choiceLimits_ + 4)) == 0))
  {
LABEL_6:
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)(v3 + 36), [v5 clone]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a3) {
        JreThrowNullPointerException();
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      int v5 = JavaUtilArrays_equalsWithDoubleArray_withDoubleArray_(*(void *)(&self->super.minimumFractionDigits_ + 1), *(void *)((char *)a3 + 28));
      if (v5)
      {
        uint64_t v6 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
        uint64_t v7 = *(void *)((char *)a3 + 36);
        LOBYTE(v5) = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_(v6, v7);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (JavaTextChoiceFormat)formatWithDouble:(double)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  uint64_t v5 = *(void *)(&self->super.minimumFractionDigits_ + 1);
  if (!v5) {
    goto LABEL_21;
  }
  LODWORD(v8) = *(_DWORD *)(v5 + 8);
  while (1)
  {
    uint64_t v8 = (v8 - 1);
    if ((int)v8 < 0) {
      break;
    }
    uint64_t v9 = *(void *)(&self->super.minimumFractionDigits_ + 1);
    uint64_t v10 = *(unsigned int *)(v9 + 8);
    if ((int)v8 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v8);
    }
    if (*(double *)(v9 + 16 + 8 * v8) <= a3)
    {
      if (a4)
      {
        uint64_t v14 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
        if (v14)
        {
          uint64_t v15 = *(unsigned int *)(v14 + 8);
          if ((int)v8 >= (int)v15) {
            IOSArray_throwOutOfBoundsWithMsg(v15, v8);
          }
          id v13 = (uint64_t *)(v14 + 24 + 8 * v8);
          goto LABEL_17;
        }
      }
LABEL_21:
      JreThrowNullPointerException();
    }
  }
  uint64_t v11 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
  if (!v11) {
    goto LABEL_21;
  }
  uint64_t v12 = *(unsigned int *)(v11 + 8);
  if (!v12) {
    return (JavaTextChoiceFormat *)a4;
  }
  if (!a4) {
    goto LABEL_21;
  }
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  id v13 = (uint64_t *)(v11 + 24);
LABEL_17:
  uint64_t v16 = *v13;
  return (JavaTextChoiceFormat *)objc_msgSend(a4, "appendWithNSString:", v16, a5);
}

- (JavaTextChoiceFormat)formatWithLong:(int64_t)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  return [(JavaTextChoiceFormat *)self formatWithDouble:a4 withJavaLangStringBuffer:a5 withJavaTextFieldPosition:(double)a3];
}

- (id)getFormats
{
  return *(IOSDoubleArray **)((char *)&self->choiceLimits_ + 4);
}

- (id)getLimits
{
  return *(id *)(&self->super.minimumFractionDigits_ + 1);
}

- (unint64_t)hash
{
  uint64_t v2 = *(void *)(&self->super.minimumFractionDigits_ + 1);
  if (!v2) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v4 = 0;
  int v5 = 0;
  while (v4 < *(int *)(v2 + 8))
  {
    uint64_t v6 = JavaLangDouble_doubleToLongBitsWithDouble_(*(double *)(v2 + 16 + 8 * v4));
    uint64_t v7 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
    if (v7)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(int *)(v7 + 8);
      if (v4 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v4);
      }
      uint64_t v10 = *(void **)(v7 + 24 + 8 * v4);
      if (v10)
      {
        v5 += (HIDWORD(v8) ^ v8) + [v10 hash];
        ++v4;
        uint64_t v2 = *(void *)(&self->super.minimumFractionDigits_ + 1);
        if (v2) {
          continue;
        }
      }
    }
    goto LABEL_11;
  }
  return v5;
}

+ (double)nextDoubleWithDouble:(double)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    return JavaTextChoiceFormat_nextDoubleWithDouble_(a3);
  }
  else {
    return JavaTextChoiceFormat_previousDoubleWithDouble_(a3);
  }
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  if (!a4) {
    goto LABEL_8;
  }
  id v7 = [a4 getIndex];
  uint64_t v8 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = v7;
  uint64_t v10 = 0;
  while (1)
  {
    if (v10 >= *(int *)(v8 + 8))
    {
      [a4 setErrorIndexWithInt:v9];
      double v12 = NAN;
      goto LABEL_15;
    }
    if (!a3) {
      goto LABEL_8;
    }
    unsigned int v11 = [a3 hasPrefix:*(void *)(v8 + 24 + 8 * v10) offset:v9];
    uint64_t v8 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
    if (v11) {
      break;
    }
    ++v10;
    if (!v8) {
      goto LABEL_8;
    }
  }
  uint64_t v13 = *(unsigned int *)(v8 + 8);
  if ((int)v13 <= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v10);
  }
  uint64_t v14 = *(void **)(v8 + 24 + 8 * v10);
  if (!v14
    || (objc_msgSend(a4, "setIndexWithInt:", v9 + objc_msgSend(v14, "length")),
        (uint64_t v15 = *(void *)(&self->super.minimumFractionDigits_ + 1)) == 0))
  {
LABEL_8:
    JreThrowNullPointerException();
  }
  uint64_t v16 = *(unsigned int *)(v15 + 8);
  if ((int)v16 <= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v10);
  }
  double v12 = *(double *)(v15 + 16 + 8 * v10);
LABEL_15:
  id v17 = new_JavaLangDouble_initWithDouble_(v12);
  return v17;
}

- (void)setChoicesWithDoubleArray:(id)a3 withNSStringArray:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  if (*((_DWORD *)a3 + 2) != *((_DWORD *)a4 + 2))
  {
    CFStringRef v10 = JreStrcat("$I$I", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, @"limits.length != formats.length: ");
    unsigned int v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  JreStrongAssign((id *)(&self->super.minimumFractionDigits_ + 1), a3);
  JreStrongAssign((id *)((char *)&self->choiceLimits_ + 4), a4);
}

- (int)skipWhitespaceWithNSString:(id)a3 withInt:(int)a4
{
  return sub_1001DC43C(a3, *(uint64_t *)&a4);
}

- (id)toPattern
{
  v3 = new_JavaLangStringBuilder_init();
  uint64_t v4 = *(void *)(&self->super.minimumFractionDigits_ + 1);
  if (!v4) {
LABEL_34:
  }
    JreThrowNullPointerException();
  uint64_t v5 = v3;
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(unsigned int *)(v4 + 8);
    if (v6 >= (int)v7) {
      break;
    }
    if (v6)
    {
      [(JavaLangStringBuilder *)v5 appendWithChar:124];
      uint64_t v4 = *(void *)(&self->super.minimumFractionDigits_ + 1);
      uint64_t v7 = *(unsigned int *)(v4 + 8);
    }
    if (v6 >= (int)v7) {
      IOSArray_throwOutOfBoundsWithMsg(v7, v6);
    }
    double v8 = JavaTextChoiceFormat_previousDoubleWithDouble_(*(double *)(v4 + 16 + 8 * v6));
    id v9 = (__CFString *)NSString_valueOfDouble_(v8);
    uint64_t v10 = *(void *)(&self->super.minimumFractionDigits_ + 1);
    uint64_t v11 = *(int *)(v10 + 8);
    if (v6 >= v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v6);
    }
    CFStringRef v12 = NSString_valueOfDouble_(*(double *)(v10 + 16 + 8 * v6));
    if (v9)
    {
      uint64_t v13 = (__CFString *)v12;
      unsigned int v14 = [(__CFString *)v9 length];
      if (v13)
      {
        signed int v15 = v14;
        signed int v16 = [(__CFString *)v13 length];
        id v17 = v15 >= v16 ? v13 : v9;
        uint64_t v18 = v15 >= v16 ? 35 : 60;
        [(JavaLangStringBuilder *)v5 appendWithNSString:v17];
        [(JavaLangStringBuilder *)v5 appendWithChar:v18];
        uint64_t v19 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
        if (v19)
        {
          uint64_t v20 = *(int *)(v19 + 8);
          if (v6 >= v20) {
            IOSArray_throwOutOfBoundsWithMsg(v20, v6);
          }
          uint64_t v21 = *(void **)(v19 + 24 + 8 * v6);
          if (v21)
          {
            if ([v21 indexOf:124] == -1)
            {
              uint64_t v24 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
              uint64_t v25 = *(int *)(v24 + 8);
              if (v6 >= v25) {
                IOSArray_throwOutOfBoundsWithMsg(v25, v6);
              }
              [(JavaLangStringBuilder *)v5 appendWithNSString:*(void *)(v24 + 24 + 8 * v6)];
            }
            else
            {
              [(JavaLangStringBuilder *)v5 appendWithChar:39];
              uint64_t v22 = *(uint64_t *)((char *)&self->choiceLimits_ + 4);
              uint64_t v23 = *(int *)(v22 + 8);
              if (v6 >= v23) {
                IOSArray_throwOutOfBoundsWithMsg(v23, v6);
              }
              [(JavaLangStringBuilder *)v5 appendWithNSString:*(void *)(v22 + 24 + 8 * v6)];
              [(JavaLangStringBuilder *)v5 appendWithChar:39];
            }
            ++v6;
            uint64_t v4 = *(void *)(&self->super.minimumFractionDigits_ + 1);
            if (v4) {
              continue;
            }
          }
        }
      }
    }
    goto LABEL_34;
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextChoiceFormat;
  [(JavaTextChoiceFormat *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004301E8;
}

@end
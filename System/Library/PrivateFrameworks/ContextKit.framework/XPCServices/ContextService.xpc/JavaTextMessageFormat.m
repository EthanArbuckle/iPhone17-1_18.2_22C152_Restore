@interface JavaTextMessageFormat
+ (const)__metadata;
+ (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaTextMessageFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextMessageFormat)formatWithNSObjectArray:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextMessageFormat)initWithNSString:(id)a3;
- (JavaTextMessageFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)clone;
- (id)decodeDecimalFormatWithJavaLangStringBuffer:(id)a3 withJavaTextFormat:(id)a4;
- (id)decodeSimpleDateFormatWithJavaLangStringBuffer:(id)a3 withJavaTextFormat:(id)a4;
- (id)formatImplWithNSObjectArray:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5 withJavaUtilList:(id)a6;
- (id)formatToCharacterIteratorWithId:(id)a3;
- (id)getFormats;
- (id)getFormatsByArgumentIndex;
- (id)getLocale;
- (id)parseVariableWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)parseWithNSString:(id)a3;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)toPattern;
- (int)matchWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withBoolean:(BOOL)a5 withNSStringArray:(id)a6;
- (unint64_t)hash;
- (void)appendQuotedWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4;
- (void)applyPatternWithNSString:(id)a3;
- (void)dealloc;
- (void)handleArgumentFieldWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withJavaTextFieldPosition:(id)a6 withJavaUtilList:(id)a7;
- (void)handleFormatWithJavaTextFormat:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilList:(id)a6;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setFormatByArgumentIndexWithInt:(int)a3 withJavaTextFormat:(id)a4;
- (void)setFormatWithInt:(int)a3 withJavaTextFormat:(id)a4;
- (void)setFormatsByArgumentIndexWithJavaTextFormatArray:(id)a3;
- (void)setFormatsWithJavaTextFormatArray:(id)a3;
- (void)setLocaleWithJavaUtilLocale:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaTextMessageFormat

- (JavaTextMessageFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (JavaTextMessageFormat)initWithNSString:(id)a3
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaTextFormat_init(self, v6);
  JreStrongAssign((id *)&self->locale_, Default);
  [(JavaTextMessageFormat *)self applyPatternWithNSString:a3];
  return self;
}

- (void)applyPatternWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = [a3 length];
  v5 = new_JavaLangStringBuffer_init();
  uint64_t v6 = new_JavaTextParsePosition_initWithInt_(0);
  v7 = new_JavaUtilArrayList_init();
  v25 = +[IOSIntArray arrayWithLength:10];
  v23 = new_JavaUtilArrayList_init();
  if ([(JavaTextParsePosition *)v6 getIndex] >= v4)
  {
    LODWORD(v26) = 0;
    int v8 = -1;
  }
  else
  {
    uint64_t v26 = 0;
    int v8 = -1;
    v22 = v5;
    do
    {
      if (JavaTextFormat_upToWithNSString_withJavaTextParsePosition_withJavaLangStringBuffer_withChar_(a3, v6, v5, 123))
      {
        unint64_t v9 = [(JavaTextParsePosition *)v6 getIndex];
        if ((int)v9 >= v4)
        {
LABEL_25:
          v21 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Invalid argument number");
          objc_exception_throw(v21);
        }
        unint64_t v10 = v9;
        int v11 = 0;
        while (1)
        {
          unsigned int v12 = [a3 charAtWithInt:v10];
          if (v12 == 44 || v12 == 125) {
            break;
          }
          int v11 = v12 + 10 * v11 - 48;
          if (v11 >= 0)
          {
            unint64_t v10 = (v10 + 1);
            if ((int)v10 < v4) {
              continue;
            }
          }
          goto LABEL_25;
        }
        [(JavaTextParsePosition *)v6 setIndexWithInt:v10];
        [(JavaUtilArrayList *)v23 addWithId:sub_1001F00E0((uint64_t)self, a3, v6)];
        v14 = v25;
        int v13 = v26;
        uint64_t size = v25->super.size_;
        if ((int)v26 >= (int)size)
        {
          v16 = +[IOSIntArray arrayWithLength:2 * (int)size];
          JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v25, 0, v16, 0, v25->super.size_);
          int v13 = v26;
          uint64_t size = v16->super.size_;
          v14 = v16;
        }
        v5 = v22;
        if (v13 < 0 || v13 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v26);
        }
        uint64_t v17 = v13;
        uint64_t v18 = (v13 + 1);
        *(&v14->super.size_ + v17 + 1) = v11;
        if (v11 > v8) {
          int v8 = v11;
        }
        v25 = v14;
        uint64_t v26 = v18;
      }
      [(JavaUtilArrayList *)v7 addWithId:[(JavaLangStringBuffer *)v5 description]];
      [(JavaLangStringBuffer *)v5 setLengthWithInt:0];
    }
    while ([(JavaTextParsePosition *)v6 getIndex] < v4);
  }
  id v19 = [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:NSString_class_()]];
  JreStrongAssign((id *)&self->strings_, v19);
  JreStrongAssign((id *)&self->argumentNumbers_, v25);
  id v20 = [(JavaUtilArrayList *)v23 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:(int)v26 type:JavaTextFormat_class_()]];
  JreStrongAssign((id *)&self->formats_, v20);
  self->maxOffset_ = v26 - 1;
  self->maxArgumentIndex_ = v8;
}

- (id)clone
{
  v15.receiver = self;
  v15.super_class = (Class)JavaTextMessageFormat;
  v3 = [(JavaTextFormat *)&v15 clone];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_19:
  }
    JreThrowClassCastException();
  formats = self->formats_;
  if (!formats) {
    goto LABEL_18;
  }
  v5 = +[IOSObjectArray arrayWithLength:formats->super.size_ type:JavaTextFormat_class_()];
  int size = self->formats_->super.size_;
  uint64_t v7 = (size - 1);
  if (size - 1 >= 0)
  {
    do
    {
      int v8 = self->formats_;
      uint64_t v9 = v8->super.size_;
      if ((int)v7 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v7);
      }
      if ((&v8->elementType_)[v7])
      {
        unint64_t v10 = self->formats_;
        uint64_t v11 = v10->super.size_;
        if ((int)v7 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v7);
        }
        unsigned int v12 = (&v10->elementType_)[v7];
        if (!v12) {
          goto LABEL_18;
        }
        id v13 = [(IOSClass *)v12 clone];
        objc_opt_class();
        if (v13 && (objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        IOSObjectArray_Set((uint64_t)v5, v7, v13);
      }
      --size;
      --v7;
    }
    while (size > 0);
  }
  if (!v3) {
LABEL_18:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v3 + 4, v5);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    objc_opt_class();
    if (!a3) {
      goto LABEL_27;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    int maxOffset = self->maxOffset_;
    if (maxOffset == *((_DWORD *)a3 + 10))
    {
      if ((maxOffset & 0x80000000) == 0)
      {
        uint64_t v6 = 0;
        while (1)
        {
          argumentNumbers = self->argumentNumbers_;
          if (!argumentNumbers) {
            break;
          }
          uint64_t size = argumentNumbers->super.size_;
          if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v6);
          }
          int v9 = *(&argumentNumbers->super.size_ + (int)v6 + 1);
          uint64_t v10 = *((void *)a3 + 3);
          uint64_t v11 = *(unsigned int *)(v10 + 8);
          if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v11) {
            IOSArray_throwOutOfBoundsWithMsg(v11, v6);
          }
          if (v9 != *(_DWORD *)(v10 + 12 + 4 * (int)v6)) {
            goto LABEL_18;
          }
          uint64_t v6 = (v6 + 1);
          if ((int)v6 > self->maxOffset_) {
            goto LABEL_21;
          }
        }
LABEL_27:
        JreThrowNullPointerException();
      }
LABEL_21:
      locale = self->locale_;
      if (!locale) {
        goto LABEL_27;
      }
      unsigned int v12 = [(JavaUtilLocale *)locale isEqual:*((void *)a3 + 1)];
      if (v12)
      {
        unsigned int v12 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->strings_, *((void *)a3 + 2));
        if (v12)
        {
          formats = self->formats_;
          uint64_t v15 = *((void *)a3 + 4);
          LOBYTE(v12) = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)formats, v15);
        }
      }
    }
    else
    {
LABEL_18:
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (id)formatToCharacterIteratorWithId:(id)a3
{
  if (!a3)
  {
    uint64_t v15 = new_JavaLangNullPointerException_initWithNSString_(@"object == null");
    objc_exception_throw(v15);
  }
  v5 = new_JavaLangStringBuffer_init();
  uint64_t v6 = new_JavaUtilArrayList_init();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v7 = new_JavaTextFieldPosition_initWithInt_(0);
  sub_1001F0970((uint64_t)self, (uint64_t)a3, v5, v7, v6);
  int v8 = new_JavaTextAttributedString_initWithNSString_([(JavaLangStringBuffer *)v5 description]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(JavaUtilArrayList *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      unsigned int v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v12);
        if (!v13) {
          JreThrowNullPointerException();
        }
        [(JavaTextAttributedString *)v8 addAttributeWithJavaTextAttributedCharacterIterator_Attribute:*(void *)(v13 + 16) withId:*(void *)(v13 + 24) withInt:*(unsigned int *)(v13 + 8) withInt:*(unsigned int *)(v13 + 12)];
        unsigned int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(JavaUtilArrayList *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  return [(JavaTextAttributedString *)v8 getIterator];
}

- (JavaTextMessageFormat)formatWithNSObjectArray:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  return (JavaTextMessageFormat *)sub_1001F0970((uint64_t)self, (uint64_t)a3, a4, a5, 0);
}

- (id)formatImplWithNSObjectArray:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5 withJavaUtilList:(id)a6
{
  return sub_1001F0970((uint64_t)self, (uint64_t)a3, a4, a5, a6);
}

- (void)handleArgumentFieldWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withJavaTextFieldPosition:(id)a6 withJavaUtilList:(id)a7
{
}

- (void)handleFormatWithJavaTextFormat:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilList:(id)a6
{
}

- (JavaTextMessageFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return (JavaTextMessageFormat *)sub_1001F0970((uint64_t)self, (uint64_t)a3, a4, a5, 0);
}

+ (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
  return JavaTextMessageFormat_formatWithNSString_withNSObjectArray_((uint64_t)a3, (uint64_t)a4);
}

- (id)getFormats
{
  formats = self->formats_;
  if (!formats) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)formats clone];
}

- (id)getFormatsByArgumentIndex
{
  v3 = +[IOSObjectArray arrayWithLength:self->maxArgumentIndex_ + 1 type:JavaTextFormat_class_()];
  if (self->maxOffset_ <= 0x7FFFFFFEu)
  {
    uint64_t v4 = 0;
    do
    {
      argumentNumbers = self->argumentNumbers_;
      if (!argumentNumbers) {
        goto LABEL_12;
      }
      uint64_t size = argumentNumbers->super.size_;
      if (v4 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      formats = self->formats_;
      if (!formats) {
LABEL_12:
      }
        JreThrowNullPointerException();
      uint64_t v8 = *(&argumentNumbers->super.size_ + v4 + 1);
      uint64_t v9 = formats->super.size_;
      if (v4 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v4);
      }
      IOSObjectArray_Set((uint64_t)v3, v8, (&formats->elementType_)[v4++]);
    }
    while (v4 < self->maxOffset_ + 1);
  }
  return v3;
}

- (void)setFormatByArgumentIndexWithInt:(int)a3 withJavaTextFormat:(id)a4
{
  if (self->maxOffset_ <= 0x7FFFFFFEu)
  {
    uint64_t v7 = 0;
    do
    {
      argumentNumbers = self->argumentNumbers_;
      if (!argumentNumbers) {
LABEL_12:
      }
        JreThrowNullPointerException();
      uint64_t size = argumentNumbers->super.size_;
      if (v7 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      if (*(&argumentNumbers->super.size_ + v7 + 1) == a3)
      {
        formats = self->formats_;
        if (!formats) {
          goto LABEL_12;
        }
        IOSObjectArray_Set((uint64_t)formats, v7, a4);
      }
      ++v7;
    }
    while (v7 < self->maxOffset_ + 1);
  }
}

- (void)setFormatsByArgumentIndexWithJavaTextFormatArray:(id)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  if (*((int *)a3 + 2) >= 1)
  {
    uint64_t v5 = 0;
    while (self->maxOffset_ > 0x7FFFFFFEu)
    {
LABEL_16:
      if (++v5 >= *((int *)a3 + 2)) {
        return;
      }
    }
    uint64_t v6 = 0;
    while (1)
    {
      argumentNumbers = self->argumentNumbers_;
      if (!argumentNumbers) {
        break;
      }
      uint64_t size = argumentNumbers->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      if (v5 == *(&argumentNumbers->super.size_ + v6 + 1))
      {
        if (!self->formats_) {
          break;
        }
        uint64_t v9 = *((int *)a3 + 2);
        if (v5 >= v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, v5);
        }
        IOSObjectArray_Set((uint64_t)self->formats_, v6, *((void **)a3 + v5 + 3));
      }
      if (++v6 >= self->maxOffset_ + 1) {
        goto LABEL_16;
      }
    }
LABEL_18:
    JreThrowNullPointerException();
  }
}

- (id)getLocale
{
  return self->locale_;
}

- (unint64_t)hash
{
  int maxOffset = self->maxOffset_;
  if ((maxOffset & 0x80000000) == 0)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    while (1)
    {
      argumentNumbers = self->argumentNumbers_;
      if (!argumentNumbers) {
        break;
      }
      uint64_t size = argumentNumbers->super.size_;
      if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      strings = self->strings_;
      if (!strings) {
        break;
      }
      int v9 = *(&argumentNumbers->super.size_ + (int)v4 + 1);
      uint64_t v10 = strings->super.size_;
      if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v4);
      }
      uint64_t v11 = (&strings->elementType_)[(int)v4];
      if (!v11) {
        break;
      }
      unsigned int v12 = [(IOSClass *)v11 hash];
      formats = self->formats_;
      if (!formats) {
        break;
      }
      unsigned int v14 = v12;
      uint64_t v15 = formats->super.size_;
      if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v4);
      }
      v5 += v9 + v14;
      if ((&formats->elementType_)[(int)v4])
      {
        long long v16 = self->formats_;
        uint64_t v17 = v16->super.size_;
        if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v4);
        }
        long long v18 = (&v16->elementType_)[(int)v4];
        if (!v18) {
          break;
        }
        v5 += [(IOSClass *)v18 hash];
      }
      uint64_t v4 = (v4 + 1);
      int maxOffset = self->maxOffset_;
      if ((int)v4 > maxOffset) {
        goto LABEL_25;
      }
    }
LABEL_33:
    JreThrowNullPointerException();
  }
  int v5 = 0;
LABEL_25:
  long long v19 = self->strings_;
  if (!v19) {
    goto LABEL_33;
  }
  uint64_t v20 = maxOffset + 1;
  uint64_t v21 = v19->super.size_;
  if ((int)v20 < (int)v21)
  {
    if (maxOffset <= -2) {
      IOSArray_throwOutOfBoundsWithMsg(v21, maxOffset + 1);
    }
    v22 = (&v19->elementType_)[v20];
    if (!v22) {
      goto LABEL_33;
    }
    v5 += [(IOSClass *)v22 hash];
  }
  locale = self->locale_;
  if (locale) {
    v5 += [(JavaUtilLocale *)locale hash];
  }
  return v5;
}

- (id)parseWithNSString:(id)a3
{
  int v5 = new_JavaTextParsePosition_initWithInt_(0);
  id v6 = [(JavaTextMessageFormat *)self parseWithNSString:a3 withJavaTextParsePosition:v5];
  if (![(JavaTextParsePosition *)v5 getIndex])
  {
    uint64_t v8 = new_JavaTextParseException_initWithNSString_withInt_(@"Parse failure", [(JavaTextParsePosition *)v5 getErrorIndex]);
    objc_exception_throw(v8);
  }
  return v6;
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  if (!a3)
  {
    if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)LibcoreUtilEmptyArray_OBJECT_;
  }
  uint64_t v7 = new_JavaTextParsePosition_initWithInt_(0);
  if (!a4) {
    goto LABEL_46;
  }
  uint64_t v8 = v7;
  unint64_t v9 = (unint64_t)[a4 getIndex];
  uint64_t v10 = +[IOSObjectArray arrayWithLength:self->maxArgumentIndex_ + 1 type:NSObject_class_()];
  int maxOffset = self->maxOffset_;
  if (maxOffset < 0) {
    goto LABEL_34;
  }
  id v36 = a4;
  uint64_t v12 = 0;
  do
  {
    strings = self->strings_;
    if (!strings) {
      goto LABEL_46;
    }
    uint64_t size = strings->super.size_;
    if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v12);
    }
    uint64_t v15 = (&strings->elementType_)[(int)v12];
    if (([a3 hasPrefix:v15 offset:v9] & 1) == 0)
    {
      id v29 = v36;
LABEL_43:
      id v34 = (id)v9;
      goto LABEL_44;
    }
    if (!v15) {
      goto LABEL_46;
    }
    unsigned int v16 = [(IOSClass *)v15 length];
    formats = self->formats_;
    if (!formats) {
      goto LABEL_46;
    }
    unsigned int v18 = v16;
    uint64_t v19 = formats->super.size_;
    if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v19) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v12);
    }
    uint64_t v20 = (void *)(v9 + v18);
    uint64_t v21 = (&formats->elementType_)[(int)v12];
    if (v21)
    {
      [(JavaTextParsePosition *)v8 setIndexWithInt:v20];
      id v22 = [(IOSClass *)v21 parseObjectWithNSString:a3 withJavaTextParsePosition:v8];
      if ([(JavaTextParsePosition *)v8 getErrorIndex] != -1) {
        goto LABEL_41;
      }
      unint64_t v9 = [(JavaTextParsePosition *)v8 getIndex];
    }
    else
    {
      int v23 = v12 + 1;
      v24 = self->strings_;
      uint64_t v25 = v24->super.size_;
      if ((int)v12 + 1 >= (int)v25)
      {
        id v22 = [a3 substring:v20];
        unint64_t v9 = (unint64_t)[a3 length];
      }
      else
      {
        if (v23 < 0) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v12 + 1));
        }
        id v26 = [a3 indexOfString:(&v24->elementType_)[v23] fromIndex:v20];
        if (v26 == -1)
        {
LABEL_41:
          id v29 = v36;
          id v34 = v20;
LABEL_44:
          [v29 setErrorIndexWithInt:v34];
          return 0;
        }
        unint64_t v9 = (unint64_t)v26;
        id v22 = [a3 substring:v20 endIndex:v26];
      }
    }
    argumentNumbers = self->argumentNumbers_;
    if (!argumentNumbers) {
      goto LABEL_46;
    }
    uint64_t v28 = argumentNumbers->super.size_;
    if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v28) {
      IOSArray_throwOutOfBoundsWithMsg(v28, v12);
    }
    IOSObjectArray_Set((uint64_t)v10, *(&argumentNumbers->super.size_ + (int)v12 + 1), v22);
    uint64_t v12 = (v12 + 1);
    int maxOffset = self->maxOffset_;
  }
  while ((int)v12 <= maxOffset);
  a4 = v36;
LABEL_34:
  v30 = self->strings_;
  if (!v30) {
LABEL_46:
  }
    JreThrowNullPointerException();
  uint64_t v31 = maxOffset + 1;
  uint64_t v32 = v30->super.size_;
  if ((int)v31 >= (int)v32) {
    goto LABEL_40;
  }
  if (maxOffset <= -2) {
    IOSArray_throwOutOfBoundsWithMsg(v32, maxOffset + 1);
  }
  v33 = (&v30->elementType_)[v31];
  if (![a3 hasPrefix:v33 offset:v9])
  {
    id v29 = a4;
    goto LABEL_43;
  }
  if (!v33) {
    goto LABEL_46;
  }
  unint64_t v9 = v9 + [(IOSClass *)v33 length];
LABEL_40:
  [a4 setIndexWithInt:v9];
  return v10;
}

- (int)matchWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withBoolean:(BOOL)a5 withNSStringArray:(id)a6
{
  return sub_1001F1D1C(a3, a4, a5, (uint64_t)a6);
}

- (id)parseVariableWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  return sub_1001F00E0((uint64_t)self, a3, a4);
}

- (void)setFormatWithInt:(int)a3 withJavaTextFormat:(id)a4
{
  formats = self->formats_;
  if (!formats) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)formats, a3, a4);
}

- (void)setFormatsWithJavaTextFormatArray:(id)a3
{
  formats = self->formats_;
  if (!formats || !a3) {
    JreThrowNullPointerException();
  }
  int size = formats->super.size_;
  int v6 = *((_DWORD *)a3 + 2);
  if (v6 >= size) {
    uint64_t v7 = size;
  }
  else {
    uint64_t v7 = v6;
  }
  if ((int)v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = *((int *)a3 + 2);
      if (i >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, i);
      }
      IOSObjectArray_Set((uint64_t)self->formats_, i, *((void **)a3 + i + 3));
    }
  }
}

- (void)setLocaleWithJavaUtilLocale:(id)a3
{
  JreStrongAssign((id *)&self->locale_, a3);
  if ((self->maxOffset_ & 0x80000000) == 0)
  {
    uint64_t v5 = 0;
    do
    {
      formats = self->formats_;
      if (!formats) {
        JreThrowNullPointerException();
      }
      uint64_t size = formats->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      uint64_t v8 = (&formats->elementType_)[(int)v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v9 = self->formats_;
        objc_opt_class();
        if (!v8) {
          JreThrowNullPointerException();
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        id v10 = [(IOSClass *)v8 toPattern];
        uint64_t v11 = new_JavaTextDecimalFormatSymbols_initWithJavaUtilLocale_(a3);
        uint64_t v12 = new_JavaTextDecimalFormat_initWithNSString_withJavaTextDecimalFormatSymbols_((uint64_t)v10, v11);
        IOSObjectArray_SetAndConsume((uint64_t)v9, (int)v5, v12);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = self->formats_;
          objc_opt_class();
          if (!v8) {
            JreThrowNullPointerException();
          }
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          unsigned int v14 = new_JavaTextSimpleDateFormat_initWithNSString_withJavaUtilLocale_([(IOSClass *)v8 toPattern], a3);
          IOSObjectArray_SetAndConsume((uint64_t)v13, (int)v5, v14);
        }
      }
      uint64_t v5 = (v5 + 1);
    }
    while ((int)v5 <= self->maxOffset_);
  }
}

- (id)decodeDecimalFormatWithJavaLangStringBuffer:(id)a3 withJavaTextFormat:(id)a4
{
  return sub_1001F2248((uint64_t)self, a3, a4);
}

- (id)decodeSimpleDateFormatWithJavaLangStringBuffer:(id)a3 withJavaTextFormat:(id)a4
{
  return sub_1001F2390((uint64_t)self, a3, a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (id)toPattern
{
  v3 = new_JavaLangStringBuffer_init();
  int maxOffset = self->maxOffset_;
  if ((maxOffset & 0x80000000) == 0)
  {
    uint64_t v5 = 0;
    do
    {
      strings = self->strings_;
      if (!strings) {
        goto LABEL_45;
      }
      uint64_t size = strings->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      sub_1001F28F4(v3, (&strings->elementType_)[(int)v5]);
      [(JavaLangStringBuffer *)v3 appendWithChar:123];
      argumentNumbers = self->argumentNumbers_;
      if (!argumentNumbers) {
        goto LABEL_45;
      }
      uint64_t v9 = argumentNumbers->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v5);
      }
      [(JavaLangStringBuffer *)v3 appendWithInt:*((unsigned int *)&argumentNumbers->super.size_ + (int)v5 + 1)];
      formats = self->formats_;
      if (!formats) {
        goto LABEL_45;
      }
      uint64_t v11 = formats->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v5);
      }
      uint64_t v12 = (&formats->elementType_)[(int)v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(JavaLangStringBuffer *)v3 appendWithNSString:@",choice,"];
        objc_opt_class();
        if (!v12) {
          goto LABEL_45;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        id v13 = [(IOSClass *)v12 toPattern];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = sub_1001F2248((uint64_t)self, v3, v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v12)
            {
              v30 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Unknown format");
              objc_exception_throw(v30);
            }
            goto LABEL_33;
          }
          id v13 = sub_1001F2390((uint64_t)self, v3, v12, v14, v15, v16, v17, v18);
        }
      }
      uint64_t v19 = v13;
      if (v13)
      {
        int v20 = [v13 length];
        if (v20 >= 1)
        {
          int v21 = 0;
          uint64_t v22 = 0;
          int v23 = 0;
          do
          {
            id v24 = [v19 charAtWithInt:v22];
            uint64_t v25 = (uint64_t)v24;
            v23 ^= v24 == 39;
            if ((v23 & 1) == 0)
            {
              if (v24 == 123) {
                ++v21;
              }
              if (v24 == 125)
              {
                if (v21 < 1)
                {
                  [(JavaLangStringBuffer *)v3 appendWithNSString:@"'}"];
                  uint64_t v25 = 39;
                }
                else
                {
                  uint64_t v25 = 125;
                  --v21;
                }
              }
            }
            uint64_t v22 = (v22 + 1);
            [(JavaLangStringBuffer *)v3 appendWithChar:v25];
          }
          while (v20 != v22);
        }
      }
LABEL_33:
      [(JavaLangStringBuffer *)v3 appendWithChar:125];
      uint64_t v5 = (v5 + 1);
      int maxOffset = self->maxOffset_;
    }
    while ((int)v5 <= maxOffset);
  }
  id v26 = self->strings_;
  if (!v26) {
LABEL_45:
  }
    JreThrowNullPointerException();
  uint64_t v27 = maxOffset + 1;
  uint64_t v28 = v26->super.size_;
  if ((int)v27 < (int)v28)
  {
    if (maxOffset <= -2) {
      IOSArray_throwOutOfBoundsWithMsg(v28, maxOffset + 1);
    }
    sub_1001F28F4(v3, (&v26->elementType_)[v27]);
  }
  return [(JavaLangStringBuffer *)v3 description];
}

- (void)appendQuotedWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4
{
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_25;
  }
  id v3 = a3;
  id v5 = [a3 putFields];
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  [v5 putWithNSString:@"argumentNumbers" withId:self->argumentNumbers_];
  [v6 putWithNSString:@"formats" withId:self->formats_];
  [v6 putWithNSString:@"locale" withId:self->locale_];
  [v6 putWithNSString:@"maxOffset" withInt:self->maxOffset_];
  uint64_t v7 = +[IOSIntArray arrayWithLength:self->maxOffset_ + 1];
  uint64_t v22 = new_JavaLangStringBuilder_init();
  int maxOffset = self->maxOffset_;
  if ((maxOffset & 0x80000000) == 0)
  {
    id v21 = v3;
    uint64_t v9 = 0;
    int v10 = 0;
    do
    {
      strings = self->strings_;
      if (!strings) {
        goto LABEL_25;
      }
      uint64_t size = strings->super.size_;
      if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v9);
      }
      id v13 = (&strings->elementType_)[(int)v9];
      if (!v13) {
        goto LABEL_25;
      }
      unsigned int v14 = [(IOSClass *)v13 length];
      uint64_t v15 = v7->super.size_;
      if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v9);
      }
      v10 += v14;
      *(&v7->super.size_ + (int)v9 + 1) = v10;
      uint64_t v16 = self->strings_;
      uint64_t v17 = v16->super.size_;
      if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v17) {
        IOSArray_throwOutOfBoundsWithMsg(v17, v9);
      }
      [(JavaLangStringBuilder *)v22 appendWithNSString:(&v16->elementType_)[(int)v9]];
      uint64_t v9 = (v9 + 1);
      int maxOffset = self->maxOffset_;
    }
    while ((int)v9 <= maxOffset);
    id v3 = v21;
  }
  uint64_t v18 = self->strings_;
  if (!v18) {
LABEL_25:
  }
    JreThrowNullPointerException();
  uint64_t v19 = maxOffset + 1;
  uint64_t v20 = v18->super.size_;
  if ((int)v19 < (int)v20)
  {
    if (maxOffset <= -2) {
      IOSArray_throwOutOfBoundsWithMsg(v20, maxOffset + 1);
    }
    [(JavaLangStringBuilder *)v22 appendWithNSString:(&v18->elementType_)[v19]];
  }
  [v6 putWithNSString:@"offsets" withId:v7];
  objc_msgSend(v6, "putWithNSString:withId:", @"pattern", -[JavaLangStringBuilder description](v22, "description"));
  [v3 writeFields];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    goto LABEL_42;
  }
  id v4 = [a3 readFields];
  if (!v4) {
    goto LABEL_42;
  }
  id v5 = v4;
  id v6 = [v4 getWithNSString:@"argumentNumbers" withId:0];
  objc_opt_class();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  JreStrongAssign((id *)&self->argumentNumbers_, v6);
  id v7 = [v5 getWithNSString:@"formats" withId:0];
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
  }
  JreStrongAssign((id *)&self->formats_, v7);
  id v8 = [v5 getWithNSString:@"locale" withId:0];
  objc_opt_class();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
  }
  JreStrongAssign((id *)&self->locale_, v8);
  self->maxOffset_ = [v5 getWithNSString:@"maxOffset" withInt:0];
  uint64_t v9 = [v5 getWithNSString:@"offsets" withId:0];
  objc_opt_class();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
  }
  id v10 = [v5 getWithNSString:@"pattern" withId:0];
  objc_opt_class();
  if (!v10)
  {
    uint64_t maxOffset = self->maxOffset_;
    if ((maxOffset & 0x80000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_40:
  }
    JreThrowClassCastException();
  uint64_t maxOffset = self->maxOffset_;
  if ((maxOffset & 0x80000000) != 0)
  {
    int v12 = (int)[v10 length] > 0;
    goto LABEL_23;
  }
LABEL_16:
  if (!v9) {
    goto LABEL_42;
  }
  uint64_t v13 = v9[2];
  if ((int)maxOffset >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, maxOffset);
  }
  if (!v10) {
    goto LABEL_42;
  }
  int v14 = v9[maxOffset + 3];
  if (v14 == [v10 length]) {
    int v15 = 1;
  }
  else {
    int v15 = 2;
  }
  int v12 = v15 + maxOffset;
LABEL_23:
  p_strings = (uint64_t *)&self->strings_;
  id v17 = +[IOSObjectArray newArrayWithLength:v12 type:NSString_class_()];
  JreStrongAssignAndConsume((id *)&self->strings_, v17);
  int v18 = self->maxOffset_;
  if (v18 < 0)
  {
    uint64_t v20 = 0;
    goto LABEL_35;
  }
  if (!v9) {
LABEL_42:
  }
    JreThrowNullPointerException();
  int v19 = 0;
  uint64_t v20 = 0;
  do
  {
    uint64_t v21 = v19;
    uint64_t v22 = v9[2];
    if (v19 < 0 || v19 >= (int)v22) {
      IOSArray_throwOutOfBoundsWithMsg(v22, v19);
    }
    IOSObjectArray_Set(*p_strings, v19, [v10 substring:v20 endIndex:v9[v19 + 3]]);
    uint64_t v23 = v9[2];
    if ((v21 & 0x80000000) != 0 || (int)v21 >= (int)v23) {
      IOSArray_throwOutOfBoundsWithMsg(v23, v21);
    }
    uint64_t v20 = v9[v21 + 3];
    int v19 = v21 + 1;
    int v18 = self->maxOffset_;
  }
  while ((int)v21 + 1 <= v18);
LABEL_35:
  uint64_t v24 = *p_strings;
  uint64_t v25 = *(int *)(*p_strings + 8);
  if (v18 + 1 < (int)v25)
  {
    uint64_t v26 = v25 - 1;
    id v27 = objc_msgSend(v10, "substring:endIndex:", v20, objc_msgSend(v10, "length"));
    IOSObjectArray_Set(v24, v26, v27);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextMessageFormat;
  [(JavaTextMessageFormat *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (JavaLangRefWeakReference *)IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u);
    v9[0] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"argumentNumbers", v2);
    uint64_t v3 = JavaTextFormat_class_();
    id v4 = (JavaLangRefWeakReference *)IOSClass_arrayType(v3, 1u);
    v9[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"formats", v4);
    id v5 = (JavaLangRefWeakReference *)JavaUtilLocale_class_();
    v9[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"locale", v5);
    v9[3] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"maxOffset", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    id v6 = (JavaLangRefWeakReference *)IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u);
    v9[4] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"offsets", v6);
    id v7 = (JavaLangRefWeakReference *)NSString_class_();
    v9[5] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"pattern", v7);
    id v8 = +[IOSObjectArray newArrayWithObjects:v9 count:6 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560D98, v8);
    atomic_store(1u, (unsigned __int8 *)&JavaTextMessageFormat__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043A180;
}

@end
@interface JavaUtilFormatter_FormatToken
+ (const)__metadata;
- (BOOL)isDefault;
- (BOOL)isPrecisionSet;
- (BOOL)requireArgument;
- (BOOL)setFlagWithInt:(int)a3;
- (JavaUtilFormatter_FormatToken)init;
- (id)getStrFlags;
- (id)unknownFormatConversionException;
- (int)getArgIndex;
- (int)getPrecision;
- (int)getWidth;
- (unsigned)getConversionType;
- (unsigned)getDateSuffix;
- (void)checkFlagsWithId:(id)a3;
- (void)dealloc;
- (void)setArgIndexWithInt:(int)a3;
- (void)setConversionTypeWithChar:(unsigned __int16)a3;
- (void)setDateSuffixWithChar:(unsigned __int16)a3;
- (void)setPrecisionWithInt:(int)a3;
- (void)setWidthWithInt:(int)a3;
@end

@implementation JavaUtilFormatter_FormatToken

- (BOOL)isDefault
{
  return !self->flagComma_
      && !self->flagMinus_
      && !self->flagParenthesis_
      && !self->flagPlus_
      && !self->flagSharp_
      && !self->flagSpace_
      && !self->flagZero_
      && self->width_ == -1
      && self->precision_ == -1;
}

- (BOOL)isPrecisionSet
{
  return self->precision_ != -1;
}

- (int)getArgIndex
{
  return self->argIndex_;
}

- (void)setArgIndexWithInt:(int)a3
{
  self->argIndex_ = a3;
}

- (int)getWidth
{
  return self->width_;
}

- (void)setWidthWithInt:(int)a3
{
  self->width_ = a3;
}

- (int)getPrecision
{
  return self->precision_;
}

- (void)setPrecisionWithInt:(int)a3
{
  self->precision_ = a3;
}

- (id)getStrFlags
{
  strFlags = self->strFlags_;
  if (strFlags) {
    return [(JavaLangStringBuilder *)strFlags description];
  }
  else {
    return &stru_10048C1F8;
  }
}

- (BOOL)setFlagWithInt:(int)a3
{
  int v3 = a3 - 32;
  if ((a3 - 32) > 0x10 || ((0x13909u >> v3) & 1) == 0) {
    return 0;
  }
  unsigned __int16 v5 = a3;
  uint64_t v6 = qword_10031FB58[v3];
  int v7 = *((unsigned __int8 *)&self->super.isa + v6);
  *((unsigned char *)&self->super.isa + v6) = 1;
  if (v7)
  {
    v11 = NSString_valueOfInt_(a3);
    v12 = new_JavaUtilDuplicateFormatFlagsException_initWithNSString_(v11);
    objc_exception_throw(v12);
  }
  p_strFlags = &self->strFlags_;
  strFlags = self->strFlags_;
  if (!strFlags)
  {
    v10 = new_JavaLangStringBuilder_initWithInt_(7u);
    JreStrongAssignAndConsume((id *)p_strFlags, v10);
    strFlags = *p_strFlags;
    if (!*p_strFlags) {
      JreThrowNullPointerException();
    }
  }
  [(JavaLangStringBuilder *)strFlags appendWithChar:v5];
  return 1;
}

- (unsigned)getConversionType
{
  return self->conversionType_;
}

- (void)setConversionTypeWithChar:(unsigned __int16)a3
{
  self->conversionType_ = a3;
}

- (unsigned)getDateSuffix
{
  return self->dateSuffix_;
}

- (void)setDateSuffixWithChar:(unsigned __int16)a3
{
  self->dateSuffix_ = a3;
}

- (BOOL)requireArgument
{
  int conversionType = self->conversionType_;
  return conversionType != 37 && conversionType != 110;
}

- (void)checkFlagsWithId:(id)a3
{
  int v9 = self->conversionType_ - 65;
  char v10 = 0;
  char v11 = 0;
  unsigned __int8 v12 = 0;
  char v13 = 0;
  BOOL flagMinus = 1;
  char v15 = 1;
  char v16 = 1;
  char v17 = 1;
  char v18 = 1;
  switch(v9)
  {
    case 0:
    case 32:
      char v10 = 0;
      goto LABEL_8;
    case 1:
    case 7:
    case 33:
    case 39:
      goto LABEL_17;
    case 2:
    case 19:
    case 34:
    case 51:
      char v10 = 0;
      char v11 = 0;
      unsigned __int8 v12 = 0;
      char v13 = 0;
      BOOL flagMinus = 0;
      goto LABEL_17;
    case 4:
    case 36:
      char v10 = 1;
LABEL_8:
      char v11 = 1;
      unsigned __int8 v12 = 1;
      char v13 = 1;
      goto LABEL_17;
    case 6:
    case 38:
      goto LABEL_23;
    case 18:
    case 50:
      unsigned __int8 v12 = [(id)JavaUtilFormattable_class_() isInstance:a3];
      char v10 = 0;
      char v11 = 0;
      char v13 = 0;
      BOOL flagMinus = 1;
      goto LABEL_16;
    case 23:
    case 46:
      if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        char v10 = 0;
        char v11 = 0;
        BOOL flagMinus = 0;
      }
      else
      {
        BOOL flagMinus = 0;
        char v10 = 1;
        char v11 = 1;
      }
      unsigned __int8 v12 = 1;
      char v13 = 1;
LABEL_16:
      char v15 = 1;
LABEL_17:
      if (self->flagComma_)
      {
        v20 = @",";
        goto LABEL_59;
      }
      char v16 = 1;
      char v17 = v13;
      char v18 = v11;
      if ((v10 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_20;
    case 35:
      BOOL flagMinus = 0;
      goto LABEL_23;
    case 37:
      goto LABEL_34;
    case 45:
      if (self->flagComma_)
      {
        v20 = @",";
        goto LABEL_60;
      }
      BOOL flagMinus = self->flagMinus_;
      if (flagMinus)
      {
        v20 = @"-";
        goto LABEL_59;
      }
      char v15 = 0;
      char v16 = 0;
      char v13 = 0;
      unsigned __int8 v12 = 0;
      char v11 = 0;
LABEL_19:
      char v17 = v13;
      char v18 = v11;
      if (self->flagParenthesis_)
      {
        v20 = CFSTR("(");
        goto LABEL_59;
      }
LABEL_20:
      if ((v18 & 1) == 0 && self->flagPlus_)
      {
        v20 = @"+";
        goto LABEL_59;
      }
      if ((v12 & 1) == 0)
      {
LABEL_23:
        if (self->flagSharp_)
        {
          v20 = @"#";
          goto LABEL_59;
        }
      }
      if ((v18 & 1) == 0)
      {
        if (self->flagSpace_) {
          char v19 = 1;
        }
        else {
          char v19 = v17;
        }
        if ((v19 & 1) == 0) {
          goto LABEL_33;
        }
        if (!self->flagSpace_) {
          goto LABEL_34;
        }
        v20 = @" ";
LABEL_59:
        int conversionType = self->conversionType_;
        if (conversionType != 110)
        {
          v24 = new_JavaUtilFormatFlagsConversionMismatchException_initWithNSString_withChar_(v20, conversionType);
LABEL_62:
          objc_exception_throw(v24);
        }
LABEL_60:
        v24 = new_JavaUtilIllegalFormatFlagsException_initWithNSString_(v20);
        goto LABEL_62;
      }
      if (v17) {
        goto LABEL_34;
      }
LABEL_33:
      if (self->flagZero_)
      {
        v20 = @"0";
        goto LABEL_59;
      }
LABEL_34:
      if ((self->flagMinus_ || self->flagZero_) && self->width_ == -1)
      {
        v23 = (__CFString *)JreStrcat("CC", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (id)0x2D);
        v24 = new_JavaUtilMissingFormatWidthException_initWithNSString_(v23);
        goto LABEL_62;
      }
      if ((v15 & 1) == 0 && self->argIndex_ != -1)
      {
        v20 = (__CFString *)JreStrcat("CC$", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (id)0x25);
        goto LABEL_60;
      }
      if (!flagMinus)
      {
        unsigned int precision = self->precision_;
        if (precision != -1)
        {
          v24 = new_JavaUtilIllegalFormatPrecisionException_initWithInt_(precision);
          goto LABEL_62;
        }
      }
      if ((v16 & 1) == 0)
      {
        unsigned int width = self->width_;
        if (width != -1)
        {
          v24 = new_JavaUtilIllegalFormatWidthException_initWithInt_(width);
          goto LABEL_62;
        }
      }
      if (self->flagPlus_ && self->flagSpace_)
      {
        v20 = @"the '+' and ' ' flags are incompatible";
        goto LABEL_60;
      }
      if (self->flagMinus_ && self->flagZero_)
      {
        v20 = @"the '-' and '0' flags are incompatible";
        goto LABEL_60;
      }
      return;
    default:
      objc_exception_throw([(JavaUtilFormatter_FormatToken *)self unknownFormatConversionException]);
  }
}

- (id)unknownFormatConversionException
{
  unsigned int conversionType = self->conversionType_;
  if ((conversionType | 0x20) == 0x74)
  {
    v7[0] = JavaLangCharacter_valueOfWithChar_(conversionType);
    v7[1] = JavaLangCharacter_valueOfWithChar_(self->dateSuffix_);
    uint64_t v4 = +[IOSObjectArray arrayWithObjects:v7 count:2 type:NSObject_class_()];
    uint64_t v5 = NSString_formatWithNSString_withNSObjectArray_(@"%c%c", (uint64_t)v4);
  }
  else
  {
    uint64_t v5 = NSString_valueOfChar_(conversionType);
  }
  uint64_t v6 = new_JavaUtilUnknownFormatConversionException_initWithNSString_(v5);
  objc_exception_throw(v6);
}

- (JavaUtilFormatter_FormatToken)init
{
  self->argIndex_ = -1;
  self->conversionType_ = -1;
  *(void *)&self->precision_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilFormatter_FormatToken;
  [(JavaUtilFormatter_FormatToken *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F3CE8;
}

@end
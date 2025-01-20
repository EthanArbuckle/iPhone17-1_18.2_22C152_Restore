@interface JavaTextDecimalFormat
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isDecimalSeparatorAlwaysShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupingUsed;
- (BOOL)isParseBigDecimal;
- (BOOL)isParseIntegerOnly;
- (JavaTextDecimalFormat)formatWithDouble:(double)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextDecimalFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextDecimalFormat)formatWithLong:(int64_t)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextDecimalFormat)init;
- (JavaTextDecimalFormat)initWithNSString:(id)a3;
- (JavaTextDecimalFormat)initWithNSString:(id)a3 withJavaTextDecimalFormatSymbols:(id)a4;
- (JavaTextDecimalFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)clone;
- (id)formatToCharacterIteratorWithId:(id)a3;
- (id)getCurrency;
- (id)getDecimalFormatSymbols;
- (id)getNegativePrefix;
- (id)getNegativeSuffix;
- (id)getPositivePrefix;
- (id)getPositiveSuffix;
- (id)getRoundingMode;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)toLocalizedPattern;
- (id)toPattern;
- (int)getGroupingSize;
- (int)getMultiplier;
- (unint64_t)hash;
- (void)applyLocalizedPatternWithNSString:(id)a3;
- (void)applyPatternWithNSString:(id)a3;
- (void)checkBufferAndFieldPositionWithJavaLangStringBuffer:(id)a3 withJavaTextFieldPosition:(id)a4;
- (void)dealloc;
- (void)initNativeWithNSString:(id)a3;
- (void)setCurrencyWithJavaUtilCurrency:(id)a3;
- (void)setDecimalFormatSymbolsWithJavaTextDecimalFormatSymbols:(id)a3;
- (void)setDecimalSeparatorAlwaysShownWithBoolean:(BOOL)a3;
- (void)setGroupingSizeWithInt:(int)a3;
- (void)setGroupingUsedWithBoolean:(BOOL)a3;
- (void)setMaximumFractionDigitsWithInt:(int)a3;
- (void)setMaximumIntegerDigitsWithInt:(int)a3;
- (void)setMinimumFractionDigitsWithInt:(int)a3;
- (void)setMinimumIntegerDigitsWithInt:(int)a3;
- (void)setMultiplierWithInt:(int)a3;
- (void)setNegativePrefixWithNSString:(id)a3;
- (void)setNegativeSuffixWithNSString:(id)a3;
- (void)setParseBigDecimalWithBoolean:(BOOL)a3;
- (void)setParseIntegerOnlyWithBoolean:(BOOL)a3;
- (void)setPositivePrefixWithNSString:(id)a3;
- (void)setPositiveSuffixWithNSString:(id)a3;
- (void)setRoundingModeWithJavaMathRoundingModeEnum:(id)a3;
@end

@implementation JavaTextDecimalFormat

- (JavaTextDecimalFormat)init
{
  return self;
}

- (JavaTextDecimalFormat)initWithNSString:(id)a3
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaTextDecimalFormat_initWithNSString_withJavaUtilLocale_((uint64_t)self, (uint64_t)a3, Default);
  return self;
}

- (JavaTextDecimalFormat)initWithNSString:(id)a3 withJavaTextDecimalFormatSymbols:(id)a4
{
  return self;
}

- (JavaTextDecimalFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (void)initNativeWithNSString:(id)a3
{
  v4 = new_LibcoreIcuNativeDecimalFormat_initWithNSString_withJavaTextDecimalFormatSymbols_(a3, *(void **)(&self->super.minimumFractionDigits_ + 1));
  v5 = (id *)((char *)&self->symbols_ + 4);
  JreStrongAssignAndConsume((id *)((char *)&self->symbols_ + 4), v4);
  v6 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v6) {
    JreThrowNullPointerException();
  }
  v13.receiver = self;
  v13.super_class = (Class)JavaTextDecimalFormat;
  -[JavaTextNumberFormat setMaximumFractionDigitsWithInt:](&v13, "setMaximumFractionDigitsWithInt:", [v6 getMaximumFractionDigits]);
  id v7 = [*v5 getMaximumIntegerDigits];
  v12.receiver = self;
  v12.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v12 setMaximumIntegerDigitsWithInt:v7];
  id v8 = [*v5 getMinimumFractionDigits];
  v11.receiver = self;
  v11.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v11 setMinimumFractionDigitsWithInt:v8];
  id v9 = [*v5 getMinimumIntegerDigits];
  v10.receiver = self;
  v10.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v10 setMinimumIntegerDigitsWithInt:v9];
}

- (void)applyLocalizedPatternWithNSString:(id)a3
{
  v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 applyLocalizedPatternWithNSString:a3];
}

- (void)applyPatternWithNSString:(id)a3
{
  v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 applyPatternWithNSString:a3];
}

- (id)clone
{
  v9.receiver = self;
  v9.super_class = (Class)JavaTextDecimalFormat;
  v3 = [(JavaTextNumberFormat *)&v9 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  v4 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v4) {
    goto LABEL_10;
  }
  id v5 = [v4 clone];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_11:
  }
    JreThrowClassCastException();
  JreStrongAssign((id *)(v3 + 36), v5);
  v6 = *(void **)(&self->super.minimumFractionDigits_ + 1);
  if (!v6) {
LABEL_10:
  }
    JreThrowNullPointerException();
  id v7 = [v6 clone];
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  JreStrongAssign((id *)(v3 + 28), v7);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  uint64_t v6 = *(void *)((char *)a3 + 36);
  if (!v5)
  {
    if (!v6) {
      goto LABEL_12;
    }
LABEL_10:
    LOBYTE(v7) = 0;
    return v7;
  }
  unsigned int v7 = [v5 isEqual:v6];
  if (!v7) {
    return v7;
  }
LABEL_12:
  id v8 = [(JavaTextDecimalFormat *)self getDecimalFormatSymbols];
  if (!v8) {
LABEL_17:
  }
    JreThrowNullPointerException();
  objc_super v9 = v8;
  id v10 = [a3 getDecimalFormatSymbols];
  LOBYTE(v7) = [v9 isEqual:v10];
  return v7;
}

- (id)formatToCharacterIteratorWithId:(id)a3
{
  if (!a3)
  {
    id v5 = new_JavaLangNullPointerException_initWithNSString_(@"object == null");
    objc_exception_throw(v5);
  }
  v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return objc_msgSend(v3, "formatToCharacterIteratorWithId:");
}

- (void)checkBufferAndFieldPositionWithJavaLangStringBuffer:(id)a3 withJavaTextFieldPosition:(id)a4
{
}

- (JavaTextDecimalFormat)formatWithDouble:(double)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  sub_10027276C((uint64_t)a4, (uint64_t)a5);
  uint64_t v9 = *(uint64_t *)((char *)&self->ndf_ + 4);
  if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v9 == qword_100563CC8)
  {
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(JavaTextDecimalFormat *)self setRoundingModeWithJavaMathRoundingModeEnum:JavaMathRoundingModeEnum_values_[0]];
    id v10 = new_JavaLangStringBuffer_init();
    objc_super v11 = [(JavaTextDecimalFormat *)self formatWithDouble:v10 withJavaLangStringBuffer:new_JavaTextFieldPosition_initWithInt_(0) withJavaTextFieldPosition:a3];
    if (!v11) {
      JreThrowNullPointerException();
    }
    id v12 = [(JavaTextDecimalFormat *)v11 description];
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(JavaTextDecimalFormat *)self setRoundingModeWithJavaMathRoundingModeEnum:qword_100563C98];
    objc_super v13 = new_JavaLangStringBuffer_init();
    v14 = [(JavaTextDecimalFormat *)self formatWithDouble:v13 withJavaLangStringBuffer:new_JavaTextFieldPosition_initWithInt_(0) withJavaTextFieldPosition:a3];
    if (!v14 || (id v15 = [(JavaTextDecimalFormat *)v14 description], !v12)) {
      JreThrowNullPointerException();
    }
    if (([v12 isEqual:v15] & 1) == 0)
    {
      v18 = new_JavaLangArithmeticException_initWithNSString_(@"rounding mode UNNECESSARY but rounding required");
      objc_exception_throw(v18);
    }
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(JavaTextDecimalFormat *)self setRoundingModeWithJavaMathRoundingModeEnum:qword_100563CC8];
  }
  if (!a4 || (v16 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4)) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a4, "appendWithCharArray:", objc_msgSend(v16, "formatDoubleWithDouble:withJavaTextFieldPosition:", a5, a3));
  return (JavaTextDecimalFormat *)a4;
}

- (JavaTextDecimalFormat)formatWithLong:(int64_t)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  sub_10027276C((uint64_t)a4, (uint64_t)a5);
  if (!a4 || (uint64_t v9 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4)) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a4, "appendWithCharArray:", objc_msgSend(v9, "formatLongWithLong:withJavaTextFieldPosition:", a3, a5));
  return (JavaTextDecimalFormat *)a4;
}

- (JavaTextDecimalFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  uint64_t v6 = (JavaTextDecimalFormat *)a4;
  sub_10027276C((uint64_t)a4, (uint64_t)a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_19;
    }
    if (objc_opt_isKindOfClass())
    {
      int v9 = [a3 bitLength];
      id v10 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
      if (v9 > 63)
      {
        if (!v10) {
          goto LABEL_19;
        }
        id v11 = [v10 formatBigIntegerWithJavaMathBigInteger:a3 withJavaTextFieldPosition:a5];
      }
      else
      {
        if (!v10) {
          goto LABEL_19;
        }
        id v11 = objc_msgSend(v10, "formatLongWithLong:withJavaTextFieldPosition:", objc_msgSend(a3, "longLongValue"), a5);
      }
      id v13 = v11;
      if (v6) {
        goto LABEL_17;
      }
LABEL_19:
      JreThrowNullPointerException();
    }
LABEL_20:
    JreThrowClassCastException();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v6) {
      goto LABEL_19;
    }
    id v12 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
    if (!v12) {
      goto LABEL_19;
    }
    objc_opt_class();
    if (!a3 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = [v12 formatBigDecimalWithJavaMathBigDecimal:a3 withJavaTextFieldPosition:a5];
LABEL_17:
      [(JavaTextDecimalFormat *)v6 appendWithCharArray:v13];
      return v6;
    }
    goto LABEL_20;
  }
  v15.receiver = self;
  v15.super_class = (Class)JavaTextDecimalFormat;
  return [(JavaTextNumberFormat *)&v15 formatWithId:a3 withJavaLangStringBuffer:v6 withJavaTextFieldPosition:a5];
}

- (id)getDecimalFormatSymbols
{
  v2 = *(void **)(&self->super.minimumFractionDigits_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = [v2 clone];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

- (id)getCurrency
{
  v2 = *(void **)(&self->super.minimumFractionDigits_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getCurrency];
}

- (int)getGroupingSize
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getGroupingSize];
}

- (int)getMultiplier
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getMultiplier];
}

- (id)getNegativePrefix
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getNegativePrefix];
}

- (id)getNegativeSuffix
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getNegativeSuffix];
}

- (id)getPositivePrefix
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getPositivePrefix];
}

- (id)getPositiveSuffix
{
  v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getPositiveSuffix];
}

- (unint64_t)hash
{
  id v2 = [(JavaTextDecimalFormat *)self getPositivePrefix];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (int)[v2 hash];
}

- (BOOL)isDecimalSeparatorAlwaysShown
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 isDecimalSeparatorAlwaysShown];
}

- (BOOL)isParseBigDecimal
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 isParseBigDecimal];
}

- (void)setParseIntegerOnlyWithBoolean:(BOOL)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setParseIntegerOnlyWithBoolean:a3];
}

- (BOOL)isParseIntegerOnly
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 isParseIntegerOnly];
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  id v5 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v5) {
    JreThrowNullPointerException();
  }
  id v6 = [v5 parseWithNSString:a3 withJavaTextParsePosition:a4];
  if (!v6) {
    return v6;
  }
  if ([(JavaTextDecimalFormat *)self isParseBigDecimal])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v7 = new_JavaMathBigDecimal_initWithLong_((uint64_t)[v6 longLongValue]);
LABEL_16:
      return v7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      if (([v6 isInfinite] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v6 isNaN] & 1) == 0)
          {
LABEL_15:
            unsigned int v7 = new_JavaMathBigDecimal_initWithNSString_([v6 description]);
            goto LABEL_16;
          }
          goto LABEL_14;
        }
LABEL_26:
        JreThrowClassCastException();
      }
    }
LABEL_14:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_15;
    }
    return v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v6 doubleValue];
    unsigned int v7 = new_JavaLangDouble_initWithDouble_(v8);
    goto LABEL_16;
  }
  if (![(JavaTextDecimalFormat *)self isParseIntegerOnly]
    || ![v6 isEqual:qword_100562738])
  {
    return v6;
  }
  return JavaLangLong_valueOfWithLong_(0);
}

- (void)setDecimalFormatSymbolsWithJavaTextDecimalFormatSymbols:(id)a3
{
  if (a3)
  {
    id v4 = [a3 clone];
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign((id *)(&self->super.minimumFractionDigits_ + 1), v4);
    id v5 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
    if (!v5) {
      JreThrowNullPointerException();
    }
    uint64_t v6 = *(void *)(&self->super.minimumFractionDigits_ + 1);
    [v5 setDecimalFormatSymbolsWithJavaTextDecimalFormatSymbols:v6];
  }
}

- (void)setCurrencyWithJavaUtilCurrency:(id)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3
    || !a3
    || (objc_msgSend(v3, "setCurrencyWithJavaUtilCurrency:", JavaUtilCurrency_getInstanceWithNSString_(objc_msgSend(a3, "getCurrencyCode"))), (uint64_t v6 = *(void **)(&self->super.minimumFractionDigits_ + 1)) == 0))
  {
    JreThrowNullPointerException();
  }
  [v6 setCurrencyWithJavaUtilCurrency:a3];
}

- (void)setDecimalSeparatorAlwaysShownWithBoolean:(BOOL)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setDecimalSeparatorAlwaysShownWithBoolean:a3];
}

- (void)setGroupingSizeWithInt:(int)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setGroupingSizeWithInt:*(void *)&a3];
}

- (void)setGroupingUsedWithBoolean:(BOOL)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setGroupingUsedWithBoolean:a3];
}

- (BOOL)isGroupingUsed
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 isGroupingUsed];
}

- (void)setMaximumFractionDigitsWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v5 setMaximumFractionDigitsWithInt:*(void *)&a3];
  id v4 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v4) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v4, "setMaximumFractionDigitsWithInt:", -[JavaTextNumberFormat getMaximumFractionDigits](self, "getMaximumFractionDigits"));
  [(JavaTextDecimalFormat *)self setRoundingModeWithJavaMathRoundingModeEnum:*(LibcoreIcuNativeDecimalFormat **)((char *)&self->ndf_ + 4)];
}

- (void)setMaximumIntegerDigitsWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v5 setMaximumIntegerDigitsWithInt:*(void *)&a3];
  id v4 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v4) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v4, "setMaximumIntegerDigitsWithInt:", -[JavaTextNumberFormat getMaximumIntegerDigits](self, "getMaximumIntegerDigits"));
}

- (void)setMinimumFractionDigitsWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v5 setMinimumFractionDigitsWithInt:*(void *)&a3];
  id v4 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v4) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v4, "setMinimumFractionDigitsWithInt:", -[JavaTextNumberFormat getMinimumFractionDigits](self, "getMinimumFractionDigits"));
}

- (void)setMinimumIntegerDigitsWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextNumberFormat *)&v5 setMinimumIntegerDigitsWithInt:*(void *)&a3];
  id v4 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v4) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v4, "setMinimumIntegerDigitsWithInt:", -[JavaTextNumberFormat getMinimumIntegerDigits](self, "getMinimumIntegerDigits"));
}

- (void)setMultiplierWithInt:(int)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setMultiplierWithInt:*(void *)&a3];
}

- (void)setNegativePrefixWithNSString:(id)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setNegativePrefixWithNSString:a3];
}

- (void)setNegativeSuffixWithNSString:(id)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setNegativeSuffixWithNSString:a3];
}

- (void)setPositivePrefixWithNSString:(id)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setPositivePrefixWithNSString:a3];
}

- (void)setPositiveSuffixWithNSString:(id)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setPositiveSuffixWithNSString:a3];
}

- (void)setParseBigDecimalWithBoolean:(BOOL)a3
{
  id v3 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 setParseBigDecimalWithBoolean:a3];
}

- (id)toLocalizedPattern
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 toLocalizedPattern];
}

- (id)toPattern
{
  id v2 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 toPattern];
}

- (id)getRoundingMode
{
  return *(LibcoreIcuNativeDecimalFormat **)((char *)&self->ndf_ + 4);
}

- (void)setRoundingModeWithJavaMathRoundingModeEnum:(id)a3
{
  if (!a3)
  {
    int v9 = new_JavaLangNullPointerException_initWithNSString_(@"roundingMode == null");
    objc_exception_throw(v9);
  }
  JreStrongAssign((id *)((char *)&self->ndf_ + 4), a3);
  if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if ((id)qword_100563CC8 != a3)
  {
    int v5 = JavaLangMath_maxWithInt_withInt_(0, [(JavaTextNumberFormat *)self getMaximumFractionDigits]);
    double v6 = JavaLangMath_powWithDouble_withDouble_(10.0, (double)v5);
    unsigned int v7 = *(JavaTextDecimalFormatSymbols **)((char *)&self->symbols_ + 4);
    if (!v7) {
      JreThrowNullPointerException();
    }
    double v8 = 1.0 / v6;
    [v7 setRoundingModeWithJavaMathRoundingModeEnum:a3 withDouble:v8];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDecimalFormat;
  [(JavaTextDecimalFormat *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = new_JavaLangDouble_initWithDouble_(-0.0);
    JreStrongAssignAndConsume((id *)&qword_100562738, v2);
    atomic_store(1u, JavaTextDecimalFormat__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004760D0;
}

@end
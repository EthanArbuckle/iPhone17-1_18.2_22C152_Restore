@interface LibcoreIcuNativeDecimalFormat
+ (const)__metadata;
+ (id)cloneImplWithId:(id)a3;
+ (id)formatDoubleWithId:(id)a3 withDouble:(double)a4 withLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a5;
+ (id)formatLongWithId:(id)a3 withLong:(int64_t)a4 withLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a5;
+ (id)openWithNSString:(id)a3 withNSString:(id)a4 withChar:(unsigned __int16)a5 withChar:(unsigned __int16)a6 withNSString:(id)a7 withChar:(unsigned __int16)a8 withNSString:(id)a9 withNSString:(id)a10 withChar:(unsigned __int16)a11 withChar:(unsigned __int16)a12 withNSString:(id)a13 withChar:(unsigned __int16)a14 withChar:(unsigned __int16)a15 withChar:(unsigned __int16)a16 withChar:(unsigned __int16)a17;
+ (id)parseWithId:(id)a3 withNSString:(id)a4 withJavaTextParsePosition:(id)a5 withBoolean:(BOOL)a6;
+ (id)toPatternImplWithId:(id)a3 withBoolean:(BOOL)a4;
+ (void)applyPatternImplWithId:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5;
+ (void)applyPatternWithId:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5;
+ (void)setDecimalFormatSymbolsWithId:(id)a3 withNSString:(id)a4 withChar:(unsigned __int16)a5 withChar:(unsigned __int16)a6 withNSString:(id)a7 withChar:(unsigned __int16)a8 withNSString:(id)a9 withNSString:(id)a10 withChar:(unsigned __int16)a11 withChar:(unsigned __int16)a12 withNSString:(id)a13 withChar:(unsigned __int16)a14 withChar:(unsigned __int16)a15 withChar:(unsigned __int16)a16 withChar:(unsigned __int16)a17;
- (BOOL)isDecimalSeparatorAlwaysShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupingUsed;
- (BOOL)isParseBigDecimal;
- (BOOL)isParseIntegerOnly;
- (LibcoreIcuNativeDecimalFormat)initWithNSString:(id)a3 withJavaTextDecimalFormatSymbols:(id)a4;
- (LibcoreIcuNativeDecimalFormat)initWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatBigDecimalWithJavaMathBigDecimal:(id)a3 withJavaTextFieldPosition:(id)a4;
- (id)formatBigIntegerWithJavaMathBigInteger:(id)a3 withJavaTextFieldPosition:(id)a4;
- (id)formatDoubleWithDouble:(double)a3 withJavaTextFieldPosition:(id)a4;
- (id)formatLongWithLong:(int64_t)a3 withJavaTextFieldPosition:(id)a4;
- (id)formatToCharacterIteratorWithId:(id)a3;
- (id)getNegativePrefix;
- (id)getNegativeSuffix;
- (id)getPositivePrefix;
- (id)getPositiveSuffix;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)toLocalizedPattern;
- (id)toPattern;
- (int)getGroupingSize;
- (int)getMaximumFractionDigits;
- (int)getMaximumIntegerDigits;
- (int)getMinimumFractionDigits;
- (int)getMinimumIntegerDigits;
- (int)getMultiplier;
- (void)applyLocalizedPatternWithNSString:(id)a3;
- (void)applyPatternWithNSString:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setCurrencyWithJavaUtilCurrency:(id)a3;
- (void)setDecimalFormatSymbolsWithJavaTextDecimalFormatSymbols:(id)a3;
- (void)setDecimalFormatSymbolsWithLibcoreIcuLocaleData:(id)a3;
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
- (void)setRoundingModeWithJavaMathRoundingModeEnum:(id)a3 withDouble:(double)a4;
@end

@implementation LibcoreIcuNativeDecimalFormat

- (LibcoreIcuNativeDecimalFormat)initWithNSString:(id)a3 withJavaTextDecimalFormatSymbols:(id)a4
{
  return self;
}

- (LibcoreIcuNativeDecimalFormat)initWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4
{
  return self;
}

- (void)close
{
  objc_sync_enter(self);
  if (self->nsFormatter_) {
    JreStrongAssign(&self->nsFormatter_, 0);
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  [(LibcoreIcuNativeDecimalFormat *)self close];

  v3.receiver = self;
  v3.super_class = (Class)LibcoreIcuNativeDecimalFormat;
  [(LibcoreIcuNativeDecimalFormat *)&v3 dealloc];
}

- (id)clone
{
  v5.receiver = self;
  v5.super_class = (Class)LibcoreIcuNativeDecimalFormat;
  objc_super v3 = [(LibcoreIcuNativeDecimalFormat *)&v5 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign(v3 + 1, [self->nsFormatter_ copyWithZone:0]);
  JreStrongAssign(v3 + 2, self->lastPattern_);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_25;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_28;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if ((id)*((void *)a3 + 1) == self->nsFormatter_)
  {
LABEL_24:
    LOBYTE(v6) = 1;
    return v6;
  }
  id v5 = [a3 toPattern];
  if (!v5) {
    goto LABEL_28;
  }
  unsigned int v6 = objc_msgSend(v5, "isEqual:", -[LibcoreIcuNativeDecimalFormat toPattern](self, "toPattern"));
  if (!v6) {
    return v6;
  }
  unsigned int v7 = [a3 isDecimalSeparatorAlwaysShown];
  if (v7 != [(LibcoreIcuNativeDecimalFormat *)self isDecimalSeparatorAlwaysShown]
    || (unsigned int v8 = [a3 getGroupingSize],
        v8 != [(LibcoreIcuNativeDecimalFormat *)self getGroupingSize])
    || (unsigned int v9 = [a3 getMultiplier],
        v9 != [(LibcoreIcuNativeDecimalFormat *)self getMultiplier]))
  {
LABEL_25:
    LOBYTE(v6) = 0;
    return v6;
  }
  id v10 = [a3 getNegativePrefix];
  if (!v10) {
    goto LABEL_28;
  }
  unsigned int v6 = objc_msgSend(v10, "isEqual:", -[LibcoreIcuNativeDecimalFormat getNegativePrefix](self, "getNegativePrefix"));
  if (!v6) {
    return v6;
  }
  id v11 = [a3 getNegativeSuffix];
  if (!v11) {
    goto LABEL_28;
  }
  unsigned int v6 = objc_msgSend(v11, "isEqual:", -[LibcoreIcuNativeDecimalFormat getNegativeSuffix](self, "getNegativeSuffix"));
  if (!v6) {
    return v6;
  }
  id v12 = [a3 getPositivePrefix];
  if (!v12) {
    goto LABEL_28;
  }
  unsigned int v6 = objc_msgSend(v12, "isEqual:", -[LibcoreIcuNativeDecimalFormat getPositivePrefix](self, "getPositivePrefix"));
  if (!v6) {
    return v6;
  }
  id v13 = [a3 getPositiveSuffix];
  if (!v13) {
LABEL_28:
  }
    JreThrowNullPointerException();
  unsigned int v6 = objc_msgSend(v13, "isEqual:", -[LibcoreIcuNativeDecimalFormat getPositiveSuffix](self, "getPositiveSuffix"));
  if (!v6) {
    return v6;
  }
  unsigned int v14 = [a3 getMaximumIntegerDigits];
  if (v14 != [(LibcoreIcuNativeDecimalFormat *)self getMaximumIntegerDigits]) {
    goto LABEL_25;
  }
  unsigned int v15 = [a3 getMaximumFractionDigits];
  if (v15 != [(LibcoreIcuNativeDecimalFormat *)self getMaximumFractionDigits]) {
    goto LABEL_25;
  }
  unsigned int v16 = [a3 getMinimumIntegerDigits];
  if (v16 != [(LibcoreIcuNativeDecimalFormat *)self getMinimumIntegerDigits]) {
    goto LABEL_25;
  }
  unsigned int v17 = [a3 getMinimumFractionDigits];
  if (v17 != [(LibcoreIcuNativeDecimalFormat *)self getMinimumFractionDigits]) {
    goto LABEL_25;
  }
  unsigned __int8 v18 = [a3 isGroupingUsed];
  LOBYTE(v6) = v18 ^ [(LibcoreIcuNativeDecimalFormat *)self isGroupingUsed] ^ 1;
  return v6;
}

- (void)setDecimalFormatSymbolsWithJavaTextDecimalFormatSymbols:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id nsFormatter = self->nsFormatter_;
  id v16 = [a3 getCurrencySymbol];
  __int16 v15 = (unsigned __int16)[a3 getDecimalSeparator];
  [a3 getDigit];
  id v4 = [a3 getExponentSeparator];
  __int16 v5 = (unsigned __int16)[a3 getGroupingSeparator];
  id v6 = [a3 getInfinity];
  id v7 = [a3 getInternationalCurrencySymbol];
  __int16 v8 = (unsigned __int16)[a3 getMinusSign];
  unsigned __int16 v9 = (unsigned __int16)[a3 getMonetaryDecimalSeparator];
  id v10 = [a3 getNaN];
  [a3 getPatternSeparator];
  unsigned __int16 v11 = (unsigned __int16)[a3 getPercent];
  unsigned __int16 v12 = (unsigned __int16)[a3 getPerMill];
  WORD2(v14) = (unsigned __int16)[a3 getZeroDigit];
  WORD1(v14) = v12;
  LOWORD(v14) = v11;
  LOWORD(v13) = v9;
  sub_1001FA394(nsFormatter, (uint64_t)v16, v15, (uint64_t)v4, v5, (uint64_t)v6, (uint64_t)v7, v8, v13, (uint64_t)v10, v14);
}

- (void)setDecimalFormatSymbolsWithLibcoreIcuLocaleData:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  WORD2(v4) = *((_WORD *)a3 + 112);
  LODWORD(v4) = *((_DWORD *)a3 + 58);
  LOWORD(v3) = *((_WORD *)a3 + 118);
  sub_1001FA394(self->nsFormatter_, *((void *)a3 + 33), *((_WORD *)a3 + 113), *((void *)a3 + 30), *((_WORD *)a3 + 114), *((void *)a3 + 31), *((void *)a3 + 34), *((_WORD *)a3 + 119), v3, *((void *)a3 + 32), v4);
}

- (id)formatBigDecimalWithJavaMathBigDecimal:(id)a3 withJavaTextFieldPosition:(id)a4
{
  if (atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire))
  {
    if (!a3) {
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if (!a3) {
LABEL_8:
    }
      JreThrowNullPointerException();
  }
  id v5 = [a3 toPlainString];
  if (!v5) {
    goto LABEL_8;
  }
  return [v5 toCharArray];
}

- (id)formatBigIntegerWithJavaMathBigInteger:(id)a3 withJavaTextFieldPosition:(id)a4
{
  if (atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire))
  {
    if (!a3) {
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if (!a3) {
LABEL_8:
    }
      JreThrowNullPointerException();
  }
  id v5 = [a3 description];
  if (!v5) {
    goto LABEL_8;
  }
  return [v5 toCharArray];
}

- (id)formatLongWithLong:(int64_t)a3 withJavaTextFieldPosition:(id)a4
{
  if ((atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id nsFormatter = self->nsFormatter_;
  return sub_1001FA724(nsFormatter, a3);
}

- (id)formatDoubleWithDouble:(double)a3 withJavaTextFieldPosition:(id)a4
{
  if ((atomic_load_explicit(LibcoreIcuNativeDecimalFormat_FieldPositionIterator__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id nsFormatter = self->nsFormatter_;
  return sub_1001FA8A4(nsFormatter, a3);
}

- (void)applyLocalizedPatternWithNSString:(id)a3
{
  sub_1001FA9FC(self->nsFormatter_, a3);
  JreStrongAssign((id *)&self->lastPattern_, 0);
}

- (void)applyPatternWithNSString:(id)a3
{
  p_lastPattern = &self->lastPattern_;
  if (!self->lastPattern_) {
    goto LABEL_4;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
  {
LABEL_4:
    sub_1001FA9FC(self->nsFormatter_, a3);
    JreStrongAssign((id *)p_lastPattern, a3);
  }
}

- (id)formatToCharacterIteratorWithId:(id)a3
{
  if (!a3)
  {
    uint64_t v14 = new_JavaLangNullPointerException_initWithNSString_(@"object == null");
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a3 getClass];
    CFStringRef v22 = JreStrcat("$@", v15, v16, v17, v18, v19, v20, v21, @"object not a Number: ");
    uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v22);
LABEL_24:
    objc_exception_throw(v14);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  id v5 = [LibcoreIcuNativeDecimalFormat_FieldPositionIterator alloc];
  v5->pos_ = -3;
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(LibcoreIcuNativeDecimalFormat *)self formatBigIntegerWithJavaMathBigInteger:a3 withJavaTextFieldPosition:0];
LABEL_10:
      __int16 v8 = v7;
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(LibcoreIcuNativeDecimalFormat *)self formatBigDecimalWithJavaMathBigDecimal:a3 withJavaTextFieldPosition:0];
      goto LABEL_10;
    }
LABEL_21:
    JreThrowClassCastException();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [a3 doubleValue];
    id v10 = sub_1001FA8A4(self->nsFormatter_, v9);
  }
  else
  {
    id v10 = sub_1001FA724(self->nsFormatter_, (uint64_t)[a3 longLongValue]);
  }
  __int16 v8 = v10;
LABEL_16:
  unsigned __int16 v11 = new_JavaTextAttributedString_initWithNSString_(+[NSString stringWithCharacters:v8]);
  if ([(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)v6 next])
  {
    do
    {
      id v12 = [(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)v6 field];
      [(JavaTextAttributedString *)v11 addAttributeWithJavaTextAttributedCharacterIterator_Attribute:v12 withId:v12 withInt:[(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)v6 start] withInt:[(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)v6 limit]];
    }
    while ([(LibcoreIcuNativeDecimalFormat_FieldPositionIterator *)v6 next]);
  }
  return [(JavaTextAttributedString *)v11 getIterator];
}

- (id)toLocalizedPattern
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
           [self->nsFormatter_ positiveFormat],
           [self->nsFormatter_ negativeFormat]);
}

- (id)toPattern
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
           [self->nsFormatter_ positiveFormat],
           [self->nsFormatter_ negativeFormat]);
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  return sub_1001FAE60(self->nsFormatter_, a3, a4);
}

- (int)getMaximumFractionDigits
{
  return [self->nsFormatter_ maximumFractionDigits];
}

- (int)getMaximumIntegerDigits
{
  return [self->nsFormatter_ maximumIntegerDigits];
}

- (int)getMinimumFractionDigits
{
  return [self->nsFormatter_ minimumFractionDigits];
}

- (int)getMinimumIntegerDigits
{
  return [self->nsFormatter_ minimumIntegerDigits];
}

- (int)getGroupingSize
{
  return [self->nsFormatter_ groupingSize];
}

- (int)getMultiplier
{
  id v2 = [self->nsFormatter_ multiplier];
  return [v2 intValue];
}

- (id)getNegativePrefix
{
  return [self->nsFormatter_ negativePrefix];
}

- (id)getNegativeSuffix
{
  return [self->nsFormatter_ negativeSuffix];
}

- (id)getPositivePrefix
{
  return [self->nsFormatter_ positivePrefix];
}

- (id)getPositiveSuffix
{
  return [self->nsFormatter_ positivePrefix];
}

- (BOOL)isDecimalSeparatorAlwaysShown
{
  return [self->nsFormatter_ alwaysShowsDecimalSeparator];
}

- (BOOL)isParseBigDecimal
{
  return self->parseBigDecimal_;
}

- (BOOL)isParseIntegerOnly
{
  return [self->nsFormatter_ allowsFloats] ^ 1;
}

- (BOOL)isGroupingUsed
{
  return [self->nsFormatter_ usesGroupingSeparator];
}

- (void)setDecimalSeparatorAlwaysShownWithBoolean:(BOOL)a3
{
}

- (void)setCurrencyWithJavaUtilCurrency:(id)a3
{
  objc_msgSend(self->nsFormatter_, "setCurrencySymbol:", objc_msgSend(a3, "getSymbol"));
  id nsFormatter = self->nsFormatter_;
  id v6 = [a3 getCurrencyCode];
  [nsFormatter setCurrencyCode:v6];
}

- (void)setGroupingSizeWithInt:(int)a3
{
}

- (void)setGroupingUsedWithBoolean:(BOOL)a3
{
}

- (void)setMaximumFractionDigitsWithInt:(int)a3
{
}

- (void)setMaximumIntegerDigitsWithInt:(int)a3
{
}

- (void)setMinimumFractionDigitsWithInt:(int)a3
{
}

- (void)setMinimumIntegerDigitsWithInt:(int)a3
{
}

- (void)setMultiplierWithInt:(int)a3
{
  objc_msgSend(self->nsFormatter_, "setMultiplier:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  id v5 = JavaMathBigDecimal_valueOfWithLong_(a3);
  JreStrongAssign((id *)&self->multiplierBigDecimal_, v5);
}

- (void)setNegativePrefixWithNSString:(id)a3
{
  self->negPrefNull_ = a3 == 0;
  if (a3) {
    objc_msgSend(self->nsFormatter_, "setNegativePrefix:");
  }
}

- (void)setNegativeSuffixWithNSString:(id)a3
{
  self->negSuffNull_ = a3 == 0;
  if (a3) {
    objc_msgSend(self->nsFormatter_, "setNegativeSuffix:");
  }
}

- (void)setPositivePrefixWithNSString:(id)a3
{
  self->posPrefNull_ = a3 == 0;
  if (a3) {
    objc_msgSend(self->nsFormatter_, "setPositivePrefix:");
  }
}

- (void)setPositiveSuffixWithNSString:(id)a3
{
  self->posSuffNull_ = a3 == 0;
  if (a3) {
    objc_msgSend(self->nsFormatter_, "setPositiveSuffix:");
  }
}

- (void)setParseBigDecimalWithBoolean:(BOOL)a3
{
  self->parseBigDecimal_ = a3;
}

- (void)setParseIntegerOnlyWithBoolean:(BOOL)a3
{
}

+ (void)applyPatternWithId:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5
{
}

- (void)setRoundingModeWithJavaMathRoundingModeEnum:(id)a3 withDouble:(double)a4
{
  unsigned int v6 = [a3 ordinal];
  if (v6 >= 7) {
    objc_exception_throw(objc_alloc_init(JavaLangAssertionError));
  }
  id nsFormatter = self->nsFormatter_;
  [nsFormatter setRoundingMode:qword_100320388[v6]];
  __int16 v8 = +[NSNumber numberWithDouble:a4];
  [nsFormatter setRoundingIncrement:v8];
}

+ (id)openWithNSString:(id)a3 withNSString:(id)a4 withChar:(unsigned __int16)a5 withChar:(unsigned __int16)a6 withNSString:(id)a7 withChar:(unsigned __int16)a8 withNSString:(id)a9 withNSString:(id)a10 withChar:(unsigned __int16)a11 withChar:(unsigned __int16)a12 withNSString:(id)a13 withChar:(unsigned __int16)a14 withChar:(unsigned __int16)a15 withChar:(unsigned __int16)a16 withChar:(unsigned __int16)a17
{
  LOWORD(v21) = a15;
  HIWORD(v21) = a16;
  return sub_1001FB374(a3, (uint64_t)a4, a5, (uint64_t)a7, a8, (uint64_t)a9, (uint64_t)a10, a11, a12, (uint64_t)a13, v21, a17);
}

+ (void)setDecimalFormatSymbolsWithId:(id)a3 withNSString:(id)a4 withChar:(unsigned __int16)a5 withChar:(unsigned __int16)a6 withNSString:(id)a7 withChar:(unsigned __int16)a8 withNSString:(id)a9 withNSString:(id)a10 withChar:(unsigned __int16)a11 withChar:(unsigned __int16)a12 withNSString:(id)a13 withChar:(unsigned __int16)a14 withChar:(unsigned __int16)a15 withChar:(unsigned __int16)a16 withChar:(unsigned __int16)a17
{
  id v19 = a9;
  LOWORD(v21) = a15;
  WORD1(v21) = a16;
  WORD2(v21) = a17;
  LOWORD(a9) = a12;
  sub_1001FA394(a3, (uint64_t)a4, a5, (uint64_t)a7, a8, (uint64_t)v19, (uint64_t)a10, a11, (uint64_t)a9, (uint64_t)a13, v21);
}

+ (void)applyPatternImplWithId:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5
{
}

+ (id)cloneImplWithId:(id)a3
{
  return [a3 copyWithZone:0];
}

+ (id)formatDoubleWithId:(id)a3 withDouble:(double)a4 withLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a5
{
  return sub_1001FA8A4(a3, a4);
}

+ (id)formatLongWithId:(id)a3 withLong:(int64_t)a4 withLibcoreIcuNativeDecimalFormat_FieldPositionIterator:(id)a5
{
  return sub_1001FA724(a3, a4);
}

+ (id)parseWithId:(id)a3 withNSString:(id)a4 withJavaTextParsePosition:(id)a5 withBoolean:(BOOL)a6
{
  return sub_1001FAE60(a3, a4, a5);
}

+ (id)toPatternImplWithId:(id)a3 withBoolean:(BOOL)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@",
           [a3 positiveFormat],
           [a3 negativeFormat]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(LibcoreIcuNativeDecimalFormat *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043E130;
}

@end
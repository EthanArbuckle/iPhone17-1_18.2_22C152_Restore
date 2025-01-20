@interface JavaTextDecimalFormatSymbols
+ (const)__metadata;
+ (id)getInstance;
+ (id)getInstanceWithJavaUtilLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaTextDecimalFormatSymbols)init;
- (JavaTextDecimalFormatSymbols)initWithJavaUtilLocale:(id)a3;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getCurrency;
- (id)getCurrencySymbol;
- (id)getExponentSeparator;
- (id)getInfinity;
- (id)getInternationalCurrencySymbol;
- (id)getNaN;
- (unint64_t)hash;
- (unsigned)getDecimalSeparator;
- (unsigned)getDigit;
- (unsigned)getGroupingSeparator;
- (unsigned)getMinusSign;
- (unsigned)getMonetaryDecimalSeparator;
- (unsigned)getPatternSeparator;
- (unsigned)getPerMill;
- (unsigned)getPercent;
- (unsigned)getZeroDigit;
- (void)dealloc;
- (void)setCurrencySymbolWithNSString:(id)a3;
- (void)setCurrencyWithJavaUtilCurrency:(id)a3;
- (void)setDecimalSeparatorWithChar:(unsigned __int16)a3;
- (void)setDigitWithChar:(unsigned __int16)a3;
- (void)setExponentSeparatorWithNSString:(id)a3;
- (void)setGroupingSeparatorWithChar:(unsigned __int16)a3;
- (void)setInfinityWithNSString:(id)a3;
- (void)setInternationalCurrencySymbolWithNSString:(id)a3;
- (void)setMinusSignWithChar:(unsigned __int16)a3;
- (void)setMonetaryDecimalSeparatorWithChar:(unsigned __int16)a3;
- (void)setNaNWithNSString:(id)a3;
- (void)setPatternSeparatorWithChar:(unsigned __int16)a3;
- (void)setPerMillWithChar:(unsigned __int16)a3;
- (void)setPercentWithChar:(unsigned __int16)a3;
- (void)setZeroDigitWithChar:(unsigned __int16)a3;
@end

@implementation JavaTextDecimalFormatSymbols

- (JavaTextDecimalFormatSymbols)init
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaTextDecimalFormatSymbols_initWithJavaUtilLocale_((uint64_t)self, Default);
  return self;
}

- (JavaTextDecimalFormatSymbols)initWithJavaUtilLocale:(id)a3
{
  return self;
}

+ (id)getInstance
{
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDecimalFormatSymbols_getInstanceWithJavaUtilLocale_(Default);
}

+ (id)getInstanceWithJavaUtilLocale:(id)a3
{
  return JavaTextDecimalFormatSymbols_getInstanceWithJavaUtilLocale_(a3);
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDecimalFormatSymbols;
  return [(JavaTextDecimalFormatSymbols *)&v3 clone];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  currency = self->currency_;
  if (!currency) {
    goto LABEL_29;
  }
  unsigned int v6 = [(JavaUtilCurrency *)currency isEqual:*((void *)a3 + 8)];
  if (!v6) {
    return v6;
  }
  currencySymbol = self->currencySymbol_;
  if (!currencySymbol) {
    goto LABEL_29;
  }
  unsigned int v6 = [(NSString *)currencySymbol isEqual:*((void *)a3 + 6)];
  if (!v6) {
    return v6;
  }
  if (self->decimalSeparator_ != *((unsigned __int16 *)a3 + 6) || self->digit_ != *((unsigned __int16 *)a3 + 5)) {
    goto LABEL_26;
  }
  exponentSeparator = self->exponentSeparator_;
  if (!exponentSeparator) {
    goto LABEL_29;
  }
  unsigned int v6 = [(NSString *)exponentSeparator isEqual:*((void *)a3 + 10)];
  if (!v6) {
    return v6;
  }
  if (self->groupingSeparator_ != *((unsigned __int16 *)a3 + 7)) {
    goto LABEL_26;
  }
  infinity = self->infinity_;
  if (!infinity) {
    goto LABEL_29;
  }
  unsigned int v6 = [(NSString *)infinity isEqual:*((void *)a3 + 4)];
  if (!v6) {
    return v6;
  }
  intlCurrencySymbol = self->intlCurrencySymbol_;
  if (!intlCurrencySymbol) {
    goto LABEL_29;
  }
  unsigned int v6 = [(NSString *)intlCurrencySymbol isEqual:*((void *)a3 + 7)];
  if (!v6) {
    return v6;
  }
  if (self->minusSign_ != *((unsigned __int16 *)a3 + 12) || self->monetarySeparator_ != *((unsigned __int16 *)a3 + 11)) {
    goto LABEL_26;
  }
  NaN = self->NaN_;
  if (!NaN) {
LABEL_29:
  }
    JreThrowNullPointerException();
  unsigned int v6 = [(NSString *)NaN isEqual:*((void *)a3 + 5)];
  if (!v6) {
    return v6;
  }
  if (self->patternSeparator_ != *((unsigned __int16 *)a3 + 8)
    || self->perMill_ != *((unsigned __int16 *)a3 + 10)
    || self->percent_ != *((unsigned __int16 *)a3 + 9))
  {
LABEL_26:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = self->zeroDigit_ == *((unsigned __int16 *)a3 + 4);
  return v6;
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaTextDecimalFormatSymbols getClass](self, "getClass"), "getName");
  return (NSString *)JreStrcat("$$@$$$C$C$$$C$$$$$C$C$$$C$C$C$CC", @",NaN=", @",monetarySeparator=", self->perMill_, @",percent=", @",perMill=", 93, v4, v3);
}

- (id)getCurrency
{
  return self->currency_;
}

- (id)getInternationalCurrencySymbol
{
  return self->intlCurrencySymbol_;
}

- (id)getCurrencySymbol
{
  return self->currencySymbol_;
}

- (unsigned)getDecimalSeparator
{
  return self->decimalSeparator_;
}

- (unsigned)getDigit
{
  return self->digit_;
}

- (unsigned)getGroupingSeparator
{
  return self->groupingSeparator_;
}

- (id)getInfinity
{
  return self->infinity_;
}

- (unsigned)getMinusSign
{
  return self->minusSign_;
}

- (unsigned)getMonetaryDecimalSeparator
{
  return self->monetarySeparator_;
}

- (id)getNaN
{
  return self->NaN_;
}

- (unsigned)getPatternSeparator
{
  return self->patternSeparator_;
}

- (unsigned)getPercent
{
  return self->percent_;
}

- (unsigned)getPerMill
{
  return self->perMill_;
}

- (unsigned)getZeroDigit
{
  return self->zeroDigit_;
}

- (id)getExponentSeparator
{
  return self->exponentSeparator_;
}

- (unint64_t)hash
{
  exponentSeparator = self->exponentSeparator_;
  if (!exponentSeparator) {
    goto LABEL_7;
  }
  int zeroDigit = self->zeroDigit_;
  int digit = self->digit_;
  int decimalSeparator = self->decimalSeparator_;
  int groupingSeparator = self->groupingSeparator_;
  int patternSeparator = self->patternSeparator_;
  int percent = self->percent_;
  int perMill = self->perMill_;
  int monetarySeparator = self->monetarySeparator_;
  int minusSign = self->minusSign_;
  unsigned int v12 = [(NSString *)exponentSeparator hash];
  infinity = self->infinity_;
  if (!infinity) {
    goto LABEL_7;
  }
  unsigned int v14 = [(NSString *)infinity hash];
  NaN = self->NaN_;
  if (!NaN
    || (unsigned int v27 = v12,
        unsigned int v28 = v14,
        unsigned int v16 = [(NSString *)NaN hash],
        (currencySymbol = self->currencySymbol_) == 0)
    || (unsigned int v18 = [(NSString *)currencySymbol hash],
        (intlCurrencySymbol = self->intlCurrencySymbol_) == 0))
  {
LABEL_7:
    JreThrowNullPointerException();
  }
  int v20 = decimalSeparator - (digit - zeroDigit + 32 * zeroDigit) + 32 * (digit - zeroDigit + 32 * zeroDigit);
  int v21 = patternSeparator - (groupingSeparator - v20 + 32 * v20) + 32 * (groupingSeparator - v20 + 32 * v20);
  int v22 = perMill - (percent - v21 + 32 * v21) + 32 * (percent - v21 + 32 * v21);
  int v23 = minusSign - (monetarySeparator - v22 + 32 * v22) + 32 * (monetarySeparator - v22 + 32 * v22);
  int v24 = v28 - (v27 - v23 + 32 * v23) + 32 * (v27 - v23 + 32 * v23);
  int v25 = v18 - (v16 - v24 + 32 * v24) + 32 * (v16 - v24 + 32 * v24);
  return (int)([(NSString *)intlCurrencySymbol hash] - v25 + 32 * v25 - 141423023);
}

- (void)setCurrencyWithJavaUtilCurrency:(id)a3
{
  if (!a3)
  {
    v8 = new_JavaLangNullPointerException_initWithNSString_(@"currency == null");
    objc_exception_throw(v8);
  }
  currency = self->currency_;
  p_currency = &self->currency_;
  if (currency != a3)
  {
    JreStrongAssign((id *)p_currency, a3);
    JreStrongAssign((id *)&self->intlCurrencySymbol_, [a3 getCurrencyCode]);
    id v7 = [a3 getSymbolWithJavaUtilLocale:self->locale_];
    JreStrongAssign((id *)&self->currencySymbol_, v7);
  }
}

- (void)setInternationalCurrencySymbolWithNSString:(id)a3
{
  if (a3)
  {
    if ([a3 isEqual:self->intlCurrencySymbol_]) {
      return;
    }
    InstanceWithNSString = JavaUtilCurrency_getInstanceWithNSString_(a3);
    JreStrongAssign((id *)&self->currency_, InstanceWithNSString);
    currency = self->currency_;
    if (!currency) {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)&self->currencySymbol_, [(JavaUtilCurrency *)currency getSymbolWithJavaUtilLocale:self->locale_]);
    p_intlCurrencySymbol = &self->intlCurrencySymbol_;
    id v6 = a3;
  }
  else
  {
    JreStrongAssign((id *)&self->currency_, 0);
    p_intlCurrencySymbol = &self->intlCurrencySymbol_;
    id v6 = 0;
  }
  JreStrongAssign((id *)p_intlCurrencySymbol, v6);
}

- (void)setCurrencySymbolWithNSString:(id)a3
{
}

- (void)setDecimalSeparatorWithChar:(unsigned __int16)a3
{
  self->decimalSeparator_ = a3;
}

- (void)setDigitWithChar:(unsigned __int16)a3
{
  self->digit_ = a3;
}

- (void)setGroupingSeparatorWithChar:(unsigned __int16)a3
{
  self->groupingSeparator_ = a3;
}

- (void)setInfinityWithNSString:(id)a3
{
}

- (void)setMinusSignWithChar:(unsigned __int16)a3
{
  self->minusSign_ = a3;
}

- (void)setMonetaryDecimalSeparatorWithChar:(unsigned __int16)a3
{
  self->monetarySeparator_ = a3;
}

- (void)setNaNWithNSString:(id)a3
{
}

- (void)setPatternSeparatorWithChar:(unsigned __int16)a3
{
  self->patternSeparator_ = a3;
}

- (void)setPercentWithChar:(unsigned __int16)a3
{
  self->percent_ = a3;
}

- (void)setPerMillWithChar:(unsigned __int16)a3
{
  self->perMill_ = a3;
}

- (void)setZeroDigitWithChar:(unsigned __int16)a3
{
  self->zeroDigit_ = a3;
}

- (void)setExponentSeparatorWithNSString:(id)a3
{
  if (!a3)
  {
    v5 = new_JavaLangNullPointerException_initWithNSString_(@"value == null");
    objc_exception_throw(v5);
  }
  p_exponentSeparator = &self->exponentSeparator_;
  JreStrongAssign((id *)p_exponentSeparator, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDecimalFormatSymbols;
  [(JavaTextDecimalFormatSymbols *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaTextDecimalFormatSymbols *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100402EA0;
}

@end
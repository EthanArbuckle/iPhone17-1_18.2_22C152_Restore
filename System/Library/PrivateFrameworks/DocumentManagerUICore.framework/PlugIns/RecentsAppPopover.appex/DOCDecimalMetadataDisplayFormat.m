@interface DOCDecimalMetadataDisplayFormat
- (BOOL)prefersIntegerFractionalDisplay;
- (DOCDecimalMetadataDisplayFormat)init;
- (NSString)decimalFormatString;
- (id)_decimalDefaultFormattedDoubleValue:(double)a3;
- (id)_decimalDisplayStringByFormattingDoubleValue:(double)a3;
- (id)_decimalLengthFormattedDoubleValue:(double)a3;
- (id)_integerFractionalDisplayStringByFormattingDoubleValue:(double)a3;
- (id)displayStringForMetadataNumberValue:(id)a3;
- (id)displayStringForMetadataStringValue:(id)a3;
- (id)displayStringForMetadataValue:(id)a3;
- (int64_t)lengthUnits;
- (int64_t)maxFractionalDigits;
- (void)_configureNumberFormatter:(id)a3;
- (void)setDecimalFormatString:(id)a3;
- (void)setLengthUnits:(int64_t)a3;
- (void)setMaxFractionalDigits:(int64_t)a3;
- (void)setPrefersIntegerFractionalDisplay:(BOOL)a3;
@end

@implementation DOCDecimalMetadataDisplayFormat

- (DOCDecimalMetadataDisplayFormat)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCDecimalMetadataDisplayFormat;
  v2 = [(DOCDecimalMetadataDisplayFormat *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_prefersIntegerFractionalDisplay = 0;
    *(_OWORD *)&v2->_maxFractionalDigits = xmmword_1004D21F0;
    decimalFormatString = v2->_decimalFormatString;
    v2->_decimalFormatString = 0;
  }
  return v3;
}

- (id)displayStringForMetadataValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(DOCDecimalMetadataDisplayFormat *)self displayStringForMetadataStringValue:v4];
LABEL_6:
      objc_super v6 = (void *)v5;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(DOCDecimalMetadataDisplayFormat *)self displayStringForMetadataNumberValue:v4];
      goto LABEL_6;
    }
  }
  objc_super v6 = 0;
LABEL_8:

  return v6;
}

- (id)displayStringForMetadataStringValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 componentsSeparatedByString:@"/"];
  id v6 = [v5 count];
  if (v6 == (id)2)
  {
    v7 = [v5 objectAtIndexedSubscript:0];
    v8 = +[NSDecimalNumber decimalNumberWithString:v7];

    v9 = [v5 objectAtIndexedSubscript:1];
    v10 = +[NSDecimalNumber decimalNumberWithString:v9];

    v11 = +[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:0 scale:0x7FFFLL raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    v12 = [v8 decimalNumberByDividingBy:v10 withBehavior:v11];
  }
  else
  {
    v12 = +[NSDecimalNumber decimalNumberWithString:v4];
  }
  v13 = +[NSDecimalNumber notANumber];
  unsigned __int8 v14 = [v12 isEqual:v13];

  double v15 = 0.0;
  if ((v14 & 1) == 0)
  {
    [v12 doubleValue];
    double v15 = v16;
  }

  if (v6 == (id)2) {
    unsigned __int8 v17 = v14;
  }
  else {
    unsigned __int8 v17 = 0;
  }
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    if (v6 != (id)2)
    {
      [v4 doubleValue];
      double v15 = v19;
    }
    v20 = +[NSNumber numberWithDouble:v15];
    v18 = [(DOCDecimalMetadataDisplayFormat *)self displayStringForMetadataNumberValue:v20];
  }
  return v18;
}

- (id)displayStringForMetadataNumberValue:(id)a3
{
  [a3 doubleValue];
  double v5 = v4;
  if ([(DOCDecimalMetadataDisplayFormat *)self prefersIntegerFractionalDisplay])
  {
    id v6 = [(DOCDecimalMetadataDisplayFormat *)self _integerFractionalDisplayStringByFormattingDoubleValue:v5];
  }
  else
  {
    id v6 = 0;
  }
  if (![v6 length])
  {
    uint64_t v7 = [(DOCDecimalMetadataDisplayFormat *)self _decimalDisplayStringByFormattingDoubleValue:v5];

    id v6 = (void *)v7;
  }
  return v6;
}

- (id)_integerFractionalDisplayStringByFormattingDoubleValue:(double)a3
{
  BOOL v4 = a3 > 0.0 && a3 < 1.0;
  if (v4 && (LODWORD(v3) = vcvtad_u64_f64(1.0 / a3), vabdd_f64(a3, 1.0 / (double)v3) < 0.001))
  {
    double v5 = objc_opt_new();
    [v5 setNumberStyle:1];
    [v5 setMaximumFractionDigits:0];
    id v6 = +[NSNumber numberWithUnsignedInt:v3];
    uint64_t v7 = +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:1];
    v8 = +[NSString stringWithFormat:@"1/%@", v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_decimalDisplayStringByFormattingDoubleValue:(double)a3
{
  if ([(DOCDecimalMetadataDisplayFormat *)self lengthUnits]) {
    [(DOCDecimalMetadataDisplayFormat *)self _decimalLengthFormattedDoubleValue:a3];
  }
  else {
  double v5 = [(DOCDecimalMetadataDisplayFormat *)self _decimalDefaultFormattedDoubleValue:a3];
  }
  id v6 = [(DOCDecimalMetadataDisplayFormat *)self decimalFormatString];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = [(DOCDecimalMetadataDisplayFormat *)self decimalFormatString];
    uint64_t v9 = +[NSString localizedStringWithValidatedFormat:v8, @"%@", 0, v5 validFormatSpecifiers error];

    double v5 = (void *)v9;
  }
  return v5;
}

- (id)_decimalLengthFormattedDoubleValue:(double)a3
{
  double v5 = objc_opt_new();
  id v6 = [v5 numberFormatter];
  [(DOCDecimalMetadataDisplayFormat *)self _configureNumberFormatter:v6];

  id v7 = objc_msgSend(v5, "stringFromValue:unit:", -[DOCDecimalMetadataDisplayFormat lengthUnits](self, "lengthUnits"), a3);

  return v7;
}

- (id)_decimalDefaultFormattedDoubleValue:(double)a3
{
  double v5 = objc_opt_new();
  [(DOCDecimalMetadataDisplayFormat *)self _configureNumberFormatter:v5];
  id v6 = +[NSNumber numberWithDouble:a3];
  id v7 = [v5 stringFromNumber:v6];

  return v7;
}

- (void)_configureNumberFormatter:(id)a3
{
  id v4 = a3;
  [v4 setNumberStyle:1];
  objc_msgSend(v4, "setMaximumFractionDigits:", -[DOCDecimalMetadataDisplayFormat maxFractionalDigits](self, "maxFractionalDigits"));
}

- (BOOL)prefersIntegerFractionalDisplay
{
  return self->_prefersIntegerFractionalDisplay;
}

- (void)setPrefersIntegerFractionalDisplay:(BOOL)a3
{
  self->_prefersIntegerFractionalDisplay = a3;
}

- (int64_t)maxFractionalDigits
{
  return self->_maxFractionalDigits;
}

- (void)setMaxFractionalDigits:(int64_t)a3
{
  self->_maxFractionalDigits = a3;
}

- (int64_t)lengthUnits
{
  return self->_lengthUnits;
}

- (void)setLengthUnits:(int64_t)a3
{
  self->_lengthUnits = a3;
}

- (NSString)decimalFormatString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDecimalFormatString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
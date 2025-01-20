@interface _NBPhoneNumber
- (BOOL)isEqual:(id)a3;
- (BOOL)italianLeadingZero;
- (NSNumber)countryCode;
- (NSNumber)countryCodeSource;
- (NSNumber)nationalNumber;
- (NSNumber)numberOfLeadingZeros;
- (NSString)extension;
- (NSString)preferredDomesticCarrierCode;
- (NSString)rawInput;
- (_NBPhoneNumber)init;
- (_NBPhoneNumber)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)getCountryCodeSourceOrDefault;
- (unint64_t)hash;
- (void)clearCountryCodeSource;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCountryCodeSource:(id)a3;
- (void)setExtension:(id)a3;
- (void)setItalianLeadingZero:(BOOL)a3;
- (void)setNationalNumber:(id)a3;
- (void)setNumberOfLeadingZeros:(id)a3;
- (void)setPreferredDomesticCarrierCode:(id)a3;
- (void)setRawInput:(id)a3;
@end

@implementation _NBPhoneNumber

- (_NBPhoneNumber)init
{
  v5.receiver = self;
  v5.super_class = (Class)_NBPhoneNumber;
  v2 = [(_NBPhoneNumber *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_NBPhoneNumber *)v2 setNationalNumber:&unk_26C628D68];
    [(_NBPhoneNumber *)v3 setCountryCode:&unk_26C628D68];
    [(_NBPhoneNumber *)v3 setNumberOfLeadingZeros:&unk_26C628D80];
  }
  return v3;
}

- (void)clearCountryCodeSource
{
}

- (int64_t)getCountryCodeSourceOrDefault
{
  v3 = [(_NBPhoneNumber *)self countryCodeSource];

  if (!v3) {
    return 1;
  }
  v4 = [(_NBPhoneNumber *)self countryCodeSource];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(_NBPhoneNumber *)self countryCode];
  unint64_t v4 = [v3 hash];

  int64_t v5 = [(_NBPhoneNumber *)self nationalNumber];
  unint64_t v6 = ((v4 << 6) + (v4 >> 2) + [v5 hash] + 2654435769) ^ v4;

  v7 = [(_NBPhoneNumber *)self numberOfLeadingZeros];
  unint64_t v8 = ((v6 << 6) + (v6 >> 2) + [v7 hash] + 2654435769) ^ v6;

  v9 = [(_NBPhoneNumber *)self extension];
  unint64_t v10 = ([v9 hash] + (v8 << 6) + (v8 >> 2) + 2654435769u) ^ v8;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_NBPhoneNumber *)self countryCode];
    v7 = [v5 countryCode];
    if (![v6 isEqualToNumber:v7])
    {
      char v11 = 0;
LABEL_19:

      goto LABEL_20;
    }
    unint64_t v8 = [(_NBPhoneNumber *)self nationalNumber];
    v9 = [v5 nationalNumber];
    if (![v8 isEqualToNumber:v9]
      || (int v10 = [(_NBPhoneNumber *)self italianLeadingZero],
          v10 != [v5 italianLeadingZero]))
    {
      char v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v12 = [(_NBPhoneNumber *)self numberOfLeadingZeros];
    v13 = [v5 numberOfLeadingZeros];
    if (![v12 isEqualToNumber:v13])
    {
      char v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v14 = [(_NBPhoneNumber *)self extension];
    if (v14 || ([v5 extension], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(_NBPhoneNumber *)self extension];
      v15 = v20 = v12;
      [v5 extension];
      v16 = v19 = v13;
      char v11 = [v15 isEqualToString:v16];

      v13 = v19;
      v12 = v20;
      if (v14)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v18 = 0;
      char v11 = 1;
    }
    v14 = (void *)v18;
    goto LABEL_16;
  }
  char v11 = 0;
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_NBPhoneNumber allocWithZone:a3] init];
  id v5 = [(_NBPhoneNumber *)self countryCode];
  unint64_t v6 = (void *)[v5 copy];
  [(_NBPhoneNumber *)v4 setCountryCode:v6];

  v7 = [(_NBPhoneNumber *)self nationalNumber];
  unint64_t v8 = (void *)[v7 copy];
  [(_NBPhoneNumber *)v4 setNationalNumber:v8];

  v9 = [(_NBPhoneNumber *)self extension];
  int v10 = (void *)[v9 copy];
  [(_NBPhoneNumber *)v4 setExtension:v10];

  [(_NBPhoneNumber *)v4 setItalianLeadingZero:[(_NBPhoneNumber *)self italianLeadingZero]];
  char v11 = [(_NBPhoneNumber *)self numberOfLeadingZeros];
  v12 = (void *)[v11 copy];
  [(_NBPhoneNumber *)v4 setNumberOfLeadingZeros:v12];

  v13 = [(_NBPhoneNumber *)self rawInput];
  v14 = (void *)[v13 copy];
  [(_NBPhoneNumber *)v4 setRawInput:v14];

  v15 = [(_NBPhoneNumber *)self countryCodeSource];
  v16 = (void *)[v15 copy];
  [(_NBPhoneNumber *)v4 setCountryCodeSource:v16];

  v17 = [(_NBPhoneNumber *)self preferredDomesticCarrierCode];
  uint64_t v18 = (void *)[v17 copy];
  [(_NBPhoneNumber *)v4 setPreferredDomesticCarrierCode:v18];

  return v4;
}

- (_NBPhoneNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_NBPhoneNumber;
  id v5 = [(_NBPhoneNumber *)&v15 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectForKey:@"countryCode"];
    [(_NBPhoneNumber *)v5 setCountryCode:v6];

    v7 = [v4 decodeObjectForKey:@"nationalNumber"];
    [(_NBPhoneNumber *)v5 setNationalNumber:v7];

    unint64_t v8 = [v4 decodeObjectForKey:@"extension"];
    [(_NBPhoneNumber *)v5 setExtension:v8];

    v9 = [v4 decodeObjectForKey:@"italianLeadingZero"];
    -[_NBPhoneNumber setItalianLeadingZero:](v5, "setItalianLeadingZero:", [v9 BOOLValue]);

    int v10 = [v4 decodeObjectForKey:@"numberOfLeadingZeros"];
    [(_NBPhoneNumber *)v5 setNumberOfLeadingZeros:v10];

    char v11 = [v4 decodeObjectForKey:@"rawInput"];
    [(_NBPhoneNumber *)v5 setRawInput:v11];

    v12 = [v4 decodeObjectForKey:@"countryCodeSource"];
    [(_NBPhoneNumber *)v5 setCountryCodeSource:v12];

    v13 = [v4 decodeObjectForKey:@"preferredDomesticCarrierCode"];
    [(_NBPhoneNumber *)v5 setPreferredDomesticCarrierCode:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumber *)self countryCode];
  [v4 encodeObject:v5 forKey:@"countryCode"];

  unint64_t v6 = [(_NBPhoneNumber *)self nationalNumber];
  [v4 encodeObject:v6 forKey:@"nationalNumber"];

  v7 = [(_NBPhoneNumber *)self extension];
  [v4 encodeObject:v7 forKey:@"extension"];

  unint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_NBPhoneNumber italianLeadingZero](self, "italianLeadingZero"));
  [v4 encodeObject:v8 forKey:@"italianLeadingZero"];

  v9 = [(_NBPhoneNumber *)self numberOfLeadingZeros];
  [v4 encodeObject:v9 forKey:@"numberOfLeadingZeros"];

  int v10 = [(_NBPhoneNumber *)self rawInput];
  [v4 encodeObject:v10 forKey:@"rawInput"];

  char v11 = [(_NBPhoneNumber *)self countryCodeSource];
  [v4 encodeObject:v11 forKey:@"countryCodeSource"];

  id v12 = [(_NBPhoneNumber *)self preferredDomesticCarrierCode];
  [v4 encodeObject:v12 forKey:@"preferredDomesticCarrierCode"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(_NBPhoneNumber *)self countryCode];
  id v5 = [(_NBPhoneNumber *)self nationalNumber];
  unint64_t v6 = [(_NBPhoneNumber *)self extension];
  if ([(_NBPhoneNumber *)self italianLeadingZero]) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  unint64_t v8 = [(_NBPhoneNumber *)self numberOfLeadingZeros];
  v9 = [(_NBPhoneNumber *)self rawInput];
  int v10 = [(_NBPhoneNumber *)self countryCodeSource];
  char v11 = [(_NBPhoneNumber *)self preferredDomesticCarrierCode];
  id v12 = [v3 stringWithFormat:@" - countryCode[%@], nationalNumber[%@], extension[%@], italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] countryCodeSource[%@] preferredDomesticCarrierCode[%@]", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSNumber)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSNumber)nationalNumber
{
  return self->_nationalNumber;
}

- (void)setNationalNumber:(id)a3
{
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (BOOL)italianLeadingZero
{
  return self->_italianLeadingZero;
}

- (void)setItalianLeadingZero:(BOOL)a3
{
  self->_italianLeadingZero = a3;
}

- (NSNumber)numberOfLeadingZeros
{
  return self->_numberOfLeadingZeros;
}

- (void)setNumberOfLeadingZeros:(id)a3
{
}

- (NSString)rawInput
{
  return self->_rawInput;
}

- (void)setRawInput:(id)a3
{
}

- (NSNumber)countryCodeSource
{
  return self->_countryCodeSource;
}

- (void)setCountryCodeSource:(id)a3
{
}

- (NSString)preferredDomesticCarrierCode
{
  return self->_preferredDomesticCarrierCode;
}

- (void)setPreferredDomesticCarrierCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDomesticCarrierCode, 0);
  objc_storeStrong((id *)&self->_countryCodeSource, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_numberOfLeadingZeros, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_nationalNumber, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
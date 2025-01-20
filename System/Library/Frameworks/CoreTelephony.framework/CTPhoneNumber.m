@interface CTPhoneNumber
+ (BOOL)isValidPhoneNumber:(id)a3;
+ (BOOL)isValidPhoneNumberChar:(unsigned __int16)a3;
+ (CTPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4;
+ (CTPhoneNumber)phoneNumberWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5;
- (BOOL)isShortCode;
- (CTPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4;
- (CTPhoneNumber)initWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5;
- (NSString)countryCode;
- (NSString)digits;
- (id)canonicalFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedString;
- (id)formatForCallingCountry:(id)a3;
- (int64_t)numberOfDigitsForShortCodeNumber;
- (int64_t)numberOfDigitsForShortCodeNumber:(int64_t)a3;
- (void)setIsShortCode:(BOOL)a3;
@end

@implementation CTPhoneNumber

+ (CTPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDigits:1 digits:v7 countryCode:v6];

  return (CTPhoneNumber *)v8;
}

+ (CTPhoneNumber)phoneNumberWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithDigits:a3 digits:v9 countryCode:v8];

  return (CTPhoneNumber *)v10;
}

- (int64_t)numberOfDigitsForShortCodeNumber
{
  return [(CTPhoneNumber *)self numberOfDigitsForShortCodeNumber:1];
}

- (int64_t)numberOfDigitsForShortCodeNumber:(int64_t)a3
{
  v4 = [[CoreTelephonyClient alloc] initWithQueue:0];
  v5 = [[CTBundle alloc] initWithBundleType:1];
  id v6 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:a3];
  uint64_t v12 = 0;
  id v7 = [(CoreTelephonyClient *)v4 copyCarrierBundleValue:v6 keyHierarchy:&unk_1ED01DF98 bundleType:v5 error:&v12];
  id v8 = v7;
  if (v7) {
    BOOL v9 = v12 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    int64_t v10 = [v7 integerValue];
  }
  else {
    int64_t v10 = 6;
  }

  return v10;
}

- (CTPhoneNumber)initWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CTPhoneNumber;
  int64_t v10 = [(CTPhoneNumber *)&v25 init];
  if (v10)
  {
    unint64_t v11 = [v8 length];
    uint64_t v12 = malloc_type_malloc(2 * v11 + 2, 0x1000040BDFB0063uLL);
    if (v11)
    {
      uint64_t v13 = 0;
      unsigned int v14 = 0;
      unsigned int v15 = 1;
      do
      {
        uint64_t v16 = [v8 characterAtIndex:v13];
        if (+[CTPhoneNumber isValidPhoneNumberChar:v16]) {
          v12[v14++] = v16;
        }
        uint64_t v13 = v15;
      }
      while (v11 > v15++);
    }
    else
    {
      unsigned int v14 = 0;
    }
    v12[v14] = 0;
    uint64_t v18 = [[NSString alloc] initWithCharacters:v12 length:v14];
    digits = v10->_digits;
    v10->_digits = (NSString *)v18;

    free(v12);
    uint64_t v20 = [v9 copy];
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v20;

    uint64_t v22 = [(CTPhoneNumber *)v10 numberOfDigitsForShortCodeNumber:a3];
    BOOL v23 = v22 >= 1 && [v8 length] <= v22;
    v10->_isShortCode = v23;
    v10->_slot = a3;
  }

  return v10;
}

- (CTPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4
{
  return [(CTPhoneNumber *)self initWithDigits:1 digits:a3 countryCode:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CTPhoneNumber allocWithZone:a3] initWithDigits:self->_slot digits:self->_digits countryCode:self->_countryCode];
  [(CTPhoneNumber *)v4 setIsShortCode:self->_isShortCode];
  return v4;
}

- (id)formatForCallingCountry:(id)a3
{
  if ([(NSString *)self->_countryCode compare:a3])
  {
    v4 = self->_digits;
  }
  else
  {
    v4 = [(CTPhoneNumber *)self canonicalFormat];
  }

  return v4;
}

- (id)canonicalFormat
{
  return self->_digits;
}

- (id)encodedString
{
  BOOL isShortCode = self->_isShortCode;
  v3 = [(CTPhoneNumber *)self canonicalFormat];
  v4 = v3;
  if (!isShortCode)
  {
    uint64_t v5 = [v3 stringByAppendingString:@"/TYPE=PLMN"];

    v4 = (void *)v5;
  }

  return v4;
}

+ (BOOL)isValidPhoneNumberChar:(unsigned __int16)a3
{
  int v3 = a3;
  if (a3 > 0x7Fu) {
    int v4 = __maskrune(a3, 0x500uLL);
  }
  else {
    int v4 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * a3 + 60) & 0x500;
  }
  return v3 == 35 || v4 != 0 || (v3 & 0xFFFE) == 42;
}

+ (BOOL)isValidPhoneNumber:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    unint64_t v5 = v4;
    if (+[CTPhoneNumber isValidPhoneNumberChar:](CTPhoneNumber, "isValidPhoneNumberChar:", [v3 characterAtIndex:0]))
    {
      uint64_t v6 = 1;
      do
      {
        unint64_t v7 = v6;
        if (v5 == v6) {
          break;
        }
        BOOL v8 = +[CTPhoneNumber isValidPhoneNumberChar:](CTPhoneNumber, "isValidPhoneNumberChar:", [v3 characterAtIndex:v6]);
        uint64_t v6 = v7 + 1;
      }
      while (v8);
      BOOL v9 = v7 >= v5;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (NSString)digits
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isShortCode
{
  return self->_isShortCode;
}

- (void)setIsShortCode:(BOOL)a3
{
  self->_BOOL isShortCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_digits, 0);
}

@end
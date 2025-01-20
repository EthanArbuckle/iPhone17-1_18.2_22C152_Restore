@interface _CNContactPhoneNumberEquivalence
+ (id)indexKeyForString:(id)a3;
- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4;
- (BOOL)isPhoneNumberEquivalent:(id)a3 strict:(BOOL *)a4;
- (BOOL)isRawStringEquivalent:(id)a3;
- (BOOL)preparePhoneNumberRepresentation;
- (_CNContactPhoneNumberEquivalence)initWithPhoneNumberString:(id)a3;
- (void)dealloc;
@end

@implementation _CNContactPhoneNumberEquivalence

- (void).cxx_destruct
{
}

- (void)dealloc
{
  decomposedRepresentation = self->_decomposedRepresentation;
  if (decomposedRepresentation) {
    free(decomposedRepresentation);
  }
  decomposedNumberDigits = self->_decomposedNumberDigits;
  if (decomposedNumberDigits) {
    free(decomposedNumberDigits);
  }
  v5.receiver = self;
  v5.super_class = (Class)_CNContactPhoneNumberEquivalence;
  [(_CNContactPhoneNumberEquivalence *)&v5 dealloc];
}

+ (id)indexKeyForString:(id)a3
{
  return (id)[MEMORY[0x1E4F5A498] lastFourDigitsForNumber:a3];
}

- (_CNContactPhoneNumberEquivalence)initWithPhoneNumberString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNContactPhoneNumberEquivalence;
  objc_super v5 = [(_CNContactPhoneNumberEquivalence *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rawString = v5->_rawString;
    v5->_rawString = (NSString *)v6;

    v5->_decomposedRepresentation = 0;
    v5->_decomposedNumberDigits = 0;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  id v6 = a3;
  if ([(_CNContactPhoneNumberEquivalence *)self isRawStringEquivalent:v6])
  {
    BOOL v7 = 1;
    *a4 = 1;
  }
  else if ([(_CNContactPhoneNumberEquivalence *)self preparePhoneNumberRepresentation])
  {
    BOOL v7 = [(_CNContactPhoneNumberEquivalence *)self isPhoneNumberEquivalent:v6 strict:a4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isRawStringEquivalent:(id)a3
{
  return [(NSString *)self->_rawString isEqualToString:a3];
}

- (BOOL)preparePhoneNumberRepresentation
{
  decomposedRepresentation = self->_decomposedRepresentation;
  if (!decomposedRepresentation)
  {
    self->_decomposedRepresentation = ($2A2B7EFAB7F70232912E632107C7A237 *)malloc_type_calloc(1uLL, 0x40uLL, 0x105004024FC7E8CuLL);
    id v4 = (void *)MEMORY[0x1E4F5A498];
    objc_super v5 = self->_rawString;
    id v6 = [v4 countryCodeForNumber:v5];
    BOOL v7 = (char *)PNCopyBestGuessNormalizedNumberForCountry();

    self->_decomposedNumberDigits = v7;
    PNDecomposeForCountry();

    decomposedRepresentation = self->_decomposedRepresentation;
  }
  return decomposedRepresentation != 0;
}

- (BOOL)isPhoneNumberEquivalent:(id)a3 strict:(BOOL *)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F5A498];
  id v6 = a3;
  BOOL v7 = [v5 countryCodeForNumber:v6];
  v8 = (void *)PNCopyBestGuessNormalizedNumberForCountry();

  PNDecomposeForCountry();
  char v9 = decomposedPhoneNumbersEqual();
  if (a4) {
    *a4 = 0;
  }
  if (v8) {
    free(v8);
  }
  return v9;
}

@end
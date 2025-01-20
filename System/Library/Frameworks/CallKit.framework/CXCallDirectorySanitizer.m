@interface CXCallDirectorySanitizer
- (CXCallDirectorySanitizer)init;
- (NSCharacterSet)nonPhoneNumbersCharacterSet;
- (NSCharacterSet)phoneNumbersCharacterSet;
- (NSCharacterSet)phoneNumbersIgnoredCharacterSet;
- (id)canonicalizedPhoneNumber:(id)a3;
@end

@implementation CXCallDirectorySanitizer

- (CXCallDirectorySanitizer)init
{
  v13.receiver = self;
  v13.super_class = (Class)CXCallDirectorySanitizer;
  v2 = [(CXCallDirectorySanitizer *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    phoneNumbersCharacterSet = v2->_phoneNumbersCharacterSet;
    v2->_phoneNumbersCharacterSet = (NSCharacterSet *)v3;

    uint64_t v5 = [(NSCharacterSet *)v2->_phoneNumbersCharacterSet invertedSet];
    nonPhoneNumbersCharacterSet = v2->_nonPhoneNumbersCharacterSet;
    v2->_nonPhoneNumbersCharacterSet = (NSCharacterSet *)v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    [v7 formUnionWithCharacterSet:v8];

    v9 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v7 formUnionWithCharacterSet:v9];

    [v7 addCharactersInString:@"+"];
    uint64_t v10 = [v7 copy];
    phoneNumbersIgnoredCharacterSet = v2->_phoneNumbersIgnoredCharacterSet;
    v2->_phoneNumbersIgnoredCharacterSet = (NSCharacterSet *)v10;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbersIgnoredCharacterSet, 0);
  objc_storeStrong((id *)&self->_nonPhoneNumbersCharacterSet, 0);

  objc_storeStrong((id *)&self->_phoneNumbersCharacterSet, 0);
}

- (id)canonicalizedPhoneNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallDirectorySanitizer *)self phoneNumbersIgnoredCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = [v6 componentsJoinedByString:&stru_1EFC26730];

  v8 = [(CXCallDirectorySanitizer *)self nonPhoneNumbersCharacterSet];
  uint64_t v9 = [v7 rangeOfCharacterFromSet:v8];

  uint64_t v10 = 0;
  if ([v7 length])
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = strtoll((const char *)[v7 UTF8String], 0, 10);
      uint64_t v10 = 0;
      if ((unint64_t)(v11 + 0x7FFFFFFFFFFFFFFFLL) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v11);
      }
    }
  }

  return v10;
}

- (NSCharacterSet)phoneNumbersIgnoredCharacterSet
{
  return self->_phoneNumbersIgnoredCharacterSet;
}

- (NSCharacterSet)nonPhoneNumbersCharacterSet
{
  return self->_nonPhoneNumbersCharacterSet;
}

- (NSCharacterSet)phoneNumbersCharacterSet
{
  return self->_phoneNumbersCharacterSet;
}

@end
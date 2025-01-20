@interface APFormatter
+ (id)asciiFormatter:(unint64_t)a3;
+ (id)asciiSet;
+ (id)formatterForBSFormatter:(int)a3 withMaxLen:(int64_t)a4;
+ (id)hexFormatter:(unint64_t)a3;
+ (id)hexSet;
+ (id)ipFormatter:(unint64_t)a3;
+ (id)ipOctetFormatter:(unint64_t)a3;
+ (id)ipv4AddressSet;
+ (id)ipv4AddressWithPrefixSet;
+ (id)ipv6AddressSet;
+ (id)maxLengthFormatter:(unint64_t)a3;
+ (id)multipleIPFormatter:(unint64_t)a3;
+ (id)multipleIpAddressesSet;
+ (id)nonZeroNumberOnly:(unint64_t)a3;
+ (id)numberOnlyFormatter:(unint64_t)a3;
+ (id)phoneNumberFormatter:(unint64_t)a3;
+ (id)phoneNumberSet;
+ (id)pogoPasswordSet;
+ (id)portRangeFormatter:(unint64_t)a3;
+ (id)portRangeSet;
+ (id)romanFormatter:(unint64_t)a3;
+ (id)romanSet;
+ (id)sharedIPFormatter;
+ (id)sharedIPv4PrefixFormatter;
+ (id)sharedIPv6Formatter;
+ (id)sharedMultipleIPFormatter;
+ (id)sharedPhoneNumberFormatter;
- (APFormatter)initWithCharacterSet:(id)a3 withMaxLength:(unint64_t)a4;
- (APFormatter)initWithMaxLength:(unint64_t)a3;
- (APFormatter)initWithStringOfValidCharacters:(id)a3 withMaxLength:(unint64_t)a4;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)isPartialStringValid:(id)maxLength newEditingString:(id *)a4 errorDescription:(id *)a5;
- (id)characterSet;
- (id)invertedCharacterSet;
- (id)stringForObjectValue:(id)a3;
- (unint64_t)maxLength;
- (void)dealloc;
- (void)setCharacterSet:(id)a3;
- (void)setInvertedCharacterSet:(id)a3;
- (void)setMaxLength:(unint64_t)a3;
@end

@implementation APFormatter

+ (id)formatterForBSFormatter:(int)a3 withMaxLen:(int64_t)a4
{
  switch(a3)
  {
    case 1:
      id result = (id)MEMORY[0x270F9A6D0](UTF8Formatter, sel_utf8Formatter_, a4);
      break;
    case 2:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_hexFormatter_, a4);
      break;
    case 3:
      id result = (id)MEMORY[0x270F9A6D0](ASCII7BitFormatter, sel_ascii7BitFormatter_, a4);
      break;
    case 4:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_numberOnlyFormatter_, a4);
      break;
    case 5:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_sharedIPFormatter, *(void *)&a3);
      break;
    case 6:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_sharedIPv6Formatter, *(void *)&a3);
      break;
    case 7:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_ipOctetFormatter_, a4);
      break;
    case 8:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_sharedIPv4PrefixFormatter, *(void *)&a3);
      break;
    case 9:
      id result = (id)MEMORY[0x270F9A6D0](MACFormatter, sel_macFormatter, *(void *)&a3);
      break;
    case 10:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_sharedPhoneNumberFormatter, *(void *)&a3);
      break;
    case 11:
      id result = (id)MEMORY[0x270F9A6D0](DomainNameFormatter, sel_domainNameFormatter_, a4);
      break;
    case 12:
      id result = (id)MEMORY[0x270F9A6D0](HostnameFormatter, sel_hostnameFormatter_, a4);
      break;
    case 13:
      id result = (id)MEMORY[0x270F9A6D0](APFormatter, sel_portRangeFormatter_, a4);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (APFormatter)initWithStringOfValidCharacters:(id)a3 withMaxLength:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], a2, (uint64_t)a3);

  return (APFormatter *)objc_msgSend_initWithCharacterSet_withMaxLength_(self, v6, v7, a4);
}

- (APFormatter)initWithCharacterSet:(id)a3 withMaxLength:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)APFormatter;
  v6 = [(APFormatter *)&v14 init];
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setCharacterSet_(v6, v7, (uint64_t)a3);
    uint64_t v11 = objc_msgSend_invertedSet(a3, v9, v10);
    objc_msgSend_setInvertedCharacterSet_(v8, v12, v11);
    v8->_maxLength = a4;
  }
  return v8;
}

- (APFormatter)initWithMaxLength:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)APFormatter;
  v4 = [(APFormatter *)&v9 init];
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setCharacterSet_(v4, v5, 0);
    objc_msgSend_setInvertedCharacterSet_(v6, v7, 0);
    v6->_maxLength = a3;
  }
  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@", a3);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5) {
    *a3 = (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@", a4, a5, a4);
  }
  return v6;
}

- (BOOL)isPartialStringValid:(id)maxLength newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v7 = maxLength;
  if (self->_maxLength)
  {
    unint64_t v9 = objc_msgSend_UTF8ByteCount(maxLength, a2, (uint64_t)maxLength);
    maxLength = self->_maxLength;
    if (v9 > (unint64_t)maxLength)
    {
      if (a4) {
        *a4 = (id)objc_msgSend_prefixStringWithByteCount_(v7, a2, (uint64_t)maxLength);
      }
      if (a5)
      {
        BOOL result = 0;
        uint64_t v11 = @"gErC";
LABEL_17:
        *a5 = v11;
        return result;
      }
      return 0;
    }
  }
  if (objc_msgSend_characterSet(self, a2, (uint64_t)maxLength))
  {
    v35 = 0;
    objc_super v14 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v12, (uint64_t)v7);
    uint64_t v16 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v15, @"\n");
    objc_msgSend_setCharactersToBeSkipped_(v14, v17, v16);
    uint64_t v20 = objc_msgSend_characterSet(self, v18, v19);
    objc_msgSend_scanCharactersFromSet_intoString_(v14, v21, v20, &v35);
    if ((objc_msgSend_isAtEnd(v14, v22, v23) & 1) == 0)
    {
      if (a4)
      {
        v34 = v35;
        if (!v35) {
          v34 = &stru_26DA6BE88;
        }
        *a4 = v34;
      }
      if (a5) {
        *a5 = @"gErE";
      }
      return 0;
    }
  }
  if (!objc_msgSend_characterSet(self, v12, v13)) {
    return 1;
  }
  v35 = 0;
  v25 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v24, (uint64_t)v7);
  uint64_t v28 = objc_msgSend_invertedCharacterSet(self, v26, v27);
  objc_msgSend_scanCharactersFromSet_intoString_(v25, v29, v28, &v35);
  uint64_t v32 = objc_msgSend_length(v35, v30, v31);
  BOOL result = v32 == 0;
  if (v32)
  {
    if (a4)
    {
      v33 = v35;
      if (!v35) {
        v33 = &stru_26DA6BE88;
      }
      *a4 = v33;
    }
    if (a5)
    {
      uint64_t v11 = @"gErE";
      goto LABEL_17;
    }
  }
  return result;
}

+ (id)romanFormatter:(unint64_t)a3
{
  BOOL v5 = [APFormatter alloc];
  uint64_t v8 = objc_msgSend_romanSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)sharedIPFormatter
{
  id result = (id)qword_2681482D8;
  if (!qword_2681482D8)
  {
    v4 = [IPv4AddressFormatter alloc];
    uint64_t v7 = objc_msgSend_ipv4AddressSet(a1, v5, v6);
    id result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 15);
    qword_2681482D8 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedIPv6Formatter
{
  id result = (id)qword_2681482E0;
  if (!qword_2681482E0)
  {
    v4 = [APFormatter alloc];
    uint64_t v7 = objc_msgSend_ipv6AddressSet(a1, v5, v6);
    id result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 39);
    qword_2681482E0 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedIPv4PrefixFormatter
{
  id result = (id)qword_2681482E8;
  if (!qword_2681482E8)
  {
    v4 = [IPv4AddressWithPrefixFormatter alloc];
    uint64_t v7 = objc_msgSend_ipv4AddressWithPrefixSet(a1, v5, v6);
    id result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 18);
    qword_2681482E8 = (uint64_t)result;
  }
  return result;
}

+ (id)ipFormatter:(unint64_t)a3
{
  BOOL v5 = [IPv4AddressFormatter alloc];
  uint64_t v8 = objc_msgSend_ipv4AddressSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)ipOctetFormatter:(unint64_t)a3
{
  BOOL v5 = [IPv4AddressOctetFormatter alloc];
  uint64_t v8 = objc_msgSend_ipv4AddressSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)sharedMultipleIPFormatter
{
  id result = (id)qword_2681482F0;
  if (!qword_2681482F0)
  {
    v4 = [APFormatter alloc];
    uint64_t v7 = objc_msgSend_multipleIpAddressesSet(a1, v5, v6);
    id result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 49);
    qword_2681482F0 = (uint64_t)result;
  }
  return result;
}

+ (id)multipleIPFormatter:(unint64_t)a3
{
  BOOL v5 = [APFormatter alloc];
  uint64_t v8 = objc_msgSend_multipleIpAddressesSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)maxLengthFormatter:(unint64_t)a3
{
  v4 = [APFormatter alloc];
  uint64_t v6 = objc_msgSend_initWithMaxLength_(v4, v5, a3);

  return v6;
}

+ (id)numberOnlyFormatter:(unint64_t)a3
{
  v4 = [APFormatter alloc];
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v5, v6);
  unint64_t v9 = objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, a3);

  return v9;
}

+ (id)nonZeroNumberOnly:(unint64_t)a3
{
  uint64_t v4 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], a2, @"123456789");
  BOOL v5 = [APFormatter alloc];
  uint64_t v7 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v6, v4, a3);

  return v7;
}

+ (id)portRangeFormatter:(unint64_t)a3
{
  uint64_t v4 = [APFormatter alloc];
  uint64_t v7 = objc_msgSend_portRangeSet(APFormatter, v5, v6);
  unint64_t v9 = objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, a3);

  return v9;
}

+ (id)sharedPhoneNumberFormatter
{
  id result = (id)qword_2681482F8;
  if (!qword_2681482F8)
  {
    uint64_t v4 = [APFormatter alloc];
    uint64_t v7 = objc_msgSend_phoneNumberSet(a1, v5, v6);
    id result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 0);
    qword_2681482F8 = (uint64_t)result;
  }
  return result;
}

+ (id)phoneNumberFormatter:(unint64_t)a3
{
  BOOL v5 = [APFormatter alloc];
  uint64_t v8 = objc_msgSend_phoneNumberSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)asciiFormatter:(unint64_t)a3
{
  BOOL v5 = [APFormatter alloc];
  uint64_t v8 = objc_msgSend_asciiSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

+ (id)hexFormatter:(unint64_t)a3
{
  BOOL v5 = [APFormatter alloc];
  uint64_t v8 = objc_msgSend_hexSet(a1, v6, v7);
  uint64_t v10 = objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);

  return v10;
}

- (void)dealloc
{
  objc_msgSend_setCharacterSet_(self, a2, 0);
  objc_msgSend_setInvertedCharacterSet_(self, v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)APFormatter;
  [(APFormatter *)&v4 dealloc];
}

- (void)setCharacterSet:(id)a3
{
  characterSet = self->_characterSet;
  if (characterSet != a3)
  {

    self->_characterSet = (NSCharacterSet *)a3;
  }
}

- (id)characterSet
{
  v2 = self->_characterSet;

  return v2;
}

- (void)setInvertedCharacterSet:(id)a3
{
  invertedCharacterSet = self->_invertedCharacterSet;
  if (invertedCharacterSet != a3)
  {

    self->_invertedCharacterSet = (NSCharacterSet *)a3;
  }
}

- (id)invertedCharacterSet
{
  v2 = self->_invertedCharacterSet;

  return v2;
}

+ (id)ipv4AddressSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @".");
  objc_msgSend_addCharactersInString_(v2, v4, @"0123456789");

  return v2;
}

+ (id)ipv4AddressWithPrefixSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"/");
  uint64_t v6 = objc_msgSend_ipv4AddressSet(APFormatter, v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);

  return v2;
}

+ (id)ipv6AddressSet
{
  id v3 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v3, v4, @":");
  objc_msgSend_addCharactersInString_(v3, v5, @"/");
  uint64_t v8 = objc_msgSend_hexSet(a1, v6, v7);
  objc_msgSend_formUnionWithCharacterSet_(v3, v9, v8);
  uint64_t v12 = objc_msgSend_ipv4AddressSet(a1, v10, v11);
  objc_msgSend_formUnionWithCharacterSet_(v3, v13, v12);

  return v3;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  uint64_t v13 = 0;
  int isPartialStringValid_newEditingString_errorDescription = objc_msgSend_isPartialStringValid_newEditingString_errorDescription_(self, a2, (uint64_t)*a3, &v13, a7, a6.location, a6.length);
  if (a4)
  {
    if (isPartialStringValid_newEditingString_errorDescription) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v13 == 0;
    }
    if (!v11)
    {
      a4->location = objc_msgSend_length(v13, v8, v9);
      a4->length = 0;
    }
  }
  return isPartialStringValid_newEditingString_errorDescription;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

+ (id)romanSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"(),-./:=?\"' ");
  objc_msgSend_addCharactersInString_(v2, v4, @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v11, v10);

  return v2;
}

+ (id)multipleIpAddressesSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"., ");
  uint64_t v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);

  return v2;
}

+ (id)phoneNumberSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"()-*#,.");
  uint64_t v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);

  return v2;
}

+ (id)asciiSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInRange_(v2, v3, 32, 95);
  objc_msgSend_addCharactersInRange_(v2, v4, 128, 127);
  uint64_t v6 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v7, v6);

  return v2;
}

+ (id)hexSet
{
  return (id)objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], a2, @"0123456789abcdefABCDEF");
}

+ (id)pogoPasswordSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInRange_(v2, v3, 32, 95);
  objc_msgSend_addCharactersInRange_(v2, v4, 128, 127);
  uint64_t v6 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v7, v6);

  return v2;
}

+ (id)portRangeSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @",-");
  uint64_t v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);

  return v2;
}

@end
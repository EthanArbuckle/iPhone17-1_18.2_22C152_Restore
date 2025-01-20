@interface MACFormatter
+ (BOOL)parseMACAddress:(const char *)a3 intoHexString:(char *)a4;
+ (id)macAddressSet;
+ (id)macFormatter;
+ (id)sharedMACFormatter;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (MACFormatter)init;
- (id)possibleSeparators;
- (id)possibleSeparatorsInvertedSet;
- (id)userPreferredSeparator;
- (void)dealloc;
- (void)removeMACAddressSeparatorsFromString:(id)a3;
- (void)setPossibleSeparators:(id)a3;
- (void)setPossibleSeparatorsInvertedSet:(id)a3;
- (void)setUserPreferredSeparator:(id)a3;
@end

@implementation MACFormatter

+ (id)sharedMACFormatter
{
  id result = (id)qword_268148308;
  if (!qword_268148308)
  {
    id result = objc_alloc_init(MACFormatter);
    qword_268148308 = (uint64_t)result;
  }
  return result;
}

+ (id)macFormatter
{
  v2 = objc_alloc_init(MACFormatter);

  return v2;
}

- (MACFormatter)init
{
  uint64_t v4 = objc_msgSend_macAddressSet(MACFormatter, a2, v2);
  v18.receiver = self;
  v18.super_class = (Class)MACFormatter;
  v6 = [(APFormatter *)&v18 initWithCharacterSet:v4 withMaxLength:17];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v5, qword_268148008);
    objc_msgSend_setPossibleSeparators_(v6, v8, v7);
    v11 = objc_msgSend_possibleSeparators(v6, v9, v10);
    uint64_t v14 = objc_msgSend_invertedSet(v11, v12, v13);
    objc_msgSend_setPossibleSeparatorsInvertedSet_(v6, v15, v14);
    objc_msgSend_setUserPreferredSeparator_(v6, v16, @":");
  }
  return v6;
}

- (void)dealloc
{
  objc_msgSend_setPossibleSeparators_(self, a2, 0);
  objc_msgSend_setPossibleSeparatorsInvertedSet_(self, v3, 0);
  objc_msgSend_setUserPreferredSeparator_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)MACFormatter;
  [(APFormatter *)&v5 dealloc];
}

+ (BOOL)parseMACAddress:(const char *)a3 intoHexString:(char *)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (!v4)
  {
    uint64_t v7 = a3;
    size_t v8 = strlen(a3);
    for (uint64_t i = 0; v8; --v8)
    {
      int v11 = *(unsigned __int8 *)v7++;
      int v10 = v11;
      unsigned int v12 = v11 - 48;
      unsigned int v13 = v11 - 97;
      int v14 = v11 - 55;
      if ((v11 - 65) >= 6) {
        int v15 = -1;
      }
      else {
        int v15 = v14;
      }
      int v16 = v10 - 87;
      if (v13 > 5) {
        int v16 = v15;
      }
      if (v12 <= 9) {
        int v16 = v12;
      }
      if (v16 >= 0) {
        uint64_t i = 16 * i + v16;
      }
    }
    *a4 = BYTE5(i);
    a4[1] = BYTE4(i);
    a4[2] = BYTE3(i);
    a4[3] = BYTE2(i);
    a4[4] = BYTE1(i);
    a4[5] = i;
  }
  return v5;
}

- (void)removeMACAddressSeparatorsFromString:(id)a3
{
  BOOL v4 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], a2, (uint64_t)a3);
  v6 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v5, qword_268148008);
  uint64_t v9 = objc_msgSend_invertedSet(v6, v7, v8);
  objc_msgSend_setScanLocation_(v4, v10, 0);
  if (objc_msgSend_scanCharactersFromSet_intoString_(v4, v11, v9, 0))
  {
    unint64_t v14 = 0;
    do
    {
      if ((objc_msgSend_isAtEnd(v4, v12, v13) & 1) == 0)
      {
        unint64_t v14 = objc_msgSend_scanLocation(v4, v15, v16);
        objc_msgSend_deleteCharactersInRange_(a3, v17, v14, 1);
      }
      BOOL v4 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v15, (uint64_t)a3);
      unint64_t v20 = objc_msgSend_length(a3, v18, v19);
      uint64_t v22 = v14;
      if (v14 > v20) {
        uint64_t v22 = objc_msgSend_length(a3, v21, v14);
      }
      objc_msgSend_setScanLocation_(v4, v21, v22);
    }
    while (objc_msgSend_scanCharactersFromSet_intoString_(v4, v23, v9, 0)
         && !objc_msgSend_isAtEnd(v4, v24, v25));
  }
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = (id)objc_msgSend_mutableCopy(*a3, a2, (uint64_t)a3, a4, a5, a6.location, a6.length, a7);
  unint64_t v14 = v12;
  unint64_t v16 = a4->location;
  NSUInteger v15 = a4->length;
  id v85 = a5;
  if (length > v15)
  {
    v24 = objc_msgSend_substringWithRange_(a5, v13, location, length - v15);
    if (objc_msgSend_length(v24, v25, v26) != 1)
    {
LABEL_11:
      BOOL v23 = 0;
      goto LABEL_12;
    }
    BOOL v23 = objc_msgSend_rangeOfString_((void *)qword_268148008, v20, (uint64_t)v24) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v17 = objc_msgSend_substringWithRange_(v12, v13, location, v16 - location);
    if (objc_msgSend_length(v17, v18, v19) != 1) {
      goto LABEL_11;
    }
    if (objc_msgSend_rangeOfString_((void *)qword_268148008, v20, (uint64_t)v17) == 0x7FFFFFFFFFFFFFFFLL
      || v20 != (const char *)1)
    {
      goto LABEL_11;
    }
    objc_msgSend_setUserPreferredSeparator_(self, v20, (uint64_t)v17);
    BOOL v23 = 1;
  }
LABEL_12:
  unint64_t maxLength = self->super._maxLength;
  if (maxLength)
  {
    if (v16 >= maxLength && v23) {
      goto LABEL_52;
    }
    if (objc_msgSend_length(*a3, v20, v21) > self->super._maxLength)
    {
      id v29 = (id)objc_msgSend_mutableCopy(*a3, v20, v21);
      objc_msgSend_removeMACAddressSeparatorsFromString_(self, v30, (uint64_t)v29);
      if ((unint64_t)objc_msgSend_length(v29, v31, v32) >= 0xD) {
        goto LABEL_52;
      }
    }
  }
  if (objc_msgSend_characterSet(self, v20, v21, v85))
  {
    v34 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v20, (uint64_t)*a3);
    uint64_t v36 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v35, @"\n");
    objc_msgSend_setCharactersToBeSkipped_(v34, v37, v36);
    uint64_t v40 = objc_msgSend_characterSet(self, v38, v39);
    objc_msgSend_scanCharactersFromSet_intoString_(v34, v41, v40, 0);
    if ((objc_msgSend_isAtEnd(v34, v42, v43) & 1) == 0) {
      goto LABEL_52;
    }
  }
  if (objc_msgSend_characterSet(self, v20, v33))
  {
    id v45 = *a3;
    uint64_t v46 = objc_msgSend_invertedCharacterSet(self, v20, v44);
    objc_msgSend_rangeOfCharacterFromSet_(v45, v47, v46);
    if (v20) {
      goto LABEL_52;
    }
  }
  char v48 = !v23;
  if (length > v15) {
    char v48 = 1;
  }
  if (v48)
  {
    if (length <= 1)
    {
      unint64_t v50 = objc_msgSend_length(v85, v20, v44);
      if (v50 > objc_msgSend_length(v14, v51, v52)
        && 0xAAAAAAAAAAAAAAABLL * location - 0x5555555555555555 <= 0x5555555555555555)
      {
        objc_msgSend_deleteCharactersInRange_(v14, v20, location - 1, length);
        --a4->location;
        a4->NSUInteger length = 0;
      }
    }
    v53 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v20, (uint64_t)v14);
    objc_msgSend_setScanLocation_(v53, v54, 0);
    uint64_t v57 = objc_msgSend_possibleSeparatorsInvertedSet(self, v55, v56);
    objc_msgSend_scanCharactersFromSet_intoString_(v53, v58, v57, 0);
    do
    {
      if (!objc_msgSend_isAtEnd(v53, v59, v60)
        || objc_msgSend_hasSuffix_(v14, v61, @" "))
      {
        unint64_t v16 = objc_msgSend_scanLocation(v53, v61, v62);
        objc_msgSend_deleteCharactersInRange_(v14, v63, v16, 1);
        --a4->location;
      }
      v53 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v61, (uint64_t)v14);
      unint64_t v66 = objc_msgSend_length(v14, v64, v65);
      uint64_t v68 = v16;
      if (v16 > v66) {
        uint64_t v68 = objc_msgSend_length(v14, v67, v16);
      }
      objc_msgSend_setScanLocation_(v53, v67, v68);
      uint64_t v71 = objc_msgSend_possibleSeparatorsInvertedSet(self, v69, v70);
      objc_msgSend_scanCharactersFromSet_intoString_(v53, v72, v71, 0);
    }
    while (!objc_msgSend_isAtEnd(v53, v73, v74)
         || (objc_msgSend_hasSuffix_(v14, v59, @" ") & 1) != 0);
    if ((unint64_t)objc_msgSend_length(v14, v59, v60) >= 2)
    {
      unint64_t v77 = 2;
      do
      {
        if (v77 >= self->super._maxLength) {
          break;
        }
        uint64_t v78 = objc_msgSend_userPreferredSeparator(self, v75, v76);
        objc_msgSend_insertString_atIndex_(v14, v79, v78, v77);
        ++a4->location;
        v77 += 3;
      }
      while (v77 <= objc_msgSend_length(v14, v80, v81));
    }
    *a3 = v14;
    return 1;
  }
  unint64_t v49 = v16;
  if (v16 % 3 != 2)
  {
    if (v16 % 3 == 1) {
      unint64_t v49 = v16 + 1;
    }
    else {
      unint64_t v49 = v16 - 1;
    }
  }
  unint64_t v82 = (v16 + 1) % 3;
  if (v82 == 2)
  {
LABEL_52:
    v84 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v20, (uint64_t)v85, v85);
    BOOL result = 0;
    *a3 = v84;
    a4->NSUInteger location = location;
    a4->NSUInteger length = length;
    return result;
  }
  if (v82) {
    return 1;
  }
  if (v16 == self->super._maxLength - 1)
  {
    objc_msgSend_deleteCharactersInRange_(v14, v20, v16 - 1, 1);
    --a4->location;
    a4->NSUInteger length = 0;
  }
  objc_msgSend_insertString_atIndex_(v14, v20, @"0", v49 - 2);
  BOOL result = 0;
  ++a4->location;
  *a3 = v14;
  return result;
}

- (void)setPossibleSeparators:(id)a3
{
  possibleSeparators = self->_possibleSeparators;
  if (possibleSeparators != a3)
  {

    self->_possibleSeparators = (NSCharacterSet *)a3;
  }
}

- (id)possibleSeparators
{
  uint64_t v2 = self->_possibleSeparators;

  return v2;
}

- (void)setPossibleSeparatorsInvertedSet:(id)a3
{
  possibleSeparatorsInvertedSet = self->_possibleSeparatorsInvertedSet;
  if (possibleSeparatorsInvertedSet != a3)
  {

    self->_possibleSeparatorsInvertedSet = (NSCharacterSet *)a3;
  }
}

- (id)possibleSeparatorsInvertedSet
{
  uint64_t v2 = self->_possibleSeparatorsInvertedSet;

  return v2;
}

- (void)setUserPreferredSeparator:(id)a3
{
  userPreferredSeparator = self->_userPreferredSeparator;
  if (userPreferredSeparator != a3)
  {

    self->_userPreferredSeparator = (NSString *)a3;
  }
}

- (id)userPreferredSeparator
{
  uint64_t v2 = self->_userPreferredSeparator;

  return v2;
}

+ (id)macAddressSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend_addCharactersInString_(v2, v3, @"abcdefABCDEF");
  objc_msgSend_addCharactersInString_(v2, v4, qword_268148008);
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);

  return v2;
}

@end
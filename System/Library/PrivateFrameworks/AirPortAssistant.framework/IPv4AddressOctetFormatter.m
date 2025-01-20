@interface IPv4AddressOctetFormatter
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
@end

@implementation IPv4AddressOctetFormatter

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t maxLength = self->super.super._maxLength;
  uint64_t v15 = WORD1(maxLength);
  if ((maxLength & 0xFFFF0000) == 0 || WORD1(maxLength) == 0)
  {
LABEL_6:
    v22.receiver = self;
    v22.super_class = (Class)IPv4AddressOctetFormatter;
    return -[APFormatter isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:](&v22, sel_isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription_, a3, a4, a5, location, length, a7);
  }
  else
  {
    v18 = 0;
    while (1)
    {
      uint64_t v19 = objc_msgSend_length(a5, a2, (uint64_t)a3);
      uint64_t v21 = objc_msgSend_rangeOfString_options_range_(a5, v20, @".", 0, v18, v19 - (void)v18);
      v18 = &a2[v21];
      if (!&a2[v21]) {
        return 0;
      }
      if (!--v15)
      {
        if (location >= (unint64_t)v18) {
          goto LABEL_6;
        }
        return 0;
      }
    }
  }
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  unint64_t maxLength = self->super.super._maxLength;
  v27.receiver = self;
  v27.super_class = (Class)IPv4AddressOctetFormatter;
  LODWORD(v7) = [(IPv4AddressFormatter *)&v27 isPartialStringValid:a3 newEditingString:a4 errorDescription:a5];
  if (v7)
  {
    v9 = objc_msgSend_componentsSeparatedByString_(a3, v8, @".");
    if (objc_msgSend_count(v9, v10, v11) <= (unint64_t)WORD1(maxLength))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      if ((unint64_t)objc_msgSend_count(v9, v12, v13) < 4) {
        goto LABEL_15;
      }
      if (!BYTE1(maxLength))
      {
        if (!(_BYTE)maxLength) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
      uint64_t v15 = objc_msgSend_objectAtIndex_(v9, v14, 2);
      uint64_t v7 = objc_msgSend_integerValue(v15, v16, v17);
      BOOL v18 = v7 == BYTE1(maxLength);
      LOBYTE(v7) = v7 != BYTE1(maxLength);
      BOOL v18 = v18 || maxLength == 0;
      if (!v18)
      {
LABEL_13:
        uint64_t v19 = objc_msgSend_objectAtIndex_(v9, v14, 3);
        if (objc_msgSend_length(v19, v20, v21))
        {
          v23 = objc_msgSend_objectAtIndex_(v9, v22, 3);
          LOBYTE(v7) = objc_msgSend_integerValue(v23, v24, v25) <= maxLength;
          return v7;
        }
LABEL_15:
        LOBYTE(v7) = 1;
      }
    }
  }
  return v7;
}

@end
@interface ABVCardLexer
- (ABVCardLexer)initWithData:(id)a3 watchdogTimer:(id)a4;
- (BOOL)_advancePastLineFoldingSequenceIfNeeded;
- (BOOL)advancePastEOL;
- (BOOL)advancePastEOLSingle;
- (BOOL)advancePastEOLUnicode;
- (BOOL)advanceToEOL;
- (BOOL)advanceToEOLSingle;
- (BOOL)advanceToEOLUnicode;
- (BOOL)advanceToToken:(int)a3 throughTypes:(int)a4;
- (BOOL)advancedPastToken:(int)a3;
- (BOOL)atEOF;
- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5;
- (id)nextBase64Data;
- (id)nextBase64Line:(BOOL *)a3;
- (id)nextEscapedCharacter;
- (id)nextQuotedPrintableData;
- (id)nextSingleByteBase64Line:(BOOL *)a3;
- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6;
- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6;
- (id)nextUnicodeBase64Line:(BOOL *)a3;
- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5;
- (id)tokenName:(int)a3;
- (id)tokenSetForLength:(int)a3;
- (int)advanceToSingleByteString;
- (int)advanceToString;
- (int)advanceToUnicodeString;
- (int)errorCount;
- (int)nextTokenPeak:(BOOL)a3;
- (int)nextTokenPeakSingle:(BOOL)a3 length:(int)a4;
- (int)nextTokenPeakUnicode:(BOOL)a3 length:(int)a4;
- (int)tokenAtCursor;
- (unsigned)cursor;
- (void)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 intoString:(id)a7;
- (void)advanceToPeakPoint;
- (void)dealloc;
@end

@implementation ABVCardLexer

- (id)tokenName:(int)a3
{
  if (a3 <= 32769)
  {
    if (!a3) {
      return @"ABNoToken";
    }
    if (a3 == 32769) {
      return @"ABLF";
    }
  }
  else
  {
    switch(a3)
    {
      case 32770:
        return @"ABCR";
      case 65538:
        return @"ABERROR";
      case 65537:
        return @"ABEOF";
    }
  }
  uint64_t v6 = [(NSArray *)self->_activeTokenSets count];
  if (v6 < 1) {
    return @"????";
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  v5 = @"????";
  while (1)
  {
    id v9 = [(NSArray *)self->_activeTokenSets objectAtIndex:v8];
    uint64_t v10 = [v9 count];
    if (v10 >= 1) {
      break;
    }
LABEL_18:
    if (++v8 == v7) {
      return v5;
    }
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  while (1)
  {
    uint64_t v13 = [v9 objectAtIndex:v12];
    if (*(_DWORD *)(v13 + 8) == a3) {
      return *(id *)v13;
    }
    if (v11 == ++v12) {
      goto LABEL_18;
    }
  }
}

- (ABVCardLexer)initWithData:(id)a3 watchdogTimer:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)ABVCardLexer;
  uint64_t v6 = [(ABVCardLexer *)&v15 init];
  uint64_t v7 = (NSMutableData *)[a3 mutableCopy];
  v6->_data = v7;
  v6->_unint64_t length = [(NSMutableData *)v7 length];
  v6->_bytes = (char *)[(NSMutableData *)v6->_data mutableBytes];
  v6->_unicode = [(NSMutableData *)v6->_data abIsUTF16EntourageVCard];
  v6->_timer = (ABVCardWatchdogTimer *)a4;
  unint64_t length = v6->_length;
  if (length >= 0xB)
  {
    bytes = v6->_bytes;
    int v10 = *bytes;
    if (v10 == 255)
    {
      if (bytes[1] == 254)
      {
        v6->_unicode = 1;
        v6->_cursor = 2;
        unint64_t v11 = length >> 1;
        do
        {
          *(_WORD *)bytes = bswap32(*(unsigned __int16 *)bytes) >> 16;
          bytes += 2;
          --v11;
        }
        while (v11);
        goto LABEL_12;
      }
    }
    else if (v10 == 254 && bytes[1] == 255)
    {
      v6->_unicode = 1;
      v6->_cursor = 2;
      goto LABEL_12;
    }
    int v12 = [(NSMutableData *)v6->_data abIsUTF16EntourageVCard];
    v6->_unicode = v12;
    if (!v12)
    {
      uint64_t v13 = (NSArray *)ABVCardSingleByteTokens;
      if (!ABVCardSingleByteTokens)
      {
        uint64_t v13 = (NSArray *)buildTokenTable(0);
        ABVCardSingleByteTokens = (uint64_t)v13;
      }
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v13 = (NSArray *)ABVCardUTF16Tokens;
    if (!ABVCardUTF16Tokens)
    {
      uint64_t v13 = (NSArray *)buildTokenTable(1);
      ABVCardUTF16Tokens = (uint64_t)v13;
    }
LABEL_16:
    v6->_activeTokenSets = v13;
    return v6;
  }

  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABVCardLexer;
  [(ABVCardLexer *)&v3 dealloc];
}

- (unsigned)cursor
{
  return self->_cursor;
}

- (int)errorCount
{
  return self->_errorCount;
}

- (id)tokenSetForLength:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) <= 6 && ((0x55u >> v3)) {
    return [(NSArray *)self->_activeTokenSets objectAtIndex:qword_19DD556D8[v3]];
  }
  else {
    return 0;
  }
}

- (int)nextTokenPeakSingle:(BOOL)a3 length:(int)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t cursor = self->_cursor;
  self->_unint64_t peakedPoint = cursor;
  if (self->_length <= cursor) {
    int v8 = 65537;
  }
  else {
    int v8 = 0;
  }
  timer = self->_timer;
  if (timer && ![(ABVCardWatchdogTimer *)timer isValid])
  {
    self->_errorCFIndex Count = 10;
    int v8 = 65538;
  }
  unint64_t peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
    BOOL v12 = 1;
LABEL_14:
    if (a3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (a4 <= 0) {
    unint64_t v11 = 7;
  }
  else {
    unint64_t v11 = a4;
  }
  if (v8)
  {
    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v36 = a3;
  unint64_t v18 = 1;
  do
  {
    *(_WORD *)&v37[v18 - 1] = self->_bytes[peakedPoint];
    CFArrayRef v19 = [(ABVCardLexer *)self tokenSetForLength:v18];
    if (v19 && (CFArrayRef v20 = v19, Count = CFArrayGetCount(v19), Count >= 1))
    {
      CFIndex v22 = Count;
      CFIndex v23 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v20, v23);
        v25 = (unsigned __int8 *)*((void *)ValueAtIndex + 2);
        v26 = v37;
        do
        {
          while (1)
          {
            int v28 = *v25++;
            int v27 = v28;
            int v30 = *v26++;
            int v29 = v30;
            if (v30 != v27) {
              break;
            }
            if (!v27) {
              goto LABEL_41;
            }
          }
        }
        while ((v29 - 97) <= 0x19 && v29 - 32 == v27);
        if (!v29)
        {
LABEL_41:
          int v8 = *((_DWORD *)ValueAtIndex + 2);
          break;
        }
        int v8 = 0;
        if (++v23 != v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v8 = 0;
    }
    unint64_t peakedPoint = self->_peakedPoint + 1;
    self->_unint64_t peakedPoint = peakedPoint;
    unint64_t length = self->_length;
    BOOL v33 = length > peakedPoint;
    BOOL v12 = length <= peakedPoint;
    BOOL v34 = !v33 || v18++ >= v11;
  }
  while (!v34 && v8 == 0);
  if (!v36) {
LABEL_15:
  }
    self->_unint64_t cursor = peakedPoint;
LABEL_16:
  if (a4 | v8) {
    char v13 = 1;
  }
  else {
    char v13 = v12;
  }
  if (a4 | v8) {
    int result = v8;
  }
  else {
    int result = 65537;
  }
  if ((v13 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABVCardLexer nextTokenPeakSingle:length:]", 356, 0, @"vCard Syntax Error, character: %d : %c", v15, v16, v17, self->_cursor);
    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeakUnicode:(BOOL)a3 length:(int)a4
{
  BOOL v5 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t cursor = self->_cursor;
  self->_unint64_t peakedPoint = cursor;
  if (a4 <= 0) {
    unint64_t v8 = 7;
  }
  else {
    unint64_t v8 = a4;
  }
  if (self->_length <= cursor) {
    int v9 = 65537;
  }
  else {
    int v9 = 0;
  }
  timer = self->_timer;
  if (timer && ![(ABVCardWatchdogTimer *)timer isValid])
  {
    self->_errorCFIndex Count = 10;
    int v9 = 65538;
  }
  unint64_t peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
    BOOL v12 = 1;
    if (v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v9)
  {
    BOOL v12 = 0;
    if (v5) {
      goto LABEL_16;
    }
LABEL_15:
    self->_unint64_t cursor = peakedPoint;
    goto LABEL_16;
  }
  BOOL v41 = v5;
  unint64_t v18 = 1;
  do
  {
    bytes = self->_bytes;
    __int16 v20 = bytes[peakedPoint];
    unsigned int v21 = peakedPoint + 1;
    self->_unint64_t peakedPoint = v21;
    __int16 v22 = bytes[v21];
    CFIndex v23 = &v42[v18];
    *(v23 - 1) = v22 | (v20 << 8);
    *CFIndex v23 = 0;
    CFArrayRef v24 = [(ABVCardLexer *)self tokenSetForLength:v18];
    if (v24 && (v25 = v24, CFIndex Count = CFArrayGetCount(v24), Count >= 1))
    {
      CFIndex v27 = Count;
      CFIndex v28 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v25, v28);
        int v30 = (unsigned __int16 *)*((void *)ValueAtIndex + 2);
        v31 = v42;
        do
        {
          while (1)
          {
            int v33 = *v30++;
            int v32 = v33;
            int v35 = *v31++;
            int v34 = v35;
            if (v35 != v32) {
              break;
            }
            if (!v32) {
              goto LABEL_41;
            }
          }
        }
        while ((v34 - 97) <= 0x19 && v34 - 32 == v32);
        if (!v34)
        {
LABEL_41:
          int v9 = *((_DWORD *)ValueAtIndex + 2);
          break;
        }
        int v9 = 0;
        if (++v28 != v27) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v9 = 0;
    }
    unint64_t peakedPoint = self->_peakedPoint + 1;
    self->_unint64_t peakedPoint = peakedPoint;
    unint64_t length = self->_length;
    BOOL v38 = length > peakedPoint;
    BOOL v12 = length <= peakedPoint;
    BOOL v39 = !v38 || v18++ >= v8;
  }
  while (!v39 && v9 == 0);
  if (!v41) {
    goto LABEL_15;
  }
LABEL_16:
  if (a4 | v9) {
    char v13 = 1;
  }
  else {
    char v13 = v12;
  }
  if (a4 | v9) {
    int result = v9;
  }
  else {
    int result = 65537;
  }
  if ((v13 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABVCardLexer nextTokenPeakUnicode:length:]", 406, 0, @"vCard Syntax Error, character: %d : %c", v15, v16, v17, self->_cursor);
    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeak:(BOOL)a3
{
  if (self->_unicode) {
    return [(ABVCardLexer *)self nextTokenPeakUnicode:a3 length:0];
  }
  else {
    return [(ABVCardLexer *)self nextTokenPeakSingle:a3 length:0];
  }
}

- (id)nextQuotedPrintableData
{
  bytes = self->_bytes;
  uint64_t cursor = self->_cursor;
  unsigned int v4 = bytes[cursor];
  self->_uint64_t cursor = cursor + 1;
  if (v4 == 13 || v4 == 10)
  {
    [(ABVCardLexer *)self advancePastEOL];
    return 0;
  }
  else
  {
    unsigned int v7 = bytes[(cursor + 1)];
    if (v4 <= 0x40) {
      char v8 = 64;
    }
    else {
      char v8 = 9;
    }
    char v9 = v8 + v4;
    if (v7 <= 0x40) {
      char v10 = -48;
    }
    else {
      char v10 = -55;
    }
    if (v7 > 0x60) {
      char v10 = -87;
    }
    char v11 = v7 + 16 * v9 + v10;
    char v18 = v11;
    self->_uint64_t cursor = cursor + 2;
    if (v11 == 13 && (unint64_t v12 = (cursor + 4), self->_length > v12))
    {
      if (bytes[(cursor + 2)] == 61)
      {
        unsigned int v13 = bytes[(cursor + 3)];
        unsigned int v14 = bytes[v12];
        if (v13 <= 0x40) {
          char v15 = 64;
        }
        else {
          char v15 = 9;
        }
        char v16 = v15 + v13;
        if (v14 <= 0x40) {
          char v17 = -48;
        }
        else {
          char v17 = -55;
        }
        if (v14 > 0x60) {
          char v17 = -87;
        }
        if ((v17 + v14 + 16 * v16) == 10) {
          self->_uint64_t cursor = cursor + 5;
        }
      }
      return (id)ABReturnDelimiterData;
    }
    else
    {
      return (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v18 length:1];
    }
  }
}

- (id)nextEscapedCharacter
{
  if ([(ABVCardLexer *)self advancedPastToken:0x8000]) {
    [(ABVCardLexer *)self advancedPastToken:0x4000];
  }
  bytes = self->_bytes;
  uint64_t cursor = self->_cursor;
  int v5 = bytes[cursor];
  char v13 = bytes[cursor];
  int v6 = cursor + 1;
  self->_uint64_t cursor = cursor + 1;
  BOOL unicode = self->_unicode;
  if (self->_unicode)
  {
    int v5 = bytes[v6];
    char v13 = bytes[v6];
    self->_uint64_t cursor = cursor + 2;
  }
  if (v5 == 110)
  {
    LOBYTE(v5) = 10;
    char v13 = 10;
  }
  if (unicode)
  {
    v12[0] = 0;
    v12[1] = v5;
    char v8 = (void *)MEMORY[0x1E4F1C9B8];
    char v9 = v12;
    uint64_t v10 = 2;
  }
  else
  {
    char v8 = (void *)MEMORY[0x1E4F1C9B8];
    char v9 = &v13;
    uint64_t v10 = 1;
  }
  return (id)[v8 dataWithBytes:v9 length:v10];
}

- (BOOL)advancedPastToken:(int)a3
{
  unint64_t cursor = self->_cursor;
  LODWORD(v4) = self->_cursor;
  if (self->_length > cursor)
  {
    while (([(ABVCardLexer *)self tokenAtCursor] & a3) != 0)
    {
      if (self->_unicode) {
        int v7 = 2;
      }
      else {
        int v7 = 1;
      }
      unint64_t v4 = self->_cursor + v7;
      self->_unint64_t cursor = v4;
      if (self->_length <= v4) {
        return v4 > cursor;
      }
    }
    LODWORD(v4) = self->_cursor;
  }
  return v4 > cursor;
}

- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v41 = a4;
  unint64_t cursor = self->_cursor;
  CFArrayRef v9 = [(ABVCardLexer *)self tokenSetForLength:1];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v42[1] = 0;
  unint64_t v11 = self->_cursor;
  if (self->_length <= v11)
  {
LABEL_36:

    self->_unint64_t cursor = self->_peakedPoint;
    return 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v39 = 0;
  char v14 = 1;
  while (1)
  {
    v42[0] = self->_bytes[v11];
    CFIndex Count = CFArrayGetCount(v9);
    if (Count < 1)
    {
LABEL_15:
      int v26 = 0;
      if (!v6) {
        goto LABEL_21;
      }
    }
    else
    {
      CFIndex v16 = Count;
      CFIndex v17 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v17);
        CFArrayRef v19 = (unsigned __int8 *)ValueAtIndex[2];
        __int16 v20 = v42;
        do
        {
          while (1)
          {
            int v22 = *v19++;
            int v21 = v22;
            int v24 = *v20++;
            int v23 = v24;
            if (v24 != v21) {
              break;
            }
            if (!v21) {
              goto LABEL_17;
            }
          }
        }
        while ((v23 - 97) <= 0x19 && v23 - 32 == v21);
        if (v23)
        {
          if (++v17 != v16) {
            continue;
          }
          goto LABEL_15;
        }
        break;
      }
LABEL_17:
      int v26 = *((_DWORD *)ValueAtIndex + 2);
      if (!v6) {
        goto LABEL_21;
      }
    }
    if ((v26 & 0x4000) != 0) {
      break;
    }
    v14 &= (v26 & a5) != 0;
    if ((v26 & a5) == 0) {
      uint64_t v13 = 0;
    }
LABEL_21:
    if (v41 && v26 == 1025)
    {
      CFIndex v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
      [v10 appendData:v27];

      ++self->_cursor;
      id v28 = [(ABVCardLexer *)self nextQuotedPrintableData];
      if (v28) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v26 != 513) {
        goto LABEL_33;
      }
      int v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
      [v10 appendData:v29];

      ++self->_cursor;
      id v28 = [(ABVCardLexer *)self nextEscapedCharacter];
      if (v28) {
LABEL_24:
      }
        [v10 appendData:v28];
    }
    uint64_t v12 = 0;
    unint64_t v11 = self->_cursor;
    unint64_t cursor = v11;
LABEL_35:
    if (self->_length <= v11) {
      goto LABEL_36;
    }
  }
  BOOL v30 = (v14 & 1) == 0;
  char v14 = (v14 & 1) != 0;
  uint64_t v31 = v39;
  if (!v30) {
    uint64_t v31 = v39 + 1;
  }
  uint64_t v39 = v31;
  if (v30) {
    ++v13;
  }
LABEL_33:
  if ((v26 & a5) == 0)
  {
    ++v12;
    unint64_t v11 = self->_cursor + 1;
    self->_unint64_t cursor = v11;
    goto LABEL_35;
  }
  int v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
  [v10 appendData:v33];

  if (v6)
  {
    unint64_t v34 = a3;
    if (v39 | v13)
    {
      id v35 = (id)objc_msgSend(v10, "subdataWithRange:", v39, objc_msgSend(v10, "length") - (v13 + v39));

      id v10 = v35;
    }
  }
  else
  {
    unint64_t v34 = a3;
  }
  if (v34 == 4000100)
  {
    id v36 = v10;
    return (id)[v36 abDecodedUTF7];
  }
  else
  {
    v37 = (void *)[[NSString alloc] initWithData:v10 encoding:v34];

    return v37;
  }
}

- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v39 = a4;
  unint64_t cursor = self->_cursor;
  CFArrayRef v8 = [(ABVCardLexer *)self tokenSetForLength:1];
  uint64_t v9 = [MEMORY[0x1E4F1CA58] data];
  __int16 v41 = 0;
  unint64_t v10 = self->_cursor;
  if (self->_length <= v10)
  {
LABEL_36:
    self->_unint64_t cursor = self->_peakedPoint;
    return 0;
  }
  unint64_t v11 = (void *)v9;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v37 = 0;
  char v14 = 1;
  while (1)
  {
    bytes = self->_bytes;
    v40[1] = bytes[v10];
    unsigned int v16 = v10 + 1;
    self->_unint64_t cursor = v16;
    v40[0] = bytes[v16];
    CFIndex Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_15:
      int v28 = 0;
      if (!v5) {
        goto LABEL_21;
      }
    }
    else
    {
      CFIndex v18 = Count;
      CFIndex v19 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, v19);
        int v21 = (unsigned __int16 *)ValueAtIndex[2];
        int v22 = (unsigned __int16 *)v40;
        do
        {
          while (1)
          {
            int v24 = *v21++;
            int v23 = v24;
            int v26 = *v22++;
            int v25 = v26;
            if (v26 != v23) {
              break;
            }
            if (!v23) {
              goto LABEL_17;
            }
          }
        }
        while ((v25 - 97) <= 0x19 && v25 - 32 == v23);
        if (v25)
        {
          if (++v19 != v18) {
            continue;
          }
          goto LABEL_15;
        }
        break;
      }
LABEL_17:
      int v28 = *((_DWORD *)ValueAtIndex + 2);
      if (!v5) {
        goto LABEL_21;
      }
    }
    if ((v28 & 0x4000) != 0) {
      break;
    }
    v14 &= (v28 & a3) != 0;
    if ((v28 & a3) == 0) {
      uint64_t v13 = 0;
    }
LABEL_21:
    if (v39 && v28 == 1025)
    {
      int v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
      [v11 appendData:v29];

      ++self->_cursor;
      id v30 = [(ABVCardLexer *)self nextQuotedPrintableData];
      if (v30) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v28 != 513) {
        goto LABEL_33;
      }
      uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
      [v11 appendData:v31];

      ++self->_cursor;
      id v30 = [(ABVCardLexer *)self nextEscapedCharacter];
      if (v30) {
LABEL_24:
      }
        [v11 appendData:v30];
    }
    uint64_t v12 = 0;
    unint64_t v10 = self->_cursor;
    unint64_t cursor = v10;
LABEL_35:
    if (self->_length <= v10) {
      goto LABEL_36;
    }
  }
  uint64_t v32 = v37;
  BOOL v33 = (v14 & 1) == 0;
  char v14 = (v14 & 1) != 0;
  if (!v33) {
    uint64_t v32 = v37 + 2;
  }
  uint64_t v37 = v32;
  if (v33) {
    v13 += 2;
  }
LABEL_33:
  if ((v28 & a3) == 0)
  {
    v12 += 2;
    unint64_t v10 = self->_cursor + 1;
    self->_unint64_t cursor = v10;
    goto LABEL_35;
  }
  id v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&self->_bytes[cursor] length:v12 freeWhenDone:0];
  [v11 appendData:v35];

  if (v5 && v37 | v13) {
    unint64_t v11 = objc_msgSend(v11, "subdataWithRange:", v37, objc_msgSend(v11, "length") - (v13 + v37));
  }
  id v36 = (void *)[[NSString alloc] initWithData:v11 encoding:10];
  --self->_cursor;
  return v36;
}

- (BOOL)_advancePastLineFoldingSequenceIfNeeded
{
  if (self->_unicode)
  {
    if (([(ABVCardLexer *)self nextTokenPeakUnicode:1 length:1] & 0x8000) != 0)
    {
      [(ABVCardLexer *)self advancePastEOL];
      if (([(ABVCardLexer *)self nextTokenPeakUnicode:1 length:1] & 0x4000) == 0)
      {
        BOOL result = 0;
        unsigned int v4 = self->_cursor - 2;
LABEL_9:
        self->_unint64_t cursor = v4;
        return result;
      }
      goto LABEL_10;
    }
    return 0;
  }
  if (([(ABVCardLexer *)self nextTokenPeakSingle:1 length:1] & 0x8000) == 0) {
    return 0;
  }
  [(ABVCardLexer *)self advancePastEOL];
  if (([(ABVCardLexer *)self nextTokenPeakSingle:1 length:1] & 0x4000) == 0)
  {
    BOOL result = 0;
    unsigned int v4 = self->_cursor - 1;
    goto LABEL_9;
  }
LABEL_10:
  [(ABVCardLexer *)self advanceToPeakPoint];
  return 1;
}

- (void)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 intoString:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  if (self->_unicode) {
    id v13 = [(ABVCardLexer *)self nextUnicodeStringStopTokens:*(void *)&a5 quotedPrintable:a4 trim:a6];
  }
  else {
    id v13 = [(ABVCardLexer *)self nextSingleByteStringInEncoding:a3 quotedPrintable:a4 stopTokens:*(void *)&a5 trim:a6];
  }
  id v14 = v13;
  if (v13) {
    [a7 appendString:v13];
  }
  if ([(ABVCardLexer *)self _advancePastLineFoldingSequenceIfNeeded])
  {
    [(ABVCardLexer *)self _applyNextStringInEncoding:a3 quotedPrintable:v10 stopTokens:v9 trim:v8 intoString:a7];
  }
}

- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(ABVCardLexer *)self _applyNextStringInEncoding:a3 quotedPrintable:v8 stopTokens:v7 trim:0 intoString:v11];
  if (v6)
  {
    uint64_t v12 = _ABStringByTrimmingWhiteSpace(v11);

    id v11 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v12];
  }
  return v11;
}

- (int)tokenAtCursor
{
  uint64_t cursor = self->_cursor;
  CFArrayRef v4 = [(ABVCardLexer *)self tokenSetForLength:1];
  CFArrayRef v5 = v4;
  if (!self->_unicode)
  {
    v30[1] = 0;
    v30[0] = self->_bytes[cursor];
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v20 = Count;
      CFIndex v21 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v21);
        int v22 = (unsigned __int8 *)*((void *)ValueAtIndex + 2);
        int v23 = v30;
        do
        {
          while (1)
          {
            int v25 = *v22++;
            int v24 = v25;
            int v27 = *v23++;
            int v26 = v27;
            if (v27 != v24) {
              break;
            }
            if (!v24) {
              return *((_DWORD *)ValueAtIndex + 2);
            }
          }
        }
        while ((v26 - 97) <= 0x19 && v26 - 32 == v24);
        if (!v26) {
          break;
        }
        if (++v21 == v20) {
          return 0;
        }
      }
      return *((_DWORD *)ValueAtIndex + 2);
    }
    return 0;
  }
  bytes = self->_bytes;
  char v7 = bytes[cursor];
  __int16 v32 = 0;
  v31[1] = v7;
  v31[0] = bytes[(cursor + 1)];
  CFIndex v8 = CFArrayGetCount(v4);
  if (v8 < 1) {
    return 0;
  }
  CFIndex v9 = v8;
  CFIndex v10 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
    uint64_t v12 = (unsigned __int16 *)*((void *)ValueAtIndex + 2);
    id v13 = (unsigned __int16 *)v31;
    do
    {
      while (1)
      {
        int v15 = *v12++;
        int v14 = v15;
        int v17 = *v13++;
        int v16 = v17;
        if (v17 != v14) {
          break;
        }
        if (!v14) {
          return *((_DWORD *)ValueAtIndex + 2);
        }
      }
    }
    while ((v16 - 97) <= 0x19 && v16 - 32 == v14);
    if (!v16) {
      break;
    }
    if (++v10 == v9) {
      return 0;
    }
  }
  return *((_DWORD *)ValueAtIndex + 2);
}

- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5
{
  CFIndex v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  [(ABVCardLexer *)self _advancePastLineFoldingSequenceIfNeeded];
  while (([(ABVCardLexer *)self tokenAtCursor] & a4) == 0)
  {
    if (self->_length <= self->_cursor) {
      break;
    }
    id v10 = [(ABVCardLexer *)self nextStringInEncoding:a5 quotedPrintable:0 stopTokens:a4 | a3 trim:1];
    if (v10)
    {
      id v11 = v10;
      if ([v10 length]) {
        [v9 addObject:v11];
      }
    }
    if (([(ABVCardLexer *)self tokenAtCursor] & a3) != 0)
    {
      if (self->_unicode) {
        int v12 = 2;
      }
      else {
        int v12 = 1;
      }
      self->_cursor += v12;
    }
  }
  return v9;
}

- (id)nextUnicodeBase64Line:(BOOL *)a3
{
  CFArrayRef v5 = (void *)[MEMORY[0x1E4F1CA58] data];
  CFArrayRef v6 = [(ABVCardLexer *)self tokenSetForLength:1];
  __int16 v22 = 0;
  unint64_t cursor = self->_cursor;
  if (self->_length <= cursor) {
    return v5;
  }
  CFArrayRef v8 = v6;
  do
  {
    bytes = self->_bytes;
    v21[1] = bytes[cursor];
    unsigned int v10 = cursor + 1;
    self->_unint64_t cursor = v10;
    v21[0] = bytes[v10];
    CFIndex Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_20:
      [v5 appendBytes:v21 length:1];
      goto LABEL_23;
    }
    CFIndex v12 = Count;
    CFIndex v13 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v13);
      for (uint64_t i = 0; ; i += 2)
      {
        int v16 = *(unsigned __int16 *)(ValueAtIndex[2] + i);
        int v17 = *(unsigned __int16 *)&v21[i];
        if (v17 != v16) {
          break;
        }
        if (!*(_WORD *)(ValueAtIndex[2] + i)) {
          goto LABEL_18;
        }
LABEL_14:
        ;
      }
      if ((v17 - 97) <= 0x19 && v17 - 32 == v16) {
        goto LABEL_14;
      }
      if (*(_WORD *)&v21[i])
      {
        if (++v13 != v12) {
          continue;
        }
        goto LABEL_20;
      }
      break;
    }
LABEL_18:
    int v19 = *((_DWORD *)ValueAtIndex + 2);
    if (v19 == 1025)
    {
      [v5 appendBytes:v21 length:1];
      *a3 = 1;
      goto LABEL_23;
    }
    if (!v19) {
      goto LABEL_20;
    }
    if ((v19 & 0x8000) != 0)
    {
      --self->_cursor;
      return v5;
    }
LABEL_23:
    unint64_t cursor = self->_cursor + 1;
    self->_unint64_t cursor = cursor;
  }
  while (self->_length > cursor);
  return v5;
}

- (id)nextSingleByteBase64Line:(BOOL *)a3
{
  CFArrayRef v5 = (void *)[MEMORY[0x1E4F1CA58] data];
  CFArrayRef v6 = [(ABVCardLexer *)self tokenSetForLength:1];
  v19[1] = 0;
  unint64_t cursor = self->_cursor;
  if (self->_length <= cursor) {
    return v5;
  }
  CFArrayRef v8 = v6;
  while (2)
  {
    v19[0] = self->_bytes[cursor];
    CFIndex Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_20:
      [v5 appendBytes:v19 length:1];
      goto LABEL_23;
    }
    CFIndex v10 = Count;
    CFIndex v11 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v11);
      for (uint64_t i = 0; ; ++i)
      {
        int v14 = *(unsigned __int8 *)(ValueAtIndex[2] + i);
        int v15 = v19[i];
        if (v15 != v14) {
          break;
        }
        if (!*(unsigned char *)(ValueAtIndex[2] + i)) {
          goto LABEL_18;
        }
LABEL_14:
        ;
      }
      if ((v15 - 97) <= 0x19 && v15 - 32 == v14) {
        goto LABEL_14;
      }
      if (v19[i])
      {
        if (++v11 != v10) {
          continue;
        }
        goto LABEL_20;
      }
      break;
    }
LABEL_18:
    int v17 = *((_DWORD *)ValueAtIndex + 2);
    if (v17 == 1025)
    {
      [v5 appendBytes:v19 length:1];
      *a3 = 1;
      goto LABEL_23;
    }
    if (!v17) {
      goto LABEL_20;
    }
    if ((v17 & 0x8000) == 0)
    {
LABEL_23:
      unint64_t cursor = self->_cursor + 1;
      self->_unint64_t cursor = cursor;
      if (self->_length <= cursor) {
        return v5;
      }
      continue;
    }
    return v5;
  }
}

- (id)nextBase64Line:(BOOL *)a3
{
  if (self->_unicode) {
    return [(ABVCardLexer *)self nextUnicodeBase64Line:a3];
  }
  else {
    return [(ABVCardLexer *)self nextSingleByteBase64Line:a3];
  }
}

- (id)nextBase64Data
{
  char v7 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  do
  {
    id v4 = [(ABVCardLexer *)self nextBase64Line:&v7];
    if (!v4) {
      break;
    }
    [v3 appendData:v4];
    [v3 appendData:ABReturnDelimiterData];
    unsigned int cursor = self->_cursor;
    [(ABVCardLexer *)self advanceToEOL];
    [(ABVCardLexer *)self advancePastEOL];
    if (![(ABVCardLexer *)self advanceToString])
    {
      char v7 = 1;
      self->_unsigned int cursor = cursor;
      return v3;
    }
  }
  while (!v7);
  return v3;
}

- (void)advanceToPeakPoint
{
  self->_unsigned int cursor = self->_peakedPoint;
}

- (int)advanceToUnicodeString
{
  CFArrayRef v3 = [(ABVCardLexer *)self tokenSetForLength:1];
  __int16 v22 = 0;
  unint64_t cursor = self->_cursor;
  self->_unint64_t peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    int v6 = 0;
  }
  else
  {
    CFArrayRef v5 = v3;
    int v6 = 0;
    while (1)
    {
      bytes = self->_bytes;
      v21[1] = bytes[cursor];
      unsigned int v8 = cursor + 1;
      self->_unint64_t peakedPoint = v8;
      v21[0] = bytes[v8];
      CFIndex Count = CFArrayGetCount(v5);
      if (Count < 1) {
        break;
      }
      CFIndex v10 = Count;
      CFIndex v11 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v11);
        CFIndex v13 = (unsigned __int16 *)ValueAtIndex[2];
        int v14 = (unsigned __int16 *)v21;
        do
        {
          while (1)
          {
            int v16 = *v13++;
            int v15 = v16;
            int v18 = *v14++;
            int v17 = v18;
            if (v18 != v15) {
              break;
            }
            if (!v15) {
              goto LABEL_16;
            }
          }
        }
        while ((v17 - 97) <= 0x19 && v17 - 32 == v15);
        if (v17)
        {
          if (++v11 != v10) {
            continue;
          }
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((unsigned char *)ValueAtIndex + 9) & 0x40) == 0) {
        break;
      }
      ++v6;
      unint64_t cursor = self->_peakedPoint + 1;
      self->_unint64_t peakedPoint = cursor;
      if (self->_length <= cursor) {
        goto LABEL_18;
      }
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint - 1;
    self->_unint64_t peakedPoint = cursor;
  }
  self->_unint64_t cursor = cursor;
  return v6;
}

- (int)advanceToSingleByteString
{
  CFArrayRef v3 = [(ABVCardLexer *)self tokenSetForLength:1];
  v19[1] = 0;
  unint64_t cursor = self->_cursor;
  self->_unint64_t peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    int v6 = 0;
  }
  else
  {
    CFArrayRef v5 = v3;
    int v6 = 0;
    while (1)
    {
      v19[0] = self->_bytes[cursor];
      CFIndex Count = CFArrayGetCount(v5);
      if (Count < 1) {
        break;
      }
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v9);
        CFIndex v11 = (unsigned __int8 *)ValueAtIndex[2];
        CFIndex v12 = v19;
        do
        {
          while (1)
          {
            int v14 = *v11++;
            int v13 = v14;
            int v16 = *v12++;
            int v15 = v16;
            if (v16 != v13) {
              break;
            }
            if (!v13) {
              goto LABEL_16;
            }
          }
        }
        while ((v15 - 97) <= 0x19 && v15 - 32 == v13);
        if (v15)
        {
          if (++v9 != v8) {
            continue;
          }
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((unsigned char *)ValueAtIndex + 9) & 0x40) == 0) {
        break;
      }
      ++v6;
      unint64_t cursor = self->_peakedPoint + 1;
      self->_unint64_t peakedPoint = cursor;
      if (self->_length <= cursor) {
        goto LABEL_18;
      }
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint;
  }
  self->_unint64_t cursor = cursor;
  return v6;
}

- (int)advanceToString
{
  if (self->_unicode) {
    return [(ABVCardLexer *)self advanceToUnicodeString];
  }
  else {
    return [(ABVCardLexer *)self advanceToSingleByteString];
  }
}

- (BOOL)advanceToToken:(int)a3 throughTypes:(int)a4
{
  int v7 = 0;
  while (v7 != a3)
  {
    int v8 = [(ABVCardLexer *)self nextTokenPeak:0];
    if (v8 == a3) {
      break;
    }
    int v7 = v8;
    BOOL result = 0;
    BOOL v11 = (v7 & a4) == 0 && a4 != 0;
    if ((v7 - 65537) < 2 || v11) {
      return result;
    }
  }
  return 1;
}

- (BOOL)advanceToEOLUnicode
{
  unint64_t length = self->_length;
  unint64_t cursor = self->_cursor;
  if (length <= cursor) {
    return 0;
  }
  bytes = self->_bytes;
  for (unsigned int i = cursor + 2; ; i += 2)
  {
    int v6 = bytes[i - 1] | (bytes[cursor] << 8);
    if (v6 == 10 || v6 == 13) {
      break;
    }
    self->_unint64_t cursor = i;
    unint64_t cursor = i;
    if (length <= i) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)advanceToEOLSingle
{
  unint64_t length = self->_length;
  unint64_t cursor = self->_cursor;
  if (length <= cursor) {
    return 0;
  }
  bytes = self->_bytes;
  for (unsigned int i = cursor + 1; ; ++i)
  {
    int v6 = bytes[cursor];
    if (v6 == 10 || v6 == 13) {
      break;
    }
    self->_unint64_t cursor = i;
    unint64_t cursor = i;
    if (length <= i) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)advanceToEOL
{
  if (self->_unicode) {
    return [(ABVCardLexer *)self advanceToEOLUnicode];
  }
  else {
    return [(ABVCardLexer *)self advanceToEOLSingle];
  }
}

- (BOOL)advancePastEOLUnicode
{
  CFArrayRef v3 = [(ABVCardLexer *)self tokenSetForLength:1];
  __int16 v21 = 0;
  unint64_t cursor = self->_cursor;
  self->_unint64_t peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    BOOL result = 0;
  }
  else
  {
    CFArrayRef v5 = v3;
    while (1)
    {
      bytes = self->_bytes;
      v20[1] = bytes[cursor];
      unsigned int v7 = cursor + 1;
      self->_unint64_t peakedPoint = v7;
      v20[0] = bytes[v7];
      CFIndex Count = CFArrayGetCount(v5);
      if (Count < 1) {
        break;
      }
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
        CFIndex v12 = (unsigned __int16 *)ValueAtIndex[2];
        int v13 = (unsigned __int16 *)v20;
        do
        {
          while (1)
          {
            int v15 = *v12++;
            int v14 = v15;
            int v17 = *v13++;
            int v16 = v17;
            if (v17 != v14) {
              break;
            }
            if (!v14) {
              goto LABEL_16;
            }
          }
        }
        while ((v16 - 97) <= 0x19 && v16 - 32 == v14);
        if (v16)
        {
          if (++v10 != v9) {
            continue;
          }
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((unsigned char *)ValueAtIndex + 9) & 0x80) == 0) {
        break;
      }
      unint64_t cursor = self->_peakedPoint + 1;
      self->_unint64_t peakedPoint = cursor;
      if (self->_length <= cursor) {
        goto LABEL_18;
      }
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint - 1;
    self->_unint64_t peakedPoint = cursor;
    BOOL result = 1;
  }
  self->_unint64_t cursor = cursor;
  return result;
}

- (BOOL)advancePastEOLSingle
{
  self->_unint64_t peakedPoint = self->_cursor;
  CFArrayRef v3 = [(ABVCardLexer *)self tokenSetForLength:1];
  v18[1] = 0;
  unint64_t peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
LABEL_18:
    BOOL result = 0;
  }
  else
  {
    CFArrayRef v5 = v3;
    while (1)
    {
      v18[0] = self->_bytes[peakedPoint];
      CFIndex Count = CFArrayGetCount(v5);
      if (Count < 1) {
        break;
      }
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
        CFIndex v10 = (unsigned __int8 *)ValueAtIndex[2];
        BOOL v11 = v18;
        do
        {
          while (1)
          {
            int v13 = *v10++;
            int v12 = v13;
            int v15 = *v11++;
            int v14 = v15;
            if (v15 != v12) {
              break;
            }
            if (!v12) {
              goto LABEL_16;
            }
          }
        }
        while ((v14 - 97) <= 0x19 && v14 - 32 == v12);
        if (v14)
        {
          if (++v8 != v7) {
            continue;
          }
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((unsigned char *)ValueAtIndex + 9) & 0x80) == 0) {
        break;
      }
      unint64_t peakedPoint = self->_peakedPoint + 1;
      self->_unint64_t peakedPoint = peakedPoint;
      if (self->_length <= peakedPoint) {
        goto LABEL_18;
      }
    }
LABEL_19:
    LODWORD(peakedPoint) = self->_peakedPoint;
    BOOL result = 1;
  }
  self->_unint64_t cursor = peakedPoint;
  return result;
}

- (BOOL)advancePastEOL
{
  if (self->_unicode) {
    return [(ABVCardLexer *)self advancePastEOLUnicode];
  }
  else {
    return [(ABVCardLexer *)self advancePastEOLSingle];
  }
}

- (BOOL)atEOF
{
  unint64_t length = self->_length;
  return !length || length <= self->_cursor;
}

@end
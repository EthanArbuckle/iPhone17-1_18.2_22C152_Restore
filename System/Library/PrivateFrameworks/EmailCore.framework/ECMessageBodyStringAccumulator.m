@interface ECMessageBodyStringAccumulator
- (BOOL)isFull;
- (ECMessageBodyStringAccumulator)initWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4;
- (NSString)accumulatedString;
- (NSString)debugDescription;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendCustomEntityWithTag:(unint64_t)a3 stringRepresentation:(id)a4;
- (void)appendInnerTextWithConsumableNode:(id)a3;
- (void)appendNewline;
- (void)appendRange:(_NSRange)a3 ofString:(id)a4;
- (void)appendString:(id)a3;
@end

@implementation ECMessageBodyStringAccumulator

- (ECMessageBodyStringAccumulator)initWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ECMessageBodyStringAccumulator;
  v6 = [(ECMessageBodyStringAccumulator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_remainingLength = a4;
    v6->_options = a3;
    id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
    if ((a3 & 8) != 0) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = a4;
    }
    uint64_t v10 = [v8 initWithCapacity:v9];
    accumulatedString = v7->_accumulatedString;
    v7->_accumulatedString = (NSMutableString *)v10;

    v7->_lastEntity = 0;
    v7->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (NSString)debugDescription
{
  v3 = [(ECMessageBodyStringAccumulator *)self accumulatedString];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"␊", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"␍", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\t", @"␉", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @" ", @"␠", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @" ", @"␢", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"​", @"␢", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"‌", @"␢", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"‍", @"␢", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"⁠", @"␢", 0, 0, objc_msgSend(v4, "length"));
  v5 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __50__ECMessageBodyStringAccumulator_debugDescription__block_invoke;
  v14 = &unk_1E63EE880;
  v15 = self;
  v17 = v18;
  id v6 = v5;
  id v16 = v6;
  v7 = (void (**)(void, void, void))MEMORY[0x1C18A3120](&v11);
  if ((((uint64_t (*)(void, uint64_t, __CFString *))v7[2])(v7, 17, @".condenseWhitespace") & 1) == 0)
  {
    ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 16, @".condenseVerticalWhitespace");
    ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 1, @".condenseHorizontalWhitespace");
  }
  ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 2, @".resolveHTMLEntities");
  ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 4, @".parseSingleLine");
  ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 8, @".parseSingleNonWhitespaceCharacter");
  ((void (**)(void, uint64_t, __CFString *))v7)[2](v7, 32, @".condenseEmptyLines");
  [v6 appendString:@"]"];
  if (self->_remainingLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = @"unlimited";
  }
  else if ([(ECMessageBodyStringAccumulator *)self isFull])
  {
    id v8 = @"full";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"remaining=%llu", self->_remainingLength);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v9 = [NSString stringWithFormat:@"<%@: %p> %@ %@\n\t%@", objc_opt_class(), self, v6, v8, v4, v11, v12, v13, v14, v15];

  _Block_object_dispose(v18, 8);
  return (NSString *)v9;
}

BOOL __50__ECMessageBodyStringAccumulator_debugDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v7 = v6 & a2;
  if ((v6 & a2) == a2)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [*(id *)(a1 + 40) appendString:@", "];
    }
    [*(id *)(a1 + 40) appendString:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  return v7 == a2;
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (void)appendNewline
{
  if ((self->_options & 0x10) != 0) {
    v2 = @" ";
  }
  else {
    v2 = @"\n";
  }
  [(ECMessageBodyStringAccumulator *)self appendString:v2];
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  -[ECMessageBodyStringAccumulator appendRange:ofString:](self, "appendRange:ofString:", 0, [v4 length], v4);
}

- (void)appendRange:(_NSRange)a3 ofString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (length >= 0x3200001)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[ECMessageBodyStringAccumulator appendRange:ofString:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"ECMessageBodyStringAccumulator.m", 124, @"Temporary buffer too large or with a negative count (%zu).", length);
  }
  if (length <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = length;
  }
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)v15 - v9;
  memset((char *)v15 - v9, 170, v11);
  if (length > 0x400)
  {
    uint64_t v12 = (char *)malloc_type_calloc(v8, 2uLL, 0x1000040BDFB0063uLL);
  }
  else
  {
    bzero(v10, 2 * v8);
    uint64_t v12 = 0;
  }
  if (length >= 0x401) {
    uint64_t v10 = v12;
  }
  objc_msgSend(v7, "getCharacters:range:", v10, location, length);
  [(ECMessageBodyStringAccumulator *)self appendCharacters:v10 length:length];
  free(v12);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    id v7 = 0;
    unint64_t v8 = 0;
    unint64_t options = self->_options;
    BOOL v11 = (options & 9) == 0 || (self->_options & 0x18) == 0;
    unint64_t v44 = self->_options & 0x19;
    BOOL v42 = v11;
    char v12 = (options & 1) == 0 || v11;
    char v43 = v12;
    while (1)
    {
      if (self->_isFull)
      {
LABEL_140:

        return;
      }
      uint64_t v13 = a3[v8];
      unint64_t v14 = v8 + 1;
      if (!self->_options)
      {
        *(_DWORD *)v45 = (unsigned __int16)v13;
        goto LABEL_19;
      }
      if ((options & 0xA) == 2 && v13 == 38)
      {
        if (v7) {
          [(__CFString *)v7 setString:&stru_1F1A635E8];
        }
        else {
          id v7 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:20];
        }
        if (v8 + 21 >= a4) {
          unint64_t v18 = a4;
        }
        else {
          unint64_t v18 = v8 + 21;
        }
        if (v14 >= v18)
        {
          unint64_t v18 = v14;
        }
        else
        {
          unint64_t v19 = v14;
          while (1)
          {
            UniChar chars = a3[v19];
            int v20 = chars;
            unint64_t v21 = v19 + 1;
            if (chars <= 0x3Bu && ((1 << chars) & 0x800004100002600) != 0) {
              break;
            }
            CFStringAppendCharacters(v7, &chars, 1);
            ++v19;
            if (v18 == v21) {
              goto LABEL_42;
            }
          }
          UniChar v47 = 59;
          CFStringAppendCharacters(v7, &v47, 1);
          if (v20 == 59) {
            unint64_t v18 = v19 + 1;
          }
          else {
            unint64_t v18 = v19;
          }
        }
LABEL_42:
        unsigned int v23 = [(__CFString *)v7 ec_parseHTMLEntityCharacter];
        if (v23)
        {
          unint64_t v14 = v18;
          uint64_t v13 = v23;
        }
        else
        {
          uint64_t v13 = 38;
        }
      }
      v24 = objc_msgSend(MEMORY[0x1E4F28B88], "ec_whitespaceNewlineAndTagCharacterSet");
      int v25 = [v24 longCharacterIsMember:v13];

      if (!v25) {
        break;
      }
      v26 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      int v27 = [v26 longCharacterIsMember:v13];

      if (v27) {
        unint64_t v28 = 2;
      }
      else {
        unint64_t v28 = 1;
      }
      if ((options & 0x39) == 0)
      {
        char v35 = 0;
        unint64_t lastEntity = self->_lastEntity;
        int v34 = 1;
        goto LABEL_82;
      }
      unint64_t lastEntity = self->_lastEntity;
      if (options & ((options & 0x10) != 0) | options & (v27 ^ 1) & 1
        || (v27 & (options >> 4)) != 0)
      {
        int v34 = 0;
        if (!lastEntity) {
          unint64_t v28 = 0;
        }
        char v35 = 1;
        goto LABEL_82;
      }
      if (lastEntity != v28)
      {
        char v35 = 0;
        int v34 = 1;
        if ((options & 0x20) != 0 && lastEntity != 3)
        {
          if (lastEntity == 1 && self->_beforeLastEntity == 3) {
            int v34 = v27;
          }
          else {
            int v34 = 0;
          }
          char v35 = v34 ^ 1;
        }
        goto LABEL_82;
      }
      if ((options & 0x20) != 0)
      {
        self->_unint64_t lastEntity = v28;
        self->_beforeLastEntity = v28;
        goto LABEL_139;
      }
      if ((options & 9) != 0) {
        int v30 = v27;
      }
      else {
        int v30 = 1;
      }
      if ((options & 0x18) != 0) {
        char v31 = v27;
      }
      else {
        char v31 = 0;
      }
      self->_unint64_t lastEntity = v28;
      self->_beforeLastEntity = v28;
      if (v30 != 1 || (v31 & 1) != 0) {
        goto LABEL_139;
      }
      int v17 = 1;
LABEL_124:
      *(_DWORD *)v45 = 0;
      if ((v13 - 0x10000) >= 0x100000)
      {
        v45[0] = v13;
        if (!v17)
        {
LABEL_127:
          CFIndex v41 = 1;
          goto LABEL_128;
        }
LABEL_19:
        unint64_t remainingLength = self->_remainingLength;
        if (remainingLength <= 1 && (v13 & 0xFC00) == 55296)
        {
          self->_isFull = 1;
          goto LABEL_132;
        }
        int v17 = 1;
        goto LABEL_127;
      }
      v45[0] = ((v13 + 67043328) >> 10) - 10240;
      v45[1] = v13 & 0x3FF | 0xDC00;
      CFIndex v41 = 2;
LABEL_128:
      CFStringAppendCharacters((CFMutableStringRef)self->_accumulatedString, v45, v41);
      unint64_t remainingLength = self->_remainingLength;
      if (v17 && remainingLength && remainingLength != 0x7FFFFFFFFFFFFFFFLL) {
        self->_unint64_t remainingLength = --remainingLength;
      }
LABEL_132:
      if (remainingLength)
      {
        if ((options & 8) != 0) {
          goto LABEL_136;
        }
      }
      else
      {
        self->_isFull = 1;
        if ((options & 8) != 0)
        {
LABEL_136:
          if (self->_lastEntity == 3
            && ([(NSMutableString *)self->_accumulatedString ec_isWhitespace] & 1) == 0)
          {
            self->_isFull = 1;
          }
        }
      }
LABEL_139:
      unint64_t v8 = v14;
      if (v14 >= a4) {
        goto LABEL_140;
      }
    }
    v32 = objc_msgSend(MEMORY[0x1E4F28B88], "ec_ignorableCharacterSet");
    int v33 = [v32 longCharacterIsMember:v13];

    if (v33)
    {
      int v17 = 0;
      int v34 = 0;
      unint64_t v28 = self->_lastEntity;
      unint64_t lastEntity = v28;
      goto LABEL_120;
    }
    v36 = objc_msgSend(MEMORY[0x1E4F28B88], "ec_zeroWidthCharacterSet");
    int v37 = [v36 longCharacterIsMember:v13];

    unint64_t lastEntity = self->_lastEntity;
    if (v37)
    {
      self->_beforeLastEntity = lastEntity;
      int v17 = 0;
      if (lastEntity == 3) {
        self->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_124;
    }
    char v35 = 0;
    int v34 = 1;
    unint64_t v28 = 3;
LABEL_82:
    int v17 = 1;
    if (v28 == lastEntity || lastEntity - 1 > 1)
    {
LABEL_120:
      self->_unint64_t lastEntity = v28;
      self->_beforeLastEntity = lastEntity;
      if (v28 == 3)
      {
        self->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
        if ((v34 & 1) == 0) {
          goto LABEL_139;
        }
      }
      else if (!v34)
      {
        goto LABEL_139;
      }
      goto LABEL_124;
    }
    if ((options & 4) != 0 && lastEntity == 2)
    {
      int v34 = 0;
      int v17 = 1;
      self->_isFull = 1;
      goto LABEL_120;
    }
    if (v44 == 16)
    {
      if (v28 == 2 || lastEntity != 2)
      {
LABEL_99:
        if ((options & 0x20) == 0 || self->_beforeLastEntity == 2) {
          goto LABEL_119;
        }
        if (v28 == 3 || lastEntity == 1) {
          char v35 = 1;
        }
        if (v35) {
          goto LABEL_119;
        }
        unint64_t lastEntity = 2;
LABEL_109:
        UniChar v46 = -21846;
        if (!v42) {
          goto LABEL_112;
        }
        goto LABEL_110;
      }
    }
    else if (v44 != 1 || v28 == 1 || lastEntity != 1)
    {
      if ((v43 & 1) == 0 && (options & 0x10) != 0 && v28 - 3 < 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_109;
      }
      goto LABEL_99;
    }
    UniChar v46 = -21846;
LABEL_110:
    if (lastEntity == 2)
    {
      UniChar v46 = 10;
LABEL_115:
      CFStringAppendCharacters((CFMutableStringRef)self->_accumulatedString, &v46, 1);
      unint64_t v40 = self->_remainingLength;
      if (v40 && v40 != 0x7FFFFFFFFFFFFFFFLL) {
        self->_unint64_t remainingLength = v40 - 1;
      }
      unint64_t lastEntity = self->_lastEntity;
LABEL_119:
      int v17 = 1;
      goto LABEL_120;
    }
    if (lastEntity != 1) {
      goto LABEL_115;
    }
LABEL_112:
    UniChar v46 = 32;
    goto LABEL_115;
  }
}

- (void)appendCustomEntityWithTag:(unint64_t)a3 stringRepresentation:(id)a4
{
  id v6 = a4;
  if (self->_lastCustomEntityTag != a3)
  {
    id v7 = v6;
    if (self->_lastEntity == 3) {
      [(ECMessageBodyStringAccumulator *)self appendString:@" "];
    }
    [(ECMessageBodyStringAccumulator *)self appendString:v7];
    [(ECMessageBodyStringAccumulator *)self appendString:@" "];
    self->_lastCustomEntityTag = a3;
    id v6 = v7;
  }
}

- (void)appendInnerTextWithConsumableNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
  while ([v5 count] && !-[ECMessageBodyStringAccumulator isFull](self, "isFull"))
  {
    id v6 = (void *)MEMORY[0x1C18A2EF0]();
    id v7 = [v5 lastObject];
    unint64_t v8 = (void *)[v7 copyConsumableNodesAndAppendInnerTextToStringAccumulator:self];
    [v5 removeLastObject];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v9 = [v8 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (NSString)accumulatedString
{
  return (NSString *)self->_accumulatedString;
}

- (void).cxx_destruct
{
}

@end
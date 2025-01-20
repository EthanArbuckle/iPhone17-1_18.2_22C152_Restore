@interface ECEncodedWordDecoder
- (BOOL)_decodeBEncodedTextToData:(id)a3;
- (BOOL)_decodeQEncodedTextToData:(id)a3;
- (BOOL)decodeEncodedTextToData:(id)a3;
- (ECEncodedWordDecoder)init;
- (ECEncodedWordDecoder)initWithHeaderData:(id)a3;
- (NSData)headerData;
- (NSNumber)stringEncoding;
- (NSString)language;
- (_NSRange)encodedTextRange;
- (_NSRange)identifyRangeOfEncodedWordAtIndex:(unint64_t)a3;
- (id)_encodedWordDelimiter;
- (id)_encodedWordEndSequence;
- (id)_encodedWordLanguageDelimiter;
- (id)_encodedWordStartSequence;
- (id)_lineSeparator;
- (int64_t)encodedWordEncoding;
- (void)_enumerateQByteRangesUsingBlock:(id)a3;
- (void)setEncodedTextRange:(_NSRange)a3;
- (void)setEncodedWordEncoding:(int64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setStringEncoding:(id)a3;
@end

@implementation ECEncodedWordDecoder

- (ECEncodedWordDecoder)initWithHeaderData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECEncodedWordDecoder;
  v5 = [(ECEncodedWordDecoder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    headerData = v5->_headerData;
    v5->_headerData = (NSData *)v6;

    *(_OWORD *)&v5->_encodedWordEncoding = xmmword_1BF1773F0;
    v5->_encodedTextRange.length = 0;
  }

  return v5;
}

- (ECEncodedWordDecoder)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 101, @"Invalid initializer called, returning nil" object file lineNumber description];

  return 0;
}

- (_NSRange)identifyRangeOfEncodedWordAtIndex:(unint64_t)a3
{
  uint64_t v6 = [(ECEncodedWordDecoder *)self headerData];
  v55 = v6;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7 - a3;
  if (v7 <= a3)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 111, @"Invalid parameter not satisfying: %@", @"index < headerLength" object file lineNumber description];
  }
  objc_super v9 = [(ECEncodedWordDecoder *)self _encodedWordStartSequence];
  uint64_t v10 = objc_msgSend(v6, "rangeOfData:options:range:", v9, 2, a3, v8);
  uint64_t v12 = v11;

  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 0;
    uint64_t v54 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v18 = [(ECEncodedWordDecoder *)self _lineSeparator];
    uint64_t v19 = v12 + a3;
    uint64_t v20 = v8 - v12;
    uint64_t v21 = objc_msgSend(v55, "rangeOfData:options:range:", v18, 0, v12 + a3, v20);

    if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v20 = v21 - v19;
    }
    v22 = [(ECEncodedWordDecoder *)self _encodedWordDelimiter];
    uint64_t v23 = objc_msgSend(v55, "rangeOfData:options:range:", v22, 0, v12 + a3, v20);
    uint64_t v16 = v23;
    uint64_t v14 = v24;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {

      uint64_t v54 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v6 = v55;
      goto LABEL_13;
    }
    uint64_t v25 = v20 + v19;
    uint64_t v26 = v20 + v19 - (v23 + v24);
    uint64_t v6 = v55;
    uint64_t v27 = objc_msgSend(v55, "rangeOfData:options:range:", v22, 0, v23 + v24, v26);
    uint64_t v54 = v28;
    uint64_t v29 = v27;

    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = [(ECEncodedWordDecoder *)self _encodedWordEndSequence];
      uint64_t v17 = objc_msgSend(v55, "rangeOfData:options:range:", v52, 0, v29 + v54, v25 - (v29 + v54));
      uint64_t v15 = v30;

      uint64_t v13 = v29;
      goto LABEL_13;
    }
    uint64_t v15 = 0;
  }
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  uint64_t v31 = 0;
  uint64_t v53 = v13;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v13 - v16 == 2)
  {
    unsigned __int8 v56 = 0;
    objc_msgSend(v6, "getBytes:range:", &v56, v16 + v14, 1);
    uint64_t v31 = 0;
    if (v56 > 0x61u)
    {
      if (v56 != 98)
      {
        if (v56 != 113) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    else if (v56 != 66)
    {
      if (v56 != 81) {
        goto LABEL_23;
      }
LABEL_21:
      uint64_t v31 = 2;
      goto LABEL_23;
    }
    uint64_t v31 = 1;
  }
LABEL_23:
  [(ECEncodedWordDecoder *)self setEncodedWordEncoding:v31];
  if (v31)
  {
    v32 = [(ECEncodedWordDecoder *)self _encodedWordLanguageDelimiter];
    uint64_t v33 = v10 + v12;
    uint64_t v34 = v16 - (v10 + v12);
    uint64_t v35 = objc_msgSend(v6, "rangeOfData:options:range:", v32, 0, v33, v34);
    uint64_t v37 = v36;
    NSUInteger v38 = v15 - a3 + v17;

    uint64_t v39 = v16 - (v35 + v37);
    if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v40 = v34;
    }
    else {
      uint64_t v40 = v35 - v33;
    }
    if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v41 = v35 + v37;
    }
    if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = v39;
    }
    if (v40)
    {
      v43 = [v55 subdataWithRange:v33];
      CFStringRef v44 = (const __CFString *)[[NSString alloc] initWithData:v43 encoding:1];
      v45 = (__CFString *)v44;
      if (v44)
      {
        v46 = ECConvertCharacterSetNameToEncoding(v44);
      }
      else
      {
        v46 = 0;
      }
    }
    else
    {
      v46 = 0;
    }
    [(ECEncodedWordDecoder *)self setStringEncoding:v46];
    if (v42)
    {
      v47 = objc_msgSend(v55, "subdataWithRange:", v41, v42);
      v48 = (void *)[[NSString alloc] initWithData:v47 encoding:1];
    }
    else
    {
      v48 = 0;
    }
    uint64_t v6 = v55;
    [(ECEncodedWordDecoder *)self setLanguage:v48];
    -[ECEncodedWordDecoder setEncodedTextRange:](self, "setEncodedTextRange:", v53 + v54, v17 - (v53 + v54));
  }
  else
  {
    [(ECEncodedWordDecoder *)self setStringEncoding:0];
    [(ECEncodedWordDecoder *)self setLanguage:0];
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    -[ECEncodedWordDecoder setEncodedTextRange:](self, "setEncodedTextRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    NSUInteger v38 = 0;
  }

  NSUInteger v49 = a3;
  NSUInteger v50 = v38;
  result.length = v50;
  result.location = v49;
  return result;
}

- (id)_encodedWordStartSequence
{
  if (_encodedWordStartSequence_onceToken != -1) {
    dispatch_once(&_encodedWordStartSequence_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_encodedWordStartSequence_encodedWordStartSequence;
  return v2;
}

uint64_t __49__ECEncodedWordDecoder__encodedWordStartSequence__block_invoke()
{
  _encodedWordStartSequence_encodedWordStartSequence = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kEncodedWordStartSequence length:2];
  return MEMORY[0x1F41817F8]();
}

- (id)_lineSeparator
{
  if (_lineSeparator_onceToken != -1) {
    dispatch_once(&_lineSeparator_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_lineSeparator_lineSeparator;
  return v2;
}

uint64_t __38__ECEncodedWordDecoder__lineSeparator__block_invoke()
{
  _lineSeparator_lineSeparator = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kLineSeparator length:1];
  return MEMORY[0x1F41817F8]();
}

- (id)_encodedWordEndSequence
{
  if (_encodedWordEndSequence_onceToken != -1) {
    dispatch_once(&_encodedWordEndSequence_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_encodedWordEndSequence_encodedWordEndSequence;
  return v2;
}

uint64_t __47__ECEncodedWordDecoder__encodedWordEndSequence__block_invoke()
{
  _encodedWordEndSequence_encodedWordEndSequence = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kEncodedWordEndSequence length:2];
  return MEMORY[0x1F41817F8]();
}

- (id)_encodedWordDelimiter
{
  if (_encodedWordDelimiter_onceToken != -1) {
    dispatch_once(&_encodedWordDelimiter_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)_encodedWordDelimiter_encodedWordDelimiter;
  return v2;
}

uint64_t __45__ECEncodedWordDecoder__encodedWordDelimiter__block_invoke()
{
  _encodedWordDelimiter_encodedWordDelimiter = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kEncodedWordDelimiter length:1];
  return MEMORY[0x1F41817F8]();
}

- (id)_encodedWordLanguageDelimiter
{
  if (_encodedWordLanguageDelimiter_onceToken != -1) {
    dispatch_once(&_encodedWordLanguageDelimiter_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)_encodedWordLanguageDelimiter_encodedWordLanguageDelimiter;
  return v2;
}

uint64_t __53__ECEncodedWordDecoder__encodedWordLanguageDelimiter__block_invoke()
{
  _encodedWordLanguageDelimiter_encodedWordLanguageDelimiter = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kEncodedWordLanguageDelimiter length:1];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)decodeEncodedTextToData:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ECEncodedWordDecoder *)self encodedWordEncoding];
  if (v5 == 1)
  {
    [(ECEncodedWordDecoder *)self encodedTextRange];
    if (v8)
    {
      BOOL v7 = [(ECEncodedWordDecoder *)self _decodeBEncodedTextToData:v4];
      goto LABEL_7;
    }
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_10;
  }
  if (v5 != 2)
  {
    BOOL v9 = 0;
    goto LABEL_10;
  }
  [(ECEncodedWordDecoder *)self encodedTextRange];
  if (!v6) {
    goto LABEL_9;
  }
  BOOL v7 = [(ECEncodedWordDecoder *)self _decodeQEncodedTextToData:v4];
LABEL_7:
  BOOL v9 = v7;
LABEL_10:

  return v9;
}

- (BOOL)_decodeBEncodedTextToData:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ECEncodedWordDecoder *)self headerData];
  uint64_t v6 = [(ECEncodedWordDecoder *)self encodedTextRange];
  uint64_t v8 = objc_msgSend(v5, "subdataWithRange:", v6, v7);

  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v8 options:1];
  if (v9) {
    [v4 appendData:v9];
  }

  return v9 != 0;
}

- (BOOL)_decodeQEncodedTextToData:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  [(ECEncodedWordDecoder *)self encodedTextRange];
  unint64_t v16 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke;
  v12[3] = &unk_1E63EE5A8;
  v12[4] = &v13;
  [(ECEncodedWordDecoder *)self _enumerateQByteRangesUsingBlock:v12];
  uint64_t v6 = [v4 length];
  [v4 increaseLengthBy:v14[3]];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  id v7 = v4;
  unint64_t v11 = [v7 mutableBytes] + v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke_2;
  v9[3] = &unk_1E63EE5A8;
  v9[4] = v10;
  [(ECEncodedWordDecoder *)self _enumerateQByteRangesUsingBlock:v9];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v13, 8);

  return 1;
}

uint64_t __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) -= 2;
  }
  return result;
}

uint64_t __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke_2(uint64_t result, unsigned __int8 *__src, size_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a4 == 2)
  {
    uint64_t v9 = a3;
    uint64_t v7 = result + 32;
    _NSRange result = (uint64_t)memcpy(*(void **)(*(void *)(*(void *)(result + 32) + 8) + 24), __src, a3);
  }
  else
  {
    if (a4 == 1)
    {
      uint64_t v7 = result + 32;
      **(unsigned char **)(*(void *)(*(void *)(result + 32) + 8) + 24) = 32;
    }
    else
    {
      if (a4) {
        return result;
      }
      char v6 = __maskrune(__src[1], 0xFuLL);
      _NSRange result = __maskrune(__src[2], 0xFuLL);
      uint64_t v8 = *(void *)(v5 + 32);
      uint64_t v7 = v5 + 32;
      **(unsigned char **)(*(void *)(v8 + 8) + 24) = result + 16 * v6;
    }
    uint64_t v9 = 1;
  }
  *(void *)(*(void *)(*(void *)v7 + 8) + 24) += v9;
  return result;
}

- (void)_enumerateQByteRangesUsingBlock:(id)a3
{
  uint64_t v23 = (void (**)(void))a3;
  uint64_t v4 = [(ECEncodedWordDecoder *)self encodedTextRange];
  uint64_t v6 = v5;
  id v7 = [(ECEncodedWordDecoder *)self headerData];
  uint64_t v8 = [v7 bytes];

  if (v6 <= 0)
  {
    v22 = v23;
    goto LABEL_26;
  }
  uint64_t v9 = 0;
  uint64_t v10 = (unsigned __int8 *)(v8 + v4);
  unint64_t v11 = (unint64_t)&v10[v6];
  uint64_t v12 = v23;
  uint64_t v13 = v23 + 2;
  uint64_t v14 = MEMORY[0x1E4F14390];
  do
  {
    int v15 = *v10;
    if (v15 == 95)
    {
      uint64_t v17 = v12;
      v18 = v17;
      if (v9) {
        ((void (*)(void (**)(void), unsigned __int8 *, int64_t, uint64_t))*v13)(v17, v9, v10 - v9, 2);
      }
      ((void (*)(void (**)(void), unsigned __int8 *, uint64_t, uint64_t))*v13)(v18, v10, 1, 1);

      uint64_t v9 = 0;
      uint64_t v16 = 1;
      goto LABEL_14;
    }
    if (v15 != 61) {
      goto LABEL_8;
    }
    if ((unint64_t)(v10 + 2) < v11)
    {
      if ((*(_DWORD *)(v14 + 4 * v10[1] + 60) & 0x10000) != 0
        && (*(_DWORD *)(v14 + 4 * v10[2] + 60) & 0x10000) != 0)
      {
        uint64_t v19 = v12;
        uint64_t v20 = v19;
        if (v9) {
          ((void (*)(void (**)(void), unsigned __int8 *, int64_t, uint64_t))*v13)(v19, v9, v10 - v9, 2);
        }
        ((void (*)(void (**)(void), unsigned __int8 *, uint64_t, void))*v13)(v20, v10, 3, 0);

        uint64_t v9 = 0;
        uint64_t v16 = 3;
LABEL_14:
        uint64_t v12 = v23;
        goto LABEL_18;
      }
LABEL_8:
      if (!v9) {
        uint64_t v9 = v10;
      }
      uint64_t v16 = 1;
      goto LABEL_18;
    }
    if (!v9) {
      uint64_t v9 = v10;
    }
    uint64_t v16 = v11 - (void)v10;
LABEL_18:
    v10 += v16;
  }
  while ((unint64_t)v10 < v11);
  uint64_t v21 = v12;
  if (v9) {
    (*v13)();
  }
LABEL_26:
}

- (NSNumber)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSData)headerData
{
  return self->_headerData;
}

- (int64_t)encodedWordEncoding
{
  return self->_encodedWordEncoding;
}

- (void)setEncodedWordEncoding:(int64_t)a3
{
  self->_encodedWordEncoding = a3;
}

- (_NSRange)encodedTextRange
{
  NSUInteger length = self->_encodedTextRange.length;
  NSUInteger location = self->_encodedTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEncodedTextRange:(_NSRange)a3
{
  self->_encodedTextRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerData, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_stringEncoding, 0);
}

@end
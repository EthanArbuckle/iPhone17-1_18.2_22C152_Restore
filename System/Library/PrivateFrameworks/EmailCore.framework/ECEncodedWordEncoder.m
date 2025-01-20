@interface ECEncodedWordEncoder
- (BOOL)_getBytesWithoutSplittingComposedCharacters:(void *)a3 targetQEncodedTextLength:(unint64_t)a4 usedLength:(unint64_t *)a5 splitComposedCharacterSequence:(BOOL *)a6 usedQEncodedTextLength:(unint64_t *)a7 extraLength:(unint64_t *)a8 extraQEncodedTextLength:(unint64_t *)a9 fromString:(id)a10 stringEncoding:(unint64_t)a11 range:(_NSRange)a12 remainingRange:(_NSRange *)a13;
- (ECEncodedWordEncoder)init;
- (ECEncodedWordEncoder)initWithString:(id)a3 stringEncoding:(unint64_t)a4 language:(id)a5;
- (NSData)decodedText;
- (NSString)characterSet;
- (NSString)language;
- (NSString)string;
- (const)_findNextByteThatNeedsQEncodingBetweenStartByte:(const char *)a3 endByte:(const char *)a4;
- (id)description;
- (int64_t)encodedWordEncoding;
- (unint64_t)_bEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4;
- (unint64_t)_lengthOfQEncodedTextForBytes:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)_qEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4;
- (unint64_t)_writeEncodedWordPreambleToBuffer:(char *)a3 length:(unint64_t)a4;
- (unint64_t)encodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4;
- (unint64_t)minimumLengthOfEncodedWord;
- (unint64_t)singleEncodedWordLength;
- (unint64_t)stringEncoding;
- (void)_prepareForEncoding;
- (void)_writeQEncodedTextAndEndSequenceToHeaderBytes:(char *)a3 fromDecodedBytes:(const char *)a4 length:(unint64_t)a5;
- (void)setCharacterSet:(id)a3;
- (void)setDecodedText:(id)a3;
- (void)setEncodedWordEncoding:(int64_t)a3;
- (void)setSingleEncodedWordLength:(unint64_t)a3;
@end

@implementation ECEncodedWordEncoder

- (ECEncodedWordEncoder)initWithString:(id)a3 stringEncoding:(unint64_t)a4 language:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (![v9 length])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 417, @"Invalid parameter not satisfying: %@", @"string.length" object file lineNumber description];
  }
  if (([v9 canBeConvertedToEncoding:a4] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 418, @"Invalid parameter not satisfying: %@", @"[string canBeConvertedToEncoding:stringEncoding]" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)ECEncodedWordEncoder;
  v11 = [(ECEncodedWordEncoder *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v11->_stringEncoding = a4;
    uint64_t v14 = [v10 copy];
    language = v11->_language;
    v11->_language = (NSString *)v14;

    v11->_encodedWordEncoding = 0;
  }

  return v11;
}

- (ECEncodedWordEncoder)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 432, @"Invalid initializer called, returning nil" object file lineNumber description];

  return 0;
}

- (id)description
{
  unint64_t v3 = [(ECEncodedWordEncoder *)self stringEncoding];
  v4 = [(ECEncodedWordEncoder *)self string];
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ECEncodedWordEncoder;
  v6 = [(ECEncodedWordEncoder *)&v11 description];
  v7 = ECConvertEncodingToCharacterSetName(v3);
  v8 = [(ECEncodedWordEncoder *)self language];
  id v9 = [v5 stringWithFormat:@"%@ %lu (%@*%@) <%@: %p>", v6, v3, v7, v8, objc_opt_class(), v4];

  return v9;
}

- (unint64_t)minimumLengthOfEncodedWord
{
  [(ECEncodedWordEncoder *)self _prepareForEncoding];
  return [(ECEncodedWordEncoder *)self singleEncodedWordLength];
}

- (void)_prepareForEncoding
{
  if (![(ECEncodedWordEncoder *)self encodedWordEncoding])
  {
    unint64_t v4 = [(ECEncodedWordEncoder *)self stringEncoding];
    id v21 = [(ECEncodedWordEncoder *)self string];
    unint64_t v5 = [v21 lengthOfBytesUsingEncoding:v4];
    if (v5 == 3 * (v5 / 3)) {
      unint64_t v6 = 4 * (v5 / 3);
    }
    else {
      unint64_t v6 = 4 * (v5 / 3) + 4;
    }
    if (ECEncodingIsASCIISuperset(v4))
    {
      id v7 = [v21 dataUsingEncoding:v4];
      unint64_t v8 = -[ECEncodedWordEncoder _lengthOfQEncodedTextForBytes:length:](self, "_lengthOfQEncodedTextForBytes:length:", [v7 bytes], objc_msgSend(v7, "length"));
      if (v8 > v6) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }
      if (v8 <= v6) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 4;
      }
      if (v8 < v6) {
        unint64_t v6 = v8;
      }
    }
    else
    {
      id v7 = 0;
      uint64_t v10 = 4;
      uint64_t v9 = 1;
    }
    [(ECEncodedWordEncoder *)self setEncodedWordEncoding:v9];
    objc_super v11 = ECConvertEncodingToCharacterSetName(v4);
    uint64_t v12 = [v11 lengthOfBytesUsingEncoding:1];
    if (!v12)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 489, @"Character set %@ is not encodable in ASCII", v11 object file lineNumber description];
    }
    [(ECEncodedWordEncoder *)self setCharacterSet:v11];
    v13 = [(ECEncodedWordEncoder *)self language];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 lengthOfBytesUsingEncoding:1];
      if (!v15)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 496, @"Language %@ is not encodable in ASCII", v14 object file lineNumber description];
      }
      uint64_t v16 = v15 + 1;
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v12 + v16 + 5;
    if ((unint64_t)(v10 + v17 - 74) <= 0xFFFFFFFFFFFFFFB3)
    {
      objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"ECEncodedWord.m", 507, @"Impossible to make an encoded-word with character set \"%@\" and language \"%@\"", v11, v14 object file lineNumber description];
    }
    if (v6 + v17 + 2 <= 0x4B) {
      [(ECEncodedWordEncoder *)self setDecodedText:v7];
    }
    [(ECEncodedWordEncoder *)self setSingleEncodedWordLength:v6 + v17 + 2];
  }
}

- (unint64_t)encodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  id v7 = a3;
  [(ECEncodedWordEncoder *)self _prepareForEncoding];
  int64_t v8 = [(ECEncodedWordEncoder *)self encodedWordEncoding];
  if (v8 == 1)
  {
    unint64_t v9 = [(ECEncodedWordEncoder *)self _bEncodeToHeaderData:v7 currentLineLength:a4];
  }
  else
  {
    if (v8 != 2)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"ECEncodedWord.m" lineNumber:533 description:@"Could not determine encoded-word encoding"];

      goto LABEL_7;
    }
    unint64_t v9 = [(ECEncodedWordEncoder *)self _qEncodeToHeaderData:v7 currentLineLength:a4];
  }
  a4 = v9;
LABEL_7:

  return a4;
}

- (unint64_t)_writeEncodedWordPreambleToBuffer:(char *)a3 length:(unint64_t)a4
{
  *(_WORD *)a3 = 16189;
  int64_t v8 = a3 + 2;
  unint64_t v9 = [(ECEncodedWordEncoder *)self characterSet];
  uint64_t v21 = 0;
  unint64_t v10 = a4 - 2;
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, a4 - 2, &v21, 1, 2, 0, objc_msgSend(v9, "length"), 0);
  uint64_t v11 = v21;
  uint64_t v12 = [(ECEncodedWordEncoder *)self language];
  v13 = v12;
  uint64_t v14 = &v8[v11];
  if (v12)
  {
    *uint64_t v14 = 42;
    uint64_t v15 = v14 + 1;
    uint64_t v20 = 0;
    objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v15, v10 + ~v11, &v20, 1, 2, 0, objc_msgSend(v12, "length"), 0);
    uint64_t v14 = &v15[v20];
  }
  *uint64_t v14 = 63;
  int64_t v16 = [(ECEncodedWordEncoder *)self encodedWordEncoding];
  if (v16 == 1)
  {
    char v17 = 66;
  }
  else
  {
    if (v16 != 2)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"ECEncodedWord.m" lineNumber:588 description:@"Could not determine encoded-word encoding"];

      goto LABEL_9;
    }
    char v17 = 81;
  }
  v14[1] = v17;
LABEL_9:
  v14[2] = 63;

  return v14 - a3 + 3;
}

- (unint64_t)_bEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = 76 - a4;
  if (76 - a4 >= 0x4B) {
    unint64_t v7 = 75;
  }
  if (a4 >= 0x4C) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }
  unint64_t v9 = [(ECEncodedWordEncoder *)self singleEncodedWordLength];
  if (v8 >= v9)
  {
    uint64_t v25 = [v6 length];
    [v6 increaseLengthBy:v9];
    uint64_t v26 = [v6 mutableBytes] + v25;
    unint64_t v27 = [(ECEncodedWordEncoder *)self _writeEncodedWordPreambleToBuffer:v26 length:v9];
    v28 = self;
    v29 = [(ECEncodedWordEncoder *)self decodedText];
    if (!v29)
    {
      v30 = [(ECEncodedWordEncoder *)v28 string];
      v29 = objc_msgSend(v30, "dataUsingEncoding:", -[ECEncodedWordEncoder stringEncoding](v28, "stringEncoding"));
    }
    v31 = [v29 base64EncodedDataWithOptions:0];
    uint64_t v32 = [v31 length];
    unint64_t v33 = v26 + v27;
    [v31 getBytes:v33 length:v32];
    *(_WORD *)(v33 + v32) = 15679;
    unint64_t v34 = v9 + a4;

    goto LABEL_37;
  }
  memset(__src, 0, 75);
  v55 = self;
  size_t v10 = [(ECEncodedWordEncoder *)self _writeEncodedWordPreambleToBuffer:__src length:75];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:3 * ((73 - v10) >> 2)];
  v58 = [(ECEncodedWordEncoder *)v55 string];
  uint64_t v57 = [(ECEncodedWordEncoder *)v55 stringEncoding];
  uint64_t v12 = [v58 length];
  *(void *)&long long v61 = 0;
  *((void *)&v61 + 1) = v12;
  v13 = &off_1BF177000;
  if (v8 >= v10 + 6)
  {
    unint64_t v53 = (v8 - v10 - 2) >> 2;
    [v11 setLength:3 * v53];
    uint64_t v60 = 0;
    id v14 = v11;
    uint64_t v15 = [v14 mutableBytes];
    long long v59 = xmmword_1BF177400;
    unint64_t v16 = v61;
    id v17 = v58;
    if ([v17 getBytes:v15 maxLength:3 * v53 usedLength:&v60 encoding:v57 options:2 range:v61 remainingRange:&v59])
    {
      if (!*((void *)&v59 + 1)) {
        goto LABEL_14;
      }
      unint64_t v18 = [v17 rangeOfComposedCharacterSequenceAtIndex:(void)v59];
      if (v18 >= (unint64_t)v59) {
        goto LABEL_14;
      }
      if (v18 > v16)
      {
        long long v62 = xmmword_1BF177400;
        if (objc_msgSend(v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v15, 3 * v53, &v60, v57, 2, v16, v18 - v16, &v62))
        {
          uint64_t v19 = v59 - v62 + *((void *)&v59 + 1);
          *(void *)&long long v59 = v62;
          *((void *)&v59 + 1) = v19;
LABEL_14:

          [v14 setLength:v60];
          uint64_t v20 = [v14 base64EncodedDataWithOptions:0];
          uint64_t v21 = [v20 length];
          uint64_t v22 = [v6 length];
          [v6 increaseLengthBy:v10 + v21 + 2];
          v23 = (char *)([v6 mutableBytes] + v22);
          memcpy(v23, __src, v10);
          v24 = &v23[v10];
          [v20 getBytes:v24 length:v21];
          *(_WORD *)&v24[v21] = 15679;
          long long v61 = v59;
          goto LABEL_15;
        }
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        v36 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL getBytesFromStringWithoutSplittingComposedCharacters(NSString * _Nonnull __strong, void * _Nonnull, NSUInteger, NSUInteger * _Nonnull, NSStringEncoding, NSRange, NSRangePointer _Nonnull, BOOL * _Nonnull)");
        [v35 handleFailureInFunction:v36 file:@"ECEncodedWord.m" lineNumber:745 description:@"Failed to get bytes from string"];

        uint64_t v37 = v59 - v62 + *((void *)&v59 + 1);
        *(void *)&long long v59 = v62;
        *((void *)&v59 + 1) = v37;
      }
    }

    v13 = &off_1BF177000;
    if (v53 < (73 - v10) >> 2) {
      goto LABEL_21;
    }
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:v55 file:@"ECEncodedWord.m" lineNumber:678 description:@"Failed to get bytes from string"];
LABEL_15:

    v13 = &off_1BF177000;
LABEL_21:
    uint64_t v12 = *((void *)&v61 + 1);
  }
  if (v12)
  {
    long long v54 = *((_OWORD *)v13 + 64);
    while (1)
    {
      [v11 setLength:3 * ((73 - v10) >> 2)];
      *(void *)&long long v59 = 0;
      id v38 = v11;
      uint64_t v39 = [v38 mutableBytes];
      long long v40 = v61;
      id v41 = v58;
      if (![v41 getBytes:v39 maxLength:3 * ((73 - v10) >> 2) usedLength:&v59 encoding:v57 options:2 range:v40 remainingRange:&v61])goto LABEL_32; {
      if (!*((void *)&v61 + 1))
      }
        goto LABEL_33;
      unint64_t v42 = [v41 rangeOfComposedCharacterSequenceAtIndex:(void)v61];
      if (v42 >= (unint64_t)v61) {
        goto LABEL_33;
      }
      if (v42 <= (unint64_t)v40)
      {

        id v41 = [MEMORY[0x1E4F28B00] currentHandler];
        [v41 handleFailureInMethod:a2 object:v55 file:@"ECEncodedWord.m" lineNumber:692 description:@"Can't make encoded-word without splitting a composed character sequence"];
      }
      else
      {
        long long v62 = v54;
        if ((objc_msgSend(v41, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v39, 3 * ((73 - v10) >> 2), &v59, v57, 2, (void)v40, v42 - (void)v40, &v62) & 1) == 0)
        {
          v44 = [MEMORY[0x1E4F28B00] currentHandler];
          v45 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL getBytesFromStringWithoutSplittingComposedCharacters(NSString * _Nonnull __strong, void * _Nonnull, NSUInteger, NSUInteger * _Nonnull, NSStringEncoding, NSRange, NSRangePointer _Nonnull, BOOL * _Nonnull)");
          [v44 handleFailureInFunction:v45 file:@"ECEncodedWord.m" lineNumber:745 description:@"Failed to get bytes from string"];

          uint64_t v46 = v61 - v62 + *((void *)&v61 + 1);
          *(void *)&long long v61 = v62;
          *((void *)&v61 + 1) = v46;
LABEL_32:

          id v41 = [MEMORY[0x1E4F28B00] currentHandler];
          [v41 handleFailureInMethod:a2 object:v55 file:@"ECEncodedWord.m" lineNumber:691 description:@"Failed to get bytes from string"];
          goto LABEL_33;
        }
        uint64_t v43 = v61 - v62 + *((void *)&v61 + 1);
        *(void *)&long long v61 = v62;
        *((void *)&v61 + 1) = v43;
      }
LABEL_33:

      [v38 setLength:(void)v59];
      v47 = [v38 base64EncodedDataWithOptions:0];
      uint64_t v48 = [v47 length];
      uint64_t v49 = [v6 length];
      [v6 increaseLengthBy:v10 + 4 + v48];
      v50 = (_WORD *)([v6 mutableBytes] + v49);
      *v50++ = 8202;
      memcpy(v50, __src, v10);
      v51 = (char *)v50 + v10;
      [v47 getBytes:v51 length:v48];
      *(_WORD *)&v51[v48] = 15679;

      if (!*((void *)&v61 + 1))
      {
        unint64_t v34 = v10 + v48 + 3;
        goto LABEL_36;
      }
    }
  }
  unint64_t v34 = 0;
LABEL_36:

LABEL_37:
  return v34;
}

- (unint64_t)_qEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = 76 - a4;
  if (76 - a4 >= 0x4B) {
    unint64_t v8 = 75;
  }
  if (a4 >= 0x4C) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v8;
  }
  unint64_t v10 = [(ECEncodedWordEncoder *)self singleEncodedWordLength];
  if (v9 >= v10)
  {
    uint64_t v21 = [v7 length];
    [v7 increaseLengthBy:v10];
    uint64_t v22 = [v7 mutableBytes] + v21;
    unint64_t v23 = [(ECEncodedWordEncoder *)self _writeEncodedWordPreambleToBuffer:v22 length:v10];
    id v24 = [(ECEncodedWordEncoder *)self decodedText];
    -[ECEncodedWordEncoder _writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:](self, "_writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:", v22 + v23, [v24 bytes], objc_msgSend(v24, "length"));
    unint64_t v25 = v10 + a4;
  }
  else
  {
    SEL v39 = a2;
    memset(__src, 0, 75);
    size_t v11 = [(ECEncodedWordEncoder *)self _writeEncodedWordPreambleToBuffer:__src length:75];
    long long v40 = &v38;
    size_t v12 = 73 - v11;
    uint64_t v13 = MEMORY[0x1F4188790]();
    uint64_t v15 = (char *)&v38 - v14;
    if (v13 != 73) {
      memset((char *)&v38 - v14, 170, v12);
    }
    size_t v48 = 0;
    uint64_t v49 = 0;
    size_t v46 = 0;
    unint64_t v47 = 0;
    id v42 = [(ECEncodedWordEncoder *)self string];
    unint64_t v16 = [(ECEncodedWordEncoder *)self stringEncoding];
    uint64_t v17 = [v42 length];
    *(void *)&long long v45 = 0;
    *((void *)&v45 + 1) = v17;
    size_t v41 = v11 + 3;
    if (v9 >= v11 + 3)
    {
      unint64_t v18 = v9 - v11 - 2;
      long long v44 = xmmword_1BF177400;
      char v43 = 0;
      if (!-[ECEncodedWordEncoder _getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:](self, "_getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:", v15, v18, &v49, &v43, &v47, &v48, &v46, v42, v16, 0, v17, &v44)|| v43|| v47 > v18)
      {
        if (v18 >= v12)
        {
          uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:v39 object:self file:@"ECEncodedWord.m" lineNumber:830 description:@"Failed to get bytes from string"];
        }
        size_t v48 = 0;
        size_t v46 = 0;
      }
      else
      {
        uint64_t v19 = [v7 length];
        [v7 increaseLengthBy:v11 + v47 + 2];
        uint64_t v20 = (char *)([v7 mutableBytes] + v19);
        memcpy(v20, __src, v11);
        [(ECEncodedWordEncoder *)self _writeQEncodedTextAndEndSequenceToHeaderBytes:&v20[v11] fromDecodedBytes:v15 length:v49];
        long long v45 = v44;
        if (v48) {
          memmove(v15, &v15[v49], v48);
        }
      }
      uint64_t v17 = *((void *)&v45 + 1);
    }
    if (v17)
    {
      do
      {
        LOBYTE(v44) = 0;
        if (!-[ECEncodedWordEncoder _getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:](self, "_getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:", v15, v12, &v49, &v44, &v47, &v48, &v46, v42, v16, (void)v45, v17, &v45))
        {
          v29 = [MEMORY[0x1E4F28B00] currentHandler];
          [v29 handleFailureInMethod:v39 object:self file:@"ECEncodedWord.m" lineNumber:843 description:@"Failed to get bytes from string"];
        }
        if ((_BYTE)v44)
        {
          v30 = [MEMORY[0x1E4F28B00] currentHandler];
          [v30 handleFailureInMethod:v39 object:self file:@"ECEncodedWord.m" lineNumber:844 description:@"Can't make encoded-word without splitting a composed character sequence"];
        }
        if (v47 > v12)
        {
          v31 = [MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInMethod:v39 object:self file:@"ECEncodedWord.m" lineNumber:845 description:@"Can't make encoded-word without splitting a composed character sequence"];
        }
        uint64_t v26 = [v7 length];
        [v7 increaseLengthBy:v11 + 4 + v47];
        unint64_t v27 = v47;
        v28 = (_WORD *)([v7 mutableBytes] + v26);
        *v28++ = 8202;
        memcpy(v28, __src, v11);
        [(ECEncodedWordEncoder *)self _writeQEncodedTextAndEndSequenceToHeaderBytes:(char *)v28 + v11 fromDecodedBytes:v15 length:v49];
        if (v48) {
          memmove(v15, &v15[v49], v48);
        }
        uint64_t v17 = *((void *)&v45 + 1);
      }
      while (*((void *)&v45 + 1));
      unint64_t v25 = v41 + v27;
    }
    else
    {
      unint64_t v25 = 0;
    }
    if (v48)
    {
      if (v46 > v12)
      {
        v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:v39 object:self file:@"ECEncodedWord.m" lineNumber:868 description:@"Can't make encoded-word without splitting a composed character sequence"];
      }
      uint64_t v32 = [v7 length];
      [v7 increaseLengthBy:v11 + v46 + 4];
      size_t v33 = v46;
      unint64_t v34 = (_WORD *)([v7 mutableBytes] + v32);
      *v34++ = 8202;
      memcpy(v34, __src, v11);
      [(ECEncodedWordEncoder *)self _writeQEncodedTextAndEndSequenceToHeaderBytes:(char *)v34 + v11 fromDecodedBytes:v15 length:v48];
      unint64_t v25 = v41 + v33;
    }
  }
  return v25;
}

- (BOOL)_getBytesWithoutSplittingComposedCharacters:(void *)a3 targetQEncodedTextLength:(unint64_t)a4 usedLength:(unint64_t *)a5 splitComposedCharacterSequence:(BOOL *)a6 usedQEncodedTextLength:(unint64_t *)a7 extraLength:(unint64_t *)a8 extraQEncodedTextLength:(unint64_t *)a9 fromString:(id)a10 stringEncoding:(unint64_t)a11 range:(_NSRange)a12 remainingRange:(_NSRange *)a13
{
  id v18 = a10;
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  unint64_t v49 = *a8;
  uint64_t v42 = 0;
  char v43 = &v42;
  uint64_t v44 = 0x2020000000;
  unint64_t v45 = *a9;
  *a8 = 0;
  *a9 = 0;
  a13->location = a12.location + a12.length;
  a13->length = 0;
  uint64_t v38 = 0;
  SEL v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __241__ECEncodedWordEncoder__getBytesWithoutSplittingComposedCharacters_targetQEncodedTextLength_usedLength_splitComposedCharacterSequence_usedQEncodedTextLength_extraLength_extraQEncodedTextLength_fromString_stringEncoding_range_remainingRange___block_invoke;
  v24[3] = &unk_1E63EE5D0;
  unint64_t v31 = a4;
  unint64_t v32 = a11;
  unint64_t v27 = &v46;
  v28 = &v38;
  id v25 = v18;
  uint64_t v26 = self;
  v29 = &v42;
  v30 = a3;
  size_t v33 = a6;
  unint64_t v34 = a8;
  v35 = a9;
  v36 = a13;
  _NSRange v37 = a12;
  id v19 = v18;
  objc_msgSend(v19, "enumerateSubstringsInRange:options:usingBlock:", a12.location, a12.length, 514, v24);
  *a5 = v47[3];
  *a7 = v43[3];
  char v20 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v20;
}

uint64_t __241__ECEncodedWordEncoder__getBytesWithoutSplittingComposedCharacters_targetQEncodedTextLength_usedLength_splitComposedCharacterSequence_usedQEncodedTextLength_extraLength_extraQEncodedTextLength_fromString_stringEncoding_range_remainingRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 72) + v11;
  uint64_t v13 = *(void *)(a1 + 80) - v11;
  uint64_t v22 = 0;
  long long v21 = xmmword_1BF177400;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v12, v13, &v22, *(void *)(a1 + 88), 0, a3, a4, &v21);
  if (!result
    || (uint64_t v15 = *((void *)&v21 + 1)) != 0 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a7 = 1;
    unint64_t v16 = *(uint64_t **)(a1 + 120);
    uint64_t v17 = *(void *)(a1 + 128) - a3 + *(void *)(a1 + 136);
    *unint64_t v16 = a3;
LABEL_5:
    v16[1] = v17;
    return result;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  **(unsigned char **)(a1 + 96) = v15 != 0;
  uint64_t result = [*(id *)(a1 + 40) _lengthOfQEncodedTextForBytes:v12 length:v22];
  unint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + result;
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v20 = *(void *)(v19 + 24);
  if (v18 > *(void *)(a1 + 80) && v20)
  {
    **(void **)(a1 + 104) = v22;
    **(void **)(a1 + 112) = result;
  }
  else
  {
    *(void *)(v19 + 24) = v20 + v22;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18;
  }
  if (v18 >= *(void *)(a1 + 80) || *((void *)&v21 + 1))
  {
    *a7 = 1;
    unint64_t v16 = *(uint64_t **)(a1 + 120);
    uint64_t v17 = *(void *)(a1 + 128) - (a3 + a4) + *(void *)(a1 + 136);
    *unint64_t v16 = a3 + a4;
    goto LABEL_5;
  }
  return result;
}

- (unint64_t)_lengthOfQEncodedTextForBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v6 = &a3[a4];
  id v7 = -[ECEncodedWordEncoder _findNextByteThatNeedsQEncodingBetweenStartByte:endByte:](self, "_findNextByteThatNeedsQEncodingBetweenStartByte:endByte:");
  if (v7)
  {
    unint64_t v8 = v7;
    do
    {
      int v10 = *(unsigned __int8 *)v8;
      unint64_t v9 = v8 + 1;
      if (v10 != 32) {
        v4 += 2;
      }
      unint64_t v8 = [(ECEncodedWordEncoder *)self _findNextByteThatNeedsQEncodingBetweenStartByte:v9 endByte:v6];
    }
    while (v8);
  }
  return v4;
}

- (void)_writeQEncodedTextAndEndSequenceToHeaderBytes:(char *)a3 fromDecodedBytes:(const char *)a4 length:(unint64_t)a5
{
  unint64_t v5 = a4;
  unint64_t v8 = &a4[a5];
  unint64_t v9 = [(ECEncodedWordEncoder *)self _findNextByteThatNeedsQEncodingBetweenStartByte:a4 endByte:&a4[a5]];
  if (v9)
  {
    int v10 = v9;
    do
    {
      if (v5 < v10)
      {
        memcpy(a3, v5, v10 - v5);
        a3 += v10 - v5;
      }
      if (*v10 == 32)
      {
        *a3 = 95;
        uint64_t v11 = 1;
      }
      else
      {
        *a3 = 61;
        a3[1] = byte_1BF177410[(unint64_t)*(unsigned __int8 *)v10 >> 4];
        a3[2] = byte_1BF177410[*v10 & 0xF];
        uint64_t v11 = 3;
      }
      a3 += v11;
      unint64_t v5 = v10 + 1;
      int v10 = [(ECEncodedWordEncoder *)self _findNextByteThatNeedsQEncodingBetweenStartByte:v10 + 1 endByte:v8];
    }
    while (v10);
  }
  if (v5 < v8)
  {
    size_t v12 = v8 - v5;
    memcpy(a3, v5, v12);
    a3 += v12;
  }
  *(_WORD *)a3 = 15679;
}

- (const)_findNextByteThatNeedsQEncodingBetweenStartByte:(const char *)a3 endByte:(const char *)a4
{
  if (_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__onceToken != -1) {
    dispatch_once(&_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__onceToken, &__block_literal_global_107);
  }
  if (a3 >= a4) {
    return 0;
  }
  int64_t v6 = a4 - a3;
  while (((*((unsigned __int8 *)&_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__bytesThatNeedEncoding
            + ((unint64_t)*(unsigned __int8 *)a3 >> 3)) >> (*a3 & 7)) & 1) == 0)
  {
    ++a3;
    if (!--v6) {
      return 0;
    }
  }
  return a3;
}

void __80__ECEncodedWordEncoder__findNextByteThatNeedsQEncodingBetweenStartByte_endByte___block_invoke()
{
  _findNextByteThatNeedsQEncodingBetweenStartByte_endByte__bytesThatNeedEncoding = -1;
  byte_1EA14408C |= 0xFDu;
  byte_1EA14408D |= 0x53u;
  byte_1EA14408F |= 0xFCu;
  byte_1EA144090 |= 1u;
  byte_1EA144093 |= 0xF8u;
  byte_1EA144094 |= 1u;
  byte_1EA144097 |= 0xF8u;
  qword_1EA144098 = -1;
  unk_1EA1440A0 = -1;
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)characterSet
{
  return self->_characterSet;
}

- (void)setCharacterSet:(id)a3
{
}

- (int64_t)encodedWordEncoding
{
  return self->_encodedWordEncoding;
}

- (void)setEncodedWordEncoding:(int64_t)a3
{
  self->_encodedWordEncoding = a3;
}

- (NSData)decodedText
{
  return self->_decodedText;
}

- (void)setDecodedText:(id)a3
{
}

- (unint64_t)singleEncodedWordLength
{
  return self->_singleEncodedWordLength;
}

- (void)setSingleEncodedWordLength:(unint64_t)a3
{
  self->_singleEncodedWordLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedText, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
@interface NSRegularExpression
+ (BOOL)supportsSecureCoding;
+ (NSRegularExpression)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error;
+ (NSString)escapedPatternForString:(NSString *)string;
+ (NSString)escapedTemplateForString:(NSString *)string;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSArray)matchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSRegularExpression)initWithCoder:(id)a3;
- (NSRegularExpression)initWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error;
- (NSRegularExpressionOptions)options;
- (NSString)pattern;
- (NSString)replacementStringForResult:(NSTextCheckingResult *)result inString:(NSString *)string offset:(NSInteger)offset template:(NSString *)templ;
- (NSString)stringByReplacingMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ;
- (NSTextCheckingResult)firstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSUInteger)numberOfCaptureGroups;
- (NSUInteger)numberOfMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSUInteger)replaceMatchesInString:(NSMutableString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ;
- (id)description;
- (unint64_t)_captureGroupNumberWithName:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range usingBlock:(void *)block;
@end

@implementation NSRegularExpression

+ (NSRegularExpression)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  v5 = (void *)[objc_alloc((Class)a1) initWithPattern:pattern options:options error:error];

  return (NSRegularExpression *)v5;
}

- (NSRegularExpression)initWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!pattern)
  {
    v19 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0]);
  }
  v21.receiver = self;
  v21.super_class = (Class)NSRegularExpression;
  v9 = [(NSRegularExpression *)&v21 init];
  if (v9)
  {
    UErrorCode status = U_ZERO_ERROR;
    memset(&pe, 0, sizeof(pe));
    v10 = pattern;
    if ((options & 4) != 0) {
      v10 = +[NSRegularExpression escapedPatternForString:pattern];
    }
    unint64_t v11 = [(NSString *)v10 length];
    CharactersPtr = (UniChar *)CFStringGetCharactersPtr((CFStringRef)v10);
    BOOL v13 = CharactersPtr == 0;
    if (!CharactersPtr)
    {
      if (v11 <= 0x100)
      {
        CharactersPtr = (UniChar *)v23;
        -[NSString getCharacters:range:](v10, "getCharacters:range:", v23, 0, v11);
        BOOL v13 = 0;
        goto LABEL_10;
      }
      v18 = (UniChar *)malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
      if (!v18)
      {
LABEL_21:
        if (v9->_internal)
        {
          v9->_pattern = (NSString *)[(NSString *)pattern copy];
          v9->_options = options;
        }
        else
        {

          return 0;
        }
        return v9;
      }
      CharactersPtr = v18;
      -[NSString getCharacters:range:](v10, "getCharacters:range:", v18, 0, v11);
    }
    if (v11 >= 0x7FFFFFFF)
    {
      BOOL v14 = 0;
      internal = (URegularExpression *)v9->_internal;
LABEL_11:
      if (internal) {
        BOOL v16 = !v14;
      }
      else {
        BOOL v16 = 0;
      }
      if (!v16)
      {
        if (error)
        {
          *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 2048, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"NSInvalidValue", 0));
          internal = (URegularExpression *)v9->_internal;
        }
        if (internal)
        {
          uregex_close(internal);
          v9->_internal = 0;
        }
      }
      if (v13) {
        free(CharactersPtr);
      }
      goto LABEL_21;
    }
LABEL_10:
    internal = uregex_open(CharactersPtr, v11, (4 * options) & 0x20 | (2 * (options & 3)) | (options >> 1) & 8 | (options >> 5) & 1 | (((options >> 6) & 1) << 8), &pe, &status);
    v9->_internal = internal;
    BOOL v14 = status > U_ZERO_ERROR;
    goto LABEL_11;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  internal = (URegularExpression *)self->_internal;
  if (internal)
  {
    uregex_close(internal);
    self->_internal = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSRegularExpression;
  [(NSRegularExpression *)&v4 dealloc];
}

- (NSUInteger)numberOfMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke;
  v7[3] = &unk_1E51FBBF8;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFDFFCLL | 0x2000, range.location, range.length, v7);
  NSUInteger v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSTextCheckingResult)firstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke;
  v7[3] = &unk_1E51FBBF8;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length, v7);
  NSUInteger v5 = (NSTextCheckingResult *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v13 = &unk_18246906D;
  long long v14 = xmmword_18235A300;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke;
  v9[3] = &unk_1E51FBBF8;
  v9[4] = &v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length, v9);
  NSUInteger v5 = v11[4];
  NSUInteger v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  NSUInteger v7 = v5;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)enumerateMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length = range.length;
  unint64_t location = range.location;
  __int16 v9 = options;
  v61[63] = *MEMORY[0x1E4F143B8];
  NSUInteger v13 = [(NSString *)string length];
  NSUInteger v14 = [(NSRegularExpression *)self numberOfCaptureGroups];
  unsigned __int8 v55 = 0;
  UErrorCode v54 = U_ZERO_ERROR;
  if (!string)
  {
    v49 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    v50 = (void *)MEMORY[0x1E4F1CA00];
    v51 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_117;
  }
  if (v13 < length || location > v13 - length)
  {
    v49 = +[NSString stringWithFormat:@"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)];
    v50 = (void *)MEMORY[0x1E4F1CA00];
    v51 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_117:
    objc_exception_throw((id)[v50 exceptionWithName:*v51 reason:v49 userInfo:0]);
  }
  unint64_t v15 = v14;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v9 & 4) != 0) {
    uint64_t v16 = location;
  }
  context = block;
  int64_t v57 = v16;
  uint64_t v58 = 0;
  internal = (const URegularExpression *)self->_internal;
  NSUInteger v18 = [(NSString *)string length];
  v19 = 0;
  UErrorCode v59 = U_ZERO_ERROR;
  if (location > 0x7FFFFFFE) {
    goto LABEL_27;
  }
  if (location + length > v18) {
    goto LABEL_27;
  }
  v19 = (UText *)CFStringOpenUText();
  if (!v19) {
    goto LABEL_27;
  }
  int v20 = 0;
  if ((location + length) >> 31) {
    NSUInteger v21 = 0x7FFFFFFF - location;
  }
  else {
    NSUInteger v21 = length;
  }
  UErrorCode status = U_ZERO_ERROR;
  atomic_compare_exchange_strong(&self->_checkout, (unsigned int *)&v20, 1u);
  BOOL v22 = v20 == 0;
  if (v20) {
    internal = uregex_clone(internal, &status);
  }
  uregex_setUText(internal, v19, &v59);
  if (!internal) {
    goto LABEL_27;
  }
  uregex_setRegion64(internal, location, v21 + location, &v59);
  if (v9)
  {
    uregex_setMatchCallback(internal, (URegexMatchCallback *)regexMatchCallback, &context, &v59);
  }
  else if ((v9 & 4) == 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uregex_setFindProgressCallback(internal, (URegexFindProgressCallback *)regexFindProgressCallback, &context, &v59);
  if ((v9 & 8) != 0) {
LABEL_18:
  }
    uregex_useTransparentBounds(internal, 1, &v59);
LABEL_19:
  if ((v9 & 0x10) != 0) {
    uregex_useAnchoringBounds(internal, 0, &v59);
  }
  if (v59 < U_ILLEGAL_ARGUMENT_ERROR)
  {
    BOOL v52 = v22;
    v23 = 0;
    v53 = self;
    while (1)
    {
      int Next = uregex_findNext(internal, &v54);
      int v25 = v55;
      if (!Next || (v54 <= U_ZERO_ERROR ? (BOOL v26 = v55 == 0) : (BOOL v26 = 0), !v26))
      {
LABEL_91:
        if ((v9 & 2) == 0 || v25 || (_BYTE)v58)
        {
LABEL_97:
          UErrorCode v59 = U_ZERO_ERROR;
          if (!v52) {
            goto LABEL_114;
          }
        }
        else
        {
          if (v54 < U_ILLEGAL_ARGUMENT_ERROR || BYTE1(v58))
          {
            UErrorCode status = U_ZERO_ERROR;
            BOOL v45 = uregex_hitEnd(internal, &status) != 0;
            int v46 = uregex_requireEnd(internal, &status);
            uint64_t v47 = 4 * v45;
            if (v46) {
              uint64_t v47 = (4 * v45) | 8;
            }
            uint64_t v48 = v47 | 2;
            if (status >= U_ILLEGAL_ARGUMENT_ERROR) {
              uint64_t v44 = 2;
            }
            else {
              uint64_t v44 = v48;
            }
          }
          else
          {
            uint64_t v44 = 18;
          }
          (*((void (**)(void *, void, uint64_t, unsigned __int8 *))block + 2))(block, 0, v44, &v55);
          UErrorCode v59 = U_ZERO_ERROR;
          if (!v52)
          {
LABEL_114:
            uregex_close(internal);
            goto LABEL_31;
          }
        }
        uregex_setText(internal, (const UChar *)&status, 0, &v59);
        if (v9)
        {
          uregex_setMatchCallback(internal, 0, 0, &v59);
        }
        else if ((v9 & 4) == 0)
        {
          if ((v9 & 8) == 0) {
            goto LABEL_101;
          }
LABEL_106:
          uregex_useTransparentBounds(internal, 0, &v59);
          if ((v9 & 0x10) == 0) {
            goto LABEL_103;
          }
          goto LABEL_102;
        }
        uregex_setFindProgressCallback(internal, 0, 0, &v59);
        if ((v9 & 8) != 0) {
          goto LABEL_106;
        }
LABEL_101:
        if ((v9 & 0x10) == 0)
        {
LABEL_103:
          atomic_fetch_and(&self->_checkout, 0);
          goto LABEL_31;
        }
LABEL_102:
        uregex_useAnchoringBounds(internal, 1, &v59);
        goto LABEL_103;
      }
      if (v58 | BYTE1(v58))
      {
        int v25 = 0;
        goto LABEL_91;
      }
      if ((v9 & 4) != 0)
      {
        int64_t v27 = uregex_start64(internal, 0, &v54);
        if (v27 > v57)
        {
          int v25 = v55;
          goto LABEL_91;
        }
        int64_t v57 = uregex_end64(internal, 0, &v54);
      }
      if ((v9 & 0x2000) == 0)
      {
        if (v15 >= 7) {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        else {
          id v28 = 0;
        }
        unint64_t v29 = 0;
        v30 = v61;
        do
        {
          UErrorCode v59 = U_ZERO_ERROR;
          int64_t v31 = uregex_start64(internal, v29, &v59);
          int64_t v32 = uregex_end64(internal, v29, &v59);
          BOOL v35 = v59 > U_ZERO_ERROR || v31 < 0 || v32 < v31;
          if (v35) {
            int64_t v36 = 0;
          }
          else {
            int64_t v36 = v32 - v31;
          }
          if (v35) {
            uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v37 = v31;
          }
          if (v15 > 6)
          {
            objc_msgSend(v28, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v37, v36));
          }
          else
          {
            *(v30 - 1) = v37;
            int64_t *v30 = v36;
          }
          ++v29;
          v30 += 2;
        }
        while (v29 <= v15);
        if (v15 > 2)
        {
          self = v53;
          if (v15 > 6)
          {
            v23 = [[NSComplexRegularExpressionCheckingResult alloc] initWithRangeArray:v28 regularExpression:v53];

            goto LABEL_78;
          }
          v38 = [NSExtendedRegularExpressionCheckingResult alloc];
          unint64_t v39 = v15 + 1;
        }
        else
        {
          v38 = [NSSimpleRegularExpressionCheckingResult alloc];
          unint64_t v39 = v15 + 1;
          self = v53;
        }
        v23 = [(NSExtendedRegularExpressionCheckingResult *)v38 initWithRanges:&status count:v39 regularExpression:self];
      }
LABEL_78:
      UErrorCode status = U_ZERO_ERROR;
      BOOL v40 = uregex_hitEnd(internal, &status) != 0;
      int v41 = uregex_requireEnd(internal, &status);
      uint64_t v42 = 4 * v40;
      if (v41) {
        uint64_t v42 = (4 * v40) | 8;
      }
      if (status >= U_ILLEGAL_ARGUMENT_ERROR) {
        uint64_t v43 = 0;
      }
      else {
        uint64_t v43 = v42;
      }
      (*((void (**)(void *, NSComplexRegularExpressionCheckingResult *, uint64_t, unsigned __int8 *))block + 2))(block, v23, v43, &v55);

      if (v55) {
        goto LABEL_97;
      }
    }
  }
  uregex_setText(internal, (const UChar *)&status, 0, &v59);
  if (v9)
  {
    uregex_setMatchCallback(internal, 0, 0, &v59);
  }
  else if ((v9 & 4) == 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_87;
  }
  uregex_setFindProgressCallback(internal, 0, 0, &v59);
  if ((v9 & 8) == 0)
  {
LABEL_25:
    if ((v9 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_87:
  uregex_useTransparentBounds(internal, 0, &v59);
  if ((v9 & 0x10) != 0) {
LABEL_26:
  }
    uregex_useAnchoringBounds(internal, 1, &v59);
LABEL_27:
  if ((v9 & 2) != 0 && !(_BYTE)v58) {
    (*((void (**)(void *, void, uint64_t, unsigned __int8 *))block + 2))(block, 0, 18, &v55);
  }
  UErrorCode v59 = U_ZERO_ERROR;
LABEL_31:
  if (v19) {
    utext_close(v19);
  }
}

- (NSUInteger)numberOfCaptureGroups
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  UErrorCode status = U_ZERO_ERROR;
  NSUInteger result = (NSUInteger)self->_internal;
  if (result) {
    return uregex_groupCount((URegularExpression *)result, &status);
  }
  return result;
}

id __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a4 = 1;
  return result;
}

uint64_t __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 3) == 0) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (NSString)stringByReplacingMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v34 = +[NSString string];
  NSUInteger v13 = [(NSString *)string length];
  v33 = templ;
  if (!templ)
  {
    v30 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v30);
  }
  NSUInteger v14 = v13;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:](self, "matchesInString:options:range:", string, options & 0xFFFFFFFFFFFFFFFCLL, location, length);
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    NSUInteger v31 = v14;
    v17 = self;
    unint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v37;
    do
    {
      uint64_t v21 = 0;
      unint64_t v22 = v18;
      uint64_t v23 = v19;
      do
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * v21);
        unint64_t v18 = [v24 range];
        uint64_t v19 = v25;
        uint64_t v26 = [(NSRegularExpression *)v17 replacementStringForResult:v24 inString:string offset:0 template:v33];
        unint64_t v27 = v18 - (v22 + v23);
        if (v18 > v22 + v23) {
          -[NSString appendString:](v34, "appendString:", -[NSString substringWithRange:](string, "substringWithRange:", v22 + v23, v27));
        }
        -[NSString appendString:](v34, "appendString:", v26, v27);
        ++v21;
        unint64_t v22 = v18;
        uint64_t v23 = v19;
      }
      while (v16 != v21);
      uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v16);
    NSUInteger v28 = v18 + v19;
    NSUInteger v14 = v31;
  }
  else
  {
    NSUInteger v28 = 0;
  }
  if (v14 > v28) {
    -[NSString appendString:](v34, "appendString:", -[NSString substringWithRange:](string, "substringWithRange:"));
  }
  return v34;
}

uint64_t __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v5 = result;
    id result = [a2 range];
    uint64_t v6 = *(void *)(*(void *)(v5 + 32) + 8);
    *(void *)(v6 + 32) = result;
    *(void *)(v6 + 40) = v7;
  }
  *a4 = 1;
  return result;
}

- (NSString)replacementStringForResult:(NSTextCheckingResult *)result inString:(NSString *)string offset:(NSInteger)offset template:(NSString *)templ
{
  NSUInteger v11 = [(NSTextCheckingResult *)result numberOfRanges];
  long long v38 = result;
  if (!result || !string || !templ)
  {
    long long v36 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v36);
  }
  unint64_t v12 = v11;
  NSUInteger v13 = &unk_1EB1E9000;
  if (!replacementStringForResult_inString_offset_template__characterSet) {
    replacementStringForResult_inString_offset_template__characterSet = +[NSCharacterSet characterSetWithCharactersInString:@"\\$"];
  }
  uint64_t v14 = -[NSString rangeOfCharacterFromSet:](templ, "rangeOfCharacterFromSet:");
  if (v15)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    long long v37 = string;
    templ = +[NSString stringWithString:templ];
    NSUInteger v18 = [(NSString *)templ length];
    if (v12 < 0xB)
    {
      uint64_t v21 = 1;
    }
    else
    {
      unint64_t v19 = 10;
      unint64_t v20 = 1;
      do
      {
        uint64_t v21 = v20 + 1;
        v19 *= 10;
      }
      while (v19 < v12 && v20++ < 0x13);
    }
    do
    {
      int v23 = [(NSString *)templ characterAtIndex:v16];
      if (v23 == 36)
      {
        unint64_t v24 = v16 + v17;
        if (v18 >= v16 + v17 + v21) {
          NSUInteger v25 = v16 + v17 + v21;
        }
        else {
          NSUInteger v25 = v18;
        }
        if (v24 < v25)
        {
          unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            int v27 = [(NSString *)templ characterAtIndex:v24];
            if ((v27 - 58) < 0xFFFFFFF6) {
              break;
            }
            uint64_t v28 = 10 * v26;
            if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v28 = 0;
            }
            unint64_t v26 = (v27 - 48) + v28;
            ++v24;
          }
          while (v24 < v25);
          if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v13 = (void *)&unk_1EB1E9000;
          }
          else
          {
            if (v26 >= v12)
            {
              uint64_t v17 = 0;
              uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              uint64_t v29 = [(NSTextCheckingResult *)v38 rangeAtIndex:v26];
              uint64_t v17 = v30;
            }
            if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v31 = v29 + offset;
            }
            NSUInteger v13 = &unk_1EB1E9000;
            int64_t v32 = &stru_1ECA5C228;
            if (v31 != 0x7FFFFFFFFFFFFFFFLL && v17) {
              int64_t v32 = -[NSString substringWithRange:](v37, "substringWithRange:");
            }
            unint64_t v33 = v24 - v16;
            -[NSString replaceCharactersInRange:withString:](templ, "replaceCharactersInRange:withString:", v16, v33, v32);
            NSUInteger v18 = v18 - v33 + v17;
          }
        }
      }
      else if (v23 == 92)
      {
        -[NSString deleteCharactersInRange:](templ, "deleteCharactersInRange:", v16, v17);
        v18 -= v17;
        uint64_t v17 = 1;
      }
      if (v18 <= v17 + v16) {
        break;
      }
      uint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:](templ, "rangeOfCharacterFromSet:options:range:", v13[168], 0, v17 + v16, v18 - (v17 + v16));
      uint64_t v17 = v34;
    }
    while (v34);
  }
  return templ;
}

- (NSArray)matchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke;
  v12[3] = &unk_1E51FBBD0;
  v12[4] = v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", string, options & 0xFFFFFFFFFFFFFFFCLL, location, length, v12);
  return v10;
}

+ (NSString)escapedPatternForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, @"*?+[(){}^$|\\./");
}

- (NSUInteger)replaceMatchesInString:(NSMutableString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!templ)
  {
    uint64_t v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:](self, "matchesInString:options:range:", string, options & 0xFFFFFFFFFFFFFFFCLL, range.location, range.length);
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  NSUInteger v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v26;
  do
  {
    NSUInteger v22 = v11;
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v16 = [v15 range];
      uint64_t v18 = v17;
      unint64_t v19 = [(NSRegularExpression *)self replacementStringForResult:v15 inString:string offset:v12 template:templ];
      -[NSMutableString replaceCharactersInRange:withString:](string, "replaceCharactersInRange:withString:", v16 + v12, v18, v19);
      v12 += [(NSString *)v19 length] - v18;
    }
    NSUInteger v11 = v10 + v22;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
  }
  while (v10);
  return v11;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSRegularExpression *)self pattern];
  NSRegularExpressionOptions v6 = [(NSRegularExpression *)self options];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v5 forKey:@"NSPattern"];
    [a3 encodeInt64:v6 forKey:@"NSOptions"];
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5, v6);
    [a3 encodeValueOfObjCType:"Q" at:v7];
  }
}

- (NSRegularExpression)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPattern"];
    uint64_t v7 = [a3 decodeInt64ForKey:@"NSOptions"];
    return [(NSRegularExpression *)self initWithPattern:v6 options:v7 error:0];
  }
  v12[0] = 0;
  uint64_t v8 = [a3 versionForClassName:@"NSRegularExpression"];
  if (v8 == 1)
  {
    uint64_t v6 = [a3 decodeObject];
    [a3 decodeValueOfObjCType:"Q" at:v12 size:8];
    uint64_t v7 = v12[0];
    return [(NSRegularExpression *)self initWithPattern:v6 options:v7 error:0];
  }
  uint64_t v10 = v8;
  NSUInteger v11 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v11, 1, v10);
  [(NSRegularExpression *)self dealloc];
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(NSRegularExpression *)self pattern] hash];
  return [(NSRegularExpression *)self options] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v5 = -[NSString isEqual:](-[NSRegularExpression pattern](self, "pattern"), "isEqual:", [a3 pattern]);
    if (v5)
    {
      NSRegularExpressionOptions v6 = [(NSRegularExpression *)self options];
      LOBYTE(v5) = v6 == [a3 options];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSRegularExpression;
  return +[NSString stringWithFormat:@"%@ %@ 0x%lx", [(NSRegularExpression *)&v3 description], self->_pattern, self->_options];
}

- (NSString)pattern
{
  v2 = self->_pattern;

  return v2;
}

- (NSRegularExpressionOptions)options
{
  return self->_options;
}

- (unint64_t)_captureGroupNumberWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  UErrorCode status = U_ZERO_ERROR;
  if (self->_internal) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = v5;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  if (!CharactersPtr)
  {
    if (v8 <= 0x100)
    {
      uint64_t v10 = (UChar *)v17;
      objc_msgSend(a3, "getCharacters:range:", v17, 0, v8);
      goto LABEL_11;
    }
    uint64_t v15 = (UChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
    if (v15)
    {
      uint64_t v10 = v15;
      objc_msgSend(a3, "getCharacters:range:", v15, 0, v8);
      int v11 = 1;
      goto LABEL_12;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = (UChar *)CharactersPtr;
LABEL_11:
  int v11 = 0;
LABEL_12:
  int32_t v12 = uregex_groupNumberFromName((URegularExpression *)self->_internal, v10, v8, &status);
  if (v12 > -1 && status < U_ILLEGAL_ARGUMENT_ERROR) {
    unint64_t v7 = v12;
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v11) {
    free(v10);
  }
  return v7;
}

+ (NSString)escapedTemplateForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, @"\\$");
}

@end
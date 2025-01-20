@interface NSLinguisticTagger
+ (BOOL)supportsLanguage:(id)a3;
+ (NSArray)availableTagSchemesForLanguage:(NSString *)language;
+ (NSArray)availableTagSchemesForUnit:(NSLinguisticTaggerUnit)unit language:(NSString *)language;
+ (NSArray)tagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges;
+ (NSLinguisticTag)tagForString:(NSString *)string atIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme orthography:(NSOrthography *)orthography tokenRange:(NSRangePointer)tokenRange;
+ (NSString)dominantLanguageForString:(NSString *)string;
+ (void)enumerateTagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block;
- (BOOL)_acceptSentenceTerminatorRange:(_NSRange)a3 paragraphRange:(_NSRange)a4 tokens:(_NSLTToken *)a5 count:(unint64_t)a6 tokenIndex:(unint64_t)a7;
- (NSArray)possibleTagsAtIndex:(NSUInteger)charIndex scheme:(NSString *)tagScheme tokenRange:(NSRangePointer)tokenRange sentenceRange:(NSRangePointer)sentenceRange scores:(NSArray *)scores;
- (NSArray)tagSchemes;
- (NSArray)tagsInRange:(NSRange)range scheme:(NSString *)tagScheme options:(NSLinguisticTaggerOptions)opts tokenRanges:(NSArray *)tokenRanges;
- (NSArray)tagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options tokenRanges:(NSArray *)tokenRanges;
- (NSLinguisticTag)tagAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme tokenRange:(NSRangePointer)tokenRange;
- (NSLinguisticTagger)initWithTagSchemes:(NSArray *)tagSchemes options:(NSUInteger)opts;
- (NSOrthography)orthographyAtIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveRange;
- (NSRange)tokenRangeAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit;
- (NSString)dominantLanguage;
- (NSString)string;
- (_NSRange)_sentenceRangeForRange:(_NSRange)a3;
- (id)_tagAtIndex:(unint64_t)a3 scheme:(id)a4 tokenRange:(_NSRange *)a5 sentenceRange:(_NSRange *)a6;
- (id)_tagSchemeForScheme:(id)a3;
- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 requireLemmas:(BOOL)a5 requirePartsOfSpeech:(BOOL)a6 requireNamedEntities:(BOOL)a7;
- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 tagScheme:(id)a5;
- (id)_tokenDataForParagraphRange:(_NSRange)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6;
- (id)description;
- (void)_acceptSentencesForParagraphRange:(_NSRange)a3;
- (void)_analyzePunctuationTokensInRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_analyzeTokensInInterwordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_analyzeTokensInWordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_calculateSentenceRangesForParagraphRange:(_NSRange)a3;
- (void)_detectOrthographyIfNeededAtIndex:(unint64_t)a3;
- (void)_enumerateTagsInRange:(_NSRange)a3 scheme:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)_nativeSetOrthography:(id)a3 range:(_NSRange)a4;
- (void)_setOrthography:(id)a3 range:(_NSRange)a4;
- (void)_tokenizeParagraphAtIndex:(unint64_t)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6;
- (void)dealloc;
- (void)enumerateTagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options usingBlock:(void *)block;
- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range;
- (void)setString:(NSString *)string;
- (void)stringEditedInRange:(NSRange)newRange changeInLength:(NSInteger)delta;
@end

@implementation NSLinguisticTagger

+ (NSArray)availableTagSchemesForUnit:(NSLinguisticTaggerUnit)unit language:(NSString *)language
{
  CFLocaleRef v5 = CFLocaleCreate(0, (CFLocaleIdentifier)language);
  if (v5)
  {
    CFLocaleRef v6 = v5;
    if (qword_1EB1EDBD0 != -1) {
      dispatch_once(&qword_1EB1EDBD0, &__block_literal_global_580);
    }
    if (_MergedGlobals_142) {
      v7 = (void *)off_1EB1EDA98(unit, v6);
    }
    else {
      v7 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

+ (NSArray)availableTagSchemesForLanguage:(NSString *)language
{
  return (NSArray *)[a1 availableTagSchemesForUnit:0 language:language];
}

- (NSLinguisticTagger)initWithTagSchemes:(NSArray *)tagSchemes options:(NSUInteger)opts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NSLinguisticTagger;
  CFLocaleRef v6 = [(NSLinguisticTagger *)&v16 init];
  v6->_schemes = (NSArray *)[(NSArray *)tagSchemes copy];
  v6->_options = opts;
  if (qword_1EB1EDAA0 != -1) {
    dispatch_once(&qword_1EB1EDAA0, &__block_literal_global_67);
  }
  v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:tagSchemes];
  v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (([v7 containsObject:@"Language"] & 1) == 0) {
    [v7 addObject:@"Language"];
  }
  if (([v7 containsObject:@"Script"] & 1) == 0) {
    [v7 addObject:@"Script"];
  }
  if ((opts & 0x20000000) != 0) {
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"LSTMLanguageIdentifier");
  }
  if ((opts & 0x10000000) != 0) {
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SmartTokenBreak");
  }
  if (qword_1EB1EDBD0 != -1) {
    dispatch_once(&qword_1EB1EDBD0, &__block_literal_global_580);
  }
  if (_MergedGlobals_142) {
    v6->_reserved = (void *)off_1EB1EDAB0(v7, v8);
  }
  [(id)qword_1EB1EDAA8 lock];
  v9 = (NSCharacterSet *)qword_1EB1EDAB8;
  if (!qword_1EB1EDAB8)
  {
    v9 = +[NSCharacterSet whitespaceCharacterSet];
    qword_1EB1EDAB8 = (uint64_t)v9;
  }
  if (!qword_1EB1EDAC0) {
    qword_1EB1EDAC0 = [(NSCharacterSet *)v9 invertedSet];
  }
  v10 = (NSCharacterSet *)qword_1EB1EDAC8;
  if (!qword_1EB1EDAC8)
  {
    v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    qword_1EB1EDAC8 = (uint64_t)v10;
  }
  if (!qword_1EB1EDAD0) {
    qword_1EB1EDAD0 = [(NSCharacterSet *)v10 invertedSet];
  }
  if (!qword_1EB1EDAD8) {
    qword_1EB1EDAD8 = +[NSCharacterSet characterSetWithCharactersInString:@"\r\f\n\u2029"];
  }
  v11 = (NSCharacterSet *)qword_1EB1EDAE0;
  if (!qword_1EB1EDAE0)
  {
    v11 = +[NSCharacterSet punctuationCharacterSet];
    qword_1EB1EDAE0 = (uint64_t)v11;
  }
  if (!qword_1EB1EDAE8) {
    qword_1EB1EDAE8 = [(NSCharacterSet *)v11 invertedSet];
  }
  if (!qword_1EB1EDAF0)
  {
    v12 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [(NSMutableCharacterSet *)v12 formUnionWithCharacterSet:qword_1EB1EDAE0];
    [(NSMutableCharacterSet *)v12 invert];
    qword_1EB1EDAF0 = [(NSMutableCharacterSet *)v12 copy];
  }
  v13 = (NSCharacterSet *)qword_1EB1EDAF8;
  if (!qword_1EB1EDAF8)
  {
    v13 = +[NSCharacterSet characterSetWithCharactersInString:@".?!。！．？｡"];
    qword_1EB1EDAF8 = (uint64_t)v13;
  }
  if (!qword_1EB1EDB00) {
    qword_1EB1EDB00 = [(NSCharacterSet *)v13 invertedSet];
  }
  if (!qword_1EB1EDB08) {
    qword_1EB1EDB08 = +[NSCharacterSet characterSetWithCharactersInString:@"'’"];
  }
  if (!qword_1EB1EDB10) {
    qword_1EB1EDB10 = +[NSCharacterSet characterSetWithCharactersInString:@"-'\"()«»‐‑‒–—―‘’‚‛“”„‟‹›「」『』"];
  }
  if (!qword_1EB1EDB18) {
    qword_1EB1EDB18 = +[NSCharacterSet characterSetWithCharactersInString:@"'\"«»‘’‚‛“”„‟‹›「」『』"];
  }
  if (!qword_1EB1EDB20) {
    qword_1EB1EDB20 = +[NSCharacterSet decimalDigitCharacterSet];
  }
  if (!qword_1EB1EDB28)
  {
    v14 = +[NSMutableCharacterSet punctuationCharacterSet];
    [(NSMutableCharacterSet *)v14 formUnionWithCharacterSet:qword_1EB1EDB20];
    [(NSMutableCharacterSet *)v14 invert];
    qword_1EB1EDB28 = [(NSMutableCharacterSet *)v14 copy];
  }
  if (!qword_1EB1EDB30) {
    qword_1EB1EDB30 = +[NSCharacterSet alphanumericCharacterSet];
  }
  if (!qword_1EB1EDB38) {
    qword_1EB1EDB38 = objc_retain(+[NSCharacterSet characterSetWithCharactersInString:@"([{</@-=–—")];
  }
  if (!qword_1EB1EDB40) {
    qword_1EB1EDB40 = +[NSCharacterSet characterSetWithCharactersInString:@"nstNST"];
  }
  [(id)qword_1EB1EDAA8 unlock];
  return v6;
}

NSLock *__49__NSLinguisticTagger_initWithTagSchemes_options___block_invoke()
{
  result = objc_alloc_init(NSLock);
  qword_1EB1EDAA8 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  reserved = self->_reserved;
  if (reserved) {
    CFRelease(reserved);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSLinguisticTagger;
  [(NSLinguisticTagger *)&v4 dealloc];
}

- (id)description
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSLinguisticTagger;
  v3 = +[NSString stringWithFormat:@"%@\n", [(NSLinguisticTagger *)&v5 description]];
  [(NSMutableString *)v3 appendFormat:@"    tag schemes %@\n", self->_schemes];
  [(NSMutableString *)v3 appendFormat:@"    string %p has %lu characters\n", self->_string, [(NSString *)self->_string length]];
  return v3;
}

- (NSArray)tagSchemes
{
  return self->_schemes;
}

- (id)_tagSchemeForScheme:(id)a3
{
  if (!-[NSArray containsObject:](self->_schemes, "containsObject:")) {
    return 0;
  }
  objc_super v4 = @"TokenType";
  if (([@"TokenType" isEqualToString:a3] & 1) == 0)
  {
    objc_super v4 = @"LexicalClass";
    if (([@"LexicalClass" isEqualToString:a3] & 1) == 0)
    {
      objc_super v4 = @"NameType";
      if (([@"NameType" isEqualToString:a3] & 1) == 0)
      {
        objc_super v4 = @"NameTypeOrLexicalClass";
        if (([@"NameTypeOrLexicalClass" isEqualToString:a3] & 1) == 0)
        {
          objc_super v4 = @"Lemma";
          if (([@"Lemma" isEqualToString:a3] & 1) == 0)
          {
            objc_super v4 = @"Language";
            if (([@"Language" isEqualToString:a3] & 1) == 0)
            {
              objc_super v4 = @"Script";
              if (([@"Script" isEqualToString:a3] & 1) == 0)
              {
                objc_super v4 = @"PossibleClasses";
                if (([@"PossibleClasses" isEqualToString:a3] & 1) == 0)
                {
                  objc_super v4 = @"InternalClass";
                  if (![@"InternalClass" isEqualToString:a3]) {
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

+ (BOOL)supportsLanguage:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en", @"fr", @"de", @"es", @"it", @"pt", @"ru", @"tr", @"ja", 0);

  return [v4 containsObject:a3];
}

- (void)setString:(NSString *)string
{
  objc_super v5 = self->_string;
  if (v5 != string)
  {

    self->_string = string;
  }
  id tokenArray = self->_tokenArray;
  if (tokenArray)
  {

    self->_id tokenArray = 0;
  }
  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {

    self->_id orthographyArray = 0;
  }
  if (self->_reserved)
  {
    v8 = (void (*)(void))off_1EB1EDB48;
    v8();
  }
}

- (NSString)string
{
  return self->_string;
}

- (void)stringEditedInRange:(NSRange)newRange changeInLength:(NSInteger)delta
{
  NSUInteger length = newRange.length;
  NSUInteger location = newRange.location;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  NSUInteger v8 = newRange.length - delta;
  NSUInteger v22 = 0;
  uint64_t v23 = 0;
  id tokenArray = self->_tokenArray;
  if (tokenArray)
  {
    unint64_t v10 = [tokenArray count];
    if (location < v10
      && (v11 = (void *)[self->_tokenArray objectAtIndex:location effectiveRange:&v22]) != 0)
    {
      NSUInteger v12 = v8;
      NSUInteger v13 = location;
      if ((objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
      {
        NSUInteger v14 = location - v22;
        if (location < v22) {
          NSUInteger v14 = 0;
        }
        NSUInteger v15 = v14 + v8;
        if (v22 >= location) {
          NSUInteger v13 = location;
        }
        else {
          NSUInteger v13 = v22;
        }
        if (v23 + v22 <= v15 + v13) {
          NSUInteger v12 = v15;
        }
        else {
          NSUInteger v12 = v23 + v22 - v13;
        }
      }
    }
    else
    {
      NSUInteger v12 = v8;
      NSUInteger v13 = location;
    }
    if (v8)
    {
      if (v8 + location <= v10)
      {
        objc_super v16 = (void *)[self->_tokenArray objectAtIndex:v8 + location - 1 effectiveRange:&v22];
        if (v16)
        {
          if ((objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0
            && v23 + v22 > v13 + v12)
          {
            NSUInteger v12 = v23 + v22 - v13;
          }
        }
      }
    }
    id v17 = self->_tokenArray;
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
    if (v12) {
      objc_msgSend(v17, "replaceObjectsInRange:withObject:length:", v13, v12, v18, v12 + delta);
    }
    else {
      objc_msgSend(v17, "insertObject:range:", v18, v13, delta);
    }
  }
  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
    if (v8) {
      objc_msgSend(orthographyArray, "replaceObjectsInRange:withObject:length:", location, v8, v20, length);
    }
    else {
      objc_msgSend(orthographyArray, "insertObject:range:", v20, location, length);
    }
  }
  reserved = self->_reserved;
  if (reserved) {
    off_1EB1EDB50(reserved, location, length, delta);
  }
}

- (void)_setOrthography:(id)a3 range:(_NSRange)a4
{
  if (self->_reserved)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    CFStringRef v7 = (const __CFString *)[a3 dominantLanguage];
    CFLocaleRef v8 = v7 ? CFLocaleCreate(0, v7) : 0;
    off_1EB1EDB58(self->_reserved, v8, location, length);
    if (v8)
    {
      CFRelease(v8);
    }
  }
}

- (void)_nativeSetOrthography:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = [(NSString *)self->_string length];
  if (v9 < length || location > v9 - length)
  {
    uint64_t v24 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  if (length)
  {
    unint64_t orthographyArray = (unint64_t)self->_orthographyArray;
    if ((unint64_t)a3 | orthographyArray)
    {
      if (!orthographyArray)
      {
        NSUInteger v12 = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:[(NSLinguisticTagger *)self zone]] init];
        self->_unint64_t orthographyArray = v12;
        -[NSMutableRLEArray insertObject:range:](v12, "insertObject:range:", [MEMORY[0x1E4F1CA98] null], 0, -[NSString length](self->_string, "length"));
        unint64_t orthographyArray = (unint64_t)self->_orthographyArray;
      }
      unint64_t v13 = [(id)orthographyArray count];
      unint64_t v14 = location + length;
      if (location + length >= v13) {
        unint64_t v14 = v13;
      }
      if (location) {
        unint64_t v15 = 0;
      }
      else {
        unint64_t v15 = v14;
      }
      unint64_t v16 = v14 - location;
      if (location < v13) {
        NSUInteger v17 = location;
      }
      else {
        NSUInteger v17 = 0;
      }
      if (location < v13) {
        unint64_t v18 = v16;
      }
      else {
        unint64_t v18 = v15;
      }
      id v19 = self->_orthographyArray;
      if (a3)
      {
        uint64_t v20 = v19;
        NSUInteger v21 = v17;
        uint64_t v22 = v18;
        id v23 = a3;
      }
      else
      {
        id v23 = (id)[MEMORY[0x1E4F1CA98] null];
        uint64_t v20 = v19;
        NSUInteger v21 = v17;
        uint64_t v22 = v18;
      }
      objc_msgSend(v20, "replaceObjectsInRange:withObject:length:", v21, v22, v23, v18);
    }
  }
}

- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  -[NSLinguisticTagger _nativeSetOrthography:range:](self, "_nativeSetOrthography:range:");
  if (self->_reserved)
  {
    -[NSLinguisticTagger _setOrthography:range:](self, "_setOrthography:range:", orthography, location, length);
  }
}

- (void)_detectOrthographyIfNeededAtIndex:(unint64_t)a3
{
  id orthographyArray = self->_orthographyArray;
  if (!orthographyArray
    || [orthographyArray count] <= a3
    || (uint64_t v6 = (void *)[self->_orthographyArray objectAtIndex:a3 effectiveRange:0],
        objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))))
  {
    reserved = self->_reserved;
    if (reserved)
    {
      CFLocaleRef v8 = (const void *)off_1EB1EDB60(reserved, 2, a3, @"Script");
      uint64_t v9 = off_1EB1EDB60(self->_reserved, 2, a3, @"Language");
      unint64_t v10 = (const void *)v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        if (!v8)
        {
          if (!v9) {
            return;
          }
LABEL_12:
          CFRelease(v10);
          return;
        }
      }
      else
      {
        uint64_t v12 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0);
        uint64_t v14 = v13;
        unint64_t v15 = (void *)off_1EB1EDB68(self->_reserved, 2, a3);
        NSUInteger v17 = v15;
        if (!v15 || (v18 = [v15 objectForKey:v8], uint64_t v16 = (uint64_t)v17, !v18)) {
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v10, v16), v8);
        }
        -[NSLinguisticTagger _nativeSetOrthography:range:](self, "_nativeSetOrthography:range:", +[NSOrthography _orthographyWithDominantScript:languageMap:](NSOrthography, "_orthographyWithDominantScript:languageMap:", v8, v16), v12, v14);
        if (v17) {
          CFRelease(v17);
        }
      }
      CFRelease(v8);
      if (!v10) {
        return;
      }
      goto LABEL_12;
    }
  }
}

- (NSOrthography)orthographyAtIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveRange
{
  if ([(NSString *)self->_string length] <= charIndex)
  {
    unint64_t v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (self->_reserved) {
    [(NSLinguisticTagger *)self _detectOrthographyIfNeededAtIndex:charIndex];
  }
  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    NSUInteger v9 = [orthographyArray count];
    if (v9 > charIndex)
    {
      unint64_t v10 = (NSOrthography *)[self->_orthographyArray objectAtIndex:charIndex effectiveRange:effectiveRange];
      goto LABEL_14;
    }
    if (effectiveRange)
    {
      NSUInteger v12 = v9;
      NSUInteger v13 = [(NSString *)self->_string length];
      unint64_t v10 = 0;
      if (v13 <= charIndex)
      {
        effectiveRange->NSUInteger location = charIndex;
        effectiveRange->NSUInteger length = 1;
      }
      else
      {
        effectiveRange->NSUInteger location = v12;
        effectiveRange->NSUInteger length = v13 - v12;
      }
      goto LABEL_14;
    }
  }
  else if (effectiveRange)
  {
    NSUInteger v11 = [(NSString *)self->_string length];
    unint64_t v10 = 0;
    effectiveRange->NSUInteger location = 0;
    effectiveRange->NSUInteger length = v11;
    goto LABEL_14;
  }
  unint64_t v10 = 0;
LABEL_14:
  if (-[NSOrthography isEqual:](v10, "isEqual:", [MEMORY[0x1E4F1CA98] null])) {
    return 0;
  }
  else {
    return v10;
  }
}

- (_NSRange)_sentenceRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = [(NSString *)[(NSLinguisticTagger *)self string] length];
  NSUInteger v8 = location + length;
  if (location + length > v7)
  {
    NSUInteger v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  if (v7)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      NSUInteger v17 = 0;
      NSUInteger v18 = 0;
      uint64_t v19 = 0;
      off_1EB1EDB70(&v17, reserved, 1, location);
      NSUInteger location = v17;
      NSUInteger v10 = v18;
      if (length)
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        off_1EB1EDB70(&v14, self->_reserved, 1, v8 - 1);
        if (v15 + v14 <= v10 + location) {
          NSUInteger length = v10;
        }
        else {
          NSUInteger length = v15 + v14 - location;
        }
      }
      else
      {
        NSUInteger length = v18;
      }
    }
  }
  else
  {
    NSUInteger location = 0;
    NSUInteger length = 0;
  }
  NSUInteger v11 = location;
  NSUInteger v12 = length;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (id)_tagAtIndex:(unint64_t)a3 scheme:(id)a4 tokenRange:(_NSRange *)a5 sentenceRange:(_NSRange *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_string length] <= a3)
  {
    NSUInteger v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v12 = [(NSLinguisticTagger *)self _tagSchemeForScheme:a4];
  if (!v12) {
    return 0;
  }
  id v13 = v12;
  reserved = self->_reserved;
  if (!reserved) {
    return 0;
  }
  uint64_t v15 = (void *)off_1EB1EDB60(reserved, 0, a3, v13);
  id v16 = tagForNLTag(v15);
  if (v15) {
    CFRelease(v15);
  }
  if (a5)
  {
    _NSRange v19 = (_NSRange)0;
    uint64_t v20 = 0;
    off_1EB1EDB70(&v19, self->_reserved, 0, a3);
    *a5 = v19;
  }
  if (a6)
  {
    _NSRange v19 = (_NSRange)0;
    uint64_t v20 = 0;
    off_1EB1EDB70(&v19, self->_reserved, 1, a3);
    *a6 = v19;
  }
  return v16;
}

- (NSArray)possibleTagsAtIndex:(NSUInteger)charIndex scheme:(NSString *)tagScheme tokenRange:(NSRangePointer)tokenRange sentenceRange:(NSRangePointer)sentenceRange scores:(NSArray *)scores
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  LODWORD(v7) = 1.0;
  uint64_t v15 = +[NSNumber numberWithFloat:v7];
  if ([(NSString *)self->_string length] <= charIndex)
  {
    v117 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v117);
  }
  id v16 = [(NSLinguisticTagger *)self _tagSchemeForScheme:tagScheme];
  if (!v16) {
    return 0;
  }
  NSUInteger v17 = v16;
  v125 = v15;
  NSRangePointer v126 = tokenRange;
  unint64_t v130 = 0;
  uint64_t v129 = 0;
  uint64_t v128 = 0;
  unint64_t v127 = 0;
  id v18 = [(NSLinguisticTagger *)self _tokenDataForParagraphAtIndex:charIndex paragraphRange:&v129 tagScheme:v16];
  uint64_t v19 = [v18 bytes];
  unint64_t v20 = (unint64_t)[v18 length] >> 4;
  uint64_t v21 = v129;
  unint64_t v22 = v130;
  NSUInteger v23 = sentenceRangeAtIndexInTokens(charIndex, v129, v130, v19, v20, (uint64_t *)&v127);
  NSUInteger v25 = v21 + *(unsigned __int16 *)(v19 + 16 * v127);
  if (v25 > charIndex)
  {
    v124 = scores;
    NSUInteger v26 = v25 - v23;
    if (v17 == @"NameType"
      || v17 == @"LexicalClass"
      || v17 == @"NameTypeOrLexicalClass"
      || v17 == @"PossibleClasses"
      || v17 == @"InternalClass")
    {
      v31 = @"Whitespace";
    }
    else
    {
      v31 = 0;
    }
    if (v17 == @"TokenType") {
      v32 = @"Whitespace";
    }
    else {
      v32 = v31;
    }
    v33 = 0;
    NSUInteger v34 = v23;
    goto LABEL_23;
  }
  uint64_t v38 = v128;
  if (v127 >= v128 + v127)
  {
    NSUInteger v34 = 0;
    NSUInteger v26 = 0;
    v33 = 0;
LABEL_48:
    p_NSUInteger location = &v126->location;
    goto LABEL_49;
  }
  v124 = scores;
  v123 = sentenceRange;
  v39 = (unsigned __int16 *)(v19 + 16 * v127);
  unint64_t v40 = v127 + 1;
  while (1)
  {
    uint64_t v41 = *v39;
    NSUInteger v34 = v21 + v41;
    NSUInteger v26 = *((unsigned __int8 *)v39 + 2);
    NSUInteger v42 = v21 + v41 + v26;
    if (v21 + v41 <= charIndex && v42 > charIndex)
    {
      unint64_t v50 = *((unsigned __int8 *)v39 + 3);
      if ((v50 - 14) > 0x4A)
      {
        p_NSUInteger location = &v126->location;
        if ((v50 - 2) > 0xB)
        {
          sentenceRange = v123;
          if (v50 == 1)
          {
            v33 = 0;
            if (v17 == @"LexicalClass"
              || v17 == @"TokenType"
              || v17 == @"NameType"
              || v17 == @"NameTypeOrLexicalClass"
              || v17 == @"PossibleClasses"
              || v17 == @"InternalClass")
            {
              v32 = @"Other";
            }
            else
            {
              v32 = 0;
            }
            goto LABEL_24;
          }
        }
        else
        {
          sentenceRange = v123;
          if (v17 == @"TokenType")
          {
LABEL_119:
            v33 = 0;
            v32 = @"Punctuation";
            goto LABEL_24;
          }
          if (v17 == @"PossibleClasses"
            || v17 == @"NameTypeOrLexicalClass"
            || v17 == @"LexicalClass"
            || v17 == @"NameType")
          {
            v33 = 0;
            v32 = @"SentenceTerminator";
            switch((int)v50)
            {
              case 2:
                goto LABEL_24;
              case 5:
                v33 = 0;
                v32 = @"OpenQuote";
                goto LABEL_24;
              case 6:
                v33 = 0;
                v32 = @"CloseQuote";
                goto LABEL_24;
              case 7:
                v33 = 0;
                v32 = @"OpenParenthesis";
                goto LABEL_24;
              case 8:
                v33 = 0;
                v32 = @"CloseParenthesis";
                goto LABEL_24;
              case 9:
                v33 = 0;
                v32 = @"WordJoiner";
                goto LABEL_24;
              case 11:
                v33 = 0;
                v32 = @"Dash";
                goto LABEL_24;
              case 13:
                goto LABEL_119;
              default:
                goto LABEL_49;
            }
            goto LABEL_49;
          }
          if (v17 == @"InternalClass")
          {
            NSUInteger v53 = v23;
            NSUInteger v54 = v24;
            v55 = (void *)internalTagForCategory_internalTagArray;
            if (!internalTagForCategory_internalTagArray)
            {
              v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"NONE", @"OTHER", @".", @"?", @"!", @"“", @"”", @"("), CFSTR(")", @"-", @",", @"--", @":", @"SYM", @"ABB", @"ACK", @"CC",
                              @"CD",
                              @"CS",
                              @"DT",
                              @"DTO",
                              @"DTP",
                              @"DTW",
                              @"EX",
                              @"FW",
                              @"IN",
                              @"JJ",
                              @"JJR",
                              @"JJS",
                              @"LS",
                              @"NN",
                              @"NNS",
                              @"NNP",
                              @"NNPS",
                              @"PRE",
                              @"PRP",
                              @"PRPD",
                              @"PRPR",
                              @"PRPS",
                              @"PRPT",
                              @"RB",
                              @"RBC",
                              @"RBN",
                              @"RBP",
                              @"RBR",
                              @"RBS",
                              @"RBW",
                              @"RP",
                              @"RPP",
                              @"TO",
                              @"UH",
                              @"URL",
                              @"VB",
                              @"VBC",
                              @"VBD",
                              @"VBF",
                              @"VBG",
                              @"VBI",
                              @"VBM",
                              @"VBN",
                              @"VBP");
              internalTagForCategory_internalTagArray = (uint64_t)v55;
            }
            if ([v55 count] <= v50)
            {
              v33 = 0;
              v32 = @"NONE";
            }
            else
            {
              v32 = (__CFString *)[(id)internalTagForCategory_internalTagArray objectAtIndex:v50];
              v33 = 0;
            }
            sentenceRange = v123;
            NSUInteger v24 = v54;
            NSUInteger v23 = v53;
            goto LABEL_24;
          }
        }
        v33 = 0;
        goto LABEL_49;
      }
      string = self->_string;
      id orthographyArray = self->_orthographyArray;
      if (v17 == @"TokenType")
      {
        v32 = @"Word";
      }
      else if (v17 == @"NameTypeOrLexicalClass" || v17 == @"LexicalClass" || v17 == @"NameType")
      {
        if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 0x43)
        {
          BOOL v66 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
          v67 = @"PersonalName";
LABEL_140:
          if (v66) {
            v32 = v67;
          }
          else {
            v32 = @"Noun";
          }
        }
        else
        {
          switch(*((unsigned char *)v39 + 3))
          {
            case 'D':
            case 'H':
              BOOL v66 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
              v67 = @"PlaceName";
              goto LABEL_140;
            case 'E':
            case 'I':
              BOOL v66 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
              v67 = @"OrganizationName";
              goto LABEL_140;
            case 'F':
            case 'G':
            case 'J':
              goto LABEL_132;
            case 'K':
              goto LABEL_133;
            default:
              if ((v50 - 30) < 2) {
                goto LABEL_133;
              }
LABEL_132:
              if ((v50 & 0xFE) == 0x20)
              {
LABEL_133:
                if (v17 == @"NameType") {
                  v32 = @"OtherWord";
                }
                else {
                  v32 = @"Noun";
                }
              }
              else
              {
                v32 = @"OtherWord";
                switch(*((unsigned char *)v39 + 3))
                {
                  case 0x10:
                  case 0x12:
                  case 0x54:
                    v115 = @"Conjunction";
                    goto LABEL_246;
                  case 0x11:
                  case 0x1D:
                  case 0x53:
                    v115 = @"Number";
                    goto LABEL_246;
                  case 0x13:
                  case 0x14:
                  case 0x15:
                  case 0x16:
                  case 0x50:
                    v115 = @"Determiner";
                    goto LABEL_246;
                  case 0x17:
                  case 0x23:
                  case 0x24:
                  case 0x25:
                  case 0x26:
                  case 0x27:
                  case 0x41:
                  case 0x42:
                  case 0x4F:
                    v115 = @"Pronoun";
                    goto LABEL_246;
                  case 0x19:
                  case 0x52:
                    v115 = @"Preposition";
                    goto LABEL_246;
                  case 0x1A:
                  case 0x1B:
                  case 0x1C:
                  case 0x4D:
                    v115 = @"Adjective";
                    goto LABEL_246;
                  case 0x22:
                  case 0x2B:
                  case 0x2F:
                  case 0x30:
                  case 0x31:
                  case 0x51:
                    v115 = @"Particle";
                    goto LABEL_246;
                  case 0x28:
                  case 0x29:
                  case 0x2A:
                  case 0x2D:
                  case 0x2E:
                  case 0x4E:
                    v115 = @"Adverb";
                    goto LABEL_246;
                  case 0x32:
                  case 0x55:
                    v115 = @"Interjection";
                    goto LABEL_246;
                  case 0x34:
                  case 0x35:
                  case 0x36:
                  case 0x37:
                  case 0x38:
                  case 0x39:
                  case 0x3A:
                  case 0x3B:
                  case 0x3C:
                  case 0x3D:
                  case 0x3E:
                  case 0x3F:
                  case 0x40:
                  case 0x4C:
                    v115 = @"Verb";
                    goto LABEL_246;
                  case 0x56:
                    v115 = @"Classifier";
                    goto LABEL_246;
                  case 0x57:
                    v115 = @"Idiom";
LABEL_246:
                    if (v17 != @"NameType") {
                      v32 = v115;
                    }
                    break;
                  default:
                    goto LABEL_143;
                }
              }
              break;
          }
        }
      }
      else if (v17 == @"InternalClass")
      {
        id v121 = self->_orthographyArray;
        v68 = self->_string;
        NSUInteger v69 = v23;
        NSUInteger v70 = v24;
        v71 = (void *)internalTagForCategory_internalTagArray;
        if (!internalTagForCategory_internalTagArray)
        {
          v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"NONE", @"OTHER", @".", @"?", @"!", @"“", @"”", @"("), CFSTR(")", @"-", @",", @"--", @":", @"SYM", @"ABB", @"ACK", @"CC",
                          @"CD",
                          @"CS",
                          @"DT",
                          @"DTO",
                          @"DTP",
                          @"DTW",
                          @"EX",
                          @"FW",
                          @"IN",
                          @"JJ",
                          @"JJR",
                          @"JJS",
                          @"LS",
                          @"NN",
                          @"NNS",
                          @"NNP",
                          @"NNPS",
                          @"PRE",
                          @"PRP",
                          @"PRPD",
                          @"PRPR",
                          @"PRPS",
                          @"PRPT",
                          @"RB",
                          @"RBC",
                          @"RBN",
                          @"RBP",
                          @"RBR",
                          @"RBS",
                          @"RBW",
                          @"RP",
                          @"RPP",
                          @"TO",
                          @"UH",
                          @"URL",
                          @"VB",
                          @"VBC",
                          @"VBD",
                          @"VBF",
                          @"VBG",
                          @"VBI",
                          @"VBM",
                          @"VBN",
                          @"VBP");
          internalTagForCategory_internalTagArray = (uint64_t)v71;
        }
        if ([v71 count] <= v50) {
          v32 = @"NONE";
        }
        else {
          v32 = (__CFString *)[(id)internalTagForCategory_internalTagArray objectAtIndex:v50];
        }
        NSUInteger v24 = v70;
        NSUInteger v23 = v69;
        string = v68;
        id orthographyArray = v121;
      }
      else
      {
        v32 = 0;
      }
LABEL_143:
      if (v17 != @"PossibleClasses"
        && v17 != @"Script"
        && v17 != @"Lemma"
        && v17 != @"Language"
        && v17 != @"NameTypeOrLexicalClass"
        && v17 != @"LexicalClass"
        && v17 != @"NameType")
      {
        p_NSUInteger location = &v126->location;
LABEL_197:
        uint64_t v104 = 0;
        v33 = 0;
        sentenceRange = v123;
LABEL_198:
        if (v124)
        {
          NSUInteger v105 = v23;
          if (v104) {
            uint64_t v106 = v104;
          }
          else {
            uint64_t v106 = MEMORY[0x1E4F1CBF0];
          }
          NSUInteger v107 = v24;
          uint64_t v108 = [MEMORY[0x1E4F1C978] arrayWithArray:v106];
          NSUInteger v24 = v107;
          *v124 = (NSArray *)v108;
          NSUInteger v23 = v105;
        }
        goto LABEL_24;
      }
      NSUInteger v120 = v23;
      NSUInteger v122 = v24;
      v72 = orthographyArray;
      unint64_t v73 = [orthographyArray count];
      v74 = malloc_type_malloc(2 * *((unsigned __int8 *)v39 + 2), 0x1000040BDFB0063uLL);
      v118 = string;
      if (v74)
      {
        v75 = v74;
        -[NSString getCharacters:range:](string, "getCharacters:range:", v74, v21 + *v39, *((unsigned __int8 *)v39 + 2));
        unint64_t v76 = NSOrthographyScriptIndexForCharacters((uint64_t)v75, *((unsigned __int8 *)v39 + 2), 0);
        free(v75);
      }
      else
      {
        unint64_t v76 = 0;
      }
      if (v21 + (unint64_t)*v39 >= v73)
      {
        v78 = 0;
      }
      else
      {
        uint64_t v77 = objc_msgSend(v72, "objectAtIndex:effectiveRange:");
        if (objc_opt_isKindOfClass()) {
          v78 = (void *)v77;
        }
        else {
          v78 = 0;
        }
      }
      if (v76 == 2)
      {
        v79 = (void *)[v78 allScripts];
        v80 = @"Jpan";
        if (([v79 containsObject:@"Jpan"] & 1) == 0)
        {
          v80 = @"Kore";
          if (([v79 containsObject:@"Kore"] & 1) == 0)
          {
            v80 = @"Hans";
            if (([v79 containsObject:@"Hans"] & 1) == 0)
            {
              if ([v79 containsObject:@"Hant"]) {
                v80 = @"Hant";
              }
              else {
                v80 = @"Hani";
              }
            }
          }
        }
      }
      else
      {
        if (v76 < 2) {
          goto LABEL_195;
        }
        unsigned int v81 = v76 - 32 >= 0xFFFFFFFFFFFFFFE1 ? (v76 << 27) | 0x84202 : 0;
        v80 = NSOrthographyDominantScriptForFlags(v81);
        if (!v80) {
          goto LABEL_195;
        }
      }
      if (v17 == @"Lemma")
      {
        v97 = (__CFString *)[v78 dominantLanguageForScript:v80];
        int v98 = [(__CFString *)v97 isEqual:@"ja"];
        uint64_t v99 = v21 + *v39;
        if (v98)
        {
          v100 = -[NSString substringWithRange:](v118, "substringWithRange:", v99 + *((unsigned __int8 *)v39 + 8), *((unsigned __int8 *)v39 + 9));
        }
        else
        {
          uint64_t v102 = *((unsigned __int8 *)v39 + 2);
          LXLemmatizer = getLXLemmatizer(v97);
          v100 = lemmatizerLemmaForStringWithCategory((uint64_t)LXLemmatizer, -[NSString substringWithRange:](v118, "substringWithRange:", v99, v102), *((unsigned __int8 *)v39 + 3));
        }
      }
      else
      {
        if (v17 == @"Language")
        {
          uint64_t v101 = [v78 dominantLanguageForScript:v80];
          if (v101) {
            v32 = (__CFString *)v101;
          }
          else {
            v32 = @"und";
          }
          goto LABEL_195;
        }
        p_NSUInteger location = &v126->location;
        if (v17 == @"Script")
        {
          v32 = v80;
          goto LABEL_196;
        }
        if (v17 != @"PossibleClasses"
          && v17 != @"NameTypeOrLexicalClass"
          && v17 != @"LexicalClass"
          && v17 != @"NameType")
        {
          goto LABEL_196;
        }
        uint64_t v82 = *v39;
        uint64_t v83 = *((unsigned __int8 *)v39 + 2);
        v84 = getLXLemmatizer((__CFString *)[v78 dominantLanguageForScript:v80]);
        if (!v84)
        {
          p_NSUInteger location = &v126->location;
          NSUInteger v24 = v122;
          NSUInteger v23 = v120;
          if (v17 != @"PossibleClasses") {
            goto LABEL_197;
          }
          uint64_t v109 = *((unsigned __int8 *)v39 + 3);
          if ((v109 & 0xFFFFFFFFFFFFFFFBLL) == 0x43
            || (v109 - 30) <= 0x2D && ((1 << (v109 - 30)) & 0x2CC000000003) != 0)
          {
            v32 = @"Noun";
            goto LABEL_197;
          }
          if ((v109 & 0xFE) == 0x20)
          {
            v32 = @"Noun";
          }
          else
          {
            unsigned __int8 v116 = v109 - 16;
            if (v116 > 0x47u) {
              v32 = @"OtherWord";
            }
            else {
              v32 = off_1E51FB7E0[(char)v116];
            }
          }
          goto LABEL_195;
        }
        uint64_t v85 = (uint64_t)v84;
        uint64_t v86 = v21 + v82;
        v87 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        lemmatizerAddTagsForString(v85, -[NSString substringWithRange:](v118, "substringWithRange:", v86, v83), (uint64_t)v87);
        v88 = (void *)[v87 keysSortedByValueUsingComparator:&__block_literal_global_619];
        v89 = v88;
        if (v17 != @"PossibleClasses")
        {
          uint64_t v119 = [MEMORY[0x1E4F1C978] arrayWithArray:v88];
          v90 = (void *)[MEMORY[0x1E4F1CA48] array];
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          uint64_t v91 = [v89 countByEnumeratingWithState:&v137 objects:v136 count:16];
          if (v91)
          {
            uint64_t v92 = v91;
            uint64_t v93 = 0;
            uint64_t v94 = *(void *)v138;
            do
            {
              for (uint64_t i = 0; i != v92; ++i)
              {
                if (*(void *)v138 != v94) {
                  objc_enumerationMutation(v89);
                }
                v93 += objc_msgSend((id)objc_msgSend(v87, "objectForKey:", *(void *)(*((void *)&v137 + 1) + 8 * i)), "integerValue");
              }
              uint64_t v92 = [v89 countByEnumeratingWithState:&v137 objects:v136 count:16];
            }
            while (v92);
            float v96 = (float)v93;
          }
          else
          {
            float v96 = 0.0;
          }
          long long v134 = 0u;
          long long v135 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          uint64_t v110 = [v89 countByEnumeratingWithState:&v132 objects:v131 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            uint64_t v112 = *(void *)v133;
            do
            {
              for (uint64_t j = 0; j != v111; ++j)
              {
                if (*(void *)v133 != v112) {
                  objc_enumerationMutation(v89);
                }
                *(float *)&double v114 = (float)objc_msgSend((id)objc_msgSend(v87, "objectForKey:", *(void *)(*((void *)&v132 + 1) + 8 * j)), "integerValue")/ v96;
                objc_msgSend(v90, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v114));
              }
              uint64_t v111 = [v89 countByEnumeratingWithState:&v132 objects:v131 count:16];
            }
            while (v111);
          }
          uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithArray:v90];
          if (v119) {
            v33 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
          }
          else {
            v33 = 0;
          }
          sentenceRange = v123;
          p_NSUInteger location = &v126->location;
          NSUInteger v24 = v122;
          NSUInteger v23 = v120;
          goto LABEL_198;
        }
        v100 = (NSString *)[v88 componentsJoinedByString:@"/"];
      }
      v32 = (__CFString *)v100;
LABEL_195:
      p_NSUInteger location = &v126->location;
LABEL_196:
      NSUInteger v24 = v122;
      NSUInteger v23 = v120;
      goto LABEL_197;
    }
    unint64_t v44 = v22;
    if (v40 < v20) {
      unint64_t v44 = v39[8];
    }
    unint64_t v45 = v26 + v41;
    BOOL v46 = v44 >= v45;
    NSUInteger v47 = v44 - v45;
    if (v47 == 0 || !v46) {
      goto LABEL_45;
    }
    if (v42 <= charIndex && v47 + v42 > charIndex) {
      break;
    }
    NSUInteger v26 = v47;
    NSUInteger v34 = v42;
LABEL_45:
    v39 += 8;
    ++v40;
    if (!--v38)
    {
      v33 = 0;
      sentenceRange = v123;
      goto LABEL_48;
    }
  }
  if (v17 == @"NameType"
    || v17 == @"LexicalClass"
    || v17 == @"NameTypeOrLexicalClass"
    || v17 == @"PossibleClasses"
    || v17 == @"InternalClass")
  {
    v60 = @"Whitespace";
  }
  else
  {
    v60 = 0;
  }
  if (v17 == @"TokenType") {
    v32 = @"Whitespace";
  }
  else {
    v32 = v60;
  }
  v33 = 0;
  NSUInteger v26 = v47;
  NSUInteger v34 = v42;
  sentenceRange = v123;
LABEL_23:
  p_NSUInteger location = &v126->location;
LABEL_24:
  if (v32 && !v33)
  {
    NSUInteger v36 = v23;
    NSUInteger v37 = v24;
    v33 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:v32];
    if (v124) {
      *v124 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:v125];
    }
    NSUInteger v24 = v37;
    NSUInteger v23 = v36;
  }
LABEL_49:
  if (p_location)
  {
    *p_NSUInteger location = v34;
    p_location[1] = v26;
  }
  if (sentenceRange)
  {
    sentenceRange->NSUInteger location = v23;
    sentenceRange->NSUInteger length = v24;
  }
  return v33;
}

- (NSArray)tagsInRange:(NSRange)range scheme:(NSString *)tagScheme options:(NSLinguisticTaggerOptions)opts tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  NSUInteger v23 = &v22;
  uint64_t v24 = 0x3052000000;
  NSUInteger v25 = __Block_byref_object_copy__22;
  NSUInteger v26 = __Block_byref_object_dispose__22;
  uint64_t v27 = 0;
  uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = 0;
  NSUInteger v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__22;
  unint64_t v20 = __Block_byref_object_dispose__22;
  uint64_t v21 = 0;
  if (tokenRanges) {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v21 = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke;
  v15[3] = &unk_1E51FB660;
  v15[4] = &v22;
  v15[5] = &v16;
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](self, "enumerateTagsInRange:scheme:options:usingBlock:", location, length, tagScheme, opts, v15);
  if (tokenRanges) {
    *tokenRanges = (NSArray *)v17[5];
  }
  id v13 = (NSArray *)v23[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    double v7 = a2;
  }
  else {
    double v7 = &stru_1ECA5C228;
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  NSUInteger v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    NSUInteger v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
    return [v9 addObject:v10];
  }
  return result;
}

- (void)enumerateTagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v19[7] = *MEMORY[0x1E4F143B8];
  if (range.location + range.length > [(NSString *)self->_string length])
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v15 = [(NSLinguisticTagger *)self _tagSchemeForScheme:scheme];
  if (v15)
  {
    id v16 = v15;
    reserved = self->_reserved;
    if (reserved)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke;
      v19[3] = &unk_1E51FB688;
      v19[4] = self;
      v19[5] = v16;
      v19[6] = block;
      off_1EB1EDB78(reserved, unit, location, length, options, v19);
    }
  }
}

void __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x185308110]();
  v3 = (void *)off_1EB1EDB80(*(void *)(a1[4] + 48), a1[5]);
  tagForNLTag(v3);
  (*(void (**)(void))(a1[6] + 16))();
  if (v3) {
    CFRelease(v3);
  }
}

- (NSLinguisticTag)tagAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_string length] <= charIndex)
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v12 = [(NSLinguisticTagger *)self _tagSchemeForScheme:scheme];
  if (!v12) {
    return 0;
  }
  id v13 = v12;
  reserved = self->_reserved;
  if (!reserved) {
    return 0;
  }
  id v15 = (void *)off_1EB1EDB60(reserved, unit, charIndex, v13);
  id v16 = (NSString *)tagForNLTag(v15);
  if (v15) {
    CFRelease(v15);
  }
  if (tokenRange)
  {
    NSRange v19 = (NSRange)0;
    uint64_t v20 = 0;
    off_1EB1EDB70(&v19, self->_reserved, 0, charIndex);
    *tokenRange = v19;
  }
  return v16;
}

- (NSArray)tagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v17[6] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if (tokenRanges) {
    id v15 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  }
  else {
    id v15 = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke;
  v17[3] = &unk_1E51FB6B0;
  v17[4] = v14;
  v17[5] = v15;
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](self, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, scheme, options, v17);
  if (tokenRanges) {
    *tokenRanges = v15;
  }
  return v14;
}

uint64_t __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    double v7 = a2;
  }
  else {
    double v7 = &stru_1ECA5C228;
  }
  uint64_t result = [*(id *)(a1 + 32) addObject:v7];
  NSUInteger v9 = *(void **)(a1 + 40);
  if (v9)
  {
    NSUInteger v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
    return [v9 addObject:v10];
  }
  return result;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_string length] <= charIndex)
  {
    NSUInteger v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  reserved = self->_reserved;
  if (reserved)
  {
    NSUInteger v12 = 0;
    NSUInteger v13 = 0;
    uint64_t v14 = 0;
    off_1EB1EDB70(&v12, reserved, unit, charIndex);
    NSUInteger v9 = v12;
    NSUInteger v10 = v13;
  }
  else
  {
    NSUInteger v10 = 0;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (NSString)dominantLanguage
{
  if (![(NSString *)self->_string length]) {
    return 0;
  }
  reserved = self->_reserved;
  if (!reserved) {
    return 0;
  }
  objc_super v4 = (void *)off_1EB1EDB60(reserved, 3, 0, @"Language");
  objc_super v5 = (NSString *)tagForNLTag(v4);
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

+ (NSLinguisticTag)tagForString:(NSString *)string atIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme orthography:(NSOrthography *)orthography tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v14 = [NSLinguisticTagger alloc];
  uint64_t v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:scheme], 0x80000000);
  [(NSLinguisticTagger *)v15 setString:string];
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, [(NSString *)string length]);
  }
  id v16 = [(NSLinguisticTagger *)v15 tagAtIndex:charIndex unit:unit scheme:scheme tokenRange:tokenRange];

  return v16;
}

+ (NSArray)tagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v15 = [NSLinguisticTagger alloc];
  id v16 = -[NSLinguisticTagger initWithTagSchemes:options:](v15, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:scheme], 0x80000000);
  [(NSLinguisticTagger *)v16 setString:string];
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:](v16, "setOrthography:range:", orthography, 0, [(NSString *)string length]);
  }
  NSUInteger v17 = -[NSLinguisticTagger tagsInRange:unit:scheme:options:tokenRanges:](v16, "tagsInRange:unit:scheme:options:tokenRanges:", location, length, unit, scheme, options, tokenRanges);

  return v17;
}

+ (void)enumerateTagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v15 = [NSLinguisticTagger alloc];
  id v16 = -[NSLinguisticTagger initWithTagSchemes:options:](v15, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:scheme], 0x80000000);
  [(NSLinguisticTagger *)v16 setString:string];
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:](v16, "setOrthography:range:", orthography, 0, [(NSString *)string length]);
  }
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](v16, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, scheme, options, block);
}

+ (NSString)dominantLanguageForString:(NSString *)string
{
  objc_super v4 = [NSLinguisticTagger alloc];
  objc_super v5 = -[NSLinguisticTagger initWithTagSchemes:options:](v4, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:@"Language"], 0x80000000);
  [(NSLinguisticTagger *)v5 setString:string];
  uint64_t v6 = [(NSLinguisticTagger *)v5 dominantLanguage];

  return v6;
}

- (BOOL)_acceptSentenceTerminatorRange:(_NSRange)a3 paragraphRange:(_NSRange)a4 tokens:(_NSLTToken *)a5 count:(unint64_t)a6 tokenIndex:(unint64_t)a7
{
  NSUInteger location = a4.location;
  if (-[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3.location, a3.length, a4.location, a4.length) == 46)
  {
    if (!a7) {
      goto LABEL_14;
    }
    NSUInteger v11 = &a5[a7 - 1];
    if (v11->var2 - 14 > 0x4A) {
      goto LABEL_14;
    }
    int var1 = v11->var1;
    if (var1 + v11->var0 != a5[a7].var0) {
      goto LABEL_14;
    }
    if (var1 == 1) {
      return 0;
    }
    if (!qword_1EB1EDB88) {
      qword_1EB1EDB88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"mr", @"mrs", @"ms", @"messrs", @"mme", @"mmes", @"mlle", @"sr", @"sra", @"srta", @"dr", @"drs", @"pres", @"sen", @"atty", @"supt", @"amb",
    }
                          @"lcdo",
                          @"ldo",
                          @"st",
                          @"msgr",
                          @"fr",
                          @"rdo",
                          @"adm",
                          @"col",
                          @"maj",
                          @"cmdr",
                          @"cdr",
                          @"capt",
                          @"lieut",
                          @"lt",
                          @"sgt",
                          @"cpl",
                          @"pvt",
                          @"jan",
                          @"feb",
                          @"febr",
                          @"apr",
                          @"jun",
                          @"jul",
                          @"aug",
                          @"sep",
                          @"oct",
                          @"nov",
                          @"dec",
                          @"ph",
                          @"eg",
                          @"ie",
                          @"viz",
                          @"vs",
                          0);
    if (!qword_1EB1EDB90) {
      qword_1EB1EDB90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"M", @"Hon", @"Rep", @"Gov", @"Sec", @"Prof", @"Ing", @"Rev", @"Gen", @"Ens", @"Spec", @"Mar", @"Sept", 0);
    }
    if (v11->var1)
    {
      NSUInteger v13 = [(NSString *)self->_string substringWithRange:location + v11->var0];
      uint64_t v14 = [(NSString *)v13 lowercaseString];
      if (([(id)qword_1EB1EDB90 containsObject:v13] & 1) != 0
        || ([(id)qword_1EB1EDB88 containsObject:v14] & 1) != 0)
      {
        return 0;
      }
      char v15 = [@"no" isEqualToString:v14] ^ 1;
    }
    else
    {
LABEL_14:
      char v15 = 1;
    }
    unint64_t v16 = a7 + 1;
    if (a7 + 1 < a6)
    {
      NSUInteger v17 = &a5[v16];
      int var2 = v17->var2;
      if ((var2 - 14) > 0x4A)
      {
        if ((var2 - 2) <= 0xB)
        {
          uint64_t var0 = v17->var0;
          if (a5[a7].var1 + a5[a7].var0 == var0)
          {
            -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB10, 8, location + var0, a5[v16].var1);
            if (!v20 || [(NSString *)self->_string characterAtIndex:location + v17->var0] == 45) {
              return 0;
            }
          }
        }
      }
      else if (a5[a7].var1 + a5[a7].var0 == v17->var0)
      {
        return 0;
      }
      unint64_t v21 = a7 + 2;
      p_int var2 = &a5[a7 + 1].var2;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (*p_var2 - 14 > 0x4A)
        {
          uint64_t v24 = 0;
        }
        else
        {
          uint64_t v23 = location + *(unsigned __int16 *)(p_var2 - 3);
          uint64_t v24 = *(p_var2 - 1);
          if (*(p_var2 - 1)) {
            break;
          }
        }
        p_var2 += 16;
      }
      while (v21++ < a6);
      if (v24)
      {
        -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", +[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"), 8, v23, v24);
        if (v26) {
          return 0;
        }
        if ((v15 & 1) == 0)
        {
          -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB20, 8, v23, v24);
          if (v28) {
            return 0;
          }
        }
      }
    }
  }
  return 1;
}

- (void)_acceptSentencesForParagraphRange:(_NSRange)a3
{
  if ((unint64_t)qword_1EB1EDB98 >= 2)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v6 = 0;
    uint64_t v7 = 24;
    do
    {
      if (*(unsigned char *)(qword_1EB1EDBA0 + v7 - 21) != 2
        || [(NSLinguisticTagger *)self _acceptSentenceTerminatorRange:location + *(unsigned __int16 *)(qword_1EB1EDBA0 + v7 - 24) paragraphRange:*(unsigned __int8 *)(qword_1EB1EDBA0 + v7 - 22) tokens:location count:length tokenIndex:v6])
      {
        goto LABEL_16;
      }
      uint64_t v8 = qword_1EB1EDBA0;
      int v9 = *(unsigned __int8 *)(qword_1EB1EDBA0 + v7 - 22);
      if (v6 && v9 == 1)
      {
        if (*(unsigned __int8 *)(qword_1EB1EDBA0 + v7 - 37) - 14 <= 0x4A
          && *(unsigned __int8 *)(qword_1EB1EDBA0 + v7 - 38) + *(unsigned __int16 *)(qword_1EB1EDBA0 + v7 - 40) == *(unsigned __int16 *)(qword_1EB1EDBA0 + v7 - 24))
        {
          uint64_t v10 = v6 - 1;
          goto LABEL_14;
        }
      }
      else if (v9 != 1)
      {
        goto LABEL_15;
      }
      int v11 = *(unsigned __int8 *)(qword_1EB1EDBA0 + v7 - 5);
      if ((v11 - 14) > 0x4A
        || *(unsigned __int16 *)(qword_1EB1EDBA0 + v7 - 24) + 1 != *(unsigned __int16 *)(qword_1EB1EDBA0 + v7 - 8))
      {
LABEL_15:
        *(unsigned char *)(qword_1EB1EDBA0 + v7 - 21) = 13;
        goto LABEL_16;
      }
      uint64_t v12 = qword_1EB1EDBA0 + v7;
      *(unsigned char *)(v12 - 21) = v11;
      *(void *)(v12 - 16) = *(void *)(v8 + v7);
      uint64_t v10 = v6;
LABEL_14:
      joinTokensInRange(v8, v10, 2uLL);
LABEL_16:
      unint64_t v13 = v6 + 2;
      ++v6;
      v7 += 16;
    }
    while (v13 < qword_1EB1EDB98);
  }
}

- (void)_calculateSentenceRangesForParagraphRange:(_NSRange)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    unint64_t v6 = 0;
    unint64_t v8 = qword_1EB1EDB98;
    uint64_t v7 = qword_1EB1EDBA0;
    uint64_t v9 = qword_1EB1EDBA8;
    NSUInteger v10 = a3.location;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v11 = sentenceRangeAtIndexInTokens(v10, location, length, v7, v8, &v14);
      if (v6 < 0x100)
      {
        unint64_t v13 = (_WORD *)(v9 + 8 * v6);
        _WORD *v13 = v11 - location;
        v13[1] = v12;
        v13[2] = v14;
        v13[3] = v15;
        ++v6;
      }
      NSUInteger v10 = v11 + v12;
    }
    while (v10 < v3);
  }
}

- (void)_analyzePunctuationTokensInRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  if (a3.length)
  {
    NSUInteger location = a4.location;
    NSUInteger v5 = a3.length;
    NSUInteger v6 = a3.location;
    do
    {
      unint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAE0, 0, v6, v5);
      unint64_t v9 = v8;
      NSUInteger v10 = v6 + v5;
      if (v11) {
        BOOL v12 = v8 >= v10;
      }
      else {
        BOOL v12 = 1;
      }
      int v13 = v12;
      if (v13) {
        unint64_t v14 = v6 + v5;
      }
      else {
        unint64_t v14 = v8;
      }
      if (v14 > v6 && (unint64_t)qword_1EB1EDB98 <= 0xFFF)
      {
        uint64_t v15 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
        *(_WORD *)uint64_t v15 = v6 - location;
        *(unsigned char *)(v15 + 2) = v14 - v6;
        *(unsigned char *)(v15 + 3) = 88;
        *(_DWORD *)(v15 + 4) = 0;
        *(void *)(v15 + 8) = 0;
        ++qword_1EB1EDB98;
      }
      if (v13) {
        return;
      }
      unint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAE8, 0, v14, v10 - v14);
      if (v16 >= v10 || v17 == 0) {
        NSUInteger v6 = v10;
      }
      else {
        NSUInteger v6 = v16;
      }
      if (v6 > v9)
      {
        unint64_t v19 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAF8, 0, v14, v6 - v9);
        if (v20)
        {
          unint64_t v21 = v19;
          uint64_t v22 = v20;
          if (v19 > v9) {
            -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v14, v19 - v9, location, length);
          }
          if (v6 > v21 + v22)
          {
            unint64_t v23 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB00, 0, v21 + v22, v6 - (v21 + v22));
            unint64_t v24 = v23;
            if (v25) {
              BOOL v26 = v6 > v23;
            }
            else {
              BOOL v26 = 0;
            }
            int v27 = v26;
            if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
            {
              if (v27) {
                char v28 = v23;
              }
              else {
                char v28 = v6;
              }
              uint64_t v29 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
              *(_WORD *)uint64_t v29 = v21 - location;
              *(unsigned char *)(v29 + 2) = v28 - v21;
              *(unsigned char *)(v29 + 3) = 2;
              *(_DWORD *)(v29 + 4) = 0;
              *(void *)(v29 + 8) = 0;
              ++qword_1EB1EDB98;
            }
            if (!v27) {
              goto LABEL_101;
            }
            NSUInteger v30 = v6 - v23;
            goto LABEL_100;
          }
          if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
          {
            uint64_t v39 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
            *(_WORD *)uint64_t v39 = v21 - location;
            *(unsigned char *)(v39 + 2) = v22;
            char v40 = 2;
LABEL_53:
            *(unsigned char *)(v39 + 3) = v40;
            *(_DWORD *)(v39 + 4) = 0;
            *(void *)(v39 + 8) = 0;
            ++qword_1EB1EDB98;
          }
        }
        else
        {
          uint64_t v31 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB10, 0, v14, v6 - v9);
          if (v32)
          {
            unint64_t v33 = v31;
            uint64_t v34 = v32;
            uint64_t v35 = [(NSString *)self->_string characterAtIndex:v31];
            int v36 = v35;
            if (v33 > v9 && (unint64_t)qword_1EB1EDB98 <= 0xFFF)
            {
              uint64_t v37 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
              *(_WORD *)uint64_t v37 = v9 - location;
              *(unsigned char *)(v37 + 2) = v33 - v9;
              *(unsigned char *)(v37 + 3) = 13;
              *(_DWORD *)(v37 + 4) = 0;
              *(void *)(v37 + 8) = 0;
              ++qword_1EB1EDB98;
            }
            if (v35 == 45)
            {
              for (NSUInteger i = v34 + v33;
                    i < v6 && [(NSString *)self->_string characterAtIndex:v33 + v34] == 45;
                    NSUInteger i = v33 + v34)
              {
                ++v34;
              }
              if (v34) {
                char v41 = 11;
              }
              else {
                char v41 = 9;
              }
              goto LABEL_97;
            }
            if (v35 >> 1 == 4104)
            {
              char v41 = 9;
              goto LABEL_97;
            }
            if ((v35 - 8210) < 4)
            {
              char v41 = 11;
              goto LABEL_97;
            }
            if (v35 == 41)
            {
              char v41 = 8;
              goto LABEL_97;
            }
            if (v35 == 40)
            {
              char v41 = 7;
              goto LABEL_97;
            }
            if ([(id)qword_1EB1EDB18 characterIsMember:v35])
            {
              uint64_t v42 = 0;
              string = self->_string;
              while (1)
              {
                if (openingStrengthForQuoteCharacter_singleQuotes[v42] == v36)
                {
                  int v45 = 0;
                  NSUInteger v47 = "\x02\x03\x01\x04\x01\x03\x01\x04";
                  goto LABEL_73;
                }
                if (openingStrengthForQuoteCharacter_doubleQuotes[v42] == v36) {
                  break;
                }
                if (++v42 == 9)
                {
                  NSUInteger v44 = [(NSString *)self->_string length];
                  int v45 = 0;
                  unsigned int v46 = 2;
                  goto LABEL_76;
                }
              }
              int v45 = 1;
              NSUInteger v47 = "\x02\x03\x01\x03\x01\x04\x01\x04";
LABEL_73:
              unsigned int v46 = v47[v42];
              NSUInteger v44 = [(NSString *)self->_string length];
              if (v46 > 3)
              {
LABEL_74:
                char v41 = 5;
                goto LABEL_97;
              }
              if (!v46)
              {
                char v41 = 6;
                goto LABEL_97;
              }
LABEL_76:
              v60 = string;
              unint64_t v61 = v44;
              int v62 = v45;
              if (v33)
              {
                uint64_t v48 = [(NSString *)string characterAtIndex:v33 - 1];
                if (v48)
                {
                  char v59 = [(id)qword_1EB1EDAC8 characterIsMember:v48];
                  goto LABEL_81;
                }
              }
              else
              {
                uint64_t v48 = 0;
              }
              char v59 = 1;
LABEL_81:
              int v58 = [(id)qword_1EB1EDB38 characterIsMember:v48];
              int v49 = [(id)qword_1EB1EDB30 characterIsMember:v48];
              if (v33 + 1 >= v61) {
                uint64_t v50 = 0;
              }
              else {
                uint64_t v50 = -[NSString characterAtIndex:](v60, "characterAtIndex:");
              }
              int v51 = [(id)qword_1EB1EDB30 characterIsMember:v50];
              if (v62)
              {
                if (v46 != 2)
                {
                  if ((v51 & (v49 ^ 1)) != 0) {
                    char v41 = 5;
                  }
                  else {
                    char v41 = 6;
                  }
                  if ((v49 & (v51 ^ 1)) != 0) {
                    char v52 = 6;
                  }
                  else {
                    char v52 = 5;
                  }
                  if (v46 == 3) {
                    char v41 = v52;
                  }
                  goto LABEL_97;
                }
                if (v59) {
                  goto LABEL_74;
                }
                BOOL v55 = v48 == 39;
LABEL_118:
                int v57 = v58;
                if (v55) {
                  int v57 = 1;
                }
                if (v57) {
                  char v41 = 5;
                }
                else {
                  char v41 = 6;
                }
                goto LABEL_97;
              }
              int v53 = v51 ^ 1;
              if (((v49 ^ 1) & 1) != 0 || v53)
              {
                if (v46 == 2)
                {
                  if (v59) {
                    goto LABEL_74;
                  }
                  BOOL v55 = v48 == 34;
                  goto LABEL_118;
                }
                if ((v51 & (v49 ^ 1)) != 0) {
                  char v56 = 5;
                }
                else {
                  char v56 = 6;
                }
                if ((v49 & v53) != 0) {
                  char v41 = 6;
                }
                else {
                  char v41 = 5;
                }
                if (v46 != 3) {
                  char v41 = v56;
                }
LABEL_97:
                if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
                {
                  uint64_t v54 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
                  *(_WORD *)uint64_t v54 = v33 - location;
                  *(unsigned char *)(v54 + 2) = v34;
                  *(unsigned char *)(v54 + 3) = v41;
                  *(_DWORD *)(v54 + 4) = 0;
                  *(void *)(v54 + 8) = 0;
                  ++qword_1EB1EDB98;
                }
                unint64_t v24 = v34 + v33;
                NSUInteger v30 = v6 - (v34 + v33);
                if (v6 <= v34 + v33) {
                  goto LABEL_101;
                }
LABEL_100:
                -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v24, v30, location, length);
                goto LABEL_101;
              }
            }
            char v41 = 13;
            goto LABEL_97;
          }
          if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
          {
            uint64_t v39 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
            *(_WORD *)uint64_t v39 = v9 - location;
            *(unsigned char *)(v39 + 2) = v6 - v9;
            char v40 = 13;
            goto LABEL_53;
          }
        }
      }
LABEL_101:
      NSUInteger v5 = v10 - v6;
    }
    while (v10 != v6);
  }
}

- (void)_analyzeTokensInInterwordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  if (a3.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    NSUInteger v6 = a3.length;
    NSUInteger v7 = a3.location;
    do
    {
      unint64_t v9 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAC8, 0, v7, v6);
      unint64_t v10 = v9;
      NSUInteger v11 = v7 + v6;
      if (v12) {
        BOOL v13 = v11 > v9;
      }
      else {
        BOOL v13 = 0;
      }
      int v14 = !v13;
      if (v14) {
        unint64_t v15 = v11;
      }
      else {
        unint64_t v15 = v9;
      }
      if (v15 > v7) {
        -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:](self, "_analyzePunctuationTokensInRange:paragraphRange:", v7, v15 - v7, location, length);
      }
      if (v14) {
        break;
      }
      unint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAD0, 0, v10, v11 - v10);
      BOOL v18 = v16 >= v11 || v17 == 0;
      NSUInteger v7 = v18 ? v11 : v16;
      NSUInteger v6 = v11 - v7;
    }
    while (v6);
  }
}

- (void)_analyzeTokensInWordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  unint64_t v9 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB08, 4, a3.location, a3.length);
  if (v10) {
    BOOL v11 = v9 > v7;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    if (!v10)
    {
LABEL_27:
      if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
      {
        uint64_t v25 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
        *(_WORD *)uint64_t v25 = v7 - location;
        *(unsigned char *)(v25 + 2) = v6;
        *(unsigned char *)(v25 + 3) = 88;
        *(_DWORD *)(v25 + 4) = 0;
        *(void *)(v25 + 8) = 0;
        ++qword_1EB1EDB98;
      }
      return;
    }
    goto LABEL_19;
  }
  char v12 = v7 + v6;
  NSUInteger v13 = v7 + v6 - (v9 + v10);
  if (v7 + v6 > v9 + v10)
  {
    if (v13 == 2)
    {
      [(NSString *)self->_string rangeOfString:@"ve", 13, v7, v6 options range];
      if (v37
        || ([(NSString *)self->_string rangeOfString:@"ll", 13, v7, v6 options range], v38)|| ([(NSString *)self->_string rangeOfString:@"re", 13, v7, v6 options range], v39))
      {
        unint64_t v17 = -3;
        goto LABEL_47;
      }
    }
    else if (v13 == 1)
    {
      [(NSString *)self->_string rangeOfString:@"s", 13, v7, v6 options range];
      if (v14
        || ([(NSString *)self->_string rangeOfString:@"d", 13, v7, v6 options range], v15)|| ([(NSString *)self->_string rangeOfString:@"m", 13, v7, v6 options range], v16))
      {
        [(NSString *)self->_string rangeOfString:@"t", 13, v7, v6 options range];
        unint64_t v17 = -2;
        if (!v18) {
          goto LABEL_47;
        }
        int v19 = 0;
        goto LABEL_15;
      }
      [(NSString *)self->_string rangeOfString:@"t", 13, v7, v6 options range];
      if (v45)
      {
        int v19 = 1;
        unint64_t v17 = 0x8000000000000001;
LABEL_15:
        [(NSString *)self->_string rangeOfString:@"n", 13, v7, v6 - 2 options range];
        if (v20) {
          unint64_t v17 = -3;
        }
        if (v19 && !v20) {
          goto LABEL_19;
        }
LABEL_47:
        unint64_t v40 = v17 + v6;
        -[NSLinguisticTagger _analyzeTokensInWordRange:paragraphRange:](self, "_analyzeTokensInWordRange:paragraphRange:", v7, v40, location, length);
        if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
        {
          uint64_t v41 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
          *(_WORD *)uint64_t v41 = v40 + v7 - location;
          *(unsigned char *)(v41 + 2) = v12 - (v40 + v7);
          *(unsigned char *)(v41 + 3) = 88;
          *(_DWORD *)(v41 + 4) = 0;
          *(void *)(v41 + 8) = 0;
          ++qword_1EB1EDB98;
        }
        return;
      }
    }
  }
LABEL_19:
  unint64_t v21 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB08, 0, v7, v6);
  if (v22) {
    BOOL v23 = v21 > v7;
  }
  else {
    BOOL v23 = 0;
  }
  if (!v23 || v21 + v22 >= v7 + v6) {
    goto LABEL_27;
  }
  unint64_t v26 = v21 - v7;
  if (v21 - v7 == 4)
  {
    [(NSString *)self->_string rangeOfString:@"entr", 9, v7, v6 options range];
    if (!v42) {
      goto LABEL_27;
    }
    uint64_t v36 = 5;
  }
  else if (v26 == 2)
  {
    [(NSString *)self->_string rangeOfString:@"qu", 9, v7, v6 options range];
    if (!v43) {
      goto LABEL_27;
    }
    uint64_t v36 = 3;
  }
  else
  {
    if (v26 != 1) {
      goto LABEL_27;
    }
    [(NSString *)self->_string rangeOfString:@"c", 9, v7, v6 options range];
    if (!v27)
    {
      [(NSString *)self->_string rangeOfString:@"d", 9, v7, v6 options range];
      if (!v28)
      {
        [(NSString *)self->_string rangeOfString:@"j", 9, v7, v6 options range];
        if (!v29)
        {
          [(NSString *)self->_string rangeOfString:@"l", 9, v7, v6 options range];
          if (!v30)
          {
            [(NSString *)self->_string rangeOfString:@"m", 9, v7, v6 options range];
            if (!v31)
            {
              [(NSString *)self->_string rangeOfString:@"n", 9, v7, v6 options range];
              if (!v32)
              {
                [(NSString *)self->_string rangeOfString:@"s", 9, v7, v6 options range];
                if (!v33)
                {
                  [(NSString *)self->_string rangeOfString:@"t", 9, v7, v6 options range];
                  if (!v34)
                  {
                    [(NSString *)self->_string rangeOfString:@"y", 9, v7, v6 options range];
                    if (!v35) {
                      goto LABEL_27;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v36 = 2;
  }
  if ((unint64_t)qword_1EB1EDB98 <= 0xFFF)
  {
    uint64_t v44 = qword_1EB1EDBA0 + 16 * qword_1EB1EDB98;
    *(_WORD *)uint64_t v44 = v7 - location;
    *(unsigned char *)(v44 + 2) = v36;
    *(unsigned char *)(v44 + 3) = 88;
    *(_DWORD *)(v44 + 4) = 0;
    *(void *)(v44 + 8) = 0;
    ++qword_1EB1EDB98;
  }

  -[NSLinguisticTagger _analyzeTokensInWordRange:paragraphRange:](self, "_analyzeTokensInWordRange:paragraphRange:", v36 + v7, v6 - v36, location, length);
}

- (id)_tokenDataForParagraphRange:(_NSRange)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  BOOL v6 = a6;
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  memset(v122, 0, sizeof(v122));
  memset(v121, 0, sizeof(v121));
  bzero(v120, 0x800uLL);
  CFIndex v118 = length;
  uint64_t v119 = (CFStringRef *)self;
  v124.CFIndex location = location;
  v124.CFIndex length = length;
  char v12 = (__CFString *)CFStringTokenizerCopyBestStringLanguage((CFStringRef)self->_string, v124);
  int v13 = [(__CFString *)v12 hasPrefix:@"ja"];
  int v14 = [(__CFString *)v12 hasPrefix:@"zh"];
  if (v12) {
    CFRelease(v12);
  }
  qword_1EB1EDB98 = 0;
  uint64_t v15 = (void *)qword_1EB1EDBA0;
  if (!qword_1EB1EDBA0)
  {
    uint64_t v15 = malloc_type_calloc(0x1000uLL, 0x10uLL, 0x10820401907A9A8uLL);
    qword_1EB1EDBA0 = (uint64_t)v15;
  }
  uint64_t v16 = (void *)qword_1EB1EDBA8;
  if (!qword_1EB1EDBA8)
  {
    uint64_t v16 = malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
    qword_1EB1EDBA8 = (uint64_t)v16;
    uint64_t v15 = (void *)qword_1EB1EDBA0;
  }
  unint64_t v17 = 0;
  if (v15 && v16)
  {
    BOOL v109 = a5;
    BOOL v110 = a4;
    if (v13)
    {
      uint64_t v18 = (__CFStringTokenizer *)qword_1EB1EDBB0;
      if (qword_1EB1EDBB0) {
        goto LABEL_17;
      }
      CFLocaleRef v19 = CFLocaleCreate(0, @"ja");
      v125.CFIndex location = 0;
      v125.CFIndex length = 0;
      CFStringTokenizerRef v20 = CFStringTokenizerCreate(0, &stru_1ECA5C228, v125, 0, v19);
      qword_1EB1EDBB0 = (uint64_t)v20;
      if (v19)
      {
        CFRelease(v19);
        uint64_t v18 = (__CFStringTokenizer *)qword_1EB1EDBB0;
        if (!qword_1EB1EDBB0) {
          goto LABEL_15;
        }
LABEL_17:
        CFIndex v21 = v118;
        v127.CFIndex location = location;
        v127.CFIndex length = v118;
        CFStringTokenizerSetString(v18, v119[3], v127);
        CharactersPtr = CFStringGetCharactersPtr(v119[3]);
        BOOL v23 = v18;
        if (CharactersPtr)
        {
          unint64_t v24 = CharactersPtr;
          uint64_t v25 = (UniChar *)malloc_type_malloc(2 * v118, 0x1000040BDFB0063uLL);
          if (v25)
          {
            unint64_t v26 = v25;
            uint64_t v27 = &v24[location];
            uint64_t v28 = (char *)v25;
            CFIndex v21 = v118;
            if (!v118) {
              goto LABEL_49;
            }
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v29 = (const UniChar *)malloc_type_malloc(4 * v118, 0x1000040BDFB0063uLL);
          if (v29)
          {
            unint64_t v26 = v29;
            -[__CFString getCharacters:range:]((id)v119[3], "getCharacters:range:", v29, location, v118);
            uint64_t v28 = (char *)&v26[v118];
            uint64_t v27 = v26;
            if (!v118) {
              goto LABEL_49;
            }
LABEL_23:
            uint64_t v30 = (unsigned __int16 *)v27;
            CFIndex v31 = v21;
            do
            {
              unsigned int v33 = *v30++;
              unsigned int v32 = v33;
              unsigned int v34 = v33 - 65;
              unsigned int v35 = v33 - 192;
              if (v33 - 216 >= 7 && v34 >= 0x1A && v35 > 0x16)
              {
                if (v32 == 376)
                {
                  LOWORD(v32) = 255;
                }
                else if (v32)
                {
                  if (v32 - 313 < 0xF || v32 - 377 < 5 || v32 - 461 < 0xF) {
                    LOWORD(v32) = v32 + 1;
                  }
                }
                else if (v32 - 256 < 0x37 {
                       || v32 - 330 < 0x2D
                }
                       || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_18237F150, (uint32x4_t)vaddq_s32(vdupq_n_s32(v32), (int32x4_t)xmmword_18237F140)))) & 1) != 0|| v32 == 500)
                {
                  LOWORD(v32) = v32 + 1;
                }
              }
              else
              {
                LOWORD(v32) = v32 + 32;
              }
              *(_WORD *)uint64_t v28 = v32;
              v28 += 2;
              --v31;
            }
            while (v31);
LABEL_49:
            uint64_t v108 = (UniChar *)v26;
            unint64_t v115 = location + v21;
            tokenizer = v23;
            char v107 = v13;
            if (!CFStringTokenizerAdvanceToNextToken(v23))
            {
              CFIndex v40 = 0;
              CFIndex v44 = location;
              BOOL v84 = v110;
LABEL_158:
              uint64_t v91 = (void *)-[CFStringRef orthographyAtIndex:effectiveRange:](v119, "orthographyAtIndex:effectiveRange:", location, 0, v104);
              unint64_t v92 = orthographyFlagsForScores(v122, (uint64_t)v121, (uint64_t)v120);
              if (!v91)
              {
                if (v92)
                {
                  uint64_t v93 = +[NSSimpleOrthography orthographyWithFlags:v92];
                  if (v93) {
                    -[CFStringRef setOrthography:range:](v119, "setOrthography:range:", v93, location, v118);
                  }
                }
              }
              if (v115 > v44 + v40) {
                -[CFStringRef _analyzeTokensInInterwordRange:paragraphRange:](v119, "_analyzeTokensInInterwordRange:paragraphRange:", v44 + v40, v115 - (v44 + v40), location, v118);
              }
              -[CFStringRef _acceptSentencesForParagraphRange:](v119, "_acceptSentencesForParagraphRange:", location, v118);
              uint64_t v94 = tokenizer;
              if (v84 || v109 || v6)
              {
                if (v91)
                {
                  v95 = (void *)[v91 dominantLanguageForScript:@"Latn"];
                  if (([v95 isEqualToString:@"en"] & 1) == 0
                    && ([v95 isEqualToString:@"fr"] & 1) == 0
                    && ([v95 isEqualToString:@"de"] & 1) == 0
                    && ([v95 isEqualToString:@"es"] & 1) == 0
                    && ([v95 isEqualToString:@"it"] & 1) == 0
                    && ([v95 isEqualToString:@"pt"] & 1) == 0
                    && ([v95 isEqualToString:@"nl"] & 1) == 0
                    && ([v95 isEqualToString:@"ko"] & 1) == 0
                    && ([v95 isEqualToString:@"ru"] & 1) == 0)
                  {
                    [v95 isEqualToString:@"tr"];
                  }
                }
                if (qword_1EB1EDB98)
                {
                  uint64_t v96 = 0;
                  unint64_t v97 = 0;
                  do
                  {
                    int v98 = (unsigned __int16 *)(qword_1EB1EDBA0 + v96);
                    if (*(unsigned char *)(qword_1EB1EDBA0 + v96 + 3) == 88)
                    {
                      CFIndex v99 = location + *v98;
                      uint64_t v100 = *((unsigned __int8 *)v98 + 2);
                      -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB20, 0, v99, v100);
                      if (v101)
                      {
                        -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1EB1EDB28, 0, v99, v100);
                        if (!v102) {
                          *(unsigned char *)(qword_1EB1EDBA0 + v96 + 3) = 17;
                        }
                      }
                    }
                    ++v97;
                    v96 += 16;
                  }
                  while (v97 < qword_1EB1EDB98);
                }
                uint64_t v94 = tokenizer;
                if ((v107 & 1) == 0) {
                  -[CFStringRef _calculateSentenceRangesForParagraphRange:](v119, "_calculateSentenceRangesForParagraphRange:", location, v118);
                }
              }
              v128.CFIndex location = 0;
              v128.CFIndex length = 0;
              CFStringTokenizerSetString(v94, &stru_1ECA5C228, v128);
              free(v108);
              return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:qword_1EB1EDBA0 length:16 * qword_1EB1EDB98];
            }
            BOOL v106 = v6;
            uint64_t v114 = 0;
            CFIndex v40 = 0;
            unint64_t v41 = 0;
            int v112 = v13 | v14;
            CFIndex v104 = -location;
            NSUInteger v105 = v27;
            unint64_t v42 = location;
            uint64_t v43 = (unsigned __int16 *)&v27[-location];
            CFIndex v44 = v42;
            uint64_t v116 = 0;
            CFIndex v117 = v42;
            uint64_t v45 = tokenizer;
            do
            {
              CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v45);
              CFIndex v47 = CurrentTokenRange.location;
              CFIndex v48 = CurrentTokenRange.length;
              if (!v112
                || (-[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1EB1EDAF0, 0, CurrentTokenRange.location, CurrentTokenRange.length), v49))
              {
                CFIndex v50 = v44 + v40;
                if (CurrentTokenRange.location > v44 + v40)
                {
                  int v51 = [(__CFString *)(id)v119[3] characterAtIndex:CurrentTokenRange.location - 1];
                  if (v51 == 95 || v51 == 46)
                  {
                    CFIndex v48 = CurrentTokenRange.length + 1;
                    CFIndex v47 = CurrentTokenRange.location - 1;
                  }
                }
                CFIndex v52 = v47;
                unint64_t v53 = v48 + v47;
                if (v53 >= v115)
                {
                  CFIndex v44 = v52;
                }
                else
                {
                  CFIndex v44 = v52;
                  CFIndex v54 = v52 + 64;
                  while (1)
                  {
                    int v55 = -[__CFString characterAtIndex:]((id)v119[3], "characterAtIndex:", v53, v104, v105);
                    BOOL v56 = (v55 - 39) > 0x38
                       || ((1 << (v55 - 39)) & 0x100000000000081) == 0;
                    BOOL v57 = !v56 || v55 == 8217;
                    BOOL v58 = !v57;
                    if ((v55 - 8208) < 2 || v55 == 45) {
                      break;
                    }
LABEL_77:
                    if (v58) {
                      goto LABEL_102;
                    }
LABEL_95:
                    if (!CFStringTokenizerAdvanceToNextToken(tokenizer)
                      || (CFRange v70 = CFStringTokenizerGetCurrentTokenRange(tokenizer), v70.location != v53 + 1)
                      || (unint64_t v71 = v70.location + v70.length, v70.location + v70.length > v54))
                    {
                      CFStringTokenizerGoToTokenAtIndex(tokenizer, v53);
                      goto LABEL_102;
                    }
                    CFIndex v48 = v71 - v44;
                    unint64_t v53 = v70.location + v70.length;
                    if (v71 >= v115) {
                      goto LABEL_103;
                    }
                  }
                  switch(v48)
                  {
                    case 1:
                      [(__CFString *)(id)v119[3] rangeOfString:@"a", 9, v44, v48 options range];
                      if (v59) {
                        goto LABEL_95;
                      }
                      [(__CFString *)(id)v119[3] rangeOfString:@"t", 9, v44, v48 options range];
                      if (v60 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 1;
                      break;
                    case 2:
                      [(__CFString *)(id)v119[3] rangeOfString:@"co", 9, v44, v48 options range];
                      if (v62) {
                        goto LABEL_95;
                      }
                      [(__CFString *)(id)v119[3] rangeOfString:@"un", 9, v44, v48 options range];
                      if (v63 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 2;
                      break;
                    case 3:
                      [(__CFString *)(id)v119[3] rangeOfString:@"mal", 9, v44, v48 options range];
                      if (v65) {
                        goto LABEL_95;
                      }
                      [(__CFString *)(id)v119[3] rangeOfString:@"non", 9, v44, v48 options range];
                      if (v66 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 3;
                      break;
                    case 4:
                      [(__CFString *)(id)v119[3] rangeOfString:@"anti", 9, v44, v48 options range];
                      if (v68) {
                        BOOL v69 = 0;
                      }
                      else {
                        BOOL v69 = v58;
                      }
                      if (!v69) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 4;
                      break;
                    default:
                      goto LABEL_77;
                  }
                }
LABEL_102:
                unint64_t v71 = v53;
LABEL_103:
                if (v44 > v50) {
                  -[CFStringRef _analyzeTokensInInterwordRange:paragraphRange:](v119, "_analyzeTokensInInterwordRange:paragraphRange:", v50, v44 - v50, v117, v118);
                }
                if (v44 < v71)
                {
                  CFIndex v111 = v44;
                  unint64_t v72 = v44;
                  while (1)
                  {
                    if (v71 - v72 >= 0x40) {
                      unint64_t v73 = 64;
                    }
                    else {
                      unint64_t v73 = v71 - v72;
                    }
                    uint64_t v74 = NSOrthographyScriptIndexForCharacters((uint64_t)&v43[v72], v73, (uint64_t)v122);
                    ++*((void *)v121 + v74);
                    if (!qword_1EB1EDBC0) {
                      qword_1EB1EDBC0 = +[NSCharacterSet characterSetWithCharactersInString:@"~#@$%^\\|<."];
                    }
                    if (qword_1EB1EDBC8)
                    {
                      if (!v72) {
                        goto LABEL_121;
                      }
                    }
                    else
                    {
                      qword_1EB1EDBC8 = +[NSCharacterSet characterSetWithCharactersInString:@"~#@$%^\\|>:"];
                      if (!v72) {
                        goto LABEL_121;
                      }
                    }
                    -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1EB1EDBC0, 12, 0, v72, v104);
                    if (v75) {
                      goto LABEL_117;
                    }
LABEL_121:
                    unint64_t v77 = v73 + v72;
                    if (v115 <= v73 + v72)
                    {
                      if (v73) {
                        goto LABEL_127;
                      }
                    }
                    else
                    {
                      -[__CFString rangeOfCharacterFromSet:options:range:]((id)v119[3], "rangeOfCharacterFromSet:options:range:", qword_1EB1EDBC8, 8, v73 + v72, v115 - (v73 + v72));
                      if (v73 && !v78)
                      {
LABEL_127:
                        v79 = &v43[v72];
                        unint64_t v80 = v73;
                        while (1)
                        {
                          int v82 = *v79++;
                          int v81 = v82;
                          if (v82 == 46 || v81 == 95) {
                            break;
                          }
                          if (!--v80) {
                            goto LABEL_131;
                          }
                        }
LABEL_117:
                        if (v41)
                        {
                          uint64_t v76 = v116;
                          if (!v116) {
                            uint64_t v76 = langid_create();
                          }
                          uint64_t v116 = v76;
                          uint64_t v114 = langid_consume_string();
                          unint64_t v41 = 0;
                          unint64_t v77 = v73 + v72;
                          unint64_t v42 = v73 + v72;
                        }
                        else
                        {
                          unint64_t v77 = v73 + v72;
                        }
                        goto LABEL_133;
                      }
                      if (v78) {
                        goto LABEL_117;
                      }
                    }
LABEL_131:
                    scoreOrthographyForCharacters((unint64_t)&v43[v72], v73, v74, (uint64_t)v120);
                    unint64_t v41 = v72 - v42 + v73;
LABEL_133:
                    -[CFStringRef _analyzeTokensInWordRange:paragraphRange:](v119, "_analyzeTokensInWordRange:paragraphRange:", v72, v73, v117, v118, v104);
                    unint64_t v72 = v77;
                    if (v77 >= v71)
                    {
                      CFIndex v40 = v48;
                      CFIndex v44 = v111;
                      goto LABEL_136;
                    }
                  }
                }
                CFIndex v40 = v48;
              }
LABEL_136:
              uint64_t v45 = tokenizer;
            }
            while (CFStringTokenizerAdvanceToNextToken(tokenizer));
            if (v41)
            {
              uint64_t v83 = v116;
              CFIndex location = v117;
              if (v115 > v42)
              {
                BOOL v6 = v106;
                if (!v116) {
                  uint64_t v83 = langid_create();
                }
                uint64_t v114 = langid_consume_string();
                goto LABEL_148;
              }
            }
            else
            {
              uint64_t v83 = v116;
              CFIndex location = v117;
            }
            BOOL v6 = v106;
LABEL_148:
            BOOL v84 = v110;
            if (v83)
            {
              int v85 = numberOfLanguageCodes_numCodes;
              if (numberOfLanguageCodes_numCodes < 0)
              {
                int v85 = langid_numlanguages();
                numberOfLanguageCodes_numCodes = v85;
              }
              uint64_t v86 = (unsigned __int8 *)orthoIndexesForLanguageCodes();
              v87 = (unsigned int *)v114;
              if (v86 && v85 >= 1)
              {
                uint64_t v88 = v85;
                do
                {
                  unsigned int v90 = *v86++;
                  uint64_t v89 = v90;
                  if (v90) {
                    v120[v89] += *v87;
                  }
                  ++v87;
                  --v88;
                }
                while (v88);
              }
              langid_dispose();
            }
            goto LABEL_158;
          }
        }
        return 0;
      }
      uint64_t v18 = v20;
      if (v20) {
        goto LABEL_17;
      }
    }
LABEL_15:
    uint64_t v18 = (__CFStringTokenizer *)qword_1EB1EDBB8;
    if (!qword_1EB1EDBB8)
    {
      v126.CFIndex location = 0;
      v126.CFIndex length = 0;
      uint64_t v18 = CFStringTokenizerCreate(0, &stru_1ECA5C228, v126, 0, 0);
      qword_1EB1EDBB8 = (uint64_t)v18;
      if (!v18) {
        return 0;
      }
    }
    goto LABEL_17;
  }
  return v17;
}

- (void)_tokenizeParagraphAtIndex:(unint64_t)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  unint64_t v11 = [(NSString *)self->_string length];
  if (v11 <= a3) {
    return;
  }
  unint64_t v12 = v11;
  uint64_t v13 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0);
  unint64_t v15 = v14;
  if (v14 <= 0x10000)
  {
    uint64_t v16 = v13;
LABEL_6:
    if (!v15) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v16 = ((a3 - v13) & 0xFFFFFFFFFFFF0000) + v13;
  unint64_t v15 = v13 + v14 - v16;
  if (v15 <= 0x10000) {
    goto LABEL_6;
  }
  unint64_t v15 = 0x10000;
LABEL_7:
  [(id)qword_1EB1EDAA8 lock];
  id v17 = -[NSLinguisticTagger _tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", v16, v15, v8, v7, v6);
  [(id)qword_1EB1EDAA8 unlock];
  if (self->_tokenArray)
  {
    if (!v17) {
      return;
    }
  }
  else
  {
    CFLocaleRef v19 = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:[(NSLinguisticTagger *)self zone]] init];
    self->_id tokenArray = v19;
    -[NSMutableRLEArray insertObject:range:](v19, "insertObject:range:", [MEMORY[0x1E4F1CA98] null], 0, v12);
    if (!v17) {
      return;
    }
  }
  id tokenArray = self->_tokenArray;

  objc_msgSend(tokenArray, "replaceObjectsInRange:withObject:length:", v16, v15, v17, v15);
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 requireLemmas:(BOOL)a5 requirePartsOfSpeech:(BOOL)a6 requireNamedEntities:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v13 = [self->_tokenArray count];
  _NSRange v18 = (_NSRange)xmmword_18235A300;
  if (v13 <= a3
    || (unint64_t v14 = (void *)[self->_tokenArray objectAtIndex:a3 effectiveRange:&v18]) == 0
    || (unint64_t v15 = v14, objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))))
  {
    -[NSLinguisticTagger _tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:](self, "_tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:", a3, v9, v8, v7, v18);
    uint64_t v16 = (void *)[self->_tokenArray objectAtIndex:a3 effectiveRange:&v18];
    if (objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
      unint64_t v15 = 0;
    }
    else {
      unint64_t v15 = v16;
    }
  }
  if (a4) {
    *a4 = v18;
  }
  return v15;
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 tagScheme:(id)a5
{
  id v8 = [(NSLinguisticTagger *)self _tagSchemeForScheme:@"Lemma", a4, a5];
  if ([(NSLinguisticTagger *)self _tagSchemeForScheme:@"NameType"]
    || [(NSLinguisticTagger *)self _tagSchemeForScheme:@"NameTypeOrLexicalClass"])
  {
    uint64_t v9 = 1;
LABEL_4:
    BOOL v10 = 1;
    goto LABEL_5;
  }
  if ([(NSLinguisticTagger *)self _tagSchemeForScheme:@"LexicalClass"])
  {
    uint64_t v9 = 0;
    goto LABEL_4;
  }
  id v12 = [(NSLinguisticTagger *)self _tagSchemeForScheme:@"InternalClass"];
  uint64_t v9 = 0;
  BOOL v10 = v12 != 0;
LABEL_5:

  return [(NSLinguisticTagger *)self _tokenDataForParagraphAtIndex:a3 paragraphRange:a4 requireLemmas:v8 != 0 requirePartsOfSpeech:v10 requireNamedEntities:v9];
}

- (void)_enumerateTagsInRange:(_NSRange)a3 scheme:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v18[6] = *MEMORY[0x1E4F143B8];
  NSUInteger v13 = [(NSString *)self->_string length];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[4] = 0;
  v18[5] = 0;
  v18[3] = &unk_18246906D;
  if (location + length > v13)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  id v14 = [(NSLinguisticTagger *)self _tagSchemeForScheme:a4];
  if (v14)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke;
      v17[3] = &unk_1E51FB6D8;
      v17[4] = self;
      v17[5] = v14;
      v17[6] = a6;
      void v17[7] = v18;
      off_1EB1EDB78(reserved, 0, location, length, a5, v17);
    }
  }
  _Block_object_dispose(v18, 8);
}

void __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke(void *a1, unint64_t *a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)MEMORY[0x185308110]();
  unint64_t v7 = *a2;
  id v8 = (void *)off_1EB1EDB80(*(void *)(a1[4] + 48), a1[5]);
  tagForNLTag(v8);
  char v11 = 0;
  if (v7 >= *(void *)(*(void *)(a1[7] + 8) + 40) + *(void *)(*(void *)(a1[7] + 8) + 32))
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
    off_1EB1EDB70(&v9, *(void *)(a1[4] + 48), 1, v7);
    *(_OWORD *)(*(void *)(a1[7] + 8) + 32) = v9;
  }
  (*(void (**)(void))(a1[6] + 16))();
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    *a3 = 1;
  }
}

@end
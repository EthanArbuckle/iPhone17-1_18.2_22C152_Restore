@interface AXMSemanticTextFactory
- (BOOL)_lexiconExistsForLocale:(id)a3;
- (BOOL)_string:(id)a3 containsOnlyCharactersFrom:(id)a4;
- (BOOL)_textExistsInLexicon:(id)a3 withLocale:(id)a4;
- (NLTagger)tagger;
- (NSDataDetector)dataDetector;
- (NSMutableDictionary)cachedLexicons;
- (NSMutableDictionary)compiledPatterns;
- (NSNumberFormatter)numberFormatter;
- (_LXLexicon)_lexiconForLocale:(id)a3;
- (id)_preprocessedText:(id)a3;
- (id)semanticTextForText:(id)a3 withLocale:(id)a4;
- (void)_applyCustomPatterns:(id)a3;
- (void)_applyDataDetectors:(id)a3;
- (void)_applyNaturalLanguageTokens:(id)a3;
- (void)_performSemanticAnalysis:(id)a3;
- (void)dataDetector;
- (void)setCachedLexicons:(id)a3;
- (void)setCompiledPatterns:(id)a3;
- (void)setDataDetector:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setTagger:(id)a3;
@end

@implementation AXMSemanticTextFactory

- (NLTagger)tagger
{
  v10[4] = *MEMORY[0x1E4F143B8];
  tagger = self->_tagger;
  if (!tagger)
  {
    uint64_t v4 = *MEMORY[0x1E4F38860];
    v10[0] = *MEMORY[0x1E4F38880];
    v10[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F38870];
    v10[2] = *MEMORY[0x1E4F38868];
    v10[3] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
    v7 = (NLTagger *)[objc_alloc(MEMORY[0x1E4F388F0]) initWithTagSchemes:v6];
    v8 = self->_tagger;
    self->_tagger = v7;

    tagger = self->_tagger;
  }

  return tagger;
}

- (NSMutableDictionary)cachedLexicons
{
  cachedLexicons = self->_cachedLexicons;
  if (!cachedLexicons)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = self->_cachedLexicons;
    self->_cachedLexicons = v4;

    cachedLexicons = self->_cachedLexicons;
  }

  return cachedLexicons;
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    uint64_t v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (NSMutableDictionary)compiledPatterns
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  compiledPatterns = self->_compiledPatterns;
  if (!compiledPatterns)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = self->_compiledPatterns;
    self->_compiledPatterns = v4;

    v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v19 = [v20 URLForResource:@"SemanticTextPatterns" withExtension:@"plist"];
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = long long v26 = 0u;
    id obj = [v18 objectForKeyedSubscript:@"Patterns"];
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v11 = [v10 objectForKeyedSubscript:@"Identifier"];
          v12 = (void *)MEMORY[0x1E4F28FD8];
          v13 = [v10 objectForKeyedSubscript:@"Pattern"];
          id v22 = 0;
          v14 = [v12 regularExpressionWithPattern:v13 options:2 error:&v22];
          id v15 = v22;

          if (v15)
          {
            v16 = AXMediaLogTextProcessing();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v11;
              __int16 v29 = 2112;
              id v30 = v15;
              _os_log_error_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_ERROR, "Error compiling pattern '%@' : %@", buf, 0x16u);
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_compiledPatterns setObject:v14 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v7);
    }

    compiledPatterns = self->_compiledPatterns;
  }

  return compiledPatterns;
}

- (NSDataDetector)dataDetector
{
  dataDetector = self->_dataDetector;
  if (!dataDetector)
  {
    id v15 = 0;
    uint64_t v4 = (NSDataDetector *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:-1 error:&v15];
    id v5 = v15;
    uint64_t v6 = self->_dataDetector;
    self->_dataDetector = v4;

    if (v5)
    {
      uint64_t v7 = AXMediaLogTextProcessing();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(AXMSemanticTextFactory *)(uint64_t)v5 dataDetector];
      }
    }
    dataDetector = self->_dataDetector;
  }

  return dataDetector;
}

- (id)semanticTextForText:(id)a3 withLocale:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  uint64_t v8 = AXMediaLogTextProcessing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, "input text: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v9 = [AXMSemanticText alloc];
  uint64_t v10 = [(AXMSemanticTextFactory *)self _preprocessedText:v6];
  uint64_t v11 = [(AXMSemanticText *)v9 initWithText:v10 locale:v7];

  [(AXMSemanticTextFactory *)self _applyNaturalLanguageTokens:v11];
  [(AXMSemanticTextFactory *)self _applyDataDetectors:v11];
  [(AXMSemanticTextFactory *)self _applyCustomPatterns:v11];
  [(AXMSemanticTextFactory *)self _performSemanticAnalysis:v11];

  return v11;
}

- (id)_preprocessedText:(id)a3
{
  id v3 = a3;
  if (![v3 length]
    || ([v3 rangeOfComposedCharacterSequenceAtIndex:0], v4 == 1)
    && [v3 characterAtIndex:0] == 0xFFFF)
  {
    uint64_t v11 = &stru_1F0E72D10;
  }
  else
  {
    id v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
    id v6 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
    id v7 = [v6 invertedSet];

    uint64_t v8 = [v3 stringByTrimmingCharactersInSet:v7];
    if ([(__CFString *)v8 length])
    {
      uint64_t v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".?"];
      if ([v5 rangeOfCharacterFromSet:v9] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = [(__CFString *)v8 stringByAppendingString:v5];

        uint64_t v8 = (__CFString *)v10;
      }
      uint64_t v8 = v8;

      uint64_t v11 = v8;
    }
    else
    {
      uint64_t v11 = &stru_1F0E72D10;
    }
  }

  return v11;
}

- (BOOL)_string:(id)a3 containsOnlyCharactersFrom:(id)a4
{
  id v5 = a3;
  id v6 = [a4 invertedSet];
  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_applyNaturalLanguageTokens:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 preprocessedText];
  id v6 = [(AXMSemanticTextFactory *)self tagger];
  [v6 setString:v5];

  uint64_t v7 = *MEMORY[0x1E4F38868];
  uint64_t v8 = AXMediaLogTextProcessing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, "will enumerate tags for scheme: %@. options: all", buf, 0xCu);
  }

  uint64_t v9 = [(AXMSemanticTextFactory *)self tagger];
  uint64_t v10 = [v4 textRange];
  uint64_t v12 = v11;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke;
  v18 = &unk_1E61181C0;
  id v19 = v4;
  v20 = self;
  id v13 = v4;
  objc_msgSend(v9, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v10, v12, 0, v7, 32, &v15);

  id v14 = [(AXMSemanticTextFactory *)self tagger];
  [v14 setString:0];
}

void __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  uint64_t v9 = AXMediaLogTextProcessing();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_1B57D5000, v9, OS_LOG_TYPE_DEFAULT, "  %@ -> %@", (uint8_t *)&v27, 0x16u);
  }

  if ([v7 isEqualToString:*MEMORY[0x1E4F388A0]])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = @"NLP:Whitespace";
LABEL_23:
    objc_msgSend(v10, "addNLPToken:withRange:", v11, a3, a4);
    goto LABEL_24;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F38810]])
  {
    objc_msgSend(*(id *)(a1 + 32), "addNLPToken:withRange:", @"NLP:OtherWord", a3, a4);
    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = [*(id *)(a1 + 32) locale];
    uint64_t v14 = [v12 _textExistsInLexicon:v8 withLocale:v13];

    objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v14, a3, a4);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [*(id *)(a1 + 40) numberFormatter];
      uint64_t v16 = [v15 numberFromString:v8];

      if (!v16)
      {
LABEL_10:

        goto LABEL_24;
      }
      v17 = *(void **)(a1 + 32);
LABEL_9:
      objc_msgSend(v17, "addNumericToken:withRange:", v16, a3, a4);
      goto LABEL_10;
    }
  }
  else
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F38820]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:PersonalName";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F38800]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:OrganizationName";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F38828]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:PlaceName";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F387E0]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:Dash";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F38840]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:Punctuation";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F38890]])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:SentenceTerminator";
      goto LABEL_23;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F38808]])
    {
      uint64_t v18 = [*(id *)(a1 + 32) tokenizedLength];
      id v19 = *(void **)(a1 + 40);
      if (v18 > 3)
      {
        long long v24 = [v8 lowercaseString];
        long long v25 = [*(id *)(a1 + 32) locale];
        uint64_t v26 = [v19 _textExistsInLexicon:v24 withLocale:v25];

        objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v26, a3, a4);
        if (!v26 || (unint64_t)[v8 length] < 3)
        {
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = @"NLP:Unknown";
          goto LABEL_23;
        }
      }
      else
      {
        v20 = [*(id *)(a1 + 32) locale];
        uint64_t v21 = [v19 _textExistsInLexicon:v8 withLocale:v20];

        objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v21, a3, a4);
        if (!v21 || (unint64_t)[v8 length] < 3)
        {
          uint64_t v22 = [*(id *)(a1 + 40) numberFormatter];
          uint64_t v16 = [v22 numberFromString:v8];

          v17 = *(void **)(a1 + 32);
          if (!v16)
          {
            objc_msgSend(v17, "addNLPToken:withRange:", @"NLP:Unknown", a3, a4);
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = @"NLP:OtherWord";
      goto LABEL_23;
    }
    uint64_t v23 = AXMediaLogTextProcessing();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke_cold_1();
    }
  }
LABEL_24:
}

- (void)_applyDataDetectors:(id)a3
{
  id v4 = a3;
  id v5 = [(AXMSemanticTextFactory *)self dataDetector];
  id v6 = [v4 preprocessedText];
  uint64_t v7 = [v4 textRange];
  uint64_t v9 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke;
  v11[3] = &unk_1E61181E8;
  id v12 = v4;
  id v10 = v4;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, v7, v9, v11);
}

void __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 resultType];
    if (v5 <= 31)
    {
      if (v5 == 8)
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v8 = [v4 range];
        uint64_t v9 = @"DD:Date";
        goto LABEL_13;
      }
      if (v5 == 16)
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v8 = [v4 range];
        uint64_t v9 = @"DD:Address";
        goto LABEL_13;
      }
    }
    else
    {
      switch(v5)
      {
        case 32:
          id v6 = *(void **)(a1 + 32);
          uint64_t v8 = [v4 range];
          uint64_t v9 = @"DD:Link";
          goto LABEL_13;
        case 2048:
          id v6 = *(void **)(a1 + 32);
          uint64_t v8 = [v4 range];
          uint64_t v9 = @"DD:PhoneNumber";
          goto LABEL_13;
        case 4096:
          id v6 = *(void **)(a1 + 32);
          uint64_t v8 = [v4 range];
          uint64_t v9 = @"DD:TransitInfo";
LABEL_13:
          objc_msgSend(v6, "addDataDetector:withRange:", v9, v8, v7);
          goto LABEL_14;
      }
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v4 range];
    id v13 = objc_msgSend(v10, "substringWithRange:", v11, v12);
    uint64_t v14 = AXMediaLogTextProcessing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke_cold_1();
    }
  }
LABEL_14:
}

- (void)_applyCustomPatterns:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMSemanticTextFactory *)self compiledPatterns];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke;
  v7[3] = &unk_1E6118238;
  id v8 = v4;
  uint64_t v9 = 0;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 preprocessedText];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 32) textRange];
  uint64_t v12 = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke_2;
  v14[3] = &unk_1E6118210;
  id v15 = *(id *)(a1 + 32);
  id v16 = v5;
  id v13 = v5;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v8, v9, v10, v12, v14);
}

uint64_t __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke_2(uint64_t result, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(result + 32);
    uint64_t v3 = *(void *)(result + 40);
    uint64_t v5 = [a2 range];
    return objc_msgSend(v2, "addCustomPattern:withRange:", v3, v5, v4);
  }
  return result;
}

- (void)_performSemanticAnalysis:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] string];
  v33 = v3;
  uint64_t v5 = [v3 makeCursor];
  if (([v5 isFinished] & 1) == 0)
  {
    uint64_t v32 = *MEMORY[0x1E4F281F8];
    uint64_t v31 = *MEMORY[0x1E4F28578];
    while (1)
    {
      id v8 = AXMediaLogTextProcessing();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v5 remainingRange];
        [v5 remainingRange];
        uint64_t v11 = v10;
        uint64_t v12 = [v5 isOtherWord];
        uint64_t v13 = [v5 isInLexicon];
        unsigned int v14 = [v5 isWhitespace];
        *(_DWORD *)buf = 134219008;
        uint64_t v50 = v9;
        __int16 v51 = 2048;
        v52 = v11;
        __int16 v53 = 2048;
        uint64_t v54 = v12;
        __int16 v55 = 2048;
        uint64_t v56 = v13;
        __int16 v57 = 2048;
        uint64_t v58 = v14;
        _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, "remaining:[%ld %ld] word:%ld lexicon:%ld whitespace:%ld", buf, 0x34u);
      }

      if ([v5 isCustomPattern])
      {
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        id v15 = (id *)&v46;
        id v16 = (id *)&v45;
        v17 = &v46;
        uint64_t v18 = &v45;
        id v19 = v5;
        v20 = @"CustomPattern";
        goto LABEL_16;
      }
      if ([v5 isDataDetector]) {
        break;
      }
      if (([v5 isWhitespace] & 1) != 0 || objc_msgSend(v5, "isSentenceTerminator"))
      {
        uint64_t v41 = 0;
        uint64_t v42 = 0;
        id v15 = (id *)&v42;
        id v16 = (id *)&v41;
        v17 = &v42;
        uint64_t v18 = &v41;
        goto LABEL_15;
      }
      if ([v5 isPunctuation])
      {
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        id v15 = (id *)&v40;
        id v16 = (id *)&v39;
        v17 = &v40;
        uint64_t v18 = &v39;
        goto LABEL_15;
      }
      if ([v5 isProperNoun])
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        id v15 = (id *)&v38;
        id v16 = (id *)&v37;
        v17 = &v38;
        uint64_t v18 = &v37;
        goto LABEL_15;
      }
      if ([v5 isOtherWord])
      {
        if ([v5 isInLexicon])
        {
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          id v15 = (id *)&v36;
          id v16 = (id *)&v35;
          v17 = &v36;
          uint64_t v18 = &v35;
LABEL_15:
          id v19 = v5;
          v20 = @"NLPToken";
LABEL_16:
          [v19 processAttribute:v20 getSubstring:v17 advanceCursor:1 markAsSemanticError:0 error:v18];
          id v21 = *v15;
          id v22 = *v16;
          if (v21)
          {
            [v4 appendString:v21];
          }
          goto LABEL_18;
        }
        id v34 = 0;
        [v5 processAttribute:@"NLPToken" getSubstring:0 advanceCursor:1 markAsSemanticError:1 error:&v34];
        id v22 = v34;
      }
      else
      {
        id v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v47 = v31;
        uint64_t v23 = NSString;
        long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "remainingRange"));
        long long v25 = NSNumber;
        [v5 remainingRange];
        int v27 = [v25 numberWithUnsignedInteger:v26];
        id v28 = [v23 stringWithFormat:@"Failed to match current cursor position. remaining:[%@ %@]", v24, v27];
        v48 = v28;
        __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v22 = [v30 errorWithDomain:v32 code:1 userInfo:v29];
      }
LABEL_18:
      if (v22) {
        [v5 markCurrentIndexAsSemanticErrorAndAdvanceCursor];
      }

      if ([v5 isFinished]) {
        goto LABEL_2;
      }
    }
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    id v15 = (id *)&v44;
    id v16 = (id *)&v43;
    v17 = &v44;
    uint64_t v18 = &v43;
    id v19 = v5;
    v20 = @"DataDetector";
    goto LABEL_16;
  }
LABEL_2:
  [v33 setTransformedSpeechText:v4];
  id v6 = AXMediaLogTextProcessing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v33 isSemanticallyComplete];
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v7;
    __int16 v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_1B57D5000, v6, OS_LOG_TYPE_DEFAULT, "semanticallyComplete:%ld speechText: '%@'", buf, 0x16u);
  }
}

- (BOOL)_lexiconExistsForLocale:(id)a3
{
  return a3 && -[AXMSemanticTextFactory _lexiconForLocale:](self, "_lexiconForLocale:") != 0;
}

- (BOOL)_textExistsInLexicon:(id)a3 withLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXMSemanticTextFactory *)self _lexiconForLocale:v7])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    LXLexiconEnumerateEntriesForString();
    BOOL v8 = v11[3] > 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __58__AXMSemanticTextFactory__textExistsInLexicon_withLocale___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (void *)LXEntryCopyString();
  unsigned int MetaFlags = LXEntryGetMetaFlags();
  LXEntryGetProbability();
  uint64_t v5 = v4;
  LXEntryGetPartialProbability();
  uint64_t v7 = v6;
  int UsageCount = LXEntryGetUsageCount();
  uint64_t v9 = AXMediaLogTextProcessing();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v11 = 134219266;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    unsigned int v14 = v2;
    __int16 v15 = 2048;
    uint64_t v16 = MetaFlags;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 1024;
    int v22 = UsageCount;
    _os_log_impl(&dword_1B57D5000, v9, OS_LOG_TYPE_DEFAULT, "lex #%ld: '%@' flags:%lu prob:%.2f partialProb:%.2f usageCount:%u", (uint8_t *)&v11, 0x3Au);
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (_LXLexicon)_lexiconForLocale:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  uint64_t v5 = [(AXMSemanticTextFactory *)self cachedLexicons];
  uint64_t v6 = (_LXLexicon *)[v5 objectForKey:v4];

  if (!v6 && v4)
  {
    uint64_t v7 = AXMediaLogTextProcessing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v4 languageCode];
      uint64_t v9 = [v4 localeIdentifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v4;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEFAULT, "Creating new lexicon for locale (an expensive operation): %@ (language: %@) (id: %@)", buf, 0x20u);
    }
    uint64_t v28 = *MEMORY[0x1E4F72458];
    id v29 = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *(void *)buf = 0;
    uint64_t v11 = LXLexiconCreate();
    uint64_t v6 = (_LXLexicon *)v11;
    if (*(void *)buf || !v11)
    {
      __int16 v13 = AXMediaLogTextProcessing();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AXMSemanticTextFactory _lexiconForLocale:]((uint64_t)buf, v13, v14, v15, v16, v17, v18, v19);
      }

      if (!v6) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v12 = [(AXMSemanticTextFactory *)self cachedLexicons];
      [v12 setObject:v6 forKey:v4];
    }
    CFRelease(v6);
LABEL_14:
  }
  if (!v6)
  {
    uint64_t v20 = AXMediaLogTextProcessing();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AXMSemanticTextFactory _lexiconForLocale:]((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  return v6;
}

- (void)setDataDetector:(id)a3
{
}

- (void)setTagger:(id)a3
{
}

- (void)setCachedLexicons:(id)a3
{
}

- (void)setNumberFormatter:(id)a3
{
}

- (void)setCompiledPatterns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledPatterns, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_cachedLexicons, 0);
  objc_storeStrong((id *)&self->_tagger, 0);

  objc_storeStrong((id *)&self->_dataDetector, 0);
}

- (void)dataDetector
{
}

void __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B57D5000, v0, v1, "  WARNING: Unhandled NLToken: %@ -> %@");
}

void __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B57D5000, v0, v1, "  WARNING: Unhandled Data Detector: %@ -> %@");
}

- (void)_lexiconForLocale:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_lexiconForLocale:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
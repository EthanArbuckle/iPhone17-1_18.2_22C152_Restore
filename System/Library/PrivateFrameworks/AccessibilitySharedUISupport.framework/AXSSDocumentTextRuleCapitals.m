@interface AXSSDocumentTextRuleCapitals
- (AXSSDocumentTextRuleCapitals)init;
- (BOOL)checkSpelledCorrectly:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)textCheckerLanguage;
- (UITextChecker)textChecker;
- (_NSRange)checkSpellingOfString:(id)a3 includeAutocorrect:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8;
- (unint64_t)hash;
- (void)setTextChecker:(id)a3;
- (void)setTextCheckerLanguage:(id)a3;
@end

@implementation AXSSDocumentTextRuleCapitals

- (AXSSDocumentTextRuleCapitals)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXSSDocumentTextRuleCapitals;
  v2 = [(AXSSDocumentTextRuleCapitals *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(AXSSDocumentTextRule *)v2 setGranularity:1];
    v4 = (UITextChecker *)objc_alloc_init(MEMORY[0x263F82CD8]);
    textChecker = v3->_textChecker;
    v3->_textChecker = v4;

    v6 = [MEMORY[0x263F82CD8] availableLanguages];
    uint64_t v7 = [v6 firstObject];
    textCheckerLanguage = v3->_textCheckerLanguage;
    v3->_textCheckerLanguage = (NSString *)v7;

    if (!v3->_textCheckerLanguage)
    {
      v3->_textCheckerLanguage = (NSString *)@"en_US";
    }
  }
  return v3;
}

- (BOOL)checkSpelledCorrectly:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  if ([(AXSSDocumentTextRuleCapitals *)self checkSpellingOfString:v4 includeAutocorrect:0] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v4 length] == 3)
    {
      if ([(AXSSDocumentTextRuleCapitals *)self checkSpellingOfString:v4 includeAutocorrect:1] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = [NSString stringWithFormat:@"%@ %@.", v4, v4];
        if ([(AXSSDocumentTextRuleCapitals *)self checkSpellingOfString:v6 includeAutocorrect:1])
        {
          BOOL v8 = 0;
        }
        else
        {
          BOOL v8 = v7 == 3;
        }
        BOOL v5 = !v8;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (_NSRange)checkSpellingOfString:(id)a3 includeAutocorrect:(BOOL)a4
{
  id v5 = a3;
  v6 = [(AXSSDocumentTextRuleCapitals *)self textChecker];
  uint64_t v7 = [v5 length];
  BOOL v8 = [(AXSSDocumentTextRuleCapitals *)self textCheckerLanguage];
  uint64_t v9 = objc_msgSend(v6, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v5, 0, v7, 0, 0, v8);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v31 = a5;
  id v13 = a7;
  if ([v12 length])
  {
    v14 = [v12 string];
    uint64_t v15 = [v14 length];
    BOOL v16 = v15 == 3;
    if (v15 == 3) {
      v17 = @"[A-Z]{2}[a-z]";
    }
    else {
      v17 = @"[A-Z]{2,}[a-z]{2,}";
    }
    id v43 = 0;
    v18 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v17 options:0 error:&v43];
    if (v43) {
      -[AXSSDocumentTextRuleCapitals issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:]();
    }
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    id v42 = 0;
    uint64_t v19 = [v14 length];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __113__AXSSDocumentTextRuleCapitals_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v32[3] = &unk_264855A48;
    v35 = &v37;
    id v20 = v14;
    id v33 = v20;
    v34 = self;
    BOOL v36 = v16;
    objc_msgSend(v18, "enumerateMatchesInString:options:range:usingBlock:", v20, 0, 0, v19, v32);
    unint64_t v21 = [(id)v38[5] length];
    if (v21 < [v20 length])
    {
      v22 = (void *)v38[5];
      v23 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v22, "length"));
      [v22 appendString:v23];
    }
    if ([(id)v38[5] length] && (objc_msgSend((id)v38[5], "isEqual:", v20) & 1) == 0)
    {
      v24 = objc_opt_new();
      [v24 setOffendingText:v12];
      objc_msgSend(v24, "setRange:", location, length);
      id v27 = objc_alloc(MEMORY[0x263F086A0]);
      v28 = (void *)[v27 initWithString:v38[5]];
      v45[0] = v28;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
      [v24 setSuggestions:v29];

      [v24 setKind:1];
      v30 = [NSString stringWithFormat:@"The term \"%@\" appears to have capitalization issues", v20];
      [v24 setNote:v30];

      if (v24)
      {
        v44 = v24;
        v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
        goto LABEL_12;
      }
    }
    else
    {
      v24 = 0;
    }
    v25 = (void *)MEMORY[0x263EFFA68];
LABEL_12:

    _Block_object_dispose(&v37, 8);
    goto LABEL_14;
  }
  v25 = (void *)MEMORY[0x263EFFA68];
LABEL_14:

  return v25;
}

void __113__AXSSDocumentTextRuleCapitals_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v17;
  }
  unint64_t v7 = [v3 range];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  if (v7 > [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
    unint64_t v11 = v7 - [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
    if (v11 + v10 < [*(id *)(a1 + 32) length])
    {
      id v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v10, v11);
      if ([v12 length]) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:v12];
      }
    }
  }
  id v13 = [v9 capitalizedString];
  if (([*(id *)(a1 + 40) checkSpelledCorrectly:v13] & 1) == 0)
  {
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    goto LABEL_13;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    int v14 = [*(id *)(a1 + 40) checkSpelledCorrectly:v9];
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v14) {
      goto LABEL_15;
    }
LABEL_13:
    BOOL v16 = v9;
    goto LABEL_16;
  }
  uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_15:
  BOOL v16 = v13;
LABEL_16:
  [v15 appendString:v16];
}

- (unint64_t)hash
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSSDocumentTextRuleCapitals;
  return [(AXSSDocumentTextRule *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AXSSDocumentTextRuleCapitals *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7.receiver = self;
      v7.super_class = (Class)AXSSDocumentTextRuleCapitals;
      BOOL v5 = [(AXSSDocumentTextRule *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
}

- (NSString)textCheckerLanguage
{
  return self->_textCheckerLanguage;
}

- (void)setTextCheckerLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckerLanguage, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
}

- (void)issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:.cold.1()
{
  __assert_rtn("-[AXSSDocumentTextRuleCapitals issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:]", "AXSSDocumentTextRuleCapitals.m", 147, "error == nil");
}

@end
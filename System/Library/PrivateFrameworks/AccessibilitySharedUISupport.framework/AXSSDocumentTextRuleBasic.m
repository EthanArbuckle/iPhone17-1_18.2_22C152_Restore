@interface AXSSDocumentTextRuleBasic
- (AXSSDocumentTextRuleBasic)init;
- (BOOL)caseSensitive;
- (BOOL)isEqual:(id)a3;
- (NSArray)avoidPhrases;
- (NSArray)avoidWords;
- (NSArray)suggestedWords;
- (NSString)note;
- (id)copyWithZone:(_NSZone *)a3;
- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8;
- (unint64_t)hash;
- (void)setAvoidPhrases:(id)a3;
- (void)setAvoidWords:(id)a3;
- (void)setCaseSensitive:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setSuggestedWords:(id)a3;
@end

@implementation AXSSDocumentTextRuleBasic

- (void)setAvoidWords:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v16 = self;
  v6 = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
  if (v6)
  {
    v7 = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
    v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    v8 = objc_opt_new();
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = 0;
        v20 = (int *)&v19;
        uint64_t v21 = 0x2020000000;
        int v22 = 0;
        uint64_t v13 = [v12 length];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __43__AXSSDocumentTextRuleBasic_setAvoidWords___block_invoke;
        v18[3] = &unk_264855A98;
        v18[4] = &v19;
        objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v18);
        if (v20[6] >= 2) {
          v14 = v8;
        }
        else {
          v14 = (void *)v5;
        }
        [v14 addObject:v12];
        _Block_object_dispose(&v19, 8);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  avoidWords = v16->_avoidWords;
  v16->_avoidWords = (NSArray *)v5;

  [(AXSSDocumentTextRuleBasic *)v16 setAvoidPhrases:v8];
}

uint64_t __43__AXSSDocumentTextRuleBasic_setAvoidWords___block_invoke(uint64_t result)
{
  return result;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v46 = a5;
  id v52 = a7;
  v47 = v11;
  if ([v11 length])
  {
    v12 = [v11 string];
    BOOL v13 = [(AXSSDocumentTextRuleBasic *)self caseSensitive];
    v14 = [(AXSSDocumentTextRuleBasic *)self avoidWords];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v62[3] = &unk_264855AC0;
    id v45 = v12;
    id v63 = v45;
    BOOL v64 = !v13;
    BOOL v49 = v64;
    uint64_t v15 = [v14 indexOfObjectPassingTest:v62];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0;
    }
    else
    {
      v16 = objc_opt_new();
      [v16 setOffendingText:v47];
      objc_msgSend(v16, "setRange:", location, length);
      v18 = objc_opt_class();
      uint64_t v19 = [(AXSSDocumentTextRuleBasic *)self suggestedWords];
      v20 = [v47 string];
      uint64_t v21 = [v18 matchReplacementArrayCapitalization:v19 withSource:v20];
      [v16 setSuggestions:v21];

      int v22 = NSString;
      long long v23 = [v47 string];
      long long v24 = [v22 stringWithFormat:@"The term '%@' may not be the best choice. Consider one of the following terms.", v23];
      [v16 setNote:v24];

      [v16 setKind:4];
    }
    long long v25 = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
    BOOL v26 = [v25 count] == 0;

    if (!v26)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
      uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v27)
      {
        uint64_t v51 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v59 != v51) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v30 = [v29 length];
            if (v30 + location < [v52 length])
            {
              v31 = [v52 string];
              v32 = objc_msgSend(v31, "substringWithRange:", location, v30);

              if (![v29 compare:v32 options:1])
              {
                uint64_t v54 = 0;
                v55 = &v54;
                uint64_t v56 = 0x2020000000;
                char v57 = 0;
                v33 = [v52 string];
                uint64_t v34 = [v52 length];
                v53[0] = MEMORY[0x263EF8330];
                v53[1] = 3221225472;
                v53[2] = __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke_2;
                v53[3] = &unk_264855AE8;
                v53[5] = location;
                v53[6] = v30;
                v53[4] = &v54;
                objc_msgSend(v33, "enumerateSubstringsInRange:options:usingBlock:", location, v34 - location, 3, v53);

                if (*((unsigned char *)v55 + 24))
                {
                  v35 = [v52 string];
                  v36 = objc_msgSend(v35, "substringWithRange:", location, v30);

                  if ([v29 compare:v36 options:v49])
                  {
                    v37 = v16;
                  }
                  else
                  {
                    v37 = objc_opt_new();

                    v38 = objc_msgSend(v52, "attributedSubstringFromRange:", location, v30);
                    [v37 setOffendingText:v38];

                    objc_msgSend(v37, "setRange:", location, v30);
                    v39 = objc_opt_class();
                    v40 = [(AXSSDocumentTextRuleBasic *)self suggestedWords];
                    v41 = [v47 string];
                    v42 = [v39 matchReplacementArrayCapitalization:v40 withSource:v41];
                    [v37 setSuggestions:v42];

                    v43 = [NSString stringWithFormat:@"The term '%@' may not be the best choice. Consider one of the following terms.", v29];
                    [v37 setNote:v43];

                    [v37 setKind:4];
                  }

                  v16 = v37;
                }
                _Block_object_dispose(&v54, 8);
              }
            }
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
        }
        while (v27);
      }
    }
    objc_msgSend(v16, "setSeverity:", -[AXSSDocumentTextRule severity](self, "severity"));
    if (v16)
    {
      v65 = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
    }
    else
    {
      v17 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x263EFFA68];
  }

  return v17;
}

BOOL __110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32) options:*(void *)(a1 + 40)] == 0;
}

void *__110__AXSSDocumentTextRuleBasic_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke_2(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v7 = result[6] + result[5];
  if (a3 + a4 == v7)
  {
    *(unsigned char *)(*(void *)(result[4] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a7 = 1;
    unint64_t v7 = result[6] + result[5];
  }
  if (v7 < a3 + a4) {
    *a7 = 1;
  }
  return result;
}

- (AXSSDocumentTextRuleBasic)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleBasic;
  v2 = [(AXSSDocumentTextRuleBasic *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXSSDocumentTextRule *)v2 setGranularity:1];
  }
  return v3;
}

- (unint64_t)hash
{
  v3 = [(AXSSDocumentTextRuleBasic *)self avoidWords];
  uint64_t v4 = [v3 hash];
  objc_super v5 = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(AXSSDocumentTextRuleBasic *)self suggestedWords];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(AXSSDocumentTextRuleBasic *)self note];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(AXSSDocumentTextRuleBasic *)self caseSensitive];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AXSSDocumentTextRuleBasic;
  id v4 = [(AXSSDocumentTextRule *)&v10 copyWithZone:a3];
  objc_super v5 = [(AXSSDocumentTextRuleBasic *)self avoidWords];
  [v4 setAvoidWords:v5];

  uint64_t v6 = [(AXSSDocumentTextRuleBasic *)self avoidPhrases];
  [v4 setAvoidPhrases:v6];

  unint64_t v7 = [(AXSSDocumentTextRuleBasic *)self suggestedWords];
  [v4 setSuggestedWords:v7];

  uint64_t v8 = [(AXSSDocumentTextRuleBasic *)self note];
  [v4 setNote:v8];

  objc_msgSend(v4, "setCaseSensitive:", -[AXSSDocumentTextRuleBasic caseSensitive](self, "caseSensitive"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  uint64_t v6 = (AXSSDocumentTextRuleBasic *)v4;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v19.receiver = v5,
          v19.super_class = (Class)AXSSDocumentTextRuleBasic,
          [(AXSSDocumentTextRule *)&v19 isEqual:v6])
      && (BOOL v7 = [(AXSSDocumentTextRuleBasic *)v5 caseSensitive],
          v7 == [(AXSSDocumentTextRuleBasic *)v6 caseSensitive]))
    {
      uint64_t v10 = [(AXSSDocumentTextRuleBasic *)v5 avoidWords];
      uint64_t v11 = [(AXSSDocumentTextRuleBasic *)v6 avoidWords];
      if (v10 | v11 && ![(id)v10 isEqual:v11])
      {
        char v8 = 0;
      }
      else
      {
        uint64_t v12 = [(AXSSDocumentTextRuleBasic *)v5 avoidPhrases];
        uint64_t v13 = [(AXSSDocumentTextRuleBasic *)v6 avoidPhrases];
        if (v12 | v13 && ![(id)v12 isEqual:v13])
        {
          char v8 = 0;
        }
        else
        {
          uint64_t v14 = [(AXSSDocumentTextRuleBasic *)v5 suggestedWords];
          uint64_t v15 = [(AXSSDocumentTextRuleBasic *)v6 suggestedWords];
          if (v14 | v15 && ![(id)v14 isEqual:v15])
          {
            char v8 = 0;
          }
          else
          {
            uint64_t v18 = v12;
            uint64_t v16 = [(AXSSDocumentTextRuleBasic *)v5 note];
            uint64_t v17 = [(AXSSDocumentTextRuleBasic *)v6 note];
            if (v16 | v17) {
              char v8 = [(id)v16 isEqual:v17];
            }
            else {
              char v8 = 1;
            }

            uint64_t v12 = v18;
          }
        }
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSArray)avoidWords
{
  return self->_avoidWords;
}

- (NSArray)avoidPhrases
{
  return self->_avoidPhrases;
}

- (void)setAvoidPhrases:(id)a3
{
}

- (NSArray)suggestedWords
{
  return self->_suggestedWords;
}

- (void)setSuggestedWords:(id)a3
{
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (void)setCaseSensitive:(BOOL)a3
{
  self->_caseSensitive = a3;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_suggestedWords, 0);
  objc_storeStrong((id *)&self->_avoidPhrases, 0);
  objc_storeStrong((id *)&self->_avoidWords, 0);
}

@end
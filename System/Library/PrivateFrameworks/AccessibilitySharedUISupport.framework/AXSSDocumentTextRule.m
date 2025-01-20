@interface AXSSDocumentTextRule
+ (id)matchReplacementArrayCapitalization:(id)a3 withSource:(id)a4;
+ (id)matchReplacementCapitalization:(id)a3 withSource:(id)a4;
+ (id)replaceCustomRegexNotation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8;
- (id)issuesInText:(id)a3;
- (int64_t)granularity;
- (int64_t)severity;
- (unint64_t)hash;
- (void)setGranularity:(int64_t)a3;
- (void)setSeverity:(int64_t)a3;
@end

@implementation AXSSDocumentTextRule

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a7;
  __assert_rtn("-[AXSSDocumentTextRule issuesForWord:atRange:previousWord:previousWordRange:inText:ignoreRuleUntilIndex:]", "AXSSDocumentTextRule.m", 20, "false");
}

- (id)issuesInText:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[AXSSDocumentTextRule issuesInText:]", "AXSSDocumentTextRule.m", 26, "false");
}

+ (id)replaceCustomRegexNotation:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"[:AX_ws:]" withString:@"[  \\t]"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"[:AX_bullet:]" withString:@"[•▪◦◉◉◆◇◈◊○◎◘⦾⦿◦‣‧∙∘]"];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"[:AX_nl:]" withString:@"[\\n\u2028]"];

  return v5;
}

+ (id)matchReplacementArrayCapitalization:(id)a3 withSource:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "matchReplacementCapitalization:withSource:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)matchReplacementCapitalization:(id)a3 withSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 length] || !objc_msgSend(v5, "length")) {
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  if ([v6 rangeOfCharacterFromSet:v7])
  {

LABEL_5:
    v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
    goto LABEL_6;
  }
  uint64_t v10 = (void *)[v5 mutableCopy];
  uint64_t v11 = [v5 length];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__AXSSDocumentTextRule_matchReplacementCapitalization_withSource___block_invoke;
  v13[3] = &unk_264855840;
  id v14 = v10;
  id v12 = v10;
  objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v13);
  v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];

LABEL_6:
  return v8;
}

void __66__AXSSDocumentTextRule_matchReplacementCapitalization_withSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [v13 capitalizedString];
  objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v12);

  *a7 = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  objc_msgSend(v4, "setGranularity:", -[AXSSDocumentTextRule granularity](self, "granularity"));
  objc_msgSend(v4, "setSeverity:", -[AXSSDocumentTextRule severity](self, "severity"));
  return v4;
}

- (unint64_t)hash
{
  int64_t v3 = [(AXSSDocumentTextRule *)self granularity];
  return [(AXSSDocumentTextRule *)self severity] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AXSSDocumentTextRule *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t v5 = [(AXSSDocumentTextRule *)v4 granularity],
          v5 != [(AXSSDocumentTextRule *)self granularity])
      || (uint64_t v6 = [(AXSSDocumentTextRule *)v4 severity], v6 != [(AXSSDocumentTextRule *)self severity]))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int64_t)a3
{
  self->_granularity = a3;
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

@end
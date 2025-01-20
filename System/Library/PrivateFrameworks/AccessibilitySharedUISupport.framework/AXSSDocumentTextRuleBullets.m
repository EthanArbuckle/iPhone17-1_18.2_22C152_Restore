@interface AXSSDocumentTextRuleBullets
- (AXSSDocumentTextRuleBullets)init;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8;
- (unint64_t)hash;
@end

@implementation AXSSDocumentTextRuleBullets

- (AXSSDocumentTextRuleBullets)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleBullets;
  v2 = [(AXSSDocumentTextRuleBullets *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXSSDocumentTextRule *)v2 setGranularity:1];
  }
  return v3;
}

- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v11 = a4.length;
  NSUInteger v12 = a4.location;
  id v13 = a7;
  v14 = v13;
  id v15 = 0;
  if (a5 && location != 0x7FFFFFFFFFFFFFFFLL && length != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v16 = v12 + v11 - location;
    v17 = objc_msgSend(v13, "attributedSubstringFromRange:", location, v16);
    v18 = [v17 string];
    v19 = objc_opt_new();
    v20 = [NSString stringWithFormat:@"%@", @"[:AX_nl:]([:AX_ws:]*[:AX_bullet:][:AX_ws:]*[:AX_nl:])+"];
    v21 = +[AXSSDocumentTextRule replaceCustomRegexNotation:v20];

    v22 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v21 options:0 error:0];
    uint64_t v23 = [v18 length];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __112__AXSSDocumentTextRuleBullets_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v28[3] = &unk_264855958;
    NSUInteger v32 = location;
    NSUInteger v33 = v16;
    id v29 = v14;
    id v30 = v18;
    id v24 = v19;
    id v31 = v24;
    id v25 = v18;
    objc_msgSend(v22, "enumerateMatchesInString:options:range:usingBlock:", v25, 0, 0, v23, v28);
    v26 = v31;
    id v15 = v24;
  }
  return v15;
}

void __112__AXSSDocumentTextRuleBullets_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 range];
  if (v4 >= 2)
  {
    uint64_t v5 = *(void *)(a1 + 56) + v3;
    if (v5)
    {
      unint64_t v6 = v4;
      if (v5 + v4 <= [*(id *)(a1 + 32) length])
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", v5, v6);
        v8 = objc_opt_new();
        [v8 setOffendingText:v7];
        objc_msgSend(v8, "setRange:", v5, v6);
        v9 = [NSString stringWithFormat:@"The term \"%@\" appears to have spacing issues", *(void *)(a1 + 40)];
        [v8 setNote:v9];

        [v8 setKind:3];
        v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
        v12[0] = v10;
        NSUInteger v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
        [v8 setSuggestions:v11];

        [*(id *)(a1 + 48) addObject:v8];
      }
    }
  }
}

- (unint64_t)hash
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSSDocumentTextRuleBullets;
  return [(AXSSDocumentTextRule *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AXSSDocumentTextRuleBullets *)a3;
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
      v7.super_class = (Class)AXSSDocumentTextRuleBullets;
      BOOL v5 = [(AXSSDocumentTextRule *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

@end
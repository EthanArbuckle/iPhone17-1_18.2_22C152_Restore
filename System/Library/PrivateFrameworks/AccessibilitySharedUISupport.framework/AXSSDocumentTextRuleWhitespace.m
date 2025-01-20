@interface AXSSDocumentTextRuleWhitespace
- (AXSSDocumentTextRuleWhitespace)init;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)issuesForWord:(id)a3 atRange:(_NSRange)a4 previousWord:(id)a5 previousWordRange:(_NSRange)a6 inText:(id)a7 ignoreRuleUntilIndex:(int64_t *)a8;
- (unint64_t)hash;
@end

@implementation AXSSDocumentTextRuleWhitespace

- (AXSSDocumentTextRuleWhitespace)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSDocumentTextRuleWhitespace;
  v2 = [(AXSSDocumentTextRuleWhitespace *)&v5 init];
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
  id v14 = a7;
  uint64_t v15 = [a3 length];
  id v16 = (id)MEMORY[0x263EFFA68];
  if (a5 && v15 && location != 0x7FFFFFFFFFFFFFFFLL && length != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v17 = v12 + v11 - location;
    v18 = objc_msgSend(v14, "attributedSubstringFromRange:", location, v17);
    v19 = [v18 string];
    v20 = objc_opt_new();
    v21 = [NSString stringWithFormat:@"(%@)|(%@)|(%@)", @"[:AX_ws:]*[:AX_nl:]([:AX_ws:]*[:AX_nl:][:AX_ws:]*)+[:AX_nl:]", @"[:AX_ws:]{2,}[:AX_nl:]?", @"[:AX_ws:]+[:AX_nl:]"];
    v22 = +[AXSSDocumentTextRule replaceCustomRegexNotation:v21];

    v23 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v22 options:0 error:0];
    uint64_t v24 = [v19 length];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __115__AXSSDocumentTextRuleWhitespace_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke;
    v29[3] = &unk_264855958;
    NSUInteger v33 = location;
    NSUInteger v34 = v17;
    id v30 = v14;
    id v25 = v20;
    id v31 = v25;
    v32 = v19;
    id v26 = v19;
    objc_msgSend(v23, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v24, v29);
    v27 = v32;
    id v16 = v25;
  }
  return v16;
}

void __115__AXSSDocumentTextRuleWhitespace_issuesForWord_atRange_previousWord_previousWordRange_inText_ignoreRuleUntilIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 range];
  if (v4 >= 2)
  {
    NSUInteger v5 = *(void *)(a1 + 56) + v3;
    if (v5)
    {
      NSUInteger v6 = v4;
      if (v5 + v4 <= [*(id *)(a1 + 32) length])
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = *(id *)(a1 + 40);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
LABEL_6:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            v35.NSUInteger location = [*(id *)(*((void *)&v26 + 1) + 8 * v11) range];
            v36.NSUInteger location = v5;
            v36.NSUInteger length = v6;
            if (NSIntersectionRange(v35, v36).location != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            if (v9 == ++v11)
            {
              uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
              if (v9) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }
        }
        else
        {
LABEL_12:

          objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", v5, v6);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          NSUInteger v12 = [v7 string];
          v13 = [MEMORY[0x263F08708] newlineCharacterSet];
          uint64_t v14 = [v12 rangeOfCharacterFromSet:v13 options:0];
          uint64_t v15 = [v12 rangeOfCharacterFromSet:v13 options:4];
          id v16 = objc_opt_new();
          [v16 setOffendingText:v7];
          objc_msgSend(v16, "setRange:", v5, v6);
          NSUInteger v17 = [NSString stringWithFormat:@"The term \"%@\" appears to have spacing issues", *(void *)(a1 + 48)];
          [v16 setNote:v17];

          [v16 setKind:2];
          if (v14 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL || v14 == v15)
          {
            if (v15 == v6 - 1)
            {
              v20 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
              id v31 = v20;
              v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
              [v16 setSuggestions:v21];
            }
            else
            {
              v22 = [v7 string];
              v23 = objc_msgSend(v22, "substringWithRange:", 0, 1);

              uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v23];
              id v30 = v24;
              id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
              [v16 setSuggestions:v25];

              [*(id *)(a1 + 40) addObject:v16];
            }
          }
          else
          {
            v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n\n"];
            v32 = v18;
            v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
            [v16 setSuggestions:v19];

            [*(id *)(a1 + 40) addObject:v16];
          }
        }
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
  v4.super_class = (Class)AXSSDocumentTextRuleWhitespace;
  return [(AXSSDocumentTextRule *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AXSSDocumentTextRuleWhitespace *)a3;
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
      v7.super_class = (Class)AXSSDocumentTextRuleWhitespace;
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
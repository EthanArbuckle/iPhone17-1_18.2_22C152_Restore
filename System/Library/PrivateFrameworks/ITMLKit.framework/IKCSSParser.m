@interface IKCSSParser
+ (id)consumeAtRule:(id)a3;
+ (id)consumeComponentValue:(id)a3;
+ (id)consumeDeclaration:(id)a3;
+ (id)consumeDeclarationList:(id)a3;
+ (id)consumeFunction:(id)a3 fromToken:(id)a4;
+ (id)consumeQualifiedRule:(id)a3;
+ (id)consumeRules:(id)a3 topLevel:(BOOL)a4;
+ (id)consumeSimpleBlock:(id)a3 startTokenType:(int64_t)a4;
+ (id)parse:(id)a3;
+ (id)parseRulesList:(id)a3;
+ (id)parseStylesheet:(id)a3;
@end

@implementation IKCSSParser

+ (id)parse:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IKCSSStylesheet);
  v5 = (void *)MEMORY[0x1E4E655C0]();
  v6 = [[IKCSSTokenizer alloc] initWithText:v3];
  v7 = +[IKCSSParser parseStylesheet:v6];
  v8 = [v7 cssValue];
  v9 = [v8 toNSArray];
  v10 = +[IKCSSParser parseRulesList:v9];

  [(IKCSSStylesheet *)v4 setRuleList:v10];

  return v4;
}

+ (id)parseRulesList:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v46 = objc_alloc_init(IKCSSRuleList);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v3;
  uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v52;
    unint64_t v4 = 0x1E6DE2000uLL;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v6 type] == 5)
        {
          v7 = [v6 name];
          int v8 = [v7 isEqualToString:@"media"];

          if (!v8) {
            continue;
          }
          uint64_t v50 = i;
          v9 = [v6 cssValue];
          v10 = [v9 toNSArray];

          v11 = [v6 prelude];
          v12 = [v11 toNSArray];
          v13 = +[IKCSSMediaQuery mediaQueryFromTokenList:v12];

          v14 = [v6 prelude];
          v15 = [v14 firstObject];
          NSUInteger v16 = [v15 range];
          NSUInteger v18 = v17;
          v19 = [v6 prelude];
          v20 = [v19 lastObject];
          v59.location = [v20 range];
          v59.length = v21;
          v58.location = v16;
          v58.length = v18;
          NSRange v22 = NSUnionRange(v58, v59);

          v23 = +[IKCSSParser parseRulesList:v10];
          if ([(IKCSSRule *)v23 count])
          {
            v45 = v10;
            unint64_t v24 = 0;
            do
            {
              v25 = -[IKCSSRule ruleAtIndex:](v23, "ruleAtIndex:", v24, v45);
              v26 = [[IKCSSAtMediaRule alloc] initWithMediaQuery:v13];
              -[IKCSSAtMediaRule setQueryRange:](v26, "setQueryRange:", v22.location, v22.length);
              v27 = [v25 selectorList];
              [(IKCSSRule *)v26 setSelectorList:v27];

              v28 = [v25 declarationList];
              [(IKCSSRule *)v26 setDeclarationList:v28];

              [(IKCSSRuleList *)v46 addRule:v26];
              ++v24;
            }
            while (v24 < [(IKCSSRule *)v23 count]);
            unint64_t v4 = 0x1E6DE2000;
            v10 = v45;
          }
          goto LABEL_21;
        }
        v29 = *(void **)(v4 + 3688);
        v30 = [v6 prelude];
        v31 = [v30 toNSArray];
        v10 = [v29 createSelectorList:v31];

        if (v10)
        {
          uint64_t v50 = i;
          v13 = objc_alloc_init(IKCSSDeclarationList);
          v23 = objc_alloc_init(IKCSSRule);
          v32 = [v6 block];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v33 = [v32 range];
            -[IKCSSDeclarationList setRange:](v13, "setRange:", v33, v34);
          }
          v35 = [v32 cssValue];
          uint64_t v36 = [v35 count];

          if (v36)
          {
            unint64_t v37 = 0;
            do
            {
              v38 = (void *)MEMORY[0x1E4E655C0]();
              v39 = [v32 cssValue];
              v40 = [v39 objectAtIndex:v37];

              v41 = [*(id *)(v4 + 3688) createDeclaration:v40];
              if (v41) {
                [(IKCSSDeclarationList *)v13 addDeclaration:v41];
              }

              ++v37;
              v42 = [v32 cssValue];
              unint64_t v43 = [v42 count];
            }
            while (v37 < v43);
          }
          [(IKCSSRule *)v23 setSelectorList:v10];
          [(IKCSSRule *)v23 setDeclarationList:v13];
          [(IKCSSRuleList *)v46 addRule:v23];

LABEL_21:
          uint64_t i = v50;
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v49);
  }

  return v46;
}

+ (id)parseStylesheet:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(IKCSSParseStylesheet);
  v5 = +[IKCSSParser consumeRules:v3 topLevel:1];

  v6 = [[IKArray alloc] initWithNSArray:v5];
  [(IKCSSParseStylesheet *)v4 setCssValue:v6];

  return v4;
}

+ (id)consumeRules:(id)a3 topLevel:(BOOL)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    v7 = [v5 getNextToken];
    if ([v7 type] == 1) {
      goto LABEL_15;
    }
    if ([v7 type] == 2) {
      goto LABEL_16;
    }
    if ([v7 type] == 16 || objc_msgSend(v7, "type") == 15)
    {
      if (a4) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
    if ([v7 type] != 29) {
      break;
    }
    [v5 reconsumeToken:v7];
    uint64_t v8 = +[IKCSSParser consumeAtRule:v5];
LABEL_12:
    v9 = (void *)v8;
    if (v8) {
      [v6 addObject:v8];
    }

LABEL_15:
  }
  if ([v7 type] != 26)
  {
LABEL_11:
    [v5 reconsumeToken:v7];
    uint64_t v8 = +[IKCSSParser consumeQualifiedRule:v5];
    goto LABEL_12;
  }
LABEL_16:

  return v6;
}

+ (id)consumeQualifiedRule:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(IKCSSQualifiedParseRule);
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v3 getNextToken];
  if ([v6 type] == 2)
  {
LABEL_6:
    uint64_t v8 = 0;
  }
  else
  {
    while ([v6 type] != 25)
    {
      [v3 reconsumeToken:v6];
      v7 = +[IKCSSParser consumeComponentValue:v3];
      if (v7) {
        [v5 addObject:v7];
      }

      v6 = [v3 getNextToken];
      if ([v6 type] == 2) {
        goto LABEL_6;
      }
    }
    v9 = +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, [v6 type]);
    [(IKCSSParseRule *)v4 setBlock:v9];

    while ([v5 count])
    {
      v10 = [v5 lastObject];
      if ([v10 type] != 1)
      {

        break;
      }
      v11 = [v5 lastObject];
      v12 = [v11 token];
      if ([v12 type] == 1)
      {
      }
      else
      {
        v13 = [v5 lastObject];
        v14 = [v13 token];
        uint64_t v15 = [v14 type];

        if (v15 != 26) {
          break;
        }
      }
      [v5 removeLastObject];
    }
    NSUInteger v16 = [[IKArray alloc] initWithNSArray:v5];
    [(IKCSSParseRule *)v4 setPrelude:v16];

    NSUInteger v17 = [(IKCSSParseRule *)v4 block];
    NSUInteger v18 = [v17 cssValue];
    v19 = [v18 toNSArray];
    v6 = +[IKCSSParser consumeDeclarationList:v19];

    [(IKCSSParseRule *)v4 setBlock:v6];
    v20 = [v3 currentToken];
    uint64_t v21 = [v20 type];

    if (v21 == 26)
    {
      NSRange v22 = [v3 currentToken];
      uint64_t v23 = [v22 range];
      -[IKCSSParseRule _setEndRange:](v4, "_setEndRange:", v23, v24);
    }
    uint64_t v8 = v4;
  }

  return v8;
}

+ (id)consumeAtRule:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 getNextToken];
  if ([v4 type] != 29)
  {
    id v5 = 0;
    goto LABEL_22;
  }
  id v5 = objc_alloc_init(IKCSSAtParseRule);
  v6 = [v4 stringValue];
  [(IKCSSAtParseRule *)v5 setName:v6];

  v7 = [MEMORY[0x1E4F1CA48] array];
  [v3 reconsumeToken:v4];
  v27 = +[IKCSSParser consumeComponentValue:v3];
  objc_msgSend(v7, "addObject:");
  uint64_t v8 = [v3 getNextToken];

  if ([v8 type] == 22)
  {
LABEL_3:
    unint64_t v4 = v8;
    goto LABEL_4;
  }
  do
  {
    if ([v8 type] == 2) {
      goto LABEL_3;
    }
    if ([v8 type] == 25)
    {
      uint64_t v15 = [(IKCSSAtParseRule *)v5 name];
      int v16 = [v15 isEqualToString:@"media"];

      if (v16)
      {
        v25 = +[IKCSSParser consumeRules:v3 topLevel:0];
        v26 = [[IKArray alloc] initWithNSArray:v25];
        [(IKCSSParseObject *)v5 setCssValue:v26];

        goto LABEL_3;
      }
      NSUInteger v17 = +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, [v8 type]);
      [(IKCSSParseRule *)v5 setBlock:v17];
    }
    else
    {
      [v3 reconsumeToken:v8];
      NSUInteger v17 = +[IKCSSParser consumeComponentValue:v3];
      [v7 addObject:v17];
    }

    unint64_t v4 = [v3 getNextToken];

    uint64_t v8 = v4;
  }
  while ([v4 type] != 22);
LABEL_4:
  while ([v7 count])
  {
    v9 = [v7 lastObject];
    if ([v9 type] != 1)
    {

      break;
    }
    v10 = [v7 lastObject];
    v11 = [v10 token];
    if ([v11 type] == 1)
    {
    }
    else
    {
      v12 = [v7 lastObject];
      v13 = [v12 token];
      uint64_t v14 = [v13 type];

      if (v14 != 26) {
        break;
      }
    }
    [v7 removeLastObject];
  }
  NSUInteger v18 = [[IKArray alloc] initWithNSArray:v7];
  [(IKCSSParseRule *)v5 setPrelude:v18];

  v19 = [v3 currentToken];
  uint64_t v20 = [v19 type];

  if (v20 == 26)
  {
    uint64_t v21 = [v3 currentToken];
    uint64_t v22 = [v21 range];
    -[IKCSSParseRule _setEndRange:](v5, "_setEndRange:", v22, v23);
  }
LABEL_22:

  return v5;
}

+ (id)consumeComponentValue:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 getNextToken];
  if ([v4 type] == 25 || objc_msgSend(v4, "type") == 23 || objc_msgSend(v4, "type") == 8)
  {
    uint64_t v5 = +[IKCSSParser consumeSimpleBlock:startTokenType:](IKCSSParser, "consumeSimpleBlock:startTokenType:", v3, [v4 type]);
LABEL_5:
    v6 = (IKCSSParseToken *)v5;
    goto LABEL_6;
  }
  if ([v4 type] == 17)
  {
    uint64_t v5 = +[IKCSSParser consumeFunction:v3 fromToken:v4];
    goto LABEL_5;
  }
  v6 = objc_alloc_init(IKCSSParseToken);
  uint64_t v8 = [v4 range];
  -[IKCSSParseObject setRange:](v6, "setRange:", v8, v9);
  [(IKCSSParseToken *)v6 setToken:v4];
LABEL_6:

  return v6;
}

+ (id)consumeSimpleBlock:(id)a3 startTokenType:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 8:
      uint64_t v6 = 9;
      break;
    case 25:
      uint64_t v6 = 26;
      break;
    case 23:
      uint64_t v6 = 24;
      break;
    default:
      v7 = 0;
      goto LABEL_15;
  }
  v7 = objc_alloc_init(IKCSSSimpleParseBlock);
  [(IKCSSSimpleParseBlock *)v7 setAssociatedToken:a4];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [v5 getNextToken];
  for (uint64_t i = [v9 type]; i != 2 && objc_msgSend(v9, "type") != v6; uint64_t i = objc_msgSend(v9, "type"))
  {
    [v5 reconsumeToken:v9];
    v11 = +[IKCSSParser consumeComponentValue:v5];
    [v8 addObject:v11];

    uint64_t v9 = [v5 getNextToken];
  }
  if ([v9 type] == v6)
  {
    [v5 reconsumeToken:v9];
    v12 = +[IKCSSParser consumeComponentValue:v5];
    [v8 addObject:v12];
  }
  v13 = [[IKArray alloc] initWithNSArray:v8];
  [(IKCSSParseObject *)v7 setCssValue:v13];

LABEL_15:
  return v7;
}

+ (id)consumeFunction:(id)a3 fromToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == 17)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    NSUInteger v8 = [v6 range];
    NSUInteger v10 = v9;
    v11 = objc_alloc_init(IKCSSParseFunction);
    v12 = [v6 stringValue];
    [(IKCSSParseFunction *)v11 setName:v12];

    v13 = [v5 getNextToken];
    uint64_t v14 = [v13 type];
    uint64_t v15 = [v13 type];
    if (v14 != 2 && v15 != 9)
    {
      do
      {
        [v5 reconsumeToken:v13];
        int v16 = +[IKCSSParser consumeComponentValue:v5];
        [v7 addObject:v16];

        v13 = [v5 getNextToken];
        uint64_t v17 = [v13 type];
        uint64_t v18 = [v13 type];
      }
      while (v17 != 2 && v18 != 9);
    }

    v19 = [[IKArray alloc] initWithNSArray:v7];
    [(IKCSSParseObject *)v11 setCssValue:v19];

    uint64_t v20 = [v5 currentToken];
    v26.location = [v20 range];
    v26.length = v21;
    v25.location = v8;
    v25.length = v10;
    NSRange v22 = NSUnionRange(v25, v26);
    -[IKCSSParseObject setRange:](v11, "setRange:", v22.location, v22.length);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)consumeDeclarationList:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)[v3 mutableCopy];
  unint64_t v5 = 0x1E4F1C000uLL;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    if (![v4 count]) {
      goto LABEL_12;
    }
    v7 = [v4 firstObject];
    if ([v7 type] != 1) {
      break;
    }
    NSUInteger v8 = [v4 firstObject];
    NSUInteger v9 = [v8 token];
    uint64_t v10 = [v9 type];

    if (v10 != 1) {
      goto LABEL_12;
    }
    [v4 removeObjectAtIndex:0];
  }

LABEL_12:
  while ([v4 count])
  {
    v11 = [v4 lastObject];
    if ([v11 type] != 1)
    {

      break;
    }
    v12 = [v4 lastObject];
    v13 = [v12 token];
    if ([v13 type] == 1)
    {
    }
    else
    {
      uint64_t v14 = [v4 lastObject];
      uint64_t v15 = [v14 token];
      uint64_t v16 = [v15 type];

      if (v16 != 26) {
        break;
      }
    }
    [v4 removeLastObject];
  }
  uint64_t v17 = [v3 firstObject];
  NSUInteger location = [v17 range];

  if (![v4 count])
  {
    NSUInteger length = 0;
    goto LABEL_44;
  }
  v19 = [v4 firstObject];
  NSUInteger v20 = [v19 range];
  NSUInteger v22 = v21;
  uint64_t v23 = [v4 lastObject];
  v40.NSUInteger location = [v23 range];
  v40.NSUInteger length = v24;
  v39.NSUInteger location = v20;
  v39.NSUInteger length = v22;
  NSRange v25 = NSUnionRange(v39, v40);
  NSUInteger location = v25.location;
  NSUInteger length = v25.length;

  if (![v4 count]) {
    goto LABEL_44;
  }
  unint64_t v27 = 0;
  do
  {
    v28 = [v4 objectAtIndex:v27];
    if ([v28 type] != 1) {
      goto LABEL_41;
    }
    v29 = [v28 token];
    if ([v29 type] == 1 || objc_msgSend(v29, "type") == 22) {
      goto LABEL_40;
    }
    if ([v29 type] == 2) {
      goto LABEL_47;
    }
    if ([v29 type] == 29 || objc_msgSend(v29, "type") == 32) {
      goto LABEL_40;
    }
    if ([v29 type] != 18)
    {
LABEL_47:

      break;
    }
    unint64_t v37 = v6;
    v30 = [*(id *)(v5 + 2632) array];
    while (v27 < [v4 count])
    {
      v31 = [v4 objectAtIndex:v27];
      if ([v31 type] != 7)
      {
        if ([v31 type] != 1) {
          goto LABEL_33;
        }
        v32 = [v31 token];

        if ([v32 type] == 22 || objc_msgSend(v32, "type") == 2)
        {
          if ([v32 type] == 22) {
            [v30 addObject:v31];
          }

          v29 = v32;
          break;
        }
        v29 = v32;
      }
      [v30 addObject:v31];
LABEL_33:

      ++v27;
    }
    uint64_t v33 = +[IKCSSParser consumeDeclaration:v30];
    id v6 = v37;
    if (v33) {
      [v37 addObject:v33];
    }

    unint64_t v5 = 0x1E4F1C000;
LABEL_40:

LABEL_41:
    ++v27;
  }
  while (v27 < [v4 count]);
LABEL_44:
  uint64_t v34 = objc_alloc_init(IKCSSParseDeclarationList);
  -[IKCSSParseDeclarationList setRange:](v34, "setRange:", location, length);
  v35 = [[IKArray alloc] initWithNSArray:v6];
  [(IKCSSParseObject *)v34 setCssValue:v35];

  return v34;
}

+ (id)consumeDeclaration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 0;
  if ([v3 count])
  {
    while (1)
    {
      unint64_t v5 = [v3 objectAtIndex:v4];
      if ([v5 type] != 1) {
        break;
      }
      id v6 = [v5 token];
      uint64_t v7 = [v6 type];

      if (v7 != 1) {
        break;
      }

      if (++v4 >= (unint64_t)[v3 count]) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
  unint64_t v8 = v4 + 1;
  if (v4 + 1 < (unint64_t)[v3 count])
  {
    NSUInteger v9 = [v3 objectAtIndex:v4 + 1];
    if ([v9 type] != 1
      || ([v9 token],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 type],
          v10,
          v11 != 21))
    {
      NSUInteger v22 = 0;
      goto LABEL_74;
    }
    unint64_t v8 = v4 + 2;
  }
  v12 = objc_alloc_init(IKCSSParseDeclaration);
  v13 = [v3 objectAtIndex:0];
  uint64_t v14 = [v13 token];

  uint64_t v15 = [v14 range];
  NSUInteger v17 = v16;
  uint64_t v18 = [v14 stringValue];
  [(IKCSSParseDeclaration *)v12 setName:v18];

  v71 = v12;
  NSUInteger range2_8 = v17;
  NSUInteger v75 = v15;
  -[IKCSSParseDeclaration setNameRange:](v12, "setNameRange:", v15, v17);
  v19 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    if (v8 >= [v3 count]) {
      goto LABEL_25;
    }
    NSUInteger v20 = [v3 objectAtIndex:v8];
    if ([v20 type] == 1) {
      break;
    }
    [v19 addObject:v20];
LABEL_17:

    ++v8;
  }
  NSUInteger v21 = [v3 objectAtIndex:v8];
  if ([v21 type] != 2)
  {
    [v19 addObject:v20];

    goto LABEL_17;
  }

LABEL_25:
  while ([v19 count])
  {
    uint64_t v23 = [v19 lastObject];
    if ([v23 type] != 1)
    {

      break;
    }
    NSUInteger v24 = [v19 lastObject];
    NSRange v25 = [v24 token];
    if ([v25 type] == 1)
    {
    }
    else
    {
      NSRange v26 = [v19 lastObject];
      unint64_t v27 = [v26 token];
      uint64_t v28 = [v27 type];

      if (v28 != 26) {
        break;
      }
    }
    [v19 removeLastObject];
  }
  NSUInteger v29 = range2_8 + v75 + 1;
  v30 = [v19 lastObject];
  if (v30)
  {
    v31 = [v19 lastObject];
    uint64_t v32 = [v31 range];
    NSUInteger v34 = v33;
  }
  else
  {
    NSUInteger v34 = 0;
    uint64_t v32 = range2_8 + v75 + 1;
  }
  NSUInteger v35 = v32;

  uint64_t v36 = [v19 firstObject];
  if (v36)
  {
    unint64_t v37 = [v19 firstObject];
    NSUInteger v29 = [v37 range];
    uint64_t range1 = v38;
  }
  else
  {
    uint64_t range1 = 0;
  }

  NSUInteger range2 = v32;
  if ([v19 count])
  {
    NSRange v39 = [v19 lastObject];
    NSUInteger v40 = v34;
    if ([v39 type] == 1)
    {
      v41 = [v19 lastObject];
      v42 = [v41 token];
      BOOL v43 = [v42 type] == 22;
    }
    else
    {
      BOOL v43 = 0;
    }
  }
  else
  {
    NSUInteger v40 = v34;
    BOOL v43 = 0;
  }
  v70 = v14;
  if (!objc_msgSend(v19, "count", range1))
  {
    BOOL v47 = 0;
    if (v43) {
      goto LABEL_48;
    }
LABEL_44:
    NSUInteger v48 = v40;
    NSUInteger v49 = v40;
    NSUInteger v50 = v35;
    NSUInteger v51 = range1a;
    if (v47) {
      goto LABEL_58;
    }
    goto LABEL_62;
  }
  v44 = [v19 firstObject];
  if ([v44 type] == 1)
  {
    v45 = [v19 firstObject];
    v46 = [v45 token];
    BOOL v47 = [v46 type] == 1;
  }
  else
  {
    BOOL v47 = 0;
  }

  if (!v43) {
    goto LABEL_44;
  }
LABEL_48:
  unint64_t v52 = [v19 count];
  uint64_t v53 = [v19 count];
  if (v52 < 2)
  {
    NSUInteger v50 = v35;
    if (v53 == 1) {
      NSUInteger v29 = v35;
    }
    NSUInteger v51 = range1a;
    if (v53 == 1) {
      NSUInteger v51 = 0;
    }
    NSUInteger v48 = v40;
    if (v53 == 1) {
      NSUInteger v49 = 0;
    }
    else {
      NSUInteger v49 = v40;
    }
  }
  else
  {
    long long v54 = [v19 objectAtIndex:v53 - 2];
    NSUInteger v50 = [v54 range];
    NSUInteger v49 = v55;

    NSUInteger v48 = v40;
    NSUInteger v51 = range1a;
  }
  [v19 removeLastObject];
  if (v47)
  {
LABEL_58:
    if ((unint64_t)[v19 count] < 2)
    {
      if ([v19 count] == 1)
      {
        NSUInteger v51 = 0;
        NSUInteger v50 = v29;
        NSUInteger v49 = 0;
      }
    }
    else
    {
      uint64_t v56 = [v19 objectAtIndex:1];
      NSUInteger v29 = [v56 range];
      NSUInteger v51 = v57;
    }
  }
LABEL_62:
  NSUInteger v9 = v70;
  NSUInteger v22 = v71;
  v77.NSUInteger location = v29;
  v77.NSUInteger length = v51;
  v79.NSUInteger location = v50;
  v79.NSUInteger length = v49;
  NSRange v58 = NSUnionRange(v77, v79);
  -[IKCSSParseDeclaration setValueRange:](v71, "setValueRange:", v58.location, v58.length);
  if ((unint64_t)[v19 count] >= 2)
  {
    NSRange v59 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v19, "count") - 1);
    v60 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v19, "count") - 2);
    if ([v60 type] == 1)
    {
      v61 = [v60 token];
      if ([v61 type] == 5
        && [v61 charValue] == 33
        && [v59 type] == 1)
      {
        NSUInteger v72 = v48;
        v62 = [v59 token];
        if ([v62 type] == 18)
        {
          v63 = [v62 stringValue];
          uint64_t v64 = [v63 caseInsensitiveCompare:@"important"];

          if (!v64)
          {
            [(IKCSSParseDeclaration *)v22 setImportant:1];
            [v19 removeLastObject];
            [v19 removeLastObject];
          }
        }

        NSUInteger v48 = v72;
      }
    }
  }
  v65 = [[IKArray alloc] initWithNSArray:v19];
  [(IKCSSParseObject *)v22 setCssValue:v65];

  v78.NSUInteger length = range2_8;
  v78.NSUInteger location = v75;
  v80.NSUInteger location = range2;
  v80.NSUInteger length = v48;
  NSRange v66 = NSUnionRange(v78, v80);
  -[IKCSSParseObject setRange:](v22, "setRange:", v66.location, v66.length);

LABEL_74:
  return v22;
}

@end
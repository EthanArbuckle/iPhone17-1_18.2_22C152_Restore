@interface NSAttributedString(LTParagraphs)
+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withAttributedString:;
+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withString:;
- (id)_ltAttributedStringByTrimmingCharactersInSet:()LTParagraphs;
- (id)paragraphs;
- (id)sentences;
@end

@implementation NSAttributedString(LTParagraphs)

- (id)_ltAttributedStringByTrimmingCharactersInSet:()LTParagraphs
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:a1];
  v6 = [v5 string];
  uint64_t v7 = [v6 rangeOfCharacterFromSet:v4];
  uint64_t v9 = v8;

  if (!v7)
  {
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, v9, &stru_26FAADE68);
      v10 = [v5 string];
      uint64_t v11 = [v10 rangeOfCharacterFromSet:v4];
      uint64_t v9 = v12;
    }
    while (!v11);
  }
  v13 = [v5 string];
  uint64_t v14 = [v13 rangeOfCharacterFromSet:v4 options:4];
  uint64_t v16 = v15;

  while (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [v5 string];
    uint64_t v18 = [v17 length] - 1;

    if (v14 != v18) {
      break;
    }
    objc_msgSend(v5, "replaceCharactersInRange:withString:", v14, v16, &stru_26FAADE68);
    v19 = [v5 string];
    uint64_t v14 = [v19 rangeOfCharacterFromSet:v4 options:4];
    uint64_t v16 = v20;
  }

  return v5;
}

- (id)paragraphs
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:2];
  v3 = [a1 string];
  [v2 setString:v3];

  v21 = v2;
  id v4 = objc_msgSend(v2, "tokensForRange:", 0, objc_msgSend(a1, "length"));
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) rangeValue];
        v13 = objc_msgSend(a1, "attributedSubstringFromRange:", v11, v12);
        uint64_t v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        uint64_t v15 = [v13 _ltAttributedStringByTrimmingCharactersInSet:v14];

        if ([v15 length]) {
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count])
    {
      v17 = [v5 objectAtIndexedSubscript:0];
      uint64_t v18 = [v17 sentences];
      if ((unint64_t)[v18 count] < 2)
      {
        id v16 = (id)MEMORY[0x263EFFA68];
      }
      else
      {
        v19 = [v5 firstObject];
        v26 = v19;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
      }
    }
    else
    {
      id v16 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v16 = v5;
  }

  return v16;
}

- (id)sentences
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:1];
  v3 = [a1 string];
  [v2 setString:v3];

  v17 = v2;
  id v4 = objc_msgSend(v2, "tokensForRange:", 0, objc_msgSend(a1, "length"));
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) rangeValue];
        v13 = objc_msgSend(a1, "attributedSubstringFromRange:", v11, v12);
        uint64_t v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        uint64_t v15 = [v13 _ltAttributedStringByTrimmingCharactersInSet:v14];

        if ([v15 length]) {
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withString:
{
  id v6 = (objc_class *)MEMORY[0x263F086A0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithString:v7];

  v10 = objc_msgSend(a1, "lt_attributedStringByJoiningComponents:withAttributedString:", v8, v9);

  return v10;
}

+ (id)lt_attributedStringByJoiningComponents:()LTParagraphs withAttributedString:
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F089B8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __96__NSAttributedString_LTParagraphs__lt_attributedStringByJoiningComponents_withAttributedString___block_invoke;
  id v16 = &unk_2651DCE28;
  id v17 = v8;
  id v18 = v5;
  id v9 = v5;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:&v13];

  uint64_t v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

@end
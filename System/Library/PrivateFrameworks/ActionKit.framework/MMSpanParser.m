@interface MMSpanParser
- (BOOL)_parseAutolinkDomainWithScanner:(id)a3;
- (BOOL)parseEm;
- (BOOL)parseImages;
- (BOOL)parseLinks;
- (BOOL)parseStrong;
- (MMElement)blockElement;
- (MMHTMLParser)htmlParser;
- (MMSpanParser)initWithExtensions:(unint64_t)a3;
- (NSMutableArray)elements;
- (NSMutableArray)openElements;
- (id)_parseAmpersandWithScanner:(id)a3;
- (id)_parseAutolinkEmailAddressWithScanner:(id)a3;
- (id)_parseAutolinkURLWithScanner:(id)a3;
- (id)_parseAutolinkWWWURLWithScanner:(id)a3;
- (id)_parseAutomaticEmailLinkWithScanner:(id)a3;
- (id)_parseAutomaticLinkWithScanner:(id)a3;
- (id)_parseBackslashWithScanner:(id)a3;
- (id)_parseCodeSpanWithScanner:(id)a3;
- (id)_parseEmAndStrongWithScanner:(id)a3;
- (id)_parseImageWithScanner:(id)a3;
- (id)_parseInlineLinkWithScanner:(id)a3;
- (id)_parseLeftAngleBracketWithScanner:(id)a3;
- (id)_parseLineBreakWithScanner:(id)a3;
- (id)_parseLinkTextBodyWithScanner:(id)a3;
- (id)_parseLinkWithScanner:(id)a3;
- (id)_parseNextElementWithScanner:(id)a3;
- (id)_parseReferenceLinkWithScanner:(id)a3;
- (id)_parseStrikethroughWithScanner:(id)a3;
- (id)_parseWithScanner:(id)a3 untilTestPasses:(id)a4;
- (id)_stringWithBackslashEscapesRemoved:(id)a3;
- (id)parseSpansInBlockElement:(id)a3 withScanner:(id)a4;
- (id)parseSpansInTableColumns:(id)a3 withScanner:(id)a4;
- (unint64_t)extensions;
- (void)_parseAutolinkPathWithScanner:(id)a3;
- (void)setBlockElement:(id)a3;
- (void)setElements:(id)a3;
- (void)setOpenElements:(id)a3;
- (void)setParseEm:(BOOL)a3;
- (void)setParseImages:(BOOL)a3;
- (void)setParseLinks:(BOOL)a3;
- (void)setParseStrong:(BOOL)a3;
@end

@implementation MMSpanParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockElement, 0);
  objc_storeStrong((id *)&self->_openElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

- (void)setParseStrong:(BOOL)a3
{
  self->_parseStrong = a3;
}

- (BOOL)parseStrong
{
  return self->_parseStrong;
}

- (void)setParseLinks:(BOOL)a3
{
  self->_parseLinks = a3;
}

- (BOOL)parseLinks
{
  return self->_parseLinks;
}

- (void)setParseImages:(BOOL)a3
{
  self->_parseImages = a3;
}

- (BOOL)parseImages
{
  return self->_parseImages;
}

- (void)setParseEm:(BOOL)a3
{
  self->_parseEm = a3;
}

- (BOOL)parseEm
{
  return self->_parseEm;
}

- (void)setBlockElement:(id)a3
{
}

- (MMElement)blockElement
{
  return self->_blockElement;
}

- (void)setOpenElements:(id)a3
{
}

- (NSMutableArray)openElements
{
  return self->_openElements;
}

- (void)setElements:(id)a3
{
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (MMHTMLParser)htmlParser
{
  return self->_htmlParser;
}

- (unint64_t)extensions
{
  return self->_extensions;
}

- (id)_stringWithBackslashEscapesRemoved:(id)a3
{
  v4 = v3 = (void *)[a3 mutableCopy];
  uint64_t v5 = [v3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    for (i = 0; i != v13; uint64_t v6 = v13 - i)
    {
      uint64_t v8 = objc_msgSend(v3, "rangeOfString:options:range:", @"\\"", 0, i, v6);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 + v9 == i + v6) {
        break;
      }
      uint64_t v11 = v8;
      uint64_t v12 = v9;
      uint64_t i = v8 + 1;
      if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 + 1))) {
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v11, v12, &stru_26F008428);
      }
      uint64_t v13 = [v3 length];
    }
  }

  return v3;
}

- (id)_parseLeftAngleBracketWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] == 60)
  {
    [v3 advance];
    v4 = objc_opt_new();
    [v4 setType:19];
    objc_msgSend(v4, "setRange:", objc_msgSend(v3, "location") - 1, 1);
    [v4 setStringValue:@"&lt;"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_parseBackslashWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] == 92)
  {
    v4 = [v3 advance];
    if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "nextCharacter")))
    {
      uint64_t v5 = objc_opt_new();
      [v5 setType:19];
      objc_msgSend(v5, "setRange:", objc_msgSend(v3, "location") - 1, 2);
      uint64_t v6 = [v3 string];
      v7 = objc_msgSend(v6, "substringWithRange:", objc_msgSend(v3, "location"), 1);
      [v5 setStringValue:v7];

      [v3 advance];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_parseAmpersandWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] != 38) {
    goto LABEL_5;
  }
  [v3 advance];
  [v3 beginTransaction];
  if ([v3 nextCharacter] == 35) {
    [v3 advance];
  }
  v4 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  [v3 skipCharactersFromSet:v4];

  LODWORD(v4) = [v3 nextCharacter];
  [v3 commitTransaction:0];
  if (v4 != 59)
  {
    uint64_t v5 = objc_opt_new();
    [v5 setType:19];
    objc_msgSend(v5, "setRange:", objc_msgSend(v3, "location") - 1, 1);
    [v5 setStringValue:@"&amp;"];
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_parseImageWithScanner:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 nextCharacter] != 33)
  {
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  [v4 advance];
  [v4 beginTransaction];
  [(MMSpanParser *)self setParseImages:0];
  uint64_t v5 = [(MMSpanParser *)self _parseInlineLinkWithScanner:v4];
  [(MMSpanParser *)self setParseImages:1];
  if (v5)
  {
    [v4 commitTransaction:1];
  }
  else
  {
    [v4 commitTransaction:0];
    [v4 beginTransaction];
    uint64_t v5 = [(MMSpanParser *)self _parseReferenceLinkWithScanner:v4];
    [v4 commitTransaction:1];
    if (!v5) {
      goto LABEL_14;
    }
  }
  [v5 setType:15];
  uint64_t v6 = [v5 range];
  objc_msgSend(v5, "setRange:", v6 - 1, v7 + 1);
  uint64_t v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = objc_msgSend(v5, "innerRanges", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) rangeValue];
        uint64_t v16 = v15;
        v17 = [v4 string];
        v18 = objc_msgSend(v17, "substringWithRange:", v14, v16);
        [v8 appendString:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [v5 setStringValue:v8];
LABEL_14:

  return v5;
}

- (id)_parseLinkWithScanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MMSpanParser *)self _parseInlineLinkWithScanner:v4];
  if (v5
    || ([v4 commitTransaction:0],
        [v4 beginTransaction],
        [(MMSpanParser *)self _parseReferenceLinkWithScanner:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [v5 innerRanges];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      [(MMSpanParser *)self setParseLinks:0];
      uint64_t v8 = [v4 string];
      uint64_t v9 = [v5 innerRanges];
      uint64_t v10 = +[MMScanner scannerWithString:v8 lineRanges:v9];

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __38__MMSpanParser__parseLinkWithScanner___block_invoke;
      v14[3] = &unk_264E5D450;
      id v15 = v10;
      id v11 = v10;
      uint64_t v12 = [(MMSpanParser *)self _parseWithScanner:v11 untilTestPasses:v14];
      [v5 setChildren:v12];

      [(MMSpanParser *)self setParseLinks:1];
    }
  }

  return v5;
}

uint64_t __38__MMSpanParser__parseLinkWithScanner___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) atEndOfString];
}

- (id)_parseReferenceLinkWithScanner:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setType:16];
  uint64_t v6 = [(MMSpanParser *)self _parseLinkTextBodyWithScanner:v4];
  [v5 setInnerRanges:v6];

  uint64_t v7 = [v5 innerRanges];
  id v8 = (id)[v7 count];

  if (v8)
  {
    if ([v4 nextCharacter] == 32)
    {
      [v4 advance];
    }
    else if ([v4 atEndOfLine])
    {
      [v4 advanceToNextLine];
    }
    uint64_t v9 = [(MMSpanParser *)self _parseLinkTextBodyWithScanner:v4];
    if (v9)
    {
      uint64_t v10 = v9;
      v24 = v5;
      if (![v9 count])
      {
        uint64_t v11 = [v5 innerRanges];

        uint64_t v10 = (void *)v11;
      }
      uint64_t v12 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = [*(id *)(*((void *)&v25 + 1) + 8 * i) rangeValue];
            uint64_t v20 = v19;
            long long v21 = [v4 string];
            long long v22 = objc_msgSend(v21, "substringWithRange:", v18, v20);
            [v12 appendString:v22];

            [v12 appendString:@" "];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }

      objc_msgSend(v12, "deleteCharactersInRange:", objc_msgSend(v12, "length") - 1, 1);
      uint64_t v5 = v24;
      objc_msgSend(v24, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      [v24 setIdentifier:v12];
      id v8 = v24;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)_parseInlineLinkWithScanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setType:16];
  uint64_t v6 = [(MMSpanParser *)self _parseLinkTextBodyWithScanner:v4];
  [v5 setInnerRanges:v6];

  uint64_t v7 = [v5 innerRanges];

  if (!v7) {
    goto LABEL_21;
  }
  if ([v4 nextCharacter] != 40)
  {
    uint64_t v7 = 0;
LABEL_21:
    id v24 = 0;
    goto LABEL_22;
  }
  [v4 advance];
  [v4 skipWhitespace];
  uint64_t v8 = [v4 location];
  uint64_t v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"()\\ \t"];
  uint64_t v7 = [v9 invertedSet];

  uint64_t v10 = 1;
  while (1)
  {
    [v4 skipCharactersFromSet:v7];
    if ([v4 atEndOfLine]) {
      goto LABEL_21;
    }
    uint64_t v11 = [v4 location];
    uint64_t v12 = [v4 nextCharacter];
    if (v12 == 92)
    {
      [v4 advance];
      goto LABEL_12;
    }
    uint64_t v13 = v12;
    if (v12 == 41)
    {
      --v10;
      goto LABEL_12;
    }
    if (v12 != 40) {
      break;
    }
    ++v10;
LABEL_12:
    uint64_t v11 = [v4 location];
    [v4 advance];
    if (!v10)
    {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
      uint64_t v18 = [v4 string];
      uint64_t v19 = objc_msgSend(v18, "substringWithRange:", v8, v11 - v8);

      if ([v19 hasPrefix:@"<"]
        && [v19 hasSuffix:@">"])
      {
        uint64_t v20 = objc_msgSend(v19, "substringWithRange:", 1, objc_msgSend(v19, "length") - 2);

        uint64_t v19 = (void *)v20;
      }
      objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      long long v21 = [(MMSpanParser *)self _stringWithBackslashEscapesRemoved:v19];
      [v5 setHref:v21];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v22 = [v4 string];
        long long v23 = objc_msgSend(v22, "substringWithRange:", v16, v17 - v16);
        [v5 setTitle:v23];
      }
      id v24 = v5;

      goto LABEL_22;
    }
  }
  uint64_t v14 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  int v15 = [v14 characterIsMember:v13];

  if (!v15) {
    goto LABEL_12;
  }
  if (v10 != 1) {
    goto LABEL_21;
  }
  [v4 skipWhitespace];
  if ([v4 nextCharacter] == 41)
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_33:
    [v4 advance];
    goto LABEL_14;
  }
  if ([v4 nextCharacter] != 34) {
    goto LABEL_21;
  }
  [v4 advance];
  uint64_t v16 = [v4 location];
  long long v26 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\""];
  uint64_t v27 = [v26 invertedSet];

  while (1)
  {
    [v4 skipCharactersFromSet:v27];
    if ([v4 atEndOfLine]) {
      break;
    }
    [v4 advance];
    if ([v4 nextCharacter] == 41)
    {
      uint64_t v17 = [v4 location] - 1;
      uint64_t v7 = (void *)v27;
      goto LABEL_33;
    }
  }
  id v24 = 0;
  uint64_t v7 = (void *)v27;
LABEL_22:

  return v24;
}

- (id)_parseLinkTextBodyWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 nextCharacter] == 91)
  {
    [v3 advance];
    uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"[]\\""];
    uint64_t v6 = [v5 invertedSet];

    uint64_t v7 = [v3 currentRange];
    uint64_t v9 = v8;
    uint64_t v10 = 1;
    do
    {
      if ([v3 atEndOfString])
      {
        id v14 = 0;
        goto LABEL_20;
      }
      if ([v3 atEndOfLine])
      {
        if (v9)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v9);
          [v4 addObject:v11];
        }
        [v3 advanceToNextLine];
        uint64_t v7 = [v3 currentRange];
      }
      [v3 skipCharactersFromSet:v6];
      int v12 = [v3 nextCharacter];
      switch(v12)
      {
        case ']':
          --v10;
          break;
        case '\\':
          [v3 advance];
          break;
        case '[':
          ++v10;
          break;
      }
      uint64_t v9 = [v3 location] - v7;
      [v3 advance];
    }
    while (v10);
    if (v9)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v9);
      [v4 addObject:v13];
    }
    id v14 = v4;
LABEL_20:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_parseAutomaticEmailLinkWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] != 60) {
    goto LABEL_3;
  }
  [v3 advance];
  uint64_t v4 = [v3 location];
  uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@">"];
  uint64_t v6 = [v5 invertedSet];
  [v3 skipCharactersFromSet:v6];

  if (([v3 atEndOfLine] & 1) == 0)
  {
    [v3 advance];
    uint64_t v8 = [v3 location] + ~v4;
    uint64_t v9 = [v3 string];
    uint64_t v10 = objc_msgSend(v9, "substringWithRange:", v4, v8);

    if (_parseAutomaticEmailLinkWithScanner__onceToken != -1) {
      dispatch_once(&_parseAutomaticEmailLinkWithScanner__onceToken, &__block_literal_global_76);
    }
    uint64_t v7 = 0;
    if (objc_msgSend((id)_parseAutomaticEmailLinkWithScanner__regex, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_opt_new();
      [v7 setType:17];
      objc_msgSend(v7, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
      [v7 setHref:v10];
    }
  }
  else
  {
LABEL_3:
    uint64_t v7 = 0;
  }

  return v7;
}

void __52__MMSpanParser__parseAutomaticEmailLinkWithScanner___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[-._0-9\\p{L}]+@[-\\p{L}0-9][-.\\p{L}0-9]*\\.\\p{L}+$" options:1 error:0];
  v1 = (void *)_parseAutomaticEmailLinkWithScanner__regex;
  _parseAutomaticEmailLinkWithScanner__regex = v0;
}

- (id)_parseAutomaticLinkWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] != 60) {
    goto LABEL_3;
  }
  [v3 advance];
  uint64_t v4 = [v3 location];
  uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@">"];
  uint64_t v6 = [v5 invertedSet];
  [v3 skipCharactersFromSet:v6];

  if (([v3 atEndOfLine] & 1) == 0)
  {
    [v3 advance];
    uint64_t v8 = [v3 location] + ~v4;
    uint64_t v9 = [v3 string];
    uint64_t v10 = objc_msgSend(v9, "substringWithRange:", v4, v8);

    if (_parseAutomaticLinkWithScanner__onceToken != -1) {
      dispatch_once(&_parseAutomaticLinkWithScanner__onceToken, &__block_literal_global_50112);
    }
    uint64_t v7 = 0;
    if (objc_msgSend((id)_parseAutomaticLinkWithScanner__regex, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [NSURL URLWithString:v10];
      if (v11)
      {
        id v19 = v11;
        uint64_t v7 = objc_opt_new();
        [v7 setType:16];
        objc_msgSend(v7, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
        [v7 setHref:v10];
        int v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"&"];
        if (v8)
        {
          while (1)
          {
            uint64_t v13 = [v3 string];
            uint64_t v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v12, 0, v4, v8);

            if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            if (v14 != v4)
            {
              int v15 = objc_opt_new();
              [v15 setType:0];
              objc_msgSend(v15, "setRange:", v4, v14 - v4);
              [v7 addChild:v15];
            }
            uint64_t v16 = objc_opt_new();
            [v16 setType:19];
            objc_msgSend(v16, "setRange:", v4, 1);
            [v16 setStringValue:@"&amp;"];
            [v7 addChild:v16];
            v8 += v4 + ~v14;

            uint64_t v4 = v14 + 1;
            if (!v8) {
              goto LABEL_16;
            }
          }
          uint64_t v17 = objc_opt_new();
          [v17 setType:0];
          objc_msgSend(v17, "setRange:", v4, v8);
          [v7 addChild:v17];
        }
LABEL_16:

        uint64_t v11 = v19;
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
  }
  else
  {
LABEL_3:
    uint64_t v7 = 0;
  }

  return v7;
}

void __47__MMSpanParser__parseAutomaticLinkWithScanner___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(\\w+)://" options:0 error:0];
  v1 = (void *)_parseAutomaticLinkWithScanner__regex;
  _parseAutomaticLinkWithScanner__regex = v0;
}

- (id)_parseLineBreakWithScanner:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" "];
  if ((unint64_t)[v3 skipCharactersFromSet:v4] >= 2
    && [v3 atEndOfLine]
    && ([v3 atEndOfString] & 1) == 0)
  {
    uint64_t v7 = [v3 startLocation] + 1;
    uint64_t v5 = objc_opt_new();
    [v5 setType:10];
    objc_msgSend(v5, "setRange:", v7, objc_msgSend(v3, "location") - v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_parseCodeSpanWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] != 96)
  {
    id v7 = 0;
    goto LABEL_34;
  }
  [v3 advance];
  uint64_t v4 = objc_opt_new();
  [v4 setType:14];
  int v5 = [v3 nextCharacter];
  uint64_t v6 = 1;
  while (v5 == 96)
  {
    ++v6;
    [v3 advance];
    int v5 = [v3 nextCharacter];
  }
  uint64_t v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v3 skipCharactersFromSet:v8];
  uint64_t v9 = ;
  uint64_t v10 = [v9 invertedSet];

  uint64_t v11 = [v3 location];
  if ([v3 atEndOfString])
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_33;
  }
  while (1)
  {
    [v3 skipCharactersFromSet:v10];
    if (v11 != [v3 location])
    {
      int v12 = objc_opt_new();
      [v12 setType:0];
      objc_msgSend(v12, "setRange:", v11, objc_msgSend(v3, "location") - v11);
      [v4 addChild:v12];
    }
    if ([v3 nextCharacter] == 96) {
      break;
    }
    int v15 = [v3 nextCharacter];
    switch(v15)
    {
      case '>':
        uint64_t v16 = objc_opt_new();
        [v16 setType:19];
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        uint64_t v17 = v16;
        uint64_t v18 = @"&gt;";
        goto LABEL_22;
      case '<':
        uint64_t v16 = objc_opt_new();
        [v16 setType:19];
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        uint64_t v17 = v16;
        uint64_t v18 = @"&lt;";
        goto LABEL_22;
      case '&':
        uint64_t v16 = objc_opt_new();
        [v16 setType:19];
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        uint64_t v17 = v16;
        uint64_t v18 = @"&amp;";
LABEL_22:
        [v17 setStringValue:v18];
        [v4 addChild:v16];
        [v3 advance];

        goto LABEL_23;
    }
    if ([v3 atEndOfLine])
    {
      uint64_t v11 = [v3 location];
      [v3 advanceToNextLine];
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v11 = [v3 location];
LABEL_24:
    if ([v3 atEndOfString]) {
      goto LABEL_7;
    }
  }
  uint64_t v13 = [v3 location];
  if (v6)
  {
    uint64_t v11 = v13;
    uint64_t v14 = v6;
    while ([v3 nextCharacter] == 96)
    {
      [v3 advance];
      if (!--v14) {
        goto LABEL_28;
      }
    }
    goto LABEL_24;
  }
LABEL_28:
  id v19 = [v4 children];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    long long v21 = [v4 children];
    long long v22 = [v21 lastObject];

    long long v23 = [v3 string];
    uint64_t v24 = [v22 range];
    uint64_t v26 = [v23 characterAtIndex:v25 + v24 - 1];

    uint64_t v27 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    LODWORD(v26) = [v27 characterIsMember:v26];

    if (v26)
    {
      do
      {
        uint64_t v28 = [v22 range];
        objc_msgSend(v22, "setRange:", v28, v29 - 1);
        uint64_t v30 = [v3 string];
        uint64_t v31 = [v22 range];
        uint64_t v33 = [v30 characterAtIndex:v32 + v31 - 1];

        v34 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        LOBYTE(v33) = [v34 characterIsMember:v33];
      }
      while ((v33 & 1) != 0);
    }
  }
  objc_msgSend(v4, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
  id v7 = v4;
LABEL_33:

LABEL_34:
  return v7;
}

- (id)_parseEmAndStrongWithScanner:(id)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 nextCharacter];
  int v6 = v5;
  if (v5 != 95 && v5 != 42)
  {
    uint64_t v17 = 0;
    goto LABEL_60;
  }
  BOOL v7 = v5 == 95;
  uint64_t v8 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  __int16 v9 = [(MMSpanParser *)self extensions];
  char v10 = !v7;
  if ((v9 & 0x200) == 0) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    [v4 commitTransaction:0];
    uint64_t v11 = [v4 previousCharacter];
    [v4 beginTransaction];
    if ([v8 characterIsMember:v11]) {
      goto LABEL_17;
    }
  }
  if ([v4 previousCharacter] == v6) {
    goto LABEL_17;
  }
  if ([v4 nextCharacter] != v6)
  {
    uint64_t v15 = 0;
    BOOL v34 = 0;
    BOOL v16 = 0;
    goto LABEL_20;
  }
  uint64_t v12 = -1;
  do
  {
    uint64_t v13 = v12;
    [v4 advance];
    int v14 = [v4 nextCharacter];
    uint64_t v12 = v13 + 1;
  }
  while (v14 == v6);
  uint64_t v15 = v13 + 2;
  if ((unint64_t)(v13 + 2) > 3) {
    goto LABEL_17;
  }
  BOOL v34 = v12 == 0;
  BOOL v16 = v15 == 3;
  if ((v12 | 2) == 2 && ![(MMSpanParser *)self parseEm]) {
    goto LABEL_17;
  }
  if ((v15 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_20:
    int v36 = 0;
LABEL_21:
    uint64_t v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__MMSpanParser__parseEmAndStrongWithScanner___block_invoke;
    aBlock[3] = &unk_264E5D4A0;
    id v19 = v4;
    id v38 = v19;
    __int16 v43 = v6;
    v42 = &v44;
    id v33 = v18;
    id v39 = v33;
    v40 = self;
    id v41 = v8;
    v35 = _Block_copy(aBlock);
    if ((v15 | 2) == 3) {
      [(MMSpanParser *)self setParseEm:0];
    }
    if (v36) {
      [(MMSpanParser *)self setParseStrong:0];
    }
    uint64_t v20 = [(MMSpanParser *)self _parseWithScanner:v19 untilTestPasses:v35];
    long long v21 = (void *)v20;
    if ((v15 | 2) == 3 && (!v20 || v45[3] != 1)) {
      [(MMSpanParser *)self setParseEm:1];
    }
    if (v36)
    {
      if (v21 && v45[3] == 2) {
        goto LABEL_34;
      }
      [(MMSpanParser *)self setParseStrong:1];
    }
    if (!v21)
    {
      uint64_t v17 = 0;
LABEL_58:

      _Block_object_dispose(&v44, 8);
      goto LABEL_59;
    }
LABEL_34:
    if (v16) {
      BOOL v34 = v45[3] != 1;
    }
    uint64_t v22 = [v19 startLocation];
    uint64_t v23 = v45[3];
    uint64_t v24 = objc_opt_new();
    id v25 = v24;
    if (v34) {
      uint64_t v26 = 13;
    }
    else {
      uint64_t v26 = 12;
    }
    [v24 setType:v26];
    objc_msgSend(v25, "setRange:", v23 + v22, objc_msgSend(v19, "location") - (v23 + v22));
    [v25 setChildren:v21];
    uint64_t v27 = v45[3];
    if (v16)
    {
      if (!v27)
      {
        v48[0] = v25;
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
        uint64_t v29 = objc_opt_new();

        [v29 setType:12];
        objc_msgSend(v29, "setRange:", objc_msgSend(v19, "startLocation"), objc_msgSend(v19, "location") - objc_msgSend(v19, "startLocation"));
        [v29 setChildren:v28];
LABEL_52:

LABEL_56:
        id v25 = v29;
        uint64_t v17 = v25;
        goto LABEL_57;
      }
    }
    else if (!v27)
    {
      uint64_t v29 = v25;
      goto LABEL_56;
    }
    uint64_t v30 = [(MMSpanParser *)self _parseWithScanner:v19 untilTestPasses:v35];
    uint64_t v28 = (void *)[v30 mutableCopy];

    if ((v15 | 2) == 3) {
      [(MMSpanParser *)self setParseEm:1];
    }
    if (v36) {
      [(MMSpanParser *)self setParseStrong:1];
    }
    if (!v28)
    {
      uint64_t v17 = 0;
LABEL_57:

      goto LABEL_58;
    }
    [v28 insertObject:v25 atIndex:0];
    uint64_t v29 = objc_opt_new();

    if (v34) {
      uint64_t v31 = 12;
    }
    else {
      uint64_t v31 = 13;
    }
    [v29 setType:v31];
    objc_msgSend(v29, "setRange:", objc_msgSend(v19, "startLocation"), objc_msgSend(v19, "location") - objc_msgSend(v19, "startLocation"));
    [v29 setChildren:v28];
    goto LABEL_52;
  }
  if ([(MMSpanParser *)self parseStrong])
  {
    int v36 = 1;
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v17 = 0;
LABEL_59:

LABEL_60:
  return v17;
}

uint64_t __45__MMSpanParser__parseEmAndStrongWithScanner___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) atBeginningOfLine] & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "previousCharacter")) & 1) != 0
    || [*(id *)(a1 + 32) nextCharacter] != *(unsigned __int16 *)(a1 + 72))
  {
    return 0;
  }
  unint64_t v2 = 0;
  while (1)
  {
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v2 >= v3) {
      break;
    }
    ++v2;
    [*(id *)(a1 + 32) advance];
    if ([*(id *)(a1 + 32) nextCharacter] != *(unsigned __int16 *)(a1 + 72))
    {
      unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      goto LABEL_9;
    }
  }
  if (!v2) {
    return 0;
  }
LABEL_9:
  BOOL v4 = v2 == v3 || v3 == 3;
  if (!v4
    || ([*(id *)(a1 + 48) extensions] & 0x200) != 0
    && *(_WORD *)(a1 + 72) == 95
    && (objc_msgSend(*(id *)(a1 + 56), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "nextCharacter")) & 1) != 0)
  {
    return 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) -= v2;
  return 1;
}

- (id)_parseStrikethroughWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 matchString:@"~~"])
  {
    int v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __47__MMSpanParser__parseStrikethroughWithScanner___block_invoke;
    int v14 = &unk_264E5D478;
    id v6 = v4;
    id v15 = v6;
    id v7 = v5;
    id v16 = v7;
    uint64_t v8 = [(MMSpanParser *)self _parseWithScanner:v6 untilTestPasses:&v11];
    if (v8)
    {
      __int16 v9 = objc_opt_new();
      objc_msgSend(v9, "setType:", 11, v11, v12, v13, v14, v15);
      objc_msgSend(v9, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
      [v9 setChildren:v8];
    }
    else
    {
      __int16 v9 = 0;
    }
  }
  else
  {
    __int16 v9 = 0;
  }

  return v9;
}

uint64_t __47__MMSpanParser__parseStrikethroughWithScanner___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) atBeginningOfLine] & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "previousCharacter")) & 1) != 0)
  {
    return 0;
  }
  unint64_t v3 = *(void **)(a1 + 32);
  return [v3 matchString:@"~~"];
}

- (id)_parseAutolinkWWWURLWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 matchString:@"www."]
    && [(MMSpanParser *)self _parseAutolinkDomainWithScanner:v4])
  {
    [(MMSpanParser *)self _parseAutolinkPathWithScanner:v4];
    uint64_t v5 = [v4 startLocation];
    uint64_t v6 = [v4 location];
    uint64_t v7 = v6 - [v4 startLocation];
    uint64_t v8 = [v4 string];
    __int16 v9 = objc_msgSend(v8, "substringWithRange:", v5, v7);

    char v10 = objc_opt_new();
    [v10 setType:16];
    objc_msgSend(v10, "setRange:", v5, v7);
    uint64_t v11 = [@"http://" stringByAppendingString:v9];
    [v10 setHref:v11];

    uint64_t v12 = objc_opt_new();
    [v12 setType:0];
    objc_msgSend(v12, "setRange:", v5, v7);
    [v10 addChild:v12];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_parseAutolinkURLWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 nextCharacter] == 58)
  {
    [v4 commitTransaction:0];
    uint64_t v5 = [v4 previousWord];
    [v4 beginTransaction];
    uint64_t v6 = [v5 lowercaseString];
    int v7 = [&unk_26F076998 containsObject:v6];

    if (v7
      && [v4 matchString:@"://"]
      && [(MMSpanParser *)self _parseAutolinkDomainWithScanner:v4])
    {
      [(MMSpanParser *)self _parseAutolinkPathWithScanner:v4];
      uint64_t v8 = [v4 startLocation];
      uint64_t v9 = v8 - [v5 length];
      uint64_t v10 = [v4 location] - v9;
      uint64_t v11 = objc_opt_new();
      [v11 setType:16];
      objc_msgSend(v11, "setRange:", v9, v10);
      uint64_t v12 = [v4 string];
      uint64_t v13 = objc_msgSend(v12, "substringWithRange:", v9, v10);
      [v11 setHref:v13];

      int v14 = objc_opt_new();
      [v14 setType:0];
      objc_msgSend(v14, "setRange:", v9, v10);
      [v11 addChild:v14];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_parseAutolinkEmailAddressWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] == 64)
  {
    id v4 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    uint64_t v5 = (void *)[v4 mutableCopy];
    [v5 addCharactersInString:@"._-+"];
    uint64_t v6 = (void *)[v4 mutableCopy];
    [v6 addCharactersInString:@"._-"];
    [v3 commitTransaction:0];
    int v7 = [v3 previousWordWithCharactersFromSet:v5];
    [v3 beginTransaction];
    if ([v7 length])
    {
      [v3 advance];
      uint64_t v8 = [v3 nextWordWithCharactersFromSet:v5];
      uint64_t v9 = [v8 rangeOfCharacterFromSet:v4 options:4];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v12 = [v8 substringToIndex:v9 + v10];

        if ([v12 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = 0;
        }
        else
        {
          objc_msgSend(v3, "setLocation:", objc_msgSend(v3, "location") + objc_msgSend(v12, "length"));
          uint64_t v13 = [v3 startLocation];
          uint64_t v14 = v13 - [v7 length];
          uint64_t v15 = [v3 location] - v14;
          uint64_t v11 = objc_opt_new();
          [v11 setType:17];
          objc_msgSend(v11, "setRange:", v14, v15);
          id v16 = [v3 string];
          uint64_t v17 = objc_msgSend(v16, "substringWithRange:", v14, v15);
          [v11 setHref:v17];
        }
        uint64_t v8 = v12;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_parseAutolinkPathWithScanner:(id)a3
{
  id v11 = a3;
  id v3 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  id v4 = (void *)[v3 mutableCopy];
  [v4 addCharactersInString:@",_-/:?&;%~!#+=@"];
  uint64_t v5 = 0;
  while (1)
  {
    while (1)
    {
LABEL_2:
      uint64_t v6 = v11;
      while (1)
      {
        do
        {
          uint64_t v7 = [v6 skipCharactersFromSet:v4];
          uint64_t v6 = v11;
        }
        while (v7);
        if ([v11 nextCharacter] != 92) {
          break;
        }
        [v11 advance];
        int v8 = [v11 nextCharacter];
        uint64_t v6 = v11;
        if (v8 != 40)
        {
          int v9 = [v11 nextCharacter];
          uint64_t v6 = v11;
          if (v9 != 41) {
            continue;
          }
        }
        [v6 advance];
        goto LABEL_2;
      }
      if ([v11 nextCharacter] == 40)
      {
        uint64_t v10 = 1;
        goto LABEL_16;
      }
      if ([v11 nextCharacter] != 41 || !v5) {
        break;
      }
      uint64_t v10 = -1;
LABEL_16:
      v5 += v10;
      [v11 advance];
    }
    if ([v11 nextCharacter] != 46) {
      goto LABEL_18;
    }
    [v11 beginTransaction];
    [v11 advance];
    if (!objc_msgSend(v4, "characterIsMember:", objc_msgSend(v11, "nextCharacter"))) {
      break;
    }
    [v11 commitTransaction:1];
  }
  [v11 commitTransaction:0];
LABEL_18:
}

- (BOOL)_parseAutolinkDomainWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  uint64_t v5 = (void *)[v4 mutableCopy];
  [v5 addCharactersInString:@"-:"];
  if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "nextCharacter"))
    && ([v3 skipCharactersFromSet:v5], objc_msgSend(v3, "nextCharacter") == 46))
  {
    [v3 advance];
    BOOL v6 = [v3 skipCharactersFromSet:v5] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_parseNextElementWithScanner:(id)a3
{
  id v4 = a3;
  if (([(MMSpanParser *)self extensions] & 0x40) == 0
    || ([v4 beginTransaction],
        [(MMSpanParser *)self _parseStrikethroughWithScanner:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 commitTransaction:v5 != 0],
        !v5))
  {
    if (![(MMSpanParser *)self parseLinks]) {
      goto LABEL_27;
    }
    if (([(MMSpanParser *)self extensions] & 1) == 0) {
      goto LABEL_27;
    }
    [v4 beginTransaction];
    uint64_t v5 = [(MMSpanParser *)self _parseAutolinkEmailAddressWithScanner:v4];
    [v4 commitTransaction:v5 != 0];
    if (!v5)
    {
      [v4 beginTransaction];
      uint64_t v5 = [(MMSpanParser *)self _parseAutolinkURLWithScanner:v4];
      [v4 commitTransaction:v5 != 0];
      if (!v5)
      {
        [v4 beginTransaction];
        uint64_t v5 = [(MMSpanParser *)self _parseAutolinkWWWURLWithScanner:v4];
        [v4 commitTransaction:v5 != 0];
        if (!v5)
        {
LABEL_27:
          [v4 beginTransaction];
          uint64_t v5 = [(MMSpanParser *)self _parseBackslashWithScanner:v4];
          [v4 commitTransaction:v5 != 0];
          if (!v5)
          {
            [v4 beginTransaction];
            uint64_t v5 = [(MMSpanParser *)self _parseEmAndStrongWithScanner:v4];
            [v4 commitTransaction:v5 != 0];
            if (!v5)
            {
              [v4 beginTransaction];
              uint64_t v5 = [(MMSpanParser *)self _parseCodeSpanWithScanner:v4];
              [v4 commitTransaction:v5 != 0];
              if (!v5)
              {
                [v4 beginTransaction];
                uint64_t v5 = [(MMSpanParser *)self _parseLineBreakWithScanner:v4];
                [v4 commitTransaction:v5 != 0];
                if (!v5)
                {
                  if (![(MMSpanParser *)self parseLinks]) {
                    goto LABEL_28;
                  }
                  [v4 beginTransaction];
                  uint64_t v5 = [(MMSpanParser *)self _parseAutomaticLinkWithScanner:v4];
                  [v4 commitTransaction:v5 != 0];
                  if (!v5)
                  {
                    [v4 beginTransaction];
                    uint64_t v5 = [(MMSpanParser *)self _parseAutomaticEmailLinkWithScanner:v4];
                    [v4 commitTransaction:v5 != 0];
                    if (!v5)
                    {
                      [v4 beginTransaction];
                      uint64_t v5 = [(MMSpanParser *)self _parseLinkWithScanner:v4];
                      [v4 commitTransaction:v5 != 0];
                      if (!v5)
                      {
LABEL_28:
                        if (![(MMSpanParser *)self parseImages]
                          || ([v4 beginTransaction],
                              [(MMSpanParser *)self _parseImageWithScanner:v4],
                              uint64_t v5 = objc_claimAutoreleasedReturnValue(),
                              [v4 commitTransaction:v5 != 0],
                              !v5))
                        {
                          [v4 beginTransaction];
                          BOOL v6 = [(MMSpanParser *)self htmlParser];
                          uint64_t v5 = [v6 parseInlineTagWithScanner:v4];

                          [v4 commitTransaction:v5 != 0];
                          if (!v5)
                          {
                            [v4 beginTransaction];
                            uint64_t v7 = [(MMSpanParser *)self htmlParser];
                            uint64_t v5 = [v7 parseCommentWithScanner:v4];

                            [v4 commitTransaction:v5 != 0];
                            if (!v5)
                            {
                              [v4 beginTransaction];
                              uint64_t v5 = [(MMSpanParser *)self _parseAmpersandWithScanner:v4];
                              [v4 commitTransaction:v5 != 0];
                              if (!v5)
                              {
                                [v4 beginTransaction];
                                uint64_t v5 = [(MMSpanParser *)self _parseLeftAngleBracketWithScanner:v4];
                                [v4 commitTransaction:v5 != 0];
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

- (id)_parseWithScanner:(id)a3 untilTestPasses:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(void))a4;
  v22 = int v8 = [MEMORY[0x263EFF980] array];
  uint64_t v23 = [v22 invertedSet];
  [v6 beginTransaction];
  if ([v6 atEndOfString])
  {
LABEL_17:
    [v6 commitTransaction:0];
    id v19 = 0;
  }
  else
  {
    while (1)
    {
      int v9 = [(MMSpanParser *)self _parseNextElementWithScanner:v6];
      if (v9)
      {
        uint64_t v10 = [v6 startLocation];
        if (v10 != [v9 range])
        {
          id v11 = objc_opt_new();
          [v11 setType:0];
          objc_msgSend(v11, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v9, "range") - objc_msgSend(v6, "startLocation"));
          [v8 addObject:v11];
        }
        [v8 addObject:v9];
        [v6 commitTransaction:1];
        [v6 beginTransaction];
      }
      else if ([v6 atEndOfLine])
      {
        uint64_t v12 = [v6 startLocation];
        if (v12 != [v6 location])
        {
          uint64_t v13 = objc_opt_new();
          [v13 setType:0];
          objc_msgSend(v13, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
          [v8 addObject:v13];
        }
        if (([(MMSpanParser *)self extensions] & 0x20) != 0)
        {
          uint64_t v14 = [(MMSpanParser *)self blockElement];
          int v15 = [v14 type];

          if (v15 == 2)
          {
            id v16 = objc_opt_new();
            objc_msgSend(v16, "setRange:", objc_msgSend(v6, "location"), 1);
            [v16 setType:10];
            [v8 addObject:v16];
          }
        }
        uint64_t v17 = objc_opt_new();
        objc_msgSend(v17, "setRange:", objc_msgSend(v6, "location"), 1);
        [v17 setType:19];
        [v17 setStringValue:@"\n"];
        [v8 addObject:v17];
        [v6 advanceToNextLine];
        [v6 commitTransaction:1];
        [v6 beginTransaction];
      }
      else if (![v6 skipCharactersFromSet:v23])
      {
        [v6 advance];
      }
      [v6 beginTransaction];
      uint64_t v18 = [v6 location];
      if (v7[2](v7)) {
        break;
      }
      [v6 commitTransaction:0];

      if ([v6 atEndOfString]) {
        goto LABEL_17;
      }
    }
    [v6 commitTransaction:1];
    if ([v6 startLocation] != v18)
    {
      uint64_t v20 = objc_opt_new();
      [v20 setType:0];
      objc_msgSend(v20, "setRange:", objc_msgSend(v6, "startLocation"), v18 - objc_msgSend(v6, "startLocation"));
      [v8 addObject:v20];
    }
    [v6 commitTransaction:1];
    id v19 = v8;
  }
  return v19;
}

- (id)parseSpansInTableColumns:(id)a3 withScanner:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    id obj = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v6 skipWhitespace];
        uint64_t v14 = [v6 location];
        int v15 = [v6 nextCharacter];
        id v16 = (void *)MEMORY[0x263EFFA68];
        if (v15 != 124)
        {
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __53__MMSpanParser_parseSpansInTableColumns_withScanner___block_invoke;
          v22[3] = &unk_264E5D450;
          id v23 = v6;
          id v16 = [(MMSpanParser *)self _parseWithScanner:v23 untilTestPasses:v22];
          if (!v16)
          {

            id v8 = obj;
            id v18 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v17 = objc_opt_new();
        [v17 setType:24];
        [v17 setChildren:v16];
        objc_msgSend(v17, "setRange:", v14, objc_msgSend(v6, "location") - v14);
        objc_msgSend(v17, "setAlignment:", objc_msgSend(v13, "integerValue"));
        [v7 addObject:v17];
        if ([v6 nextCharacter] == 124) {
          [v6 advance];
        }

        if (v15 != 124) {
      }
        }
      id v8 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v18 = v7;
LABEL_16:

  return v18;
}

uint64_t __53__MMSpanParser_parseSpansInTableColumns_withScanner___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) skipWhitespace];
  if ([*(id *)(a1 + 32) nextCharacter] == 124) {
    return 1;
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 atEndOfLine];
}

- (id)parseSpansInBlockElement:(id)a3 withScanner:(id)a4
{
  id v6 = a4;
  [(MMSpanParser *)self setBlockElement:a3];
  [v6 skipWhitespace];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__MMSpanParser_parseSpansInBlockElement_withScanner___block_invoke;
  v10[3] = &unk_264E5D450;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(MMSpanParser *)self _parseWithScanner:v7 untilTestPasses:v10];

  return v8;
}

uint64_t __53__MMSpanParser_parseSpansInBlockElement_withScanner___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) atEndOfString];
}

- (MMSpanParser)initWithExtensions:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MMSpanParser;
  id v4 = [(MMSpanParser *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_extensions = a3;
    uint64_t v6 = objc_opt_new();
    htmlParser = v5->_htmlParser;
    v5->_htmlParser = (MMHTMLParser *)v6;

    [(MMSpanParser *)v5 setParseEm:1];
    [(MMSpanParser *)v5 setParseImages:1];
    [(MMSpanParser *)v5 setParseLinks:1];
    [(MMSpanParser *)v5 setParseStrong:1];
  }
  return v5;
}

@end
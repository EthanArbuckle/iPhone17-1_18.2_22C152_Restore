@interface MMHTMLParser
- (BOOL)_parseAttributeValueWithScanner:(id)a3;
- (BOOL)_parseEndTag:(id)a3 withScanner:(id)a4;
- (BOOL)_parseStringWithScanner:(id)a3;
- (_NSRange)_parseNameWithScanner:(id)a3;
- (id)_parseLenientBlockTagWithScanner:(id)a3;
- (id)_parseStrictBlockTagWithScanner:(id)a3;
- (id)parseBlockTagWithScanner:(id)a3;
- (id)parseCommentWithScanner:(id)a3;
- (id)parseInlineTagWithScanner:(id)a3;
- (void)_parseAttributesWithScanner:(id)a3;
@end

@implementation MMHTMLParser

- (void)_parseAttributesWithScanner:(id)a3
{
  id v4 = a3;
  for (i = v4; [v4 skipWhitespaceAndNewlines]; id v4 = i)
  {
    [(MMHTMLParser *)self _parseNameWithScanner:i];
    if (!v5) {
      break;
    }
    [i beginTransaction];
    [i skipWhitespace];
    if ([i nextCharacter] == 61)
    {
      [i commitTransaction:1];
      [i advance];
      [i skipWhitespace];
      if (![(MMHTMLParser *)self _parseStringWithScanner:i]
        && ![(MMHTMLParser *)self _parseAttributeValueWithScanner:i])
      {
        break;
      }
    }
    else
    {
      [i commitTransaction:0];
    }
  }
}

- (BOOL)_parseAttributeValueWithScanner:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceCharacterSet];
  v6 = [v5 invertedSet];
  v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v4 skipCharactersFromSet:v7];

  return v8 != 0;
}

- (BOOL)_parseStringWithScanner:(id)a3
{
  id v3 = a3;
  int v4 = [v3 nextCharacter];
  int v5 = v4;
  if (v4 == 39 || v4 == 34)
  {
LABEL_3:
    [v3 advance];
    while ([v3 nextCharacter] != v5)
    {
      if ([v3 atEndOfString]) {
        goto LABEL_9;
      }
      if (![v3 atEndOfLine]) {
        goto LABEL_3;
      }
      [v3 advanceToNextLine];
    }
    [v3 advance];
    BOOL v6 = 1;
  }
  else
  {
LABEL_9:
    BOOL v6 = 0;
  }

  return v6;
}

- (_NSRange)_parseNameWithScanner:(id)a3
{
  id v3 = (void *)MEMORY[0x263F089C0];
  id v4 = a3;
  int v5 = [v3 alphanumericCharacterSet];
  [v5 addCharactersInString:@":-"];
  uint64_t v6 = [v4 location];
  uint64_t v7 = [v4 skipCharactersFromSet:v5];

  NSUInteger v8 = v6;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_parseLenientBlockTagWithScanner:(id)a3
{
  id v3 = a3;
  if ([v3 nextCharacter] == 60)
  {
    [v3 advance];
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"p", @"div", @"h1", @"h2", @"h3", @"h4", @"h5", @"h6", @"blockquote", @"pre", @"table", @"dl", @"ol", @"ul", @"script", @"noscript", @"form",
      @"fieldset",
      @"iframe",
      @"math",
      @"ins",
      @"del",
    id v4 = 0);
    int v5 = [v3 nextWord];
    uint64_t v6 = 0;
    if ([v4 containsObject:v5])
    {
      objc_msgSend(v3, "setLocation:", objc_msgSend(v3, "location") + objc_msgSend(v5, "length"));
      while ([v3 nextCharacter] != 62)
      {
        if ([v3 atEndOfString])
        {
          uint64_t v6 = 0;
          goto LABEL_14;
        }
        if ([v3 atEndOfLine]) {
          [v3 advanceToNextLine];
        }
        else {
          [v3 advance];
        }
      }
      if (([v3 atEndOfLine] & 1) == 0)
      {
        do
          [v3 advanceToNextLine];
        while (![v3 atEndOfLine]);
      }
      uint64_t v6 = objc_opt_new();
      [v6 setType:9];
      objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    }
LABEL_14:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_parseEndTag:(id)a3 withScanner:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 nextCharacter] == 60
    && ([v6 advance], objc_msgSend(v6, "nextCharacter") == 47)
    && ([v6 advance],
        [v6 skipWhitespace],
        [v6 matchString:v5])
    && ([v6 skipWhitespace], objc_msgSend(v6, "nextCharacter") == 62))
  {
    [v6 advance];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_parseStrictBlockTagWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 nextCharacter] == 60)
  {
    [v4 advance];
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"p", @"div", @"h1", @"h2", @"h3", @"h4", @"h5", @"h6", @"blockquote", @"pre", @"table", @"dl", @"ol", @"ul", @"script", @"noscript", @"form",
      @"fieldset",
      @"iframe",
      @"math",
      @"ins",
      @"del",
    id v5 = 0);
    id v6 = [v4 nextWord];
    BOOL v7 = 0;
    if ([v5 containsObject:v6])
    {
      objc_msgSend(v4, "setLocation:", objc_msgSend(v4, "location") + objc_msgSend(v6, "length"));
      [(MMHTMLParser *)self _parseAttributesWithScanner:v4];
      [v4 skipWhitespace];
      if ([v4 nextCharacter] == 62)
      {
        [v4 advance];
        NSUInteger v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"<"];
        NSUInteger v9 = [v8 invertedSet];
LABEL_5:

        while (1)
        {
          while (1)
          {
            if ([v4 atEndOfString])
            {
              BOOL v7 = 0;
              goto LABEL_17;
            }
            [v4 skipCharactersFromSet:v9];
            if (![v4 atEndOfLine]) {
              break;
            }
            [v4 advanceToNextLine];
          }
          [v4 beginTransaction];
          if ([(MMHTMLParser *)self _parseEndTag:v6 withScanner:v4]) {
            break;
          }
          [v4 commitTransaction:0];
          [v4 beginTransaction];
          NSUInteger v8 = [(MMHTMLParser *)self _parseStrictBlockTagWithScanner:v4];
          [v4 commitTransaction:v8 != 0];
          if (v8) {
            goto LABEL_5;
          }
          [v4 beginTransaction];
          NSUInteger v8 = [(MMHTMLParser *)self parseCommentWithScanner:v4];
          [v4 commitTransaction:v8 != 0];
          if (v8) {
            goto LABEL_5;
          }
          [v4 beginTransaction];
          BOOL v7 = [(MMHTMLParser *)self parseInlineTagWithScanner:v4];
          [v4 commitTransaction:v7 != 0];

          if (!v7) {
            goto LABEL_17;
          }
        }
        [v4 commitTransaction:1];
        BOOL v7 = objc_opt_new();
        [v7 setType:9];
        objc_msgSend(v7, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
LABEL_17:
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)parseInlineTagWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 nextCharacter] != 60) {
    goto LABEL_9;
  }
  [v4 advance];
  if ([v4 nextCharacter] == 47) {
    [v4 advance];
  }
  uint64_t v5 = [(MMHTMLParser *)self _parseNameWithScanner:v4];
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  [(MMHTMLParser *)self _parseAttributesWithScanner:v4];
  [v4 skipWhitespace];
  if ([v4 nextCharacter] == 47) {
    [v4 advance];
  }
  if ([v4 nextCharacter] == 62)
  {
    [v4 advance];
    NSUInteger v9 = objc_opt_new();
    [v9 setType:9];
    objc_msgSend(v9, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    v10 = [v4 string];
    v11 = objc_msgSend(v10, "substringWithRange:", v7, v8);
    [v9 setStringValue:v11];
  }
  else
  {
LABEL_9:
    NSUInteger v9 = 0;
  }

  return v9;
}

- (id)parseCommentWithScanner:(id)a3
{
  id v3 = a3;
  if (![v3 matchString:@"<!--"])
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  id v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
  uint64_t v5 = [v4 invertedSet];

  if ([v3 atEndOfString])
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  while ([v3 atEndOfLine])
  {
    [v3 advanceToNextLine];
LABEL_7:
    if ([v3 atEndOfString]) {
      goto LABEL_8;
    }
  }
  [v3 skipCharactersFromSet:v5];
  if (![v3 matchString:@"-->"])
  {
    [v3 advance];
    goto LABEL_7;
  }
  uint64_t v6 = objc_opt_new();
  [v6 setType:9];
  objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
LABEL_9:

LABEL_11:
  return v6;
}

- (id)parseBlockTagWithScanner:(id)a3
{
  id v4 = a3;
  [v4 beginTransaction];
  uint64_t v5 = [(MMHTMLParser *)self _parseStrictBlockTagWithScanner:v4];
  [v4 commitTransaction:v5 != 0];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(MMHTMLParser *)self _parseLenientBlockTagWithScanner:v4];
  }
  uint64_t v7 = v6;

  return v7;
}

@end
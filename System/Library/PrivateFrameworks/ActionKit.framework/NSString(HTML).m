@interface NSString(HTML)
- (id)stringByConvertingHTMLToPlainText;
- (id)stringByDecodingHTMLEntities;
- (id)stringByEncodingHTMLEntities;
- (id)stringByEncodingHTMLEntities:()HTML;
- (id)stringByLinkifyingURLs;
- (id)stringByRemovingNewLinesAndWhitespace;
- (id)stringByStrippingTags;
- (id)stringWithNewLinesAsBRs;
@end

@implementation NSString(HTML)

- (id)stringByStrippingTags
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x23ECE6170]();
  if ([a1 rangeOfString:@"<" options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = [NSString stringWithString:a1];
  }
  else
  {
    v4 = [MEMORY[0x263F08B08] scannerWithString:a1];
    [v4 setCharactersToBeSkipped:0];
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v6 = 0;
    do
    {

      [v4 scanUpToString:@"<" intoString:0];
      id v23 = 0;
      [v4 scanUpToString:@">" intoString:&v23];
      id v6 = v23;
      if (v6)
      {
        v7 = (void *)[[NSString alloc] initWithFormat:@"%@>", v6];
        [v5 addObject:v7];
      }
    }
    while (![v4 isAtEnd]);
    v17 = v6;
    v18 = v4;
    v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:a1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v14 isEqualToString:@"<a>"] & 1) != 0
            || ([v14 isEqualToString:@"</a>"] & 1) != 0
            || ([v14 isEqualToString:@"<span>"] & 1) != 0
            || ([v14 isEqualToString:@"</span>"] & 1) != 0
            || ([v14 isEqualToString:@"<strong>"] & 1) != 0
            || ([v14 isEqualToString:@"</strong>"] & 1) != 0
            || ([v14 isEqualToString:@"<em>"] & 1) != 0
            || (v15 = @" ", [v14 isEqualToString:@"</em>"]))
          {
            v15 = &stru_26F008428;
          }
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v14, v15, 2, 0, objc_msgSend(v8, "length"));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    v3 = [v8 stringByRemovingNewLinesAndWhitespace];
  }
  return v3;
}

- (id)stringByLinkifyingURLs
{
  if (NSClassFromString(&cfstr_Nsregularexpre.isa))
  {
    v2 = (void *)MEMORY[0x23ECE6170]();
    objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"(?<!=\")\\b((http|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%%&amp;:/~\\+#]*[\\w\\-\\@?^=%%&amp;/~\\+#])?)",
      0,
    v3 = 0);
    objc_msgSend(v3, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), @"<a href=\"$1\" class=\"linkified\">$1</a>");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

- (id)stringByRemovingNewLinesAndWhitespace
{
  v2 = (void *)MEMORY[0x23ECE6170]();
  v3 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  [v3 setCharactersToBeSkipped:0];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @" \t\n\r%C%C%C%C", 133, 12, 8232, 8233);
  v7 = [v5 characterSetWithCharactersInString:v6];

  if (([v3 isAtEnd] & 1) == 0)
  {
    id v8 = 0;
    do
    {

      id v11 = 0;
      [v3 scanUpToCharactersFromSet:v7 intoString:&v11];
      id v8 = v11;
      if (v8) {
        [v4 appendString:v8];
      }
      if ([v3 scanCharactersFromSet:v7 intoString:0]
        && [v4 length]
        && ([v3 isAtEnd] & 1) == 0)
      {
        [v4 appendString:@" "];
      }
    }
    while (![v3 isAtEnd]);
  }
  id v9 = [NSString stringWithString:v4];

  return v9;
}

- (id)stringWithNewLinesAsBRs
{
  v2 = (void *)MEMORY[0x23ECE6170]();
  v3 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  [v3 setCharactersToBeSkipped:0];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"\n\r%C%C%C%C", 133, 12, 8232, 8233);
  v7 = [v5 characterSetWithCharactersInString:v6];

  id v8 = 0;
  do
  {

    id v16 = 0;
    [v3 scanUpToCharactersFromSet:v7 intoString:&v16];
    id v9 = v16;
    if (v9) {
      [v4 appendString:v9];
    }

    if ([v3 scanString:@"\r\n" intoString:0])
    {
      [v4 appendString:@"<br />"];
      id v8 = 0;
    }
    else
    {
      id v15 = 0;
      int v10 = [v3 scanCharactersFromSet:v7 intoString:&v15];
      id v11 = v15;
      id v8 = v11;
      if (v10 && v11 && [v11 length])
      {
        unint64_t v12 = 0;
        do
        {
          [v4 appendString:@"<br />"];
          ++v12;
        }
        while (v12 < [v8 length]);
      }
    }
  }
  while (![v3 isAtEnd]);
  v13 = [NSString stringWithString:v4];

  return v13;
}

- (id)stringByEncodingHTMLEntities:()HTML
{
  v3 = NSString;
  if (a3) {
    objc_msgSend(a1, "gtm_stringByEscapingForHTML");
  }
  else {
  id v4 = objc_msgSend(a1, "gtm_stringByEscapingForAsciiHTML");
  }
  id v5 = [v3 stringWithString:v4];

  return v5;
}

- (id)stringByEncodingHTMLEntities
{
  v1 = NSString;
  v2 = objc_msgSend(a1, "gtm_stringByEscapingForAsciiHTML");
  v3 = [v1 stringWithString:v2];

  return v3;
}

- (id)stringByDecodingHTMLEntities
{
  v1 = NSString;
  v2 = objc_msgSend(a1, "gtm_stringByUnescapingFromHTML");
  v3 = [v1 stringWithString:v2];

  return v3;
}

- (id)stringByConvertingHTMLToPlainText
{
  context = (void *)MEMORY[0x23ECE6170]();
  v2 = (void *)MEMORY[0x263F08708];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"< \t\n\r%C%C%C%C", 133, 12, 8232, 8233);
  id v4 = [v2 characterSetWithCharactersInString:v3];

  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @" \t\n\r%C%C%C%C", 133, 12, 8232, 8233);
  v7 = [v5 characterSetWithCharactersInString:v6];

  v24 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", objc_msgSend(a1, "length"));
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  [v9 setCharactersToBeSkipped:0];
  [v9 setCaseSensitive:1];
  int v10 = 0;
  id v11 = 0;
  do
  {
    unint64_t v12 = v11;
    id v26 = v11;
    int v13 = [v9 scanUpToCharactersFromSet:v4 intoString:&v26];
    id v11 = v26;

    if (v13)
    {
      [v8 appendString:v11];

      id v11 = 0;
    }
    if ([v9 scanString:@"<" intoString:0])
    {
      if ([v9 scanString:@"!--" intoString:0])
      {
        [v9 scanUpToString:@"-->" intoString:0];
        v14 = v9;
        id v15 = @"-->";
LABEL_33:
        [v14 scanString:v15 intoString:0];
        continue;
      }
      if ([v9 scanString:@"script" intoString:0])
      {
        id v16 = v9;
        v17 = @"</script>";
LABEL_32:
        [v16 scanUpToString:v17 intoString:0];
        v14 = v9;
        id v15 = v17;
        goto LABEL_33;
      }
      if ([v9 scanString:@"/" intoString:0])
      {

        id v25 = 0;
        int v18 = [v9 scanCharactersFromSet:v24 intoString:&v25];
        id v19 = v25;
        long long v20 = v19;
        if (v18)
        {
          int v10 = [v19 lowercaseString];

          if (([v10 isEqualToString:@"a"] & 1) != 0
            || ([v10 isEqualToString:@"b"] & 1) != 0
            || ([v10 isEqualToString:@"i"] & 1) != 0
            || ([v10 isEqualToString:@"q"] & 1) != 0
            || ([v10 isEqualToString:@"span"] & 1) != 0
            || ([v10 isEqualToString:@"em"] & 1) != 0
            || ([v10 isEqualToString:@"strong"] & 1) != 0
            || ([v10 isEqualToString:@"cite"] & 1) != 0
            || ([v10 isEqualToString:@"abbr"] & 1) != 0
            || ([v10 isEqualToString:@"acronym"] & 1) != 0
            || ([v10 isEqualToString:@"label"] & 1) != 0)
          {
            goto LABEL_31;
          }
        }
        else
        {
          int v10 = v19;
        }
        if ([v8 length] && (objc_msgSend(v9, "isAtEnd") & 1) == 0) {
          [v8 appendString:@" "];
        }
      }
LABEL_31:
      id v16 = v9;
      v17 = @">";
      goto LABEL_32;
    }
    if ([v9 scanCharactersFromSet:v7 intoString:0]
      && [v8 length]
      && ([v9 isAtEnd] & 1) == 0)
    {
      [v8 appendString:@" "];
    }
  }
  while (![v9 isAtEnd]);
  long long v21 = [v8 stringByDecodingHTMLEntities];

  return v21;
}

@end
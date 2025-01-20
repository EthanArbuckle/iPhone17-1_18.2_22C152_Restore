@interface MMParser
- (BOOL)_parseListMarkerWithScanner:(id)a3 listType:(int64_t)a4;
- (MMHTMLParser)htmlParser;
- (MMParser)initWithExtensions:(unint64_t)a3;
- (MMSpanParser)spanParser;
- (id)_parseBlockElementWithScanner:(id)a3;
- (id)_parseBlockquoteWithScanner:(id)a3;
- (id)_parseCodeBlockWithScanner:(id)a3;
- (id)_parseCodeLinesWithScanner:(id)a3;
- (id)_parseElementsWithScanner:(id)a3;
- (id)_parseFencedCodeBlockWithScanner:(id)a3;
- (id)_parseHTMLWithScanner:(id)a3;
- (id)_parseHorizontalRuleWithScanner:(id)a3;
- (id)_parseLinkDefinitionWithScanner:(id)a3;
- (id)_parseListItemWithScanner:(id)a3 listType:(int64_t)a4;
- (id)_parseListWithScanner:(id)a3;
- (id)_parseParagraphWithScanner:(id)a3;
- (id)_parsePrefixHeaderWithScanner:(id)a3;
- (id)_parseTableHeaderWithScanner:(id)a3;
- (id)_parseTableRowWithScanner:(id)a3 columns:(id)a4;
- (id)_parseTableWithScanner:(id)a3;
- (id)_parseUnderlinedHeaderWithScanner:(id)a3;
- (id)_removeTabsFromString:(id)a3;
- (id)parseMarkdown:(id)a3 error:(id *)a4;
- (unint64_t)extensions;
- (void)_addTextLineToElement:(id)a3 withScanner:(id)a4;
- (void)_updateLinksFromDefinitionsInDocument:(id)a3;
@end

@implementation MMParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanParser, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

- (MMSpanParser)spanParser
{
  return self->_spanParser;
}

- (MMHTMLParser)htmlParser
{
  return self->_htmlParser;
}

- (unint64_t)extensions
{
  return self->_extensions;
}

- (void)_updateLinksFromDefinitionsInDocument:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v30 = v3;
  v7 = [v3 elements];
  [v6 addObjectsFromArray:v7];
  while (1)
  {

    if (![v6 count]) {
      break;
    }
    v7 = [v6 objectAtIndex:0];
    [v6 removeObjectAtIndex:0];
    v8 = [v7 children];
    [v6 addObjectsFromArray:v8];

    int v9 = [v7 type];
    if ((v9 - 15) >= 2)
    {
      if (v9 == 18)
      {
        v13 = [v7 identifier];
        v14 = [v13 lowercaseString];
        [v5 setObject:v7 forKeyedSubscript:v14];
      }
    }
    else
    {
      uint64_t v10 = [v7 identifier];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [v7 href];

        if (!v12) {
          [v4 addObject:v7];
        }
      }
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
        v21 = [v20 identifier];
        v22 = [v21 lowercaseString];
        v23 = [v5 objectForKeyedSubscript:v22];

        if (!v23)
        {
          [v20 setType:0];
          while (1)
          {
            v26 = [v20 children];
            uint64_t v27 = [v26 count];

            if (!v27) {
              break;
            }
            id v28 = (id)[v20 removeLastChild];
          }
        }
        v24 = [v23 href];
        [v20 setHref:v24];

        v25 = [v23 title];
        [v20 setTitle:v25];

        ++v19;
      }
      while (v19 != v17);
      uint64_t v29 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v17 = v29;
    }
    while (v29);
  }
}

- (id)_parseTableWithScanner:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 advanceToNextLine];
  v5 = [(MMParser *)self _parseTableHeaderWithScanner:v4];
  if (v5)
  {
    [v4 commitTransaction:0];
    [v4 beginTransaction];
    v6 = [(MMParser *)self _parseTableRowWithScanner:v4 columns:v5];
    v7 = v6;
    if (v6)
    {
      [v6 setType:21];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v8 = objc_msgSend(v7, "children", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * i) setType:22];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      [v4 advanceToNextLine];
      v13 = [MEMORY[0x263EFF980] arrayWithObject:v7];
      if (([v4 atEndOfString] & 1) == 0)
      {
        do
        {
          [v4 beginTransaction];
          v14 = [(MMParser *)self _parseTableRowWithScanner:v4 columns:v5];
          [v4 commitTransaction:v14 != 0];
          if (!v14) {
            break;
          }
          [v13 addObject:v14];
        }
        while (![v4 atEndOfString]);
      }
      if ((unint64_t)[v13 count] >= 2)
      {
        id v15 = objc_opt_new();
        [v15 setType:20];
        [v15 setChildren:v13];
        objc_msgSend(v15, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_parseTableRowWithScanner:(id)a3 columns:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F089C0];
  id v8 = a4;
  uint64_t v9 = [v7 whitespaceCharacterSet];
  [v9 addCharactersInString:@"|"];
  uint64_t v10 = (void *)MEMORY[0x263F08D40];
  uint64_t v11 = [v6 currentRange];
  v13 = objc_msgSend(v10, "valueWithRange:", v11, v12);
  v14 = [v6 string];
  v21[0] = v13;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v16 = +[MMScanner scannerWithString:v14 lineRanges:v15];

  [v16 skipCharactersFromSet:v9];
  long long v17 = [(MMParser *)self spanParser];
  long long v18 = [v17 parseSpansInTableColumns:v8 withScanner:v16];

  [v16 skipCharactersFromSet:v9];
  if (v18 && [v16 atEndOfLine])
  {
    [v6 advanceToNextLine];
    long long v19 = objc_opt_new();
    [v19 setType:23];
    [v19 setChildren:v18];
    objc_msgSend(v19, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (id)_parseTableHeaderWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
  [v3 skipWhitespace];
  if ([v3 nextCharacter] == 124) {
    [v3 advance];
  }
  [v3 skipWhitespace];
  v5 = objc_opt_new();
  if ([v3 atEndOfLine])
  {
LABEL_15:
    if ([v3 atEndOfLine])
    {
      id v11 = v5;
      goto LABEL_18;
    }
  }
  else
  {
    while (1)
    {
      int v6 = [v3 nextCharacter];
      if (v6 == 58) {
        [v3 advance];
      }
      if ((unint64_t)[v3 skipCharactersFromSet:v4] < 3) {
        break;
      }
      if ([v3 nextCharacter] == 58)
      {
        [v3 advance];
        uint64_t v7 = 2;
        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v7 = 1;
      }
      if (v6 == 58) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = [NSNumber numberWithInteger:v9];
      [v5 addObject:v10];

      [v3 skipWhitespace];
      if ([v3 nextCharacter] == 124)
      {
        [v3 advance];
        [v3 skipWhitespace];
        if (![v3 atEndOfLine]) {
          continue;
        }
      }
      goto LABEL_15;
    }
  }
  id v11 = 0;
LABEL_18:

  return v11;
}

- (id)_parseParagraphWithScanner:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setType:2];
  int v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  if (([v4 atEndOfString] & 1) == 0)
  {
    while (1)
    {
      [v4 skipWhitespace];
      if ([v4 atEndOfLine])
      {
        [v4 advanceToNextLine];
        goto LABEL_2;
      }
      [v4 beginTransaction];
      [v4 skipCharactersFromSet:v6];
      if ([v4 nextCharacter] == 62)
      {
        v21 = v4;
        uint64_t v22 = 1;
        goto LABEL_22;
      }
      [v4 commitTransaction:0];
      [v4 beginTransaction];
      id v15 = [(MMParser *)self _parseLinkDefinitionWithScanner:v4];

      [v4 commitTransaction:0];
      if (v15) {
        goto LABEL_2;
      }
      [v4 beginTransaction];
      uint64_t v16 = [(MMParser *)self _parseUnderlinedHeaderWithScanner:v4];

      [v4 commitTransaction:0];
      if (v16) {
        goto LABEL_2;
      }
      [v4 beginTransaction];
      long long v17 = [(MMParser *)self _parsePrefixHeaderWithScanner:v4];

      [v4 commitTransaction:0];
      if (v17) {
        goto LABEL_2;
      }
      if (([(MMParser *)self extensions] & 8) != 0)
      {
        [v4 beginTransaction];
        long long v18 = [(MMParser *)self _parseFencedCodeBlockWithScanner:v4];

        [v4 commitTransaction:0];
        if (v18) {
          goto LABEL_2;
        }
      }
      [v4 beginTransaction];
      [v4 skipIndentationUpTo:2];
      if ([(MMParser *)self _parseListMarkerWithScanner:v4 listType:0]) {
        break;
      }
      BOOL v19 = [(MMParser *)self _parseListMarkerWithScanner:v4 listType:1];
      [v4 commitTransaction:0];
      if (!v19)
      {
        [(MMParser *)self _addTextLineToElement:v5 withScanner:v4];
        if (![v4 atEndOfString]) {
          continue;
        }
      }
      goto LABEL_2;
    }
    v21 = v4;
    uint64_t v22 = 0;
LABEL_22:
    [v21 commitTransaction:v22];
  }
LABEL_2:
  objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
  uint64_t v7 = [v5 innerRanges];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v4 string];
    uint64_t v10 = [v5 innerRanges];
    id v11 = +[MMScanner scannerWithString:v9 lineRanges:v10];

    uint64_t v12 = [(MMParser *)self spanParser];
    v13 = [v12 parseSpansInBlockElement:v5 withScanner:v11];
    [v5 setChildren:v13];

    id v14 = v5;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_parseLinkDefinitionWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v3 skipIndentationUpTo:3];
  uint64_t v5 = [v3 location];
  uint64_t v6 = [v3 skipNestedBracketsWithDelimiter:91];
  if (!v6 || (uint64_t v7 = v6, [v3 nextCharacter] != 58))
  {
    long long v18 = 0;
    goto LABEL_22;
  }
  [v3 advance];
  [v3 skipCharactersFromSet:v4];
  uint64_t v8 = [v3 location];
  uint64_t v9 = [v4 invertedSet];
  [v3 skipCharactersFromSet:v9];

  uint64_t v10 = [v3 location] - v8;
  id v11 = [v3 string];
  uint64_t v12 = objc_msgSend(v11, "substringWithRange:", v8, v10);

  if ([v12 hasPrefix:@"<"]
    && [v12 hasSuffix:@">"])
  {
    uint64_t v13 = objc_msgSend(v12, "substringWithRange:", 1, objc_msgSend(v12, "length") - 2);

    uint64_t v12 = (void *)v13;
  }
  [v3 skipCharactersFromSet:v4];
  [v3 beginTransaction];
  if ([v3 atEndOfLine])
  {
    [v3 advanceToNextLine];
    [v3 skipCharactersFromSet:v4];
  }
  unsigned int v14 = [v3 nextCharacter];
  uint64_t v15 = 0;
  if (v14 > 0x28) {
    goto LABEL_16;
  }
  int v16 = v14;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (((1 << v14) & 0x18400000000) != 0)
  {
    [v3 advance];
    if (v16 == 40) {
      int v16 = 41;
    }
    uint64_t v17 = [v3 location];
    uint64_t v15 = [v3 skipToLastCharacterOfLine];
    if ([v3 nextCharacter] == v16)
    {
      [v3 advance];
      goto LABEL_17;
    }
    uint64_t v15 = 0;
LABEL_16:
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_17:
  [v3 commitTransaction:v17 != 0x7FFFFFFFFFFFFFFFLL];
  [v3 skipCharactersFromSet:v4];
  if ([v3 atEndOfLine])
  {
    uint64_t v19 = v5 + 1;
    long long v18 = objc_opt_new();
    [v18 setType:18];
    objc_msgSend(v18, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    long long v20 = [v3 string];
    v21 = objc_msgSend(v20, "substringWithRange:", v19, v7 - 2);
    [v18 setIdentifier:v21];

    [v18 setHref:v12];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = [v3 string];
      v23 = objc_msgSend(v22, "substringWithRange:", v17, v15);
      [v18 setTitle:v23];
    }
  }
  else
  {
    long long v18 = 0;
  }

LABEL_22:
  return v18;
}

- (id)_parseListWithScanner:(id)a3
{
  id v4 = a3;
  [v4 beginTransaction];
  [v4 skipIndentationUpTo:3];
  unsigned int v5 = [v4 nextCharacter];
  BOOL v7 = ((0x2C0000000000uLL >> v5) & 1) == 0 || v5 > 0x2D;
  BOOL v8 = [(MMParser *)self _parseListMarkerWithScanner:v4 listType:v7];
  [v4 commitTransaction:0];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = v9;
    if (v7) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 5;
    }
    [v9 setType:v11];
    if (([v4 atEndOfString] & 1) == 0)
    {
      while (1)
      {
        [v4 beginTransaction];
        [v4 skipEmptyLines];
        uint64_t v12 = [(MMParser *)self _parseHorizontalRuleWithScanner:v4];
        [v4 commitTransaction:0];
        if (v12)
        {

          goto LABEL_19;
        }
        [v4 beginTransaction];
        uint64_t v13 = [(MMParser *)self _parseListItemWithScanner:v4 listType:v7];
        if (!v13) {
          break;
        }
        unsigned int v14 = (void *)v13;
        [v4 commitTransaction:1];
        [v10 addChild:v14];

        if ([v4 atEndOfString]) {
          goto LABEL_19;
        }
      }
      [v4 commitTransaction:0];
    }
LABEL_19:
    objc_msgSend(v10, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_parseListItemWithScanner:(id)a3 listType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 skipEmptyLines];
  [v6 skipIndentationUpTo:3];
  if ([(MMParser *)self _parseListMarkerWithScanner:v6 listType:a4])
  {
    char v43 = v7 != 0;
    BOOL v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    [v6 skipCharactersFromSet:v8];

    uint64_t v9 = objc_opt_new();
    [v9 setType:6];
    if ([v6 atEndOfString])
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v11 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        [v6 beginTransaction];
        uint64_t v12 = [v6 skipEmptyLines];
        [v6 beginTransaction];
        uint64_t v13 = [(MMParser *)self _parseHorizontalRuleWithScanner:v6];

        [v6 commitTransaction:0];
        if (v13) {
          break;
        }
        [v6 beginTransaction];
        [v6 skipIndentationUpTo:1];
        BOOL v14 = [(MMParser *)self _parseListMarkerWithScanner:v6 listType:a4];
        [v6 commitTransaction:0];
        if (v14)
        {
          [v6 commitTransaction:0];
          v43 |= v12 != 0;
          goto LABEL_28;
        }
        [v6 beginTransaction];
        unint64_t v15 = [v6 skipIndentationUpTo:4];
        [v6 beginTransaction];
        BOOL v16 = [(MMParser *)self _parseListMarkerWithScanner:v6 listType:0]
           || [(MMParser *)self _parseListMarkerWithScanner:v6 listType:1];
        [v6 commitTransaction:0];
        if (v15 >= 2 && v16 && v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "addInnerRange:", objc_msgSend(v6, "location"), 0);
          uint64_t v17 = [v9 innerRanges];
          uint64_t v10 = [v17 count];

          uint64_t v18 = [v6 currentRange];
          objc_msgSend(v9, "addInnerRange:", v18, v19);
          [v6 commitTransaction:1];
          [v6 commitTransaction:1];
          [v6 advanceToNextLine];
          unint64_t v11 = v15;
        }
        else
        {
          [v6 commitTransaction:0];
          if (v12)
          {
            [v6 beginTransaction];
            if ((unint64_t)[v6 skipIndentationUpTo:4] < 4)
            {
              [v6 commitTransaction:0];
              break;
            }
            char v43 = 1;
            [v6 commitTransaction:1];
            [v6 commitTransaction:1];
            objc_msgSend(v9, "addInnerRange:", objc_msgSend(v6, "location"), 0);
          }
          else
          {
            [v6 commitTransaction:1];
            [v6 skipIndentationUpTo:v11];
          }
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(MMParser *)self _addTextLineToElement:v9 withScanner:v6];
          }
          else
          {
            uint64_t v20 = [v6 currentRange];
            objc_msgSend(v9, "addInnerRange:", v20, v21);
            [v6 advanceToNextLine];
          }
          [v6 beginTransaction];
          [v6 skipIndentationUpTo:4];
          int v22 = [v6 nextCharacter];
          [v6 commitTransaction:0];
          if (v22 == 62) {
            goto LABEL_28;
          }
        }
        if ([v6 atEndOfString]) {
          goto LABEL_28;
        }
      }
      [v6 commitTransaction:0];
    }
LABEL_28:
    objc_msgSend(v9, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
    v23 = [v9 innerRanges];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = [v6 string];
        v26 = [v9 innerRanges];
        uint64_t v27 = +[MMScanner scannerWithString:v25 lineRanges:v26];

        if (v43)
        {
          id v28 = [(MMParser *)self _parseElementsWithScanner:v27];
          [v9 setChildren:v28];
        }
        else
        {
          id v28 = [(MMParser *)self spanParser];
          v37 = [v28 parseSpansInBlockElement:v9 withScanner:v27];
          [v9 setChildren:v37];
        }
      }
      else
      {
        uint64_t v29 = [v9 innerRanges];
        uint64_t v27 = objc_msgSend(v29, "subarrayWithRange:", 0, v10);

        v30 = [v9 innerRanges];
        long long v31 = [v9 innerRanges];
        id v28 = objc_msgSend(v30, "subarrayWithRange:", v10, objc_msgSend(v31, "count") - v10);

        long long v32 = [v6 string];
        long long v33 = +[MMScanner scannerWithString:v32 lineRanges:v27];

        long long v34 = [v6 string];
        v35 = +[MMScanner scannerWithString:v34 lineRanges:v28];

        if (v43)
        {
          uint64_t v36 = [(MMParser *)self _parseElementsWithScanner:v33];
          [v9 setChildren:v36];
        }
        else
        {
          uint64_t v36 = [(MMParser *)self spanParser];
          v38 = [v36 parseSpansInBlockElement:v9 withScanner:v33];
          [v9 setChildren:v38];
        }
        v39 = [v9 children];
        v40 = [(MMParser *)self _parseElementsWithScanner:v35];
        v41 = [v39 arrayByAddingObjectsFromArray:v40];
        [v9 setChildren:v41];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_parseListMarkerWithScanner:(id)a3 listType:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 1)
  {
    [v5 beginTransaction];
    BOOL v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v9 = [v6 skipCharactersFromSet:v8];

    if (!v9 || [v6 nextCharacter] != 46) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a4)
  {
    LOBYTE(a4) = 0;
    goto LABEL_13;
  }
  [v5 beginTransaction];
  unsigned int v7 = [v6 nextCharacter];
  if (v7 <= 0x2D && ((1 << v7) & 0x2C0000000000) != 0)
  {
LABEL_8:
    [v6 advance];
    if ([v6 nextCharacter] == 32)
    {
      [v6 advance];
      a4 = 1;
      goto LABEL_11;
    }
LABEL_10:
    a4 = 0;
  }
LABEL_11:
  [v6 commitTransaction:a4];
LABEL_13:

  return a4;
}

- (id)_parseHorizontalRuleWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v3 skipCharactersFromSet:v4];

  int v5 = [v3 nextCharacter];
  id v6 = 0;
  if ((v5 - 42) <= 0x35 && ((1 << (v5 - 42)) & 0x20000000000009) != 0)
  {
    int v7 = v5;
    if ([v3 atEndOfLine]) {
      goto LABEL_12;
    }
    unint64_t v8 = 0;
    do
    {
      [v3 advance];
      int v9 = [v3 nextCharacter];
      if (v9 == 32)
      {
        [v3 advance];
        int v9 = [v3 nextCharacter];
      }
      ++v8;
    }
    while (([v3 atEndOfLine] & 1) == 0 && v9 == v7);
    if (v8 < 3
      || ([MEMORY[0x263F08708] whitespaceCharacterSet],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v3 skipCharactersFromSet:v10],
          v10,
          ![v3 atEndOfLine]))
    {
LABEL_12:
      id v6 = 0;
    }
    else
    {
      id v6 = objc_opt_new();
      [v6 setType:8];
      objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    }
  }

  return v6;
}

- (id)_parseFencedCodeBlockWithScanner:(id)a3
{
  id v4 = a3;
  {
    [v4 skipWhitespace];
    int v5 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
    [v5 addCharactersInString:@"-_"];
    id v6 = [v4 nextWordWithCharactersFromSet:v5];
    objc_msgSend(v4, "setLocation:", objc_msgSend(v4, "location") + objc_msgSend(v6, "length"));
    [v4 skipWhitespace];
    if ([v4 atEndOfLine])
    {
      [v4 advanceToNextLine];
      int v7 = objc_opt_new();
      [v7 setType:7];
      if ([v6 length]) {
        unint64_t v8 = v6;
      }
      else {
        unint64_t v8 = 0;
      }
      [v7 setLanguage:v8];
      if (([v4 atEndOfString] & 1) == 0)
      {
        while (1)
        {
          [v4 beginTransaction];
          {
            [v4 skipWhitespace];
            if ([v4 atEndOfLine]) {
              break;
            }
          }
          [v4 commitTransaction:0];
          uint64_t v9 = [v4 currentRange];
          objc_msgSend(v7, "addInnerRange:", v9, v10);
          [v4 advanceToNextLine];
          if ([v4 atEndOfString]) {
            goto LABEL_14;
          }
        }
        [v4 commitTransaction:1];
      }
LABEL_14:
      [v4 advanceToNextLine];
      unint64_t v11 = [v7 innerRanges];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        uint64_t v13 = [v4 string];
        BOOL v14 = [v7 innerRanges];
        unint64_t v15 = +[MMScanner scannerWithString:v13 lineRanges:v14];

        BOOL v16 = [(MMParser *)self _parseCodeLinesWithScanner:v15];
        [v7 setChildren:v16];
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)_parseCodeBlockWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 skipIndentationUpTo:4] == 4 && (objc_msgSend(v4, "atEndOfLine") & 1) == 0)
  {
    int v5 = objc_opt_new();
    [v5 setType:7];
    uint64_t v7 = [v4 currentRange];
    objc_msgSend(v5, "addInnerRange:", v7, v8);
    [v4 advanceToNextLine];
    if ([v4 atEndOfString]) {
      goto LABEL_16;
    }
    do
    {
      for (uint64_t i = [v4 skipEmptyLines]; i; --i)
        objc_msgSend(v5, "addInnerRange:", objc_msgSend(v4, "location"), 0);
      [v4 beginTransaction];
      if ((unint64_t)[v4 skipIndentationUpTo:4] < 4)
      {
        [v4 commitTransaction:0];
        break;
      }
      [v4 commitTransaction:1];
      uint64_t v10 = [v4 currentRange];
      objc_msgSend(v5, "addInnerRange:", v10, v11);
      [v4 advanceToNextLine];
    }
    while (![v4 atEndOfString]);
LABEL_16:
    while (1)
    {
      BOOL v16 = [v5 innerRanges];
      if (![v16 count]) {
        break;
      }
      uint64_t v12 = [v5 innerRanges];
      uint64_t v13 = [v12 lastObject];
      [v13 rangeValue];
      uint64_t v15 = v14;

      if (v15) {
        goto LABEL_18;
      }
      [v5 removeLastInnerRange];
    }

LABEL_18:
    uint64_t v17 = [v5 innerRanges];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      uint64_t v19 = [v5 innerRanges];
      uint64_t v20 = [v19 lastObject];
      uint64_t v21 = [v20 rangeValue];
      uint64_t v23 = v22;

      [v5 removeLastInnerRange];
      uint64_t v24 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      while (v23)
      {
        v25 = [v4 string];
        uint64_t v26 = [v25 characterAtIndex:v21 - 1 + v23];

        --v23;
        if (([v24 characterIsMember:v26] & 1) == 0)
        {
          uint64_t v27 = v23 + 1;
          goto LABEL_24;
        }
      }
      uint64_t v27 = 0;
LABEL_24:
      objc_msgSend(v5, "addInnerRange:", v21, v27);
    }
    objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    id v28 = [v5 innerRanges];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = [v4 string];
      long long v31 = [v5 innerRanges];
      long long v32 = +[MMScanner scannerWithString:v30 lineRanges:v31];

      long long v33 = [(MMParser *)self _parseCodeLinesWithScanner:v32];
      [v5 setChildren:v33];
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_parseCodeLinesWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"&<>"];
  int v5 = [v15 invertedSet];
  if (([v3 atEndOfString] & 1) == 0)
  {
    do
    {
      uint64_t v6 = [v3 location];
      [v3 skipCharactersFromSet:v5];
      if (v6 != [v3 location])
      {
        uint64_t v7 = objc_opt_new();
        [v7 setType:0];
        objc_msgSend(v7, "setRange:", v6, objc_msgSend(v3, "location") - v6);
        [v4 addObject:v7];
      }
      if (([v3 atEndOfLine] & 1) == 0)
      {
        uint64_t v8 = [v3 string];
        int v9 = objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v3, "location"));

        uint64_t v10 = objc_opt_new();
        [v10 setType:19];
        objc_msgSend(v10, "setRange:", objc_msgSend(v3, "location"), 1);
        if (v9 == 60) {
          uint64_t v11 = @"&lt;";
        }
        else {
          uint64_t v11 = &stru_26F008428;
        }
        if (v9 == 62) {
          uint64_t v11 = @"&gt;";
        }
        if (v9 == 38) {
          uint64_t v12 = @"&amp;";
        }
        else {
          uint64_t v12 = v11;
        }
        [v10 setStringValue:v12];
        [v4 addObject:v10];
        [v3 advance];
      }
      if ([v3 atEndOfLine])
      {
        [v3 advanceToNextLine];
        uint64_t v13 = objc_opt_new();
        [v13 setType:0];
        objc_msgSend(v13, "setRange:", objc_msgSend(v3, "location"), 0);
        [v4 addObject:v13];
      }
    }
    while (![v3 atEndOfString]);
  }

  return v4;
}

- (id)_parseBlockquoteWithScanner:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" "];
  [v4 skipCharactersFromSet:v5 max:3];
  if ([v4 nextCharacter] == 62)
  {
    [v4 advance];
    if ([v4 nextCharacter] == 32) {
      [v4 advance];
    }
    uint64_t v6 = objc_opt_new();
    [v6 setType:3];
    uint64_t v7 = [v4 currentRange];
    objc_msgSend(v6, "addInnerRange:", v7, v8);
    [v4 advanceToNextLine];
    int v9 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    while (([v4 atEndOfString] & 1) == 0)
    {
      [v4 beginTransaction];
      [v4 skipCharactersFromSet:v9];
      if ([v4 atEndOfLine]) {
        goto LABEL_13;
      }
      if ([v4 nextCharacter] == 62)
      {
        [v4 advance];
        [v4 skipCharactersFromSet:v9 max:1];
      }
      else
      {
        [v4 beginTransaction];
        [v4 skipIndentationUpTo:2];
        if ([(MMParser *)self _parseListMarkerWithScanner:v4 listType:0])
        {
LABEL_13:
          [v4 commitTransaction:0];
          break;
        }
        BOOL v10 = [(MMParser *)self _parseListMarkerWithScanner:v4 listType:1];
        [v4 commitTransaction:0];
        if (v10) {
          break;
        }
      }
      uint64_t v11 = [v4 currentRange];
      objc_msgSend(v6, "addInnerRange:", v11, v12);
      [v4 commitTransaction:1];
      [v4 advanceToNextLine];
    }
    objc_msgSend(v6, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    uint64_t v13 = [v6 innerRanges];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [v4 string];
      BOOL v16 = [v6 innerRanges];
      uint64_t v17 = +[MMScanner scannerWithString:v15 lineRanges:v16];

      uint64_t v18 = [(MMParser *)self _parseElementsWithScanner:v17];
      [v6 setChildren:v18];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_parseUnderlinedHeaderWithScanner:(id)a3
{
  id v4 = a3;
  [v4 beginTransaction];
  int v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v4 skipCharactersFromSet:v5];

  if ([v4 atEndOfLine]) {
    goto LABEL_14;
  }
  [v4 advanceToNextLine];
  if ([v4 atEndOfString]) {
    goto LABEL_14;
  }
  int v6 = [v4 nextCharacter];
  if ((v6 & 0xFFFFFFEF) != 0x2D) {
    goto LABEL_14;
  }
  int v7 = v6;
  if ([v4 atEndOfLine]) {
    goto LABEL_9;
  }
  while (v7 == [v4 nextCharacter])
  {
    [v4 advance];
    if ([v4 atEndOfLine]) {
      goto LABEL_9;
    }
  }
  uint64_t v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v4 skipCharactersFromSet:v8];

  if ([v4 atEndOfLine])
  {
LABEL_9:
    [v4 commitTransaction:0];
    int v9 = objc_opt_new();
    [v9 setType:1];
    if (v7 == 61) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [v9 setLevel:v10];
    uint64_t v11 = [v4 currentRange];
    objc_msgSend(v9, "addInnerRange:", v11, v12);
    [v4 advanceToNextLine];
    [v4 advanceToNextLine];
    objc_msgSend(v9, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    uint64_t v13 = [v9 innerRanges];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [v4 string];
      BOOL v16 = [v9 innerRanges];
      uint64_t v17 = +[MMScanner scannerWithString:v15 lineRanges:v16];

      uint64_t v18 = [(MMParser *)self spanParser];
      uint64_t v19 = [v18 parseSpansInBlockElement:v9 withScanner:v17];
      [v9 setChildren:v19];
    }
  }
  else
  {
LABEL_14:
    [v4 commitTransaction:0];
    int v9 = 0;
  }

  return v9;
}

- (id)_parsePrefixHeaderWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 nextCharacter] != 35) {
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  do
  {
    unint64_t v6 = v5 + 1;
    [v4 advance];
    if ([v4 nextCharacter] != 35) {
      break;
    }
  }
  while (v5++ < 5);
  if ([v4 skipWhitespace])
  {
    uint64_t v8 = [v4 currentRange];
    uint64_t v10 = v9;
    uint64_t v11 = v8 - 1;
    while (v10)
    {
      uint64_t v12 = [v4 string];
      int v13 = [v12 characterAtIndex:v11 + v10];

      --v10;
      if (v13 != 35)
      {
        uint64_t v14 = v10 + 1;
        goto LABEL_13;
      }
    }
    uint64_t v14 = 0;
LABEL_13:
    BOOL v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    while (v14)
    {
      uint64_t v17 = [v4 string];
      uint64_t v18 = [v17 characterAtIndex:v11 + v14];

      --v14;
      if (([v16 characterIsMember:v18] & 1) == 0)
      {
        uint64_t v19 = v14 + 1;
        goto LABEL_18;
      }
    }
    uint64_t v19 = 0;
LABEL_18:
    [v4 advanceToNextLine];
    uint64_t v15 = objc_opt_new();
    [v15 setType:1];
    uint64_t v20 = [v4 startLocation];
    uint64_t v21 = [v4 currentRange];
    objc_msgSend(v15, "setRange:", v20, v21 + v22 - objc_msgSend(v4, "startLocation"));
    [v15 setLevel:v6];
    objc_msgSend(v15, "addInnerRange:", v8, v19);
    uint64_t v23 = [v15 innerRanges];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      v25 = [v4 string];
      uint64_t v26 = [v15 innerRanges];
      uint64_t v27 = +[MMScanner scannerWithString:v25 lineRanges:v26];

      id v28 = [(MMParser *)self spanParser];
      uint64_t v29 = [v28 parseSpansInBlockElement:v15 withScanner:v27];
      [v15 setChildren:v29];
    }
  }
  else
  {
LABEL_11:
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_parseHTMLWithScanner:(id)a3
{
  id v4 = a3;
  if ([v4 atBeginningOfLine])
  {
    unint64_t v5 = [(MMParser *)self htmlParser];
    unint64_t v6 = [v5 parseBlockTagWithScanner:v4];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_parseBlockElementWithScanner:(id)a3
{
  id v4 = a3;
  [v4 beginTransaction];
  unint64_t v5 = [(MMParser *)self htmlParser];
  unint64_t v6 = [v5 parseCommentWithScanner:v4];

  [v4 commitTransaction:v6 != 0];
  if (!v6)
  {
    [v4 beginTransaction];
    unint64_t v6 = [(MMParser *)self _parseHTMLWithScanner:v4];
    [v4 commitTransaction:v6 != 0];
    if (!v6)
    {
      [v4 beginTransaction];
      unint64_t v6 = [(MMParser *)self _parsePrefixHeaderWithScanner:v4];
      [v4 commitTransaction:v6 != 0];
      if (!v6)
      {
        [v4 beginTransaction];
        unint64_t v6 = [(MMParser *)self _parseUnderlinedHeaderWithScanner:v4];
        [v4 commitTransaction:v6 != 0];
        if (!v6)
        {
          [v4 beginTransaction];
          unint64_t v6 = [(MMParser *)self _parseBlockquoteWithScanner:v4];
          [v4 commitTransaction:v6 != 0];
          if (!v6)
          {
            [v4 beginTransaction];
            unint64_t v6 = [(MMParser *)self _parseCodeBlockWithScanner:v4];
            [v4 commitTransaction:v6 != 0];
            if (!v6)
            {
              if (([(MMParser *)self extensions] & 8) == 0
                || ([v4 beginTransaction],
                    [(MMParser *)self _parseFencedCodeBlockWithScanner:v4],
                    unint64_t v6 = objc_claimAutoreleasedReturnValue(),
                    [v4 commitTransaction:v6 != 0],
                    !v6))
              {
                if (([(MMParser *)self extensions] & 0x100) == 0
                  || ([v4 beginTransaction],
                      [(MMParser *)self _parseTableWithScanner:v4],
                      unint64_t v6 = objc_claimAutoreleasedReturnValue(),
                      [v4 commitTransaction:v6 != 0],
                      !v6))
                {
                  [v4 beginTransaction];
                  unint64_t v6 = [(MMParser *)self _parseHorizontalRuleWithScanner:v4];
                  [v4 commitTransaction:v6 != 0];
                  if (!v6)
                  {
                    [v4 beginTransaction];
                    unint64_t v6 = [(MMParser *)self _parseListWithScanner:v4];
                    [v4 commitTransaction:v6 != 0];
                    if (!v6)
                    {
                      [v4 beginTransaction];
                      unint64_t v6 = [(MMParser *)self _parseLinkDefinitionWithScanner:v4];
                      [v4 commitTransaction:v6 != 0];
                      if (!v6)
                      {
                        [v4 beginTransaction];
                        unint64_t v6 = [(MMParser *)self _parseParagraphWithScanner:v4];
                        [v4 commitTransaction:v6 != 0];
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

  return v6;
}

- (id)_parseElementsWithScanner:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  if (([v4 atEndOfString] & 1) == 0)
  {
    do
    {
      unint64_t v6 = [(MMParser *)self _parseBlockElementWithScanner:v4];
      if (v6)
      {
        [v5 addObject:v6];
      }
      else
      {
        int v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        [v4 skipCharactersFromSet:v7];

        if ([v4 atEndOfLine]) {
          [v4 advanceToNextLine];
        }
      }
    }
    while (![v4 atEndOfString]);
  }

  return v5;
}

- (id)_removeTabsFromString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  unint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\t\n"];
  uint64_t v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, objc_msgSend(v3, "length"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    char v10 = 0;
    do
    {
      if ([v4 characterAtIndex:v8] == 10)
      {
        char v10 = v8 + 1;
        uint64_t v11 = [v4 length] - ++v8;
      }
      else
      {
        uint64_t v12 = [&unk_26F0765C0 objectAtIndex:4 - (((_BYTE)v8 - v10) & 3)];
        objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, v9, v12);

        uint64_t v11 = [v4 length] - v8;
      }
      uint64_t v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v5, 0, v8, v11);
      uint64_t v9 = v13;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v4;
}

- (void)_addTextLineToElement:(id)a3 withScanner:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"<"];
  uint64_t v8 = [v7 invertedSet];

  uint64_t v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
  char v10 = [v9 invertedSet];

  uint64_t v11 = [v6 currentRange];
  uint64_t v13 = v12;
  [v6 beginTransaction];
  uint64_t v14 = objc_opt_new();
  if (([v6 atEndOfLine] & 1) == 0)
  {
    do
    {
      [v6 skipCharactersFromSet:v8];
      if ([v6 matchString:@"<!--"])
      {
        while (([v6 atEndOfString] & 1) == 0)
        {
          [v6 skipCharactersFromSet:v10];
          if ([v6 atEndOfLine])
          {
            uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v11, v13);
            [v14 addObject:v15];

            [v6 advanceToNextLine];
            uint64_t v11 = [v6 currentRange];
            uint64_t v13 = v16;
          }
          else
          {
            if ([v6 matchString:@"-->"]) {
              break;
            }
            [v6 advance];
          }
        }
      }
      else
      {
        [v6 advance];
      }
    }
    while (![v6 atEndOfLine]);
  }
  objc_msgSend(v6, "commitTransaction:", objc_msgSend(v14, "count") != 0);
  if ([v14 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v24 = v14;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v25 + 1) + 8 * v21) rangeValue];
          objc_msgSend(v5, "addInnerRange:", v22, v23);
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    uint64_t v14 = v24;
  }
  objc_msgSend(v5, "addInnerRange:", v11, v13);
  [v6 advanceToNextLine];
}

- (id)parseMarkdown:(id)a3 error:(id *)a4
{
  id v5 = -[MMParser _removeTabsFromString:](self, "_removeTabsFromString:", a3, a4);
  id v6 = +[MMScanner scannerWithString:v5];
  uint64_t v7 = +[MMDocument documentWithMarkdown:v5];
  uint64_t v8 = [(MMParser *)self _parseElementsWithScanner:v6];
  [v7 setElements:v8];

  [(MMParser *)self _updateLinksFromDefinitionsInDocument:v7];
  return v7;
}

- (MMParser)initWithExtensions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MMParser;
  id v4 = [(MMParser *)&v11 init];
  id v5 = v4;
  if (v4)
  {
    v4->_extensions = a3;
    uint64_t v6 = objc_opt_new();
    htmlParser = v5->_htmlParser;
    v5->_htmlParser = (MMHTMLParser *)v6;

    uint64_t v8 = [[MMSpanParser alloc] initWithExtensions:a3];
    spanParser = v5->_spanParser;
    v5->_spanParser = v8;
  }
  return v5;
}

@end
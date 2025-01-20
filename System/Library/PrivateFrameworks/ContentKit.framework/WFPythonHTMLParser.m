@interface WFPythonHTMLParser
- (NSRegularExpression)attributeFindExpression;
- (NSRegularExpression)charrefExpression;
- (NSRegularExpression)commentCloseExpression;
- (NSRegularExpression)endEndTagExpression;
- (NSRegularExpression)endTagFindExpression;
- (NSRegularExpression)entityrefExpression;
- (NSRegularExpression)incompleteExpression;
- (NSRegularExpression)interestingExpression;
- (NSRegularExpression)locateStartTagEndExpression;
- (NSRegularExpression)startTagOpenExpression;
- (NSRegularExpression)tagFindExpression;
- (NSString)cdataElement;
- (NSString)rawData;
- (WFPythonHTMLParser)init;
- (WFPythonHTMLParserDelegate)delegate;
- (id)scanName:(int64_t)a3 declarationStartPosition:(int64_t)a4 location:(int64_t *)a5;
- (int64_t)checkForWholeStartTag:(int64_t)a3;
- (int64_t)currentLineNumber;
- (int64_t)currentOffset;
- (int64_t)parseBogusComment:(int64_t)a3;
- (int64_t)parseComment:(int64_t)a3;
- (int64_t)parseEndTag:(int64_t)a3;
- (int64_t)parseHTMLDeclaration:(int64_t)a3;
- (int64_t)parseMarkedSection:(int64_t)a3;
- (int64_t)parseProcessingInstruction:(int64_t)a3;
- (int64_t)parseStartTag:(int64_t)a3;
- (int64_t)updatePosition:(int64_t)a3 j:(int64_t)a4;
- (void)close;
- (void)feed:(id)a3;
- (void)handleCharacterRef:(id)a3;
- (void)handleComment:(id)a3;
- (void)handleData:(id)a3;
- (void)handleDoctypeDeclaration:(id)a3;
- (void)handleEndTag:(id)a3;
- (void)handleEntityRef:(id)a3;
- (void)handleProcessingInstruction:(id)a3;
- (void)handleStartEndTag:(id)a3 attributes:(id)a4;
- (void)handleStartTag:(id)a3 attributes:(id)a4;
- (void)handleUnknownDeclaration:(id)a3;
- (void)parseDataAndEnd:(BOOL)a3;
- (void)reset;
- (void)setCdataElement:(id)a3;
- (void)setCurrentLineNumber:(int64_t)a3;
- (void)setCurrentOffset:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterestingExpression:(id)a3;
- (void)setRawData:(id)a3;
@end

@implementation WFPythonHTMLParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdataElement, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_endTagFindExpression, 0);
  objc_storeStrong((id *)&self->_endEndTagExpression, 0);
  objc_storeStrong((id *)&self->_locateStartTagEndExpression, 0);
  objc_storeStrong((id *)&self->_attributeFindExpression, 0);
  objc_storeStrong((id *)&self->_tagFindExpression, 0);
  objc_storeStrong((id *)&self->_commentCloseExpression, 0);
  objc_storeStrong((id *)&self->_startTagOpenExpression, 0);
  objc_storeStrong((id *)&self->_charrefExpression, 0);
  objc_storeStrong((id *)&self->_entityrefExpression, 0);
  objc_storeStrong((id *)&self->_incompleteExpression, 0);
  objc_storeStrong((id *)&self->_interestingExpression, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)cdataElement
{
  return self->_cdataElement;
}

- (void)setRawData:(id)a3
{
}

- (NSString)rawData
{
  return self->_rawData;
}

- (NSRegularExpression)endTagFindExpression
{
  return self->_endTagFindExpression;
}

- (NSRegularExpression)endEndTagExpression
{
  return self->_endEndTagExpression;
}

- (NSRegularExpression)locateStartTagEndExpression
{
  return self->_locateStartTagEndExpression;
}

- (NSRegularExpression)attributeFindExpression
{
  return self->_attributeFindExpression;
}

- (NSRegularExpression)tagFindExpression
{
  return self->_tagFindExpression;
}

- (NSRegularExpression)commentCloseExpression
{
  return self->_commentCloseExpression;
}

- (NSRegularExpression)startTagOpenExpression
{
  return self->_startTagOpenExpression;
}

- (NSRegularExpression)charrefExpression
{
  return self->_charrefExpression;
}

- (NSRegularExpression)entityrefExpression
{
  return self->_entityrefExpression;
}

- (NSRegularExpression)incompleteExpression
{
  return self->_incompleteExpression;
}

- (void)setInterestingExpression:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (WFPythonHTMLParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFPythonHTMLParserDelegate *)WeakRetained;
}

- (void)setCurrentOffset:(int64_t)a3
{
  self->_currentOffset = a3;
}

- (int64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentLineNumber:(int64_t)a3
{
  self->_currentLineNumber = a3;
}

- (int64_t)currentLineNumber
{
  return self->_currentLineNumber;
}

- (void)handleUnknownDeclaration:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundUnknownDeclaration:v7];
  }
}

- (void)handleProcessingInstruction:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundProcessingInstruction:v7];
  }
}

- (void)handleDoctypeDeclaration:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundDoctypeDeclaration:v7];
  }
}

- (void)handleComment:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundComment:v7];
  }
}

- (void)handleCharacterRef:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundCharacterRef:v7];
  }
}

- (void)handleEntityRef:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundEntityRef:v7];
  }
}

- (void)handleEndTag:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundEndTag:v7];
  }
}

- (void)handleData:(id)a3
{
  id v7 = a3;
  v4 = [(WFPythonHTMLParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFPythonHTMLParser *)self delegate];
    [v6 parser:self foundData:v7];
  }
}

- (void)handleStartTag:(id)a3 attributes:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(WFPythonHTMLParser *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(WFPythonHTMLParser *)self delegate];
    [v9 parser:self foundStartTag:v10 attributes:v6];
  }
}

- (void)handleStartEndTag:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  [(WFPythonHTMLParser *)self handleStartTag:v6 attributes:a4];
  [(WFPythonHTMLParser *)self handleEndTag:v6];
}

- (int64_t)updatePosition:(int64_t)a3 j:(int64_t)a4
{
  int64_t v5 = a4 - a3;
  if (a4 > a3)
  {
    char v8 = [(WFPythonHTMLParser *)self rawData];
    v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\n" options:0 error:0];
    uint64_t v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, a3, v5);
    if (v10)
    {
      [(WFPythonHTMLParser *)self setCurrentLineNumber:[(WFPythonHTMLParser *)self currentLineNumber] + v10];
      uint64_t v11 = ~objc_msgSend(v8, "rangeOfString:options:range:", @"\n", 4, a3, v5) + a4;
    }
    else
    {
      uint64_t v11 = [(WFPythonHTMLParser *)self currentOffset] + v5;
    }
    [(WFPythonHTMLParser *)self setCurrentOffset:v11];
  }
  return a4;
}

- (int64_t)parseEndTag:(int64_t)a3
{
  id v6 = [(WFPythonHTMLParser *)self rawData];
  id v7 = [v6 substringFromIndex:a3];
  char v8 = [v7 hasPrefix:@"</"];

  if ((v8 & 1) == 0)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:429 description:@"Unexpected call to -parseEndTag:"];
  }
  v9 = [(WFPythonHTMLParser *)self endEndTagExpression];
  uint64_t v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, a3 + 1, objc_msgSend(v6, "length") - (a3 + 1));

  if (v10)
  {
    uint64_t v11 = [v10 range];
    [v10 range];
    int64_t v13 = v12 + v11;
    v14 = [(WFPythonHTMLParser *)self endTagFindExpression];
    v15 = objc_msgSend(v14, "firstMatchInString:options:range:", v6, 4, a3, objc_msgSend(v6, "length") - a3);

    if (v15)
    {
      uint64_t v16 = [v15 rangeAtIndex:1];
      v18 = objc_msgSend(v6, "substringWithRange:", v16, v17);
      v19 = [v18 lowercaseString];

      v20 = [(WFPythonHTMLParser *)self cdataElement];

      if (v20
        && ([(WFPythonHTMLParser *)self cdataElement],
            v21 = objc_claimAutoreleasedReturnValue(),
            char v22 = [v19 isEqualToString:v21],
            v21,
            (v22 & 1) == 0))
      {
        v24 = objc_msgSend(v6, "substringWithRange:", a3, v13 - a3);
        [(WFPythonHTMLParser *)self handleData:v24];
      }
      else
      {
        [(WFPythonHTMLParser *)self handleEndTag:v19];
        [(WFPythonHTMLParser *)self setCdataElement:0];
      }
    }
    else
    {
      v23 = [(WFPythonHTMLParser *)self cdataElement];

      if (v23)
      {
        v19 = objc_msgSend(v6, "substringWithRange:", a3, v13 - a3);
        [(WFPythonHTMLParser *)self handleData:v19];
      }
      else
      {
        v25 = [(WFPythonHTMLParser *)self tagFindExpression];
        v19 = objc_msgSend(v25, "firstMatchInString:options:range:", v6, 4, a3 + 2, objc_msgSend(v6, "length") - (a3 + 2));

        if (v19)
        {
          uint64_t v26 = [v19 rangeAtIndex:1];
          v28 = objc_msgSend(v6, "substringWithRange:", v26, v27);
          v29 = [v28 lowercaseString];

          uint64_t v30 = [v19 range];
          [v19 range];
          uint64_t v32 = objc_msgSend(v6, "rangeOfString:options:range:", @">", 0, v31 + v30, objc_msgSend(v6, "length") - (v31 + v30));
          [(WFPythonHTMLParser *)self handleEndTag:v29];
          int64_t v13 = v32 + 1;
        }
        else
        {
          v33 = objc_msgSend(v6, "substringWithRange:", a3, 3);
          int v34 = [v33 isEqualToString:@"</>"];

          if (v34)
          {
            v19 = 0;
            int64_t v13 = a3 + 3;
          }
          else
          {
            int64_t v13 = [(WFPythonHTMLParser *)self parseBogusComment:a3];
            v19 = 0;
          }
        }
      }
    }
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (int64_t)checkForWholeStartTag:(int64_t)a3
{
  id v6 = [(WFPythonHTMLParser *)self rawData];
  id v7 = [(WFPythonHTMLParser *)self locateStartTagEndExpression];
  char v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, a3, objc_msgSend(v6, "length") - a3);

  if (v8)
  {
    uint64_t v9 = [v8 range];
    [v8 range];
    int64_t v11 = v10 + v9;
    uint64_t v12 = objc_msgSend(v6, "substringWithRange:", v10 + v9, 1);
    if ([v12 isEqualToString:@">"])
    {
      int64_t v13 = v11 + 1;
    }
    else
    {
      if ([v12 isEqualToString:@"/"])
      {
        v14 = [v6 substringFromIndex:v11];
        int v15 = [v14 hasPrefix:@"/>"];

        if (v15)
        {
          int64_t v13 = v11 + 2;
          goto LABEL_18;
        }
        uint64_t v16 = [v6 substringFromIndex:v11];
        char v17 = [v16 hasPrefix:@"/"];
      }
      else
      {
        if ([v12 isEqualToString:&stru_26C71CE08])
        {
          int64_t v13 = -1;
          goto LABEL_18;
        }
        uint64_t v16 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz=/ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
        char v17 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0));
      }
      char v18 = v17;

      if (v11 <= a3) {
        int64_t v19 = a3 + 1;
      }
      else {
        int64_t v19 = v11;
      }
      if (v18) {
        int64_t v13 = -1;
      }
      else {
        int64_t v13 = v19;
      }
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:422 description:@"Apparently this isn't supposed to happen"];
    int64_t v13 = 700;
  }
LABEL_18:

  return v13;
}

- (int64_t)parseStartTag:(int64_t)a3
{
  int64_t v46 = -[WFPythonHTMLParser checkForWholeStartTag:](self, "checkForWholeStartTag:");
  if ((v46 & 0x8000000000000000) == 0)
  {
    id v6 = [(WFPythonHTMLParser *)self rawData];
    v45 = objc_opt_new();
    id v7 = [(WFPythonHTMLParser *)self tagFindExpression];
    int64_t v43 = a3;
    char v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, a3 + 1, objc_msgSend(v6, "length") - (a3 + 1));

    if ((unint64_t)[v8 numberOfRanges] <= 1)
    {
      v42 = [MEMORY[0x263F08690] currentHandler];
      [v42 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:349 description:@"Uh ohhhh"];
    }
    uint64_t v9 = [v8 range];
    [v8 range];
    int64_t v11 = v10 + v9;
    uint64_t v12 = [v8 rangeAtIndex:1];
    v14 = objc_msgSend(v6, "substringWithRange:", v12, v13);
    v44 = [v14 lowercaseString];

    while (v11 < v46)
    {
      int v15 = [(WFPythonHTMLParser *)self attributeFindExpression];
      uint64_t v16 = objc_msgSend(v15, "firstMatchInString:options:range:", v6, 4, v11, objc_msgSend(v6, "length") - v11);

      if (!v16) {
        break;
      }
      uint64_t v17 = [v16 rangeAtIndex:1];
      uint64_t v19 = v18;
      uint64_t v20 = [v16 rangeAtIndex:2];
      uint64_t v22 = v21;
      uint64_t v23 = [v16 rangeAtIndex:3];
      uint64_t v25 = v24;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = 0;
      }
      else
      {
        uint64_t v26 = objc_msgSend(v6, "substringWithRange:", v17, v19);
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = 0;
      }
      else
      {
        uint64_t v27 = objc_msgSend(v6, "substringWithRange:", v20, v22);
      }
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = 0;
        if (!v27) {
          goto LABEL_22;
        }
      }
      else
      {
        v28 = objc_msgSend(v6, "substringWithRange:", v23, v25);
        if (!v27)
        {
LABEL_22:
          uint64_t v30 = 0;
          goto LABEL_23;
        }
      }
      if ([v28 hasPrefix:@"'"]
        && ([v28 hasSuffix:@"'"] & 1) != 0
        || [v28 hasPrefix:@"\""]
        && [v28 hasSuffix:@"\""])
      {
        uint64_t v29 = objc_msgSend(v28, "substringWithRange:", 1, objc_msgSend(v28, "length") - 2);

        v28 = (void *)v29;
      }
      if (!v28)
      {
        uint64_t v30 = 0;
        goto LABEL_25;
      }
      uint64_t v30 = objc_msgSend(v28, "gtm_stringByUnescapingFromHTML");
LABEL_23:

LABEL_25:
      uint64_t v31 = [WFPythonHTMLAttribute alloc];
      uint64_t v32 = [v26 lowercaseString];
      v33 = [(WFPythonHTMLAttribute *)v31 initWithName:v32 value:v30];

      [v45 addObject:v33];
      uint64_t v34 = [v16 range];
      [v16 range];
      int64_t v11 = v35 + v34;
    }
    v36 = objc_msgSend(v6, "substringWithRange:", v11, v46 - v11);
    v37 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v38 = [v36 stringByTrimmingCharactersInSet:v37];

    if (([v38 isEqualToString:@">"] & 1) != 0
      || ([v38 isEqualToString:@"/>"] & 1) != 0)
    {
      if ([v38 hasSuffix:@"/>"])
      {
        v39 = v44;
        [(WFPythonHTMLParser *)self handleStartEndTag:v44 attributes:v45];
      }
      else
      {
        v39 = v44;
        [(WFPythonHTMLParser *)self handleStartTag:v44 attributes:v45];
        if (([v44 isEqualToString:@"script"] & 1) != 0
          || [v44 isEqualToString:@"style"])
        {
          [(WFPythonHTMLParser *)self setCdataElement:v44];
        }
      }
    }
    else
    {
      v40 = objc_msgSend(v6, "substringWithRange:", v43, v46 - v43);
      [(WFPythonHTMLParser *)self handleData:v40];

      v39 = v44;
    }
  }
  return v46;
}

- (int64_t)parseProcessingInstruction:(int64_t)a3
{
  id v6 = [(WFPythonHTMLParser *)self rawData];
  id v7 = [v6 substringFromIndex:a3];

  if (([v7 hasPrefix:@"<?"] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:329 description:@"Unexpected call to -parseProcessingInstruction"];
  }
  uint64_t v8 = objc_msgSend(v7, "rangeOfString:options:range:", @">", 0, 2, objc_msgSend(v7, "length") - 2);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = -1;
  }
  else
  {
    uint64_t v10 = v8;
    int64_t v11 = objc_msgSend(v7, "substringWithRange:", 2, v8 - 2);
    [(WFPythonHTMLParser *)self handleProcessingInstruction:v11];

    int64_t v9 = a3 + v10 + 1;
  }

  return v9;
}

- (int64_t)parseBogusComment:(int64_t)a3
{
  id v6 = [(WFPythonHTMLParser *)self rawData];
  id v7 = [v6 substringFromIndex:a3];

  if (([v7 hasPrefix:@"<!"] & 1) == 0 && (objc_msgSend(v7, "hasPrefix:", @"</") & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:316 description:@"Unexpected call to -parseBogusComment"];
  }
  uint64_t v8 = objc_msgSend(v7, "rangeOfString:options:range:", @">", 0, 2, objc_msgSend(v7, "length") - 2);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = -1;
  }
  else
  {
    uint64_t v10 = v8;
    int64_t v11 = objc_msgSend(v7, "substringWithRange:", 2, v8 - 2);
    [(WFPythonHTMLParser *)self handleComment:v11];

    int64_t v9 = a3 + v10 + 1;
  }

  return v9;
}

- (int64_t)parseHTMLDeclaration:(int64_t)a3
{
  int64_t v5 = [(WFPythonHTMLParser *)self rawData];
  id v6 = [v5 substringFromIndex:a3];

  if ([v6 hasPrefix:@"<!--"])
  {
    int64_t v7 = [(WFPythonHTMLParser *)self parseComment:a3];
LABEL_7:
    int64_t v8 = v7;
    goto LABEL_8;
  }
  if ([v6 hasPrefix:@"<!["])
  {
    int64_t v7 = [(WFPythonHTMLParser *)self parseMarkedSection:a3];
    goto LABEL_7;
  }
  if ([v6 rangeOfString:@"<!doctype" options:9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = [(WFPythonHTMLParser *)self parseBogusComment:a3];
    goto LABEL_7;
  }
  uint64_t v10 = objc_msgSend(v6, "rangeOfString:options:range:", @">", 0, 9, objc_msgSend(v6, "length") - 9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = -1;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = objc_msgSend(v6, "substringWithRange:", 2, v10 - 2);
    [(WFPythonHTMLParser *)self handleDoctypeDeclaration:v12];

    int64_t v8 = a3 + v11 + 1;
  }
LABEL_8:

  return v8;
}

- (int64_t)parseComment:(int64_t)a3
{
  id v6 = [(WFPythonHTMLParser *)self rawData];
  int64_t v7 = [v6 substringFromIndex:a3];

  if (([v7 hasPrefix:@"<!--"] & 1) == 0)
  {
    int v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:284 description:@"Unexpected call to -parseComment:"];
  }
  int64_t v8 = [(WFPythonHTMLParser *)self commentCloseExpression];
  int64_t v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v7, 0, 4, objc_msgSend(v7, "length") - 4);

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v7, "substringWithRange:", 4, objc_msgSend(v9, "range") - 4);
    [(WFPythonHTMLParser *)self handleComment:v10];

    uint64_t v11 = [v9 range] + a3;
    [v9 range];
    int64_t v13 = v11 + v12;
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (int64_t)parseMarkedSection:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = [(WFPythonHTMLParser *)self rawData];
  int64_t v7 = [v6 substringFromIndex:a3];

  if (([v7 hasPrefix:@"<!["] & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"WFPythonHTMLParser.m" lineNumber:253 description:@"Unexpected call to -parseMarkedSection:"];
  }
  uint64_t v19 = 0;
  int64_t v8 = [(WFPythonHTMLParser *)self scanName:a3 + 3 declarationStartPosition:a3 location:&v19];
  int64_t v9 = v19;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if ([&unk_26C743B70 containsObject:v8])
    {
      uint64_t v10 = @"]\\s*]\\s*>";
    }
    else
    {
      if (([&unk_26C743B88 containsObject:v8] & 1) == 0)
      {
        uint64_t v12 = getWFGeneralLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = objc_msgSend(v7, "substringWithRange:", 3, v19);
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = "-[WFPythonHTMLParser parseMarkedSection:]";
          __int16 v22 = 2112;
          uint64_t v23 = v16;
          _os_log_impl(&dword_216505000, v12, OS_LOG_TYPE_ERROR, "%s Unknown status keyword %@ in marked section", buf, 0x16u);
        }
        int64_t v9 = -1;
        goto LABEL_14;
      }
      uint64_t v10 = @"]\\s*>";
    }
    uint64_t v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v10 options:0 error:0];
    uint64_t v12 = objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 3, objc_msgSend(v7, "length") - 3);

    if (v12)
    {
      uint64_t v19 = [v12 range];
      int64_t v13 = objc_msgSend(v7, "substringWithRange:", 3, v19);
      [(WFPythonHTMLParser *)self handleUnknownDeclaration:v13];

      uint64_t v14 = [v12 range] + a3;
      [v12 range];
      int64_t v9 = v14 + v15;
LABEL_14:

      goto LABEL_15;
    }
    int64_t v9 = -1;
  }
LABEL_15:

  return v9;
}

- (id)scanName:(int64_t)a3 declarationStartPosition:(int64_t)a4 location:(int64_t *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int64_t v9 = [(WFPythonHTMLParser *)self rawData];
  uint64_t v10 = [v9 substringFromIndex:a3];

  uint64_t v11 = [v10 length];
  if (v11 == a3)
  {
    uint64_t v12 = 0;
    *a5 = -1;
  }
  else
  {
    uint64_t v13 = v11;
    uint64_t v14 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[a-zA-Z][-_.a-zA-Z0-9]*\\s*" options:0 error:0];
    uint64_t v15 = objc_msgSend(v14, "firstMatchInString:options:range:", v10, 4, 0, objc_msgSend(v10, "length"));
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 range];
      uint64_t v19 = objc_msgSend(v10, "substringWithRange:", v17, v18);
      uint64_t v20 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      uint64_t v21 = [v19 stringByTrimmingCharactersInSet:v20];

      if ([v19 length] + a3 == v13)
      {
        uint64_t v12 = 0;
        *a5 = -1;
      }
      else
      {
        uint64_t v23 = [v16 range] + a3;
        [v16 range];
        *a5 = v23 + v24;
        uint64_t v12 = [v21 lowercaseString];
      }
    }
    else
    {
      [(WFPythonHTMLParser *)self updatePosition:a4 j:a3];
      __int16 v22 = getWFGeneralLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315138;
        uint64_t v27 = "-[WFPythonHTMLParser scanName:declarationStartPosition:location:]";
        _os_log_impl(&dword_216505000, v22, OS_LOG_TYPE_ERROR, "%s Python HTML parser expected name token", (uint8_t *)&v26, 0xCu);
      }

      uint64_t v12 = 0;
    }
  }
  return v12;
}

- (void)parseDataAndEnd:(BOOL)a3
{
  BOOL v60 = a3;
  v3 = self;
  id v62 = [(WFPythonHTMLParser *)self rawData];
  uint64_t v4 = [v62 length];
  uint64_t v5 = 0;
  while (v4 > v5)
  {
    id v6 = [(WFPythonHTMLParser *)v3 interestingExpression];
    int64_t v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v62, 0, v5, v4 - v5);

    if (v7)
    {
      uint64_t v8 = [v7 range];
    }
    else
    {
      int64_t v9 = [(WFPythonHTMLParser *)v3 cdataElement];

      uint64_t v8 = v4;
      if (v9)
      {
        int64_t v7 = 0;
        goto LABEL_64;
      }
    }
    if (v8 > v5)
    {
      uint64_t v10 = objc_msgSend(v62, "substringWithRange:", v5, v8 - v5);
      [(WFPythonHTMLParser *)v3 handleData:v10];
    }
    uint64_t v11 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v8];
    if (v11 == v4)
    {
      uint64_t v5 = v4;
LABEL_64:

      break;
    }
    uint64_t v5 = v11;
    uint64_t v12 = [v62 substringFromIndex:v11];
    v61 = v7;
    if ([v12 hasPrefix:@"<"])
    {
      uint64_t v13 = [(WFPythonHTMLParser *)v3 startTagOpenExpression];
      uint64_t v14 = objc_msgSend(v13, "numberOfMatchesInString:options:range:", v12, 4, 0, objc_msgSend(v12, "length"));

      if (v14)
      {
        uint64_t v15 = [(WFPythonHTMLParser *)v3 parseStartTag:v5];
        goto LABEL_41;
      }
      if ([v12 hasPrefix:@"</"])
      {
        uint64_t v15 = [(WFPythonHTMLParser *)v3 parseEndTag:v5];
        goto LABEL_41;
      }
      if ([v12 hasPrefix:@"<!--"])
      {
        uint64_t v15 = [(WFPythonHTMLParser *)v3 parseComment:v5];
        goto LABEL_41;
      }
      if ([v12 hasPrefix:@"<?"])
      {
        uint64_t v15 = [(WFPythonHTMLParser *)v3 parseProcessingInstruction:v5];
        goto LABEL_41;
      }
      if ([v12 hasPrefix:@"<!"])
      {
        uint64_t v15 = [(WFPythonHTMLParser *)v3 parseHTMLDeclaration:v5];
LABEL_41:
        uint64_t v51 = v15;
        if (v15 < 0)
        {
LABEL_42:
          if (!v60) {
            goto LABEL_63;
          }
          if (objc_msgSend(v62, "rangeOfString:options:range:", @">", 0, 1, objc_msgSend(v62, "length") - 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v52 = objc_msgSend(v62, "rangeOfString:options:range:", @"<", 0, 1, objc_msgSend(v62, "length") - 1);
            if (v52 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v51 = v5 + 1;
            }
            else {
              uint64_t v51 = v52;
            }
          }
          else
          {
            uint64_t v51 = v5 + 1;
          }
          v53 = objc_msgSend(v62, "substringWithRange:", v5, v51 - v5);
          [(WFPythonHTMLParser *)v3 handleData:v53];
        }
      }
      else
      {
        uint64_t v51 = v5 + 1;
        if (v5 + 1 >= v4)
        {
LABEL_63:

          goto LABEL_64;
        }
        [(WFPythonHTMLParser *)v3 handleData:@"<"];
        if (v51 < 0) {
          goto LABEL_42;
        }
      }
      uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v51];
      goto LABEL_50;
    }
    if ([v12 hasPrefix:@"&#"])
    {
      uint64_t v16 = [(WFPythonHTMLParser *)v3 charrefExpression];
      uint64_t v17 = objc_msgSend(v16, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);

      if (v17)
      {
        uint64_t v18 = [v17 range];
        uint64_t v20 = objc_msgSend(v62, "substringWithRange:", v18, v19);
        int v21 = 2;
        v58 = objc_msgSend(v20, "substringWithRange:", 2, objc_msgSend(v20, "length") - 3);
        [(WFPythonHTMLParser *)v3 handleCharacterRef:v58];
        uint64_t v22 = [v17 range];
        [v17 range];
        v59 = v17;
        uint64_t v23 = v4;
        uint64_t v24 = v3;
        uint64_t v26 = v25 + v22;
        uint64_t v27 = v25 + v22 - 1;
        uint64_t v28 = [v62 substringFromIndex:v27];
        int v29 = [v28 hasPrefix:@";"];

        if (v29) {
          uint64_t v30 = v26;
        }
        else {
          uint64_t v30 = v27;
        }
        v3 = v24;
        uint64_t v4 = v23;
        uint64_t v17 = v59;
        uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v30];
      }
      else
      {
        if (objc_msgSend(v62, "rangeOfString:options:range:", @";", 0, v5, objc_msgSend(v62, "length") - v5) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v44 = objc_msgSend(v62, "substringWithRange:", v5, 2);
          [(WFPythonHTMLParser *)v3 handleData:v44];

          uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v5 + 2];
        }
        int v21 = 3;
      }
      goto LABEL_58;
    }
    if (![v12 hasPrefix:@"&"])
    {
      int64_t v43 = [MEMORY[0x263F08690] currentHandler];
      [v43 handleFailureInMethod:a2 object:v3 file:@"WFPythonHTMLParser.m" lineNumber:211 description:@"There is nothing interesting to consume!"];

LABEL_50:
      int v21 = 0;
      goto LABEL_59;
    }
    uint64_t v31 = [(WFPythonHTMLParser *)v3 entityrefExpression];
    uint64_t v17 = objc_msgSend(v31, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);

    if (v17)
    {
      uint64_t v32 = [v17 rangeAtIndex:1];
      uint64_t v34 = objc_msgSend(v62, "substringWithRange:", v32, v33);
      [(WFPythonHTMLParser *)v3 handleEntityRef:v34];
      uint64_t v35 = [v17 range];
      [v17 range];
      v36 = v3;
      uint64_t v38 = v37 + v35;
      uint64_t v39 = v37 + v35 - 1;
      v40 = [v62 substringFromIndex:v39];
      int v41 = [v40 hasPrefix:@";"];

      if (v41) {
        uint64_t v42 = v38;
      }
      else {
        uint64_t v42 = v39;
      }
      v3 = v36;
      uint64_t v5 = [(WFPythonHTMLParser *)v36 updatePosition:v5 j:v42];

      int v21 = 2;
      goto LABEL_58;
    }
    v45 = [(WFPythonHTMLParser *)v3 incompleteExpression];
    uint64_t v17 = objc_msgSend(v45, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);

    if (v17)
    {
      if (!v60) {
        goto LABEL_57;
      }
      uint64_t v46 = [v17 range];
      v48 = objc_msgSend(v62, "substringWithRange:", v46, v47);
      v49 = [v62 substringFromIndex:v5];
      int v50 = [v48 isEqualToString:v49];

      if (v50)
      {
        [v17 range];
        [v17 range];
        uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v5 + 1];
      }
      int v21 = 3;
      goto LABEL_58;
    }
    if (v5 + 1 >= v4)
    {
      uint64_t v17 = 0;
LABEL_57:
      int v21 = 3;
LABEL_58:

      goto LABEL_59;
    }
    [(WFPythonHTMLParser *)v3 handleData:@"&"];
    uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v5 + 1];
    int v21 = 0;
LABEL_59:

    if (v21 == 3) {
      break;
    }
  }
  if (v60 && v4 > v5)
  {
    v54 = [(WFPythonHTMLParser *)v3 cdataElement];

    if (!v54)
    {
      v55 = objc_msgSend(v62, "substringWithRange:", v5, v4 - v5);
      [(WFPythonHTMLParser *)v3 handleData:v55];

      uint64_t v5 = [(WFPythonHTMLParser *)v3 updatePosition:v5 j:v4];
    }
  }
  v56 = [v62 substringFromIndex:v5];
  [(WFPythonHTMLParser *)v3 setRawData:v56];
}

- (void)setCdataElement:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (NSString *)[v9 copy];
  cdataElement = self->_cdataElement;
  self->_cdataElement = v4;

  if (v9)
  {
    id v6 = (void *)MEMORY[0x263F08AE8];
    int64_t v7 = [NSString stringWithFormat:@"</\\s*%@\\s*>", v9];
    uint64_t v8 = [v6 regularExpressionWithPattern:v7 options:1 error:0];
    [(WFPythonHTMLParser *)self setInterestingExpression:v8];
  }
  else
  {
    [(WFPythonHTMLParser *)self setInterestingExpression:0];
  }
}

- (void)close
{
}

- (void)feed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFPythonHTMLParser *)self rawData];
  id v6 = [v5 stringByAppendingString:v4];

  [(WFPythonHTMLParser *)self setRawData:v6];
  [(WFPythonHTMLParser *)self parseDataAndEnd:0];
}

- (void)reset
{
  rawData = self->_rawData;
  self->_rawData = (NSString *)&stru_26C71CE08;

  interestingExpression = self->_interestingExpression;
  self->_interestingExpression = 0;

  cdataElement = self->_cdataElement;
  self->_cdataElement = 0;

  *(_OWORD *)&self->_currentLineNumber = xmmword_216612670;
}

- (NSRegularExpression)interestingExpression
{
  interestingExpression = self->_interestingExpression;
  if (!interestingExpression)
  {
    id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[&<]" options:0 error:0];
    uint64_t v5 = self->_interestingExpression;
    self->_interestingExpression = v4;

    interestingExpression = self->_interestingExpression;
  }
  return interestingExpression;
}

- (WFPythonHTMLParser)init
{
  v25.receiver = self;
  v25.super_class = (Class)WFPythonHTMLParser;
  v2 = [(WFPythonHTMLParser *)&v25 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"&[a-zA-Z#]" options:0 error:0];
    incompleteExpression = v2->_incompleteExpression;
    v2->_incompleteExpression = (NSRegularExpression *)v3;

    uint64_t v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"&([a-zA-Z][-.a-zA-Z0-9]*)[^a-zA-Z0-9]" options:0 error:0];
    entityrefExpression = v2->_entityrefExpression;
    v2->_entityrefExpression = (NSRegularExpression *)v5;

    uint64_t v7 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"&#(?:[0-9]+|[xX][0-9a-fA-F]+)[^0-9a-fA-F]" options:0 error:0];
    charrefExpression = v2->_charrefExpression;
    v2->_charrefExpression = (NSRegularExpression *)v7;

    uint64_t v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<[a-zA-Z]" options:0 error:0];
    startTagOpenExpression = v2->_startTagOpenExpression;
    v2->_startTagOpenExpression = (NSRegularExpression *)v9;

    uint64_t v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"--\\s*>" options:0 error:0];
    commentCloseExpression = v2->_commentCloseExpression;
    v2->_commentCloseExpression = (NSRegularExpression *)v11;

    uint64_t v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([a-zA-Z][^\\t\\n\\r\\f />\\x00]*)(?:\\s|/(?!>))*" options:0 error:0];
    tagFindExpression = v2->_tagFindExpression;
    v2->_tagFindExpression = (NSRegularExpression *)v13;

    uint64_t v15 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"((?<=['\"\\s/])[^\\s/>][^\\s/=>]*)(\\s*=+\\s*('[^']*'|\"[^\"]*\"|(?!['\"])[^>\\s]*))?(?:\\s|/(?!>))*" options:0 error:0];
    attributeFindExpression = v2->_attributeFindExpression;
    v2->_attributeFindExpression = (NSRegularExpression *)v15;

    uint64_t v17 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<[a-zA-Z][^\\t\\n\\r\\f />\\x00]*(?:[\\s/]*(?:(?<=['\"\\s/])[^\\s/>][^\\s/=>]*(?:\\s*=+\\s*(?:'[^']*'|\"[^\"]*\"|(?!['\"])[^>\\s]*)(?:\\s*,)*)?(?:\\s|/(?!>))*)*)?\\s*" options:0 error:0];
    locateStartTagEndExpression = v2->_locateStartTagEndExpression;
    v2->_locateStartTagEndExpression = (NSRegularExpression *)v17;

    uint64_t v19 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@">" options:0 error:0];
    endEndTagExpression = v2->_endEndTagExpression;
    v2->_endEndTagExpression = (NSRegularExpression *)v19;

    uint64_t v21 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"</\\s*([a-zA-Z][-.a-zA-Z0-9:_]*)\\s*" options:0 error:0];
    endTagFindExpression = v2->_endTagFindExpression;
    v2->_endTagFindExpression = (NSRegularExpression *)v21;

    [(WFPythonHTMLParser *)v2 reset];
    uint64_t v23 = v2;
  }

  return v2;
}

@end
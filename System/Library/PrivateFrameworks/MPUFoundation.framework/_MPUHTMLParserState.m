@interface _MPUHTMLParserState
- (BOOL)parse:(id *)a3;
- (_MPUHTMLParserState)initWithParser:(id)a3 data:(id)a4;
- (id)attributedString;
- (id)currentTagAttributes;
- (id)tagStack;
- (void)_appendString:(id)a3;
- (void)_characters:(const char *)a3 length:(int)a4;
- (void)_endElement:(const char *)a3;
- (void)_error:(int64_t)a3 msg:(const char *)a4 args:(char *)a5;
- (void)_startDocument;
- (void)_startElement:(const char *)a3 attrs:(const char *)a4;
@end

@implementation _MPUHTMLParserState

- (void)_startDocument
{
  if (*(unsigned char *)&self->_delegateCapabilites)
  {
    uint64_t v3 = [(MPUHTMLParserDelegate *)self->_delegate defaultAttributesForParser:self->_parser];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v3 = [(NSMutableArray *)self->_attributeDictionaries addObject:v3];
      uint64_t v4 = v5;
    }
    MEMORY[0x270F9A758](v3, v4);
  }
}

- (void)_startElement:(const char *)a3 attrs:(const char *)a4
{
  _MPUHTMLStringFromXMLString((uint64_t)a3, 1);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_tagStack, "addObject:");
  v6 = [(NSMutableArray *)self->_stringStack lastObject];
  [(_MPUHTMLParserState *)self _appendString:v6];
  v7 = [(NSMutableArray *)self->_stringStack lastObject];
  [v7 setString:&stru_26DABBB08];

  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  [(NSMutableArray *)self->_stringStack addObject:v8];
  char delegateCapabilites = (char)self->_delegateCapabilites;
  if ((delegateCapabilites & 4) != 0)
  {
    v10 = [(MPUHTMLParserDelegate *)self->_delegate parser:self->_parser prependStringForTagName:v20];
    if (v10) {
      [v8 appendString:v10];
    }

    char delegateCapabilites = (char)self->_delegateCapabilites;
  }
  if ((delegateCapabilites & 2) != 0)
  {
    if (a4)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v12 = *a4;
      if (*a4)
      {
        v13 = a4 + 2;
        do
        {
          uint64_t v14 = (uint64_t)*(v13 - 1);
          if (!v14) {
            break;
          }
          v15 = _MPUHTMLStringFromXMLString(v14, 0);
          v16 = _MPUHTMLStringFromXMLString((uint64_t)v12, 1);
          [v11 setValue:v15 forKey:v16];

          v17 = *v13;
          v13 += 2;
          v12 = v17;
        }
        while (v17);
      }
    }
    else
    {
      id v11 = 0;
    }
    v18 = [(MPUHTMLParserDelegate *)self->_delegate parser:self->_parser attributesForTagName:v20 tagAttributes:v11 currentState:self];
    if (v18) {
      v19 = v18;
    }
    else {
      v19 = (void *)MEMORY[0x263EFFA78];
    }
    [(NSMutableArray *)self->_attributeDictionaries addObject:v19];
  }
}

- (void)_endElement:(const char *)a3
{
  id v4 = [(NSMutableArray *)self->_stringStack lastObject];
  [(_MPUHTMLParserState *)self _appendString:v4];
  [(NSMutableArray *)self->_attributeDictionaries removeLastObject];
  [(NSMutableArray *)self->_tagStack removeLastObject];
  [(NSMutableArray *)self->_stringStack removeLastObject];
}

- (void)_characters:(const char *)a3 length:(int)a4
{
  id v6 = (id)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  uint64_t v5 = [(NSMutableArray *)self->_stringStack lastObject];
  [v5 appendString:v6];
}

- (void)_error:(int64_t)a3 msg:(const char *)a4 args:(char *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = NSString;
  v9 = [NSString stringWithUTF8String:a4];
  v10 = objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%s", 0, a5);

  id v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F08320];
  v19[0] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v13 = [v11 errorWithDomain:@"com.apple.music.htmlparsererror" code:a3 userInfo:v12];

  uint64_t v14 = @"WARNING";
  if (a3 == 2) {
    uint64_t v14 = @"FATAL";
  }
  if (a3 == 1) {
    uint64_t v14 = @"ERROR";
  }
  NSLog(&cfstr_Xml.isa, v14, v10);
  errors = self->_errors;
  if (!errors)
  {
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v17 = self->_errors;
    self->_errors = v16;

    errors = self->_errors;
  }
  [(NSMutableArray *)errors addObject:v13];
}

- (void)_appendString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(_MPUHTMLParserState *)self currentTagAttributes];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v4];
    [(NSMutableAttributedString *)self->_attributedString appendAttributedString:v5];
  }
}

- (id)currentTagAttributes
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_attributeDictionaries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addEntriesFromDictionary:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (_MPUHTMLParserState)initWithParser:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPUHTMLParserState;
  v9 = [(_MPUHTMLParserState *)&v16 init];
  long long v10 = v9;
  if (v9)
  {
    v9->_selfRef = v9;
    objc_storeStrong((id *)&v9->_parser, a3);
    objc_storeStrong((id *)&v10->_data, a4);
    uint64_t v11 = [v7 delegate];
    delegate = v10->_delegate;
    v10->_delegate = (MPUHTMLParserDelegate *)v11;

    *(unsigned char *)&v10->_char delegateCapabilites = *(unsigned char *)&v10->_delegateCapabilites & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&v10->_char delegateCapabilites = *(unsigned char *)&v10->_delegateCapabilites & 0xFD | v13;
    if (objc_opt_respondsToSelector()) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&v10->_char delegateCapabilites = *(unsigned char *)&v10->_delegateCapabilites & 0xFB | v14;
  }

  return v10;
}

- (BOOL)parse:(id *)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x263F089B8]);
  attributedString = self->_attributedString;
  self->_attributedString = v5;

  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  attributeDictionaries = self->_attributeDictionaries;
  self->_attributeDictionaries = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  tagStack = self->_tagStack;
  self->_tagStack = v9;

  uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  stringStack = self->_stringStack;
  self->_stringStack = v11;

  char v13 = xmlCharStrndup((const char *)[(NSData *)self->_data bytes], [(NSData *)self->_data length]);
  CharEncodingName = xmlGetCharEncodingName(XML_CHAR_ENCODING_UTF8);
  if (_MPUHTMLParserStateSAXInitSharedHandler_onceToken != -1) {
    dispatch_once(&_MPUHTMLParserStateSAXInitSharedHandler_onceToken, &__block_literal_global_199);
  }
  htmlSAXParseDoc(v13, CharEncodingName, (htmlSAXHandlerPtr)_MPUHTMLParserStateSAXInitSharedHandler___gMPUHTMLParserStateSAXHandler, self->_selfRef);
  xmlCleanupParser();
  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v13);
  if (a3)
  {
    if ([(NSMutableArray *)self->_errors count])
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      v27 = @"errors";
      objc_super v16 = (void *)[(NSMutableArray *)self->_errors copy];
      v28[0] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a3 = [v15 errorWithDomain:@"com.apple.music.htmlparsererror" code:0 userInfo:v17];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v18 = self->_errors;
      a3 = (id *)[(NSMutableArray *)v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (a3)
      {
        uint64_t v19 = *(void *)v23;
        while (2)
        {
          id v20 = 0;
          do
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v18);
            }
            if (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v20), "code", (void)v22))
            {
              LOBYTE(a3) = 1;
              goto LABEL_15;
            }
            id v20 = (id *)((char *)v20 + 1);
          }
          while (a3 != v20);
          a3 = (id *)[(NSMutableArray *)v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (a3) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(a3) = 0;
    }
  }
  return (char)a3;
}

- (id)attributedString
{
  v2 = (void *)[(NSMutableAttributedString *)self->_attributedString copy];

  return v2;
}

- (id)tagStack
{
  v2 = (void *)[(NSMutableArray *)self->_tagStack copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringStack, 0);
  objc_storeStrong((id *)&self->_tagStack, 0);
  objc_storeStrong((id *)&self->_attributeDictionaries, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end
@interface ECMessageBodyHTMLParser
- (BOOL)_isMilestoneTagName:(id)a3;
- (BOOL)parse;
- (Class)messageBodyElementClass;
- (ECMessageBodyHTMLParser)initWithHTML:(id)a3;
- (unint64_t)messageBodyStringAccumulatorDefaultOptions;
- (void)_consumeNodesFromNode:(id)a3 upToNode:(id)a4;
- (void)_findBody;
- (void)dealloc;
- (void)didFindError:(id)a3;
@end

@implementation ECMessageBodyHTMLParser

- (ECMessageBodyHTMLParser)initWithHTML:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ECMessageBodyHTMLParser;
  v4 = [(ECMessageBodyParser *)&v7 init];
  if (v4)
  {
    v5 = (NSScanner *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a3];
    v4->_scanner = v5;
    [(NSScanner *)v5 setCharactersToBeSkipped:0];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ECMessageBodyHTMLParser;
  [(ECMessageBodyParser *)&v3 dealloc];
}

- (unint64_t)messageBodyStringAccumulatorDefaultOptions
{
  return 2;
}

- (Class)messageBodyElementClass
{
  return (Class)objc_opt_class();
}

- (void)_consumeNodesFromNode:(id)a3 upToNode:(id)a4
{
  while (a3 != a4)
  {
    objc_super v7 = (void *)MEMORY[0x1C18A2EF0](self, a2);
    if ([a3 endLocation] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [a3 firstChild];
    }
    else
    {
      -[ECMessageBodyParser enqueueParagraphNode:withTagName:](self, "enqueueParagraphNode:withTagName:", a3, [a3 tagName]);
      v9 = (void *)[a3 nextSibling];
      if (v9) {
        goto LABEL_6;
      }
      while (1)
      {
        uint64_t v8 = [a3 nextSibling];
        if (v8) {
          break;
        }
        a3 = (id)[a3 parentNode];
        if (!a3)
        {
          goto LABEL_12;
        }
      }
    }
    v9 = (void *)v8;
LABEL_6:
    a3 = v9;
    if (!v9) {
      break;
    }
  }
LABEL_12:
  [(ECMessageBodyParser *)self flushParagraphNodes];
}

- (BOOL)_isMilestoneTagName:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 hasPrefix:@"!"]) {
    return 1;
  }
  return [a3 caseInsensitiveCompare:@"br"] == 0;
}

- (void)_findBody
{
  if (!_findBody_regex) {
    _findBody_regex = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"<(body|BODY)(\\s|>)" options:0 error:0];
  }
  scanner = self->_scanner;
  -[NSScanner ec_scanUpToRegularExpression:](scanner, "ec_scanUpToRegularExpression:");
}

- (BOOL)parse
{
  if (parse_onceToken != -1) {
    dispatch_once(&parse_onceToken, &__block_literal_global_12);
  }
  [(ECMessageBodyHTMLParser *)self _findBody];
  objc_super v3 = objc_alloc_init(_ECParsedHTMLNode);
  v4 = v3;
  unint64_t v5 = 0x1E4F1C000uLL;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
  unint64_t v67 = [v6 count];
  [(ECMessageBodyParser *)self willBeginParsing];
  if ([(NSScanner *)self->_scanner isAtEnd]) {
    goto LABEL_91;
  }
  objc_super v7 = @"<";
  v68 = v3;
  do
  {
    if (![(ECMessageBodyParser *)self shouldProceedParsing]) {
      break;
    }
    NSUInteger v8 = [(NSScanner *)self->_scanner scanLocation];
    BOOL v9 = [(NSScanner *)self->_scanner scanUpToString:v7 intoString:0];
    BOOL v10 = v9;
    if (v9)
    {
      unint64_t v11 = v5;
      v12 = v7;
      v13 = objc_alloc_init(_ECParsedHTMLText);
      [(_ECParsedHTMLNode *)v13 setHtmlString:[(NSScanner *)self->_scanner string]];
      [(_ECParsedHTMLNode *)v13 setStartLocation:v8];
      [(_ECParsedHTMLNode *)v13 setEndLocation:[(NSScanner *)self->_scanner scanLocation]];
      v14 = v6;
      v15 = (void *)[v6 lastObject];
      v16 = (void *)[v15 lastChild];
      [v15 appendChild:v13];
      if (-[ECMessageBodyParser isLandmarkTagName:](self, "isLandmarkTagName:", [v16 tagName]))
      {
        [(ECMessageBodyHTMLParser *)self _consumeNodesFromNode:v4 upToNode:v13];

        v4 = v13;
      }

      objc_super v7 = v12;
      unint64_t v5 = v11;
      objc_super v3 = v68;
      v6 = v14;
    }
    NSUInteger v17 = [(NSScanner *)self->_scanner scanLocation];
    if (![(NSScanner *)self->_scanner scanString:v7 intoString:0])
    {
      if (v10) {
        continue;
      }
      v60 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = 3;
      goto LABEL_90;
    }
    BOOL v18 = [(NSScanner *)self->_scanner scanString:@"!--" intoString:0];
    scanner = self->_scanner;
    if (v18)
    {
      [(NSScanner *)scanner scanUpToString:@"-->" intoString:0];
      if ([(NSScanner *)self->_scanner scanString:@"-->" intoString:0]) {
        continue;
      }
      v60 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = 2;
      goto LABEL_90;
    }
    BOOL v20 = [(NSScanner *)scanner scanString:@"/" intoString:0];
    uint64_t v81 = 0;
    if (![(NSScanner *)self->_scanner scanUpToCharactersFromSet:parse_tagNameEndCharacterSet intoString:&v81])
    {
      uint64_t v61 = 0;
      unint64_t v57 = 0x1E4F28000;
      goto LABEL_89;
    }
    BOOL v64 = v20;
    NSUInteger v65 = v17;
    v66 = v6;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if ([(NSScanner *)self->_scanner isAtEnd])
      {
LABEL_87:
        v6 = v66;
        unint64_t v57 = 0x1E4F28000;
        uint64_t v61 = 1;
LABEL_89:
        v60 = *(void **)(v57 + 3160);
LABEL_90:
        -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", [v60 errorWithDomain:@"ECMessageBodyHTMLParserErrorDomain" code:v61 userInfo:0]);
        goto LABEL_91;
      }
      while (1)
      {
        v22 = (void *)MEMORY[0x1C18A2EF0]();
        BOOL v23 = [(NSScanner *)self->_scanner scanUpToCharactersFromSet:parse_tagEndCharacterSet intoString:0];
        BOOL v24 = [(NSScanner *)self->_scanner scanCharactersFromSet:parse_singularMilestoneCharacterSet intoString:0];
        BOOL v25 = [(NSScanner *)self->_scanner scanCharactersFromSet:parse_singularTagEndCharacterSet intoString:0];
        if (!v23 && !v24 && !v25)
        {
          unint64_t v57 = 0x1E4F28000uLL;
          -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"ECMessageBodyHTMLParserErrorDomain" code:3 userInfo:0]);
          uint64_t v61 = 1;
          v6 = v66;
          goto LABEL_89;
        }
        if (v25) {
          break;
        }
        if ([(NSScanner *)self->_scanner isAtEnd]) {
          goto LABEL_87;
        }
      }
      NSUInteger v26 = [(NSScanner *)self->_scanner scanLocation];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_29;
      }
      if (v26 - v21 >= 0x401)
      {
        [(NSScanner *)self->_scanner setScanLocation:v21];
LABEL_65:
        break;
      }
      NSUInteger v26 = v21;
LABEL_29:
      NSUInteger v63 = v26;
      NSUInteger v27 = [(NSScanner *)self->_scanner scanLocation];
      int64_t v80 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v28 = v27 - v65;
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v78 = v29;
      long long v79 = v29;
      long long v76 = v29;
      *(_OWORD *)theString = v29;
      long long v74 = v29;
      long long v75 = v29;
      long long v72 = v29;
      long long v73 = v29;
      long long v70 = v29;
      long long v71 = v29;
      *(_OWORD *)buffer = v29;
      CFStringRef v30 = [(NSScanner *)self->_scanner string];
      theString[0] = v30;
      *((void *)&v78 + 1) = v65;
      *(void *)&long long v79 = v28;
      theString[1] = (CFStringRef)CFStringGetCharactersPtr(v30);
      if (theString[1]) {
        CStringPtr = 0;
      }
      else {
        CStringPtr = CFStringGetCStringPtr(v30, 0x600u);
      }
      *(void *)&long long v78 = CStringPtr;
      *((void *)&v79 + 1) = 0;
      int64_t v80 = 0;
      if (v28 < 1) {
        goto LABEL_65;
      }
      v62 = v4;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      UniChar v35 = 0;
      char v36 = 0;
      uint64_t v37 = 64;
      do
      {
        if ((unint64_t)v34 >= 4) {
          uint64_t v38 = 4;
        }
        else {
          uint64_t v38 = v34;
        }
        if ((uint64_t)v79 <= v34)
        {
          UniChar v39 = 0;
        }
        else if (theString[1])
        {
          UniChar v39 = *((_WORD *)&theString[1]->isa + v34 + *((void *)&v78 + 1));
        }
        else if ((void)v78)
        {
          UniChar v39 = *(char *)(v78 + *((void *)&v78 + 1) + v34);
        }
        else
        {
          if (v80 <= v34 || v33 > v34)
          {
            uint64_t v43 = -v38;
            uint64_t v44 = v38 + v32;
            uint64_t v45 = v37 - v38;
            uint64_t v46 = v34 + v43;
            int64_t v47 = v46 + 64;
            if (v46 + 64 >= (uint64_t)v79) {
              int64_t v47 = v79;
            }
            *((void *)&v79 + 1) = v46;
            int64_t v80 = v47;
            v48.location = v46 + *((void *)&v78 + 1);
            if ((uint64_t)v79 >= v45) {
              uint64_t v49 = v45;
            }
            else {
              uint64_t v49 = v79;
            }
            v48.length = v49 + v44;
            CFStringGetCharacters(theString[0], v48, buffer);
            uint64_t v33 = *((void *)&v79 + 1);
          }
          UniChar v39 = buffer[v34 - v33];
        }
        BOOL v41 = v35 != 92 && v39 == 34;
        v36 ^= v41;
        ++v34;
        --v32;
        ++v37;
        UniChar v35 = v39;
      }
      while (v28 != v34);
      v4 = v62;
      uint64_t v21 = v63;
      objc_super v3 = v68;
      unint64_t v5 = 0x1E4F1C000;
    }
    while ((v36 & 1) != 0);
    NSUInteger v50 = [(NSScanner *)self->_scanner scanLocation];
    uint64_t v51 = v81;
    if (v24)
    {
      BOOL v52 = 1;
    }
    else
    {
      BOOL v52 = [(ECMessageBodyHTMLParser *)self _isMilestoneTagName:v81];
      uint64_t v51 = v81;
    }
    v6 = v66;
    if ([(ECMessageBodyParser *)self shouldIgnoreTagWithTagName:v51])
    {
      id v53 = [NSString alloc];
      v54 = (_ECParsedHTMLTag *)[v53 initWithFormat:@"</%@", v81];
      [(NSScanner *)self->_scanner scanUpToString:v54 intoString:0];
      if (![(NSScanner *)self->_scanner scanString:v54 intoString:0]
        || ![(NSScanner *)self->_scanner scanString:@">" intoString:0])
      {
        -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"ECMessageBodyHTMLParserErrorDomain" code:1 userInfo:0]);
      }
      objc_super v7 = @"<";
LABEL_74:

      continue;
    }
    if (!v64)
    {
      v54 = objc_alloc_init(_ECParsedHTMLTag);
      [(_ECParsedHTMLTag *)v54 setTagName:v81];
      [(_ECParsedHTMLNode *)v54 setHtmlString:[(NSScanner *)self->_scanner string]];
      [(_ECParsedHTMLNode *)v54 setStartLocation:v65];
      objc_msgSend((id)objc_msgSend(v66, "lastObject"), "appendChild:", v54);
      if (v52)
      {
        [(_ECParsedHTMLNode *)v54 setEndLocation:v50];
      }
      else
      {
        if ((unint64_t)[v66 count] >= 0x201) {
          -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"ECMessageBodyHTMLParserErrorDomain" code:4 userInfo:0]);
        }
        [v66 addObject:v54];
      }
      objc_super v7 = @"<";
      if ([(ECMessageBodyParser *)self isLandmarkTagName:v81])
      {
        [(ECMessageBodyHTMLParser *)self _consumeNodesFromNode:v4 upToNode:v54];

        v4 = v54;
      }
      goto LABEL_74;
    }
    do
    {
      if ([v66 count] <= v67) {
        break;
      }
      v55 = (void *)[v66 lastObject];
      [v55 setEndLocation:v50];
      v56 = (void *)[v55 tagName];
      LODWORD(v55) = [v56 isEqualToString:v81];
      [v66 removeLastObject];
    }
    while (!v55);
    if ([v66 count] < v67) {
      break;
    }
    objc_super v7 = @"<";
  }
  while (![(NSScanner *)self->_scanner isAtEnd]);
LABEL_91:

  if ([(ECMessageBodyParser *)self shouldProceedParsing])
  {
    [(ECMessageBodyHTMLParser *)self _consumeNodesFromNode:v4 upToNode:0];
    [(ECMessageBodyParser *)self didFinishParsing];
  }
  id v58 = objc_alloc_init(*(Class *)(v5 + 2632));
  [(_ECParsedHTMLNode *)v3 collectDescendanceIntoArray:v58];
  [(_ECParsedHTMLNode *)v4 collectDescendanceIntoArray:v58];

  return self->super._parserError == 0;
}

uint64_t __32__ECMessageBodyHTMLParser_parse__block_invoke()
{
  parse_tagNameEndCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"> /"), "copy");
  parse_tagEndCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @">/"), "copy");
  parse_singularMilestoneCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"/"), "copy");
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @">"), "copy");
  parse_singularTagEndCharacterSet = result;
  return result;
}

- (void)didFindError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyHTMLParser;
  [(ECMessageBodyParser *)&v5 didFindError:a3];
  v4 = _ef_log_ECMessageBodyParser();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ECMessageBodyHTMLParser didFindError:]((uint64_t)self, v4);
  }
}

- (void)didFindError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 104) scanLocation];
  uint64_t v5 = [*(id *)(a1 + 104) string];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_ERROR, "Scanner info: %lu %@", (uint8_t *)&v6, 0x16u);
}

@end
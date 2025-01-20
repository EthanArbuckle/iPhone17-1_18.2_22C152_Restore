@interface SGMicrodataParser
+ (id)parse:(id)a3;
+ (id)whitespaceSplit:(id)a3;
- (SGMicrodataParser)initWithDocument:(id)a3;
- (SGMicrodataParserStackItem)stackItem;
- (void)endElement;
- (void)startElement:(id)a3 withAttributes:(id)a4;
- (void)textContent:(id)a3;
@end

@implementation SGMicrodataParser

- (void).cxx_destruct
{
}

- (SGMicrodataParserStackItem)stackItem
{
  return self->_stackItem;
}

- (void)textContent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SGMicrodataParserStackItem *)self->_stackItem textConsumers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) appendString:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)endElement
{
  stackItem = self->_stackItem;
  if (stackItem)
  {
    self->_stackItem = [(SGMicrodataParserStackItem *)stackItem parent];
    MEMORY[0x1F41817F8]();
  }
}

- (void)startElement:(id)a3 withAttributes:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1CB79B230]();
  uint64_t v8 = [v6 lowercaseString];
  v60 = v6;
  LOBYTE(v6) = [v6 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"SGMicrodataParser.m" lineNumber:65 description:@"libxml tag names should always be lowercase during HTML parsing"];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v61 = v7;
  uint64_t v9 = [v7 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v15 = [v14 lowercaseString];
        LOBYTE(v14) = [v14 isEqualToString:v15];

        if ((v14 & 1) == 0)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2 object:self file:@"SGMicrodataParser.m" lineNumber:68 description:@"libxml attribute names should always be lowercase during HTML parsing"];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v11);
  }

  v17 = [(SGMicrodataParserStackItem *)self->_stackItem document];
  v18 = [v61 objectForKeyedSubscript:@"itemprop"];
  v19 = +[SGMicrodataParser whitespaceSplit:v18];

  v20 = [v61 objectForKeyedSubscript:@"itemscope"];

  v58 = v17;
  if (!v20)
  {
    if (!v19)
    {
      v29 = 0;
      goto LABEL_37;
    }
    v26 = [v61 objectForKeyedSubscript:@"content"];

    if (v26)
    {
      v27 = @"content";
      v28 = v61;
LABEL_18:
      v29 = [v28 objectForKeyedSubscript:v27];
LABEL_37:
      v56 = 0;
      v57 = 0;
      goto LABEL_38;
    }
    if (([v60 isEqualToString:@"audio"] & 1) != 0
      || ([v60 isEqualToString:@"embed"] & 1) != 0
      || ([v60 isEqualToString:@"iframe"] & 1) != 0
      || ([v60 isEqualToString:@"img"] & 1) != 0
      || ([v60 isEqualToString:@"source"] & 1) != 0
      || ([v60 isEqualToString:@"track"] & 1) != 0
      || [v60 isEqualToString:@"video"])
    {
      v31 = @"src";
    }
    else if (([v60 isEqualToString:@"a"] & 1) != 0 {
           || ([v60 isEqualToString:@"area"] & 1) != 0
    }
           || [v60 isEqualToString:@"link"])
    {
      v31 = @"href";
    }
    else
    {
      int v54 = [v60 isEqualToString:@"object"];
      v31 = @"data";
      if (!v54)
      {
        if (([v60 isEqualToString:@"data"] & 1) == 0
          && ![v60 isEqualToString:@"meter"])
        {
          if (![v60 isEqualToString:@"time"]
            || ([v61 objectForKeyedSubscript:@"datetime"],
                v55 = objc_claimAutoreleasedReturnValue(),
                v55,
                !v55))
          {
            v29 = (__CFString *)(id)objc_opt_new();
            v56 = v29;
            v57 = 0;
            goto LABEL_38;
          }
          v27 = @"datetime";
          v28 = v61;
          goto LABEL_18;
        }
        v31 = @"value";
        v32 = v61;
LABEL_34:
        uint64_t v33 = [v32 objectForKeyedSubscript:v31];
        v34 = (void *)v33;
        v35 = &stru_1F24EEF20;
        if (v33) {
          v35 = (__CFString *)v33;
        }
        v29 = v35;

        goto LABEL_37;
      }
    }
    v32 = v61;
    goto LABEL_34;
  }
  v21 = [v61 objectForKeyedSubscript:@"itemref"];
  v22 = +[SGMicrodataParser whitespaceSplit:v21];

  v23 = [v61 objectForKeyedSubscript:@"itemtype"];
  v24 = +[SGMicrodataParser whitespaceSplit:v23];

  if (v24) {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v24];
  }
  else {
    v25 = 0;
  }
  v30 = [[SGMicrodataItem alloc] initWithItemType:v25 itemRef:v22];
  v57 = v30;
  if (v19)
  {
    v29 = v30;
  }
  else
  {
    [v17 addItem:v30];
    v29 = 0;
  }

  v56 = 0;
LABEL_38:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v19;
  uint64_t v36 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v69 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v68 + 1) + 8 * j);
        v41 = (void *)MEMORY[0x1CB79B230]();
        v42 = [[SGMicrodataItemProp alloc] initWithName:v40 value:v29];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v43 = [(SGMicrodataParserStackItem *)self->_stackItem itemScopes];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v65;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v65 != v46) {
                objc_enumerationMutation(v43);
              }
              objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * k), "addItemProp:", v42, v56);
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v64 objects:v76 count:16];
          }
          while (v45);
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v37);
  }

  v48 = [SGMicrodataParserStackItem alloc];
  stackItem = self->_stackItem;
  v50 = [v61 objectForKeyedSubscript:@"id"];
  v51 = [(SGMicrodataParserStackItem *)v48 initWithParent:stackItem item:v57 htmlId:v50 textConsumer:v56];
  v52 = self->_stackItem;
  self->_stackItem = v51;
}

- (SGMicrodataParser)initWithDocument:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMicrodataParser;
  v5 = [(SGMicrodataParser *)&v9 init];
  if (v5)
  {
    id v6 = [[SGMicrodataParserStackItem alloc] initWithDocument:v4];
    stackItem = v5->_stackItem;
    v5->_stackItem = v6;
  }
  return v5;
}

+ (id)parse:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [[SGMicrodataParser alloc] initWithDocument:v4];
  PushParserCtxt = htmlCreatePushParserCtxt(&microdataSAXHandlerStruct, v5, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
  htmlCtxtUseOptions(PushParserCtxt, 2099201);
  id v7 = v3;
  uint64_t v8 = [v7 UTF8String];
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  uint64_t v10 = 0;
  int v11 = 0;
  while (*(unsigned char *)(v8 + v10) == 47)
  {
    if (v10 > v11 && *(unsigned char *)(v8 + (v10 + 1)) == 62)
    {
      int v12 = *(unsigned __int8 *)(v8 + v10 - 1);
      if (v12 == 34 || v12 == 39 || CFCharacterSetIsCharacterMember(Predefined, (char)v12))
      {
        htmlParseChunk(PushParserCtxt, (const char *)(v8 + v11), v10 - v11, 0);
        htmlParseChunk(PushParserCtxt, "&#47;", 5, 0);
        int v11 = v10 + 1;
      }
    }
LABEL_11:
    ++v10;
  }
  if (*(unsigned char *)(v8 + v10)) {
    goto LABEL_11;
  }
  htmlParseChunk(PushParserCtxt, (const char *)(v8 + v11), v10 - v11, 1);
  MEMORY[0x1CB79B070](PushParserCtxt);

  return v4;
}

+ (id)whitespaceSplit:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v5 = [v3 componentsSeparatedByCharactersInSet:v4];
    id v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "length", (void)v15)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      id v13 = v6;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end
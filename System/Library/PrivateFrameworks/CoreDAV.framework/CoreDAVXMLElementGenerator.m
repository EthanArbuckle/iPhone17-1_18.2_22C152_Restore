@interface CoreDAVXMLElementGenerator
- (BOOL)checkedElementValidityIfRootElement;
- (BOOL)isExpectedNameSpace:(id)a3 andElementName:(id)a4;
- (BOOL)isUnrecognized;
- (BOOL)tracksRootElement;
- (CoreDAVItem)element;
- (CoreDAVXMLElementGenerator)currentlyParsingSubItem;
- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 baseURL:(id)a4 rootElementNameSpace:(id)a5 elementName:(id)a6 parseClass:(Class)a7;
- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 parentGenerator:(id)a4 parentElementSetter:(SEL)a5 element:(id)a6;
- (CoreDAVXMLElementGenerator)parentGenerator;
- (NSDictionary)cachedElementParseRules;
- (NSMutableData)cDATA;
- (NSMutableData)characters;
- (NSURL)baseURL;
- (SEL)parentElementSetter;
- (int)parsingState;
- (void)noteChildCascadingFailure;
- (void)notifyElement:(id)a3 ofAttributesFound:(id)a4;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)resumeParsingWithParser:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCDATA:(id)a3;
- (void)setCachedElementParseRules:(id)a3;
- (void)setCharacters:(id)a3;
- (void)setCheckedElementValidityIfRootElement:(BOOL)a3;
- (void)setCurrentlyParsingSubItem:(id)a3;
- (void)setElement:(id)a3;
- (void)setIsUnrecognized:(BOOL)a3;
- (void)setParentElementSetter:(SEL)a3;
- (void)setParentGenerator:(id)a3;
- (void)setParsingState:(int)a3;
@end

@implementation CoreDAVXMLElementGenerator

- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 baseURL:(id)a4 rootElementNameSpace:(id)a5 elementName:(id)a6 parseClass:(Class)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[[a7 alloc] initWithNameSpace:v13 andName:v12];

  v17 = [(CoreDAVXMLElementGenerator *)self initWithParser:v15 parentGenerator:0 parentElementSetter:0 element:v16];
  v18 = v17;
  [(CoreDAVXMLElementGenerator *)v18 setBaseURL:v14];

  return v18;
}

- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 parentGenerator:(id)a4 parentElementSetter:(SEL)a5 element:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CoreDAVXMLElementGenerator;
  id v13 = [(CoreDAVXMLElementGenerator *)&v19 init];
  id v14 = v13;
  if (v13)
  {
    *(_WORD *)&v13->_checkedElementValidityIfRootElement = 0;
    v13->_parsingState = 1;
    if (a5) {
      SEL v15 = a5;
    }
    else {
      SEL v15 = 0;
    }
    v13->_parentElementSetter = v15;
    objc_storeStrong((id *)&v13->_element, a6);
    objc_storeWeak((id *)&v14->_parentGenerator, v11);
    uint64_t v16 = [v11 baseURL];
    baseURL = v14->_baseURL;
    v14->_baseURL = (NSURL *)v16;

    [v10 setDelegate:v14];
  }

  return v14;
}

- (BOOL)tracksRootElement
{
  v2 = [(CoreDAVXMLElementGenerator *)self parentGenerator];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)notifyElement:(id)a3 ofAttributesFound:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v8)
  {
    id v10 = v7;
    goto LABEL_13;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
      if (!v10) {
        id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      id v14 = [CoreDAVXMLElementAttribute alloc];
      SEL v15 = [v6 objectForKey:v13];
      uint64_t v16 = [(CoreDAVXMLElementAttribute *)v14 initWithNameSpace:0 name:v13 value:v15];

      [v10 addObject:v16];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v9);

  if (v10)
  {
    [v5 parserFoundAttributes:v10];
LABEL_13:
  }
}

- (BOOL)isExpectedNameSpace:(id)a3 andElementName:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CoreDAVXMLElementGenerator *)self element];
  uint64_t v9 = [v8 name];
  if ([v7 isEqualToString:v9])
  {
    id v10 = [(CoreDAVXMLElementGenerator *)self element];
    uint64_t v11 = [v10 nameSpace];
    char v12 = [v6 isEqualToString:v11];

    if (v12)
    {
      BOOL v13 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = +[CoreDAVLogging sharedLogging];
  SEL v15 = [v14 logHandleForAccountInfoProvider:0];
  uint64_t v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = [(CoreDAVXMLElementGenerator *)self element];
    long long v18 = [v17 nameSpace];
    long long v19 = [(CoreDAVXMLElementGenerator *)self element];
    long long v20 = [v19 name];
    int v22 = 138413058;
    v23 = v18;
    __int16 v24 = 2112;
    v25 = v20;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_DEFAULT, "The expected namespace / name (%@ / %@) didn't match my namespace / name (%@ / %@", (uint8_t *)&v22, 0x2Au);
  }
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(CoreDAVXMLElementGenerator *)self tracksRootElement])
  {
    long long v17 = [(CoreDAVXMLElementGenerator *)self currentlyParsingSubItem];
    if (v17)
    {
    }
    else if (![(CoreDAVXMLElementGenerator *)self checkedElementValidityIfRootElement])
    {
      id v45 = v16;
      [(CoreDAVXMLElementGenerator *)self setCheckedElementValidityIfRootElement:1];
      BOOL v46 = [(CoreDAVXMLElementGenerator *)self isExpectedNameSpace:v14 andElementName:v13];
      v47 = [v12 rootErrorGenerator];
      v48 = v47;
      if (v46)
      {

        if (v48 != self) {
          [v12 setRootErrorGenerator:0];
        }
        v49 = [(CoreDAVXMLElementGenerator *)self element];
        id v16 = v45;
        [(CoreDAVXMLElementGenerator *)self notifyElement:v49 ofAttributesFound:v45];
      }
      else
      {
        if ([(CoreDAVXMLElementGenerator *)v47 isExpectedNameSpace:v14 andElementName:v13])
        {
          [v12 setDelegate:v48];
          [(CoreDAVXMLElementGenerator *)v48 parser:v12 didStartElement:v13 namespaceURI:v14 qualifiedName:v15 attributes:v45];
        }
        else
        {
          [v12 setRootErrorGenerator:0];
          [v12 abortParsing];
          [(CoreDAVXMLElementGenerator *)self noteChildCascadingFailure];
        }

        id v16 = v45;
      }
      goto LABEL_31;
    }
  }
  long long v18 = [(CoreDAVXMLElementGenerator *)self cachedElementParseRules];

  if (!v18)
  {
    long long v19 = [(CoreDAVXMLElementGenerator *)self element];
    long long v20 = (void *)[v19 copyParseRules];

    [(CoreDAVXMLElementGenerator *)self setCachedElementParseRules:v20];
  }
  uint64_t v21 = [[NSString alloc] initWithFormat:@"%@:%@", v14, v13];
  int v22 = [(CoreDAVXMLElementGenerator *)self cachedElementParseRules];
  v54 = (void *)v21;
  v23 = [v22 objectForKey:v21];

  if (v23)
  {
    __int16 v24 = objc_msgSend(objc_alloc((Class)objc_msgSend(v23, "objectClass")), "initWithNameSpace:andName:", v14, v13);
    v25 = [(CoreDAVXMLElementGenerator *)self baseURL];
    [v24 parserSuggestsBaseURL:v25];

    __int16 v26 = -[CoreDAVXMLElementGenerator initWithParser:parentGenerator:parentElementSetter:element:]([CoreDAVXMLElementGenerator alloc], "initWithParser:parentGenerator:parentElementSetter:element:", v12, self, [v23 setterMethod], v24);
    [(CoreDAVXMLElementGenerator *)self notifyElement:v24 ofAttributesFound:v16];
    [(CoreDAVXMLElementGenerator *)self setCurrentlyParsingSubItem:v26];
  }
  else
  {
    id v53 = v12;
    v50 = self;
    id v51 = v16;
    id v52 = v15;
    id v27 = v13;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    __int16 v28 = [v12 parseHints];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v56;
LABEL_11:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v55 + 1) + 8 * v32);
        v34 = [v33 nameSpace];
        if ([v14 isEqualToString:v34])
        {
          v35 = [v33 name];
          char v36 = [v27 isEqualToString:v35];

          if (v36)
          {
            v37 = v33;

            if (!v37) {
              goto LABEL_28;
            }
            id v13 = v27;
            id v15 = v52;
            id v12 = v53;
            id v16 = v51;
            if (![(CoreDAVItem *)v37 parseClass])
            {
              v38 = +[CoreDAVLogging sharedLogging];
              v39 = [v38 logHandleForAccountInfoProvider:0];
              v40 = v39;
              if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v37;
                _os_log_impl(&dword_213BFC000, v40, OS_LOG_TYPE_ERROR, "\n\n\nHEY YOU GUYS! This parse rule is missing a parse class.  This parse will go poorly. Parse rule %@\n\n\n", buf, 0xCu);
              }
            }
            v41 = (CoreDAVXMLElementGenerator *)objc_msgSend(objc_alloc((Class)-[CoreDAVItem parseClass](v37, "parseClass")), "initWithNameSpace:andName:", v14, v13);
            v42 = [(CoreDAVXMLElementGenerator *)v50 baseURL];
            [(CoreDAVXMLElementGenerator *)v41 parserSuggestsBaseURL:v42];

            v43 = [[CoreDAVXMLElementGenerator alloc] initWithParser:v53 parentGenerator:v50 parentElementSetter:0 element:v41];
            [(CoreDAVXMLElementGenerator *)v43 setIsUnrecognized:1];
            [(CoreDAVXMLElementGenerator *)v50 notifyElement:v41 ofAttributesFound:v51];
            [(CoreDAVXMLElementGenerator *)v50 setCurrentlyParsingSubItem:v43];

            goto LABEL_29;
          }
        }
        else
        {
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v61 count:16];
          if (v30) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

LABEL_28:
    id v13 = v27;
    v37 = [[CoreDAVItem alloc] initWithNameSpace:v14 andName:v27];
    v44 = [(CoreDAVXMLElementGenerator *)v50 baseURL];
    [(CoreDAVItem *)v37 parserSuggestsBaseURL:v44];

    id v12 = v53;
    v41 = [[CoreDAVXMLElementGenerator alloc] initWithParser:v53 parentGenerator:v50 parentElementSetter:0 element:v37];
    [(CoreDAVXMLElementGenerator *)v41 setIsUnrecognized:1];
    id v16 = v51;
    [(CoreDAVXMLElementGenerator *)v50 notifyElement:v37 ofAttributesFound:v51];
    [(CoreDAVXMLElementGenerator *)v50 setCurrentlyParsingSubItem:v41];
    id v15 = v52;
LABEL_29:

    v23 = 0;
  }

LABEL_31:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v25 = a3;
  if ([(CoreDAVXMLElementGenerator *)self isExpectedNameSpace:a5 andElementName:a4])
  {
    [(CoreDAVXMLElementGenerator *)self setParsingState:2];
    uint64_t v9 = [(CoreDAVXMLElementGenerator *)self cDATA];

    if (v9)
    {
      [(CoreDAVXMLElementGenerator *)self setParsingState:2];
      id v10 = [(CoreDAVXMLElementGenerator *)self element];
      uint64_t v11 = [(CoreDAVXMLElementGenerator *)self cDATA];
    }
    else
    {
      id v13 = [(CoreDAVXMLElementGenerator *)self characters];

      if (!v13) {
        goto LABEL_8;
      }
      [(CoreDAVXMLElementGenerator *)self setParsingState:2];
      id v10 = [(CoreDAVXMLElementGenerator *)self element];
      uint64_t v11 = [(CoreDAVXMLElementGenerator *)self characters];
    }
    id v14 = (void *)v11;
    [v10 parserFoundPayload:v11];

LABEL_8:
    uint64_t v12 = [(CoreDAVXMLElementGenerator *)self tracksRootElement];
    id v15 = v25;
    if (v12) {
      goto LABEL_16;
    }
    BOOL v16 = [(CoreDAVXMLElementGenerator *)self isUnrecognized];
    long long v17 = [(CoreDAVXMLElementGenerator *)self parentGenerator];
    long long v18 = [v17 element];
    if (v16)
    {
      long long v19 = [(CoreDAVXMLElementGenerator *)self element];
      [v18 parserFoundUnrecognizedElement:v19];

      long long v20 = v18;
      long long v18 = v17;
    }
    else
    {

      uint64_t v21 = objc_msgSend(v18, "methodForSelector:", -[CoreDAVXMLElementGenerator parentElementSetter](self, "parentElementSetter"));
      if (!v21)
      {
LABEL_14:

        __int16 v24 = [(CoreDAVXMLElementGenerator *)self parentGenerator];
        [v25 setDelegate:v24];

        goto LABEL_15;
      }
      int v22 = (void (*)(void *, const char *, void *))v21;
      v23 = [(CoreDAVXMLElementGenerator *)self parentElementSetter];
      long long v20 = [(CoreDAVXMLElementGenerator *)self element];
      v22(v18, v23, v20);
    }

    goto LABEL_14;
  }
  [v25 abortParsing];
  uint64_t v12 = [(CoreDAVXMLElementGenerator *)self noteChildCascadingFailure];
LABEL_15:
  id v15 = v25;
LABEL_16:
  MEMORY[0x270F9A758](v12, v15);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(CoreDAVXMLElementGenerator *)self characters];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
    [(CoreDAVXMLElementGenerator *)self setCharacters:v7];
  }
  id v9 = [(CoreDAVXMLElementGenerator *)self characters];
  uint64_t v8 = [v5 dataUsingEncoding:4];

  [v9 appendData:v8];
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5 = a4;
  id v6 = [(CoreDAVXMLElementGenerator *)self cDATA];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
    [(CoreDAVXMLElementGenerator *)self setCDATA:v7];
  }
  id v8 = [(CoreDAVXMLElementGenerator *)self cDATA];
  [v8 appendData:v5];
}

- (void)parserDidEndDocument:(id)a3
{
}

- (void)noteChildCascadingFailure
{
  [(CoreDAVXMLElementGenerator *)self setParsingState:4];
  id v3 = [(CoreDAVXMLElementGenerator *)self parentGenerator];
  [v3 noteChildCascadingFailure];
}

- (void)resumeParsingWithParser:(id)a3
{
  id v6 = a3;
  if ([(CoreDAVXMLElementGenerator *)self parsingState] == 1)
  {
    v4 = [(CoreDAVXMLElementGenerator *)self currentlyParsingSubItem];

    if (v4)
    {
      id v5 = [(CoreDAVXMLElementGenerator *)self currentlyParsingSubItem];
      [v5 resumeParsingWithParser:v6];
    }
    else
    {
      [v6 setDelegate:self];
    }
  }
}

- (BOOL)isUnrecognized
{
  return self->_isUnrecognized;
}

- (void)setIsUnrecognized:(BOOL)a3
{
  self->_isUnrecognized = a3;
}

- (int)parsingState
{
  return self->_parsingState;
}

- (void)setParsingState:(int)a3
{
  self->_parsingState = a3;
}

- (SEL)parentElementSetter
{
  if (self->_parentElementSetter) {
    return self->_parentElementSetter;
  }
  else {
    return 0;
  }
}

- (void)setParentElementSetter:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_parentElementSetter = v3;
}

- (NSMutableData)characters
{
  return self->_characters;
}

- (void)setCharacters:(id)a3
{
}

- (NSMutableData)cDATA
{
  return self->_cDATA;
}

- (void)setCDATA:(id)a3
{
}

- (CoreDAVXMLElementGenerator)currentlyParsingSubItem
{
  return self->_currentlyParsingSubItem;
}

- (void)setCurrentlyParsingSubItem:(id)a3
{
}

- (CoreDAVItem)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (CoreDAVXMLElementGenerator)parentGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGenerator);
  return (CoreDAVXMLElementGenerator *)WeakRetained;
}

- (void)setParentGenerator:(id)a3
{
}

- (NSDictionary)cachedElementParseRules
{
  return self->_cachedElementParseRules;
}

- (void)setCachedElementParseRules:(id)a3
{
}

- (BOOL)checkedElementValidityIfRootElement
{
  return self->_checkedElementValidityIfRootElement;
}

- (void)setCheckedElementValidityIfRootElement:(BOOL)a3
{
  self->_checkedElementValidityIfRootElement = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_cachedElementParseRules, 0);
  objc_storeStrong((id *)&self->_currentlyParsingSubItem, 0);
  objc_storeStrong((id *)&self->_cDATA, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_destroyWeak((id *)&self->_parentGenerator);
  objc_storeStrong((id *)&self->_parentElement, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
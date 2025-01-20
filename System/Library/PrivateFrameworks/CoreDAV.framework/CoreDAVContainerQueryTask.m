@interface CoreDAVContainerQueryTask
+ (id)_copySearchTermsFromSearchString:(id)a3;
- (CoreDAVContainerQueryTask)initWithSearchString:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6;
- (CoreDAVContainerQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6;
- (id)_initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)httpMethod;
- (id)requestBody;
- (void)addFiltersToXMLData:(id)a3;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVContainerQueryTask

+ (id)_copySearchTermsFromSearchString:(id)a3
{
  v3 = (__CFString *)a3;
  CFIndex v4 = [(__CFString *)v3 length];
  CFLocaleRef v5 = CFLocaleCopyCurrent();
  v29.location = 0;
  v29.length = v4;
  v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, v29, 0, v5);
  id v28 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    [v7 addObject:v9];
  }
  CFRelease(v6);
  CFRelease(v5);
  if (!_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet)
  {
    uint64_t v10 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-@._"];
    v11 = (void *)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet;
    _copySearchTermsFromSearchString____friendlyPunctuationCharacterSet = v10;
  }
  if ([v7 count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [v7 objectAtIndex:v12];
      uint64_t v14 = [v13 rangeValue];
      uint64_t v16 = v15;

      unint64_t v17 = [(__CFString *)v3 length];
      if (v12 >= [v7 count] - 1)
      {
        uint64_t v20 = 0;
        if (v14)
        {
LABEL_11:
          uint64_t v27 = v14 + v16;
          while (1)
          {
            uint64_t v21 = v14 - 1;
            if (!objc_msgSend((id)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](v3, "characterAtIndex:", v14 - 1, v27)))break; {
            ++v16;
            }
            --v14;
            if (!v21)
            {
              uint64_t v16 = v27;
              break;
            }
          }
        }
      }
      else
      {
        v18 = [v7 objectAtIndex:v12 + 1];
        unint64_t v17 = [v18 rangeValue];
        uint64_t v20 = v19;

        if (v14) {
          goto LABEL_11;
        }
      }
      unint64_t v22 = v16 + v14;
      ++v12;
      while (v22 < v17
           && objc_msgSend((id)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](v3, "characterAtIndex:")))
      {
        if (++v16 + v14 == v17 && v20)
        {
          v16 += v20;
          [v7 removeObjectAtIndex:v12];
          if (v12 < [v7 count])
          {
            v23 = [v7 objectAtIndex:v12];
            unint64_t v17 = [v23 rangeValue];
            uint64_t v20 = v24;
          }
        }
        unint64_t v22 = v16 + v14;
      }
      v25 = -[__CFString substringWithRange:](v3, "substringWithRange:", v14, v16);
      [v28 addObject:v25];
    }
    while (v12 < [v7 count]);
  }

  return v28;
}

- (CoreDAVContainerQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
}

- (CoreDAVContainerQueryTask)initWithSearchString:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  id v10 = a5;
  id v11 = +[CoreDAVContainerQueryTask _copySearchTermsFromSearchString:a3];
  unint64_t v12 = [(CoreDAVContainerQueryTask *)self initWithSearchTerms:v11 searchLimit:a4 atURL:v10 appSpecificDataItemClass:a6];

  return v12;
}

- (id)_initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVContainerQueryTask;
  unint64_t v12 = [(CoreDAVTask *)&v15 initWithURL:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchTerms, a3);
    v13->_searchLimit = a4;
    if (!a6) {
      a6 = (Class)objc_opt_class();
    }
    v13->_appSpecificDataItemClass = a6;
    v13->super._depth = 3;
  }

  return v13;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (void)addFiltersToXMLData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFIndex v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_ERROR, "addFiltersToXMLData: to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)requestBody
{
  v3 = objc_alloc_init(CoreDAVXMLData);
  [(CoreDAVXMLData *)v3 startElement:self->_appSpecificQueryCommand inNamespace:self->_appSpecificNamespace withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 appendElement:@"getetag" inNamespace:@"DAV:" withStringContent:0 withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 appendElement:self->_appSpecificDataProp inNamespace:self->_appSpecificNamespace withStringContent:0 withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 endElement:@"prop" inNamespace:@"DAV:"];
  [(CoreDAVContainerQueryTask *)self addFiltersToXMLData:v3];
  [(CoreDAVXMLData *)v3 endElement:self->_appSpecificQueryCommand inNamespace:self->_appSpecificNamespace];
  CFIndex v4 = [(CoreDAVXMLData *)v3 data];

  return v4;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  CFIndex v4 = [CoreDAVXMLParser alloc];
  uint64_t v5 = objc_opt_class();
  v6 = [(CoreDAVTask *)self url];
  id v7 = [(CoreDAVXMLParser *)v4 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v5 baseURL:v6];

  id v8 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"getetag" parseClass:objc_opt_class()];
  int v9 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:self->_appSpecificNamespace name:self->_appSpecificDataProp parseClass:objc_opt_class()];
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
  [v10 addObject:v8];
  [v10 addObject:v9];
  [(CoreDAVXMLParser *)v7 setParseHints:v10];

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  CFIndex v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(__CFString *)v4 code];
    id v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v62 = (__CFString *)objc_opt_class();
          uint64_t v11 = v62;
          unint64_t v12 = "%{public}@ cancelled";
          v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_29:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else if (v9)
    {
      v42 = v9;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v62 = (__CFString *)objc_opt_class();
        __int16 v63 = 2112;
        v64 = v5;
        uint64_t v11 = v62;
        unint64_t v12 = "%{public}@ failed: %@";
        v13 = v42;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
        goto LABEL_29;
      }
LABEL_30:
    }
    v41 = v5;
    LOBYTE(v18) = 0;
    id v16 = 0;
    goto LABEL_32;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v49 = [(CoreDAVTask *)self responseBodyParser];
  [v49 rootElement];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v48 = long long v59 = 0u;
  unint64_t v17 = [v48 responses];
  uint64_t v54 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
  uint64_t v18 = 0;
  if (v54)
  {
    uint64_t v19 = *(void *)v57;
    uint64_t v51 = *(void *)v57;
    v50 = v17;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v57 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(__CFString **)(*((void *)&v56 + 1) + 8 * v20);
        unint64_t v22 = [(__CFString *)v21 errorItem];
        v23 = [v22 numberOfMatchesWithinLimits];

        if (v23)
        {
          uint64_t v24 = +[CoreDAVLogging sharedLogging];
          id v25 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          v26 = [v24 logHandleForAccountInfoProvider:v25];

          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v62 = @"number-of-matches-within-limits";
            __int16 v63 = 2112;
            v64 = v21;
            _os_log_impl(&dword_213BFC000, v26, OS_LOG_TYPE_DEBUG, "Received %@ response %@", buf, 0x16u);
          }
          uint64_t v18 = 1;
        }
        else
        {
          uint64_t v27 = [(__CFString *)v21 successfulPropertiesToValues];
          uint64_t v24 = v27;
          if (v27)
          {
            id v28 = [v27 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"getetag"];
            v26 = [v28 payloadAsString];

            CFRange v29 = [v24 CDVObjectForKeyWithNameSpace:self->_appSpecificNamespace andName:self->_appSpecificDataProp];
            uint64_t v53 = [v29 payload];

            v30 = [(__CFString *)v21 firstHref];
            v52 = [v30 payloadAsFullURL];

            id v31 = objc_alloc(self->_appSpecificDataItemClass);
            [(CoreDAVTask *)self url];
            v33 = id v32 = v16;
            [(CoreDAVTask *)self accountInfoProvider];
            uint64_t v34 = v18;
            v36 = v35 = self;
            v37 = v53;
            v38 = (void *)[v31 initWithURL:v52 eTag:v26 dataPayload:v53 inContainerWithURL:v33 withAccountInfoProvider:v36];

            self = v35;
            uint64_t v18 = v34;

            id v16 = v32;
            unint64_t v17 = v50;
            [v16 addObject:v38];
          }
          else
          {
            v26 = +[CoreDAVLogging sharedLogging];
            id v39 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            v37 = [v26 logHandleForAccountInfoProvider:v39];

            if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v21;
              _os_log_impl(&dword_213BFC000, v37, OS_LOG_TYPE_DEFAULT, "Unexpected status response %@", buf, 0xCu);
            }
          }
          uint64_t v19 = v51;
        }
        ++v20;
      }
      while (v54 != v20);
      uint64_t v40 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
      uint64_t v54 = v40;
    }
    while (v40);
  }

  v41 = 0;
  uint64_t v5 = 0;
LABEL_32:
  self->super._numDownloadedElements = [v16 count];
  v43 = [(CoreDAVTask *)self delegate];
  char v44 = objc_opt_respondsToSelector();

  v45 = [(CoreDAVTask *)self delegate];
  v46 = v45;
  if (v44)
  {
    [v45 containerQueryTask:self completedWithFoundItems:v16 limitReached:v18 & 1 error:v41];
LABEL_36:

    [(CoreDAVTask *)self setDelegate:0];
    goto LABEL_37;
  }
  char v47 = objc_opt_respondsToSelector();

  if (v47)
  {
    v46 = [(CoreDAVTask *)self delegate];
    [v46 containerQueryTask:self completedWithFoundItems:v16 error:v41];
    goto LABEL_36;
  }
LABEL_37:
  v55.receiver = self;
  v55.super_class = (Class)CoreDAVContainerQueryTask;
  [(CoreDAVTask *)&v55 finishCoreDAVTaskWithError:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificQueryCommand, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end
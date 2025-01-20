@interface CoreDAVRequestLogger
+ (id)_redactedHeadersFromHeaders:(id)a3;
- (CoreDAVRequestLogger)initWithProvider:(id)a3;
- (NSArray)headerSortDescriptors;
- (id)_inflateRequestBody:(id)a3;
- (void)finishCoreDAVResponse;
- (void)logCoreDAVRequest:(id)a3 withTaskIdentifier:(id)a4;
- (void)logCoreDAVResponseHeaders:(id)a3 andStatusCode:(int64_t)a4 withTaskIdentifier:(id)a5;
- (void)logCoreDAVResponseSnippet:(id)a3;
- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4;
- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4 isBody:(BOOL)a5;
- (void)setHeaderSortDescriptors:(id)a3;
@end

@implementation CoreDAVRequestLogger

- (CoreDAVRequestLogger)initWithProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVRequestLogger;
  v6 = [(CoreDAVRequestLogger *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1 selector:sel_caseInsensitiveCompare_];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, 0);
    [(CoreDAVRequestLogger *)v7 setHeaderSortDescriptors:v9];
  }
  return v7;
}

- (id)_inflateRequestBody:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF990] data];
  id v5 = [@"[compression: gzip]\n" dataUsingEncoding:4];
  [v4 appendData:v5];

  memset(&v10, 0, sizeof(v10));
  bzero(v11, 0x2000uLL);
  if (inflateInit2_(&v10, 31, "1.2.12", 112))
  {
    id v6 = 0;
  }
  else
  {
    id v7 = v3;
    v10.avail_in = objc_msgSend(v7, "length", objc_msgSend(v7, "bytes", *(_OWORD *)&v10.next_in, *(_OWORD *)&v10.total_in, *(_OWORD *)&v10.avail_out, *(_OWORD *)&v10.msg, *(_OWORD *)&v10.zalloc, *(_OWORD *)&v10.opaque, *(_OWORD *)&v10.adler));
    v10.total_in = v10.avail_in;
    while (1)
    {
      v10.next_out = v11;
      v10.avail_out = 0x2000;
      int v8 = inflate(&v10, 0);
      if ((signed int)(0x2000 - v10.avail_out) >= 1) {
        objc_msgSend(v4, "appendBytes:length:", v11);
      }
      if (v8) {
        break;
      }
      if (!v10.avail_in) {
        goto LABEL_11;
      }
    }
    if (v8 != 1)
    {

      v4 = 0;
    }
LABEL_11:
    inflateEnd(&v10);
    id v6 = v4;
    v4 = v6;
  }

  return v6;
}

- (void)logCoreDAVRequest:(id)a3 withTaskIdentifier:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v71 = a4;
  id v7 = +[CoreDAVLogging sharedLogging];
  int v8 = [v7 delegatesToLogTransmittedDataForAccountInfoProvider:self->_provider];

  v9 = [MEMORY[0x263EFF9C0] set];
  if ([v8 count])
  {
    z_stream v10 = [v6 HTTPBody];
    objc_super v11 = [v6 allHTTPHeaderFields];
    uint64_t v12 = [v11 CDVObjectForKeyCaseInsensitive:@"Content-Encoding"];
    int v13 = [v12 isEqualToString:@"gzip"];

    if (v13)
    {
      uint64_t v14 = [(CoreDAVRequestLogger *)self _inflateRequestBody:v10];

      z_stream v10 = (void *)v14;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v64 = v8;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v80;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      v69 = self;
      id v70 = v6;
      v67 = v10;
      v68 = v9;
      id v66 = v15;
      uint64_t v72 = *(void *)v80;
      do
      {
        uint64_t v19 = 0;
        uint64_t v73 = v17;
        do
        {
          if (*(void *)v80 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v79 + 1) + 8 * v19);
          if ([v9 containsObject:objc_opt_class()])
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v74 = v19;
              v21 = [v20 logHandle];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                id v85 = v22;
                __int16 v86 = 2112;
                v87 = v20;
                id v23 = v22;
                _os_log_error_impl(&dword_213BFC000, v21, OS_LOG_TYPE_ERROR, "A delegate of similar class [%{public}@] has already logged this message. Skipping this delegate %@", buf, 0x16u);

                uint64_t v18 = v72;
              }
              goto LABEL_51;
            }
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_52;
            }
            uint64_t v74 = v19;
            [NSString stringWithFormat:@"A delegate of similar class [%@] has already logged this message. Skipping this delegate %@", objc_opt_class(), v20];
          }
          else
          {
            [v9 addObject:objc_opt_class()];
            if (![v20 shouldLogTransmittedData]) {
              goto LABEL_52;
            }
            uint64_t v74 = v19;
            v24 = [v6 URL];

            if (v24)
            {
              v25 = [NSString stringWithFormat:@"\nTask %@\n", v71];
              v26 = [v25 dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v26];

              CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
              CFDateRef v28 = CFDateCreate(0, Current);
              if (_logFormater_logPred != -1) {
                dispatch_once(&_logFormater_logPred, &__block_literal_global_108);
              }
              if (_logFormater___logFormatter) {
                CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(allocator, (CFDateFormatterRef)_logFormater___logFormatter, v28);
              }
              else {
                CFStringRef StringWithDate = 0;
              }
              v30 = [NSString stringWithFormat:@"\n>>>>> %@\n", StringWithDate];
              v31 = [v30 dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v31];

              if (StringWithDate) {
                CFRelease(StringWithDate);
              }
              if (v28) {
                CFRelease(v28);
              }
              v32 = NSString;
              v33 = [v6 HTTPMethod];
              v34 = [v6 URL];
              v35 = [v32 stringWithFormat:@"%@ %@\n", v33, v34];
              v36 = [v35 dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v36];

              v37 = [v6 allHTTPHeaderFields];
              if (objc_opt_respondsToSelector())
              {
                provider = self->_provider;
                v39 = [v6 URL];
                LODWORD(provider) = [(CoreDAVAccountInfoProvider *)provider shouldHandleHTTPCookiesForURL:v39];

                if (provider)
                {
                  id v40 = v6;
                  [v40 _CFURLRequest];
                  uint64_t v41 = CFURLRequestCopyHTTPCookieStorage();
                  if (v41)
                  {
                    v42 = (const void *)v41;
                    [v40 URL];
                    v43 = (void *)_CFHTTPCookieStorageCopyRequestHeaderFieldsForURL();
                    CFRelease(v42);
                  }
                  else
                  {
                    v44 = [MEMORY[0x263EFC5D8] sharedHTTPCookieStorage];
                    v45 = [v40 URL];
                    v46 = [v44 cookiesForURL:v45];

                    v43 = [MEMORY[0x263EFC5D0] requestHeaderFieldsWithCookies:v46];
                  }
                  if ([v43 count])
                  {
                    v47 = (void *)[v37 mutableCopy];
                    [v47 addEntriesFromDictionary:v43];

                    v37 = v47;
                  }
                }
              }
              v21 = [(id)objc_opt_class() _redactedHeadersFromHeaders:v37];

              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              v48 = [v21 allKeys];
              v49 = [(CoreDAVRequestLogger *)self headerSortDescriptors];
              v50 = [v48 sortedArrayUsingDescriptors:v49];

              uint64_t v51 = [v50 countByEnumeratingWithState:&v75 objects:v83 count:16];
              if (v51)
              {
                uint64_t v52 = v51;
                uint64_t v53 = *(void *)v76;
                do
                {
                  for (uint64_t i = 0; i != v52; ++i)
                  {
                    if (*(void *)v76 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    uint64_t v55 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                    v56 = NSString;
                    v57 = [v21 objectForKey:v55];
                    v58 = [v56 stringWithFormat:@"%@: %@\n", v55, v57];
                    v59 = [v58 dataUsingEncoding:4];
                    [v20 coreDAVLogTransmittedDataPartial:v59];
                  }
                  uint64_t v52 = [v50 countByEnumeratingWithState:&v75 objects:v83 count:16];
                }
                while (v52);
              }

              v60 = [@"\n" dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v60];

              z_stream v10 = v67;
              if (objc_opt_respondsToSelector()) {
                [v20 coreDAVLogRequestBody:v67];
              }
              else {
                [v20 coreDAVLogTransmittedDataPartial:v67];
              }
              self = v69;
              id v6 = v70;
              v9 = v68;
              uint64_t v17 = v73;
              uint64_t v18 = v72;
              v61 = [@"\n" dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v61];

              v62 = [@">>>>>\n" dataUsingEncoding:4];
              [v20 coreDAVLogTransmittedDataPartial:v62];

              [v20 coreDAVTransmittedDataFinished];
              id v15 = v66;
              goto LABEL_51;
            }
            if (objc_opt_respondsToSelector())
            {
              v21 = [v20 logHandle];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v85 = v6;
                _os_log_error_impl(&dword_213BFC000, v21, OS_LOG_TYPE_ERROR, "ERROR: Nil URL for Request %@. Skipping rest of Log", buf, 0xCu);
              }
              goto LABEL_51;
            }
            uint64_t v19 = v74;
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_52;
            }
            [NSString stringWithFormat:@"ERROR: Nil URL for Request %@. Skipping rest of Log", v6, v63];
          v21 = };
          [v20 coreDAVLogDiagnosticMessage:v21 atLevel:3];
LABEL_51:

          uint64_t v19 = v74;
LABEL_52:
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v17);
    }

    int v8 = v64;
  }
}

+ (id)_redactedHeadersFromHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_redactedHeadersFromHeaders__onceToken != -1) {
    dispatch_once(&_redactedHeadersFromHeaders__onceToken, &__block_literal_global_2);
  }
  id v4 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    z_stream v10 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([(id)_redactedHeadersFromHeaders__headersToRedact containsObject:v12])
        {
          if (!v8)
          {
            id v8 = (id)[v4 mutableCopy];

            z_stream v10 = v8;
          }
          [v8 setObject:@"<Redacted>" forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    z_stream v10 = v4;
  }

  return v10;
}

uint64_t __52__CoreDAVRequestLogger__redactedHeadersFromHeaders___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C4C7ED8];
  uint64_t v1 = _redactedHeadersFromHeaders__headersToRedact;
  _redactedHeadersFromHeaders__headersToRedact = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)logCoreDAVResponseHeaders:(id)a3 andStatusCode:(int64_t)a4 withTaskIdentifier:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v46 = a5;
  id v8 = +[CoreDAVLogging sharedLogging];
  v44 = self;
  uint64_t v9 = [v8 delegatesToLogTransmittedDataForAccountInfoProvider:self->_provider];

  if ([v9 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v41 = v9;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v43 = *(void *)v57;
      do
      {
        uint64_t v13 = 0;
        uint64_t v47 = v11;
        do
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v56 + 1) + 8 * v13);
          if ([v14 shouldLogTransmittedData])
          {
            long long v15 = [NSString stringWithFormat:@"\nTask %@\n", v46];
            long long v16 = [v15 dataUsingEncoding:4];
            [v14 coreDAVLogTransmittedDataPartial:v16];

            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFDateRef v18 = CFDateCreate(0, Current);
            if (_logFormater_logPred != -1) {
              dispatch_once(&_logFormater_logPred, &__block_literal_global_108);
            }
            uint64_t v51 = v13;
            if (_logFormater___logFormatter) {
              CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(allocator, (CFDateFormatterRef)_logFormater___logFormatter, v18);
            }
            else {
              CFStringRef StringWithDate = 0;
            }
            v20 = [NSString stringWithFormat:@"\n<<<<< %@\n", StringWithDate];
            v21 = [v20 dataUsingEncoding:4];
            [v14 coreDAVLogTransmittedDataPartial:v21];

            if (StringWithDate) {
              CFRelease(StringWithDate);
            }
            if (v18) {
              CFRelease(v18);
            }
            CDVHTTPStatusCodeAsStatusString(a4);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            id v23 = v22;
            if (v22)
            {
              uint64_t v24 = [(__CFString *)v22 length];
              v25 = @"Unrecognized Status Code";
              if (v24) {
                v25 = v23;
              }
            }
            else
            {
              v25 = @"Unrecognized Status Code";
            }
            v26 = v25;

            v50 = v26;
            v49 = [NSString stringWithFormat:@"HTTP/1.1 %d (%@)\n\n", a4, v26];
            v27 = [v49 dataUsingEncoding:4];
            [v14 coreDAVLogTransmittedDataPartial:v27];

            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            CFDateRef v28 = [v7 allKeys];
            v29 = [(CoreDAVRequestLogger *)v44 headerSortDescriptors];
            v30 = [v28 sortedArrayUsingDescriptors:v29];

            uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v60 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v53 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                  v36 = NSString;
                  v37 = [v7 objectForKey:v35];
                  v38 = [v36 stringWithFormat:@"%@: %@\n", v35, v37];
                  v39 = [v38 dataUsingEncoding:4];
                  [v14 coreDAVLogTransmittedDataPartial:v39];
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v60 count:16];
              }
              while (v32);
            }

            id v40 = [@"\n" dataUsingEncoding:4];
            [v14 coreDAVLogTransmittedDataPartial:v40];

            uint64_t v11 = v47;
            uint64_t v12 = v43;
            uint64_t v13 = v51;
          }
          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v11);
    }

    uint64_t v9 = v41;
  }
}

- (void)logCoreDAVResponseSnippet:(id)a3
{
}

- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4
{
}

- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4 isBody:(BOOL)a5
{
  BOOL v21 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v7;
  if ([v7 length])
  {
    uint64_t v10 = +[CoreDAVLogging sharedLogging];
    uint64_t v11 = [v10 delegatesToLogTransmittedDataForAccountInfoProvider:self->_provider];

    if ([v11 count])
    {
      ++self->_snippetsLogged;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v20 = v11;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v17 shouldLogTransmittedData])
            {
              if (v8)
              {
                CFDateRef v18 = [NSString stringWithFormat:@"\nTask %@\n", v8];
                uint64_t v19 = [v18 dataUsingEncoding:4];
                [v17 coreDAVLogTransmittedDataPartial:v19];
              }
              if (v21 && (objc_opt_respondsToSelector() & 1) != 0) {
                [v17 coreDAVLogResponseBody:v9];
              }
              else {
                [v17 coreDAVLogTransmittedDataPartial:v9];
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }

      uint64_t v11 = v20;
    }
  }
}

- (void)finishCoreDAVResponse
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = +[CoreDAVLogging sharedLogging];
  id v4 = [v3 delegatesToLogTransmittedDataForAccountInfoProvider:self->_provider];

  if ([v4 count] && self->_snippetsLogged)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "shouldLogTransmittedData", (void)v12))
          {
            uint64_t v11 = [@"\n<<<<<\n" dataUsingEncoding:4];
            [v10 coreDAVLogTransmittedDataPartial:v11];

            [v10 coreDAVTransmittedDataFinished];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  self->_snippetsLogged = 0;
}

- (NSArray)headerSortDescriptors
{
  return self->_headerSortDescriptors;
}

- (void)setHeaderSortDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSortDescriptors, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
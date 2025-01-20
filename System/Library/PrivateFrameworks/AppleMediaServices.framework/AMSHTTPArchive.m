@interface AMSHTTPArchive
+ (BOOL)supportsSecureCoding;
+ (NSString)directory;
+ (double)_timeIntervalFromFilename:(id)a3;
+ (id)_createJSONObjectForEntries:(id)a3;
+ (id)_createJSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
+ (id)ams_dateFormatterForTimeZone:(id)a3;
+ (id)ams_generateCommentsStringForMetrics:(id)a3;
+ (id)ams_generateContentDictionaryForResponse:(id)a3 responseData:(id)a4;
+ (id)ams_generateHeadersArrayForHTTPHeaders:(id)a3;
+ (id)ams_generateRequestDictionaryForMetrics:(id)a3 requestData:(id)a4;
+ (id)ams_generateResponseDictionaryForMetrics:(id)a3 responseData:(id)a4;
+ (id)merge:(id)a3;
+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4;
+ (void)removeHTTPArchiveFilesOlderThanDate:(id)a3;
- (AMSHTTPArchive)initWithCoder:(id)a3;
- (AMSHTTPArchive)initWithHTTPArchiveTaskInfo:(id)a3;
- (AMSHTTPArchive)initWithJSONObject:(id)a3;
- (AMSHTTPArchive)initWithMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
- (BOOL)isCompressed;
- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4;
- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4 appendCombined:(BOOL)a5;
- (NSData)JSONData;
- (NSData)backingJSONData;
- (NSString)urlString;
- (void)encodeWithCoder:(id)a3;
- (void)logHARData;
- (void)setBackingJSONData:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setUrlString:(id)a3;
@end

@implementation AMSHTTPArchive

id __57__AMSHTTPArchive_ams_generateHeadersArrayForHTTPHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"name";
  v9[1] = @"value";
  v10[0] = a2;
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)ams_generateResponseDictionaryForMetrics:(id)a3 responseData:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 response];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
    goto LABEL_10;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_10:
    v24 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_11;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = [v9 allHeaderFields];
  v26 = [v11 objectForKeyedSubscript:@"Content-Length"];

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v26, "integerValue"));
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = &unk_1EDD01330;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, @"bodySize", v26);

  v15 = objc_msgSend(a1, "ams_generateContentDictionaryForResponse:responseData:", v9, v7);
  [v10 setObject:v15 forKeyedSubscript:@"content"];

  v16 = [v9 allHeaderFields];
  v17 = objc_msgSend(a1, "ams_generateHeadersArrayForHTTPHeaders:", v16);
  v18 = (void *)[v17 mutableCopy];

  v28[0] = @"name";
  v28[1] = @"value";
  v29[0] = @"X-Apple-Connection-Reused";
  uint64_t v19 = [v6 resourceFetchType];
  v20 = @"false";
  if (v19 == 3) {
    v20 = @"true";
  }
  v29[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v18 addObject:v21];

  [v10 setObject:v18 forKeyedSubscript:@"headers"];
  [v10 setObject:&unk_1EDD01330 forKeyedSubscript:@"headersSize"];
  [v10 setObject:@"HTTP/1.1" forKeyedSubscript:@"httpVersion"];
  v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
  [v10 setObject:v22 forKeyedSubscript:@"status"];

  v23 = objc_msgSend(MEMORY[0x1E4F18D40], "localizedStringForStatusCode:", objc_msgSend(v9, "statusCode"));
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v23, @"statusText");

  v24 = (void *)[v10 copy];
LABEL_11:

  return v24;
}

+ (id)ams_dateFormatterForTimeZone:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_112 != -1) {
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_64);
  }
  v4 = (void *)qword_1EB38D958;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke_2;
  v9[3] = &unk_1E55A3398;
  id v10 = v3;
  id v5 = v3;
  id v6 = v4;
  id v7 = [v6 objectForKey:v5 withCreationBlock:v9];

  return v7;
}

+ (id)ams_generateContentDictionaryForResponse:(id)a3 responseData:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v7, "expectedContentLength"));
    [v8 setObject:v9 forKeyedSubscript:@"bodySize"];

    id v10 = [v7 MIMEType];

    objc_msgSend(v8, "ams_setNullableObject:forKey:", v10, @"mimeType");
    v11 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    if (+[AMSDefaults includeFullResponseInHARLogging]
      || +[AMSDefaults QAMode])
    {
      unint64_t v12 = -1;
    }
    else if (+[AMSDefaults logHARData])
    {
      unint64_t v12 = -1;
    }
    else
    {
      unint64_t v12 = 40000;
    }
    if ([v11 length] && objc_msgSend(v5, "length") > v12)
    {
      double v13 = (double)(unint64_t)[v11 length];
      unint64_t v14 = (unint64_t)(v13 / (double)(unint64_t)[v5 length] * 40000.0);
      if ([v11 length] <= v14)
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = [v11 substringToIndex:v14];
      }

      v11 = (void *)v15;
    }
    if ([v11 length]) {
      [v8 setObject:v11 forKeyedSubscript:@"text"];
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

+ (id)ams_generateRequestDictionaryForMetrics:(id)a3 requestData:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 request];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  [v8 setObject:v9 forKeyedSubscript:@"bodySize"];

  [v8 setObject:&unk_1EDD01330 forKeyedSubscript:@"headersSize"];
  [v8 setObject:@"HTTP/1.1" forKeyedSubscript:@"httpVersion"];
  id v10 = [v7 allHTTPHeaderFields];
  v11 = objc_msgSend(a1, "ams_generateHeadersArrayForHTTPHeaders:", v10);
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v11, @"headers");

  unint64_t v12 = [v7 HTTPMethod];
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v12, @"method");

  double v13 = [v7 URL];
  unint64_t v14 = [v13 absoluteString];
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v14, @"url");

  if (+[AMSDefaults includeFullRequestInHARLogging]
    || +[AMSDefaults QAMode])
  {
    [v6 length];
  }
  else
  {
    BOOL v34 = +[AMSDefaults logHARData];
    unint64_t v35 = [v6 length];
    if (!v34 && v35 >= 0x9C41)
    {

      id v6 = 0;
    }
  }
  uint64_t v15 = objc_msgSend(v6, "ams_decompressedData");
  v16 = v15;
  if (v15)
  {
    id v17 = v15;

    id v6 = v17;
  }
  v18 = [v7 URL];
  uint64_t v19 = [v18 absoluteString];
  int v20 = [v19 containsString:@"/WebObjects/MZFinance.woa/wa/authenticate"];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:1 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [v21 objectForKeyedSubscript:@"password"];

      if (v22)
      {
        [v21 setObject:@"******" forKeyedSubscript:@"password"];
        uint64_t v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v21 format:100 options:0 error:0];

        id v6 = (id)v23;
      }
    }
LABEL_18:

    if (v6)
    {
LABEL_19:
      uint64_t v29 = [[NSString alloc] initWithData:v6 encoding:4];
      v30 = (void *)v29;
      if (v29) {
        v31 = (__CFString *)v29;
      }
      else {
        v31 = &stru_1EDCA7308;
      }
      v36 = @"text";
      v37 = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v8 setObject:v32 forKeyedSubscript:@"postData"];

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v21 = [v7 valueForHTTPHeaderField:@"Content-Type"];
  int v24 = [v21 isEqualToString:@"application/x-apple-plist"];
  if (!v16 || !v24) {
    goto LABEL_18;
  }

  if (v6)
  {
    v25 = [v6 base64EncodedStringWithOptions:0];
    if ([(__CFString *)v25 hasPrefix:@"YnBsaX"])
    {
      if (v25) {
        v26 = v25;
      }
      else {
        v26 = &stru_1EDCA7308;
      }
      v38 = @"text";
      v39[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      [v8 setObject:v27 forKeyedSubscript:@"postData"];

      v28 = (void *)[v8 copy];
      goto LABEL_24;
    }

    goto LABEL_19;
  }
LABEL_23:
  v28 = (void *)[v8 copy];
LABEL_24:

  return v28;
}

+ (id)ams_generateHeadersArrayForHTTPHeaders:(id)a3
{
  return (id)objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_88_1);
}

+ (id)ams_generateCommentsStringForMetrics:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "_apsRelayAttempted"));
  [v5 setObject:v6 forKeyedSubscript:@"APS-Attempted"];

  id v7 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = [v4 _apsRelaySucceeded];

  id v9 = [v7 numberWithBool:v8];
  [v5 setObject:v9 forKeyedSubscript:@"APS-Succeeded"];

  id v10 = +[AMSDevice localIPAddress];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v10, @"clientIPAddress");

  v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:0];
  if (v11) {
    unint64_t v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else {
    unint64_t v12 = 0;
  }

  return v12;
}

- (AMSHTTPArchive)initWithHTTPArchiveTaskInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metrics];
  id v6 = [v4 HTTPBody];
  id v7 = [v4 responseData];
  uint64_t v8 = +[AMSHTTPArchive _createJSONObjectForTaskMetrics:v5 requestData:v6 responseData:v7];

  id v9 = [v4 metrics];

  id v10 = [v9 transactionMetrics];
  v11 = [v10 firstObject];
  unint64_t v12 = [v11 request];
  double v13 = [v12 URL];
  unint64_t v14 = [v13 absoluteString];
  urlString = self->_urlString;
  self->_urlString = v14;

  v16 = [(AMSHTTPArchive *)self initWithJSONObject:v8];
  return v16;
}

- (AMSHTTPArchive)initWithMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v6 = +[AMSHTTPArchive _createJSONObjectForTaskMetrics:a3 requestData:a4 responseData:a5];
  id v7 = [(AMSHTTPArchive *)self initWithJSONObject:v6];

  return v7;
}

- (AMSHTTPArchive)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSHTTPArchive;
  id v5 = [(AMSHTTPArchive *)&v12 init];
  if (v5)
  {
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v4])
    {
      id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:0];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = objc_msgSend(v6, "ams_compressedData");
    uint64_t v8 = (void *)v7;
    BOOL v9 = v7 != 0;
    if (v7) {
      id v10 = (void *)v7;
    }
    else {
      id v10 = v6;
    }
    objc_storeStrong((id *)&v5->_backingJSONData, v10);
    v5->_compressed = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSHTTPArchive *)self urlString];
  [v4 encodeObject:v5 forKey:@"kCodingKeyUrlString"];

  id v6 = [(AMSHTTPArchive *)self backingJSONData];
  [v4 encodeObject:v6 forKey:@"kCodingKeyBackingJSONData"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSHTTPArchive isCompressed](self, "isCompressed"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"kCodingKeyCompressed"];
}

- (AMSHTTPArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSHTTPArchive;
  id v5 = [(AMSHTTPArchive *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyUrlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyBackingJSONData"];
    backingJSONData = v5->_backingJSONData;
    v5->_backingJSONData = (NSData *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyCompressed"];
    v5->_compressed = [v10 BOOLValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)directory
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CPSharedResourcesDirectory();
  id v3 = (void *)v2;
  if (v2)
  {
    id v4 = NSString;
    v8[0] = v2;
    v8[1] = @"Library";
    v8[2] = @"Logs";
    v8[3] = @"com.apple.StoreServices";
    v8[4] = @"HTTPArchives";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
    uint64_t v6 = [v4 pathWithComponents:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (void)logHARData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSHTTPArchive *)self backingJSONData];
  if ([(AMSHTTPArchive *)self isCompressed])
  {
    uint64_t v4 = objc_msgSend(v3, "ams_decompressedData");

    id v3 = (void *)v4;
  }
  id v5 = objc_msgSend(v3, "ams_compressWithAlgorithm:", 0);

  uint64_t v6 = [v5 base64EncodedStringWithOptions:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while ([v6 length])
  {
    id v8 = v6;
    if ((unint64_t)[v8 length] < 0x2711)
    {
      uint64_t v6 = 0;
      BOOL v9 = v8;
    }
    else
    {
      BOOL v9 = [v8 substringToIndex:10000];

      uint64_t v6 = [v8 substringFromIndex:10000];
    }

    [v7 addObject:v9];
  }
  id v10 = AMSGenerateLogCorrelationKey();
  if ([v7 count])
  {
    unint64_t v11 = 0;
    do
    {
      objc_super v12 = [v7 objectAtIndexedSubscript:v11];
      double v13 = +[AMSLogConfig sharedConfigOversize];
      if (!v13)
      {
        double v13 = +[AMSLogConfig sharedConfig];
      }
      unint64_t v14 = [v13 OSLogObject];
      ++v11;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v7 count];
        *(_DWORD *)buf = 138413058;
        id v17 = v10;
        __int16 v18 = 1024;
        int v19 = v11;
        __int16 v20 = 1024;
        int v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "HARData: %@ %d/%d %@", buf, 0x22u);
      }
    }
    while ([v7 count] > v11);
  }
}

+ (id)merge:(id)a3
{
  id v3 = [a1 merge:a3 withEstimatedFileSizeLimit:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    unint64_t v10 = 1000 * a4;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v14 = (void *)MEMORY[0x192FA47D0]();
        int v15 = [v13 isCompressed];
        v16 = [v13 backingJSONData];
        id v17 = v16;
        if (v15)
        {
          uint64_t v18 = objc_msgSend(v16, "ams_decompressedData");

          id v17 = (void *)v18;
        }
        if (v17)
        {
          BOOL v34 = v14;
          int v19 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:0];
          __int16 v20 = [v19 objectForKeyedSubscript:@"log"];
          int v21 = [v20 objectForKeyedSubscript:@"entries"];

          if (v21) {
            [v6 addObjectsFromArray:v21];
          }
          v9 += [v17 length];
          if (v9 > v10)
          {
            v33 = +[AMSHTTPArchive _createJSONObjectForEntries:v6];
            uint64_t v22 = v11;
            unint64_t v23 = v9;
            uint64_t v24 = v8;
            unint64_t v25 = v10;
            id v26 = v6;
            v27 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJSONObject:v33];
            [v31 addObject:v27];

            id v6 = v26;
            unint64_t v10 = v25;
            uint64_t v8 = v24;
            unint64_t v9 = v23;
            uint64_t v11 = v22;
            [v6 removeAllObjects];
          }
          unint64_t v14 = v34;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v28 = +[AMSHTTPArchive _createJSONObjectForEntries:v6];
    uint64_t v29 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJSONObject:v28];
    [v31 addObject:v29];
  }
  return v31;
}

+ (void)removeHTTPArchiveFilesOlderThanDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 directory];
  [v4 timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v9 = [a1 directory];
  unint64_t v10 = [v8 enumeratorAtPath:v9];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v17 = (void *)MEMORY[0x192FA47D0]();
        [a1 _timeIntervalFromFilename:v16];
        if (v18 != 1.79769313e308 && v18 <= v7)
        {
          __int16 v20 = [v5 stringByAppendingPathComponent:v16];
          int v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v21 removeItemAtPath:v20 error:0];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4
{
  return [(AMSHTTPArchive *)self writeToDiskWithError:a3 compressed:a4 appendCombined:0];
}

- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4 appendCombined:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(id)objc_opt_class() directory];
  unint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    id v11 = 0;
LABEL_5:
    BOOL v15 = [(AMSHTTPArchive *)self isCompressed];
    uint64_t v16 = &stru_1EDCA7308;
    if (v5) {
      uint64_t v16 = @"_combined_ams";
    }
    id v17 = v16;
    double v18 = @".har";
    BOOL v49 = v15 && v6;
    if (v15 && v6) {
      double v18 = @".har.compressed";
    }
    int v19 = NSString;
    __int16 v20 = v18;
    int v21 = +[AMSProcessInfo currentProcess];
    long long v22 = [v21 bundleIdentifier];
    long long v23 = [MEMORY[0x1E4F1C9C8] date];
    [v23 timeIntervalSinceReferenceDate];
    v51 = v17;
    long long v25 = [v19 stringWithFormat:@"%@_%f%@%@", v22, v24, v17, v20];

    id v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v27 = [v26 URLByAppendingPathComponent:v25];

    v28 = +[AMSLogConfig sharedConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      id v31 = AMSLogKey();
      AMSLogableURL(v27);
      v33 = v32 = v8;
      *(_DWORD *)buf = 138543874;
      uint64_t v56 = v30;
      __int16 v57 = 2114;
      id v58 = v31;
      __int16 v59 = 2114;
      id v60 = v33;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing HAR to fileURL: %{public}@", buf, 0x20u);

      uint64_t v8 = v32;
    }

    BOOL v34 = [(AMSHTTPArchive *)self backingJSONData];
    long long v35 = v34;
    if (!v49)
    {
      uint64_t v36 = objc_msgSend(v34, "ams_decompressedData");

      long long v35 = (void *)v36;
    }
    id v53 = v11;
    char v37 = [v35 writeToURL:v27 options:1 error:&v53];
    id v14 = v53;

    if ((v37 & 1) == 0)
    {
      long long v38 = v8;
      v39 = +[AMSLogConfig sharedConfig];
      if (!v39)
      {
        v39 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v40 = [v39 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = objc_opt_class();
        id v50 = v41;
        AMSLogKey();
        v43 = v42 = v25;
        *(_DWORD *)buf = 138543874;
        uint64_t v56 = (uint64_t)v41;
        __int16 v57 = 2114;
        id v58 = v43;
        __int16 v59 = 2114;
        id v60 = v14;
        _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to write a HAR object to disk. error = %{public}@", buf, 0x20u);

        long long v25 = v42;
      }

      uint64_t v8 = v38;
    }
    if (a3) {
      *a3 = v14;
    }

    goto LABEL_24;
  }
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v54 = 0;
  char v13 = [v12 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v54];
  id v14 = v54;

  if (v13)
  {
    id v11 = v14;
    goto LABEL_5;
  }
  v45 = +[AMSLogConfig sharedConfig];
  if (!v45)
  {
    v45 = +[AMSLogConfig sharedConfig];
  }
  v46 = [v45 OSLogObject];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v47 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v56 = (uint64_t)v47;
    __int16 v57 = 2114;
    id v58 = v14;
    id v48 = v47;
    _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create the directory to write HAR files into. error = %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    id v14 = v14;
    char v37 = 0;
    *a3 = v14;
  }
  else
  {
    char v37 = 0;
  }
LABEL_24:

  return v37;
}

uint64_t __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke()
{
  qword_1EB38D958 = [[AMSLRUCache alloc] initWithMaxSize:2];
  return MEMORY[0x1F41817F8]();
}

id __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"uuuu-MM-dd'T'HH:mm:ss.sXXX"];
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setTimeZone:*(void *)(a1 + 32)];
  return v2;
}

+ (id)_createJSONObjectForEntries:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[AMSMappedBundleInfo currentBundleInfo];
  v20[0] = @"name";
  uint64_t v5 = [v4 clientName];
  BOOL v6 = (void *)v5;
  double v7 = @"AppleMediaServices";
  if (v5) {
    double v7 = (__CFString *)v5;
  }
  v20[1] = @"version";
  v21[0] = v7;
  uint64_t v8 = [v4 clientVersion];
  unint64_t v9 = (void *)v8;
  char v10 = @"1.0";
  if (v8) {
    char v10 = (__CFString *)v8;
  }
  v21[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  double v18 = @"log";
  v16[0] = @"creator";
  v16[1] = @"entries";
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v12 = v3;
  }
  v17[0] = v11;
  v17[1] = v12;
  v16[2] = @"version";
  v17[2] = @"1.2";
  char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  int v19 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  return v14;
}

+ (id)_createJSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v10 = [a3 transactionMetrics];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__AMSHTTPArchive__createJSONObjectForTaskMetrics_requestData_responseData___block_invoke;
  void v16[3] = &unk_1E55A33E0;
  id v18 = v9;
  id v19 = a1;
  id v17 = v8;
  id v11 = v9;
  id v12 = v8;
  char v13 = objc_msgSend(v10, "ams_mapWithTransform:", v16);

  id v14 = [a1 _createJSONObjectForEntries:v13];

  return v14;
}

id __75__AMSHTTPArchive__createJSONObjectForTaskMetrics_requestData_responseData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = objc_msgSend(*(id *)(a1 + 48), "ams_generateCommentsStringForMetrics:", v4);
  [v5 setObject:v6 forKeyedSubscript:@"comment"];

  double v7 = objc_msgSend(*(id *)(a1 + 48), "ams_generateRequestDictionaryForMetrics:requestData:", v4, *(void *)(a1 + 32));
  [v5 setObject:v7 forKeyedSubscript:@"request"];

  id v8 = objc_msgSend(*(id *)(a1 + 48), "ams_generateResponseDictionaryForMetrics:responseData:", v4, *(void *)(a1 + 40));
  [v5 setObject:v8 forKeyedSubscript:@"response"];

  id v9 = (void *)MEMORY[0x1E4F28ED0];
  char v10 = [v4 responseEndDate];
  id v11 = [v4 requestStartDate];
  [v10 timeIntervalSinceDate:v11];
  char v13 = [v9 numberWithDouble:v12 * 1000.0];
  [v5 setObject:v13 forKeyedSubscript:@"time"];

  id v14 = *(void **)(a1 + 48);
  BOOL v15 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v16 = objc_msgSend(v14, "ams_dateFormatterForTimeZone:", v15);
  id v17 = [v4 fetchStartDate];

  id v18 = [v16 stringFromDate:v17];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v18, @"startedDateTime");

  id v19 = (void *)[v5 copy];
  return v19;
}

+ (double)_timeIntervalFromFilename:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@".har"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"_streamwrite.har" withString:&stru_1EDCA7308];

    id v5 = [v4 stringByReplacingOccurrencesOfString:@".har.compressed" withString:&stru_1EDCA7308];

    id v3 = [v5 stringByReplacingOccurrencesOfString:@".har" withString:&stru_1EDCA7308];

    BOOL v6 = [v3 componentsSeparatedByString:@"_"];
    if ([v6 count] == 2)
    {
      double v7 = [v6 objectAtIndexedSubscript:1];
      id v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
      double v11 = 0.0;
      if ([v8 scanDouble:&v11]) {
        double v9 = v11;
      }
      else {
        double v9 = 1.79769313e308;
      }
    }
    else
    {
      double v9 = 1.79769313e308;
    }
  }
  else
  {
    double v9 = 1.79769313e308;
  }

  return v9;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSData)backingJSONData
{
  return self->_backingJSONData;
}

- (void)setBackingJSONData:(id)a3
{
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (NSData)JSONData
{
  return self->_JSONData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONData, 0);
  objc_storeStrong((id *)&self->_backingJSONData, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
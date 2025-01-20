@interface AMSStreamHTTPArchiveEntry
+ (BOOL)supportsSecureCoding;
+ (id)_createEntriesForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
- (AMSStreamHTTPArchiveEntry)initWithCoder:(id)a3;
- (AMSStreamHTTPArchiveEntry)initWithEntries:(id)a3;
- (AMSStreamHTTPArchiveEntry)initWithHTTPArchiveTaskInfo:(id)a3;
- (NSArray)entries;
- (NSString)urlString;
- (void)encodeWithCoder:(id)a3;
- (void)setEntries:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation AMSStreamHTTPArchiveEntry

+ (id)_createEntriesForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  id v32 = a5;
  v31 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v7 transactionMetrics];
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x192FA47D0]();
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v15 = +[AMSHTTPArchive ams_generateCommentsStringForMetrics:v12];
        [v14 setObject:v15 forKeyedSubscript:@"comment"];

        v16 = +[AMSHTTPArchive ams_generateRequestDictionaryForMetrics:v12 requestData:v33];
        [v14 setObject:v16 forKeyedSubscript:@"request"];

        v17 = +[AMSHTTPArchive ams_generateResponseDictionaryForMetrics:v12 responseData:v32];
        [v14 setObject:v17 forKeyedSubscript:@"response"];

        v18 = (void *)MEMORY[0x1E4F28ED0];
        v19 = [v12 responseEndDate];
        v20 = [v12 requestStartDate];
        [v19 timeIntervalSinceDate:v20];
        v22 = [v18 numberWithDouble:v21 * 1000.0];
        [v14 setObject:v22 forKeyedSubscript:@"time"];

        v23 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
        v24 = +[AMSHTTPArchive ams_dateFormatterForTimeZone:v23];
        v25 = [v12 fetchStartDate];
        v26 = [v24 stringFromDate:v25];
        objc_msgSend(v14, "ams_setNullableObject:forKey:", v26, @"startedDateTime");

        v27 = (void *)[v14 copy];
        [v31 addObject:v27];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }

  v28 = (void *)[v31 copy];
  return v28;
}

- (AMSStreamHTTPArchiveEntry)initWithEntries:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSStreamHTTPArchiveEntry;
  v5 = [(AMSStreamHTTPArchiveEntry *)&v25 init];
  if (v5)
  {
    v6 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x192FA47D0]();
          if ([MEMORY[0x1E4F28D90] isValidJSONObject:v12])
          {
            id v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:0 error:0];
            if (v14)
            {
              v15 = v14;
              v16 = objc_msgSend(v14, "ams_compressedData");
              if (v16) {
                [v6 addObject:v16];
              }
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v17 = [v6 copy];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v17;

    id v4 = v20;
  }

  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (AMSStreamHTTPArchiveEntry)initWithHTTPArchiveTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 metrics];
  v6 = [v4 HTTPBody];
  id v7 = [v4 responseData];
  uint64_t v8 = +[AMSStreamHTTPArchiveEntry _createEntriesForTaskMetrics:v5 requestData:v6 responseData:v7];

  uint64_t v9 = [v4 metrics];

  uint64_t v10 = [v9 transactionMetrics];
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 request];
  v13 = [v12 URL];
  id v14 = [v13 absoluteString];
  urlString = self->_urlString;
  self->_urlString = v14;

  v16 = [(AMSStreamHTTPArchiveEntry *)self initWithEntries:v8];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSStreamHTTPArchiveEntry *)self urlString];
  [v4 encodeObject:v5 forKey:@"kCodingKeyUrlString"];

  id v6 = [(AMSStreamHTTPArchiveEntry *)self entries];
  [v4 encodeObject:v6 forKey:@"kCodingKeyEntries"];
}

- (AMSStreamHTTPArchiveEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSStreamHTTPArchiveEntry;
  v5 = [(AMSStreamHTTPArchiveEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyUrlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyEntries"];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void)setUrlString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
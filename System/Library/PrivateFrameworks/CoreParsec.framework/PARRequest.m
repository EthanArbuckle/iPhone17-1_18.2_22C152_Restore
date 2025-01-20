@interface PARRequest
+ (BOOL)supportsSecureCoding;
+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4;
+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5;
+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 timeout:(double)a5 queryId:(unint64_t)a6;
+ (id)cardRequestWithURL:(id)a3;
+ (id)cardRequestWithURL:(id)a3 queryId:(unint64_t)a4;
+ (id)flightRequestForQuery:(id)a3 date:(id)a4 appBundleId:(id)a5;
+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7;
+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7 queryId:(unint64_t)a8;
+ (id)moreResultsRequestWithURL:(id)a3;
+ (id)moreResultsRequestWithURL:(id)a3 queryId:(unint64_t)a4;
+ (id)prefetchRequestForUrl:(id)a3;
+ (id)prefetchRequestForUrl:(id)a3 locale:(id)a4;
+ (id)prefetchRequestForUrls:(id)a3 locale:(id)a4;
+ (id)searchReplayRequestWithString:(id)a3;
+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5;
+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5 queryString:(id)a6;
+ (id)searchRequestWithEngagedSuggestion:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5;
+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4;
+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5;
+ (id)summarizeRequestForUrl:(id)a3;
+ (id)summarizeRequestForUrl:(id)a3 locale:(id)a4;
+ (id)zeroKeywordRequest;
+ (id)zeroKeywordRequest:(unint64_t)a3;
- (BOOL)isClientOnlyExperiment;
- (BOOL)isInReservedAllocationForExperiment;
- (BOOL)pretend;
- (BOOL)verboseReply;
- (Class)responseClass;
- (NSArray)queryItems;
- (NSDictionary)headerItems;
- (NSString)clientShortName;
- (NSString)experimentId;
- (NSString)experimentNamespaceId;
- (NSString)keyboardInputMode;
- (NSString)treatmentId;
- (OS_nw_activity)nwActivity;
- (PARRequest)initWithCoder:(id)a3;
- (SFCommand)queryCommand;
- (char)nwActivityToken;
- (double)scale;
- (unint64_t)clientQueryId;
- (unint64_t)queryId;
- (unint64_t)triggerEvent;
- (unsigned)nwActivityLabel;
- (void)beginNWActivity;
- (void)encodeWithCoder:(id)a3;
- (void)setClientShortName:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentNamespaceId:(id)a3;
- (void)setHeaderItems:(id)a3;
- (void)setIsClientOnlyExperiment:(BOOL)a3;
- (void)setIsInReservedAllocationForExperiment:(BOOL)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setNwActivity:(id)a3;
- (void)setPretend:(BOOL)a3;
- (void)setQueryCommand:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setQueryItems:(id)a3;
- (void)setScale:(double)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
- (void)setVerboseReply:(BOOL)a3;
@end

@implementation PARRequest

- (void)beginNWActivity
{
  v2 = self;
  PARRequest.beginNWActivity()();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivity, 0);
  objc_storeStrong((id *)&self->_queryCommand, 0);
  objc_storeStrong((id *)&self->_headerItems, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_clientShortName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);

  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
}

- (char)nwActivityToken
{
  return self->_nwActivityToken;
}

- (void)setNwActivity:(id)a3
{
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void)setQueryCommand:(id)a3
{
}

- (SFCommand)queryCommand
{
  return self->_queryCommand;
}

- (void)setHeaderItems:(id)a3
{
}

- (NSDictionary)headerItems
{
  return self->_headerItems;
}

- (void)setQueryItems:(id)a3
{
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setPretend:(BOOL)a3
{
  self->_pretend = a3;
}

- (BOOL)pretend
{
  return self->_pretend;
}

- (void)setVerboseReply:(BOOL)a3
{
  self->_verboseReply = a3;
}

- (BOOL)verboseReply
{
  return self->_verboseReply;
}

- (void)setClientShortName:(id)a3
{
}

- (NSString)clientShortName
{
  return self->_clientShortName;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setIsInReservedAllocationForExperiment:(BOOL)a3
{
  self->_isInReservedAllocationForExperiment = a3;
}

- (BOOL)isInReservedAllocationForExperiment
{
  return self->_isInReservedAllocationForExperiment;
}

- (void)setIsClientOnlyExperiment:(BOOL)a3
{
  self->_isClientOnlyExperiment = a3;
}

- (BOOL)isClientOnlyExperiment
{
  return self->_isClientOnlyExperiment;
}

- (void)setExperimentNamespaceId:(id)a3
{
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setKeyboardInputMode:(id)a3
{
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (unsigned)nwActivityLabel
{
  return 0;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)clientQueryId
{
  return self->_queryId;
}

- (PARRequest)initWithCoder:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PARRequest;
  v5 = [(PARRequest *)&v31 init];
  if (v5)
  {
    v5->_queryId = [v4 decodeInt64ForKey:@"queryId"];
    [v4 decodeDoubleForKey:@"scale"];
    v5->_scale = v6;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"queryItems"];
    queryItems = v5->_queryItems;
    v5->_queryItems = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"headerItems"];
    headerItems = v5->_headerItems;
    v5->_headerItems = (NSDictionary *)v15;

    v5->_verboseReply = [v4 decodeBoolForKey:@"verboseReply"];
    v5->_triggerEvent = [v4 decodeIntegerForKey:@"triggerEvent"];
    v5->_pretend = [v4 decodeBoolForKey:@"_pretend"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyboardInputMode"];
    keyboardInputMode = v5->_keyboardInputMode;
    v5->_keyboardInputMode = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentNamespaceId"];
    experimentNamespaceId = v5->_experimentNamespaceId;
    v5->_experimentNamespaceId = (NSString *)v19;

    v5->_isClientOnlyExperiment = [v4 decodeBoolForKey:@"isClientOnlyExperiment"];
    v5->_isInReservedAllocationForExperiment = [v4 decodeBoolForKey:@"isInReservedAllocationForExperiment"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
    experimentId = v5->_experimentId;
    v5->_experimentId = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentId"];
    treatmentId = v5->_treatmentId;
    v5->_treatmentId = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryCommand"];
    queryCommand = v5->_queryCommand;
    v5->_queryCommand = (SFCommand *)v25;

    uint64_t v30 = 0;
    [v4 decodeBytesForKey:@"_nwActivityToken" returnedLength:&v30];
    if (v30 == 16)
    {
      uint64_t v27 = nw_activity_create_from_token();
      nwActivity = v5->_nwActivity;
      v5->_nwActivity = (OS_nw_activity *)v27;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeInt64:self->_queryId forKey:@"queryId"];
  [v4 encodeDouble:@"scale" forKey:self->_scale];
  [v4 encodeObject:self->_queryItems forKey:@"queryItems"];
  [v4 encodeObject:self->_headerItems forKey:@"headerItems"];
  [v4 encodeBool:self->_verboseReply forKey:@"verboseReply"];
  [v4 encodeInteger:self->_triggerEvent forKey:@"triggerEvent"];
  [v4 encodeBool:self->_pretend forKey:@"_pretend"];
  [v4 encodeObject:self->_keyboardInputMode forKey:@"_keyboardInputMode"];
  [v4 encodeObject:self->_experimentNamespaceId forKey:@"experimentNamespaceId"];
  [v4 encodeBool:self->_isClientOnlyExperiment forKey:@"isClientOnlyExperiment"];
  [v4 encodeBool:self->_isInReservedAllocationForExperiment forKey:@"isInReservedAllocationForExperiment"];
  [v4 encodeObject:self->_experimentId forKey:@"experimentId"];
  [v4 encodeObject:self->_treatmentId forKey:@"treatmentId"];
  [v4 encodeObject:self->_queryCommand forKey:@"queryCommand"];
  if (self->_nwActivity)
  {
    *(void *)uu = 0;
    uint64_t v6 = 0;
    nw_activity_get_token();
    if (!uuid_is_null(uu)) {
      [v4 encodeBytes:uu length:16 forKey:@"_nwActivityToken"];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)summarizeRequestForUrl:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PARSafariSummarizationSummarizeRequest);
  v5 = v4;
  if (v4) {
    [(PARSafariSummarizationSummarizeRequest *)v4 setUrlString:v3];
  }

  return v5;
}

+ (id)summarizeRequestForUrl:(id)a3 locale:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PARRequest summarizeRequestForUrl:a3];
  uint64_t v7 = v6;
  if (v6) {
    [v6 setLocaleString:v5];
  }

  return v7;
}

+ (id)prefetchRequestForUrl:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PARSafariSummarizationPrefetchRequest);
  id v5 = v4;
  if (v4) {
    [(PARSafariSummarizationPrefetchRequest *)v4 setUrlString:v3];
  }

  return v5;
}

+ (id)prefetchRequestForUrl:(id)a3 locale:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PARRequest prefetchRequestForUrl:a3];
  uint64_t v7 = v6;
  if (v6) {
    [v6 setLocaleString:v5];
  }

  return v7;
}

+ (id)prefetchRequestForUrls:(id)a3 locale:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 firstObject];
  uint64_t v7 = +[PARRequest prefetchRequestForUrl:v6 locale:v5];

  return v7;
}

+ (id)flightRequestForQuery:(id)a3 date:(id)a4 appBundleId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(PARFlightSearchRequest);
  if (v10)
  {
    v11 = (void *)[v7 copy];
    [(PARFlightSearchRequest *)v10 setFlightQuery:v11];

    v12 = (void *)[v8 copy];
    [(PARFlightSearchRequest *)v10 setDate:v12];

    v13 = (void *)[v9 copy];
    [(PARFlightSearchRequest *)v10 setAppBundleId:v13];

    [(PARRequest *)v10 setTriggerEvent:0];
  }

  return v10;
}

+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7 queryId:(unint64_t)a8
{
  id v9 = [a1 lookupRequestWithString:a3 queryContext:a4 domain:a5 lookupSelectionType:a6 appBundleId:a7];
  uint64_t v10 = v9;
  if (v9) {
    [v9 setQueryId:a8];
  }

  return v10;
}

+ (id)lookupRequestWithString:(id)a3 queryContext:(id)a4 domain:(id)a5 lookupSelectionType:(int64_t)a6 appBundleId:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = objc_alloc_init(PARLookupRequest);
  if (v15)
  {
    v16 = (void *)[v11 copy];
    [(PARLookupRequest *)v15 setQueryString:v16];

    uint64_t v17 = (void *)[v12 copy];
    [(PARLookupRequest *)v15 setQueryContext:v17];

    v18 = (void *)[v13 copy];
    [(PARLookupRequest *)v15 setDomain:v18];

    [(PARLookupRequest *)v15 setLookupSelectionType:a6];
    uint64_t v19 = (void *)[v14 copy];
    [(PARLookupRequest *)v15 setAppBundleId:v19];

    [(PARRequest *)v15 setTriggerEvent:11];
  }

  return v15;
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 timeout:(double)a5 queryId:(unint64_t)a6
{
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(PARTopicRequest);
  [(PARRequest *)v10 setTriggerEvent:a4];
  [(PARTopicRequest *)v10 setTopics:v9];

  [(PARRequest *)v10 setQueryId:a6];
  [(PARTopicRequest *)v10 setTimeoutIntervalForRequest:a5];

  return (PARRequest *)v10;
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  return (PARRequest *)[a1 requestWithTopics:a3 triggerEvent:a4 timeout:a5 queryId:0.0];
}

+ (PARRequest)requestWithTopics:(id)a3 triggerEvent:(unint64_t)a4
{
  return (PARRequest *)[a1 requestWithTopics:a3 triggerEvent:a4 queryId:0];
}

+ (id)zeroKeywordRequest:(unint64_t)a3
{
  id v4 = [a1 zeroKeywordRequest];
  id v5 = v4;
  if (v4) {
    [v4 setQueryId:a3];
  }

  return v5;
}

+ (id)zeroKeywordRequest
{
  v2 = objc_alloc_init(PARZeroKeywordRequest);
  [(PARRequest *)v2 setTriggerEvent:9];

  return v2;
}

+ (id)cardRequestWithURL:(id)a3 queryId:(unint64_t)a4
{
  id v5 = [a1 cardRequestWithURL:a3];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setQueryId:a4];
  }

  return v6;
}

+ (id)cardRequestWithURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PARCardRequest);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      [(PARCardRequest *)v4 setCardURL:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PARCardRequest *)v4 setCardURL:v3];
      }
    }
    [(PARRequest *)v4 setTriggerEvent:14];
  }

  return v4;
}

+ (id)moreResultsRequestWithURL:(id)a3 queryId:(unint64_t)a4
{
  id v5 = [a1 moreResultsRequestWithURL:a3];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setQueryId:a4];
  }

  return v6;
}

+ (id)moreResultsRequestWithURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PARMoreResultsRequest);
  id v5 = v4;
  if (v4)
  {
    [(PARMoreResultsRequest *)v4 setMoreResultsURL:v3];
    [(PARRequest *)v5 setTriggerEvent:13];
  }

  return v5;
}

+ (id)searchReplayRequestWithString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PARSearchReplayRequest);
  id v5 = v4;
  if (v4) {
    [(PARSearchRequest *)v4 setQueryString:v3];
  }

  return v5;
}

+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5 queryString:(id)a6
{
  id v10 = a3;
  id v11 = [a1 searchRequestWithString:a6 triggerEvent:a4 queryId:a5];
  id v12 = v11;
  if (v11) {
    [v11 setQueryCommand:v10];
  }

  return v12;
}

+ (id)searchRequestWithCommand:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  return (id)[a1 searchRequestWithCommand:a3 triggerEvent:a4 queryId:a5 queryString:&stru_1EED51C28];
}

+ (id)searchRequestWithEngagedSuggestion:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [v8 suggestion];
  id v10 = [a1 searchRequestWithString:v9 triggerEvent:a4 queryId:a5];

  [v10 setEngagedSuggestion:v8];

  return v10;
}

+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  uint64_t v6 = [a1 searchRequestWithString:a3 triggerEvent:a4];
  id v7 = v6;
  if (v6) {
    [v6 setQueryId:a5];
  }

  return v7;
}

+ (id)searchRequestWithString:(id)a3 triggerEvent:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(PARSearchRequest);
  id v7 = v6;
  if (v6)
  {
    [(PARSearchRequest *)v6 setQueryString:v5];
    [(PARRequest *)v7 setTriggerEvent:a4];
  }

  return v7;
}

@end
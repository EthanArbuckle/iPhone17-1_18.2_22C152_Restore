@interface DebugHierarchyRequest
+ (DebugHierarchyRequest)requestWithBase64Data:(id)a3 error:(id *)a4;
+ (DebugHierarchyRequest)requestWithDictionary:(id)a3;
+ (DebugHierarchyRequest)requestWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5;
+ (DebugHierarchyRequest)requestWithName:(id)a3 discoveryType:(int64_t)a4 actions:(id)a5 completion:(id)a6;
+ (id)_compatibleRequestWithDictionary:(id)a3;
+ (id)_requestWithV1RequestDictionary:(id)a3;
- (BOOL)compressDuringTransport;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsCompatibilityConversion;
- (BOOL)wantsUserFacingStatusUpdates;
- (DebugHierarchyCrawlerOptions)crawlerOptions;
- (DebugHierarchyRequest)init;
- (DebugHierarchyRequest)initWithDictionary:(id)a3;
- (DebugHierarchyRequest)initWithWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5;
- (DebugHierarchyRequestFailureReason)failureReason;
- (NSArray)actions;
- (NSArray)logs;
- (NSData)rawResponseData;
- (NSData)serializedCompatibilitySupportRepresentation;
- (NSDate)executionEndDate;
- (NSDate)executionStartDate;
- (NSDictionary)payload;
- (NSString)base64Encoded;
- (NSString)identifier;
- (NSString)name;
- (NSString)statusMessageActivityPhrase;
- (double)timeout;
- (float)initiatorVersion;
- (id)completion;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (id)formattedResponseDataForRawRequestResultData:(id)a3;
- (id)humanReadableStatusMessage;
- (id)progressHandler;
- (int64_t)objectDiscovery;
- (int64_t)priority;
- (int64_t)status;
- (void)addLogEntry:(id)a3;
- (void)cancel;
- (void)setActions:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCompressDuringTransport:(BOOL)a3;
- (void)setCrawlerOptions:(id)a3;
- (void)setExecutionEndDate:(id)a3;
- (void)setExecutionStartDate:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitiatorVersion:(float)a3;
- (void)setLogs:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsCompatibilityConversion:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRawResponseData:(id)a3;
- (void)setSerializedCompatibilitySupportRepresentation:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStatusMessageActivityPhrase:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setWantsUserFacingStatusUpdates:(BOOL)a3;
@end

@implementation DebugHierarchyRequest

+ (DebugHierarchyRequest)requestWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return (DebugHierarchyRequest *)v5;
}

- (DebugHierarchyRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestName"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestInitiatorVersionKey"];
    [v10 floatValue];
    v5->_initiatorVersion = v11;

    v12 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestPriority"];
    v5->_priority = (int64_t)[v12 integerValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestPayload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v13;

    v15 = [v4 objectForKeyedSubscript:@"DBGHierarchyObjectDiscovery"];
    v5->_objectDiscovery = (int64_t)[v15 unsignedIntegerValue];

    v16 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestTransportCompression"];
    v5->_compressDuringTransport = [v16 BOOLValue];

    v17 = [v4 objectForKeyedSubscript:@"DBGHierarchyCrawlerOptions"];
    if (v17)
    {
      v18 = [[DebugHierarchyCrawlerOptions alloc] initWithDictionary:v17];
      crawlerOptions = v5->_crawlerOptions;
      v5->_crawlerOptions = v18;
    }
    v20 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestActions"];
    if ([v20 count])
    {
      v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v22 = v20;
      id v23 = v20;
      id v24 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v48;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = DebugHierarchyRequestActionForDictionary(*(void **)(*((void *)&v47 + 1) + 8 * i));
            if (v28) {
              [v21 addObject:v28];
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v25);
      }

      v29 = (NSArray *)[v21 copy];
      actions = v5->_actions;
      v5->_actions = v29;

      v20 = v22;
    }
    v31 = [v4 objectForKeyedSubscript:@"logs"];
    if ([v31 count])
    {
      v42 = v17;
      v32 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v31 count]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v33 = v31;
      id v34 = [v33 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v44;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v44 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = +[DebugHierarchyLogEntry logEntryWithDictionary:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
            [v32 addObject:v38];
          }
          id v35 = [v33 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v35);
      }

      v39 = (NSArray *)[v32 copy];
      logs = v5->_logs;
      v5->_logs = v39;

      v17 = v42;
    }
  }
  return v5;
}

+ (DebugHierarchyRequest)requestWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithWithDiscoveryType:a3 actions:v9 completion:v8];

  return (DebugHierarchyRequest *)v10;
}

+ (DebugHierarchyRequest)requestWithName:(id)a3 discoveryType:(int64_t)a4 actions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithWithDiscoveryType:a4 actions:v11 completion:v10];

  [v13 setName:v12];
  return (DebugHierarchyRequest *)v13;
}

- (DebugHierarchyRequest)initWithWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DebugHierarchyRequest *)self init];
  if (v11)
  {
    id v12 = +[NSUUID UUID];
    uint64_t v13 = [v12 UUIDString];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    +[DebugHierarchyTargetHub debugHierarchyVersion];
    v11->_initiatorVersion = v15;
    objc_storeStrong((id *)&v11->_actions, a4);
    v11->_objectDiscovery = a3;
    id v16 = objc_retainBlock(v10);
    id completion = v11->_completion;
    v11->_id completion = v16;

    v11->_compressDuringTransport = 1;
  }

  return v11;
}

- (DebugHierarchyRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DebugHierarchyRequest;
  result = [(DebugHierarchyRequest *)&v3 init];
  if (result) {
    result->_timeout = 60.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(DebugHierarchyRequest *)self identifier];
    uint64_t v6 = [v4 identifier];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)cancel
{
  [(DebugHierarchyRequest *)self setStatus:-1];
  objc_super v3 = [(DebugHierarchyRequest *)self completion];

  if (v3)
  {
    id v4 = [(DebugHierarchyRequest *)self completion];
    v4[2](v4, self);
  }
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  id v4 = [(DebugHierarchyRequest *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"DBGHierarchyRequestIdentifier"];

  id v5 = [(DebugHierarchyRequest *)self name];
  [v3 setObject:v5 forKeyedSubscript:@"DBGHierarchyRequestName"];

  [(DebugHierarchyRequest *)self initiatorVersion];
  uint64_t v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"DBGHierarchyRequestInitiatorVersionKey"];

  unsigned __int8 v7 = +[NSNumber numberWithInteger:[(DebugHierarchyRequest *)self priority]];
  [v3 setObject:v7 forKeyedSubscript:@"DBGHierarchyRequestPriority"];

  id v8 = +[NSNumber numberWithInteger:[(DebugHierarchyRequest *)self objectDiscovery]];
  [v3 setObject:v8 forKeyedSubscript:@"DBGHierarchyObjectDiscovery"];

  id v9 = +[NSNumber numberWithBool:[(DebugHierarchyRequest *)self compressDuringTransport]];
  [v3 setObject:v9 forKeyedSubscript:@"DBGHierarchyRequestTransportCompression"];

  id v10 = [(DebugHierarchyRequest *)self payload];

  if (v10)
  {
    id v11 = [(DebugHierarchyRequest *)self payload];
    [v3 setObject:v11 forKey:@"DBGHierarchyRequestPayload"];
  }
  id v12 = [(DebugHierarchyRequest *)self crawlerOptions];

  if (v12)
  {
    uint64_t v13 = [(DebugHierarchyRequest *)self crawlerOptions];
    v14 = [v13 dictionaryRepresentation];
    [v3 setObject:v14 forKeyedSubscript:@"DBGHierarchyCrawlerOptions"];
  }
  float v15 = [(DebugHierarchyRequest *)self actions];
  id v16 = [v15 count];

  if (v16)
  {
    v17 = [(DebugHierarchyRequest *)self actions];
    v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v19 = [(DebugHierarchyRequest *)self actions];
    id v20 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v44;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v21);
    }

    id v25 = [v18 copy];
    [v3 setObject:v25 forKeyedSubscript:@"DBGHierarchyRequestActions"];
  }
  uint64_t v26 = [(DebugHierarchyRequest *)self logs];
  id v27 = [v26 count];

  if (v27)
  {
    v28 = [(DebugHierarchyRequest *)self logs];
    v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v28 count]);

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = [(DebugHierarchyRequest *)self logs];
    id v31 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        id v32 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v32);
    }

    id v36 = [v29 copy];
    [v3 setObject:v36 forKeyedSubscript:@"logs"];
  }
  id v37 = [v3 copy];

  return v37;
}

- (void)addLogEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRequest *)self logs];
  id v6 = [v5 count];

  if (v6)
  {
    id v9 = [(DebugHierarchyRequest *)self logs];
    unsigned __int8 v7 = [v9 arrayByAddingObject:v4];

    [(DebugHierarchyRequest *)self setLogs:v7];
  }
  else
  {
    id v10 = v4;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];

    [(DebugHierarchyRequest *)self setLogs:v8];
  }
}

- (NSString)base64Encoded
{
  v2 = [(DebugHierarchyRequest *)self dictionaryRepresentation];
  objc_super v3 = [v2 generateJSONDataWithError:0];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return (NSString *)v4;
}

- (id)humanReadableStatusMessage
{
  objc_super v3 = [(DebugHierarchyRequest *)self statusMessageActivityPhrase];
  id v4 = [v3 length];

  if (v4)
  {
    int64_t v5 = [(DebugHierarchyRequest *)self status];
    switch(v5)
    {
      case -2:
        id v6 = [(DebugHierarchyRequest *)self statusMessageActivityPhrase];
        +[NSString stringWithFormat:@"Failed to fetch %@", v6];
        break;
      case 3:
        id v6 = [(DebugHierarchyRequest *)self statusMessageActivityPhrase];
        +[NSString stringWithFormat:@"Fetching %@ completed", v6];
        break;
      case 2:
        id v6 = [(DebugHierarchyRequest *)self statusMessageActivityPhrase];
        +[NSString stringWithFormat:@"Fetching %@", v6];
        break;
      default:
        id v6 = [(DebugHierarchyRequest *)self statusMessageActivityPhrase];
        +[NSString stringWithFormat:@"Waiting for %@ to be fetched", v6];
        break;
    unsigned __int8 v7 = };
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  return v7;
}

- (id)debugDescription
{
  objc_super v3 = [(DebugHierarchyRequest *)self dictionaryRepresentation];
  id v4 = +[NSString stringWithFormat:@"%@ - %@", self, v3];

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (float)initiatorVersion
{
  return self->_initiatorVersion;
}

- (void)setInitiatorVersion:(float)a3
{
  self->_initiatorVersion = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActions:(id)a3
{
}

- (int64_t)objectDiscovery
{
  return self->_objectDiscovery;
}

- (DebugHierarchyCrawlerOptions)crawlerOptions
{
  return (DebugHierarchyCrawlerOptions *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCrawlerOptions:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)logs
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLogs:(id)a3
{
}

- (NSString)statusMessageActivityPhrase
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStatusMessageActivityPhrase:(id)a3
{
}

- (BOOL)wantsUserFacingStatusUpdates
{
  return self->_wantsUserFacingStatusUpdates;
}

- (void)setWantsUserFacingStatusUpdates:(BOOL)a3
{
  self->_wantsUserFacingStatusUpdates = a3;
}

- (NSDate)executionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExecutionStartDate:(id)a3
{
}

- (NSDate)executionEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setExecutionEndDate:(id)a3
{
}

- (NSData)serializedCompatibilitySupportRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSerializedCompatibilitySupportRepresentation:(id)a3
{
}

- (BOOL)needsCompatibilityConversion
{
  return self->_needsCompatibilityConversion;
}

- (void)setNeedsCompatibilityConversion:(BOOL)a3
{
  self->_needsCompatibilityConversion = a3;
}

- (BOOL)compressDuringTransport
{
  return self->_compressDuringTransport;
}

- (void)setCompressDuringTransport:(BOOL)a3
{
  self->_compressDuringTransport = a3;
}

- (DebugHierarchyRequestFailureReason)failureReason
{
  return (DebugHierarchyRequestFailureReason *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFailureReason:(id)a3
{
}

- (NSData)rawResponseData
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRawResponseData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResponseData, 0);
  objc_storeStrong((id *)&self->_serializedCompatibilitySupportRepresentation, 0);
  objc_storeStrong((id *)&self->_executionEndDate, 0);
  objc_storeStrong((id *)&self->_executionStartDate, 0);
  objc_storeStrong((id *)&self->_statusMessageActivityPhrase, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_crawlerOptions, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)formattedResponseDataForRawRequestResultData:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_8;
  }
  id v6 = v4;
  [(DebugHierarchyRequest *)self initiatorVersion];
  if (v7 >= 3.0)
  {
    if (![(DebugHierarchyRequest *)self compressDuringTransport]) {
      goto LABEL_8;
    }
    uint64_t v8 = objc_msgSend(v6, "dbg_gzipDeflate");
  }
  else
  {
    uint64_t v8 = objc_msgSend(v6, "dbg_gzipDeflateRaw");
  }
  id v9 = (void *)v8;

  id v6 = v9;
LABEL_8:

  return v6;
}

+ (DebugHierarchyRequest)requestWithBase64Data:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v5 options:0];
  id v13 = 0;
  float v7 = +[NSDictionary dictionaryWithJSONData:v6 error:&v13];
  id v8 = v13;
  if (v8 || !v7)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = [v8 description];
    NSLog(&cfstr_ErrorFailedToU.isa, v10, v11);

    id v9 = 0;
  }
  else
  {
    id v9 = [a1 _compatibleRequestWithDictionary:v7];
  }

  return (DebugHierarchyRequest *)v9;
}

+ (id)_compatibleRequestWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"DBGHierarchyRequestPredicate"];

  if (v5)
  {
    id v6 = [a1 _requestWithV1RequestDictionary:v4];

    [v6 setNeedsCompatibilityConversion:1];
  }
  else
  {
    id v6 = +[DebugHierarchyRequest requestWithDictionary:v4];
  }
  return v6;
}

+ (id)_requestWithV1RequestDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"DBGHierarchyRequestPredicate"];
  id v5 = [v4 objectForKeyedSubscript:@"objectIdentifiers"];
  id v6 = [v5 count];
  float v7 = +[NSMutableArray array];
  if (v6)
  {
    id v8 = [v4 objectForKeyedSubscript:@"propertyDescriptions"];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __77__DebugHierarchyRequest_TargetHubAdditions___requestWithV1RequestDictionary___block_invoke;
    v19[3] = &unk_243C8;
    id v20 = v7;
    [(DebugHierarchyPropertyAction *)v8 enumerateKeysAndObjectsUsingBlock:v19];
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:@"includeLazyValues"];
    unsigned __int8 v10 = [v9 BOOLValue];

    id v8 = objc_alloc_init(DebugHierarchyPropertyAction);
    [(DebugHierarchyPropertyAction *)v8 setObjectIdentifiers:&__NSArray0__struct exlusive:1];
    if ((v10 & 1) == 0) {
      [(DebugHierarchyPropertyAction *)v8 setOptions:1 comparisonStyle:3];
    }
    [v7 addObject:v8];
  }

  id v11 = [v3 objectForKeyedSubscript:@"DBGHierarchyRequestSpinRunloop"];
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = objc_alloc_init(DebugHierarchyRunLoopAction);
    [v7 addObject:v13];
  }
  if (v6) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  float v15 = +[DebugHierarchyRequest requestWithDiscoveryType:v14 actions:v7 completion:&__block_literal_global_0];
  id v16 = [v3 objectForKeyedSubscript:@"DBGHierarchyRequestIdentifier"];
  [v15 setIdentifier:v16];

  v17 = [v3 objectForKeyedSubscript:@"DBGHierarchyRequestName"];
  [v15 setName:v17];

  return v15;
}

void __77__DebugHierarchyRequest_TargetHubAdditions___requestWithV1RequestDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  float v7 = objc_alloc_init(DebugHierarchyPropertyAction);
  id v22 = v5;
  id v8 = +[NSArray arrayWithObjects:&v22 count:1];
  [(DebugHierarchyPropertyAction *)v7 setObjectIdentifiers:v8 exlusive:0];

  id v9 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        float v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "objectForKeyedSubscript:", @"propertyName", (void)v17);
        if ([v15 length]) {
          [v9 addObject:v15];
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  id v16 = [v9 copy];
  [(DebugHierarchyPropertyAction *)v7 setPropertyNames:v16 exlusive:0];

  [(DebugHierarchyPropertyAction *)v7 setOptions:0 comparisonStyle:0];
  [*(id *)(a1 + 32) addObject:v7];
}

@end
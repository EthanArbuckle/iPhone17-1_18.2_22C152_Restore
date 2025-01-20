@interface SLBatchRequest
- (SLBatchRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6;
- (id)preparedURLRequest;
- (void)addRequest:(id)a3;
@end

@implementation SLBatchRequest

- (SLBatchRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"com.apple.social.facebook"])
  {
    v18.receiver = self;
    v18.super_class = (Class)SLBatchRequest;
    v13 = [(SLRequest *)&v18 initWithServiceType:v10 URL:v11 parameters:v12 requestMethod:a6];
    if (v13)
    {
      uint64_t v14 = objc_opt_new();
      requests = v13->_requests;
      v13->_requests = (NSMutableArray *)v14;
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)addRequest:(id)a3
{
  id v5 = a3;
  v4 = [(SLRequest *)self multiPartBoundary];
  [v5 setMultiPartBoundary:v4];

  [(NSMutableArray *)self->_requests addObject:v5];
}

- (id)preparedURLRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v23 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = self->_requests;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v8 = [v7 dictionaryRepresentationForJSONSerialization];
        [v23 addObject:v8];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v9 = [v7 multiParts];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              v15 = [v14 uniqueIdentifier];
              [v14 setName:v15];

              [(SLRequest *)self addMultiPart:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v4);
  }

  uint64_t v25 = 0;
  v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v23 options:0 error:&v25];
  if (v25) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to serialize batch request data into JSON"];
  }
  if (v16)
  {
    v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
    [(SLRequest *)self setParameterValue:v17 forKey:@"batch"];
    v20 = v17;
    _SLLog(v21, 6, @"Batch: %@");
  }
  v24.receiver = self;
  v24.super_class = (Class)SLBatchRequest;
  objc_super v18 = [(SLRequest *)&v24 preparedURLRequest];

  return v18;
}

- (void).cxx_destruct
{
}

@end
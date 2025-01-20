@interface PARTopicRequest
+ (BOOL)supportsSecureCoding;
- (Class)responseClass;
- (NSArray)localTopics;
- (NSArray)queryTopicContexts;
- (NSArray)topics;
- (PARTopicRequest)initWithCoder:(id)a3;
- (double)timeoutIntervalForRequest;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeoutIntervalForRequest:(double)a3;
- (void)setTopics:(id)a3;
@end

@implementation PARTopicRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_queryTopicContexts, 0);

  objc_storeStrong((id *)&self->_localTopics, 0);
}

- (void)setTopics:(id)a3
{
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setTimeoutIntervalForRequest:(double)a3
{
  self->_timeoutIntervalForRequest = a3;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (NSArray)queryTopicContexts
{
  queryTopicContexts = self->_queryTopicContexts;
  if (!queryTopicContexts)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(PARTopicRequest *)self topics];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [(PARTopicRequest *)self topics];
        v9 = [v8 objectAtIndexedSubscript:i];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [[PARQueryTopicContext alloc] initWithTopic:v9 index:i];
          [v4 addObject:v10];
        }
      }
    }
    v11 = (NSArray *)[v4 copy];
    v12 = self->_queryTopicContexts;
    self->_queryTopicContexts = v11;

    queryTopicContexts = self->_queryTopicContexts;
  }

  return queryTopicContexts;
}

- (NSArray)localTopics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  localTopics = self->_localTopics;
  if (!localTopics)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(PARTopicRequest *)self topics];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (NSArray *)[v4 copy];
    v12 = self->_localTopics;
    self->_localTopics = v11;

    localTopics = self->_localTopics;
  }

  return localTopics;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (PARTopicRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PARTopicRequest;
  v5 = [(PARRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"topicContexts"];
    queryTopicContexts = v5->_queryTopicContexts;
    v5->_queryTopicContexts = (NSArray *)v9;

    [v4 decodeDoubleForKey:@"timeoutIntervalForRequest"];
    v5->_timeoutIntervalForRequest = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PARTopicRequest;
  id v4 = a3;
  [(PARRequest *)&v6 encodeWithCoder:v4];
  v5 = [(PARTopicRequest *)self queryTopicContexts];
  [v4 encodeObject:v5 forKey:@"topicContexts"];

  [(PARTopicRequest *)self timeoutIntervalForRequest];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeoutIntervalForRequest");
}

- (unsigned)nwActivityLabel
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
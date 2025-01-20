@interface PARQueryTopicContext
+ (BOOL)supportsSecureCoding;
- (NSString)contextId;
- (PARQueryTopicContext)initWithCoder:(id)a3;
- (PARQueryTopicContext)initWithTopic:(id)a3 index:(int64_t)a4;
- (SFQueryTopic)topic;
- (int64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setContextId:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation PARQueryTopicContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

- (void)setContextId:(id)a3
{
}

- (NSString)contextId
{
  return self->_contextId;
}

- (void)setTopic:(id)a3
{
}

- (SFQueryTopic)topic
{
  return self->_topic;
}

- (int64_t)index
{
  v2 = [(PARQueryTopicContext *)self contextId];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (PARQueryTopicContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PARQueryTopicContext;
  v5 = [(PARQueryTopicContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextId"];
    contextId = v5->_contextId;
    v5->_contextId = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"topic"];
    topic = v5->_topic;
    v5->_topic = (SFQueryTopic *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PARQueryTopicContext *)self contextId];
  [v4 encodeObject:v5 forKey:@"contextId"];

  id v6 = [(PARQueryTopicContext *)self topic];
  [v4 encodeObject:v6 forKey:@"topic"];
}

- (PARQueryTopicContext)initWithTopic:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARQueryTopicContext;
  v7 = [(PARQueryTopicContext *)&v11 init];
  if (v7)
  {
    v8 = [NSNumber numberWithInteger:a4];
    uint64_t v9 = [v8 stringValue];
    [(PARQueryTopicContext *)v7 setContextId:v9];

    [(PARQueryTopicContext *)v7 setTopic:v6];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface AAAbsintheSignerContextCache
+ (id)cacheWithContext:(id)a3;
- (AAAbsintheContext)context;
- (AAAbsintheSignerContextCache)init;
- (AAAbsintheSignerContextCache)initWithContext:(id)a3;
- (NSDate)creationDate;
@end

@implementation AAAbsintheSignerContextCache

+ (id)cacheWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (AAAbsintheSignerContextCache)init
{
  return 0;
}

- (AAAbsintheSignerContextCache)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAAbsintheSignerContextCache;
  v6 = [(AAAbsintheSignerContextCache *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AAAbsintheContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
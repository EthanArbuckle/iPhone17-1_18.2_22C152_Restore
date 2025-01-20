@interface TIContinuousPath
+ (BOOL)supportsSecureCoding;
- (NSArray)samples;
- (TIContinuousPath)init;
- (TIContinuousPath)initWithCoder:(id)a3;
- (TIContinuousPath)initWithJsonDictionary:(id)a3;
- (TIContinuousPath)initWithTimeStamp:(double)a3;
- (double)timeStamp;
- (id)description;
- (id)toJsonDictionary;
- (void)addSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIContinuousPath

- (TIContinuousPath)initWithTimeStamp:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TIContinuousPath;
  v3 = [(TIContinuousPath *)&v7 init];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    samples = v3->_samples;
    v3->_samples = v4;
  }
  return v3;
}

- (TIContinuousPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIContinuousPath;
  v2 = [(TIContinuousPath *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    samples = v2->_samples;
    v2->_samples = v3;
  }
  return v2;
}

- (TIContinuousPath)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIContinuousPath;
  v5 = [(TIContinuousPath *)&v19 init];
  if (v5)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    samples = v5->_samples;
    v5->_samples = v6;

    v8 = [v4 objectForKey:@"samples"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[TIContinuousPathSample alloc] initWithJsonDictionary:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12)];
          [(TIContinuousPath *)v5 addSample:v13];

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (double)timeStamp
{
  v2 = [(NSMutableArray *)self->_samples objectAtIndexedSubscript:0];
  [v2 timeStamp];
  double v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIContinuousPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIContinuousPath;
  v5 = [(TIContinuousPath *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = [v4 decodeObjectOfClasses:v7 forKey:@"samples"];
    id v9 = (NSMutableArray *)[v8 copy];
    samples = v5->_samples;
    v5->_samples = v9;
  }
  return v5;
}

- (void)addSample:(id)a3
{
}

- (id)toJsonDictionary
{
  double v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_samples;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toJsonDictionary", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"samples"];

  return v3;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_samples;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"; sample = %@", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];

  return v3;
}

- (NSArray)samples
{
  return &self->_samples->super;
}

- (void).cxx_destruct
{
}

@end
@interface _CLMicroLocationSourcesStatisticsResult
+ (BOOL)supportsSecureCoding;
- (NSArray)sourcesData;
- (_CLMicroLocationSourcesStatisticsResult)initWithCoder:(id)a3;
- (_CLMicroLocationSourcesStatisticsResult)initWithSourcesData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLMicroLocationSourcesStatisticsResult

- (_CLMicroLocationSourcesStatisticsResult)initWithSourcesData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  v4 = [(_CLMicroLocationSourcesStatisticsResult *)&v6 init];
  if (v4) {
    v4->_sourcesData = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  [(_CLMicroLocationSourcesStatisticsResult *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = (id)[(NSArray *)[(_CLMicroLocationSourcesStatisticsResult *)self sourcesData] copyWithZone:a3];

  return (id)[v5 initWithSourcesData:v6];
}

- (_CLMicroLocationSourcesStatisticsResult)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLMicroLocationSourcesStatisticsResult;
  v4 = [(_CLMicroLocationSourcesStatisticsResult *)&v8 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_sourcesData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"sourcesData");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(_CLMicroLocationSourcesStatisticsResult *)self sourcesData];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@\n", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "description"))];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSArray)sourcesData
{
  return self->_sourcesData;
}

@end
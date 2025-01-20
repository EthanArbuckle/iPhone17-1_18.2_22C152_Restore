@interface _CLMicroLocationSourceIdAndSourceData
+ (BOOL)supportsSecureCoding;
- (NSArray)sourceData;
- (NSString)sourceIdsIdentifier;
- (_CLMicroLocationSourceIdAndSourceData)initWithCoder:(id)a3;
- (_CLMicroLocationSourceIdAndSourceData)initWithSourceIdsIdentifier:(id)a3 sourceData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLMicroLocationSourceIdAndSourceData

- (_CLMicroLocationSourceIdAndSourceData)initWithSourceIdsIdentifier:(id)a3 sourceData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  v6 = [(_CLMicroLocationSourceIdAndSourceData *)&v8 init];
  if (v6)
  {
    v6->_sourceIdsIdentifier = (NSString *)[a3 copy];
    v6->_sourceData = (NSArray *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  [(_CLMicroLocationSourceIdAndSourceData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = (id)[(NSString *)[(_CLMicroLocationSourceIdAndSourceData *)self sourceIdsIdentifier] copyWithZone:a3];
  id v7 = (id)[(NSArray *)[(_CLMicroLocationSourceIdAndSourceData *)self sourceData] copyWithZone:a3];

  return (id)[v5 initWithSourceIdsIdentifier:v6 sourceData:v7];
}

- (_CLMicroLocationSourceIdAndSourceData)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLMicroLocationSourceIdAndSourceData;
  v4 = [(_CLMicroLocationSourceIdAndSourceData *)&v8 init];
  if (v4)
  {
    v4->_sourceIdsIdentifier = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceId"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_sourceData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"sourceData");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_sourceIdsIdentifier forKey:@"sourceId"];
  sourceData = self->_sourceData;

  [a3 encodeObject:sourceData forKey:@"sourceData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"sourceIdentifier: %@\n", self->_sourceIdsIdentifier];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(_CLMicroLocationSourceIdAndSourceData *)self sourceData];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"\t%@\n", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "description"))];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return (id)[NSString stringWithFormat:@"%@%@", v3, v4];
}

- (NSString)sourceIdsIdentifier
{
  return self->_sourceIdsIdentifier;
}

- (NSArray)sourceData
{
  return self->_sourceData;
}

@end
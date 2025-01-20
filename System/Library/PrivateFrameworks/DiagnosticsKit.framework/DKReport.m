@interface DKReport
+ (BOOL)supportsSecureCoding;
+ (id)reportWithComponents:(id)a3;
- (BOOL)isEmpty;
- (DKReport)initWithCoder:(id)a3;
- (DKReport)initWithComponents:(id)a3;
- (NSArray)components;
- (id)arrayForJSON;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reportByMergingReport:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKReport

+ (id)reportWithComponents:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithComponents:v4];

  return v5;
}

- (DKReport)initWithComponents:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKReport;
  v6 = [(DKReport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_components, a3);
  }

  return v7;
}

- (id)reportByMergingReport:(id)a3
{
  id v4 = self;
  if (a3)
  {
    id v5 = a3;
    v6 = [(DKReport *)v4 components];
    v7 = (void *)[v6 mutableCopy];

    v8 = [v5 components];

    [v7 addObjectsFromArray:v8];
    uint64_t v9 = +[DKReport reportWithComponents:v7];

    id v4 = (DKReport *)v9;
  }
  return v4;
}

- (id)arrayForJSON
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(DKReport *)self components];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(DKReport *)self components];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryForJSON];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEmpty
{
  v2 = [(DKReport *)self components];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DKReport;
  id v5 = [(DKReport *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"components"];
    components = v5->_components;
    v5->_components = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DKReport *)self components];
  [v4 encodeObject:v5 forKey:@"components"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_components copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; components: %@>", v5, self, self->_components];

  return v6;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
}

@end
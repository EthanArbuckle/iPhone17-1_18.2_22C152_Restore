@interface MXCallStackTree
+ (BOOL)supportsSecureCoding;
- (BOOL)callStackPerThread;
- (MXCallStackTree)initWithCoder:(id)a3;
- (MXCallStackTree)initWithThreadArray:(id)a3 aggregatedByProcess:(BOOL)a4;
- (NSArray)callStackThreads;
- (NSData)JSONRepresentation;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXCallStackTree

- (MXCallStackTree)initWithThreadArray:(id)a3 aggregatedByProcess:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXCallStackTree;
  v8 = [(MXCallStackTree *)&v11 init];
  if (v8)
  {
    if (![v7 count])
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_callStackThreads, a3);
    v8->_callStackPerThread = !a4;
  }
  v9 = v8;
LABEL_6:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  callStackThreads = self->_callStackThreads;
  id v5 = a3;
  [v5 encodeObject:callStackThreads forKey:@"callStacks"];
  [v5 encodeBool:self->_callStackPerThread forKey:@"callStackPerThread"];
}

- (MXCallStackTree)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackTree;
  id v5 = [(MXCallStackTree *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"callStacks"];
    callStackThreads = v5->_callStackThreads;
    v5->_callStackThreads = (NSArray *)v9;

    v5->_callStackPerThread = [v4 decodeBoolForKey:@"callStackPerThread"];
  }

  return v5;
}

- (id)toDictionary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSNumber numberWithBool:self->_callStackPerThread];
  [v3 setObject:v4 forKey:@"callStackPerThread"];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  callStackThreads = self->_callStackThreads;
  if (callStackThreads)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = callStackThreads;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "toDictionary", (void)v16);
          v13 = v12;
          if (!self->_callStackPerThread)
          {
            v14 = (void *)[v12 mutableCopy];
            [v14 removeObjectForKey:@"threadAttributed"];

            v13 = v14;
          }
          [v5 addObject:v13];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v5 forKey:@"callStacks"];
  }

  return v3;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXCallStackTree *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (NSArray)callStackThreads
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)callStackPerThread
{
  return self->_callStackPerThread;
}

- (void).cxx_destruct
{
}

@end
@interface NEOnDemandRuleEvaluateConnection
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEOnDemandRuleEvaluateConnection)init;
- (NEOnDemandRuleEvaluateConnection)initWithCoder:(id)a3;
- (NSArray)connectionRules;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionRules:(NSArray *)connectionRules;
@end

@implementation NEOnDemandRuleEvaluateConnection

- (void).cxx_destruct
{
}

- (void)setConnectionRules:(NSArray *)connectionRules
{
}

- (NSArray)connectionRules
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v5 = [(NEOnDemandRule *)&v23 initFromLegacyDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FD0]];
    if (isa_nsarray(v6))
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v18 = v6;
        id v10 = 0;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (isa_nsdictionary(v13))
            {
              id v14 = [[NEEvaluateConnectionRule alloc] initFromLegacyDictionary:v13];
              if (!v10) {
                id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v10 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);

        v6 = v18;
        if (!v10) {
          goto LABEL_17;
        }
        v15 = (void *)v5[7];
        v5[7] = v10;
        id v7 = v10;
      }
    }
LABEL_17:
    v16 = v5;
  }
  return v5;
}

- (id)copyLegacyDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  id v3 = [(NEOnDemandRule *)&v17 copyLegacyDictionary];
  id v4 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyLegacyDictionary];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41FD0]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  uint64_t v8 = [(NEOnDemandRule *)&v12 descriptionWithIndent:v5 options:a4];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  uint64_t v10 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
  [v9 appendPrettyObject:v10 withName:@"connectionRules" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  unsigned __int8 v5 = [(NEOnDemandRule *)&v18 checkValidityAndCollectErrors:v4];
  v6 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v5 = [v12 checkValidityAndCollectErrors:v4];
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid connection rules", v4);
            unsigned __int8 v5 = 0;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing connection rules", v4);
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  id v4 = [(NEOnDemandRule *)&v10 copyWithZone:a3];
  unsigned __int8 v5 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v7 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
    uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setConnectionRules:v8];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  id v4 = a3;
  [(NEOnDemandRule *)&v6 encodeWithCoder:v4];
  unsigned __int8 v5 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
  [v4 encodeObject:v5 forKey:@"Rules"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  if ([(NEOnDemandRule *)&v10 isEqual:v4])
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [(NEOnDemandRuleEvaluateConnection *)self connectionRules];
      id v7 = [v5 connectionRules];
      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NEOnDemandRuleEvaluateConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  id v5 = [(NEOnDemandRule *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    connectionRules = v5->_connectionRules;
    v5->_connectionRules = (NSArray *)v9;
  }
  return v5;
}

- (NEOnDemandRuleEvaluateConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  return [(NEOnDemandRule *)&v3 initWithAction:3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
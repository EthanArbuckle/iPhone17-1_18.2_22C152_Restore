@interface AXSSDocumentTextRuleset
- (AXSSDocumentTextRuleset)init;
- (NSArray)allRules;
- (NSMutableArray)_rules;
- (NSString)name;
- (id)rulesForGranularity:(int64_t)a3;
- (void)addRule:(id)a3;
- (void)setName:(id)a3;
- (void)set_rules:(id)a3;
@end

@implementation AXSSDocumentTextRuleset

- (AXSSDocumentTextRuleset)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSSDocumentTextRuleset;
  v2 = [(AXSSDocumentTextRuleset *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rules = v2->__rules;
    v2->__rules = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRule:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSDocumentTextRuleset *)self _rules];
  [v5 addObject:v4];
}

- (NSArray)allRules
{
  v2 = [(AXSSDocumentTextRuleset *)self _rules];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)rulesForGranularity:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v6 = [(AXSSDocumentTextRuleset *)self allRules];
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
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 granularity] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)_rules
{
  return self->__rules;
}

- (void)set_rules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
@interface AXSSDocumentTextRulesetManager
+ (id)sharedManager;
- (AXSSDocumentTextRulesetManager)init;
- (NSArray)rulesets;
- (NSMutableArray)_rulesets;
- (id)description;
- (void)_loadCustomRulesets;
- (void)set_rulesets:(id)a3;
@end

@implementation AXSSDocumentTextRulesetManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXSSDocumentTextRulesetManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __47__AXSSDocumentTextRulesetManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (AXSSDocumentTextRulesetManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSSDocumentTextRulesetManager;
  v2 = [(AXSSDocumentTextRulesetManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rulesets = v2->__rulesets;
    v2->__rulesets = (NSMutableArray *)v3;

    [(AXSSDocumentTextRulesetManager *)v2 loadRulesets];
  }
  return v2;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)AXSSDocumentTextRulesetManager;
  v4 = [(AXSSDocumentTextRulesetManager *)&v18 description];
  [v3 appendString:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(AXSSDocumentTextRulesetManager *)self _rulesets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) allRules];
        v8 += [v11 count];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v12 = [(AXSSDocumentTextRulesetManager *)self _rulesets];
  objc_msgSend(v3, "appendFormat:", @" RuleSets:%li Rules:%li", objc_msgSend(v12, "count"), v8);

  return v3;
}

- (NSArray)rulesets
{
  v2 = [(AXSSDocumentTextRulesetManager *)self _rulesets];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)_loadCustomRulesets
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_alloc_init(AXSSDocumentTextRuleset);
  [(AXSSDocumentTextRuleset *)v3 setName:@"custom"];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_alloc_init(*(Class *)(*((void *)&v13 + 1) + 8 * v8));
        if (v9) {
          -[AXSSDocumentTextRuleset addRule:](v3, "addRule:", v9, (void)v13);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v10 = [(AXSSDocumentTextRuleset *)v3 allRules];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(AXSSDocumentTextRulesetManager *)self _rulesets];
    [v12 addObject:v3];
  }
}

- (NSMutableArray)_rulesets
{
  return self->__rulesets;
}

- (void)set_rulesets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
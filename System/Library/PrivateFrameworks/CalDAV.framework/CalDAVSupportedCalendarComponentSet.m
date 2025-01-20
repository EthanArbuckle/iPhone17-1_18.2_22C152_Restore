@interface CalDAVSupportedCalendarComponentSet
- (CalDAVSupportedCalendarComponentSet)init;
- (NSMutableSet)comps;
- (NSSet)compNames;
- (id)childrenToWrite;
- (id)componentsAsString;
- (id)copyParseRules;
- (id)description;
- (void)addComp:(id)a3;
- (void)setComps:(id)a3;
@end

@implementation CalDAVSupportedCalendarComponentSet

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34CD8];
  uint64_t v4 = *MEMORY[0x263F34DF8];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34DF8] objectClass:objc_opt_class() setterMethod:sel_addComp_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  v7 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CalDAVSupportedCalendarComponentSet)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34F40]];
}

- (id)componentsAsString
{
  id v2 = [(CalDAVSupportedCalendarComponentSet *)self compNames];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  v5 = [v4 componentsJoinedByString:@"+"];

  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: ", v5, self];

  v7 = [(CalDAVSupportedCalendarComponentSet *)self componentsAsString];
  [v6 appendFormat:@"SUPPORTED COMPONENTS: %@", v7];

  return v6;
}

- (void)addComp:(id)a3
{
  id v4 = a3;
  comps = self->_comps;
  id v8 = v4;
  if (!comps)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v7 = self->_comps;
    self->_comps = v6;

    id v4 = v8;
    comps = self->_comps;
  }
  [(NSMutableSet *)comps addObject:v4];
}

- (id)childrenToWrite
{
  uint64_t v3 = [(CalDAVSupportedCalendarComponentSet *)self comps];
  id v4 = [v3 allObjects];
  v5 = [(CoreDAVItem *)self extraChildItems];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (NSSet)compNames
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v4 = [(CalDAVSupportedCalendarComponentSet *)self comps];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(CalDAVSupportedCalendarComponentSet *)self comps];
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
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) nameAttribute];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (NSMutableSet)comps
{
  return self->_comps;
}

- (void)setComps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
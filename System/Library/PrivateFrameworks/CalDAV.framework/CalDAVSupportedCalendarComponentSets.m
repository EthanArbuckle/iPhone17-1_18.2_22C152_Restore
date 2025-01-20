@interface CalDAVSupportedCalendarComponentSets
+ (BOOL)allowedCalendars:(id)a3 contains:(id)a4;
- (CalDAVSupportedCalendarComponentSets)init;
- (id)childrenToWrite;
- (id)componentsAsString;
- (id)copyParseRules;
- (id)description;
- (void)addCompSet:(id)a3;
@end

@implementation CalDAVSupportedCalendarComponentSets

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34CD8];
  uint64_t v4 = *MEMORY[0x263F34F40];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34F40] objectClass:objc_opt_class() setterMethod:sel_addCompSet_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  v7 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CalDAVSupportedCalendarComponentSets)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34CD8] andName:@"supported-calendar-component-sets"];
}

- (id)componentsAsString
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->_componentSets count])
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableSet count](self->_componentSets, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = self->_componentSets;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "componentsAsString", (void)v13);
          [v3 addObject:v9];
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    v10 = [v3 sortedArrayUsingSelector:sel_compare_];
    v11 = [v10 componentsJoinedByString:@","];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@ %p: ", v5, self];

  uint64_t v7 = [(CalDAVSupportedCalendarComponentSets *)self componentsAsString];
  [v6 appendFormat:@"ALLOWED COMPONENTS: %@", v7];

  return v6;
}

+ (BOOL)allowedCalendars:(id)a3 contains:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v5 isEqualToString:@"kCalDAVDoesNotSupportCalendarCreation"])
    {
      BOOL v7 = 0;
    }
    else
    {
      [v5 componentsSeparatedByString:@","];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isEqualToString:", v6, (void)v15) & 1) != 0
              || ([v13 isEqualToString:@"*"] & 1) != 0)
            {
              BOOL v7 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          BOOL v7 = 0;
          if (v10) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
LABEL_17:
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)addCompSet:(id)a3
{
  id v4 = a3;
  componentSets = self->_componentSets;
  id v8 = v4;
  if (!componentSets)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    BOOL v7 = self->_componentSets;
    self->_componentSets = v6;

    id v4 = v8;
    componentSets = self->_componentSets;
  }
  [(NSMutableSet *)componentSets addObject:v4];
}

- (id)childrenToWrite
{
  uint64_t v3 = [(NSMutableSet *)self->_componentSets allObjects];
  id v4 = [(CoreDAVItem *)self extraChildItems];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end
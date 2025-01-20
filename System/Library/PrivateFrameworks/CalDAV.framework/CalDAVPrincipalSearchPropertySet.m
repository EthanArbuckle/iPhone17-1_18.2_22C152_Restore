@interface CalDAVPrincipalSearchPropertySet
+ (id)searchSetWithProperties:(id)a3;
- (BOOL)isEqualToPropertySet:(id)a3;
- (BOOL)supportsPropertySearch;
- (BOOL)supportsPropertyTypeWithNameSpace:(id)a3 andName:(id)a4;
- (BOOL)supportsWellKnownType:(int)a3;
- (CalDAVPrincipalSearchPropertySet)initWithSearchProperties:(id)a3;
- (CalDAVPrincipalSearchPropertySet)initWithStringProperties:(id)a3;
- (NSSet)stringProperties;
- (void)setStringProperties:(id)a3;
@end

@implementation CalDAVPrincipalSearchPropertySet

- (CalDAVPrincipalSearchPropertySet)initWithSearchProperties:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CalDAVPrincipalSearchPropertySet;
  v5 = [(CalDAVPrincipalSearchPropertySet *)&v27 init];
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) prop];
          v14 = [v13 extraChildItems];
          v15 = [v14 lastObject];

          if (v15)
          {
            v16 = NSString;
            v17 = [v15 nameSpace];
            v18 = [v15 name];
            v19 = [v16 CDVStringWithNameSpace:v17 andName:v18];
            [v7 addObject:v19];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    v20 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v7];
    v6 = v22;
    [(CalDAVPrincipalSearchPropertySet *)v22 setStringProperties:v20];
  }
  return v6;
}

- (CalDAVPrincipalSearchPropertySet)initWithStringProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVPrincipalSearchPropertySet;
  v5 = [(CalDAVPrincipalSearchPropertySet *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CalDAVPrincipalSearchPropertySet *)v5 setStringProperties:v4];
  }

  return v6;
}

+ (id)searchSetWithProperties:(id)a3
{
  id v3 = a3;
  id v4 = [[CalDAVPrincipalSearchPropertySet alloc] initWithSearchProperties:v3];

  return v4;
}

- (BOOL)supportsPropertyTypeWithNameSpace:(id)a3 andName:(id)a4
{
  v5 = [NSString CDVStringWithNameSpace:a3 andName:a4];
  v6 = [(CalDAVPrincipalSearchPropertySet *)self stringProperties];
  char v7 = [v6 containsObject:v5];

  return v7;
}

- (BOOL)supportsWellKnownType:(int)a3
{
  id v4 = +[CalDAVPrincipalSearchSupport namespaceAndNameForWellKnownType:*(void *)&a3];
  v5 = [(CalDAVPrincipalSearchPropertySet *)self stringProperties];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)supportsPropertySearch
{
  v2 = [(CalDAVPrincipalSearchPropertySet *)self stringProperties];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isEqualToPropertySet:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVPrincipalSearchPropertySet *)self stringProperties];
  char v6 = [v4 stringProperties];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (NSSet)stringProperties
{
  return self->_stringProperties;
}

- (void)setStringProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
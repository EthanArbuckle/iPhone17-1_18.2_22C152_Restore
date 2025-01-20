@interface CoreDAVResourceTypeItem
+ (id)copyParseRules;
- (BOOL)isTypeWithNameSpace:(id)a3 andName:(id)a4;
- (CoreDAVItemWithNoChildren)addressBook;
- (CoreDAVItemWithNoChildren)collection;
- (CoreDAVItemWithNoChildren)principal;
- (CoreDAVItemWithNoChildren)searchAddressBook;
- (CoreDAVItemWithNoChildren)shared;
- (CoreDAVItemWithNoChildren)unauthenticated;
- (CoreDAVResourceTypeItem)init;
- (NSSet)stringSet;
- (id)description;
- (void)setAddressBook:(id)a3;
- (void)setCollection:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setSearchAddressBook:(id)a3;
- (void)setShared:(id)a3;
- (void)setUnauthenticated:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVResourceTypeItem

- (CoreDAVResourceTypeItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"resourcetype"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVResourceTypeItem;
  v4 = [(CoreDAVItem *)&v12 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVResourceTypeItem *)self addressBook];
  [v3 appendFormat:@"\n  Address book: [%@]", v5];

  v6 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
  [v3 appendFormat:@"\n  Search address book: [%@]", v6];

  v7 = [(CoreDAVResourceTypeItem *)self shared];
  [v3 appendFormat:@"\n  Shared: [%@]", v7];

  v8 = [(CoreDAVResourceTypeItem *)self principal];
  [v3 appendFormat:@"\n  Principal: [%@]", v8];

  v9 = [(CoreDAVResourceTypeItem *)self collection];
  [v3 appendFormat:@"\n  Collection: [%@]", v9];

  v10 = [(CoreDAVResourceTypeItem *)self unauthenticated];
  [v3 appendFormat:@"\n  Unauthenticated: [%@]", v10];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v19 = objc_alloc(NSDictionary);
    v21 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:carddav" elementName:@"addressbook" objectClass:objc_opt_class() setterMethod:sel_setAddressBook_];
    v20 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:carddav", @"addressbook"];
    v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:carddav" elementName:@"searchaddressbook" objectClass:objc_opt_class() setterMethod:sel_setSearchAddressBook_];
    v17 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:carddav", @"searchaddressbook"];
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"shared" objectClass:objc_opt_class() setterMethod:sel_setShared_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"shared"];
    v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"principal" objectClass:objc_opt_class() setterMethod:sel_setPrincipal_];
    v6 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"principal"];
    v13 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"collection" objectClass:objc_opt_class() setterMethod:sel_setCollection_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"collection"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"unauthenticated" objectClass:objc_opt_class() setterMethod:sel_setUnauthenticated_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"unauthenticated"];
    v5 = objc_msgSend(v19, "initWithObjectsAndKeys:", v21, v20, v18, v17, v16, v15, v14, v6, v13, v7, v8, v9, 0);

    v10 = +[CoreDAVItem parseRuleCache];
    v11 = NSStringFromClass((Class)a1);
    [v10 setObject:v5 forKey:v11];
  }
  return v5;
}

- (void)write:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CoreDAVItem *)self name];
  v6 = [(CoreDAVItem *)self nameSpace];
  [v4 startElement:v5 inNamespace:v6 withAttributeNamesAndValues:0];

  v7 = [(CoreDAVResourceTypeItem *)self addressBook];
  [v7 write:v4];

  v8 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
  [v8 write:v4];

  v9 = [(CoreDAVResourceTypeItem *)self shared];
  [v9 write:v4];

  v10 = [(CoreDAVResourceTypeItem *)self principal];
  [v10 write:v4];

  v11 = [(CoreDAVResourceTypeItem *)self collection];
  [v11 write:v4];

  objc_super v12 = [(CoreDAVResourceTypeItem *)self unauthenticated];
  [v12 write:v4];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = [(CoreDAVItem *)self extraChildItems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v17++) write:v4];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  v18 = [(CoreDAVItem *)self name];
  id v19 = [(CoreDAVItem *)self nameSpace];
  [v4 endElement:v18 inNamespace:v19];
}

- (NSSet)stringSet
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = [(CoreDAVResourceTypeItem *)self addressBook];

  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = [(CoreDAVResourceTypeItem *)self addressBook];
    v7 = [v6 nameSpace];
    v8 = [(CoreDAVResourceTypeItem *)self addressBook];
    v9 = [v8 name];
    v10 = (void *)[v5 initWithCDVNameSpace:v7 andName:v9];

    [v3 addObject:v10];
  }
  v11 = [(CoreDAVResourceTypeItem *)self searchAddressBook];

  if (v11)
  {
    id v12 = [NSString alloc];
    v13 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
    uint64_t v14 = [v13 nameSpace];
    uint64_t v15 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
    uint64_t v16 = [v15 name];
    uint64_t v17 = (void *)[v12 initWithCDVNameSpace:v14 andName:v16];

    [v3 addObject:v17];
  }
  v18 = [(CoreDAVResourceTypeItem *)self shared];

  if (v18)
  {
    id v19 = [NSString alloc];
    long long v20 = [(CoreDAVResourceTypeItem *)self shared];
    long long v21 = [v20 nameSpace];
    long long v22 = [(CoreDAVResourceTypeItem *)self shared];
    long long v23 = [v22 name];
    v24 = (void *)[v19 initWithCDVNameSpace:v21 andName:v23];

    [v3 addObject:v24];
  }
  uint64_t v25 = [(CoreDAVResourceTypeItem *)self principal];

  if (v25)
  {
    id v26 = [NSString alloc];
    v27 = [(CoreDAVResourceTypeItem *)self principal];
    v28 = [v27 nameSpace];
    v29 = [(CoreDAVResourceTypeItem *)self principal];
    v30 = [v29 name];
    v31 = (void *)[v26 initWithCDVNameSpace:v28 andName:v30];

    [v3 addObject:v31];
  }
  v32 = [(CoreDAVResourceTypeItem *)self collection];

  if (v32)
  {
    id v33 = [NSString alloc];
    v34 = [(CoreDAVResourceTypeItem *)self collection];
    v35 = [v34 nameSpace];
    v36 = [(CoreDAVResourceTypeItem *)self collection];
    v37 = [v36 name];
    v38 = (void *)[v33 initWithCDVNameSpace:v35 andName:v37];

    [v3 addObject:v38];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v39 = [(CoreDAVItem *)self extraChildItems];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v45 = [NSString alloc];
        v46 = [v44 nameSpace];
        v47 = [v44 name];
        v48 = (void *)[v45 initWithCDVNameSpace:v46 andName:v47];

        [v3 addObject:v48];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v41);
  }

  if (![v3 count])
  {

    id v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)isTypeWithNameSpace:(id)a3 andName:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"DAV:"])
  {
    if ([v7 isEqualToString:@"principal"])
    {
      v8 = [(CoreDAVResourceTypeItem *)self principal];
LABEL_16:
      BOOL v9 = v8 != 0;

      goto LABEL_29;
    }
    if ([v7 isEqualToString:@"collection"])
    {
      v8 = [(CoreDAVResourceTypeItem *)self collection];
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"unauthenticated"])
    {
      v8 = [(CoreDAVResourceTypeItem *)self unauthenticated];
      goto LABEL_16;
    }
  }
  else if ([v6 isEqualToString:@"urn:ietf:params:xml:ns:carddav"])
  {
    if ([v7 isEqualToString:@"addressbook"])
    {
      v8 = [(CoreDAVResourceTypeItem *)self addressBook];
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"searchaddressbook"])
    {
      v8 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
      goto LABEL_16;
    }
  }
  else if ([v6 isEqualToString:@"http://calendarserver.org/ns/"] {
         && [v7 isEqualToString:@"shared"])
  }
  {
    v8 = [(CoreDAVResourceTypeItem *)self shared];
    goto LABEL_16;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(CoreDAVItem *)self extraChildItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [v15 nameSpace];
        if ([v16 isEqualToString:v6])
        {
          uint64_t v17 = [v15 name];
          char v18 = [v17 isEqualToString:v7];

          if (v18)
          {

            BOOL v9 = 1;
            goto LABEL_29;
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  BOOL v9 = 0;
LABEL_29:

  return v9;
}

- (CoreDAVItemWithNoChildren)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(id)a3
{
}

- (CoreDAVItemWithNoChildren)searchAddressBook
{
  return self->_searchAddressBook;
}

- (void)setSearchAddressBook:(id)a3
{
}

- (CoreDAVItemWithNoChildren)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
}

- (CoreDAVItemWithNoChildren)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
}

- (CoreDAVItemWithNoChildren)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_principal, 0);
  objc_storeStrong((id *)&self->_shared, 0);
  objc_storeStrong((id *)&self->_searchAddressBook, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
}

@end
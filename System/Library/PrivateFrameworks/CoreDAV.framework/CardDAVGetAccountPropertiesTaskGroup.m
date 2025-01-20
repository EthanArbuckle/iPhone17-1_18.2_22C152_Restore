@interface CardDAVGetAccountPropertiesTaskGroup
- (NSSet)addressBookHomes;
- (NSSet)directoryGatewayURLs;
- (id)_copyAccountPropertiesPropFindElements;
- (id)description;
- (id)directoryGatewayURL;
- (id)homeSet;
- (void)_setPropertiesFromParsedResponses:(id)a3;
@end

@implementation CardDAVGetAccountPropertiesTaskGroup

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  v3 = [(CoreDAVGetAccountPropertiesTaskGroup *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"\tAddressBook home urls: %@\n", self->_addressBookHomes];
  [v4 appendFormat:@"\tDirectory Gateway urls: %@\n", self->_directoryGatewayURLs];
  return v4;
}

- (id)_copyAccountPropertiesPropFindElements
{
  v5.receiver = self;
  v5.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  id v2 = [(CoreDAVGetAccountPropertiesTaskGroup *)&v5 _copyAccountPropertiesPropFindElements];
  v3 = (void *)[v2 mutableCopy];
  [v3 CDVAddItemParserMappingWithNameSpace:@"urn:ietf:params:xml:ns:carddav" name:@"addressbook-home-set" parseClass:objc_opt_class()];
  [v3 CDVAddItemParserMappingWithNameSpace:@"urn:ietf:params:xml:ns:carddav" name:@"directory-gateway" parseClass:objc_opt_class()];

  return v3;
}

- (id)homeSet
{
  return self->_addressBookHomes;
}

- (void)_setPropertiesFromParsedResponses:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        v7 = [*(id *)(*((void *)&v17 + 1) + 8 * i) successfulPropertiesToValues];
        v8 = [v7 CDVObjectForKeyWithNameSpace:@"urn:ietf:params:xml:ns:carddav" andName:@"addressbook-home-set"];
        v9 = [v8 hrefsAsFullURLs];
        if ([v9 count]) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        objc_storeStrong((id *)&self->_addressBookHomes, v10);
        v11 = [v7 CDVObjectForKeyWithNameSpace:@"urn:ietf:params:xml:ns:carddav" andName:@"directory-gateway"];
        v12 = [v11 hrefsAsFullURLs];
        if ([v12 count]) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        objc_storeStrong((id *)&self->_directoryGatewayURLs, v13);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  v16.receiver = self;
  v16.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  [(CoreDAVGetAccountPropertiesTaskGroup *)&v16 _setPropertiesFromParsedResponses:obj];
}

- (id)directoryGatewayURL
{
  return [(NSSet *)self->_directoryGatewayURLs anyObject];
}

- (NSSet)addressBookHomes
{
  return self->_addressBookHomes;
}

- (NSSet)directoryGatewayURLs
{
  return self->_directoryGatewayURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryGatewayURLs, 0);
  objc_storeStrong((id *)&self->_addressBookHomes, 0);
}

@end
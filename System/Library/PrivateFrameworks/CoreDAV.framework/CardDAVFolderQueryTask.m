@interface CardDAVFolderQueryTask
- (CardDAVFolderQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6;
- (void)addFiltersToXMLData:(id)a3;
@end

@implementation CardDAVFolderQueryTask

- (CardDAVFolderQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  v9.receiver = self;
  v9.super_class = (Class)CardDAVFolderQueryTask;
  v6 = [(CoreDAVContainerQueryTask *)&v9 _initWithSearchTerms:a3 searchLimit:a4 atURL:a5 appSpecificDataItemClass:a6];
  v7 = (CardDAVFolderQueryTask *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 39, @"urn:ietf:params:xml:ns:carddav");
    objc_storeStrong((id *)&v7->super._appSpecificQueryCommand, @"addressbook-query");
    objc_storeStrong((id *)&v7->super._appSpecificDataProp, @"address-data");
  }
  return v7;
}

- (void)addFiltersToXMLData:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = @"urn:ietf:params:xml:ns:carddav";
  objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", @"anyof", 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"NICKNAME", @"FN", @"EMAIL", @"ADR", @"IMPP", @"ORG", @"TEL", 0);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    v18 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v6;
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * v6);
        v7 = v4;
        v8 = v5;
        objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", @"prop-filter", v5, @"name", v15, @"test", @"allof", 0);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        objc_super v9 = self->super._searchTerms;
        uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_msgSend(v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", @"text-match", v8, *(void *)(*((void *)&v21 + 1) + 8 * i), @"collation", @"i;unicode-casemap",
                @"match-type",
                @"contains",
                0);
            }
            uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }

        id v4 = v7;
        v5 = v8;
        [v7 endElement:@"prop-filter" inNamespace:v8];
        uint64_t v6 = v20 + 1;
        self = v18;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

  [v4 endElement:@"filter" inNamespace:v5];
  if (self->super._searchLimit)
  {
    [v4 startElement:@"limit" inNamespace:v5 withAttributeNamesAndValues:0];
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->super._searchLimit);
    [v4 appendElement:@"nresults" inNamespace:v5 withStringContent:v14 withAttributeNamesAndValues:0];

    [v4 endElement:@"limit" inNamespace:v5];
  }
}

@end
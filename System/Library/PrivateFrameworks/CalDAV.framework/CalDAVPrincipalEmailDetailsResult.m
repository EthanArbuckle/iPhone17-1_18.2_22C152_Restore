@interface CalDAVPrincipalEmailDetailsResult
+ (id)resultFromResponseItem:(id)a3;
- (NSSet)preferredAddresses;
- (NSString)displayName;
- (NSURL)principalURL;
- (id)addresses;
- (id)description;
- (void)setDisplayName:(id)a3;
- (void)setPreferredAddresses:(id)a3;
- (void)setPrincipalURL:(id)a3;
@end

@implementation CalDAVPrincipalEmailDetailsResult

+ (id)resultFromResponseItem:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(CalDAVPrincipalEmailDetailsResult);
  v5 = [v3 firstHref];
  v6 = [v5 payloadAsFullURL];
  [(CalDAVPrincipalEmailDetailsResult *)v4 setPrincipalURL:v6];

  v30 = v3;
  v7 = [v3 successfulPropertiesToValues];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __60__CalDAVPrincipalEmailDetailsResult_resultFromResponseItem___block_invoke;
  v39[3] = &unk_2641EC2C0;
  id v29 = v7;
  id v40 = v29;
  v8 = (void (**)(void, void))MEMORY[0x216696070](v39);
  v9 = v8[2](v8, 3);
  v10 = [v9 payloadAsString];
  [(CalDAVPrincipalEmailDetailsResult *)v4 setDisplayName:v10];

  v11 = [MEMORY[0x263EFF9C0] set];
  v12 = v8[2](v8, 6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v13 = [v12 hrefs];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = +[CalDAVCalendarUserAddressItemTranslator calDAVUserAddressForItem:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          if (v18) {
            [v11 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v15);
    }

    v4 = v28;
  }
  v19 = v8[2](v8, 4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v20 = [v19 emailAddresses];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = +[CalDAVCalendarUserAddressItemTranslator calDAVUserAddressForItem:*(void *)(*((void *)&v31 + 1) + 8 * j) prependMailTo:1];
          if (v25) {
            [v11 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v22);
    }
  }
  v26 = [MEMORY[0x263EFFA08] setWithSet:v11];
  [(CalDAVPrincipalEmailDetailsResult *)v4 setPreferredAddresses:v26];

  return v4;
}

id __60__CalDAVPrincipalEmailDetailsResult_resultFromResponseItem___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CalDAVPrincipalSearchSupport namespaceAndNameForWellKnownType:a2];
  v4 = [v2 objectForKey:v3];

  return v4;
}

- (id)addresses
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CalDAVPrincipalEmailDetailsResult *)self preferredAddresses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) address];
        v10 = [v9 absoluteString];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CalDAVPrincipalEmailDetailsResult *)self displayName];
  uint64_t v7 = [(CalDAVPrincipalEmailDetailsResult *)self addresses];
  v8 = [v3 stringWithFormat:@"<%@ %p: '%@' addresses: (%lu)>", v5, self, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSSet)preferredAddresses
{
  return self->_preferredAddresses;
}

- (void)setPreferredAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
}

@end
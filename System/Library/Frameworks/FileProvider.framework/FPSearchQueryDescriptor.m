@interface FPSearchQueryDescriptor
- (BOOL)avoidCoreSpotlightSearch;
- (BOOL)isEqualToItemQueryDescriptor:(id)a3;
- (BOOL)isThirdPartySearchOnServer;
- (BOOL)keepCollectorsAlive;
- (NSString)searchQueryString;
- (id)_scopes;
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
- (unint64_t)hash;
- (void)augmentQueryContext:(id)a3;
- (void)setAvoidCoreSpotlightSearch:(BOOL)a3;
- (void)setSearchQueryString:(id)a3;
- (void)setThirdPartySearchOnServer:(BOOL)a3;
@end

@implementation FPSearchQueryDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"SRCH"];
}

- (id)queryStringForMountPoint:(id)a3
{
  uint64_t v4 = [(FPSearchQueryDescriptor *)self searchQueryString];
  if (v4
    && (v5 = (void *)v4,
        [(FPSearchQueryDescriptor *)self searchQueryString],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:&stru_1EF68D1F8],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v9 = [(FPSpotlightQueryDescriptor *)self settings];
    v10 = [v9 allowedFileTypes];

    v11 = [(FPSpotlightQueryDescriptor *)self settings];
    uint64_t v12 = [v11 excludedFileTypes];
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      v14 = (void *)v12;
    }
    id v15 = v14;

    v16 = (void *)*MEMORY[0x1E4F443C8];
    v17 = [(id)*MEMORY[0x1E4F443C8] identifier];
    char v18 = [v10 containsObject:v17];

    if ((v18 & 1) == 0)
    {
      v19 = [v16 identifier];
      uint64_t v20 = [v10 arrayByAddingObject:v19];

      v10 = (void *)v20;
    }
    v21 = NSString;
    v22 = [(FPSearchQueryDescriptor *)self searchQueryString];
    v23 = [(FPSpotlightQueryDescriptor *)self settings];
    v24 = [v23 allowedProviders];
    v25 = FPFileProviderOriginatedItemsQueryStringFragment(v24);
    v26 = FPContentTypeQueryStringForFileTypes(v10, v15);

    v8 = [v21 stringWithFormat:@"((%@) && %@ && %@)", v22, v25, v26];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)augmentQueryContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPSearchQueryDescriptor;
  [(FPSpotlightQueryDescriptor *)&v12 augmentQueryContext:v4];
  v5 = [(FPSearchQueryDescriptor *)self _scopes];
  [v4 setScopes:v5];

  v6 = [(FPSpotlightQueryDescriptor *)self settings];
  char v7 = [v6 searchQuery];
  v8 = [v7 keyboardLanguage];

  if (v8)
  {
    v9 = [(FPSpotlightQueryDescriptor *)self settings];
    v10 = [v9 searchQuery];
    v11 = [v10 keyboardLanguage];
    [v4 setKeyboardLanguage:v11];
  }
}

- (id)_scopes
{
  v2 = [(FPSpotlightQueryDescriptor *)self settings];
  v3 = [v2 searchQuery];
  id v4 = [v3 csQueryScopes];

  return v4;
}

- (BOOL)isEqualToItemQueryDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPSearchQueryDescriptor;
  if ([(FPSpotlightQueryDescriptor *)&v11 isEqualToItemQueryDescriptor:v4])
  {
    v5 = [(FPSearchQueryDescriptor *)self _scopes];
    v6 = [v4 _scopes];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      char v7 = [(FPSearchQueryDescriptor *)self _scopes];
      v8 = [v4 _scopes];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(FPSearchQueryDescriptor *)self queryStringForMountPoint:@"FPQueryCollectionDefaultMountPointIdentifier"];
  uint64_t v4 = [v3 hash];

  unint64_t v5 = [(FPSpotlightQueryDescriptor *)self desiredCount];
  v6 = [(FPSearchQueryDescriptor *)self _scopes];
  unint64_t v7 = v5 ^ [v6 hash] ^ v4;

  return v7;
}

- (BOOL)keepCollectorsAlive
{
  return 0;
}

- (NSString)searchQueryString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchQueryString:(id)a3
{
}

- (BOOL)isThirdPartySearchOnServer
{
  return self->_thirdPartySearchOnServer;
}

- (void)setThirdPartySearchOnServer:(BOOL)a3
{
  self->_thirdPartySearchOnServer = a3;
}

- (BOOL)avoidCoreSpotlightSearch
{
  return self->_avoidCoreSpotlightSearch;
}

- (void)setAvoidCoreSpotlightSearch:(BOOL)a3
{
  self->_avoidCoreSpotlightSearch = a3;
}

- (void).cxx_destruct
{
}

@end
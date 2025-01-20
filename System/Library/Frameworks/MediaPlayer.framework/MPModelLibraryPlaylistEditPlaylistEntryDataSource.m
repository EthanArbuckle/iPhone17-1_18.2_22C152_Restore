@interface MPModelLibraryPlaylistEditPlaylistEntryDataSource
- (MPModelLibraryPlaylistEditPlaylistEntryDataSource)initWithPlaylistEntries:(id)a3;
- (id)description;
- (void)loadEntriesWithCompletion:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditPlaylistEntryDataSource

- (void).cxx_destruct
{
}

- (void)loadEntriesWithCompletion:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPModelLibraryPlaylistEditDataSource *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@ %p : %@>{\n", v4, self, v5];

  return v6;
}

- (MPModelLibraryPlaylistEditPlaylistEntryDataSource)initWithPlaylistEntries:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 firstObject];
  v7 = [v6 anyObject];

  v8 = [v7 identifiers];
  v9 = [v8 library];
  uint64_t v10 = [v9 persistentID];

  if (v10)
  {
    v11 = NSString;
    v12 = [v8 library];
    objc_msgSend(v11, "stringWithFormat:", @"l.%lld", objc_msgSend(v12, "persistentID"));
LABEL_5:
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v13 = [v8 universalStore];
  uint64_t v14 = [v13 subscriptionAdamID];

  if (v14)
  {
    v15 = NSString;
    v12 = [v8 universalStore];
    objc_msgSend(v15, "stringWithFormat:", @"s.%lld", objc_msgSend(v12, "subscriptionAdamID"));
    goto LABEL_5;
  }
  v16 = @"u";
LABEL_6:
  v17 = NSString;
  v18 = MSVNanoIDCreateTaggedPointer();
  v19 = [v17 stringWithFormat:@"e-%@-%@", v16, v18];

  v45.receiver = self;
  v45.super_class = (Class)MPModelLibraryPlaylistEditPlaylistEntryDataSource;
  v20 = [(MPModelLibraryPlaylistEditDataSource *)&v45 initWithIdentifier:v19];
  v21 = v20;
  if (v20)
  {
    v35 = v19;
    v36 = v16;
    v38 = v20;
    SEL v34 = a2;
    v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v37 = v5;
    id obj = v5;
    uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v41 + 1) + 8 * v26);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v30 = [MEMORY[0x1E4F28B00] currentHandler];
            [v30 handleFailureInMethod:v34, v38, @"MPModelLibraryPlaylistEditPlaylistEntryDataSource.m", 35, @"Object is not a playlist entry: %@", objc_opt_class() object file lineNumber description];
          }
          v28 = [v27 identifiers];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __77__MPModelLibraryPlaylistEditPlaylistEntryDataSource_initWithPlaylistEntries___block_invoke;
          v40[3] = &unk_1E57F4AB8;
          v40[4] = v27;
          v29 = (void *)[v27 copyWithIdentifiers:v28 block:v40];

          [v22 addObject:v29];
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v24);
    }

    uint64_t v31 = [v22 copy];
    v21 = v38;
    playlistEntries = v38->_playlistEntries;
    v38->_playlistEntries = (NSArray *)v31;

    id v5 = v37;
    v16 = v36;
    v19 = v35;
  }

  return v21;
}

void __77__MPModelLibraryPlaylistEditPlaylistEntryDataSource_initWithPlaylistEntries___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryUniversalIdentifier"])
  {
    v3 = [v11 universalIdentifier];
  }
  else
  {
    v3 = &stru_1EE680640;
  }
  if ([*(id *)(a1 + 32) hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryPositionUniversalIdentifier"])
  {
    uint64_t v4 = [v11 positionUniversalIdentifier];
  }
  else
  {
    uint64_t v4 = &stru_1EE680640;
  }
  if (![(__CFString *)v3 length])
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];
    v7 = [v6 lowercaseString];
    [v11 setUniversalIdentifier:v7];
  }
  if (![(__CFString *)v4 length])
  {
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v9 lowercaseString];
    [v11 setPositionUniversalIdentifier:v10];
  }
}

@end
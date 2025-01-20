@interface MPAssistantSearch
- (id)_audiobooksByName:(id)a3;
- (id)_itemsByTitle:(id)a3 mediaTypes:(int64_t)a4;
- (id)_perform;
- (id)_playlistsByDateCreatedOrder:(id)a3;
- (id)_playlistsByName:(id)a3 isGeniusMix:(BOOL)a4;
- (id)_songCollectionsWithGroupingType:(int64_t)a3 searchString:(id)a4 mediaTypes:(int64_t)a5;
- (id)_stationDictionariesWithParent:(unint64_t)a3;
- (id)_stationDictionaryForGenreName:(id)a3;
- (id)_stationDictionaryForGenreName:(id)a3 parent:(unint64_t)a4;
- (id)_stationWithName:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

- (id)_stationDictionaryForGenreName:(id)a3
{
  return [(MPAssistantSearch *)self _stationDictionaryForGenreName:a3 parent:0];
}

- (id)_stationDictionaryForGenreName:(id)a3 parent:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MPAssistantSearch *)self _stationDictionariesWithParent:a4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v8 = [v7 objectForKey:@"children"];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    v23 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 objectForKey:@"name"];
        uint64_t v15 = [v14 compare:v6 options:129];

        if (!v15)
        {
          uint64_t v20 = [v13 objectForKey:@"station-dict"];
LABEL_15:
          v21 = (void *)v20;
          v7 = v23;
          goto LABEL_16;
        }
        if (a4)
        {
          v16 = [v13 objectForKey:@"children"];
          uint64_t v17 = [v16 count];

          if (!v17) {
            continue;
          }
        }
        v18 = [v13 objectForKey:@"id"];
        uint64_t v19 = [v18 unsignedLongLongValue];

        uint64_t v20 = [(MPAssistantSearch *)self _stationDictionaryForGenreName:v6 parent:v19];
        if (v20) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      v21 = 0;
      v7 = v23;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_16:

  return v21;
}

- (id)_stationDictionariesWithParent:(unint64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1D4232FC4;
  uint64_t v17 = sub_1D4232FD4;
  id v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F946B8]) initWithParentNodeID:a3];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1D4232FDC;
    v10[3] = &unk_1E69E2BD0;
    v12 = &v13;
    id v6 = v4;
    uint64_t v11 = v6;
    [v5 startWithCompletionHandler:v10];
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v6, v7);

    dispatch_semaphore_t v4 = 0;
  }
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_stationWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    dispatch_semaphore_t v4 = [MEMORY[0x1E4F946C0] sharedModel];
    v5 = [v4 userStations];
    id v6 = [v4 featuredStations];
    dispatch_time_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "name", (void)v16);
          [v13 rangeOfString:v3 options:129];
          if (v14)
          {
            id v9 = v12;

            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_playlistsByDateCreatedOrder:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = (void *)MEMORY[0x1E4F31968];
  uint64_t v5 = *MEMORY[0x1E4F31598];
  id v6 = a3;
  dispatch_time_t v7 = [v4 predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:v5];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  id v9 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31580]];
  uint64_t v10 = [MEMORY[0x1E4F31968] predicateWithValue:v8 forProperty:*MEMORY[0x1E4F31590]];
  id v11 = objc_alloc(MEMORY[0x1E4F31970]);
  v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, v9, v10, 0);
  uint64_t v13 = (void *)[v11 initWithFilterPredicates:v12];

  uint64_t v14 = *MEMORY[0x1E4F31570];
  v27[0] = *MEMORY[0x1E4F31570];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v13 _setOrderingProperties:v15];

  LODWORD(v15) = [v6 isEqualToString:@"Descending"];
  if (v15)
  {
    uint64_t v25 = v14;
    long long v26 = &unk_1F2BFEC90;
    long long v16 = (void *)MEMORY[0x1E4F1C9E8];
    long long v17 = &v26;
    long long v18 = &v25;
  }
  else
  {
    uint64_t v23 = v14;
    long long v24 = &unk_1F2BFECA8;
    long long v16 = (void *)MEMORY[0x1E4F1C9E8];
    long long v17 = &v24;
    long long v18 = &v23;
  }
  long long v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  [v13 _setOrderingDirectionMappings:v19];

  [v13 setUseSections:0];
  [v13 setGroupingType:6];
  [v13 setIgnoreSystemFilterPredicates:1];
  [v13 setShouldIncludeNonLibraryEntities:1];
  uint64_t v20 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
  [v13 setMediaLibrary:v20];

  uint64_t v21 = [v13 collections];

  return v21;
}

- (id)_songCollectionsWithGroupingType:(int64_t)a3 searchString:(id)a4 mediaTypes:(int64_t)a5
{
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F31928] titlePropertyForGroupingType:a3];
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F31968];
    id v11 = [NSNumber numberWithInteger:a5];
    v12 = [v10 predicateWithValue:v11 forProperty:*MEMORY[0x1E4F31420]];

    if (v8)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      uint64_t v14 = [MEMORY[0x1E4F31AA0] predicateWithSearchString:v8 forProperties:v13];
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F31970]);
    long long v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v12, v14, 0);
    long long v18 = (void *)[v16 initWithFilterPredicates:v17];

    [v18 setUseSections:0];
    [v18 setGroupingType:a3];
    [v18 setIgnoreSystemFilterPredicates:1];
    [v18 setShouldIncludeNonLibraryEntities:1];
    long long v19 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
    [v18 setMediaLibrary:v19];

    uint64_t v15 = [v18 collections];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F1C978] array];
  }

  return v15;
}

- (id)_playlistsByName:(id)a3 isGeniusMix:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_time_t v7 = (void *)MEMORY[0x1E4F31968];
  id v8 = [NSNumber numberWithBool:v4];
  id v9 = [v7 predicateWithValue:v8 forProperty:*MEMORY[0x1E4F31588]];

  uint64_t v10 = MEMORY[0x1E4F1CC28];
  id v11 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31580]];
  v12 = [MEMORY[0x1E4F31968] predicateWithValue:v10 forProperty:*MEMORY[0x1E4F31590]];
  if (v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F315A0]];
    uint64_t v14 = [MEMORY[0x1E4F31AA0] predicateWithSearchString:v6 forProperties:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F31970]);
  id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v9, v11, v12, v14, 0);
  long long v17 = (void *)[v15 initWithFilterPredicates:v16];

  [v17 setUseSections:0];
  [v17 setGroupingType:6];
  [v17 setIgnoreSystemFilterPredicates:1];
  [v17 setShouldIncludeNonLibraryEntities:1];
  long long v18 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
  [v17 setMediaLibrary:v18];

  long long v19 = [v17 collections];

  return v19;
}

- (id)_itemsByTitle:(id)a3 mediaTypes:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F31968];
  dispatch_time_t v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithInteger:a4];
  uint64_t v10 = [v6 predicateWithValue:v9 forProperty:*MEMORY[0x1E4F31420]];

  id v11 = [MEMORY[0x1E4F1CA80] setWithObject:*MEMORY[0x1E4F31538]];
  v12 = [MEMORY[0x1E4F31AA0] predicateWithSearchString:v8 forProperties:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F31970]);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v10, v12, 0);
  id v15 = (void *)[v13 initWithFilterPredicates:v14];

  [v15 setUseSections:0];
  [v15 setIgnoreSystemFilterPredicates:1];
  [v15 setShouldIncludeNonLibraryEntities:1];
  id v16 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
  [v15 setMediaLibrary:v16];

  long long v17 = [v15 items];

  return v17;
}

- (id)_audiobooksByName:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = *MEMORY[0x1E4F312E8];
    id v6 = a3;
    dispatch_time_t v7 = [v4 setWithObject:v5];
    id v8 = [MEMORY[0x1E4F31AA0] predicateWithSearchString:v6 forProperties:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F31970]);
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  id v11 = (void *)[v9 initWithFilterPredicates:v10];

  [v11 setUseSections:0];
  [v11 setGroupingType:10];
  [v11 setIgnoreSystemFilterPredicates:1];
  [v11 setShouldIncludeNonLibraryEntities:1];
  v12 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:self->_userIdentity];
  [v11 setMediaLibrary:v12];

  id v13 = [v11 collections];

  return v13;
}

- (id)_perform
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(SAMPSearch *)self maxResults];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  dispatch_time_t v7 = [(SAMPSearch *)self searchTypes];
  id v8 = [v6 setWithArray:v7];

  uint64_t v9 = [v8 containsObject:*MEMORY[0x1E4F97428]];
  uint64_t v10 = [(SAMPSearch *)self constraints];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1D4233EB4;
  v34[3] = &unk_1E69E2B58;
  id v11 = v5;
  id v35 = v11;
  v36 = self;
  uint64_t v38 = v9;
  id v12 = v8;
  id v37 = v12;
  [v10 enumerateObjectsUsingBlock:v34];

  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = sub_1D4234948;
  v31 = &unk_1E69E2BA8;
  id v13 = v3;
  id v32 = v13;
  int64_t v33 = v4;
  [v11 enumerateObjectsUsingBlock:&v28];
  if (objc_msgSend(v13, "count", v28, v29, v30, v31) || !sub_1D4244E1C(self->_userIdentity))
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F96860]);
    [v20 setResults:v13];
    if (![(NSString *)self->_requestAceHash length])
    {
      uint64_t v21 = [(MPAssistantSearch *)self aceId];
      sub_1D4244ECC(@"Search", v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v22;
    }
    long long v24 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = self->_requestAceHash;
      uint64_t v26 = [v13 count];
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      __int16 v41 = 2048;
      uint64_t v42 = v26;
      _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: found %ld results.", buf, 0x16u);
    }
  }
  else
  {
    if (![(NSString *)self->_requestAceHash length])
    {
      uint64_t v14 = [(MPAssistantSearch *)self aceId];
      sub_1D4244ECC(@"Search", v14);
      id v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v16 = self->_requestAceHash;
      self->_requestAceHash = v15;
    }
    long long v17 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = self->_requestAceHash;
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_impl(&dword_1D422A000, v17, OS_LOG_TYPE_ERROR, "Search (search) <%{public}@>: still loading library", buf, 0xCu);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v20 = (id)[v19 initWithErrorCode:*MEMORY[0x1E4F97398]];
  }

  return v20;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    id v5 = [(MPAssistantSearch *)self aceId];
    sub_1D4244ECC(@"Search", v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Search (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  [(MPAssistantSearch *)self _prepare];
  uint64_t v10 = self->_requestAceHash;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D4234C04;
  v12[3] = &unk_1E69E3F08;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  sub_1D4246230(@"Search", v10, 0, 0, v12);
}

@end
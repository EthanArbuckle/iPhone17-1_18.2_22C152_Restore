@interface MapsSuggestionsRealContactsConnector
- (NSString)uniqueName;
- (id)_contactForIdentifier:(void *)a3 usingRequest:;
- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)contactForIdentifier:(id)a3;
- (id)dataForContactWithIdentifier:(id)a3;
- (id)imageDataForIdentifier:(id)a3;
- (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4;
- (id)store;
- (void)receivedNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListeningForChanges;
- (void)stopListeningForChanges;
@end

@implementation MapsSuggestionsRealContactsConnector

- (void)setDelegate:(id)a3
{
}

- (id)store
{
  if (a1)
  {
    if (qword_1EB6F00E0 != -1) {
      dispatch_once(&qword_1EB6F00E0, &__block_literal_global);
    }
    a1 = (id)_MergedGlobals_24;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __45__MapsSuggestionsRealContactsConnector_store__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v0;
}

- (void)startListeningForChanges
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_receivedNotification_ name:*MEMORY[0x1E4F1AF88] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_receivedNotification_ name:MapsContactsAuthorizationGrantedNotification object:0];
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      v8 = "MapsSuggestionsRealContactsConnector.m";
      __int16 v9 = 1026;
      int v10 = 53;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsRealContactsConnector startListeningForChanges]";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)stopListeningForChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = -[MapsSuggestionsRealContactsConnector store](self);
  v8 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:a4];

  return v8;
}

- (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4
{
  return (id)[MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:a3 addCountryName:a4];
}

- (void)receivedNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = GEOFindOrCreateLog();
    int v7 = v6;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v8 = [v4 name];
        int v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Received notification: %@", (uint8_t *)&v14, 0xCu);
      }
      __int16 v9 = [v4 name];
      char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1AF88]];

      if (v10)
      {
        [WeakRetained contactsDidUpdate];
      }
      else
      {
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [v4 name];
          int v14 = 138412290;
          v15 = v13;
          _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Got unknown notification: %@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      __int16 v11 = v6;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446722;
        v15 = "MapsSuggestionsRealContactsConnector.m";
        __int16 v16 = 1026;
        int v17 = 88;
        __int16 v18 = 2082;
        v19 = "-[MapsSuggestionsRealContactsConnector receivedNotification:]";
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
      }

      id WeakRetained = 0;
    }
  }
  else
  {
    id WeakRetained = GEOFindOrCreateLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      __int16 v16 = 1024;
      int v17 = 86;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsRealContactsConnector receivedNotification:]";
      __int16 v20 = 2082;
      v21 = "nil == (notification)";
      _os_log_impl(&dword_1A70DF000, WeakRetained, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a notification", (uint8_t *)&v14, 0x26u);
    }
  }
}

- (id)contactForIdentifier:(id)a3
{
  return -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, a3, 0);
}

- (id)_contactForIdentifier:(void *)a3 usingRequest:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!a1)
  {
LABEL_14:
    id v23 = 0;
    goto LABEL_17;
  }
  if (!v5)
  {
    v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 136446978;
      *(void *)&v31[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 110;
      *(_WORD *)&v31[18] = 2082;
      *(void *)&v31[20] = "-[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:]";
      *(_WORD *)&v31[28] = 2082;
      *(void *)&v31[30] = "nil == (identifier)";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier", v31, 0x26u);
    }

    goto LABEL_14;
  }
  *(void *)v31 = 0;
  *(void *)&v31[8] = v31;
  *(void *)&v31[16] = 0x3032000000;
  *(void *)&v31[24] = __Block_byref_object_copy__0;
  *(void *)&v31[32] = __Block_byref_object_dispose__0;
  id v32 = 0;
  id v8 = v6;
  if (!v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1B908]);
    uint64_t v10 = *MEMORY[0x1E4F1ADE0];
    v30[0] = *MEMORY[0x1E4F1ADF0];
    v30[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1AEB0];
    v30[2] = *MEMORY[0x1E4F1AF10];
    v30[3] = v11;
    uint64_t v12 = *MEMORY[0x1E4F1AEA0];
    v30[4] = *MEMORY[0x1E4F1AEB8];
    v30[5] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1AEE0];
    v30[6] = *MEMORY[0x1E4F1AEC0];
    v30[7] = v13;
    int v14 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v30[8] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:9];
    id v8 = (id)[v9 initWithKeysToFetch:v15];
  }
  __int16 v16 = (void *)MEMORY[0x1E4F1B8F8];
  int v17 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
  __int16 v18 = [v16 predicateForContactsMatchingPhoneNumber:v17];
  [v8 setPredicate:v18];

  if ([v5 containsString:@"@"])
  {
    v19 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v5];
    [v8 setPredicate:v19];
  }
  [v8 setSortOrder:1];
  __int16 v20 = -[MapsSuggestionsRealContactsConnector store](a1);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __75__MapsSuggestionsRealContactsConnector__contactForIdentifier_usingRequest___block_invoke;
  v26[3] = &unk_1E5CB7DE0;
  v26[4] = v31;
  id v27 = 0;
  [v20 enumerateContactsWithFetchRequest:v8 error:&v27 usingBlock:v26];
  id v21 = v27;

  if (v21)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v21;
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "Error fetching contact names %@", buf, 0xCu);
    }

    id v23 = 0;
  }
  else
  {
    id v23 = *(id *)(*(void *)&v31[8] + 40);
  }

  _Block_object_dispose(v31, 8);
LABEL_17:

  return v23;
}

void __75__MapsSuggestionsRealContactsConnector__contactForIdentifier_usingRequest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
  *a3 = 1;
}

- (id)imageDataForIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
    id v6 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E4F1ADF0], *MEMORY[0x1E4F1ADE0], *MEMORY[0x1E4F1AE28], *MEMORY[0x1E4F1AF98], *MEMORY[0x1E4F1AE20]);
    v15[5] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:6];
    id v8 = [v5 initWithKeysToFetch:v7];

    id v9 = -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, v4, v8);
    uint64_t v10 = 0;
    if ([v9 imageDataAvailable])
    {
      uint64_t v11 = [v9 thumbnailImageData];
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [v9 imageData];
      }
      uint64_t v10 = v13;
    }
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      __int16 v18 = 1024;
      int v19 = 151;
      __int16 v20 = 2082;
      id v21 = "-[MapsSuggestionsRealContactsConnector imageDataForIdentifier:]";
      __int16 v22 = 2082;
      id v23 = "nil == (identifier)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier", buf, 0x26u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)dataForContactWithIdentifier:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
  if (self)
  {
    id v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    *(void *)buf = v6;
    id v7 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
    uint64_t v8 = *MEMORY[0x1E4F1AEB0];
    *(void *)&buf[8] = v7;
    *(void *)&buf[16] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AEA0];
    uint64_t v27 = *MEMORY[0x1E4F1ADF0];
    uint64_t v28 = v9;
    uint64_t v10 = *MEMORY[0x1E4F1AEB8];
    uint64_t v29 = *MEMORY[0x1E4F1ADE0];
    uint64_t v30 = v10;
    uint64_t v11 = *MEMORY[0x1E4F1AEF8];
    uint64_t v31 = *MEMORY[0x1E4F1AEC0];
    uint64_t v32 = v11;
    uint64_t v12 = *MEMORY[0x1E4F1AEF0];
    uint64_t v33 = *MEMORY[0x1E4F1AF00];
    uint64_t v34 = v12;
    uint64_t v13 = *MEMORY[0x1E4F1AFA8];
    uint64_t v35 = *MEMORY[0x1E4F1AED8];
    uint64_t v36 = v13;
    uint64_t v14 = *MEMORY[0x1E4F1ADC8];
    uint64_t v37 = *MEMORY[0x1E4F1AEE0];
    uint64_t v38 = v14;
    uint64_t v15 = *MEMORY[0x1E4F1AFB0];
    uint64_t v39 = *MEMORY[0x1E4F1AF10];
    uint64_t v40 = v15;
    uint64_t v16 = *MEMORY[0x1E4F1AE28];
    uint64_t v41 = *MEMORY[0x1E4F1AE20];
    uint64_t v42 = v16;
    uint64_t v43 = *MEMORY[0x1E4F1AF98];
    int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:20];
  }
  else
  {
    int v17 = 0;
  }
  __int16 v18 = (void *)[v5 initWithKeysToFetch:v17];

  int v19 = -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, v4, v18);
  id v25 = 0;
  __int16 v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v25];
  id v21 = v25;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "Error serializing CNContact with identifier: %@. Error: %@", buf, 0x16u);
    }
  }
  return v20;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
}

@end
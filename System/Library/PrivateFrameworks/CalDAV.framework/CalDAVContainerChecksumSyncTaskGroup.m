@interface CalDAVContainerChecksumSyncTaskGroup
- (BOOL)_hadOutOfDateCollectionToken;
- (BOOL)mismatchDetected;
- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5;
- (CalDAVContainerChecksumSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9;
- (CoreDAVItemParserMapping)bestServerChecksumVersion;
- (NSArray)preferredChecksumVersions;
- (id)_calculatedCalendarHome;
- (id)copyAdditionalResourcePropertiesToFetch;
- (void)_handleResponseToChecksumPropfind:(id)a3;
- (void)_serverChecksumSupportPropfind;
- (void)deleteResourceURLs:(id)a3;
- (void)receivedPropertiesToValues:(id)a3 forURL:(id)a4;
- (void)setBestServerChecksumVersion:(id)a3;
- (void)setPreferredChecksumVersions:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVContainerChecksumSyncTaskGroup

- (CalDAVContainerChecksumSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9
{
  v15.receiver = self;
  v15.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  v9 = [(CalDAVContainerSyncTaskGroup *)&v15 initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:a6 accountInfoProvider:a7 taskManager:a8 appSpecificCalendarItemClass:a9];
  uint64_t v10 = (int)*MEMORY[0x263F34C20];
  objc_storeStrong((id *)&v9->_unusedCTag, *(id *)((char *)&v9->super.super.super.super.isa + v10));
  v11 = *(Class *)((char *)&v9->super.super.super.super.isa + v10);
  *(Class *)((char *)&v9->super.super.super.super.isa + v10) = 0;

  uint64_t v12 = (int)*MEMORY[0x263F34C28];
  objc_storeStrong((id *)&v9->_unusedSyncToken, *(id *)((char *)&v9->super.super.super.super.isa + v12));
  v13 = *(Class *)((char *)&v9->super.super.super.super.isa + v12);
  *(Class *)((char *)&v9->super.super.super.super.isa + v12) = 0;

  *((unsigned char *)&v9->super.super.super.super.isa + (int)*MEMORY[0x263F34C38]) = 0;
  *((unsigned char *)&v9->super.super.super.super.isa + (int)*MEMORY[0x263F34C00]) = 1;
  v9->_mismatchDetected = 0;
  return v9;
}

- (void)_handleResponseToChecksumPropfind:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (int)*MEMORY[0x263F34C70];
  if ([*(id *)((char *)&self->super.super.super.super.isa + v5) containsObject:v4]) {
    [*(id *)((char *)&self->super.super.super.super.isa + v5) removeObject:v4];
  }
  v6 = [v4 error];
  v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F34A98]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == 503)
    {
      [(CoreDAVContainerSyncTaskGroup *)self bailWithError:v6];
      goto LABEL_18;
    }
  }
  else
  {
  }
  v9 = [v4 successfulValueForNameSpace:*MEMORY[0x263F34DA8] elementName:@"checksum-versions"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = self->_preferredChecksumVersions;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([v9 supportsVersion:v15])
        {
          [(CalDAVContainerChecksumSyncTaskGroup *)self setBestServerChecksumVersion:v15];
          goto LABEL_17;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  v16.receiver = self;
  v16.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  [(CoreDAVContainerSyncTaskGroup *)&v16 startTaskGroup];

LABEL_18:
}

- (id)_calculatedCalendarHome
{
  return (id)[*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C08]) CDVURLByDeletingLastPathComponent];
}

- (BOOL)_hadOutOfDateCollectionToken
{
  unusedSyncToken = self->_unusedSyncToken;
  if (unusedSyncToken
    && *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C18])
    && !-[NSString isEqualToString:](unusedSyncToken, "isEqualToString:"))
  {
    return 1;
  }
  unusedCTag = self->_unusedCTag;
  if (unusedCTag)
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C10])
      && !-[NSString isEqualToString:](unusedCTag, "isEqualToString:"))
    {
      return 1;
    }
  }
  if (self->_unusedSyncToken) {
    return 0;
  }
  return self->_unusedCTag == 0;
}

- (void)_serverChecksumSupportPropfind
{
  v3 = [MEMORY[0x263EFF9C0] set];
  [v3 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34DA8] name:@"checksum-versions" parseClass:objc_opt_class()];
  id v4 = objc_alloc(MEMORY[0x263F34B80]);
  uint64_t v5 = [(CalDAVContainerChecksumSyncTaskGroup *)self _calculatedCalendarHome];
  v6 = (void *)[v4 initWithPropertiesToFind:v3 atURL:v5 withDepth:2];

  [*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C30]) addObject:v6];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  [v6 setAccountInfoProvider:WeakRetained];

  [v6 setTimeoutInterval:*(double *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C80])];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __70__CalDAVContainerChecksumSyncTaskGroup__serverChecksumSupportPropfind__block_invoke;
  uint64_t v11 = &unk_2641EBF60;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v6 setCompletionBlock:&v8];
  [(CoreDAVContainerSyncTaskGroup *)self _submitTasks];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __70__CalDAVContainerChecksumSyncTaskGroup__serverChecksumSupportPropfind__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleResponseToChecksumPropfind:v2];
}

- (void)startTaskGroup
{
  if ([(NSArray *)self->_preferredChecksumVersions count])
  {
    [(CalDAVContainerChecksumSyncTaskGroup *)self _serverChecksumSupportPropfind];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
    [(CoreDAVContainerSyncTaskGroup *)&v3 startTaskGroup];
  }
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  v7.receiver = self;
  v7.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  id v3 = [(CalDAVContainerSyncTaskGroup *)&v7 copyAdditionalResourcePropertiesToFetch];
  id v4 = v3;
  if (self->_bestServerChecksumVersion)
  {
    id v5 = (id)objc_opt_new();
    [v5 setSet:v4];
    [v5 addObject:self->_bestServerChecksumVersion];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (void)receivedPropertiesToValues:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  [(CoreDAVContainerSyncTaskGroup *)&v16 receivedPropertiesToValues:v6 forURL:v7];
  bestServerChecksumVersion = self->_bestServerChecksumVersion;
  if (bestServerChecksumVersion)
  {
    uint64_t v9 = [(CoreDAVItemParserMapping *)bestServerChecksumVersion nameSpace];
    uint64_t v10 = [(CoreDAVItemParserMapping *)self->_bestServerChecksumVersion name];
    uint64_t v11 = [v6 CDVObjectForKeyWithNameSpace:v9 andName:v10];

    id v12 = [v11 payloadAsString];
    if (v12)
    {
      serverURLsToChecksums = self->_serverURLsToChecksums;
      if (!serverURLsToChecksums)
      {
        v14 = (NSMutableDictionary *)objc_opt_new();
        uint64_t v15 = self->_serverURLsToChecksums;
        self->_serverURLsToChecksums = v14;

        serverURLsToChecksums = self->_serverURLsToChecksums;
      }
      [(NSMutableDictionary *)serverURLsToChecksums setObject:v12 forKey:v7];
    }
  }
}

- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  if ([(CoreDAVContainerSyncTaskGroup *)&v21 shouldDownloadResource:v8 localETag:v9 serverETag:v10])
  {
    BOOL v11 = 1;
    if (![(CalDAVContainerChecksumSyncTaskGroup *)self _hadOutOfDateCollectionToken])
    {
      self->_mismatchDetected = 1;
      id v12 = [(CoreDAVTaskGroup *)self delegate];
      LODWORD(v20) = 2 * (v9 != 0);
      [v12 reportMismatchedETag:v10 forURL:v8 inFolderWithURL:*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C08]) cTag:self->_unusedCTag syncToken:self->_unusedSyncToken eTag:v9 mismatchType:v20];
LABEL_16:
    }
  }
  else
  {
    if (self->_bestServerChecksumVersion)
    {
      if (!self->_localURLsToChecksums)
      {
        id v13 = [(CoreDAVTaskGroup *)self delegate];
        v14 = (NSDictionary *)[v13 copyLocalChecksumsForFolderWithURL:*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C08]) checksumVersion:self->_bestServerChecksumVersion];
        localURLsToChecksums = self->_localURLsToChecksums;
        self->_localURLsToChecksums = v14;
      }
      id v12 = [(NSMutableDictionary *)self->_serverURLsToChecksums objectForKey:v8];
      objc_super v16 = [(NSDictionary *)self->_localURLsToChecksums objectForKey:v8];
      if (v16) {
        BOOL v17 = v12 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17 || ([v12 isEqualToString:v16] & 1) != 0)
      {
        BOOL v11 = 0;
      }
      else
      {
        long long v18 = [(CoreDAVTaskGroup *)self delegate];
        [v18 reportMismatchedChecksum:v12 forURL:v8 inFolderWithURL:*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F34C08]) checksumVersion:self->_bestServerChecksumVersion eTag:v10];

        BOOL v11 = 1;
      }

      goto LABEL_16;
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)deleteResourceURLs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(CalDAVContainerChecksumSyncTaskGroup *)self _hadOutOfDateCollectionToken])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      id v8 = (int *)MEMORY[0x263F34C08];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          self->_mismatchDetected = 1;
          BOOL v11 = [(CoreDAVTaskGroup *)self delegate];
          LODWORD(v12) = 1;
          [v11 reportMismatchedETag:0 forURL:v10 inFolderWithURL:*(Class *)((char *)&self->super.super.super.super.isa + *v8) cTag:self->_unusedCTag syncToken:self->_unusedSyncToken eTag:0 mismatchType:v12];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  [(CoreDAVContainerSyncTaskGroup *)&v14 deleteResourceURLs:v4];
}

- (NSArray)preferredChecksumVersions
{
  return self->_preferredChecksumVersions;
}

- (void)setPreferredChecksumVersions:(id)a3
{
}

- (CoreDAVItemParserMapping)bestServerChecksumVersion
{
  return self->_bestServerChecksumVersion;
}

- (void)setBestServerChecksumVersion:(id)a3
{
}

- (BOOL)mismatchDetected
{
  return self->_mismatchDetected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestServerChecksumVersion, 0);
  objc_storeStrong((id *)&self->_preferredChecksumVersions, 0);
  objc_storeStrong((id *)&self->_localURLsToChecksums, 0);
  objc_storeStrong((id *)&self->_serverURLsToChecksums, 0);
  objc_storeStrong((id *)&self->_unusedCTag, 0);
  objc_storeStrong((id *)&self->_unusedSyncToken, 0);
}

@end
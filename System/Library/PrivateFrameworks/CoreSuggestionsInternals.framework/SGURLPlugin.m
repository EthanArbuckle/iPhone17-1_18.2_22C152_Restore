@interface SGURLPlugin
- (BOOL)_shouldProcessSearchableItem:(id)a3;
- (NSString)identifier;
- (SGURLPlugin)init;
- (SGURLPlugin)initWithEntityStore:(id)a3;
- (SGURLPlugin)initWithEntityStoreGetter:(id)a3;
- (id)_consumeContentParts:(id)a3 title:(id)a4 fromHandle:(id)a5 documentDate:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10 context:(id)a11;
- (id)_urlContainerFromText:(id)a3 documentDate:(id)a4 documentTitle:(id)a5 handle:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10;
- (id)consumeRemindersContentWithContext:(id)a3;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (id)extractURLsFromAttributesOfItem:(id)a3 handle:(id)a4;
- (id)extractURLsFromTextPropertiesOfItem:(id)a3 handle:(id)a4;
- (id)processSearchableItem:(id)a3;
- (id)setup;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3;
@end

@implementation SGURLPlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlDissector, 0);
  objc_storeStrong(&self->_entityStoreGetter, 0);
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F5DC08]])
  {
    v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: deleting URLs from bundleId %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = (*((void (**)(void))self->_entityStoreGetter + 2))();
    char v7 = [v6 deleteURLsFromBundleIdentifier:v4];

    if ((v7 & 1) == 0)
    {
      v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGURLPlugin failed to delete URLs from bundleId %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (BOOL)_shouldProcessSearchableItem:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 bundleID];
  if (v4)
  {
    v5 = [v3 bundleID];
    uint64_t v6 = *MEMORY[0x1E4F937E0];
    v10[0] = *MEMORY[0x1E4F937C0];
    v10[1] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    char v8 = [v7 containsObject:v5];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (id)_urlContainerFromText:(id)a3 documentDate:(id)a4 documentTitle:(id)a5 handle:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10
{
  HIDWORD(v28) = a7;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = +[SGDataDetectorMatch detectionsInPlainText:v21 baseDate:0];
  v23 = sgLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = [v22 count];
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: %tu detections on %@", buf, 0x16u);
  }

  urlDissector = self->_urlDissector;
  v25 = objc_opt_new();
  LOBYTE(v28) = BYTE4(v28);
  v26 = [(SGURLDissector *)urlDissector urlsFromText:v21 handle:v18 dataDetectorMatches:v22 bundleIdentifier:v16 domainIdentifier:v17 uniqueIdentifier:v15 documentTitle:0.0 documentDate:v19 documentTimeInterval:v20 receivedAt:v25 isOutgoingDocument:v28];

  return v26;
}

- (id)extractURLsFromTextPropertiesOfItem:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_opt_new();
  int v9 = [MEMORY[0x1E4F93790] textContentNoCopyRetainingBackingBuffer:v6];
  id v10 = v9;
  if (v9 && [v9 length]) {
    [v8 addObject:v10];
  }
  uint64_t v11 = [v6 attributeSet];
  v12 = [v11 title];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = [v6 attributeSet];
    id v15 = [v14 title];
    [v8 addObject:v15];
  }
  id v16 = [v6 attributeSet];
  id v17 = [v16 comment];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    id v19 = [v6 attributeSet];
    id v20 = [v19 comment];
    [v8 addObject:v20];
  }
  if ([v8 count])
  {
    v39 = self;
    id v21 = (void *)*MEMORY[0x1E4F937E0];
    v22 = [v6 bundleID];
    LODWORD(v21) = [v21 isEqualToString:v22];

    v23 = [v6 attributeSet];
    v24 = v23;
    v40 = v10;
    id v38 = v7;
    if (v21) {
      [v23 dueDate];
    }
    else {
    uint64_t v26 = [v23 contentCreationDate];
    }

    v27 = objc_msgSend(v8, "_pas_proxyComponentsJoinedByString:", @" ");
    v37 = [v6 attributeSet];
    uint64_t v28 = [v37 title];
    uint64_t v29 = [MEMORY[0x1E4F93790] searchableItemIsOutgoing:v6];
    uint64_t v30 = [v6 uniqueIdentifier];
    [v6 domainIdentifier];
    v32 = __int16 v31 = v8;
    uint64_t v33 = [v6 bundleID];
    v34 = (void *)v26;
    uint64_t v35 = v26;
    id v7 = v38;
    v25 = [(SGURLPlugin *)v39 _urlContainerFromText:v27 documentDate:v35 documentTitle:v28 handle:v38 isOutgoingDocument:v29 uniqueIdentifier:v30 domainIdentifier:v32 bundleIdentifier:v33];

    char v8 = v31;
    id v10 = v40;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)extractURLsFromAttributesOfItem:(id)a3 handle:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [v6 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: extracting URLs from attributes of %@", buf, 0xCu);
  }
  urlDissector = self->_urlDissector;
  id v20 = [v6 attributeSet];
  id v10 = [v6 bundleID];
  uint64_t v11 = [v6 domainIdentifier];
  id v21 = [v6 uniqueIdentifier];
  v12 = [v6 attributeSet];
  uint64_t v13 = [v12 title];
  v14 = [v6 attributeSet];
  id v15 = [v14 contentCreationDate];
  id v16 = objc_opt_new();
  LOBYTE(v18) = [MEMORY[0x1E4F93790] searchableItemIsOutgoing:v6];
  id v19 = [(SGURLDissector *)urlDissector urlsFromAttributes:v20 handle:v22 bundleIdentifier:v10 domainIdentifier:v11 uniqueIdentifier:v21 documentTitle:v13 documentDate:0.0 documentTimeInterval:v15 receivedAt:v16 isOutgoingDocument:v18];

  return v19;
}

- (id)processSearchableItem:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SGURLPlugin *)self _shouldProcessSearchableItem:v4]) {
    goto LABEL_9;
  }
  v5 = [v4 uniqueIdentifier];

  if (!v5)
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGURLPlugin ignoring item with nil unique identifier", v29, 2u);
    }
    goto LABEL_8;
  }
  id v6 = (void *)*MEMORY[0x1E4F5DC58];
  id v7 = [v4 bundleID];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {

LABEL_11:
    id v16 = [v4 attributeSet];
    id v17 = [v16 authorAddresses];
    if (v17)
    {
      uint64_t v18 = [v4 attributeSet];
      id v19 = [v18 authorAddresses];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        id v17 = 0;
        goto LABEL_16;
      }
      id v16 = [v4 attributeSet];
      id v21 = [v16 authorAddresses];
      id v17 = [v21 objectAtIndexedSubscript:0];
    }
LABEL_16:
    id v22 = [v4 attributeSet];
    v23 = [v22 URL];
    v24 = [v23 absoluteString];
    uint64_t v25 = [v24 length];

    if (v25) {
      [(SGURLPlugin *)self extractURLsFromAttributesOfItem:v4 handle:v17];
    }
    else {
    uint64_t v26 = [(SGURLPlugin *)self extractURLsFromTextPropertiesOfItem:v4 handle:v17];
    }
    v27 = (*((void (**)(void))self->_entityStoreGetter + 2))();
    [v26 writeWithEntityStore:v27];

    id v15 = +[FIAPResult success];

    goto LABEL_20;
  }
  char v8 = [v4 attributeSet];
  int v9 = [v8 completionDate];

  if (!v9) {
    goto LABEL_11;
  }
  id v10 = (*((void (**)(void))self->_entityStoreGetter + 2))();
  uint64_t v11 = [v4 bundleID];
  v12 = [v4 attributeSet];
  uint64_t v13 = [v12 uniqueIdentifier];
  v30[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v10 deleteURLsFromBundleIdentifier:v11 documentIdentifiers:v14];

LABEL_8:
LABEL_9:
  id v15 = +[FIAPResult success];
LABEL_20:

  return v15;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.suggestions.plugin.SGURLPlugin";
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)[MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
}

- (id)_consumeContentParts:(id)a3 title:(id)a4 fromHandle:(id)a5 documentDate:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10 context:(id)a11
{
  BOOL v12 = a7;
  id v32 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v23 = objc_msgSend(a3, "_pas_proxyComponentsJoinedByString:", @"\n\n");
  char v24 = [v22 shouldContinue];

  if (v24)
  {
    uint64_t v25 = [v17 handle];
    uint64_t v26 = [(SGURLPlugin *)self _urlContainerFromText:v23 documentDate:v18 documentTitle:v32 handle:v25 isOutgoingDocument:v12 uniqueIdentifier:v19 domainIdentifier:v20 bundleIdentifier:v21];

    v27 = (*((void (**)(void))self->_entityStoreGetter + 2))();
    [v26 writeWithEntityStore:v27];

    uint64_t v28 = (void *)MEMORY[0x1E4F93758];
    uint64_t v29 = [v26 numberOfExtractions];
    uint64_t v30 = [v28 successWithNumberOfExtractions:v29];
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F93758] interrupted];
  }

  return v30;
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 content];
  id v6 = (*((void (**)(void))self->_entityStoreGetter + 2))();
  uint64_t v7 = *MEMORY[0x1E4F937E0];
  char v8 = [v5 uniqueId];
  v29[0] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v6 deleteURLsFromBundleIdentifier:v7 documentIdentifiers:v9];

  [v5 completionDateTimestamp];
  if (v10 <= 0.0)
  {
    BOOL v12 = objc_opt_new();
    uint64_t v13 = [v5 title];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      id v15 = [v5 title];
      [v12 addObject:v15];
    }
    id v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v5 notes];
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = [v17 length];
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: consumeRemindersContentWithContext: notes.length = %tu", buf, 0xCu);
    }
    id v18 = [v5 notes];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      id v20 = [v5 notes];
      [v12 addObject:v20];
    }
    id v21 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 dueDateTimestamp];
    id v22 = objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:");
    v23 = [v5 title];
    char v24 = [v5 uniqueId];
    uint64_t v25 = [v5 domainId];
    uint64_t v11 = [(SGURLPlugin *)self _consumeContentParts:v12 title:v23 fromHandle:0 documentDate:v22 isOutgoingDocument:0 uniqueIdentifier:v24 domainIdentifier:v25 bundleIdentifier:v7 context:v4];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
  }

  return v11;
}

- (id)setup
{
  return +[FIAPResult success];
}

- (SGURLPlugin)initWithEntityStoreGetter:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGURLPlugin;
  v5 = [(SGURLPlugin *)&v12 init];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      id v6 = [MEMORY[0x1E4F93750] defaultCoordinator];
      [v6 registerRemindersConsumer:v5 levelOfService:3];
    }
    uint64_t v7 = objc_opt_new();
    urlDissector = v5->_urlDissector;
    v5->_urlDissector = (SGURLDissector *)v7;

    uint64_t v9 = [v4 copy];
    id entityStoreGetter = v5->_entityStoreGetter;
    v5->_id entityStoreGetter = (id)v9;
  }
  return v5;
}

- (SGURLPlugin)initWithEntityStore:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SGURLPlugin_initWithEntityStore___block_invoke;
  v8[3] = &unk_1E65B59E0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(SGURLPlugin *)self initWithEntityStoreGetter:v8];

  return v6;
}

id __35__SGURLPlugin_initWithEntityStore___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SGURLPlugin)init
{
  return [(SGURLPlugin *)self initWithEntityStoreGetter:&__block_literal_global_2508];
}

id __19__SGURLPlugin_init__block_invoke()
{
  return +[SGSqlEntityStore defaultHarvestStore];
}

@end
@interface DUFileUpdateSpotlightReceiver
- (id)supportedBundleIDs;
- (id)supportedContentTypes;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4;
@end

@implementation DUFileUpdateSpotlightReceiver

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[DocumentUnderstandingFeatureFlagReader isSearchAndOrganizationDocumentIngestEnabled])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: calling by XPC into textunderstandingd for DUFileUpdateSpotlightReceiver", v13, 2u);
    }
    if ([v5 count])
    {
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [v5 objectAtIndexedSubscript:v7];
        v9 = [v8 attributeSet];
        v10 = [v9 fileProviderID];
        if (![v10 length]) {
          goto LABEL_9;
        }
        v11 = [v9 fileItemID];
        uint64_t v12 = [v11 length];

        if (v12) {
          break;
        }
LABEL_10:

        if (++v7 >= (unint64_t)[v5 count]) {
          goto LABEL_14;
        }
      }
      v10 = +[DUXPCClient sharedInstance];
      [v10 addOrUpdateSearchableItems:v5 bundleID:v6 completion:&unk_26FF53C38];
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "DocumentUnderstanding: Ingest disabled, skipping XPC call to textunderstandingd", buf, 2u);
  }
LABEL_14:
}

- (id)supportedBundleIDs
{
  return 0;
}

- (id)supportedContentTypes
{
  return 0;
}

@end
@interface CADSpotlightServerModule
- (CADSpotlightIndexer)indexer;
- (CADSpotlightServerModule)initWithSpotlightEntityAnnotator:(id)a3;
- (CalSpotlightEntityAnnotator)spotlightEntityAnnotator;
- (void)activate;
- (void)deactivate;
- (void)protectedDataDidBecomeAvailable;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)receivedNotificationNamed:(id)a3;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
@end

@implementation CADSpotlightServerModule

- (void)receivedNotificationNamed:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4F574A0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4F574A8]])
  {
    v5 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "Received db change notification, starting to index unconsumed changes", v6, 2u);
    }
    [(CADSpotlightIndexer *)self->_indexer indexUnconsumedChanges];
  }
}

- (CADSpotlightServerModule)initWithSpotlightEntityAnnotator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSpotlightServerModule;
  v6 = [(CADSpotlightServerModule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spotlightEntityAnnotator, a3);
  }

  return v7;
}

- (void)activate
{
  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "activate", v6, 2u);
  }
  +[CADSpotlightLogger log:@"activate"];
  id v4 = [[CADSpotlightIndexer alloc] initWithSpotlightEntityAnnotator:self->_spotlightEntityAnnotator];
  indexer = self->_indexer;
  self->_indexer = v4;

  if (MEMORY[0x1E4FA5DB0]) {
    SpotlightDaemonClientRegister();
  }
}

- (void)deactivate
{
  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "deactivate", v4, 2u);
  }
  +[CADSpotlightLogger log:@"deactivate"];
  [(CADSpotlightIndexer *)self->_indexer cancelOngoingWorkAndShutdown];
}

- (void)protectedDataDidBecomeAvailable
{
  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "protectedDataDidBecomeAvailable, checking if we should do a full reindex", v4, 2u);
  }
  +[CADSpotlightLogger log:@"protectedDataDidBecomeAvailable"];
  [(CADSpotlightIndexer *)self->_indexer checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded];
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
}

- (CalSpotlightEntityAnnotator)spotlightEntityAnnotator
{
  return self->_spotlightEntityAnnotator;
}

- (CADSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_spotlightEntityAnnotator, 0);
}

@end
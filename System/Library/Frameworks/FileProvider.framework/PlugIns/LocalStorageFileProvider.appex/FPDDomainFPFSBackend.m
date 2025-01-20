@interface FPDDomainFPFSBackend
- (BOOL)backgroundActivityIsPaused;
- (BOOL)isDeadEndBackend;
- (BOOL)isItemDataless:(id)a3;
- (BOOL)isProviderForRealPathURL:(id)a3;
- (BOOL)needsRootsCreation;
- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5;
- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3;
- (Class)rootURLs;
- (NSArray)coordinationRootURLs;
- (NSData)backingStoreIdentity;
- (NSFileProviderDomainVersion)domainVersion;
- (NSString)watcherLabel;
- (_TtC9libfssync20FPDDomainFPFSBackend)init;
- (_TtC9libfssync20FPDDomainFPFSBackend)initWithDomain:(id)a3;
- (id)accumulatedSizeOfItems;
- (id)cleanupDomainWithMode:(unint64_t)a3 error:(id *)a4;
- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5;
- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6;
- (id)materializedURLForItemID:(id)a3;
- (id)providerVersion;
- (id)rootURLsWithTransientState:(BOOL *)a3;
- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (int64_t)accumulatedSizeOfPinnedItems;
- (int64_t)errorGenerationCount;
- (int64_t)nonEvictableSpace;
- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8;
- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)aBlock;
- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)decorateItems:(id)a3 completionHandler:(id)a4;
- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)didChangeDomainConfiguration:(id)a3;
- (void)didChangeItemID:(id)a3 completionHandler:(id)a4;
- (void)didChangeNeedsAuthentification:(BOOL)a3;
- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)disableDBQueryStatisticsWithCompletionHandler:(id)a3;
- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6;
- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6;
- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fakeFSEventAtURL:(id)a3;
- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchLatestVersionForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchTelemetryReportWithCompletionHandler:(id)a3;
- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7;
- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceIngestionAtURL:(id)a3;
- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceUpdateBlockedProcessNamesFromDomain:(NSString *)a3 completionHandler:(id)a4;
- (void)getCountersArrayWithCompletionHandler:(id)a3;
- (void)getDBQueryStatisticsWithQueryPlan:(BOOL)a3 completionHandler:(id)a4;
- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4;
- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5;
- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3;
- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)importProgressForItemsPendingReconciliationWithCompletionHandler:(id)a3;
- (void)importProgressForItemsPendingScanningDiskWithCompletionHandler:(id)a3;
- (void)importProgressForItemsPendingScanningProviderWithCompletionHandler:(id)a3;
- (void)importProgressWithCompletionHandler:(id)a3;
- (void)ingestFromCacheItemWithID:(id)a3 requestedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)itemChangedAtURL:(id)a3 request:(id)a4;
- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7;
- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)launchFeedbackForDomain:(FPDDomain *)a3 itemIdentifier:(NSString *)a4 triggeringError:(NSError *)a5 completionHandler:(id)a6;
- (void)listAvailableTestingOperationsWithRequest:(id)a3 completionHandler:(id)a4;
- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5;
- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6;
- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)pauseSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (void)pinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)queryDiskImportSchedulerLabelWithCompletionHandler:(id)a3;
- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5;
- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5;
- (void)removeEbihilSymlink;
- (void)resetCountersWithCompletionHandler:(id)a3;
- (void)resetDBQueryStatisticsWithCompletionHandler:(id)a3;
- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4;
- (void)resumeSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (void)runTestingOperations:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)saveFPCKTelemetryReport:(id)a3 completionHandler:(id)a4;
- (void)sendDiagnosticsFromFPCKForItemIDs:(id)a3;
- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)setBackingStoreIdentity:(id)a3;
- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)sharedSchedulerCanRun:(id)a3;
- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4;
- (void)stateWithCompletionHandler:(id)a3;
- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4;
- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4;
- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)unpinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)updateShouldRetryThrottledOperations:(BOOL)a3 completionHandler:(id)a4;
- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4;
- (void)wakeForPushWithCompletionHandler:(id)a3;
- (void)workingSetDidChangeWithCompletionHandler:(id)a3;
@end

@implementation FPDDomainFPFSBackend

- (NSData)backingStoreIdentity
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  Class isa = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_10001EBB0(v5, v4);
    Class isa = sub_10096AF20().super.isa;
    sub_10001E9AC(v5, v4);
  }

  return (NSData *)isa;
}

- (void)setBackingStoreIdentity:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    v3 = (void *)sub_10096AF60();
    unint64_t v8 = v7;
  }
  else
  {
    v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  uint64_t *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_10001E9AC(v11, v12);
}

- (_TtC9libfssync20FPDDomainFPFSBackend)initWithDomain:(id)a3
{
  return (_TtC9libfssync20FPDDomainFPFSBackend *)FPDDomainFPFSBackend.init(domain:)(a3);
}

- (NSArray)coordinationRootURLs
{
  v2 = self;
  FPDDomainFPFSBackend.coordinationRootURLsForObjectiveC.getter();

  sub_10096AE50();
  v3.super.Class isa = sub_10096C080().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (Class)rootURLs
{
  id v1 = a1;
  sub_100853204(v1, v1);

  sub_10096AE50();
  v2.super.Class isa = sub_10096C080().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  unint64_t v4 = self;
  FPDDomainFPFSBackend.rootURLs(withTransientState:)(a3);

  sub_10096AE50();
  v5.super.Class isa = sub_10096C080().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (NSFileProviderDomainVersion)domainVersion
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs))
  {
    sub_10002B7CC((uint64_t *)&unk_100AD63F0);
    NSArray v3 = (void *)swift_dynamicCastClassUnconditional();
    swift_retain();
    unint64_t v4 = self;
    NSArray v5 = sub_100852D88(v3, (uint64_t)v3);

    swift_release();
  }
  else
  {
    NSArray v5 = 0;
  }

  return (NSFileProviderDomainVersion *)v5;
}

- (int64_t)errorGenerationCount
{
  NSArray v2 = *(void **)&self->purposeIdentifier[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_errorGenerationRecord];
  NSArray v3 = self;
  id v4 = v2;
  sub_10096C6A0();

  return v6;
}

- (BOOL)backgroundActivityIsPaused
{
  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs)) {
    return 0;
  }
  sub_10002B7CC((uint64_t *)&unk_100AD63F0);
  return *(unsigned char *)(swift_dynamicCastClassUnconditional() + 122);
}

- (void)removeEbihilSymlink
{
  NSArray v2 = self;
  FPDDomainFPFSBackend.removeEbihilSymlink()();
}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  id v4 = self;
  FPDDomainFPFSBackend.updateRootAfterDomainChange()();

  if (v5)
  {
    if (a3)
    {
      int64_t v6 = (void *)sub_10096ABE0();
      swift_errorRelease();
      id v7 = v6;
      *a3 = v6;
    }
    else
    {
      swift_errorRelease();
    }
  }
  return v5 == 0;
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
}

- (void)didChangeDomainConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FPDDomainFPFSBackend.didChangeDomainConfiguration(_:)((NSFileProviderDomain)v4);
}

- (void)queryDiskImportSchedulerLabelWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1003487AC;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1003487AC;
  *(void *)(v7 + 24) = v5;
  swift_retain_n();
  unint64_t v8 = self;
  sub_1002905E0((uint64_t)"queryDiskImportSchedulerLabel(completionHandler:)", 49, 2, (void (*)(void ***, id))sub_10035ACCC, v6, (uint64_t)sub_10035B184, v7);

  swift_release();
  swift_release();

  swift_release();
}

- (_TtC9libfssync20FPDDomainFPFSBackend)init
{
  result = (_TtC9libfssync20FPDDomainFPFSBackend *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  sub_100331B70(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs), self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs]);
  swift_release();
  sub_10001E9AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity), *(void *)&self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetWatchingQueue));
  sub_100347A3C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_startStatus));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetState, &qword_100AD0700);
  swift_unknownObjectRelease();
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetStateURL, &qword_100ACA8C0);

  swift_release();
  NSArray v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend__signaledErrorGenerationDebouncer;
  uint64_t v4 = sub_10002B7CC(&qword_100AD74A0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (NSString)watcherLabel
{
  _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  NSString v2 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)sharedSchedulerCanRun:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FPDDomainFPFSBackend.sharedSchedulerCanRun(_:)(v4);
}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_100332704(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_10096C0A0();
  _Block_copy(v6);
  unint64_t v8 = self;
  sub_100332BB8(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v6 = self;
  sub_10096C6A0();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)needsRootsCreation
{
  NSString v2 = self;
  if (sub_10029B860()) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10029B4EC();
  }

  return v3 & 1;
}

- (BOOL)isDeadEndBackend
{
  return 0;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v7 - 8);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_10096ADD0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  sub_100011348(0, &qword_100AD0B48);
  uint64_t v14 = sub_10096C0A0();
  v15 = self;
  FPDDomainFPFSBackend.createRoot(byImporting:knownFolders:)((uint64_t)v9, v14, (uint64_t)v13);
  sub_10002B770((uint64_t)v9, &qword_100ACA8C0);
  swift_bridgeObjectRelease();

  sub_10096AD20(v16);
  v18 = v17;
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);

  return v18;
}

- (void)invalidate
{
  NSString v2 = self;
  FPDDomainFPFSBackend.invalidate()();
}

- (id)cleanupDomainWithMode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v5 = self;
  id v6 = FPDDomainFPFSBackend.cleanupDomain(with:)((void (*)(char *, char *, uint64_t))a3);

  return v6;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  uint64_t v4 = sub_10096AE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  uint64_t v8 = self;
  BOOL v9 = FPDDomainFPFSBackend.isProvider(forRealPathURL:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)saveFPCKTelemetryReport:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_10096B9C0();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_10033393C(v6, v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_100334400(v9, v10, v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1003348C8(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_10096ADD0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a5;
  v17 = self;
  FPDDomainFPFSBackend.itemID(for:requireProviderItemID:request:completionHandler:)((uint64_t)v13, v8, v16, (uint64_t)sub_10035A1BC, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = swift_allocObject();
  id v15 = a3;
  id v16 = a6;
  v17 = self;
  *(void *)(v14 + 16) = [v15 identifier];
  *(void *)(v14 + 24) = v16;
  unint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_10035A1BC;
  *(void *)(v18 + 24) = v13;
  id v19 = v16;
  swift_retain();
  sub_1002A9378(v15, v9, v8, v14 | 0x9000000000000000, (uint64_t)sub_10035B0CC, v18);

  swift_release();
  swift_release();

  swift_release();
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10096AE50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  id v14 = a4;
  id v15 = self;
  FPDDomainFPFSBackend.item(for:request:completionHandler:)((uint64_t)v11, v14, sub_10035A1BC, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  v27 = self;
  id v28 = a4;
  uint64_t v6 = sub_10096AE50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = _Block_copy(a5);
  v29 = v12;
  sub_10096ADD0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = v12;
  uint64_t v16 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v18 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  v20 = v27;
  *(void *)(v19 + 16) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v17, v10, v16);
  v21 = (void (**)(uint64_t, uint64_t))(v19 + v18);
  *v21 = sub_10035A1C0;
  v21[1] = (void (*)(uint64_t, uint64_t))v14;
  v22 = v28;
  *(void *)(v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) = v28;
  id v23 = v22;
  v24 = v20;
  id v25 = v23;
  _Block_copy(v13);
  swift_retain();
  sub_10032EEB4((uint64_t)"putBackURLForTrashedItem(at:request:completionHandler:)", 55, 2, (uint64_t)sub_100331EE8, v19, v24, (void (**)(void, void, void))v13);
  _Block_release(v13);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v16);
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v11 = sub_10096AE50();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v15 = _Block_copy(a7);
  sub_10096ADD0();
  swift_unknownObjectRetain();
  uint64_t v16 = (char *)a6;
  unint64_t v17 = self;
  sub_10096C9D0();
  swift_unknownObjectRelease();
  _Block_copy(v15);
  id v18 = sub_100335310(v14, (uint64_t)v20, a5, v16, (char *)v17, (void (**)(const void *, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  sub_1000268E0((uint64_t)v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  return v18;
}

- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  FPDDomainFPFSBackend.downloadItem(with:request:progress:completionHandler:)(v12, v13, v14, (void (*)(char *, id))sub_10035A1C0, v11);

  swift_release();
}

- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  sub_10096ADD0();
  _Block_copy(v14);
  id v15 = a3;
  id v16 = a4;
  unint64_t v17 = self;
  sub_100336798(v15, v16, (uint64_t)v13, v17, (void (**)(void, void, void, void))v14);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10002B7CC(&qword_100AD6540);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10096C270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100AD0B60;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100AD0B68;
  v14[5] = v13;
  id v15 = a3;
  id v16 = self;
  sub_1003257A4((uint64_t)v9, (uint64_t)&unk_100AD0B70, (uint64_t)v14);
  swift_release();
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  unsigned int v38 = a4;
  uint64_t v9 = sub_10096AE50();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  id v13 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v15 = (char *)&v33 - v14;
  id v16 = _Block_copy(a6);
  v37 = v15;
  sub_10096ADD0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  id v18 = objc_allocWithZone((Class)NSProgress);
  id v34 = a5;
  v36 = self;
  id v33 = [v18 init];
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v35 = v9;
  v19(v13, v15, v9);
  unint64_t v20 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v21 = (v11 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 19) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v25 + v20, v13, v9);
  uint64_t v26 = (void *)(v25 + v21);
  *uint64_t v26 = sub_10035A1BC;
  v26[1] = v17;
  *(_DWORD *)(v25 + v22) = v38;
  v27 = v34;
  *(void *)(v25 + v23) = v34;
  id v28 = v33;
  *(void *)(v25 + v24) = v33;
  swift_retain_n();
  id v29 = v27;
  id v30 = v28;
  v31 = v36;
  sub_10032F484((uint64_t)"evictItem(at:evictionReason:request:completionHandler:)", 55, 2, (uint64_t)sub_100332278, v25, v36, (void (*)(void, id))sub_10035A1BC, v17);

  swift_release();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v37, v35);

  return v30;
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  sub_100337600(v11, a4, v12, v13, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = _Block_copy(a6);
  _Block_copy(v11);
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = self;
  sub_100337AD0(v12, location, length, v13, v14, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
}

- (void)itemChangedAtURL:(id)a3 request:(id)a4
{
  uint64_t v4 = sub_10096AE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v14 = _Block_copy(a8);
  _Block_copy(v14);
  id v15 = a3;
  id v16 = a7;
  uint64_t v17 = self;
  sub_100337FAC(v15, a4, v10, v9, v16, v17, (void (**)(void, void, void, void))v14);
  _Block_release(v14);
  _Block_release(v14);
}

- (void)fakeFSEventAtURL:(id)a3
{
  uint64_t v4 = sub_10096AE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  uint64_t v8 = self;
  FPDDomainFPFSBackend.fakeFSEvent(at:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
}

- (void)stateWithCompletionHandler:(id)a3
{
}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_log);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = self;
  v9[4] = sub_10012F588;
  v9[5] = v7;
  id v10 = a3;
  id v11 = self;
  id v12 = v10;
  id v13 = v11;
  swift_retain();
  sub_1006B8108(v8, (uint64_t)"didChange(_:completionHandler:)", 31, 2, (uint64_t)sub_10035A1DC, (uint64_t)v9);

  swift_release();

  swift_release();
}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
}

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v12 = self;
  sub_10033AF04(v11, (uint64_t)a4, (uint64_t)a5, v12, (void (**)(void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  uint64_t v10 = sub_10096C0A0();
  _Block_copy(v9);
  id v11 = a5;
  id v12 = self;
  sub_10033B1E8(v10, a4, v11, v12, (void (**)(void, void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)decorateItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_100011348(0, (unint64_t *)&unk_100ACD9F0);
  uint64_t v6 = sub_10096C0A0();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_10033B760(v6, v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (int64_t)nonEvictableSpace
{
  NSString v2 = self;
  Swift::Int64 v3 = FPDDomainFPFSBackend.nonEvictableSpace()();

  return v3;
}

- (int64_t)accumulatedSizeOfPinnedItems
{
  NSString v2 = self;
  Swift::Int64 v3 = FPDDomainFPFSBackend.accumulatedSizeOfPinnedItems()();

  return v3;
}

- (id)accumulatedSizeOfItems
{
  NSString v2 = self;
  unint64_t v3 = (unint64_t)FPDDomainFPFSBackend.accumulatedSizeOfItems()();

  if (v3)
  {
    sub_100011348(0, (unint64_t *)&qword_100ACB6E0);
    v4.super.Class isa = sub_10096B9A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

- (void)fetchTelemetryReportWithCompletionHandler:(id)a3
{
  NSDictionary v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10034651C;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_10034651C;
  v7[4] = v5;
  uint64_t v8 = self;
  swift_retain_n();
  uint64_t v9 = v8;
  sub_1002912A0((uint64_t)"fetchTelemetryReport(completionHandler:)", 40, 2, (void (*)(void *, id))sub_10035A228, v6, (uint64_t)sub_10035A1F8, (uint64_t)v7);

  swift_release();
  swift_release();

  swift_release();
}

- (id)providerVersion
{
  NSString v2 = self;
  object = FPDDomainFPFSBackend.providerVersion()().value._object;

  if (object)
  {
    NSString v4 = sub_10096BC00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10096AE50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  id v15 = self;
  sub_10096AD20(v16);
  id v18 = v17;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = sub_1003464F8;
  v19[3] = v13;
  v19[4] = v15;
  v19[5] = v14;
  aBlock[4] = sub_10035ACD4;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100274A48;
  aBlock[3] = &unk_100A7C910;
  unint64_t v20 = _Block_copy(aBlock);
  id v21 = v14;
  unint64_t v22 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v22 itemForURL:v18 request:v21 completionHandler:v20];
  _Block_release(v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  uint64_t v10 = self;
  sub_10033C370(v9, a4, v10, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)importProgressWithCompletionHandler:(id)a3
{
}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = sub_10033C830(a4);

  return v9;
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = sub_10096AE50();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  type metadata accessor for URLResourceKey(0);
  unint64_t v14 = sub_10096C0A0();
  sub_10096ADD0();
  id v15 = (void *)swift_allocObject();
  v15[2] = v13;
  id v16 = a5;
  uint64_t v17 = self;
  FPDDomainFPFSBackend.values(forAttributes:for:request:completionHandler:)(v14, (uint64_t)v12, v16, sub_1003464C0, v15);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)materializedURLForItemID:(id)a3
{
  uint64_t v5 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v5);
  id v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = dispatch_group_create();
  uint64_t v11 = swift_allocBox();
  uint64_t v13 = v12;
  uint64_t v14 = sub_10096AE50();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  dispatch_group_enter(v10);
  swift_retain();
  id v16 = v10;
  sub_10033D02C(v8, v9, v11, v16);
  swift_release();

  sub_10096C600();
  swift_beginAccess();
  sub_10002B70C(v13, (uint64_t)v7, &qword_100ACA8C0);

  swift_release();
  uint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
  {
    sub_10096AD20(v17);
    uint64_t v18 = v19;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }

  return v18;
}

- (BOOL)isItemDataless:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = dispatch_group_create();
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = 0;
  dispatch_group_enter(v6);
  swift_retain();
  id v8 = v6;
  sub_10033CB60(v4, v5, v7, v8);
  swift_release();

  sub_10096C600();
  swift_beginAccess();
  LOBYTE(v8) = *(unsigned char *)(v7 + 16);

  swift_release();
  return (char)v8;
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)aBlock
{
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_10035A1BC;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_10035A1BC;
  *(void *)(v18 + 24) = v16;
  *(void *)(v18 + 32) = a3;
  *(unsigned char *)(v18 + 40) = a7;
  *(void *)(v18 + 48) = a8;
  *(void *)(v18 + 56) = self;
  *(void *)(v18 + 64) = a4;
  *(void *)(v18 + 72) = a5;
  id v19 = a3;
  id v20 = a5;
  id v21 = a8;
  unint64_t v22 = self;
  swift_retain_n();
  id v23 = v19;
  id v24 = v21;
  uint64_t v25 = v22;
  id v26 = v20;
  sub_10028F454((uint64_t)"createItemBased(onTemplate:fields:urlWrapper:options:bounceOnCollision:request:completionHandler:)", 98, 2, (void (*)(void *, id))sub_10035A224, v17, (uint64_t)sub_10033D5C8, v18);

  swift_release();
  swift_release();

  swift_release();
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10035A1BC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_10035A1BC;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  uint64_t v13 = v11;
  sub_10028F454((uint64_t)"forceIngestion(for:completionHandler:)", 38, 2, (void (*)(void *, id))sub_10035A224, v8, (uint64_t)sub_10035A250, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10035A1BC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_10035A1BC;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  uint64_t v13 = v11;
  sub_10028F454((uint64_t)"forceFSIngestion(for:completionHandler:)", 40, 2, (void (*)(void *, id))sub_10035A224, v8, (uint64_t)sub_10035A24C, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)forceIngestionAtURL:(id)a3
{
  uint64_t v3 = sub_10096AE50();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  _s9libfssync20FPDDomainFPFSBackendC14forceIngestion2aty10Foundation3URLV_tF_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)pinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10035A1BC;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_10035A1BC;
  v11[6] = v9;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  swift_retain_n();
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = v14;
  sub_10028F454((uint64_t)"pinItem(with:request:completionHandler:)", 40, 2, (void (*)(void *, id))sub_10035A224, v10, (uint64_t)sub_10033D9B0, (uint64_t)v11);

  swift_release();
  swift_release();

  swift_release();
}

- (void)unpinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10035A1BC;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_10035A1BC;
  v11[6] = v9;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  swift_retain_n();
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = v14;
  sub_10028F454((uint64_t)"unpinItem(with:request:completionHandler:)", 42, 2, (void (*)(void *, id))sub_10035A224, v10, (uint64_t)sub_10033D9CC, (uint64_t)v11);

  swift_release();
  swift_release();

  swift_release();
}

- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_100011348(0, &qword_100AD0B48);
  uint64_t v8 = sub_10096C0A0();
  _Block_copy(v7);
  id v9 = a4;
  uint64_t v10 = self;
  sub_10033E894(v8, v9, v10, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  sub_10096AE50();
  uint64_t v10 = sub_10096C0A0();
  _Block_copy(v9);
  id v11 = a5;
  id v12 = self;
  sub_10033EDB0(v10, (void *)a4, v11, v12, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10035A1BC;
  *(void *)(v10 + 24) = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = self;
  v11[3] = sub_10035A1BC;
  v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  id v12 = a4;
  id v13 = self;
  swift_retain_n();
  uint64_t v14 = v13;
  id v15 = v12;
  sub_100291B20((uint64_t)"getKnownFolderLocations(_:request:completionHandler:)", 53, 2, (void (*)(void *, id))sub_10035A224, v10, (uint64_t)sub_10033DA68, (uint64_t)v11);

  swift_release();
  swift_release();

  swift_release();
}

- (void)ingestFromCacheItemWithID:(id)a3 requestedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  sub_100011348(0, (unint64_t *)&unk_100ACD9F0);
  unint64_t v10 = sub_10096C0A0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a5;
  id v13 = self;
  FPDDomainFPFSBackend.bulkItemChanges(_:changedFields:request:completionHandler:)(v10, a4, v12, (uint64_t)sub_1003462C8, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v23 = a4;
  uint64_t v7 = sub_10096AE50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  id v13 = &v22[-v12];
  uint64_t v14 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v8 + 32))(v18 + v16, v11, v7);
  id v19 = (void (**)(uint64_t, objc_class *, uint64_t))(v18 + v17);
  *id v19 = sub_100345F8C;
  v19[1] = (void (*)(uint64_t, objc_class *, uint64_t))v15;
  unint64_t v20 = v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v20 = self;
  *(unsigned char *)(v20 + 8) = v23;
  id v21 = self;
  swift_retain();
  sub_100330444((uint64_t)"listRemoteVersionsOfItem(at:includeCachedVersions:completionHandler:)", 69, 2, (uint64_t)sub_10033DC40, v18, v21, (void (*)(void, void, id))sub_100345F8C, v15);

  swift_release();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v12 = sub_10096AE50();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = _Block_copy(a6);
  unint64_t v17 = _Block_copy(a7);
  sub_10096ADD0();
  sub_100011348(0, &qword_100ACBC40);
  uint64_t v18 = sub_10096C0A0();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  id v21 = self;
  FPDDomainFPFSBackend.fetchThumbnails(at:versions:size:perThumbnailCompletionHandler:completionHandler:)((uint64_t)v15, v18, (uint64_t)sub_100345F64, v19, (void (*)(void))sub_100071B10, (void (*)(void))v20, width, height);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100345F54;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = self;
  v9[3] = a3;
  v9[4] = sub_100345F54;
  v9[5] = v7;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  uint64_t v12 = v11;
  id v13 = v10;
  sub_1002945A8((uint64_t)"fetchOperationServiceOrEndpoint(with:completionHandler:)", 56, 2, (void (*)(void *, void **, id))sub_10035B150, v8, (uint64_t)sub_10035A244, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = self;
  *(void *)(v12 + 24) = sub_100345F08;
  *(void *)(v12 + 32) = v11;
  *(unsigned char *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_10033DE5C;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = sub_10033DE5C;
  v14[4] = v12;
  v14[5] = self;
  uint64_t v15 = self;
  id v16 = a3;
  id v17 = a5;
  swift_retain_n();
  uint64_t v18 = v15;
  id v19 = v17;
  id v20 = v16;
  swift_retain();
  sub_1002957B0((uint64_t)"resolveProviderItemID(_:completionHandler:)", 43, 2, (void (*)(void **))sub_10021E33C, v13, (uint64_t)sub_10035A240, (uint64_t)v14);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10035A1BC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = self;
  v9[3] = sub_10035A1BC;
  v9[4] = v7;
  v9[5] = a3;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  uint64_t v12 = v11;
  id v13 = v10;
  sub_100291F60((uint64_t)"fetchVendorEndpoint(with:completionHandler:)", 44, 2, (void (*)(void *, id))sub_10035A224, v8, (uint64_t)sub_10035A23C, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)didChangeNeedsAuthentification:(BOOL)a3
{
  uint64_t v4 = self;
  FPDDomainFPFSBackend.didChangeNeedsAuthentification(_:)(a3);
}

- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v8 = a3;
  uint64_t v7 = self;
  sub_1003408D8((uint64_t)v8, (char *)v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)updateShouldRetryThrottledOperations:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_100340FD0(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)listAvailableTestingOperationsWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100345E00;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = sub_100345E00;
  v9[4] = v7;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  id v13 = v11;
  sub_1002923A0((uint64_t)"listAvailableTestingOperations(with:completionHandler:)", 55, 2, (void (*)(void *, id))sub_1002201E8, v8, (uint64_t)sub_10035A238, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)runTestingOperations:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_100011348(0, (unint64_t *)&unk_100AD0B18);
  uint64_t v8 = sub_10096C0A0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_100345D98;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v8;
  v11[3] = a4;
  v11[4] = sub_100345D98;
  v11[5] = v9;
  id v12 = a4;
  swift_retain_n();
  id v13 = v12;
  uint64_t v14 = self;
  swift_bridgeObjectRetain();
  sub_1002927E0((uint64_t)"run(_:request:completionHandler:)", 33, 2, (void (*)(void *, id))sub_10035A228, v10, (uint64_t)sub_10035A234, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)importProgressForItemsPendingReconciliationWithCompletionHandler:(id)a3
{
}

- (void)importProgressForItemsPendingScanningDiskWithCompletionHandler:(id)a3
{
}

- (void)importProgressForItemsPendingScanningProviderWithCompletionHandler:(id)a3
{
}

- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4
{
}

- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4
{
}

- (void)getCountersArrayWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100345D50;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100345D50;
  *(void *)(v7 + 24) = v5;
  swift_retain_n();
  uint64_t v8 = self;
  sub_100292C20((uint64_t)"getCountersArray(completionHandler:)", 36, 2, (void (*)(void *, id))sub_1002201E8, v6, (uint64_t)sub_10035B168, v7);

  swift_release();
  swift_release();

  swift_release();
}

- (void)resetCountersWithCompletionHandler:(id)a3
{
}

- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3
{
}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_10096ADD0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = self;
  sub_10096AD20(v19);
  id v21 = v20;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = sub_10035A1BC;
  v22[3] = v15;
  v22[4] = v18;
  v22[5] = v16;
  aBlock[4] = sub_10035ACD0;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100274A48;
  aBlock[3] = &unk_100A7B7E0;
  BOOL v23 = _Block_copy(aBlock);
  id v24 = v16;
  uint64_t v25 = v18;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v25 itemIDForURL:v21 requireProviderItemID:0 request:v17 completionHandler:v23];
  _Block_release(v23);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10096AE50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  uint64_t v15 = self;
  sub_10096AD20(v16);
  uint64_t v18 = v17;
  id v19 = (void *)swift_allocObject();
  v19[2] = sub_10035A1BC;
  v19[3] = v13;
  v19[4] = v15;
  aBlock[4] = sub_10035B0D8;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100274A48;
  aBlock[3] = &unk_100A7B768;
  id v20 = _Block_copy(aBlock);
  id v21 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v21 itemIDForURL:v18 requireProviderItemID:0 request:v14 completionHandler:v20];
  _Block_release(v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10096AE50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  uint64_t v15 = self;
  sub_10096AD20(v16);
  uint64_t v18 = v17;
  id v19 = (void *)swift_allocObject();
  v19[2] = sub_100071B10;
  v19[3] = v13;
  v19[4] = v15;
  aBlock[4] = sub_10035B0D4;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100274A48;
  aBlock[3] = &unk_100A7B6F0;
  id v20 = _Block_copy(aBlock);
  id v21 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v21 itemIDForURL:v18 requireProviderItemID:0 request:v14 completionHandler:v20];
  _Block_release(v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_100011348(0, &qword_100AD0B10);
  uint64_t v6 = sub_10096C0A0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100345CC8;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = self;
  v9[4] = sub_100345CC8;
  v9[5] = v7;
  uint64_t v10 = self;
  swift_retain_n();
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  sub_1002934A0((uint64_t)"getDiagnosticAttributes(forItems:completionHandler:)", 52, 2, (void (*)(void *, id))sub_1002201E8, v8, (uint64_t)sub_10035A22C, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)pauseSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  unint64_t v51 = a5;
  id v52 = a6;
  v49 = self;
  uint64_t v50 = sub_10096AE50();
  uint64_t v8 = *(void *)(v50 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v50);
  v43 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = _Block_copy(a7);
  sub_10096ADD0();
  uint64_t v14 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v47 = v15;
  uint64_t v48 = v14;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v13;
  uint64_t v16 = sub_10002B7CC((uint64_t *)&unk_100AD08C0);
  uint64_t v17 = swift_allocBox();
  uint64_t v44 = v17;
  v45 = v12;
  uint64_t v19 = v18;
  uint64_t v20 = *(int *)(v16 + 48);
  uint64_t v21 = *(int *)(v16 + 64);
  uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
  uint64_t v23 = v50;
  v22(v18, v12, v50);
  *(void *)(v19 + v20) = v51;
  *(void *)(v19 + v21) = v52;
  unint64_t v41 = v17 | 0x9000000000000004;
  id v24 = v43;
  v22((uint64_t)v43, v12, v23);
  uint64_t v46 = v8;
  unint64_t v25 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v26 = (v9 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  id v29 = (char *)swift_allocObject();
  uint64_t v30 = v42;
  *((void *)v29 + 2) = sub_10035A1BC;
  *((void *)v29 + 3) = v30;
  v32 = v49;
  uint64_t v31 = v50;
  *((void *)v29 + 4) = v49;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v29[v25], v24, v31);
  *(void *)&v29[v26] = v51;
  id v33 = (uint64_t *)&v29[v27];
  uint64_t v34 = v47;
  *id v33 = v48;
  v33[1] = v34;
  unint64_t v35 = v41;
  *(void *)&v29[v28] = v41;
  id v36 = v52;
  v37 = v32;
  id v38 = v36;
  v39 = v37;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v40 = (uint64_t)v45;
  sub_1002A615C((uint64_t)v45, 1, v35, (void (*)(void, void))sub_10033E0B0, (uint64_t)v29);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v40, v31);
}

- (void)resumeSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  unint64_t v40 = a5;
  id v41 = a6;
  v39 = self;
  uint64_t v38 = sub_10096AE50();
  uint64_t v8 = *(void *)(v38 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v38);
  id v36 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = _Block_copy(a7);
  sub_10096ADD0();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v13;
  uint64_t v14 = sub_10002B7CC((uint64_t *)&unk_100AD6F30);
  uint64_t v15 = swift_allocBox();
  uint64_t v37 = v15;
  uint64_t v17 = v16;
  uint64_t v18 = *(int *)(v14 + 48);
  uint64_t v19 = *(int *)(v14 + 64);
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
  uint64_t v21 = v38;
  v20(v16, v12, v38);
  *(void *)(v17 + v18) = v40;
  *(void *)(v17 + v19) = v41;
  unint64_t v34 = v15 | 0x9000000000000006;
  uint64_t v22 = v36;
  v20((uint64_t)v36, v12, v21);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v24 = (v9 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (char *)swift_allocObject();
  uint64_t v26 = v35;
  *((void *)v25 + 2) = sub_10035A1BC;
  *((void *)v25 + 3) = v26;
  unint64_t v28 = v39;
  unint64_t v27 = v40;
  *((void *)v25 + 4) = v39;
  *((void *)v25 + 5) = v27;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v25[v23], v22, v21);
  unint64_t v29 = v34;
  *(void *)&v25[v24] = v34;
  id v30 = v41;
  uint64_t v31 = v28;
  id v32 = v30;
  id v33 = v31;
  swift_retain();
  swift_retain();
  sub_1002A615C((uint64_t)v12, 1, v29, (void (*)(void, void))sub_10033E0B8, (uint64_t)v25);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v21);
}

- (void)fetchLatestVersionForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = self;
  uint64_t v7 = sub_10096AE50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  id v36 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = _Block_copy(a5);
  sub_10096ADD0();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v13;
  uint64_t v14 = sub_10002B7CC((uint64_t *)&unk_100AD08D0);
  uint64_t v15 = swift_allocBox();
  uint64_t v37 = v15;
  uint64_t v17 = v16;
  uint64_t v18 = *(int *)(v14 + 48);
  uint64_t v19 = v8;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
  v20(v16, v12, v7);
  *(void *)(v17 + v18) = a4;
  unint64_t v21 = v15 | 0xA000000000000000;
  uint64_t v22 = v36;
  uint64_t v23 = v7;
  v20((uint64_t)v36, v12, v7);
  uint64_t v24 = v19;
  unint64_t v25 = (*(unsigned __int8 *)(v19 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v27 = v35;
  v26[2] = sub_10034599C;
  v26[3] = v27;
  unint64_t v28 = v38;
  v26[4] = v38;
  unint64_t v29 = (char *)v26 + v25;
  uint64_t v30 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v29, v22, v23);
  id v31 = a4;
  id v32 = v28;
  id v33 = v31;
  unint64_t v34 = v32;
  swift_retain();
  sub_1002A615C((uint64_t)v12, 0, v21, (void (*)(void, void))sub_10033E0C0, (uint64_t)v26);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v23);
}

- (void)disableDBQueryStatisticsWithCompletionHandler:(id)a3
{
}

- (void)resetDBQueryStatisticsWithCompletionHandler:(id)a3
{
}

- (void)getDBQueryStatisticsWithQueryPlan:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10034598C;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10034598C;
  *(void *)(v9 + 24) = v7;
  *(unsigned char *)(v9 + 32) = a3;
  swift_retain_n();
  uint64_t v10 = self;
  sub_1002938E0((uint64_t)"getDBQueryStatistics(withQueryPlan:completionHandler:)", 54, 2, (void (*)(void *, id))sub_10035A228, v8, (uint64_t)sub_10035A1E8, v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)sendDiagnosticsFromFPCKForItemIDs:(id)a3
{
  uint64_t v5 = sub_10002B7CC(&qword_100AD6540);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = sub_10096AF60();
  unint64_t v12 = v11;

  uint64_t v13 = sub_10096C270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v9;
  v14[5] = v10;
  v14[6] = v12;
  uint64_t v15 = v9;
  sub_10001EBB0(v10, v12);
  sub_10030E7D8((uint64_t)v7, (uint64_t)&unk_100AD0B00, (uint64_t)v14);
  swift_release();
  sub_10001E9C0(v10, v12);
}

- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v31 = a5;
  id v32 = a4;
  uint64_t v30 = self;
  uint64_t v7 = sub_10002B7CC(&qword_100AD6540);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v29 = v9;
  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = _Block_copy(a6);
  sub_10096ADD0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_10096C270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v21 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = 0;
  *(unsigned char *)(v22 + 32) = v31;
  uint64_t v23 = v30;
  *(void *)(v22 + 40) = v30;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v20, v14, v10);
  uint64_t v24 = (uint64_t (**)(char))(v22 + v21);
  char *v24 = sub_100345820;
  v24[1] = (uint64_t (*)(char))v18;
  unint64_t v25 = v32;
  *(void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8)) = v32;
  id v26 = v25;
  uint64_t v27 = v23;
  id v28 = v26;
  swift_retain();
  sub_10030E7D8((uint64_t)v29, (uint64_t)&unk_100AD0AF8, v22);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)launchFeedbackForDomain:(FPDDomain *)a3 itemIdentifier:(NSString *)a4 triggeringError:(NSError *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10002B7CC(&qword_100AD6540);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_10096C270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100AD0AC0;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100AD0AD0;
  v18[5] = v17;
  uint64_t v19 = a3;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  uint64_t v22 = self;
  sub_1003257A4((uint64_t)v13, (uint64_t)&unk_100AD0AE0, (uint64_t)v18);
  swift_release();
}

@end
@interface FPDDomainFPFSBackend
+ (id)registerXPCActivities;
- (BOOL)backgroundActivityIsPaused;
- (BOOL)isDeadEndBackend;
- (BOOL)isItemDataless:(id)a3;
- (BOOL)isProviderForRealPathURL:(id)a3;
- (BOOL)needsRootsCreation;
- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5;
- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3;
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
- (id)rootURLs;
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

- (BOOL)backgroundActivityIsPaused
{
  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs)) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1992E0);
  return *(unsigned char *)(swift_dynamicCastClassUnconditional() + 122);
}

- (int64_t)errorGenerationCount
{
  v2 = *(void **)&self->purposeIdentifier[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_errorGenerationRecord];
  v3 = self;
  id v4 = v2;
  sub_24DCCA208();

  return v6;
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  int64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_24D418184;
  *(void *)(v8 + 24) = v7;
  v9 = (void *)swift_allocObject();
  v9[2] = self;
  v9[3] = a3;
  v9[4] = sub_24D418184;
  v9[5] = v7;
  id v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v11;
  id v13 = v10;
  sub_24D3D7FA8((uint64_t)"fetchOperationServiceOrEndpoint(with:completionHandler:)", 56, 2, (void (*)(void *, uint64_t *, id))sub_24D6E5EB8, v8, (uint64_t)sub_24D6E4FAC, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = swift_allocObject();
  id v15 = a3;
  id v16 = a6;
  v17 = self;
  *(void *)(v14 + 16) = objc_msgSend(v15, sel_identifier);
  *(void *)(v14 + 24) = v16;
  unint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_24D418090;
  *(void *)(v18 + 24) = v13;
  id v19 = v16;
  swift_retain();
  sub_24D3E1828(v15, v9, v8, v14 | 0x9000000000000000, (uint64_t)sub_24D6E5E34, v18);

  swift_release();
  swift_release();

  swift_release();
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  id v4 = self;
  sub_24D3DCD50(a3);

  sub_24DCC8A58();
  v5 = (void *)sub_24DCC9C18();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)rootURLs
{
  id v1 = a1;
  sub_24D3DE0C8(v1, v1);

  sub_24DCC8A58();
  v2 = (void *)sub_24DCC9C18();
  swift_bridgeObjectRelease();

  return v2;
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_24DCC8A58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  id v14 = a4;
  id v15 = self;
  sub_24D3E2734((uint64_t)v11, v14, sub_24D418090, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (NSData)backingStoreIdentity
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  v3 = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_24D3F9C18(v5, v4);
    v3 = (void *)sub_24DCC8B28();
    sub_24D416034(v5, v4);
  }

  return (NSData *)v3;
}

- (void)setBackingStoreIdentity:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    v3 = (void *)sub_24DCC8B68();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  uint64_t v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  *uint64_t v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_24D416034(v11, v12);
}

- (_TtC9libfssync20FPDDomainFPFSBackend)initWithDomain:(id)a3
{
  return (_TtC9libfssync20FPDDomainFPFSBackend *)sub_24D60B2FC(a3);
}

- (NSArray)coordinationRootURLs
{
  v2 = self;
  sub_24D60D53C();

  sub_24DCC8A58();
  v3 = (void *)sub_24DCC9C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (NSFileProviderDomainVersion)domainVersion
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1992E0);
    v3 = (void *)swift_dynamicCastClassUnconditional();
    swift_retain();
    unint64_t v4 = self;
    uint64_t v5 = sub_24DBB1E14(v3, (uint64_t)v3);

    swift_release();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSFileProviderDomainVersion *)v5;
}

- (void)removeEbihilSymlink
{
  v2 = self;
  sub_24D613F84();
}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  v3 = self;
  sub_24D6146E4();

  return 1;
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
}

- (void)didChangeDomainConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D62A414(v4);
}

- (void)queryDiskImportSchedulerLabelWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_24D6D3E4C;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24D6D3E4C;
  *(void *)(v7 + 24) = v5;
  swift_retain_n();
  unint64_t v8 = self;
  sub_24D62388C((uint64_t)"queryDiskImportSchedulerLabel(completionHandler:)", 49, 2, (void (*)(uint64_t *, id))sub_24D6E5A34, v6, (uint64_t)sub_24D6E5EEC, v7);

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

  sub_24D6BD3EC(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs), self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs]);
  swift_release();
  sub_24D416034(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity), *(void *)&self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetWatchingQueue));
  sub_24D6D3120(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_startStatus));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetState, &qword_26B190150);
  swift_unknownObjectRelease();
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetStateURL, (uint64_t *)&unk_26B199050);

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend__signaledErrorGenerationDebouncer;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1990D0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (NSString)watcherLabel
{
  sub_24DCC97E8();
  v2 = (void *)sub_24DCC97B8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)sharedSchedulerCanRun:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D62B500(v4);
}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_24D6BDE38(a3, (char *)v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_24DCC9C28();
  _Block_copy(v6);
  unint64_t v8 = self;
  sub_24D6BE2EC(v7, (char *)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  sub_24DCC97E8();
  uint64_t v6 = self;
  sub_24DCCA208();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)needsRootsCreation
{
  v2 = self;
  if (sub_24D62E284()) {
    char v3 = 1;
  }
  else {
    char v3 = sub_24D62DF10();
  }

  return v3 & 1;
}

- (BOOL)isDeadEndBackend
{
  return 0;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B199050);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_24DCC8A58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_24DCC89E8();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  sub_24D3FB6F8(0, &qword_26B194098);
  uint64_t v14 = sub_24DCC9C28();
  id v15 = self;
  sub_24D62F57C((uint64_t)v9, v14, (uint64_t)v13);
  sub_24D415F74((uint64_t)v9, (uint64_t *)&unk_26B199050);
  swift_bridgeObjectRelease();

  uint64_t v16 = (void *)sub_24DCC8948();
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);

  return v16;
}

- (void)invalidate
{
  v2 = self;
  sub_24D62FC38();
}

- (id)cleanupDomainWithMode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v5 = self;
  id v6 = sub_24D635308((void (*)(char *, char *, uint64_t))a3);

  return v6;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DCC89E8();
  uint64_t v8 = self;
  BOOL v9 = sub_24D6367F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)saveFPCKTelemetryReport:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_24DCC9578();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_24D6BF070(v6, v7, (void (**)(void, void))v5);
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
  sub_24D6BFB34(v9, v10, v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_24D6BFFFC(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v10 = sub_24DCC8A58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_24DCC89E8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a5;
  v17 = self;
  sub_24D63B840((uint64_t)v13, v8, v16, (uint64_t)sub_24D418090, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  v27 = self;
  id v28 = a4;
  uint64_t v6 = sub_24DCC8A58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = _Block_copy(a5);
  v29 = v12;
  sub_24DCC89E8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = v12;
  uint64_t v16 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v18 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  v20 = v27;
  *(void *)(v19 + 16) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v17, v10, v16);
  v21 = (void (**)(uint64_t, uint64_t))(v19 + v18);
  *v21 = sub_24D6E4F2C;
  v21[1] = (void (*)(uint64_t, uint64_t))v14;
  v22 = v28;
  *(void *)(v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) = v28;
  id v23 = v22;
  v24 = v20;
  id v25 = v23;
  _Block_copy(v13);
  swift_retain();
  sub_24D6BAB9C((uint64_t)"putBackURLForTrashedItem(at:request:completionHandler:)", 55, 2, (uint64_t)sub_24D6BD74C, v19, v24, (void (**)(void, void, void))v13);
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
  uint64_t v11 = sub_24DCC8A58();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = _Block_copy(a7);
  sub_24DCC89E8();
  swift_unknownObjectRetain();
  uint64_t v16 = (char *)a6;
  unint64_t v17 = self;
  sub_24DCCA528();
  swift_unknownObjectRelease();
  _Block_copy(v15);
  id v18 = sub_24D6C0A44(v14, (uint64_t)v20, a5, v16, (char *)v17, (void (**)(const void *, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
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
  uint64_t v15 = self;
  sub_24D6447A0(v12, v13, v14, (void (*)(char *, id))sub_24D6E4F2C, v11);

  swift_release();
}

- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = sub_24DCC8A58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  sub_24DCC89E8();
  _Block_copy(v14);
  id v15 = a3;
  id v16 = a4;
  unint64_t v17 = self;
  sub_24D6C1ECC(v15, v16, (uint64_t)v13, v17, (void (**)(void, void, void, void))v14);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B190800);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24DCC9DF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26986C560;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26986C568;
  v14[5] = v13;
  id v15 = a3;
  id v16 = self;
  sub_24D6B2220((uint64_t)v9, (uint64_t)&unk_26986C570, (uint64_t)v14);
  swift_release();
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  unsigned int v38 = a4;
  uint64_t v9 = sub_24DCC8A58();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v33 - v14;
  id v16 = _Block_copy(a6);
  v37 = v15;
  sub_24DCC89E8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  id v18 = objc_allocWithZone(MEMORY[0x263F08AB8]);
  id v34 = a5;
  v36 = self;
  id v33 = objc_msgSend(v18, sel_init);
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
  *uint64_t v26 = sub_24D418090;
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
  sub_24D6BB16C((uint64_t)"evictItem(at:evictionReason:request:completionHandler:)", 55, 2, (uint64_t)sub_24D6BD9AC, v25, v36, (void (*)(void, id))sub_24D418090, v17);

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
  sub_24D6C2D34(v11, a4, v12, v13, (void (**)(void, void))v10);
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
  sub_24D6C3204(v12, location, length, v13, v14, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
}

- (void)itemChangedAtURL:(id)a3 request:(id)a4
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DCC89E8();
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
  sub_24D6C36E0(v15, a4, v10, v9, v16, v17, (void (**)(void, void, void, void))v14);
  _Block_release(v14);
  _Block_release(v14);
}

- (void)fakeFSEventAtURL:(id)a3
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DCC89E8();
  uint64_t v8 = self;
  sub_24D64AF68((uint64_t)v7);

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
  v9[4] = sub_24D4C5D6C;
  v9[5] = v7;
  id v10 = a3;
  id v11 = self;
  id v12 = v10;
  id v13 = v11;
  swift_retain();
  sub_24D3E29E4(v8, (uint64_t)"didChange(_:completionHandler:)", 31, 2, (uint64_t)sub_24D6E4F48, (uint64_t)v9);

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
  sub_24D6C6638(v11, (uint64_t)a4, (uint64_t)a5, (char *)v12, (void (**)(void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  uint64_t v10 = sub_24DCC9C28();
  _Block_copy(v9);
  id v11 = a5;
  id v12 = self;
  sub_24D6C691C(v10, a4, v11, (char *)v12, (void (**)(void, void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)decorateItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B199E90);
  uint64_t v6 = sub_24DCC9C28();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_24D6C6E94(v6, v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (int64_t)nonEvictableSpace
{
  v2 = self;
  int64_t v3 = sub_24D65AA6C();

  return v3;
}

- (int64_t)accumulatedSizeOfPinnedItems
{
  v2 = self;
  int64_t v3 = sub_24D65B134();

  return v3;
}

- (id)accumulatedSizeOfItems
{
  v2 = self;
  int64_t v3 = sub_24D65B79C();

  if (v3)
  {
    sub_24D3FB6F8(0, (unint64_t *)&qword_26B199EA0);
    uint64_t v4 = (void *)sub_24DCC9558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)fetchTelemetryReportWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_24D6D1BE0;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_24D6D1BE0;
  v7[4] = v5;
  uint64_t v8 = self;
  swift_retain_n();
  uint64_t v9 = v8;
  sub_24D62454C((uint64_t)"fetchTelemetryReport(completionHandler:)", 40, 2, (void (*)(void *, id))sub_24D6E4F90, v6, (uint64_t)sub_24D6E4F64, (uint64_t)v7);

  swift_release();
  swift_release();

  swift_release();
}

- (id)providerVersion
{
  v2 = self;
  sub_24D65FB68();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_24DCC97B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_24DCC8A58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  id v15 = self;
  id v16 = (void *)sub_24DCC8948();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = sub_24D6D1BBC;
  v17[3] = v13;
  v17[4] = v15;
  v17[5] = v14;
  aBlock[4] = sub_24D6E5A3C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D418084;
  aBlock[3] = &block_descriptor_1475;
  id v18 = _Block_copy(aBlock);
  id v19 = v14;
  unint64_t v20 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v20 itemForURL:v16 request:v19 completionHandler:v18];
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  uint64_t v10 = self;
  sub_24D6C7AA4(v9, a4, (char *)v10, (void (**)(void, void))v8);
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
  id v9 = sub_24D6C7F64(a4);

  return v9;
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = sub_24DCC8A58();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  type metadata accessor for URLResourceKey(0);
  unint64_t v14 = sub_24DCC9C28();
  sub_24DCC89E8();
  id v15 = (void *)swift_allocObject();
  v15[2] = v13;
  id v16 = a5;
  uint64_t v17 = self;
  sub_24D665D88(v14, (uint64_t)v12, v16, sub_24D6D1B84, v15);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)materializedURLForItemID:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B199050);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = dispatch_group_create();
  uint64_t v11 = swift_allocBox();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24DCC8A58();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  dispatch_group_enter(v10);
  swift_retain();
  id v16 = v10;
  sub_24D6C86BC(v8, v9, v11, v16);
  swift_release();

  sub_24DCCA168();
  swift_beginAccess();
  sub_24D415FD0(v13, (uint64_t)v7, (uint64_t *)&unk_26B199050);

  swift_release();
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
  {
    uint64_t v17 = (void *)sub_24DCC8948();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }

  return v17;
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
  sub_24D6C81F0(v4, v5, v7, v8);
  swift_release();

  sub_24DCCA168();
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
  *(void *)(v17 + 16) = sub_24D418090;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_24D418090;
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
  sub_24D622700((uint64_t)"createItemBased(onTemplate:fields:urlWrapper:options:bounceOnCollision:request:completionHandler:)", 98, 2, (void (*)(void *, id))sub_24D6E4F8C, v17, (uint64_t)sub_24D6C8C58, v18);

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
  *(void *)(v8 + 16) = sub_24D418090;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_24D418090;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  uint64_t v13 = v11;
  sub_24D622700((uint64_t)"forceIngestion(for:completionHandler:)", 38, 2, (void (*)(void *, id))sub_24D6E4F8C, v8, (uint64_t)sub_24D6E4FB8, (uint64_t)v9);

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
  *(void *)(v8 + 16) = sub_24D418090;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_24D418090;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  uint64_t v13 = v11;
  sub_24D622700((uint64_t)"forceFSIngestion(for:completionHandler:)", 40, 2, (void (*)(void *, id))sub_24D6E4F8C, v8, (uint64_t)sub_24D6E4FB4, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)forceIngestionAtURL:(id)a3
{
  uint64_t v3 = sub_24DCC8A58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DCC89E8();
  sub_24D6C8CAC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)pinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_24D418090;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_24D418090;
  v11[6] = v9;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  swift_retain_n();
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = v14;
  sub_24D622700((uint64_t)"pinItem(with:request:completionHandler:)", 40, 2, (void (*)(void *, id))sub_24D6E4F8C, v10, (uint64_t)sub_24D6C9040, (uint64_t)v11);

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
  *(void *)(v10 + 16) = sub_24D418090;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_24D418090;
  v11[6] = v9;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  swift_retain_n();
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = v14;
  sub_24D622700((uint64_t)"unpinItem(with:request:completionHandler:)", 42, 2, (void (*)(void *, id))sub_24D6E4F8C, v10, (uint64_t)sub_24D6C905C, (uint64_t)v11);

  swift_release();
  swift_release();

  swift_release();
}

- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_24D3FB6F8(0, &qword_26B194098);
  uint64_t v8 = sub_24DCC9C28();
  _Block_copy(v7);
  id v9 = a4;
  uint64_t v10 = self;
  sub_24D6C9F18(v8, v9, (char *)v10, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  sub_24DCC8A58();
  uint64_t v10 = sub_24DCC9C28();
  _Block_copy(v9);
  id v11 = a5;
  id v12 = self;
  sub_24D6CA434(v10, (void *)a4, v11, (char *)v12, (void (**)(void, void))v9);
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
  *(void *)(v10 + 16) = sub_24D418090;
  *(void *)(v10 + 24) = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = self;
  v11[3] = sub_24D418090;
  v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  id v12 = a4;
  id v13 = self;
  swift_retain_n();
  uint64_t v14 = v13;
  id v15 = v12;
  sub_24D624DCC((uint64_t)"getKnownFolderLocations(_:request:completionHandler:)", 53, 2, (void (*)(void *, id))sub_24D6E4F8C, v10, (uint64_t)sub_24D6C90F8, (uint64_t)v11);

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
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B199E90);
  unint64_t v10 = sub_24DCC9C28();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a5;
  id v13 = self;
  sub_24D6802AC(v10, a4, v12, (uint64_t)sub_24D6D198C, v11);

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
  uint64_t v7 = sub_24DCC8A58();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  id v13 = &v22[-v12];
  uint64_t v14 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v8 + 32))(v18 + v16, v11, v7);
  id v19 = (void (**)(uint64_t, void *, uint64_t))(v18 + v17);
  *id v19 = sub_24D6D1650;
  v19[1] = (void (*)(uint64_t, void *, uint64_t))v15;
  unint64_t v20 = v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v20 = self;
  *(unsigned char *)(v20 + 8) = v23;
  id v21 = self;
  swift_retain();
  sub_24D6BC12C((uint64_t)"listRemoteVersionsOfItem(at:includeCachedVersions:completionHandler:)", 69, 2, (uint64_t)sub_24D6C92D0, v18, v21, (void (*)(void, void, id))sub_24D6D1650, v15);

  swift_release();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v12 = sub_24DCC8A58();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = _Block_copy(a6);
  unint64_t v17 = _Block_copy(a7);
  sub_24DCC89E8();
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B194070);
  uint64_t v18 = sub_24DCC9C28();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  id v21 = self;
  sub_24D686E8C((uint64_t)v15, v18, (uint64_t)sub_24D6D1628, v19, (void (*)(void))sub_24D5B3F9C, (void (*)(void))v20, width, height);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = self;
  *(void *)(v12 + 24) = sub_24D6D15D4;
  *(void *)(v12 + 32) = v11;
  *(unsigned char *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_24D6C94E0;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = sub_24D6C94E0;
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
  sub_24D6281D4((uint64_t)"resolveProviderItemID(_:completionHandler:)", 43, 2, (void (*)(id *))sub_24D417998, v13, (uint64_t)sub_24D6E4FA8, (uint64_t)v14);

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
  *(void *)(v8 + 16) = sub_24D418090;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = self;
  v9[3] = sub_24D418090;
  v9[4] = v7;
  v9[5] = a3;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  uint64_t v12 = v11;
  id v13 = v10;
  sub_24D62520C((uint64_t)"fetchVendorEndpoint(with:completionHandler:)", 44, 2, (void (*)(void *, id))sub_24D6E4F8C, v8, (uint64_t)sub_24D6E4FA4, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)didChangeNeedsAuthentification:(BOOL)a3
{
  uint64_t v4 = self;
  sub_24D688BFC(a3);
}

- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v8 = a3;
  uint64_t v7 = self;
  sub_24D6CBF5C(v8, (char *)v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)updateShouldRetryThrottledOperations:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_24D6CC654(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)listAvailableTestingOperationsWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_24D6D14CC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = sub_24D6D14CC;
  v9[4] = v7;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;
  swift_retain_n();
  id v12 = v10;
  id v13 = v11;
  sub_24D62564C((uint64_t)"listAvailableTestingOperations(with:completionHandler:)", 55, 2, (void (*)(void *, id))sub_24D5B3FA4, v8, (uint64_t)sub_24D6E4FA0, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)runTestingOperations:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26986C538);
  uint64_t v8 = sub_24DCC9C28();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_24D6D1464;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v8;
  v11[3] = a4;
  v11[4] = sub_24D6D1464;
  v11[5] = v9;
  id v12 = a4;
  swift_retain_n();
  id v13 = v12;
  uint64_t v14 = self;
  swift_bridgeObjectRetain();
  sub_24D625A8C((uint64_t)"run(_:request:completionHandler:)", 33, 2, (void (*)(void *, id))sub_24D6E4F90, v10, (uint64_t)sub_24D6E4F9C, (uint64_t)v11);

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
  *(void *)(v6 + 16) = sub_24D6D141C;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24D6D141C;
  *(void *)(v7 + 24) = v5;
  swift_retain_n();
  uint64_t v8 = self;
  sub_24D625ECC((uint64_t)"getCountersArray(completionHandler:)", 36, 2, (void (*)(void *, id))sub_24D5B3FA4, v6, (uint64_t)sub_24D6E5ED0, v7);

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
  uint64_t v10 = sub_24DCC8A58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_24DCC89E8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = self;
  id v19 = (void *)sub_24DCC8948();
  id v20 = (void *)swift_allocObject();
  v20[2] = sub_24D418090;
  v20[3] = v15;
  v20[4] = v18;
  v20[5] = v16;
  aBlock[4] = sub_24D6E5A38;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D418084;
  aBlock[3] = &block_descriptor_1061;
  id v21 = _Block_copy(aBlock);
  id v22 = v16;
  BOOL v23 = v18;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v23 itemIDForURL:v19 requireProviderItemID:0 request:v17 completionHandler:v21];
  _Block_release(v21);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_24DCC8A58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = (void *)sub_24DCC8948();
  id v17 = (void *)swift_allocObject();
  v17[2] = sub_24D418090;
  v17[3] = v13;
  v17[4] = v15;
  aBlock[4] = sub_24D6E5E40;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D418084;
  aBlock[3] = &block_descriptor_1050;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v19 itemIDForURL:v16 requireProviderItemID:0 request:v14 completionHandler:v18];
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_24DCC8A58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = (void *)sub_24DCC8948();
  id v17 = (void *)swift_allocObject();
  v17[2] = sub_24D5B3F9C;
  v17[3] = v13;
  v17[4] = v15;
  aBlock[4] = sub_24D6E5E3C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D418084;
  aBlock[3] = &block_descriptor_1040;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v15;
  swift_retain();
  swift_release();
  [(FPDDomainFPFSBackend *)v19 itemIDForURL:v16 requireProviderItemID:0 request:v14 completionHandler:v18];
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_24D3FB6F8(0, &qword_26986C530);
  uint64_t v6 = sub_24DCC9C28();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_24D6D1394;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = self;
  v9[4] = sub_24D6D1394;
  v9[5] = v7;
  uint64_t v10 = self;
  swift_retain_n();
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  sub_24D62674C((uint64_t)"getDiagnosticAttributes(forItems:completionHandler:)", 52, 2, (void (*)(void *, id))sub_24D5B3FA4, v8, (uint64_t)sub_24D6E4F94, (uint64_t)v9);

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
  uint64_t v50 = sub_24DCC8A58();
  uint64_t v8 = *(void *)(v50 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v50);
  v43 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = _Block_copy(a7);
  sub_24DCC89E8();
  uint64_t v14 = sub_24DCC97E8();
  uint64_t v47 = v15;
  uint64_t v48 = v14;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26986C410);
  uint64_t v17 = swift_allocBox();
  uint64_t v44 = v17;
  v45 = v12;
  uint64_t v19 = v18;
  uint64_t v20 = *(int *)(v16 + 48);
  uint64_t v21 = *(int *)(v16 + 64);
  id v22 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
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
  *((void *)v29 + 2) = sub_24D418090;
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
  sub_24D638B80((uint64_t)v45, 1, v35, (void (*)(void, void))sub_24D6C9734, (uint64_t)v29);

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
  uint64_t v38 = sub_24DCC8A58();
  uint64_t v8 = *(void *)(v38 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v38);
  id v36 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = _Block_copy(a7);
  sub_24DCC89E8();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26986F5D0);
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
  id v22 = v36;
  v20((uint64_t)v36, v12, v21);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v24 = (v9 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (char *)swift_allocObject();
  uint64_t v26 = v35;
  *((void *)v25 + 2) = sub_24D418090;
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
  sub_24D638B80((uint64_t)v12, 1, v29, (void (*)(void, void))sub_24D6C973C, (uint64_t)v25);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v21);
}

- (void)fetchLatestVersionForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = self;
  uint64_t v7 = sub_24DCC8A58();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v36 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = _Block_copy(a5);
  sub_24DCC89E8();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26986C420);
  uint64_t v15 = swift_allocBox();
  uint64_t v37 = v15;
  uint64_t v17 = v16;
  uint64_t v18 = *(int *)(v14 + 48);
  uint64_t v19 = v8;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 16);
  v20(v16, v12, v7);
  *(void *)(v17 + v18) = a4;
  unint64_t v21 = v15 | 0xA000000000000000;
  id v22 = v36;
  uint64_t v23 = v7;
  v20((uint64_t)v36, v12, v7);
  uint64_t v24 = v19;
  unint64_t v25 = (*(unsigned __int8 *)(v19 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v27 = v35;
  v26[2] = sub_24D6D1068;
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
  sub_24D638B80((uint64_t)v12, 0, v21, (void (*)(void, void))sub_24D6C9744, (uint64_t)v26);

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
  *(void *)(v8 + 16) = sub_24D6D1058;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24D6D1058;
  *(void *)(v9 + 24) = v7;
  *(unsigned char *)(v9 + 32) = a3;
  swift_retain_n();
  uint64_t v10 = self;
  sub_24D626B8C((uint64_t)"getDBQueryStatistics(withQueryPlan:completionHandler:)", 54, 2, (void (*)(void *, id))sub_24D6E4F90, v8, (uint64_t)sub_24D6E4F54, v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)sendDiagnosticsFromFPCKForItemIDs:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B190800);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = sub_24DCC8B68();
  unint64_t v12 = v11;

  uint64_t v13 = sub_24DCC9DF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v9;
  v14[5] = v10;
  v14[6] = v12;
  uint64_t v15 = v9;
  sub_24D3F9C18(v10, v12);
  sub_24D3D3434((uint64_t)v7, (uint64_t)&unk_26986C520, (uint64_t)v14);
  swift_release();
  sub_24D400DCC(v10, v12);
}

- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v31 = a5;
  id v32 = a4;
  uint64_t v30 = self;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B190800);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v29 = v9;
  uint64_t v10 = sub_24DCC8A58();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = _Block_copy(a6);
  sub_24DCC89E8();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_24DCC9DF8();
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
  char *v24 = sub_24D6D0EEC;
  v24[1] = (uint64_t (*)(char))v18;
  unint64_t v25 = v32;
  *(void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8)) = v32;
  id v26 = v25;
  uint64_t v27 = v23;
  id v28 = v26;
  swift_retain();
  sub_24D3D3434((uint64_t)v29, (uint64_t)&unk_26986C518, v22);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)launchFeedbackForDomain:(FPDDomain *)a3 itemIdentifier:(NSString *)a4 triggeringError:(NSError *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B190800);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24DCC9DF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26986C4E0;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26986C4F0;
  v18[5] = v17;
  uint64_t v19 = a3;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  uint64_t v22 = self;
  sub_24D6B2220((uint64_t)v13, (uint64_t)&unk_26986C500, (uint64_t)v18);
  swift_release();
}

+ (id)registerXPCActivities
{
  uint64_t v0 = sub_24DCC9078();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (id)fpfs_current_or_default_log();
  sub_24DCC9088();
  uint64_t v5 = sub_24DCC9068();
  os_log_type_t v6 = sub_24DCCA108();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24D3D0000, v5, v6, "registering xpc activities", v7, 2u);
    MEMORY[0x25332B030](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_26B1974B0 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A23E8, sel_ping);
  if (qword_26B1978D8 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A24A0, sel_ping);
  if (qword_26B1902A0 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A22A8, sel_ping);
  if (qword_26B1997F0 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A2490, sel_ping);
  if (qword_26B199A70 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A24C0, sel_ping);
  if (qword_26B197988 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A24B0, sel_ping);
  if (qword_26B1933B8 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A22A0, sel_ping);
  if (qword_26B199560 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A23D8, sel_ping);
  if (qword_26B1997D8 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26B1A23F8, sel_ping);
  if (qword_26B194290 != -1) {
    swift_once();
  }
  return objc_msgSend((id)qword_26B1A2380, sel_ping);
}

@end
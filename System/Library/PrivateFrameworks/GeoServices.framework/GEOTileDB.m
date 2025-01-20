@interface GEOTileDB
+ (void)migrateDBFrom:(id)a3 to:(id)a4;
+ (void)migrateFilesFrom:(id)a3 to:(id)a4;
- (BOOL)_addSubscriptionOnDBQueue:(id)a3 error:(id *)a4;
- (BOOL)_cleanUpDataForRemovedOfflineSubscriptionsWithError:(id *)a3;
- (BOOL)_dataForKeyOnDBQueue:(long long *)a3 reason:(unsigned int)a4 callbackQueue:(void *)a5 dataHandler:(void *)a6;
- (BOOL)_deleteTileSet:(id)a3 deletedExternalResources:(BOOL *)a4;
- (BOOL)_dropAllTileData;
- (BOOL)_hasDataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6;
- (BOOL)_isTileSetTTLExpired:(id)a3 age:(double)a4;
- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 externalResourceUUID:(id *)a5;
- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 preferredExternalResourceUUID:(id)a5 externalResourceUUID:(id *)a6;
- (BOOL)_removeSubscriptionOnDBQueue:(id)a3 error:(id *)a4;
- (BOOL)_setup:(id)a3;
- (BOOL)clearPurgeableOfflineData;
- (BOOL)hasDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6;
- (GEOTileDB)init;
- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4;
- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4 manifestManager:(id)a5 countryConfiguration:(id)a6 offlineDataConfiguration:(id)a7 locale:(id)a8 maximumDatabaseSize:(unint64_t)a9;
- (GEOTileDBExtractedData)extractDataForOfflineKey:(void *)a3 fromBatchFileHandle:(size_t)a4 batchSize:(unint64_t)a5 sizeInBatch:(void *)a6 externalDataDirectory:(void *)a7 error:;
- (NSString)devicePostureCountry;
- (NSString)devicePostureRegion;
- (id)_allFullyDownloadedOfflineSubscriptions;
- (id)_dataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6;
- (id)_fetchExpiredSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)_fetchSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)_getOfflineKeysForLayerOnDBQueue:(unsigned int)a3 version:(unint64_t)a4 error:(id *)a5;
- (id)_setupDB:(id)a3;
- (id)dataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6;
- (int64_t)_insertDataRowForData:(id)a3 ETag:(id)a4 externalResourceUUID:(id)a5 timestamp:(int64_t *)a6 subscriptionIdentifier:(id)a7;
- (uint64_t)_extractDataFromFileHandle:(void *)a1 sizeInBatch:(unint64_t)a2 toFileHandle:(void *)a3 compressionAlgorithm:(uint64_t)a4 error:(void *)a5;
- (uint64_t)_markExistingTileDataAsCurrentOnDBQueue:(int *)a3 reason:(unsigned int)a4 subscriptionIdentifier:(void *)a5;
- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(__int16)a9 isIdenticalToExistingStaleData:;
- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(unsigned __int8)a9;
- (uint64_t)deleteDataForKey:(long long *)a3;
- (uint64_t)trackFailureForKey:(long long *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5;
- (unint64_t)_allTileDataSize;
- (unint64_t)_shrinkBySize:(unint64_t)a3;
- (unint64_t)_shrinkBySizeSlow:(unint64_t)a3;
- (unint64_t)_shrinkToSize:(unint64_t)a3;
- (unint64_t)calculateFreeableSizeSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (unint64_t)shrinkToSizeSync:(unint64_t)a3;
- (void)_addDataOnDBQueueWithData:(id)a3 forOfflineBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 externalResourceUUID:(id)a7 containedKeys:(id)a8 subscriptionIdentifier:(id)a9;
- (void)_addDataOnDBQueueWithData:(void *)a3 key:(int *)a4 tileSet:(int)a5 ETag:(void *)a6 reason:(unsigned int)a7 externalResourceUUID:(void *)a8 subscriptionIdentifier:(void *)a9;
- (void)_cleanUpDeletedExternalDataIfNecessary;
- (void)_cleanUpOrphanedExternalResources;
- (void)_countryChanged:(id)a3;
- (void)_decrementCalculatedTileDataSize:(unint64_t)a3;
- (void)_deleteDataOnDBQueueForKey:(int *)a3;
- (void)_deleteOfflineDataNotMatchingVersions:(id)a3 orVersions:(id)a4;
- (void)_deviceLocked:(id)a3;
- (void)_editionUpdate:(id)a3;
- (void)_enumerateAllKeysOnQueueIncludingData:(BOOL)a3 dataHandler:(id)a4 callbackQueue:(id)a5;
- (void)_enumerateSubscriptionExpirationDates:(id)a3;
- (void)_evictIfNecessary;
- (void)_evictVeryOldTiles:(BOOL *)a3;
- (void)_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary;
- (void)_fetchSubscriptionMetadataWithIdentifierOnQueue:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)_flushPendingWrites;
- (void)_incrementCalculatedTileDataSize:(unint64_t)a3;
- (void)_invalidateAllTileData;
- (void)_invalidateSubscriptionsReferencingOldestTilesWithLimit:(unint64_t)a3;
- (void)_invalidateSubscriptionsReferencingTilesOlderThan:(unint64_t)a3 forTileSet:(id *)a4;
- (void)_invalidateTileSet:(id)a3;
- (void)_invalidateTileSetsForNewDevicePostureCountry:(id)a3 newDevicePostureRegion:(id)a4 oldDevicePostureCountry:(id)a5 oldDevicePostureRegion:(id)a6;
- (void)_invalidateTileSubscriptionStatesForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4;
- (void)_invalidatedTilesReferencedBySubscription:(int64_t)a3 tileSet:(unsigned int)a4;
- (void)_localeChanged:(id)a3;
- (void)_markDataAtRow:(int64_t)a3 associatedWithSubscriptionIdentifier:(id)a4;
- (void)_markDataForTileKey:(int *)a3 associatedWithSubscriptionIdentifier:(void *)a4;
- (void)_performInTransaction:(id)a3;
- (void)_performOnDBQueue:(id)a3;
- (void)_removeExpiredSubscriptions;
- (void)_setEdition:(unsigned int)a3 forTileSet:(id)a4;
- (void)_setLastAccessTime:(double)a3 forMostRecentlyUsedSubscriptionReferencingDataRow:(int64_t)a4;
- (void)_setLastAccessTimeOnDBQueue:(double)a3 forDataRow:(int64_t)a4;
- (void)_setLastAccessTimeOnDBQueue:(uint64_t)a3 forKey:(int *)a4;
- (void)_setSubscriptionWithIdentifierOnQueue:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7;
- (void)_supportsOfflineDidChange:(id)a3;
- (void)_trackFailureOnDBQueueWithKey:(int *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5;
- (void)_updateDevicePosture;
- (void)_vacuum;
- (void)addData:(id)a3 forOfflineDataBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 containedKeys:(id)a7 forSubscriptionIdentifier:(id)a8;
- (void)addData:(void *)a3 forKey:(long long *)a4 edition:(int)a5 set:(int)a6 provider:(uint64_t)a7 etag:(void *)a8 reason:(char)a9 isIdenticalToExistingStaleData:(unsigned __int8)a10 forSubscriptionWithIdentifier:(void *)a11;
- (void)addSubscription:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)beginPreloadSessionOfSize:(unint64_t)a3;
- (void)calculateFreeableSizeWithQueue:(id)a3 handler:(id)a4;
- (void)calculateSizeOfAllOfflineDataWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)clearDownloadStateForSubscriptionWithIdentifier:(id)a3;
- (void)clearShouldSyncSubscriptionsForPairedDevice:(id)a3;
- (void)dataForKeys:(id)a3 reason:(unsigned __int8)a4 group:(id)a5 callbackQueue:(id)a6 dataHandler:(id)a7;
- (void)dealloc;
- (void)deleteDataForTilesets:(id)a3;
- (void)determineIfOfflineDataBatchExistsForKey:(id)a3 version:(unint64_t)a4 associatingWithSubscriptionIdentifier:(id)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)determineIfOfflineDataExistsForKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)endPreloadSession;
- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6;
- (void)evaluateDevicePostureAgainstCurrentManifest:(id)a3;
- (void)evictVeryOldTilesWithGroup:(id)a3;
- (void)expireSubscriptionsIfNecessaryWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchAllExpiredSubscriptionsWithQueue:(id)a3 callback:(id)a4;
- (void)fetchAllSubscriptionsToSyncToPairedDevice:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)fetchAllSubscriptionsWithQueue:(id)a3 callback:(id)a4;
- (void)fetchExpiredSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)fetchSubscriptionMetadataWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 toSyncToPairedDevice:(id)a4 queue:(id)a5 callback:(id)a6;
- (void)findShiftResponseForCoordinate:(id)a3 reduceRadius:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)findShiftResponseForCoordinate:(id)a3 withinRadius:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)flushPendingWritesWithGroup:(id)a3;
- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)getDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)getFailedTileKeysForProactiveLoadSince:(double)a3 maxCount:(unint64_t)a4 queue:(id)a5 callback:(id)a6;
- (void)getLastAccessTimestampForKey:(long long *)a3 callbackQueue:(void *)a4 callback:(void *)a5;
- (void)getNextSubscriptionExpirationDateWithQueue:(id)a3 callback:(id)a4;
- (void)getOfflineKeysForLayer:(unsigned int)a3 version:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6;
- (void)getStaleTileKeysUsedSince:(double)a3 fromTileSets:(id)a4 maxCount:(unint64_t)a5 maxTotalSize:(unint64_t)a6 queue:(id)a7 callback:(id)a8;
- (void)linkShiftResponse:(int64_t)a3 toSubscription:(id)a4;
- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4;
- (void)offlineDataConfiguration:(id)a3 didChangeLatestAvailableVersions:(id)a4;
- (void)offlineDataConfiguration:(id)a3 didChangeRegulatoryRegionID:(unsigned int)a4;
- (void)pruneShiftEntries;
- (void)pruneShiftEntriesOlderThan:(id)a3 maximumEntriesToKeep:(int)a4;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeAllShiftEntries;
- (void)removeAllShiftEntriesSync;
- (void)removeSubscriptionWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)setDownloadState:(int64_t)a3 forSubscriptionWithIdentifier:(id)a4;
- (void)setExpirationRecords:(id *)a3 count:(unint64_t)a4;
- (void)setSubscriptionWithIdentifier:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7;
- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5;
- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5 shouldOverwriteExistingValue:(BOOL)a6;
- (void)shrinkBySize:(unint64_t)a3 queue:(id)a4 callback:(id)a5;
- (void)shrinkToSize:(unint64_t)a3 queue:(id)a4 finished:(id)a5;
- (void)storeShiftResponse:(id)a3;
- (void)storeShiftResponse:(id)a3 forSubscription:(id)a4;
- (void)tearDown;
- (void)trackSubscriptionAssociationForKey:(long long *)a3 subscriptionIdentifier:(void *)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation GEOTileDB

uint64_t __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke_547(void *a1)
{
  uint64_t result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[10] + 8) + 24));
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (NSString)devicePostureRegion
{
  v5 = self->_infrequentlyChangingMetadataIsolater;
  _geo_isolate_lock_data();
  v3 = self->_devicePostureRegion;
  _geo_isolate_unlock();

  return v3;
}

- (NSString)devicePostureCountry
{
  v5 = self->_infrequentlyChangingMetadataIsolater;
  _geo_isolate_lock_data();
  v3 = self->_devicePostureCountry;
  _geo_isolate_unlock();

  return v3;
}

- (void)dataForKeys:(id)a3 reason:(unsigned __int8)a4 group:(id)a5 callbackQueue:(id)a6 dataHandler:(id)a7
{
  id v12 = a3;
  v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13) {
    dispatch_group_enter(v13);
  }
  db = self->_db;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke;
  v26[3] = &unk_1E53D8DF0;
  id v27 = v12;
  v28 = self;
  unsigned __int8 v32 = a4;
  id v29 = v14;
  id v31 = v15;
  v30 = v13;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_2;
  v21[3] = &unk_1E53D8E40;
  id v22 = v29;
  id v23 = v27;
  v24 = v30;
  id v25 = v31;
  v17 = v30;
  id v18 = v31;
  id v19 = v27;
  id v20 = v29;
  [(GEOSQLiteDB *)db executeAsync:v26 errorHandler:v21];
}

uint64_t __38__GEOTileDB__isTileSetTTLExpired_age___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 80);
  if (v2)
  {
    for (i = (double *)(*(void *)(v1 + 72) + 8); *((_DWORD *)i - 2) != *(_DWORD *)(result + 56); i += 2)
    {
      if (!--v2) {
        return result;
      }
    }
    if (*(double *)(result + 48) > *i) {
      *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  v4 = [v2 _fetchSubscriptionsWithIdentifiers:v3 error:&v14];
  id v5 = v14;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2;
  v10[3] = &unk_1E53D95B8;
  v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v12 = v5;
  id v13 = v7;
  id v11 = v4;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (id)_fetchSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = GEOGetTileDBLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Fetching subscriptions matching identifiers: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [MEMORY[0x1E4F1CA48] array];
  db = self->_db;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __54__GEOTileDB__fetchSubscriptionsWithIdentifiers_error___block_invoke;
  v21 = &unk_1E53D95E0;
  p_long long buf = &buf;
  unint64_t v25 = (unint64_t)Current;
  id v12 = v6;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  int Subscriptions = FetchSubscriptions(db, a4, &v18);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(GEOTileDB *)self _removeExpiredSubscriptions];
  }
  if (Subscriptions) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&buf, 8);

  return v16;
}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
      id v8 = (void *)MEMORY[0x18C1203C0](v3);
      LODWORD(v7) = objc_msgSend(*(id *)(a1 + 40), "_dataForKeyOnDBQueue:reason:callbackQueue:dataHandler:", v7, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 64), (void)v10);
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v9 = *(NSObject **)(a1 + 56);
  if (v9) {
    dispatch_group_leave(v9);
  }
}

- (void)_setLastAccessTimeOnDBQueue:(uint64_t)a3 forKey:(int *)a4
{
  int v6 = *a4;
  int v7 = a4[1];
  int v8 = a4[2];
  int v9 = a4[3];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  long long v10 = (void *)a1[1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__GEOTileDB__setLastAccessTimeOnDBQueue_forKey___block_invoke;
  v11[3] = &unk_1E53D8E90;
  v11[4] = &v12;
  LookupTileRowForKey(v10, v6, v7, v8, v9, v11);
  if (v13[3] != -1) {
    objc_msgSend(a1, "_setLastAccessTimeOnDBQueue:forDataRow:", a2);
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_setLastAccessTimeOnDBQueue:(double)a3 forDataRow:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__GEOTileDB__setLastAccessTimeOnDBQueue_forDataRow___block_invoke;
  v12[3] = &unk_1E53D8FF8;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = a4;
  if ([(GEOSQLiteDB *)db statementForKey:@"GetAccessTime" statementBlock:v12])
  {
    uint64_t v8 = (uint64_t)(*MEMORY[0x1E4F1CF78] + a3);
    if (!*((unsigned char *)v18 + 24)) {
      goto LABEL_6;
    }
    uint64_t v9 = v8 - v14[3];
    if (v9 < 0) {
      uint64_t v9 = v14[3] - v8;
    }
    if (self->_timestampDeltaWriteThreshold >= (double)v9)
    {
      long long v10 = GEOGetTileDBLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = v8 - v14[3];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v22 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Last-access timestamp has not changed sufficiently (only %lli). Not writing.", buf, 0xCu);
      }
    }
    else
    {
LABEL_6:
      UpdateAccessTime(self->_db, a4, v8 & ~(v8 >> 63));
    }
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)_dataForKeyOnDBQueue:(long long *)a3 reason:(unsigned int)a4 callbackQueue:(void *)a5 dataHandler:(void *)a6
{
  uint64_t v8 = a3;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v48 = a3;
  long long v10 = a5;
  id v11 = a6;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__5;
  v42[4] = __Block_byref_object_dispose__5;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41[0] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  char v38 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  uint64_t v12 = *(void **)(a1 + 16);
  id obj = 0;
  uint64_t v13 = [v12 dataForKey:v8 ETag:&obj originalLoadReason:v41 isKnownNotToExist:&v38];
  objc_storeStrong(&v43, obj);
  id v37 = v13;
  if (v33[5])
  {
    *((unsigned char *)v45 + 24) = 1;
  }
  else if (!v38)
  {
    uint64_t v27 = 0;
    char v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v14 = *(void **)(a1 + 8);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke;
    v26[3] = &unk_1E53D8DA0;
    void v26[4] = a1;
    v26[5] = v39;
    v26[6] = &v27;
    v26[7] = &v32;
    v26[8] = v42;
    v26[9] = &v44;
    v26[10] = v40;
    long long v25 = *v8;
    id v15 = v14;
    v24 = v26;
    *(void *)&long long v65 = 0;
    *((void *)&v65 + 1) = &v65;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__5;
    v68 = __Block_byref_object_dispose__5;
    id v69 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&long long v59 = 3221225472;
    *((void *)&v59 + 1) = __GetDataForKey_block_invoke;
    v60 = &unk_1E53D9C40;
    id v16 = v15;
    id v61 = v16;
    v63 = &v65;
    long long v64 = v25;
    uint64_t v17 = v24;
    id v62 = v17;
    [v16 statementForKey:@"GetDataForKey" statementBlock:buf];

    _Block_object_dispose(&v65, 8);
    if (*((unsigned char *)v28 + 24))
    {
      uint64_t v18 = GEOGetTileDBLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 68157955;
        *(_DWORD *)&uint8_t buf[4] = 8;
        LOWORD(v59) = 2097;
        *(void *)((char *)&v59 + 2) = &v48;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Key %{private,geo:TileKey}.*P references nonexistent external file", buf, 0x12u);
      }

      [(id)a1 _deleteDataOnDBQueueForKey:v48];
    }
    _Block_object_dispose(&v27, 8);
    uint64_t v8 = v48;
  }
  long long v65 = *v8;
  *(void *)long long buf = 0;
  *(void *)&long long v59 = buf;
  *((void *)&v59 + 1) = 0x2020000000;
  LOBYTE(v60) = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke_547;
  block[3] = &unk_1E53D8DC8;
  v51 = buf;
  id v19 = v11;
  long long v57 = v65;
  id v50 = v19;
  v52 = &v32;
  v53 = &v44;
  v54 = v42;
  v55 = v40;
  v56 = v39;
  dispatch_sync(v10, block);
  if (a4 <= 4 && ((1 << a4) & 0x13) != 0)
  {
    char v20 = [_GEOTileDBUpdateAccessTimeOperation alloc];
    v21 = [(_GEOTileDBUpdateAccessTimeOperation *)v20 initWithTileKey:v48 timestamp:CFAbsoluteTimeGetCurrent()];
    [*(id *)(a1 + 16) addOperation:v21];
  }
  BOOL v22 = *(unsigned char *)(v59 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  return v22;
}

uint64_t __52__GEOTileDB__setLastAccessTimeOnDBQueue_forDataRow___block_invoke(void *a1, sqlite3_stmt *a2)
{
  if (![*(id *)(a1[4] + 8) bindInt64Parameter:"@data_pk" toValue:a1[7] inStatement:a2 error:0]|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  int v4 = sqlite3_column_type(a2, 0);
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (v4 == 5)
  {
    *(unsigned char *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    uint64_t v6 = 1;
    *(unsigned char *)(v5 + 24) = 1;
    *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 8) int64ForColumn:0 inStatment:a2];
  }
  return v6;
}

uint64_t __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke(uint64_t a1, unsigned int a2, unint64_t a3, void *a4, void *a5, void *a6, char a7, char a8)
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFAbsoluteTimeGetCurrent()
                                                                      + *MEMORY[0x1E4F1CF78]
                                                                      - (double)a3;
  if (v16)
  {
    char v32 = a7;
    unsigned int v33 = a2;
    char v18 = a8;
    id v19 = *(void **)(*(void *)(a1 + 32) + 136);
    char v20 = [v16 UUIDString];
    v21 = [v19 URLByAppendingPathComponent:v20];

    BOOL v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v23 = [v21 path];
    int v24 = [v22 fileExistsAtPath:v23];

    if (!v24)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

      goto LABEL_11;
    }
    long long v25 = [[GEOTileData alloc] initWithFileURL:v21];
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
    a8 = v18;
    a7 = v32;
    a2 = v33;
  }
  else
  {
    if (v15)
    {
      id v28 = v15;
    }
    else
    {
      id v28 = [MEMORY[0x1E4F1C9B8] data];
    }
    v21 = v28;
    uint64_t v29 = [[GEOTileData alloc] initWithData:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v27 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a6);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a8;
  if ([*(id *)(a1 + 32) _isTileSetTTLExpired:a2 age:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)])*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0; {
LABEL_11:
  }

  return 0;
}

- (BOOL)_isTileSetTTLExpired:(id)a3 age:(double)a4
{
  geo_assert_not_isolated();
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  geo_isolate_sync_data();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __48__GEOTileDB__setLastAccessTimeOnDBQueue_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __35__GEOTileDB__performInTransaction___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)_performInTransaction:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__GEOTileDB__performInTransaction___block_invoke;
  v7[3] = &unk_1E53D8B70;
  id v8 = v4;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeInTransaction:v7];
}

void __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v34 = 0;
  id v4 = [v2 _fetchSubscriptionsWithIdentifiers:v3 error:&v34];
  id v5 = v34;
  if (v4)
  {
    if ([v4 count])
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      int v7 = *(void **)(*(void *)(a1 + 32) + 8);
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_4;
      v26[3] = &unk_1E53D96A8;
      id v9 = v6;
      id v27 = v9;
      GetSubscriptionsForSyncToPairedDevice(v7, v8, v26);

      long long v10 = *(void **)(a1 + 56);
      if (v10)
      {
        id v11 = *(void **)(*(void *)(a1 + 32) + 8);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_5;
        v24[3] = &unk_1E53D96A8;
        id v25 = v9;
        GetSubscriptionsForSyncToPairedDevice(v11, v10, v24);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_6;
      v22[3] = &unk_1E53D96D0;
      id v23 = v9;
      id v12 = v9;
      uint64_t v13 = objc_msgSend(v4, "_geo_filtered:", v22);
      uint64_t v14 = *(NSObject **)(a1 + 48);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_7;
      v19[3] = &unk_1E53D7C50;
      id v15 = *(id *)(a1 + 64);
      id v20 = v13;
      id v21 = v15;
      id v16 = v13;
      dispatch_async(v14, v19);
    }
    else
    {
      char v18 = *(NSObject **)(a1 + 48);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_3;
      v28[3] = &unk_1E53D7C50;
      id v30 = *(id *)(a1 + 64);
      id v29 = v4;
      dispatch_async(v18, v28);

      id v12 = v30;
    }
  }
  else
  {
    id v17 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_2;
    block[3] = &unk_1E53D7C50;
    id v33 = *(id *)(a1 + 64);
    id v32 = v5;
    dispatch_async(v17, block);

    id v12 = v33;
  }
}

void __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__5;
  uint64_t v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __CalculateTotalOfflineDataSize_block_invoke;
  v14[3] = &unk_1E53D9BA0;
  id v16 = &v18;
  id v3 = v2;
  id v15 = v3;
  id v17 = &v22;
  [v3 statementForKey:@"CalculateTotalOfflineDataSize" statementBlock:v14];
  id v4 = (void *)v23[5];
  if (v4) {
    id v5 = v4;
  }
  uint64_t v6 = v19[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  id v7 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_2;
  v10[3] = &unk_1E53D9978;
  id v8 = *(NSObject **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = v6;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

uint64_t __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 toSyncToPairedDevice:(id)a4 queue:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke;
  v22[3] = &unk_1E53D96F8;
  void v22[4] = self;
  id v23 = v10;
  id v24 = v12;
  id v25 = v11;
  id v26 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_8;
  v19[3] = &unk_1E53D8C88;
  id v20 = v24;
  id v21 = v26;
  id v15 = v26;
  id v16 = v24;
  id v17 = v11;
  id v18 = v10;
  [(GEOSQLiteDB *)db executeAsync:v22 errorHandler:v19];
}

- (void)fetchAllSubscriptionsToSyncToPairedDevice:(id)a3 queue:(id)a4 callback:(id)a5
{
}

- (void)fetchExpiredSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    db = self->_db;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke;
    v16[3] = &unk_1E53D94C8;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v11;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3;
    v13[3] = &unk_1E53D8C88;
    id v14 = v18;
    id v15 = v19;
    [(GEOSQLiteDB *)db executeAsync:v16 errorHandler:v13];
  }
}

- (void)calculateSizeOfAllOfflineDataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke;
  v14[3] = &unk_1E53D7F70;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_3;
  v11[3] = &unk_1E53D8C88;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(GEOSQLiteDB *)db executeAsync:v14 errorHandler:v11];
}

- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    db = self->_db;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke;
    v16[3] = &unk_1E53D94C8;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v11;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3;
    v13[3] = &unk_1E53D8C88;
    id v14 = v18;
    id v15 = v19;
    [(GEOSQLiteDB *)db executeAsync:v16 errorHandler:v13];
  }
}

- (void)_performOnDBQueue:(id)a3
{
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  id v4 = [v2 _fetchExpiredSubscriptionsWithIdentifiers:v3 error:&v14];
  id v5 = v14;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2;
  v10[3] = &unk_1E53D95B8;
  id v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v12 = v5;
  id v13 = v7;
  id v11 = v4;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (id)_fetchExpiredSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = GEOGetTileDBLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Fetching expired subscriptions matching identifiers: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F1CA48] array];
  db = self->_db;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __61__GEOTileDB__fetchExpiredSubscriptionsWithIdentifiers_error___block_invoke;
  id v25 = &unk_1E53D9608;
  id v11 = v6;
  id v26 = v11;
  id v12 = v9;
  id v27 = v12;
  id v13 = db;
  id v14 = &v22;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__5;
  id v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v35 = __FetchExpiredSubscriptions_block_invoke;
  v36 = &unk_1E53D7C78;
  id v15 = v13;
  id v37 = v15;
  id v16 = v14;
  char v38 = v16;
  v39 = &v28;
  BOOL v17 = [(GEOSQLiteDB *)v15 statementForKey:@"FetchExpiredSubscriptions", &buf, v22, v23, v24, v25 statementBlock];
  if (a4)
  {
    id v18 = (void *)v29[5];
    if (v18) {
      *a4 = v18;
    }
  }

  _Block_object_dispose(&v28, 8);
  if (v17) {
    id v19 = v12;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  return v20;
}

uint64_t __38__GEOTileDB_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _allTileDataSize];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)calculateFreeableSizeSync
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__GEOTileDB_calculateFreeableSizeSync__block_invoke;
  v5[3] = &unk_1E53D89C0;
  v5[4] = self;
  v5[5] = &v6;
  [(GEOSQLiteDB *)db executeSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_allTileDataSize
{
  if (self->_tileDataSizeIsValid) {
    return self->_tileDataSize;
  }
  id v4 = self->_db;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__5;
  v15[4] = __Block_byref_object_dispose__5;
  id v16 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CalculateTotalTileDataSize_block_invoke;
  v7[3] = &unk_1E53D9BA0;
  uint64_t v9 = &v11;
  id v5 = v4;
  uint64_t v8 = v5;
  id v10 = v15;
  [(GEOSQLiteDB *)v5 statementForKey:@"CalculateTotalTileDataSize" statementBlock:v7];
  unint64_t v3 = v12[3];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  self->_tileDataSize = v3;
  self->_tileDataSizeIsValid = 1;
  return v3;
}

- (GEOTileDB)init
{
  uint64_t result = (GEOTileDB *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4
{
  return [(GEOTileDB *)self initWithDBDirectory:a3 externalFilesDirectory:a4 manifestManager:0 countryConfiguration:0 offlineDataConfiguration:0 locale:0 maximumDatabaseSize:524288000];
}

- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4 manifestManager:(id)a5 countryConfiguration:(id)a6 offlineDataConfiguration:(id)a7 locale:(id)a8 maximumDatabaseSize:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v56 = a8;
  v60.receiver = self;
  v60.super_class = (Class)GEOTileDB;
  id v20 = [(GEOTileDB *)&v60 init];
  if (!v20)
  {
LABEL_18:
    v54 = 0;
    goto LABEL_19;
  }
  uint64_t v21 = geo_isolater_create();
  infrequentlyChangingMetadataIsolater = v20->_infrequentlyChangingMetadataIsolater;
  v20->_infrequentlyChangingMetadataIsolater = (geo_isolater *)v21;

  uint64_t v23 = geo_isolater_create();
  createdExternalDataDirectoryIsolater = v20->_createdExternalDataDirectoryIsolater;
  v20->_createdExternalDataDirectoryIsolater = (geo_isolater *)v23;

  if (v17)
  {
    id v25 = (GEOResourceManifestManager *)v17;
  }
  else
  {
    id v25 = +[GEOResourceManifestManager modernManager];
  }
  manifestManager = v20->_manifestManager;
  v20->_manifestManager = v25;

  if (v18)
  {
    id v27 = (GEOCountryConfiguration *)v18;
  }
  else
  {
    id v27 = +[GEOCountryConfiguration sharedConfiguration];
  }
  countryConfiguration = v20->_countryConfiguration;
  v20->_countryConfiguration = v27;

  if (v19)
  {
    id v29 = (GEOOfflineDataConfiguration *)v19;
  }
  else
  {
    id v29 = +[GEOOfflineDataConfiguration sharedConfiguration];
  }
  offlineDataConfiguration = v20->_offlineDataConfiguration;
  v20->_offlineDataConfiguration = v29;

  objc_storeStrong((id *)&v20->_overrideLocale, a8);
  id v31 = [GEOObserverHashTable alloc];
  global_queue = (void *)geo_get_global_queue();
  uint64_t v33 = [(GEOObserverHashTable *)v31 initWithProtocol:&unk_1ED74D1A8 queue:global_queue];
  observers = v20->_observers;
  v20->_observers = (GEOObserverHashTable *)v33;

  v20->_maxDatabaseSize = a9;
  if (GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1E9114108) < 1801) {
    double Uint64 = 1800.0;
  }
  else {
    double Uint64 = (double)GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1E9114108);
  }
  v20->_timestampDeltaWriteThreshold = Uint64;
  v36 = [[_GEOTileDBWriteQueue alloc] initWithDB:v20 maxOperations:8 maxOperationsSizeInBytes:0x40000];
  writeQueue = v20->_writeQueue;
  v20->_writeQueue = v36;

  uint64_t v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
  dbDirectory = v20->_dbDirectory;
  v20->_dbDirectory = (NSURL *)v38;

  uint64_t v40 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
  externalDataDirectory = v20->_externalDataDirectory;
  v20->_externalDataDirectory = (NSURL *)v40;

  if ([(NSURL *)v20->_dbDirectory isEqual:v20->_externalDataDirectory])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: ![_dbDirectory isEqual:_externalDataDirectory]", (uint8_t *)location, 2u);
    }
    goto LABEL_18;
  }
  v42 = [(NSURL *)v20->_dbDirectory URLByAppendingPathComponent:@"MapTiles.sqlitedb"];
  uint64_t v43 = [(GEOTileDB *)v20 _setupDB:v42];
  db = v20->_db;
  v20->_db = (GEOSQLiteDB *)v43;

  objc_initWeak(location, v20);
  v45 = [(GEOSQLiteDB *)v20->_db isolationQueue];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __145__GEOTileDB_initWithDBDirectory_externalFilesDirectory_manifestManager_countryConfiguration_offlineDataConfiguration_locale_maximumDatabaseSize___block_invoke;
  v57[3] = &unk_1E53D8A60;
  objc_copyWeak(&v58, location);
  uint64_t v46 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1E9114108, v45, v57);
  id timestampDeltaWriteThresholdConfigListener = v20->_timestampDeltaWriteThresholdConfigListener;
  v20->_id timestampDeltaWriteThresholdConfigListener = (id)v46;

  v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v48 addObserver:v20 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];

  v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:v20 selector:sel__deviceLocked_ name:@"GEODeviceLockingNotification" object:0];

  id v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v50 addObserver:v20 selector:sel__countryChanged_ name:@"GEOCountryConfigurationCountryCodeDidChangeNotification" object:0];

  v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v51 addObserver:v20 selector:sel__editionUpdate_ name:@"GEOTileEditionUpdateNotification" object:0];

  v52 = v20->_offlineDataConfiguration;
  v53 = [(GEOSQLiteDB *)v20->_db isolationQueue];
  [(GEOOfflineDataConfiguration *)v52 registerObserver:v20 queue:v53];

  v54 = v20;
  objc_destroyWeak(&v58);
  objc_destroyWeak(location);

LABEL_19:
  return v54;
}

void __145__GEOTileDB_initWithDBDirectory_externalFilesDirectory_manifestManager_countryConfiguration_offlineDataConfiguration_locale_maximumDatabaseSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1E9114108) < 1801) {
      double Uint64 = 1800.0;
    }
    else {
      double Uint64 = (double)GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1E9114108);
    }
    id WeakRetained = v3;
    *((double *)v3 + 21) = Uint64;
  }
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener(self->_timestampDeltaWriteThresholdConfigListener);
  GEOConfigRemoveBlockListener(self->_tileElevationConfigListener);
  expirationRecords = self->_expirationRecords;
  if (expirationRecords)
  {
    free(expirationRecords);
    self->_expirationRecords = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOTileDB;
  [(GEOTileDB *)&v4 dealloc];
}

- (void)tearDown
{
  db = self->_db;
  if (db)
  {
    objc_super v4 = [(GEOSQLiteDB *)db isolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__GEOTileDB_tearDown__block_invoke;
    block[3] = &unk_1E53D79D8;
    void block[4] = self;
    dispatch_sync(v4, block);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration unregisterObserver:self];
}

void __21__GEOTileDB_tearDown__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

+ (void)migrateDBFrom:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
  if (_ensureURLExistsAndIsDirectory(v6))
  {
    id v7 = [v9 stringByAppendingPathComponent:@"MapTiles.sqlitedb"];
    uint64_t v8 = [v5 stringByAppendingPathComponent:@"MapTiles.sqlitedb"];
    +[GEOSQLiteDB migrateAllDBFilesFrom:v7 to:v8];
  }
}

+ (void)migrateFilesFrom:(id)a3 to:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4 isDirectory:1];
  if (_ensureURLExistsAndIsDirectory(v38))
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = *MEMORY[0x1E4F1C628];
    v57[0] = *MEMORY[0x1E4F1C628];
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    id v49 = 0;
    id v10 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v9 options:23 error:&v49];
    uint64_t v11 = v49;

    if (v11)
    {
      id v12 = GEOGetTileDBLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v51 = v11;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Unable to enumerate external resources for migration: %@", buf, 0xCu);
      }
      goto LABEL_34;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = v10;
    uint64_t v39 = [v13 countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (!v39)
    {

      uint64_t v11 = 0;
      goto LABEL_29;
    }
    uint64_t v33 = v10;
    id v34 = v6;
    v35 = v5;
    uint64_t v11 = 0;
    uint64_t v14 = *(void *)v46;
    char v37 = 1;
    uint64_t v36 = *(void *)v46;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(v13);
      }
      id v16 = *(NSObject **)(*((void *)&v45 + 1) + 8 * v15);
      id v43 = 0;
      id v44 = 0;
      int v17 = [v16 getResourceValue:&v44 forKey:v8 error:&v43];
      id v18 = v44;
      id v19 = v43;

      if (!v17)
      {
        uint64_t v11 = v19;
        goto LABEL_22;
      }
      if (![v18 BOOLValue]) {
        break;
      }
      v42 = v19;
      char v20 = [v7 removeItemAtURL:v16 error:&v42];
      uint64_t v11 = v42;

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = GEOGetTileDBLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          v51 = v16;
          __int16 v52 = 2112;
          v53 = v11;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Unable to remove directory at \"%@\": %@", buf, 0x16u);
        }
        char v37 = 0;
LABEL_21:
      }
LABEL_22:

      if (v39 == ++v15)
      {
        uint64_t v28 = [v13 countByEnumeratingWithState:&v45 objects:v56 count:16];
        uint64_t v39 = v28;
        if (!v28)
        {

          uint64_t v6 = v34;
          id v5 = v35;
          id v10 = v33;
          if ((v37 & 1) == 0)
          {
LABEL_35:

            goto LABEL_36;
          }
LABEL_29:
          id v29 = v7;
          uint64_t v30 = v11;
          uint64_t v40 = v11;
          id v31 = v29;
          char v32 = [v29 removeItemAtPath:v5 error:&v40];
          uint64_t v11 = v40;

          if (v32)
          {
            id v7 = v31;
            goto LABEL_35;
          }
          id v12 = GEOGetTileDBLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            v51 = v5;
            __int16 v52 = 2112;
            v53 = v11;
            _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Unable to clean up old directory \"%@\": %@", buf, 0x16u);
          }
          id v7 = v31;
LABEL_34:

          goto LABEL_35;
        }
        goto LABEL_7;
      }
    }
    id v22 = v13;
    uint64_t v23 = v8;
    id v24 = [v16 relativePath];
    uint64_t v21 = [v38 URLByAppendingPathComponent:v24];

    v41 = v19;
    id v25 = v7;
    char v26 = [v7 moveItemAtURL:v16 toURL:v21 error:&v41];
    uint64_t v11 = v41;

    if ((v26 & 1) == 0)
    {
      id v27 = GEOGetTileDBLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        v51 = v16;
        __int16 v52 = 2112;
        v53 = v21;
        __int16 v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Unable to move file from \"%@\" to \"%@\": %@", buf, 0x20u);
      }

      char v37 = 0;
    }
    id v7 = v25;
    uint64_t v8 = v23;
    id v13 = v22;
    uint64_t v14 = v36;
    goto LABEL_21;
  }
LABEL_36:
}

- (id)_setupDB:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOSQLiteDB defaultPragmas];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = defaultPragmas();
  [v6 addEntriesFromDictionary:v7];

  objc_initWeak(&location, self);
  uint64_t v8 = [GEOSQLiteDB alloc];
  id v9 = GEOGetTileDBLog();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __22__GEOTileDB__setupDB___block_invoke;
  v14[3] = &unk_1E53D8A88;
  objc_copyWeak(&v15, &location);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __22__GEOTileDB__setupDB___block_invoke_2;
  v12[3] = &unk_1E53D7918;
  objc_copyWeak(&v13, &location);
  id v10 = [(GEOSQLiteDB *)v8 initWithQueueName:"com.apple.geo.TileDB" log:v9 databaseFileURL:v4 sqliteFlags:3145728 pragmas:v6 setupBlock:v14 tearDownBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);

  return v10;
}

uint64_t __22__GEOTileDB__setupDB___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _setup:v3];

  return v5;
}

void __22__GEOTileDB__setupDB___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _flushPendingWrites];
}

- (BOOL)_setup:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _GEOCreateTransaction();
  [v4 setTemporaryStoreMode:1];
  if (objc_msgSend(v4, "user_version") == 73) {
    goto LABEL_15;
  }
  uint64_t v6 = GEOGetTileDBLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = objc_msgSend(v4, "user_version");
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 73;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Database schema version changed (%llu => %i). Attempting to migrate if possible.", buf, 0x12u);
  }

  uint64_t v7 = objc_msgSend(v4, "user_version");
  id v8 = v4;
  id v9 = v8;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  LOBYTE(v77) = 0;
  if (v7 > 73)
  {
LABEL_5:
    _Block_object_dispose(&v74, 8);

LABEL_6:
    id v10 = GEOGetTileDBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "Unable to migrate. Dropping all tables and starting fresh.", buf, 2u);
    }

    if (![v9 dropAllTables]) {
      goto LABEL_29;
    }
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v83) = 0;
    v71[1] = (id)MEMORY[0x1E4F143A8];
    v71[2] = (id)3221225472;
    v71[3] = __20__GEOTileDB__setup___block_invoke;
    v71[4] = &unk_1E53D8AB0;
    v71[5] = self;
    v73 = buf;
    id v72 = v9;
    geo_isolate_sync();
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [(GEOObserverHashTable *)self->_observers tileDBDidDeleteExternalResource:self];
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  if (v7 == 73)
  {
    _Block_object_dispose(&v74, 8);

LABEL_15:
    int v11 = 0;
    goto LABEL_16;
  }
  unint64_t v53 = 0;
  uint64_t v54 = v7;
  do
  {
    ++v54;
    if (v53 <= 3) {
      uint64_t v55 = 3;
    }
    else {
      uint64_t v55 = v53;
    }
    uint64_t v56 = v55 + 1;
    while (migrateToSchemaVersion_availableMigratorVersions[v53] != v54)
    {
      if (v56 == ++v53) {
        goto LABEL_5;
      }
    }
  }
  while (v54 != 73);
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&buf[16] = __migrateToSchemaVersion_block_invoke;
  v83 = &unk_1E53D9B58;
  v86 = (uint64_t *)v7;
  uint64_t v87 = 73;
  long long v57 = (GEOSQLiteDB *)v8;
  v88 = self;
  v84 = v57;
  v85 = &v74;
  BOOL v58 = [(GEOSQLiteDB *)v57 executeInTransaction:buf];
  BOOL v59 = v58;
  if (v58) {
    int v11 = *((unsigned __int8 *)v75 + 24);
  }
  else {
    int v11 = 0;
  }

  _Block_object_dispose(&v74, 8);
  if (!v59) {
    goto LABEL_6;
  }
LABEL_16:
  objc_msgSend(v4, "setUser_version:", 73);
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [(NSURL *)self->_externalDataDirectory path];
  char v14 = [v12 fileExistsAtPath:v13];

  if ((v14 & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    externalDataDirectory = self->_externalDataDirectory;
    uint64_t v80 = *MEMORY[0x1E4F28370];
    uint64_t v81 = *MEMORY[0x1E4F28358];
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v71[0] = 0;
    char v18 = [v15 createDirectoryAtURL:externalDataDirectory withIntermediateDirectories:1 attributes:v17 error:v71];
    id v19 = v71[0];

    if ((v18 & 1) == 0)
    {
      char v20 = GEOGetTileDBLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Failed to create external resources directory: %{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v21 = GEOGetTileDBLog();
  id v22 = v4;
  id v23 = v21;
  function_uint64_t v2 = sqlite3_create_function_v2((sqlite3 *)[v22 sqliteDB], "insideRadius", 6, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_insideRadius_sqlite, 0, 0, 0);
  if (function_v2)
  {
    id v25 = v23;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_202;
    }
    goto LABEL_27;
  }
  function_uint64_t v2 = sqlite3_create_function_v2((sqlite3 *)[v22 sqliteDB], "coordinatesMatch", 5, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_coordinatesMatch_sqlite, 0, 0, 0);
  if (function_v2)
  {
    id v25 = v23;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
LABEL_202:
      objc_super v60 = sqlite3_errmsg((sqlite3 *)[v22 sqliteDB]);
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = function_v2;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = v60;
      _os_log_fault_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, "create fn failed %d %{public}s", buf, 0x12u);
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (!objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS device_posture(   row INT PRIMARY KEY NOT NULL,    locale TEXT,    country TEXT,    region TEXT   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS edition(   tileset INT NOT NULL,    edition INT NOT NULL,    UNIQUE(tileset)   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS external_data_pending_deletion(   ext_uuid BLOB NOT NULL   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS global_offline_metadata(   row INT PRIMARY KEY NOT NULL,    regulatory_region_id INT NOT NULL,    UNIQUE(regulatory_region_id)   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS data(   rowid INTEGER PRIMARY KEY NOT NULL,    data BLOB,    ext_uuid BLOB,    size INT NOT NULL,    etag TEXT   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS data_ext_uuid_idx ON data (ext_uuid) WHERE ext_uuid IS NOT NULL;"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS tiles(   key_a INT NOT NULL,    key_b INT NOT NULL,    key_c INT NOT NULL,    key_d INT NOT NULL,    tileset INT NOT NULL,    is_current INT NOT NULL,    insert_timestamp INT NOT NULL,    insert_reason INT NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(key_a, key_b, key_c, key_d)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS tiles_tileset_idx ON tiles (tileset);"]
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS tiles_data_pk_idx ON tiles (data_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data(   rowid INTEGER PRIMARY KEY NOT NULL,    layer INT NOT NULL,    key BLOB NOT NULL,    version INT NOT NULL,    insert_timestamp INT NOT NULL,    ext_uuid BLOB,    UNIQUE(layer, key, version)   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data_batches(   rowid INTEGER PRIMARY KEY NOT NULL,    layer INT NOT NULL,    key BLOB NOT NULL,    version INT NOT NULL,    etag TEXT,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(layer, key, version)   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS offline_data_batches_data_pk_idx ON offline_data_batches (data_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data_batch_refs(   batch_pk INT NOT NULL,    offline_data_pk INT NOT NULL,    offset INT NOT NULL,    size INT NOT NULL,    layer INT NOT NULL,    version INT NOT NULL,    UNIQUE(batch_pk, offline_data_pk)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS offline_data_batch_refs_batch_pk_idx ON offline_data_batch_refs (batch_pk);"]
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS offline_data_batch_refs_offline_data_pk_idx ON offline_data_batch_refs (offline_data_pk);"]
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS offline_data_batch_refs_layer_idx ON offline_data_batch_refs (layer);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS access_times(   data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    timestamp INT   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS access_times_data_pk_idx ON access_times (data_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS failed_tiles(   rowid INTEGER PRIMARY KEY NOT NULL,    key_a INT NOT NULL,    key_b INT NOT NULL,    key_c INT NOT NULL,    key_d INT NOT NULL,    tileset INT NOT NULL,    wants_proactive_load INT NOT NULL,    timestamp INT,    UNIQUE(key_a, key_b, key_c, key_d)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS failed_tiles_tileset_idx ON failed_tiles (tileset);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscriptions(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier TEXT NOT NULL,    originating_bundle_id TEXT,    data_types INT NOT NULL,    policy INT NOT NULL,    expiration_timestamp INT,    map_region BLOB NOT NULL,    display_name TEXT,    insert_timestamp INT NOT NULL,    UNIQUE(identifier)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS expired_subscriptions(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier TEXT NOT NULL,    originating_bundle_id TEXT,    data_types INT NOT NULL,    policy INT NOT NULL,    map_region BLOB NOT NULL,    display_name TEXT,    regulatory_region_id INT,    UNIQUE(identifier)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_data_refs(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(subscription_pk, data_pk)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS subscription_data_refs_subscription_pk_idx ON subscription_data_refs (subscription_pk);"]
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS subscription_data_refs_data_pk_idx ON subscription_data_refs (data_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS paired_device_subscription_sync(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    device_id BLOB NOT NULL,    should_sync INT,    UNIQUE(subscription_pk, device_id)    ON CONFLICT IGNORE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS paired_device_subscription_sync_subscription_pk_idx ON paired_device_subscription_sync (subscription_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_data_state(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    data_type INT NOT NULL,    data_subtype INT NOT NULL,    version INT NOT NULL,    complete INT NOT NULL,    data_count INT NOT NULL,    data_size INT NOT NULL,    UNIQUE(subscription_pk, data_type, data_subtype, version)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS subscription_data_state_subscription_pk_idx ON subscription_data_state (subscription_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_download_state(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    download_state INT NOT NULL,    UNIQUE(subscription_pk)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS subscription_download_state_subscription_pk_idx ON subscription_download_state (subscription_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_access_times(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    timestamp INT,    UNIQUE(subscription_pk)    ON CONFLICT REPLACE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS subscription_access_times_subscription_pk_idx ON subscription_access_times (subscription_pk);"]
    || !objc_msgSend(v22, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
                        0)
    || ![v22 createIndex:"CREATE INDEX IF NOT EXISTS shiftresponse_data_pk_idx ON shiftresponse (data_pk);"]
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT locale, country, region    FROM device_posture    WHERE row = 0    LIMIT 1;",
                        @"ReadDevicePosture")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO device_posture    (row, locale, country, region)    VALUES (0, @locale, @country, @region);",
                        @"SetDevicePosture")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT tileset, edition    FROM edition;",
                        @"ReadEditions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO edition    (tileset, edition)    VALUES (@tileset, @edition);",
                        @"SetEdition")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM external_data_pending_deletion;",
                        @"GetAllExternalDataPendingDeletion")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    (ext_uuid)    VALUES (@ext_uuid);",
                        @"MarkExternalDataForDeletion")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid = @ext_uuid;",
                        @"ClearExternalDataPendingDeletion")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion;",
                        @"ClearAllExternalDataPendingDeletion")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT regulatory_region_id    FROM global_offline_metadata    WHERE row = 0    LIMIT 1;",
                        @"ReadGlobalOfflineMetadata")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO global_offline_metadata    (row, regulatory_region_id)    VALUES (0, @regulatory_region_id);",
                        @"SetGlobalOfflineMetadata")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO data    (data, ext_uuid, size, etag)    VALUES (@data, @ext_uuid, @size, @etag);",
                        @"InsertData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE rowid == @rowid;",
                        @"DeleteData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE ext_uuid IS NOT NULL;",
                        @"EnumerateExternalResources")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO tiles    (key_a, key_b, key_c, key_d, tileset, is_current, insert_timestamp, insert_reason, data_pk)    VALUES (@key_a, @key_b, @key_c, @key_d, @tileset, 1, @insert_timestamp, @insert_reason, @data_pk);",
                        @"InsertTile")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data_pk    FROM tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        @"LookupTileRowForKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 1, insert_timestamp = @insert_timestamp, insert_reason = @insert_reason    WHERE data_pk = @data_pk;",
                        @"MarkCurrent")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 0;",
                        @"InvalidateAllData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 0    WHERE tileset = @tileset;",
                        @"InvalidateTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data    (layer, key, version, insert_timestamp, ext_uuid)    VALUES (@layer, @key, @version, @insert_timestamp, NULL);",
                        @"InsertOfflineData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE offline_data    SET ext_uuid = @ext_uuid    WHERE rowid = @rowid;",
                        @"SetOfflineDataExtUUID")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, ext_uuid    FROM offline_data    WHERE layer == @layer AND version == @version AND key == @key;",
                        @"GetDataForOfflineKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT offline_data.rowid, offline_data.ext_uuid    FROM offline_data INNER JOIN offline_data_batch_refs ON offline_data_batch_refs.offline_data_pk = offline_data.rowid INNER JOIN offline_data_batches ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN subscription_data_refs ON subscription_data_refs.data_pk = offline_data_batches.data_pk INNER JOIN subscription_data_state ON subscription_data_refs.subscription_pk = subscription_data_state.subscription_pk    WHERE offline_data.layer == @offline_data_layer AND offline_data.version == @offline_data_version AND offline_data.key == @offline_data_key AND subscription_data_state.data_type = 1024 AND subscription_data_state.data_subtype = offline_data.layer AND subscription_data_state.version = offline_data.version AND subscription_data_state.complete = 1    LIMIT 1;",
                        @"GetDataForOfflineKeyInFullyLoadedSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid    FROM offline_data    WHERE layer == @layer AND version == @version AND key == @key;",
                        @"GetOfflineDataPKForKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM offline_data    WHERE ext_uuid IS NOT NULL;",
                        @"EnumerateOfflineDataExternalResources")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data_batches    (layer, key, version, etag, data_pk)    VALUES (@layer, @key, @version, @etag, @data_pk);",
                        @"InsertOfflineDataBatch")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, etag, data_pk    FROM offline_data_batches    WHERE layer == @layer AND version == @version AND key == @key;",
                        @"CheckExistenceOfOfflineBatchKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data_batches    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        @"DeleteOfflineDataBatchNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT DISTINCT version    FROM offline_data_batches    WHERE layer = @layer;",
                        @"GetAllOfflineDataBatchVersionsForLayer")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data_batch_refs    (batch_pk, offline_data_pk, offset, size, layer, version)    VALUES (@batch_pk, @offline_data_pk, @offset, @size, @layer, @version);",
                        @"InsertOfflineDataBatchReference")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data.rowid, data.data, data.ext_uuid, data.size, offline_data_batch_refs.offset, offline_data_batch_refs.size    FROM offline_data_batches INNER JOIN offline_data_batch_refs ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN data ON offline_data_batches.data_pk = data.rowid    WHERE offline_data_batch_refs.offline_data_pk = @offline_data_batch_refs_offline_data_pk;",
                        @"GetBatchDataForOfflineDataPK")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO access_times    (data_pk, timestamp)    VALUES (@data_pk, @timestamp);",
                        @"AddAccessTime")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE access_times    SET timestamp = @timestamp    WHERE data_pk = @data_pk;",
                        @"UpdateAccessTime")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT timestamp    FROM access_times    WHERE data_pk = @data_pk;",
                        @"GetAccessTime")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO failed_tiles    (key_a, key_b, key_c, key_d, tileset, wants_proactive_load, timestamp)    VALUES (@key_a, @key_b, @key_c, @key_d, @tileset, @wants_proactive_load, @timestamp);",
                        @"InsertFailedTile")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        @"DeleteFailedTile")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE tileset == @tileset;",
                        @"DeleteFailedTilesForTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE timestamp < @timestamp;",
                        @"DeleteOldFailedTiles")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT wants_proactive_load, timestamp    FROM failed_tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        @"LookupFailureInfo")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT key_a, key_b, key_c, key_d, tileset    FROM failed_tiles    WHERE wants_proactive_load = 1 AND timestamp > @timestamp    ORDER BY timestamp DESC;",
                        @"GetFailedKeysForProactiveLoad")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid    FROM subscriptions    WHERE identifier == @identifier    LIMIT 1;",
                        @"GetSubscriptionPK")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_data_refs    (subscription_pk, data_pk)    VALUES (@subscription_pk, @data_pk);",
                        @"InsertSubscriptionDataRef")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions;",
                        @"FetchSubscriptions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions    WHERE identifier == @identifier;",
                        @"FetchSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions    WHERE rowid = @rowid;",
                        @"FetchSubscriptionForPK")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscriptions    (identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp)    VALUES (@identifier, @originating_bundle_id, @data_types, @policy, @expiration_timestamp, @map_region, @display_name, @insert_timestamp);",
                        @"InsertSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE subscriptions    SET expiration_timestamp = @expiration_timestamp, display_name = @display_name    WHERE rowid = @rowid;",
                        @"UpdateSubscriptionExpirationAndDisplayName")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE identifier == @identifier;",
                        @"RemoveSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE expiration_timestamp > 0 AND expiration_timestamp < @expiration_timestamp    RETURNING rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp;",
                        @"RemoveExpiredSubscriptions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE 0 != (data_types & @data_types)    RETURNING rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp;",
                        @"RemoveAllSubscriptionsForDataType")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO expired_subscriptions    (identifier, originating_bundle_id, data_types, policy, map_region, display_name, regulatory_region_id)    VALUES (@identifier, @originating_bundle_id, @data_types, @policy, @map_region, @display_name, @regulatory_region_id);",
                        @"InsertExpiredSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT identifier, originating_bundle_id, data_types, policy, map_region, display_name, regulatory_region_id    FROM expired_subscriptions;",
                        @"FetchExpiredSubscriptions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT rowid, data_types    FROM expired_subscriptions    WHERE identifier = @identifier;",
                        @"FetchExpiredSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM expired_subscriptions    WHERE rowid = @rowid;",
                        @"RemoveExpiredSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO paired_device_subscription_sync    (subscription_pk, device_id, should_sync)    VALUES (@subscription_pk, @device_id, @should_sync);",
                        @"SetSubscriptionShouldSyncToPairedDevice")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO paired_device_subscription_sync    (subscription_pk, device_id, should_sync)    VALUES (@subscription_pk, @device_id, @should_sync);",
                        @"SetSubscriptionShouldSyncToPairedDeviceNoOverwrite")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT subscriptions.identifier, paired_device_subscription_sync.should_sync    FROM paired_device_subscription_sync INNER JOIN subscriptions ON paired_device_subscription_sync.subscription_pk = subscriptions.rowid    WHERE paired_device_subscription_sync.device_id = @paired_device_subscription_sync_device_id;",
                        @"GetSubscriptionsForSyncToPairedDevice")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM paired_device_subscription_sync    WHERE device_id = @device_id;",
                        @"ClearSubscriptionsForSyncToPairedDevice")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_data_state    (subscription_pk, data_type, data_subtype, version, complete, data_count, data_size)    VALUES (@subscription_pk, @data_type, @data_subtype, @version, @complete, @data_count, @data_size);",
                        @"SetSubscriptionDataState")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM subscription_data_state    WHERE data_type = @data_type AND data_subtype = @data_subtype AND version != @versionA AND version != @versionB;",
                        @"ClearSubscriptionDataStatesNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data_type, data_subtype, version, complete, data_count, data_size    FROM subscription_data_state    WHERE subscription_pk == @subscription_pk;",
                        @"GetSubscriptionDataStates")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE subscription_data_state    SET complete = @complete    WHERE data_type = @data_type AND data_subtype = @data_subtype AND version = @version;",
                        @"BulkUpdateSubscriptionDataState")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "UPDATE subscription_data_state    SET complete = @complete    WHERE data_type = @data_type AND version = @version;",
                        @"BulkUpdateSubscriptionDataStateAllSubtypes")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_download_state    (subscription_pk, download_state)    VALUES (@subscription_pk, @download_state);",
                        @"SetSubscriptionDownloadState")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM subscription_download_state    WHERE subscription_pk = @subscription_pk;",
                        @"ClearSubscriptionDownloadState")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT download_state    FROM subscription_download_state    WHERE subscription_pk = @subscription_pk;",
                        @"GetSubscriptionDownloadState")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_access_times    (subscription_pk, timestamp)    VALUES (@subscription_pk, @timestamp);",
                        @"SetSubscriptionLastAccessTime")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size)    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid;",
                        @"CalculateTotalTileDataSize")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size)    FROM offline_data_batches INNER JOIN data ON offline_data_batches.data_pk == data.rowid;",
                        @"CalculateTotalOfflineDataSize")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT tiles.tileset, tiles.insert_timestamp, data.data, data.ext_uuid, data.etag, tiles.is_current, tiles.insert_reason    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        @"GetDataForKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT tiles.key_a, tiles.key_b, tiles.key_c, tiles.key_d, tiles.tileset, tiles.insert_timestamp, data.data, data.etag, tiles.is_current, tiles.insert_reason    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid;",
                        @"GetDataForAllKeys")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT tiles.data_pk, data.ext_uuid, data.size    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        @"LookupTileInfoForKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data.rowid, data.ext_uuid    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        @"LookupTileExternalDataUUIDForKey")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data.ext_uuid, data.size    FROM data INNER JOIN access_times ON access_times.data_pk == data.rowid INNER JOIN tiles on tiles.data_pk == data.rowid    ORDER BY tiles.is_current, access_times.timestamp, tiles.insert_timestamp ASC;",
                        @"EnumerateDataSizeFromOldest")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT tiles.key_a, tiles.key_b, tiles.key_c, tiles.key_d, tiles.tileset, data.size    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid INNER JOIN access_times ON access_times.data_pk == data.rowid    WHERE tiles.is_current = 0 AND access_times.timestamp > @access_times_timestamp    ORDER BY data.size DESC;",
                        @"GetRecentlyUsedStaleKeys")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT DISTINCT offline_data.key    FROM offline_data INNER JOIN offline_data_batch_refs ON offline_data.rowid = offline_data_batch_refs.offline_data_pk INNER JOIN offline_data_batches ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN subscription_data_refs ON offline_data_batches.data_pk == subscription_data_refs.data_pk INNER JOIN subscription_data_state ON subscription_data_state.subscription_pk == subscription_data_refs.subscription_pk    WHERE offline_data.layer = @offline_data_layer AND offline_data.version = @offline_data_version AND subscription_data_state.data_type = 1024 AND subscription_data_state.data_subtype = @offline_data_layer AND subscription_data_state.version = @offline_data_version AND subscription_data_state.complete = 1;",
                        @"GetAvailableOfflineKeys")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE tileset = @tileset   );",
                        @"DeleteTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE tileset = @tileset   ) AND ext_uuid IS NOT NULL;",
                        @"GetExternalResourcesForTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles   );",
                        @"DeleteAllTiles")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles   ) AND ext_uuid IS NOT NULL;",
                        @"GetAllTileExternalResources")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT access_times.data_pk                FROM access_times INNER JOIN tiles ON access_times.data_pk = tiles.data_pk                ORDER BY access_times.timestamp, tiles.insert_timestamp ASC                LIMIT @limit   );",
                        @"DeleteOldestNTiles")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp   );",
                        @"DeleteOldTileData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp   ) AND ext_uuid IS NOT NULL;",
                        @"GetOldTileExternalResources")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp AND tileset = @tileset   );",
                        @"DeleteOldDataForTileset")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp AND tileset = @tileset   ) AND ext_uuid IS NOT NULL;",
                        @"GetOldTileExternalResourcesForTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT DISTINCT subscription_data_refs.subscription_pk, tiles.tileset, tiles.is_current    FROM subscription_data_refs INNER JOIN tiles ON tiles.data_pk = subscription_data_refs.data_pk    WHERE subscription_data_refs.data_pk in(           SELECT access_times.data_pk                FROM access_times INNER JOIN tiles ON access_times.data_pk = tiles.data_pk                ORDER BY access_times.timestamp, tiles.insert_timestamp ASC                LIMIT @limit   );",
                        @"FindSubscriptionsReferencingOldestNTiles")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT DISTINCT subscription_data_refs.subscription_pk, tiles.tileset, tiles.is_current    FROM subscription_data_refs INNER JOIN tiles ON tiles.data_pk = subscription_data_refs.data_pk    WHERE tiles.insert_timestamp < @tiles_insert_timestamp;",
                        @"FindSubscriptionsReferencingOldTiles")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid IN(           SELECT ext_uuid                FROM data                WHERE ext_uuid IS NOT NULL   );",
                        @"UnmarkForDeletionExternalData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid IN(           SELECT ext_uuid                FROM offline_data                WHERE ext_uuid IS NOT NULL   );",
                        @"UnmarkForDeletionExternalOfflineData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM offline_data_batches                WHERE layer = @layer AND version != @versionA AND version != @versionB   );",
                        @"DeleteDataForOfflineBatchesNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data_batch_refs    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        @"DeleteOfflineDataBatchRefsNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        @"DeleteOfflineDataNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data_batch_refs    WHERE batch_pk IN(           SELECT offline_data_batches.rowid                FROM offline_data_batches LEFT JOIN subscription_data_refs ON offline_data_batches.data_pk = subscription_data_refs.data_pk                WHERE subscription_data_refs.subscription_pk IS NULL   );",
                        @"DeleteOfflineBatchRefsNotAssociatedWithSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data_batches    WHERE offline_data_batches.rowid IN(           SELECT offline_data_batches.rowid                FROM offline_data_batches LEFT JOIN subscription_data_refs ON offline_data_batches.data_pk = subscription_data_refs.data_pk                WHERE subscription_data_refs.subscription_pk IS NULL   );",
                        @"DeleteOfflineBatchesNotAssociatedWithSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM offline_data_batches   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        @"DeleteOfflineDataNotAssociatedWithSubscription")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM offline_data    WHERE offline_data.rowid NOT IN(           SELECT offline_data_pk                FROM offline_data_batch_refs   );",
                        @"DeleteOfflineDataNotAssociatedWithBatch")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO shiftresponse    (time, lat, lng, rad, data_pk)    VALUES (@time, @lat, @lng, @rad, @data_pk);",
                        @"AddShiftEntry")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data.rowid, data.data    FROM shiftresponse INNER JOIN data ON shiftresponse.data_pk == data.rowid    WHERE insideRadius(@shiftresponse_lat, @shiftresponse_lng, shiftresponse.lat, shiftresponse.lng, shiftresponse.rad, @less) != 0    ORDER BY time DESC    LIMIT 1;",
                        @"FindShiftEntry")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT data.rowid, data.data    FROM shiftresponse INNER JOIN data ON shiftresponse.data_pk == data.rowid    WHERE coordinatesMatch(@shiftresponse_lat, @shiftresponse_lng, shiftresponse.lat, shiftresponse.lng, @epsilon) != 0    ORDER BY time DESC    LIMIT 1;",
                        @"FindShiftEntryWithin")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                WHERE coordinatesMatch(@lat, @lng, lat, lng, 1e-8) != 0                ORDER BY time ASC                LIMIT 1   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        @"RemoveExactShiftEntry")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                WHERE time < @time   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        @"PruneCachedShiftEntriesByDate")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                ORDER BY time DESC                LIMIT -1                OFFSET @count   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        @"PruneCachedShiftEntriesByCount")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT time, lat, lng, rad    FROM shiftresponse    ORDER BY time DESC;",
                        @"ListAllShiftEntries")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT subscription_data_refs.subscription_pk, subscription_access_times.timestamp    FROM subscription_data_refs    LEFT JOIN subscription_access_times ON subscription_data_refs.subscription_pk = subscription_access_times.subscription_pk    WHERE subscription_data_refs.data_pk = @data_pk;",
                        @"FetchSubscriptionsReferencingData")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT subscriptions.rowid, subscriptions.identifier, subscriptions.data_types, subscriptions.expiration_timestamp, subscriptions.insert_timestamp, subscription_access_times.timestamp    FROM subscriptions    LEFT JOIN subscription_access_times ON subscriptions.rowid = subscription_access_times.subscription_pk;",
                        @"GetAllSubscriptionTimestamps")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.insert_timestamp < @insert_timestamp;",
                        @"CalculateOldDataSize")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.tileset = @tileset;",
                        @"CalculateSizeOfTileSet")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.tileset = @tileset AND tiles.insert_timestamp < @insert_timestamp;",
                        @"CalculateOldDataSizeForTileset")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1)    FROM data    INNER JOIN tiles ON tiles.data_pk = data.rowid    INNER JOIN subscription_data_refs ON data.rowid = subscription_data_refs.data_pk    WHERE subscription_data_refs.subscription_pk = @subscription_pk    AND tiles.tileset = @tileset    AND tiles.is_current = @is_current;",
                        @"GetSubscriptionSizeForTileset")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1)    FROM data    INNER JOIN offline_data_batches ON offline_data_batches.data_pk = data.rowid    INNER JOIN subscription_data_refs ON data.rowid = subscription_data_refs.data_pk    WHERE subscription_data_refs.subscription_pk = @subscription_pk    AND offline_data_batches.layer = @layer    AND offline_data_batches.version = @version;",
                        @"GetSubscriptionSizeForOfflineLayer")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM data WHERE data.rowid IN(   SELECT data_pk FROM offline_data_batches WHERE layer = @layer AND version != @versionA AND version != @versionB   ) AND ext_uuid IS NOT NULL;",
                        @"MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions")
    || !objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM offline_data    WHERE ext_uuid IS NOT NULL AND layer = @layer AND version != @versionA AND version != @versionB;",
                        @"MarkForDeletionExternalDataForOfflineDataNotMatchingVersions")
    || (objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM data WHERE ext_uuid IS NOT NULL AND data.rowid IN(   SELECT data_pk FROM offline_data_batches   ) AND data.rowid NOT IN(   SELECT data_pk FROM subscription_data_refs   );",
          @"MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription") & 1) == 0)
  {
    goto LABEL_28;
  }
  int v28 = objc_msgSend(v22, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM offline_data WHERE ext_uuid IS NOT NULL AND offline_data.rowid NOT IN(   SELECT offline_data_pk FROM offline_data_batch_refs   );",
          @"MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch");

  if (v28)
  {
    uint64_t v29 = 0;
    while (([v22 createIndex:off_1E53D8AD0[v29]] & 1) != 0)
    {
      if (++v29 == 3)
      {
        [v22 setTemporaryStoreMode:2];
        uint64_t v65 = 0;
        uint64_t v66 = &v65;
        uint64_t v67 = 0x3032000000;
        v68 = __Block_byref_object_copy__5;
        id v69 = __Block_byref_object_dispose__5;
        id v70 = 0;
        db = self->_db;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __20__GEOTileDB__setup___block_invoke_522;
        v64[3] = &unk_1E53D8B20;
        v64[4] = self;
        v64[5] = &v65;
        id v31 = db;
        char v32 = v64;
        uint64_t v74 = 0;
        v75 = &v74;
        uint64_t v76 = 0x3032000000;
        v77 = __Block_byref_object_copy__5;
        v78 = __Block_byref_object_dispose__5;
        id v79 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = __ReadDevicePosture_block_invoke;
        v83 = &unk_1E53D7C78;
        uint64_t v33 = v31;
        v84 = v33;
        id v34 = v32;
        v85 = v34;
        v86 = &v74;
        [(GEOSQLiteDB *)v33 statementForKey:@"ReadDevicePosture" statementBlock:buf];

        _Block_object_dispose(&v74, 8);
        v35 = (void *)v66[5];
        if (v35)
        {
          uint64_t v36 = _languageLocale(self->_overrideLocale);
          char v37 = [v35 isEqualToString:v36];

          if ((v37 & 1) == 0)
          {
            uint64_t v38 = GEOGetTileDBLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_INFO, "Locale changed. Dropping all cached tile data", buf, 2u);
            }

            [(GEOTileDB *)self _dropAllTileData];
          }
        }
        [(GEOTileDB *)self _updateDevicePosture];
        _Block_object_dispose(&v65, 8);

        editionsMap = self->_editionsMap;
        if (!editionsMap)
        {
          uint64_t v40 = [MEMORY[0x1E4F1CA60] dictionary];
          v41 = self->_editionsMap;
          self->_editionsMap = v40;

          editionsMap = self->_editionsMap;
        }
        [(NSMutableDictionary *)editionsMap removeAllObjects];
        v42 = self->_db;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __20__GEOTileDB__setup___block_invoke_525;
        v63[3] = &unk_1E53D8B48;
        v63[4] = self;
        id v43 = v42;
        id v44 = v63;
        uint64_t v74 = 0;
        v75 = &v74;
        uint64_t v76 = 0x3032000000;
        v77 = __Block_byref_object_copy__5;
        v78 = __Block_byref_object_dispose__5;
        id v79 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = __ReadEditions_block_invoke;
        v83 = &unk_1E53D7C78;
        long long v45 = v43;
        v84 = v45;
        long long v46 = v44;
        v85 = v46;
        v86 = &v74;
        [(GEOSQLiteDB *)v45 statementForKey:@"ReadEditions" statementBlock:buf];

        _Block_object_dispose(&v74, 8);
        objc_initWeak((id *)buf, self);
        [(GEOTileDB *)self _removeExpiredSubscriptions];
        long long v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v47 addObserver:self selector:sel__supportsOfflineDidChange_ name:@"GEOSupportsOfflineMapsDidChangeNotificationName" object:0];

        [(GEOTileDB *)self _expireOfflineSubscriptionsForRegulatoryRegionIfNecessary];
        long long v48 = [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration activeVersions];
        id v49 = [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration latestAvailableVersions];
        [(GEOTileDB *)self _deleteOfflineDataNotMatchingVersions:v48 orVersions:v49];

        id v50 = [(GEOSQLiteDB *)self->_db isolationQueue];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __20__GEOTileDB__setup___block_invoke_2_530;
        v61[3] = &unk_1E53D8A60;
        objc_copyWeak(&v62, (id *)buf);
        v51 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78, v50, v61);
        id tileElevationConfigListener = self->_tileElevationConfigListener;
        self->_id tileElevationConfigListener = v51;

        if (v11) {
          [(GEOTileDB *)self _cleanUpOrphanedExternalResources];
        }
        [(GEOTileDB *)self _cleanUpDeletedExternalDataIfNecessary];
        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)buf);
        BOOL v26 = 1;
        goto LABEL_30;
      }
    }
  }
LABEL_29:
  BOOL v26 = 0;
LABEL_30:

  return v26;
}

uint64_t __20__GEOTileDB__setup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 136) path];
  if (![v2 fileExistsAtPath:v3]) {
    goto LABEL_6;
  }
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 152);

  if (!v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 136);
    id v9 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v9];
    id v2 = v9;

    if (v7)
    {
LABEL_7:

      return [*(id *)(a1 + 40) vacuum];
    }
    id v3 = GEOGetTileDBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v11 = v2;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Failed to remove external resources directory: %{public}@", buf, 0xCu);
    }
LABEL_6:

    goto LABEL_7;
  }
  return [*(id *)(a1 + 40) vacuum];
}

uint64_t __20__GEOTileDB__setup___block_invoke_522(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v15 = v9;
  id v16 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  geo_isolate_sync_data();

  return 0;
}

void __20__GEOTileDB__setup___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 48));
  id v2 = *(void **)(a1 + 56);
  id v3 = (id *)(*(void *)(a1 + 32) + 96);

  objc_storeStrong(v3, v2);
}

uint64_t __20__GEOTileDB__setup___block_invoke_525(uint64_t a1, uint64_t a2)
{
  int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v6 = [NSNumber numberWithUnsignedInt:a2];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return 1;
}

void __20__GEOTileDB__setup___block_invoke_2_530(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dropAllTileData];
}

- (void)_cleanUpOrphanedExternalResources
{
  id v3 = GEOGetTileDBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Cleaning up external data blobs which are no longer referenced by the database", buf, 2u);
  }

  int v4 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v4);

  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke;
  v6[3] = &unk_1E53D8B98;
  v6[4] = self;
  [(GEOSQLiteDB *)db ensureInTransaction:v6];
}

BOOL __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C1203C0]();
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 enumeratorAtURL:*(void *)(*(void *)(a1 + 32) + 136) includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:21 errorHandler:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x18C1203C0]();
        id v10 = objc_alloc(MEMORY[0x1E4F29128]);
        id v11 = [v8 relativePath];
        id v12 = (void *)[v10 initWithUUIDString:v11];

        if (v12 && (MarkExternalDataForDeletion(*(void **)(*(void *)(a1 + 32) + 8), v12) & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: MarkExternalDataForDeletion(_db, ((void *)0), externalResourceUUID)", (uint8_t *)location, 2u);
          }

          return 0;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (([*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"UnmarkForDeletionExternalData" statementBlock:&__block_literal_global_1144] & 1) == 0)
  {
    BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    LOWORD(location[0]) = 0;
    id v15 = MEMORY[0x1E4F14500];
    id v16 = "Assertion failed: UnmarkForDeletionExternalData(_db, ((void *)0))";
    goto LABEL_22;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"UnmarkForDeletionExternalOfflineData" statementBlock:&__block_literal_global_1146])
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    id v13 = *(void **)(*(void *)(a1 + 32) + 8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke_533;
    v18[3] = &unk_1E53D7B90;
    objc_copyWeak(&v19, location);
    [v13 addTransactionPostCommitAction:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
    return 1;
  }
  BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  if (result)
  {
    LOWORD(location[0]) = 0;
    id v15 = MEMORY[0x1E4F14500];
    id v16 = "Assertion failed: UnmarkForDeletionExternalOfflineData(_db, ((void *)0))";
LABEL_22:
    _os_log_fault_impl(&dword_188D96000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)location, 2u);
    return 0;
  }
  return result;
}

void __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke_533(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanUpDeletedExternalDataIfNecessary];
    id WeakRetained = v2;
  }
}

- (void)_cleanUpDeletedExternalDataIfNecessary
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_2;
  v4[3] = &unk_1E53D8B98;
  v4[4] = v1;
  return [v2 executeInTransaction:v4];
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v2 = GEOGetTileDBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Removing any external files which are no longer referenced by the database", (uint8_t *)&buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  char v20 = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_534;
  long long v21 = &unk_1E53D8D00;
  uint64_t v22 = v3;
  long long v23 = &v24;
  id v5 = v4;
  uint64_t v6 = &v18;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__5;
  void v28[4] = __Block_byref_object_dispose__5;
  id v29 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v31 = __GetAllExternalDataPendingDeletion_block_invoke;
  char v32 = &unk_1E53D7C78;
  id v7 = v5;
  id v33 = v7;
  id v8 = v6;
  id v34 = v8;
  v35 = v28;
  LOBYTE(v6) = objc_msgSend(v7, "statementForKey:statementBlock:", @"GetAllExternalDataPendingDeletion", &buf, v18, v19, v20, v21, v22, v23);

  _Block_object_dispose(v28, 8);
  if ((v6 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_17:
      uint64_t v14 = 0;
      goto LABEL_13;
    }
    LOWORD(buf) = 0;
    id v16 = MEMORY[0x1E4F14500];
    int v17 = "Assertion failed: GetAllExternalDataPendingDeletion(_db, ((void *)0), ^(NSUUID *extUUID) { ++removedExternalRe"
          "sourcesCount; @autoreleasepool { NSURL *externalResourceURL = [_externalDataDirectory URLByAppendingPathCompon"
          "ent:extUUID.UUIDString]; [NSFileManager.defaultManager removeItemAtURL:externalResourceURL error:((void *)0)];"
          " } return __objc_yes; })";
LABEL_19:
    _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&buf, 2u);
    goto LABEL_17;
  }
  uint64_t v9 = v25[3];
  id v10 = GEOGetTileDBLog();
  id v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v25[3];
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Removed %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v25[3];
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Removed %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
  }

  if (([*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"ClearAllExternalDataPendingDeletion" statementBlock:&__block_literal_global_1148] & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    LOWORD(buf) = 0;
    id v16 = MEMORY[0x1E4F14500];
    int v17 = "Assertion failed: ClearAllExternalDataPendingDeletion(_db, ((void *)0))";
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "tileDBDidDeleteExternalResource:");
LABEL_12:
  uint64_t v14 = 1;
LABEL_13:
  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_534(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v4 = (void *)MEMORY[0x18C1203C0]();
  id v5 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v6 = [v3 UUIDString];
  id v7 = [v5 URLByAppendingPathComponent:v6];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  return 1;
}

- (void)_localeChanged:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  void v21[4] = __Block_byref_object_dispose__5;
  _GEOCreateTransaction();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = _languageLocale(self->_overrideLocale);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__5;
  void v19[4] = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __28__GEOTileDB__localeChanged___block_invoke;
  id v16 = &unk_1E53D89C0;
  int v17 = self;
  uint64_t v18 = v19;
  geo_isolate_sync_data();
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__GEOTileDB__localeChanged___block_invoke_2;
  v8[3] = &unk_1E53D8BC0;
  id v7 = v5;
  id v9 = v7;
  id v10 = self;
  id v11 = v19;
  uint64_t v12 = v21;
  [(GEOSQLiteDB *)db executeAsync:v8];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __28__GEOTileDB__localeChanged___block_invoke(uint64_t a1)
{
}

void __28__GEOTileDB__localeChanged___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) == 0)
  {
    id v2 = GEOGetTileDBLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Locale changed. Dropping all cached tile data", v5, 2u);
    }

    [*(id *)(a1 + 40) _dropAllTileData];
  }
  [*(id *)(a1 + 40) _updateDevicePosture];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)_deviceLocked:(id)a3
{
}

- (void)_countryChanged:(id)a3
{
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__GEOTileDB__countryChanged___block_invoke;
  v4[3] = &unk_1E53D79D8;
  v4[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v4];
}

uint64_t __29__GEOTileDB__countryChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDevicePosture];
}

- (void)_editionUpdate:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"GEOTileEditionUpdateKey"];

  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__GEOTileDB__editionUpdate___block_invoke;
  v8[3] = &unk_1E53D8998;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [(GEOSQLiteDB *)db executeAsync:v8];
}

void __28__GEOTileDB__editionUpdate___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) flushEverything])
  {
    id v2 = GEOGetTileDBLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Tile edition update requires full flush", buf, 2u);
    }

    [*(id *)(a1 + 40) _dropAllTileData];
  }
  else
  {
    [*(id *)(a1 + 40) _flushPendingWrites];
    *(void *)long long buf = 0;
    id v11 = buf;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__GEOTileDB__editionUpdate___block_invoke_537;
    v6[3] = &unk_1E53D8BE8;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    id v9 = buf;
    [v3 executeInTransaction:v6];
    if (v11[24]) {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 160), "tileDBDidDeleteExternalResource:");
    }

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __28__GEOTileDB__editionUpdate___block_invoke_537(uint64_t a1)
{
  if ([*(id *)(a1 + 32) invalidateEverything])
  {
    id v2 = GEOGetTileDBLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Tile edition update requires full invalidation", buf, 2u);
    }

    [*(id *)(a1 + 40) _invalidateAllTileData];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) tilesetCount];
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        *(_DWORD *)long long buf = 0;
        uint64_t v9 = 0;
        char v8 = 0;
        [*(id *)(a1 + 32) tileset:buf edition:(char *)&v9 + 4 provider:&v9 invalidateOnly:&v8 atIndex:i];
        if (v8)
        {
          [*(id *)(a1 + 40) _invalidateTileSet:*(unsigned int *)buf];
        }
        else
        {
          char v7 = 0;
          [*(id *)(a1 + 40) _deleteTileSet:*(unsigned int *)buf deletedExternalResources:&v7];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v7;
        }
        [*(id *)(a1 + 40) _setEdition:HIDWORD(v9) forTileSet:*(unsigned int *)buf];
      }
    }
  }
  return 1;
}

- (void)setExpirationRecords:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v6 = malloc_type_malloc(16 * a4, 0x1000040F7F8B94BuLL);
    memcpy(v6, a3, 16 * a4);
  }
  geo_isolate_sync_data();
}

void __40__GEOTileDB_setExpirationRecords_count___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(v2 + 72);
  if (v3)
  {
    free(v3);
    uint64_t v2 = a1[4];
  }
  uint64_t v4 = a1[6];
  *(void *)(v2 + 72) = a1[5];
  *(void *)(a1[4] + 80) = v4;
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__GEOTileDB_beginPreloadSessionOfSize___block_invoke;
  v4[3] = &unk_1E53D79B0;
  v4[4] = self;
  void v4[5] = a3;
  [(GEOSQLiteDB *)db executeAsync:v4];
}

uint64_t __39__GEOTileDB_beginPreloadSessionOfSize___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(v4 + 8);
  unint64_t v5 = v2[3];
  BOOL v6 = v5 >= v3;
  uint64_t v7 = v5 - v3;
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t result = [v2 _shrinkToSize:v8];
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  return result;
}

- (void)endPreloadSession
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__GEOTileDB_endPreloadSession__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

uint64_t __30__GEOTileDB_endPreloadSession__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = 0;
  return result;
}

- (void)_vacuum
{
  unint64_t v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__GEOTileDB__vacuum__block_invoke;
  v5[3] = &unk_1E53D79D8;
  v5[4] = self;
  [(GEOSQLiteDB *)db performWithTemporaryStoreMode:1 block:v5];
}

uint64_t __20__GEOTileDB__vacuum__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) vacuum];
}

- (void)shrinkToSize:(unint64_t)a3 queue:(id)a4 finished:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke;
  v16[3] = &unk_1E53D8C60;
  v16[4] = self;
  unint64_t v19 = a3;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_3;
  v13[3] = &unk_1E53D8C88;
  id v14 = v17;
  id v15 = v18;
  id v11 = v18;
  id v12 = v17;
  [(GEOSQLiteDB *)db executeAsync:v16 errorHandler:v13];
}

void __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _shrinkToSize:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _vacuum];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_2;
  v4[3] = &unk_1E53D8C38;
  unint64_t v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = v2;
  dispatch_async(v3, v4);
}

uint64_t __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_4;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shrinkBySize:(unint64_t)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke;
  v16[3] = &unk_1E53D8C60;
  v16[4] = self;
  unint64_t v19 = a3;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_3;
  v13[3] = &unk_1E53D8C88;
  id v14 = v17;
  id v15 = v18;
  id v11 = v18;
  id v12 = v17;
  [(GEOSQLiteDB *)db executeAsync:v16 errorHandler:v13];
}

void __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _vacuum];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_2;
  v4[3] = &unk_1E53D8C38;
  id v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = v2;
  dispatch_async(v3, v4);
}

uint64_t __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_4;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)shrinkToSizeSync:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__GEOTileDB_shrinkToSizeSync___block_invoke;
  v6[3] = &unk_1E53D8CB0;
  void v6[4] = self;
  void v6[5] = &v7;
  v6[6] = a3;
  [(GEOSQLiteDB *)db executeSync:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__GEOTileDB_shrinkToSizeSync___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkToSize:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 vacuum];
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__GEOTileDB_shrinkBySizeSync___block_invoke;
  v6[3] = &unk_1E53D8CB0;
  void v6[4] = self;
  void v6[5] = &v7;
  v6[6] = a3;
  [(GEOSQLiteDB *)db executeSync:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__GEOTileDB_shrinkBySizeSync___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 vacuum];
}

- (void)_incrementCalculatedTileDataSize:(unint64_t)a3
{
  if (self->_tileDataSizeIsValid) {
    self->_tileDataSize += a3;
  }
}

- (void)_decrementCalculatedTileDataSize:(unint64_t)a3
{
  if (self->_tileDataSizeIsValid)
  {
    unint64_t tileDataSize = self->_tileDataSize;
    BOOL v4 = tileDataSize >= a3;
    unint64_t v5 = tileDataSize - a3;
    if (!v4) {
      unint64_t v5 = 0;
    }
    self->_unint64_t tileDataSize = v5;
  }
}

- (void)_evictIfNecessary
{
}

- (unint64_t)_shrinkToSize:(unint64_t)a3
{
  if (self->_preloading)
  {
    id v3 = GEOGetTileDBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Refusing to shrink database because there is an active preload session", v9, 2u);
    }

    return 0;
  }
  unint64_t v8 = [(GEOTileDB *)self _allTileDataSize];
  unint64_t v4 = v8;
  if (!a3)
  {
    [(GEOTileDB *)self _dropAllTileData];
    return v4;
  }
  if (v8 <= a3) {
    return 0;
  }

  return [(GEOTileDB *)self _shrinkBySizeSlow:v8 - a3];
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
  if (self->_preloading)
  {
    id v3 = GEOGetTileDBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Refusing to shrink database because there is an active preload session", v9, 2u);
    }

    return 0;
  }
  unint64_t v7 = [(GEOTileDB *)self _allTileDataSize];
  if (v7 <= a3)
  {
    unint64_t v4 = v7;
    [(GEOTileDB *)self _dropAllTileData];
    return v4;
  }

  return [(GEOTileDB *)self _shrinkBySizeSlow:a3];
}

- (unint64_t)_shrinkBySizeSlow:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  unint64_t v5 = GEOGetTileDBLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Attempting to shrink database by %{bytes}llu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke;
  v9[3] = &unk_1E53D8D50;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  v9[7] = a3;
  [(GEOSQLiteDB *)db executeInTransaction:v9];
  [(GEOTileDB *)self _decrementCalculatedTileDataSize:*(void *)(*((void *)&buf + 1) + 24)];
  if (*((unsigned char *)v11 + 24)) {
    [(GEOObserverHashTable *)self->_observers tileDBDidDeleteExternalResource:self];
  }
  unint64_t v7 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&buf, 8);
  return v7;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke(uint64_t a1)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v3 = *MEMORY[0x1E4F1CF78];
  unint64_t v4 = (unint64_t)(Current + -15552000.0 + *MEMORY[0x1E4F1CF78]);
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  LODWORD(v108) = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  LODWORD(v104) = 0;
  unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  uint64_t v6 = &unk_1E53D8CD8;
  v100[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2;
  v100[3] = &unk_1E53D8CD8;
  v100[4] = &v77;
  v100[5] = &v105;
  v100[6] = &v101;
  id v7 = v5;
  unint64_t v8 = v100;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__5;
  v113 = __Block_byref_object_dispose__5;
  id v114 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __CalculateOldDataSize_block_invoke;
  *(void *)&unsigned char buf[24] = &unk_1E53D9BC8;
  id v9 = v7;
  v119 = &v109;
  unint64_t v120 = v4;
  id v117 = v9;
  uint64_t v10 = v8;
  v118 = v10;
  [v9 statementForKey:@"CalculateOldDataSize" statementBlock:buf];

  _Block_object_dispose(&v109, 8);
  if (v78[3])
  {
    id v11 = GEOGetTileDBLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *((_DWORD *)v106 + 6);
      uint64_t v13 = v78[3];
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v12;
      *(_WORD *)&uint8_t buf[8] = 2048;
      *(void *)&buf[10] = v13;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Deleting %d tiles (%{bytes}llu) > 6 months old", buf, 0x12u);
    }

    buf[0] = 0;
    [*(id *)(a1 + 32) _evictVeryOldTiles:buf];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= buf[0];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v78[3];
  }
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v77, 8);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56))
  {
    uint64_t v66 = GEOGetTileDBLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      uint64_t v68 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v68;
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 0;
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x2020000000;
    uint64_t v108 = 0;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v93 = MEMORY[0x1E4F143A8];
    uint64_t v94 = 3221225472;
    v95 = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_540;
    v96 = &unk_1E53D89E8;
    uint64_t v97 = v14;
    v98 = &v105;
    v99 = &v77;
    geo_isolate_sync_data();
    if (v106[3])
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      *(void *)&long long v15 = 67109634;
      long long v71 = v15;
      do
      {
        int v92 = 0;
        int v92 = *(_DWORD *)(v78[3] + v16);
        unint64_t v18 = (unint64_t)(v3 + CFAbsoluteTimeGetCurrent() - *(double *)(v78[3] + v16 + 8));
        uint64_t v101 = 0;
        v102 = &v101;
        uint64_t v103 = 0x2020000000;
        uint64_t v104 = 0;
        uint64_t v88 = 0;
        uint64_t v89 = &v88;
        uint64_t v90 = 0x2020000000;
        int v91 = 0;
        v86[0] = 0;
        v86[1] = v86;
        v86[2] = 0x2020000000;
        int v87 = 0;
        unint64_t v19 = *(void **)(*(void *)(a1 + 32) + 8);
        int v20 = v92;
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2_541;
        v85[3] = v6;
        v85[4] = &v101;
        v85[5] = &v88;
        v85[6] = v86;
        id v21 = v19;
        id v22 = v85;
        uint64_t v109 = 0;
        v110 = &v109;
        uint64_t v111 = 0x3032000000;
        v112 = __Block_byref_object_copy__5;
        v113 = __Block_byref_object_dispose__5;
        id v114 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __CalculateOldDataSizeForTileset_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E53D9BF0;
        id v23 = v21;
        int v121 = v20;
        id v117 = v23;
        v119 = &v109;
        unint64_t v120 = v18;
        uint64_t v24 = v22;
        v118 = v24;
        [v23 statementForKey:@"CalculateOldDataSizeForTileset" statementBlock:buf];

        _Block_object_dispose(&v109, 8);
        if (v102[3])
        {
          id v25 = GEOGetTileDBLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = v6;
            int v27 = *((_DWORD *)v89 + 6);
            uint64_t v28 = v102[3];
            id v29 = GEOTileDBTileSetShortDescription((unsigned __int8 *)&v92);
            *(_DWORD *)long long buf = v71;
            *(_DWORD *)&uint8_t buf[4] = v27;
            *(_WORD *)&uint8_t buf[8] = 2048;
            *(void *)&buf[10] = v28;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v29;
            _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_INFO, "Deleting %d expired tiles (%{bytes}llu) for tileset %@", buf, 0x1Cu);

            uint64_t v6 = v26;
          }

          [*(id *)(a1 + 32) _invalidateSubscriptionsReferencingTilesOlderThan:v18 forTileSet:&v92];
          int v30 = v92;
          v83[0] = MEMORY[0x1E4F143A8];
          long long v31 = *(_OWORD *)(a1 + 32);
          char v32 = *(void **)(*(void *)(a1 + 32) + 8);
          v83[1] = 3221225472;
          v83[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_542;
          v83[3] = &unk_1E53D8D00;
          long long v84 = v31;
          id v33 = v32;
          id v34 = v83;
          uint64_t v109 = 0;
          v110 = &v109;
          uint64_t v111 = 0x3032000000;
          v112 = __Block_byref_object_copy__5;
          v113 = __Block_byref_object_dispose__5;
          id v114 = 0;
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __GetOldTileExternalResourcesForTileSet_block_invoke;
          *(void *)&unsigned char buf[24] = &unk_1E53D9BF0;
          id v35 = v33;
          v119 = &v109;
          unint64_t v120 = v18;
          id v117 = v35;
          int v121 = v30;
          uint64_t v36 = v34;
          v118 = v36;
          [v35 statementForKey:@"GetOldTileExternalResourcesForTileSet" statementBlock:buf];

          _Block_object_dispose(&v109, 8);
          int v37 = v92;
          id v38 = *(id *)(*(void *)(a1 + 32) + 8);
          uint64_t v109 = 0;
          v110 = &v109;
          uint64_t v111 = 0x3032000000;
          v112 = __Block_byref_object_copy__5;
          v113 = __Block_byref_object_dispose__5;
          id v114 = 0;
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __DeleteOldDataForTileset_block_invoke;
          *(void *)&unsigned char buf[24] = &unk_1E53D9C18;
          id v39 = v38;
          v118 = &v109;
          v119 = (uint64_t *)v18;
          id v117 = v39;
          LODWORD(v120) = v37;
          [v39 executeStatement:@"DeleteOldDataForTileset" statementBlock:buf];

          _Block_object_dispose(&v109, 8);
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v102[3];
        }
        unint64_t v40 = *(void *)(a1 + 56);
        unint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        _Block_object_dispose(v86, 8);
        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(&v101, 8);
        if (v41 >= v40) {
          break;
        }
        ++v17;
        v16 += 16;
      }
      while (v17 < v106[3]);
    }
    v42 = (void *)v78[3];
    if (v42) {
      free(v42);
    }
    _Block_object_dispose(&v105, 8);
    _Block_object_dispose(&v77, 8);
    uint64_t v43 = *(void *)(a1 + 48);
    unint64_t v44 = *(void *)(a1 + 56);
    if (*(void *)(*(void *)(v43 + 8) + 24) >= v44)
    {
      uint64_t v66 = GEOGetTileDBLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        uint64_t v69 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v69;
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v105 = 0;
      v106 = &v105;
      uint64_t v107 = 0x2020000000;
      LODWORD(v108) = 0;
      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2020000000;
      uint64_t v104 = 0;
      uint64_t v77 = 0;
      v78 = &v77;
      uint64_t v79 = 0x3032000000;
      uint64_t v80 = __Block_byref_object_copy__5;
      uint64_t v81 = __Block_byref_object_dispose__5;
      id v82 = 0;
      long long v45 = *(void **)(*(void *)(a1 + 32) + 8);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_543;
      v76[3] = &unk_1E53D8D28;
      v76[4] = &v105;
      v76[5] = &v101;
      v76[6] = &v77;
      v76[7] = v43;
      v76[8] = v44;
      id v46 = v45;
      long long v47 = v76;
      uint64_t v109 = 0;
      v110 = &v109;
      uint64_t v111 = 0x3032000000;
      v112 = __Block_byref_object_copy__5;
      v113 = __Block_byref_object_dispose__5;
      id v114 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __EnumerateDataSizeFromOldest_block_invoke;
      *(void *)&unsigned char buf[24] = &unk_1E53D7C78;
      id v48 = v46;
      id v117 = v48;
      id v49 = v47;
      v118 = v49;
      v119 = &v109;
      [v48 statementForKey:@"EnumerateDataSizeFromOldest" statementBlock:buf];

      _Block_object_dispose(&v109, 8);
      if (*((_DWORD *)v106 + 6))
      {
        id v50 = GEOGetTileDBLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          int v51 = *((_DWORD *)v106 + 6);
          uint64_t v52 = v102[3];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v51;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v52;
          _os_log_impl(&dword_188D96000, v50, OS_LOG_TYPE_INFO, "Deleting %d oldest tiles (%{bytes}llu)", buf, 0x12u);
        }

        [*(id *)(a1 + 32) _invalidateSubscriptionsReferencingOldestTilesWithLimit:*((unsigned int *)v106 + 6)];
        unint64_t v53 = (uint64_t *)*((unsigned int *)v106 + 6);
        id v54 = *(id *)(*(void *)(a1 + 32) + 8);
        uint64_t v109 = 0;
        v110 = &v109;
        uint64_t v111 = 0x3032000000;
        v112 = __Block_byref_object_copy__5;
        v113 = __Block_byref_object_dispose__5;
        id v114 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __DeleteOldestNTiles_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E53D7A50;
        id v55 = v54;
        v118 = &v109;
        v119 = v53;
        id v117 = v55;
        int v56 = [v55 executeStatement:@"DeleteOldestNTiles" statementBlock:buf];

        _Block_object_dispose(&v109, 8);
        if ([(id)v78[5] count])
        {
          long long v57 = GEOGetTileDBLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            uint64_t v58 = [(id)v78[5] count];
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = v58;
            _os_log_impl(&dword_188D96000, v57, OS_LOG_TYPE_INFO, "Deleting %llu externally-stored data blobs)", buf, 0xCu);
          }

          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v59 = (id)v78[5];
          uint64_t v60 = [v59 countByEnumeratingWithState:&v72 objects:v115 count:16];
          if (v60)
          {
            uint64_t v61 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v73 != v61) {
                  objc_enumerationMutation(v59);
                }
                v63 = *(void **)(*(void *)(a1 + 32) + 136);
                long long v64 = objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "UUIDString", v71);
                uint64_t v65 = [v63 URLByAppendingPathComponent:v64];

                [*(id *)(*(void *)(a1 + 32) + 8) deleteExternalResourceAtURL:v65 error:0];
                *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
              }
              uint64_t v60 = [v59 countByEnumeratingWithState:&v72 objects:v115 count:16];
            }
            while (v60);
          }
        }
        if (v56) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v102[3];
        }
      }
      _Block_object_dispose(&v77, 8);

      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(&v105, 8);
      uint64_t v66 = GEOGetTileDBLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v67;
LABEL_39:
        _os_log_impl(&dword_188D96000, v66, OS_LOG_TYPE_INFO, "Purged %{bytes}llu", buf, 0xCu);
      }
    }
  }

  return 1;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2(void *a1, uint64_t a2, int a3, int a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  return 1;
}

void *__31__GEOTileDB__shrinkBySizeSlow___block_invoke_540(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 80);
  uint64_t v1 = *(void *)(*(void *)(result[5] + 8) + 24);
  if (v1)
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(result[6] + 8) + 24) = malloc_type_malloc(16 * v1, 0x1000040F7F8B94BuLL);
    double v3 = *(void **)(*(void *)(v2[6] + 8) + 24);
    unint64_t v4 = *(const void **)(v2[4] + 72);
    size_t v5 = 16 * *(void *)(*(void *)(v2[5] + 8) + 24);
    return memcpy(v3, v4, v5);
  }
  return result;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2_541(void *a1, uint64_t a2, int a3, int a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  return 1;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_542(uint64_t a1, void *a2)
{
  if (a2)
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 136);
    unint64_t v4 = [a2 UUIDString];
    size_t v5 = [v3 URLByAppendingPathComponent:v4];

    [*(id *)(*(void *)(a1 + 32) + 8) deleteExternalResourceAtURL:v5 error:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

BOOL __31__GEOTileDB__shrinkBySizeSlow___block_invoke_543(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  *(void *)(*(void *)(a1[5] + 8) + 24) += a3;
  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = *(void *)(a1[6] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    [v6 addObject:v5];
  }
  BOOL v10 = *(void *)(*(void *)(a1[7] + 8) + 24) + *(void *)(*(void *)(a1[5] + 8) + 24) <= a1[8];

  return v10;
}

- (void)calculateFreeableSizeWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke;
  v14[3] = &unk_1E53D7F70;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_3;
  v11[3] = &unk_1E53D8C88;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(GEOSQLiteDB *)db executeAsync:v14 errorHandler:v11];
}

void __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allTileDataSize];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_2;
  v4[3] = &unk_1E53D8C38;
  double v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = v2;
  dispatch_async(v3, v4);
}

uint64_t __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_4;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)clearPurgeableOfflineData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__GEOTileDB_clearPurgeableOfflineData__block_invoke;
  v5[3] = &unk_1E53D7C00;
  v5[4] = self;
  void v5[5] = &v6;
  [(GEOSQLiteDB *)db executeSync:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__GEOTileDB_clearPurgeableOfflineData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 8);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __38__GEOTileDB_clearPurgeableOfflineData__block_invoke_2;
  uint64_t v14 = &unk_1E53D8D78;
  uint64_t v15 = v3;
  id v5 = v2;
  id v16 = v5;
  id v6 = v4;
  id v7 = &v11;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__5;
  void v24[4] = __Block_byref_object_dispose__5;
  id v25 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __EnumerateOfflineDataExternalResources_block_invoke;
  int v20 = &unk_1E53D7C78;
  id v8 = v6;
  id v21 = v8;
  char v9 = v7;
  id v22 = v9;
  id v23 = v24;
  char v10 = objc_msgSend(v8, "statementForKey:statementBlock:", @"EnumerateOfflineDataExternalResources", buf, v11, v12, v13, v14, v15);

  _Block_object_dispose(v24, 8);
  if (v10)
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: EnumerateOfflineDataExternalResources(_db, ((void *)0), ^BOOL(NSUUID *ext_uuid) { NSURL *fileURL = [_externalDataDirectory URLByAppendingPathComponent:ext_uuid.UUIDString]; if ([fileManager fileExistsAtPath"
        ":fileURL.path]) { if (__builtin_expect(!([fileManager removeItemAtURL:fileURL error:((void *)0)]), 0)) { __ext"
        "ension__({ os_log_t _log_tmp = (((__bridge os_log_t)&(_os_log_default))); os_log_type_t _type_tmp = OS_LOG_TYPE_"
        "FAULT; if (os_log_type_enabled(_log_tmp, _type_tmp)) { __extension__({ _Pragma(\"clang diagnostic push\") _Pragm"
        "a(\"clang diagnostic ignored \\\"-Wvla\\\"\") _Pragma(\"clang diagnostic error \\\"-Wformat\\\"\") _Static_asser"
        "t(__builtin_constant_p(\"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"), \"fo"
        "rmat/label/description argument must be a string constant\"); __attribute__((section(\"__TEXT,__oslogstring,cstr"
        "ing_literals\"),internal_linkage)) static const char _os_fmt_str[] __asm(\"LOS_LOG46\") = \"Assertion failed: \""
        " \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"; uint8_t _Alignas(16) __attribute__((uninitialized)"
        ") _os_fmt_buf[__builtin_os_log_format_buffer_size(\"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL "
        "error:((void *)0)]\")]; _os_log_fault_impl(&__dso_handle, _log_tmp, _type_tmp, _os_fmt_str, (uint8_t *)__builtin"
        "_os_log_format(_os_fmt_buf, \"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"),"
        " (uint32_t)sizeof(_os_fmt_buf)) _Pragma(\"clang diagnostic pop\"); }); } }); return __objc_no; } else do {} whil"
        "e (0); } return __objc_yes; })",
        buf,
        2u);
    }
  }
}

uint64_t __38__GEOTileDB_clearPurgeableOfflineData__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
  unint64_t v4 = [a2 UUIDString];
  id v5 = [v3 URLByAppendingPathComponent:v4];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v5 path];
  LODWORD(v6) = [v6 fileExistsAtPath:v7];

  if (v6 && ([*(id *)(a1 + 40) removeItemAtURL:v5 error:0] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v10 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [fileManager removeItemAtURL:fileURL error:((void *)0)]", v10, 2u);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_3;
  block[3] = &unk_1E53D8E18;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      if (!(*(unsigned int (**)(double))(*(void *)(a1 + 48) + 16))(0.0)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v7 = *(NSObject **)(a1 + 40);
  if (v7) {
    dispatch_group_leave(v7);
  }
}

- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(unsigned __int8)a9
{
  LOWORD(v10) = a9;
  return objc_msgSend(a1, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", a3, a4, a5, a6, v10);
}

- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(__int16)a9 isIdenticalToExistingStaleData:
{
  LOWORD(v10) = a9;
  return objc_msgSend(a1, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:forSubscriptionWithIdentifier:", a3, a4, a5, a6, v10, 0);
}

- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 externalResourceUUID:(id *)a5
{
  return [(GEOTileDB *)self _prepareDataForPersistence:a3 isIdenticalToExistingStaleData:a4 preferredExternalResourceUUID:0 externalResourceUUID:a5];
}

- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 preferredExternalResourceUUID:(id)a5 externalResourceUUID:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v10 fileURL];

  if (!v12)
  {
    id v16 = 0;
    goto LABEL_19;
  }
  if (v8)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v14 = [v10 fileURL];
    uint64_t v15 = [v14 lastPathComponent];
    id v16 = (id)[v13 initWithUUIDString:v15];

    if (v16) {
      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v30 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: newExternalResourceUUID != nil", v30, 2u);
    }
  }
  *(void *)int v30 = 0;
  long long v31 = v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v29[1] = (id)MEMORY[0x1E4F143A8];
  v29[2] = (id)3221225472;
  v29[3] = __122__GEOTileDB__prepareDataForPersistence_isIdenticalToExistingStaleData_preferredExternalResourceUUID_externalResourceUUID___block_invoke;
  v29[4] = &unk_1E53D7C00;
  v29[5] = self;
  v29[6] = v30;
  geo_isolate_sync();
  if (v31[24])
  {
    if (v11)
    {
      id v17 = v11;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F29128] UUID];
    }
    id v16 = v17;
    externalDataDirectory = self->_externalDataDirectory;
    unint64_t v19 = [v17 UUIDString];
    int v20 = [(NSURL *)externalDataDirectory URLByAppendingPathComponent:v19];

    id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = [v10 fileURL];
    v29[0] = 0;
    char v23 = [v21 moveItemAtURL:v22 toURL:v20 error:v29];
    id v24 = v29[0];

    if (v23)
    {
      [v10 _replaceFileURL:v20];
      int v25 = 0;
    }
    else
    {
      uint64_t v26 = GEOGetTileDBLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v35 = v24;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Failed to move external resource: %{public}@", buf, 0xCu);
      }

      int v25 = 1;
    }
  }
  else
  {
    id v16 = 0;
    int v25 = 1;
  }
  _Block_object_dispose(v30, 8);
  if (v25)
  {
    BOOL v27 = 0;
    goto LABEL_22;
  }
LABEL_19:
  if (a6)
  {
    id v16 = v16;
    *a6 = v16;
  }
  BOOL v27 = 1;
LABEL_22:

  return v27;
}

void __122__GEOTileDB__prepareDataForPersistence_isIdenticalToExistingStaleData_preferredExternalResourceUUID_externalResourceUUID___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 136) path];
  char v4 = [v2 fileExistsAtPath:v3];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 136);
  uint64_t v14 = *MEMORY[0x1E4F28370];
  v15[0] = *MEMORY[0x1E4F28358];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v11 = 0;
  char v8 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v7 error:&v11];
  id v9 = v11;

  if (v8)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;

LABEL_4:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  id v10 = GEOGetTileDBLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Failed to create external resources directory: %{public}@", buf, 0xCu);
  }
}

- (void)addData:(void *)a3 forKey:(long long *)a4 edition:(int)a5 set:(int)a6 provider:(uint64_t)a7 etag:(void *)a8 reason:(char)a9 isIdenticalToExistingStaleData:(unsigned __int8)a10 forSubscriptionWithIdentifier:(void *)a11
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a8;
  id v18 = a11;
  if (v16)
  {
    id v22 = 0;
    int v19 = [a1 _prepareDataForPersistence:v16 isIdenticalToExistingStaleData:a10 externalResourceUUID:&v22];
    id v20 = v22;
    if (v19)
    {
      long long v31 = *a4;
      id v21 = (void *)a1[1];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __122__GEOTileDB_addData_forKey_edition_set_provider_etag_reason_isIdenticalToExistingStaleData_forSubscriptionWithIdentifier___block_invoke;
      v23[3] = &unk_1E53D8E68;
      v23[4] = a1;
      int v28 = a6;
      int v29 = a5;
      unsigned __int8 v30 = a10;
      id v24 = v16;
      id v25 = v17;
      char v32 = a9;
      id v26 = v20;
      id v27 = v18;
      [v21 executeAsync:v23];
    }
  }
}

void __122__GEOTileDB_addData_forKey_edition_set_provider_etag_reason_isIdenticalToExistingStaleData_forSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  id v8 = [v2 objectForKeyedSubscript:v3];

  int v4 = [v8 unsignedIntValue];
  uint64_t v5 = *(unsigned int *)(a1 + 76);
  if (v4 != v5)
  {
    if (v8)
    {
      [*(id *)(a1 + 32) _invalidateTileSet:*(unsigned int *)(a1 + 72)];
      uint64_t v5 = *(unsigned int *)(a1 + 76);
    }
    [*(id *)(a1 + 32) _setEdition:v5 forTileSet:*(unsigned int *)(a1 + 72)];
  }
  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v6 = &off_1E53D6D88;
  }
  else {
    uint64_t v6 = off_1E53D6D80;
  }
  id v7 = (void *)[objc_alloc(*v6) initWithTileKey:a1 + 81 tileSet:*(unsigned int *)(a1 + 72) data:*(void *)(a1 + 40) ETag:*(void *)(a1 + 48) reason:*(unsigned __int8 *)(a1 + 97) externalResourceUUID:*(void *)(a1 + 56) forSubscriptionWithIdentifier:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 32) + 16) addOperation:v7];
}

- (void)getLastAccessTimestampForKey:(long long *)a3 callbackQueue:(void *)a4 callback:(void *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8)
    {
      long long v18 = *a3;
      id v11 = *(void **)(a1 + 8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke;
      v15[3] = &unk_1E53D8EE0;
      v15[4] = a1;
      id v16 = v8;
      id v17 = v10;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_6;
      v12[3] = &unk_1E53D8C88;
      id v13 = v16;
      id v14 = v17;
      [v11 executeAsync:v15 errorHandler:v12];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  int v3 = *(_DWORD *)(a1 + 60);
  int v4 = *(_DWORD *)(a1 + 64);
  int v5 = *(_DWORD *)(a1 + 68);
  uint64_t v29 = 0;
  unsigned __int8 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = -1;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_2;
  v28[3] = &unk_1E53D8E90;
  void v28[4] = &v29;
  LookupTileRowForKey(v6, v2, v3, v4, v5, v28);
  if (v30[3] == -1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_3;
    block[3] = &unk_1E53DA028;
    id v10 = *(NSObject **)(a1 + 40);
    id v27 = *(id *)(a1 + 48);
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v22 = 0;
    char v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_4;
    v17[3] = &unk_1E53D8EB8;
    v17[4] = v7;
    v17[5] = &v29;
    v17[6] = &v22;
    v17[7] = &v18;
    [v8 statementForKey:@"GetAccessTime" statementBlock:v17];
    if (*((unsigned char *)v23 + 24))
    {
      id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v19[3]];
    }
    else
    {
      id v9 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_5;
    v14[3] = &unk_1E53D7C50;
    id v11 = *(NSObject **)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v15 = v9;
    id v16 = v12;
    id v13 = v9;
    dispatch_async(v11, v14);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  _Block_object_dispose(&v29, 8);
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_4(void *a1, sqlite3_stmt *a2)
{
  if (![*(id *)(a1[4] + 8) bindInt64Parameter:"@data_pk" toValue:*(void *)(*(void *)(a1[5] + 8) + 24) inStatement:a2 error:0]|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  int v4 = sqlite3_column_type(a2, 0);
  uint64_t v5 = *(void *)(a1[6] + 8);
  if (v4 == 5)
  {
    *(unsigned char *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    uint64_t v6 = 1;
    *(unsigned char *)(v5 + 24) = 1;
    *(void *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) int64ForColumn:0 inStatment:a2];
  }
  return v6;
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_7;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStaleTileKeysUsedSince:(double)a3 fromTileSets:(id)a4 maxCount:(unint64_t)a5 maxTotalSize:(unint64_t)a6 queue:(id)a7 callback:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = v16;
  if (v16)
  {
    if (v15)
    {
      db = self->_db;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke;
      v22[3] = &unk_1E53D8F30;
      double v26 = a3;
      void v22[4] = self;
      id v23 = v14;
      unint64_t v27 = a6;
      unint64_t v28 = a5;
      id v24 = v15;
      id v25 = v17;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_4;
      v19[3] = &unk_1E53D8C88;
      id v20 = v24;
      id v21 = v25;
      [(GEOSQLiteDB *)db executeAsync:v22 errorHandler:v19];
    }
    else
    {
      (*((void (**)(id, void))v16 + 2))(v16, 0);
    }
  }
}

void __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke(uint64_t a1)
{
  int v2 = objc_alloc_init(GEOTileKeyList);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  unint64_t v3 = (unint64_t)(*(double *)(a1 + 64) + *MEMORY[0x1E4F1CF78]);
  v21[3] = 0;
  int v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_2;
  v16[3] = &unk_1E53D8F08;
  id v17 = *(id *)(a1 + 40);
  uint64_t v5 = v2;
  uint64_t v18 = v5;
  uint64_t v19 = v21;
  long long v20 = *(_OWORD *)(a1 + 72);
  id v6 = v4;
  uint64_t v7 = v16;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__5;
  v27[4] = __Block_byref_object_dispose__5;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __GetRecentlyUsedStaleKeys_block_invoke;
  v22[3] = &unk_1E53D9BC8;
  id v8 = v6;
  id v25 = v27;
  unint64_t v26 = v3;
  id v23 = v8;
  id v9 = v7;
  id v24 = v9;
  [v8 statementForKey:@"GetRecentlyUsedStaleKeys" statementBlock:v22];

  _Block_object_dispose(v27, 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_3;
  block[3] = &unk_1E53D7C50;
  id v10 = *(NSObject **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = v11;
  id v12 = v5;
  dispatch_async(v10, block);

  _Block_object_dispose(v21, 8);
}

BOOL __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v13 = *(void **)(a1 + 32);
  id v14 = [NSNumber numberWithUnsignedInt:a6];
  LODWORD(v13) = [v13 containsObject:v14];

  if (!v13) {
    return 1;
  }
  v16[0] = a2 | (unint64_t)(a3 << 32);
  v16[1] = a4 | (unint64_t)(a5 << 32);
  [*(id *)(a1 + 40) addKey:v16];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a7;
  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 56)
      && (unint64_t)[*(id *)(a1 + 40) count] < *(void *)(a1 + 64);
}

uint64_t __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_5;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)trackSubscriptionAssociationForKey:(long long *)a3 subscriptionIdentifier:(void *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v12 = *a3;
  uint64_t v7 = *(void **)(a1 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__GEOTileDB_trackSubscriptionAssociationForKey_subscriptionIdentifier___block_invoke;
  v9[3] = &unk_1E53D7FC0;
  id v10 = v6;
  uint64_t v11 = a1;
  id v8 = v6;
  [v7 executeAsync:v9];
}

void __71__GEOTileDB_trackSubscriptionAssociationForKey_subscriptionIdentifier___block_invoke(uint64_t a1)
{
  int v2 = [[_GEOTileDBAddSubscriptionAssociationOperation alloc] initWithTileKey:a1 + 48 subscriptionIdentifier:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 16) addOperation:v2];
}

- (uint64_t)trackFailureForKey:(long long *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v9 = *a3;
  uint64_t v5 = *(void **)(a1 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GEOTileDB_trackFailureForKey_tileSet_shouldProactivelyLoad___block_invoke;
  v7[3] = &unk_1E53D8F58;
  int v8 = a4;
  char v10 = a5;
  void v7[4] = a1;
  return [v5 executeAsync:v7];
}

void __62__GEOTileDB_trackFailureForKey_tileSet_shouldProactivelyLoad___block_invoke(uint64_t a1)
{
  int v2 = [[_GEOTileDBTrackFailureOperation alloc] initWithTileKey:a1 + 44 tileSet:*(unsigned int *)(a1 + 40) shouldProactivelyLoad:*(unsigned __int8 *)(a1 + 60)];
  [*(id *)(*(void *)(a1 + 32) + 16) addOperation:v2];
}

- (void)getFailedTileKeysForProactiveLoadSince:(double)a3 maxCount:(unint64_t)a4 queue:(id)a5 callback:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  long long v12 = v11;
  if (v11)
  {
    if (v10)
    {
      db = self->_db;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke;
      v17[3] = &unk_1E53D8EE0;
      v17[4] = self;
      double v20 = a3;
      unint64_t v21 = a4;
      id v18 = v10;
      id v19 = v12;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_4;
      v14[3] = &unk_1E53D8C88;
      id v15 = v18;
      id v16 = v19;
      [(GEOSQLiteDB *)db executeAsync:v17 errorHandler:v14];
    }
    else
    {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

void __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _flushPendingWrites];
  int v2 = objc_alloc_init(GEOTileKeyList);
  unint64_t v3 = (unint64_t)fmax(*(double *)(a1 + 56) + *MEMORY[0x1E4F1CF78], 0.0);
  int v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_2;
  v17[3] = &unk_1E53D8F80;
  uint64_t v5 = v2;
  uint64_t v6 = *(void *)(a1 + 64);
  id v18 = v5;
  uint64_t v19 = v6;
  id v7 = v4;
  int v8 = v17;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__5;
  v25[4] = __Block_byref_object_dispose__5;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __GetFailedKeysForProactiveLoad_block_invoke;
  v20[3] = &unk_1E53D9BC8;
  id v9 = v7;
  id v23 = v25;
  unint64_t v24 = v3;
  id v21 = v9;
  id v10 = v8;
  id v22 = v10;
  [v9 statementForKey:@"GetFailedKeysForProactiveLoad" statementBlock:v20];

  _Block_object_dispose(v25, 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_3;
  v14[3] = &unk_1E53D7C50;
  id v11 = *(NSObject **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v12;
  uint64_t v13 = v5;
  dispatch_async(v11, v14);
}

BOOL __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = a2 | (unint64_t)(a3 << 32);
  v7[1] = a4 | (unint64_t)(a5 << 32);
  [*(id *)(a1 + 32) addKey:v7];
  return (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 40);
}

uint64_t __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_5;
  block[3] = &unk_1E53DA028;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)_markExistingTileDataAsCurrentOnDBQueue:(int *)a3 reason:(unsigned int)a4 subscriptionIdentifier:(void *)a5
{
  id v8 = a5;
  int v9 = *a3;
  int v10 = a3[1];
  int v11 = a3[2];
  int v12 = a3[3];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  id v13 = a1[1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__GEOTileDB__markExistingTileDataAsCurrentOnDBQueue_reason_subscriptionIdentifier___block_invoke;
  v21[3] = &unk_1E53D8E90;
  void v21[4] = &v22;
  LookupTileRowForKey(v13, v9, v10, v11, v12, v21);
  if (v23[3] == -1) {
    goto LABEL_9;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v15 = (uint64_t)(Current + *MEMORY[0x1E4F1CF78]) & ~((uint64_t)(Current + *MEMORY[0x1E4F1CF78]) >> 63);
  uint64_t v16 = v23[3];
  id v17 = a1[1];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  id v33 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __MarkCurrent_block_invoke;
  v26[3] = &unk_1E53D9C68;
  id v18 = v17;
  id v27 = v18;
  id v28 = v32;
  unsigned int v31 = a4;
  uint64_t v29 = v15;
  uint64_t v30 = v16;
  LOBYTE(v16) = [v18 executeStatement:@"MarkCurrent" statementBlock:v26];

  _Block_object_dispose(v32, 8);
  if ((v16 & 1) == 0 || a4 <= 4 && ((1 << a4) & 0x13) != 0 && !UpdateAccessTime(a1[1], v23[3], v15))
  {
LABEL_9:
    uint64_t v19 = 0;
  }
  else
  {
    if ([v8 length]) {
      [a1 _markDataAtRow:v23[3] associatedWithSubscriptionIdentifier:v8];
    }
    uint64_t v19 = 1;
  }
  _Block_object_dispose(&v22, 8);

  return v19;
}

uint64_t __83__GEOTileDB__markExistingTileDataAsCurrentOnDBQueue_reason_subscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (int64_t)_insertDataRowForData:(id)a3 ETag:(id)a4 externalResourceUUID:(id)a5 timestamp:(int64_t *)a6 subscriptionIdentifier:(id)a7
{
  id v12 = a7;
  db = self->_db;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v16 data];
  uint64_t v18 = [v16 length];

  LODWORD(v16) = InsertData(db, v17, v14, v18, v15);
  if (v16)
  {
    int64_t v19 = [(GEOSQLiteDB *)self->_db lastInsertRowID];
    double v20 = self->_db;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__GEOTileDB__insertDataRowForData_ETag_externalResourceUUID_timestamp_subscriptionIdentifier___block_invoke;
    v22[3] = &unk_1E53D8FA8;
    void v22[4] = self;
    void v22[5] = v19;
    v22[6] = a6;
    [(GEOSQLiteDB *)v20 executeStatement:@"AddAccessTime" statementBlock:v22];
    if ([v12 length]) {
      [(GEOTileDB *)self _markDataAtRow:v19 associatedWithSubscriptionIdentifier:v12];
    }
  }
  else
  {
    int64_t v19 = -1;
  }

  return v19;
}

uint64_t __94__GEOTileDB__insertDataRowForData_ETag_externalResourceUUID_timestamp_subscriptionIdentifier___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 8) bindInt64Parameter:"@data_pk" toValue:a1[5] inStatement:a2 error:0];
  if (result)
  {
    uint64_t v5 = (void *)a1[6];
    uint64_t v6 = *(void **)(a1[4] + 8);
    if (v5)
    {
      if (([v6 bindInt64Parameter:"@timestamp" toValue:*v5 inStatement:a2 error:0] & 1) == 0) {
        return 0;
      }
    }
    else
    {
      uint64_t result = [v6 bindNullParameter:"@timestamp" inStatement:a2 error:0];
      if (!result) {
        return result;
      }
    }
    return 1;
  }
  return result;
}

- (void)_addDataOnDBQueueWithData:(void *)a3 key:(int *)a4 tileSet:(int)a5 ETag:(void *)a6 reason:(unsigned int)a7 externalResourceUUID:(void *)a8 subscriptionIdentifier:(void *)a9
{
  id v13 = a3;
  id v40 = a6;
  id v39 = a8;
  id v14 = a9;
  int v16 = *a4;
  int v15 = a4[1];
  int v18 = a4[2];
  int v17 = a4[3];
  uint64_t v19 = (uint64_t)(CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF78]);
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = -1;
  uint64_t v58 = v19;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  int v51 = __Block_byref_object_copy__5;
  uint64_t v52 = __Block_byref_object_dispose__5;
  id v53 = 0;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  double v20 = *(void **)(a1 + 8);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke;
  v43[3] = &unk_1E53D8FD0;
  v43[4] = &v54;
  v43[5] = &v48;
  v43[6] = &v44;
  id v21 = v20;
  uint64_t v22 = v43;
  uint64_t v73 = 0;
  long long v74 = &v73;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = __Block_byref_object_copy__5;
  uint64_t v77 = __Block_byref_object_dispose__5;
  id v78 = 0;
  uint64_t v59 = MEMORY[0x1E4F143A8];
  uint64_t v60 = 3221225472;
  uint64_t v61 = (uint64_t)__LookupTileInfoForKey_block_invoke;
  id v62 = &unk_1E53D9C40;
  id v23 = v21;
  id v63 = v23;
  uint64_t v65 = &v73;
  int v38 = v16;
  unint64_t v66 = __PAIR64__(v15, v16);
  int v24 = v15;
  int v67 = v18;
  int v68 = v17;
  uint64_t v25 = v22;
  long long v64 = v25;
  [v23 statementForKey:@"LookupTileInfoForKey" statementBlock:&v59];

  _Block_object_dispose(&v73, 8);
  if (a7 <= 4 && ((1 << a7) & 0x13) != 0) {
    goto LABEL_3;
  }
  if (qword_1EB29F4F0 != -1) {
    dispatch_once(&qword_1EB29F4F0, &__block_literal_global_10);
  }
  if (_MergedGlobals_184 && v55[3] != -1)
  {
    uint64_t v59 = 0;
    uint64_t v60 = (uint64_t)&v59;
    uint64_t v61 = 0x2020000000;
    LOBYTE(v62) = 0;
    uint64_t v73 = 0;
    long long v74 = &v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 0;
    uint64_t v36 = *(void **)(a1 + 8);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_3;
    v42[3] = &unk_1E53D8EB8;
    v42[4] = a1;
    void v42[5] = &v54;
    v42[6] = &v59;
    v42[7] = &v73;
    [v36 statementForKey:@"GetAccessTime" statementBlock:v42];
    if (*(unsigned char *)(v60 + 24))
    {
      uint64_t v58 = v74[3];
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v59, 8);
LABEL_3:
      id v26 = &v58;
      goto LABEL_4;
    }
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v59, 8);
  }
  id v26 = 0;
LABEL_4:
  uint64_t v27 = [(id)a1 _insertDataRowForData:v13 ETag:v40 externalResourceUUID:v39 timestamp:v26 subscriptionIdentifier:v14];
  if (v27 != -1)
  {
    id v28 = (void *)v49[5];
    if (v28)
    {
      uint64_t v29 = *(void **)(a1 + 136);
      uint64_t v30 = [v28 UUIDString];
      unsigned int v31 = [v29 URLByAppendingPathComponent:v30];

      [*(id *)(a1 + 8) deleteExternalResourceAtURL:v31 error:0];
      [*(id *)(a1 + 160) tileDBDidDeleteExternalResource:a1];
    }
    DeleteFailedTile(*(void **)(a1 + 8), v38, v24, v18, v17);
    if (*(unsigned char *)(a1 + 40))
    {
      [(id)a1 _decrementCalculatedTileDataSize:v45[3]];
      objc_msgSend((id)a1, "_incrementCalculatedTileDataSize:", objc_msgSend(v13, "length"));
    }
    uint64_t v32 = v58 & ~(v58 >> 63);
    id v33 = *(id *)(a1 + 8);
    uint64_t v73 = 0;
    long long v74 = &v73;
    uint64_t v75 = 0x3032000000;
    uint64_t v76 = __Block_byref_object_copy__5;
    uint64_t v77 = __Block_byref_object_dispose__5;
    id v78 = 0;
    uint64_t v59 = MEMORY[0x1E4F143A8];
    uint64_t v60 = 3221225472;
    uint64_t v61 = (uint64_t)__InsertTile_block_invoke;
    id v62 = &unk_1E53D9CE0;
    id v34 = v33;
    id v63 = v34;
    long long v64 = &v73;
    int v67 = v38;
    int v68 = v24;
    int v69 = v18;
    int v70 = v17;
    int v71 = a5;
    unsigned int v72 = a7;
    uint64_t v65 = (uint64_t *)v32;
    unint64_t v66 = v27;
    [v34 executeStatement:@"InsertTile" statementBlock:&v59];

    _Block_object_dispose(&v73, 8);
    uint64_t v35 = v55[3];
    if (v35 != -1) {
      DeleteData(*(void **)(a1 + 8), v35);
    }
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke(void *a1, uint64_t a2, id obj, uint64_t a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v7 = obj;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;

  return 0;
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_2()
{
  uint64_t result = GEOConfigGetBOOL(GeoServicesConfig_TileDBInsertPreserveExistingAccessTime, (uint64_t)off_1E91140F8);
  _MergedGlobals_184 = result;
  return result;
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_3(void *a1, sqlite3_stmt *a2)
{
  if (![*(id *)(a1[4] + 8) bindInt64Parameter:"@data_pk" toValue:*(void *)(*(void *)(a1[5] + 8) + 24) inStatement:a2 error:0]|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  int v4 = sqlite3_column_type(a2, 0);
  uint64_t v5 = *(void *)(a1[6] + 8);
  if (v4 == 5)
  {
    *(unsigned char *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    uint64_t v6 = 1;
    *(unsigned char *)(v5 + 24) = 1;
    *(void *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) int64ForColumn:0 inStatment:a2];
  }
  return v6;
}

- (void)_markDataAtRow:(int64_t)a3 associatedWithSubscriptionIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 length])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = -1;
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__GEOTileDB__markDataAtRow_associatedWithSubscriptionIdentifier___block_invoke;
    v12[3] = &unk_1E53D8E90;
    void v12[4] = &v13;
    GetSubscriptionPK(db, v6, v12);
    uint64_t v8 = v14[3];
    if (v8 == -1)
    {
      int v11 = GEOGetTileDBLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v9 = self->_db;
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3032000000;
      v17[3] = __Block_byref_object_copy__5;
      void v17[4] = __Block_byref_object_dispose__5;
      id v18 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      double v20 = __InsertSubscriptionDataRef_block_invoke;
      id v21 = &unk_1E53D9C90;
      int v10 = v9;
      uint64_t v22 = v10;
      id v23 = v17;
      uint64_t v24 = v8;
      int64_t v25 = a3;
      [(GEOSQLiteDB *)v10 executeStatement:@"InsertSubscriptionDataRef" statementBlock:&buf];

      _Block_object_dispose(v17, 8);
    }
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __65__GEOTileDB__markDataAtRow_associatedWithSubscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_markDataForTileKey:(int *)a3 associatedWithSubscriptionIdentifier:(void *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    int v7 = *a3;
    int v8 = a3[1];
    int v9 = a3[2];
    int v10 = a3[3];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = -1;
    int v11 = (void *)a1[1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__GEOTileDB__markDataForTileKey_associatedWithSubscriptionIdentifier___block_invoke;
    v14[3] = &unk_1E53D8E90;
    void v14[4] = &v15;
    LookupTileRowForKey(v11, v7, v8, v9, v10, v14);
    uint64_t v12 = v16[3];
    if (v12 == -1)
    {
      uint64_t v13 = GEOGetTileDBLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 68158211;
        int v21 = 8;
        __int16 v22 = 2097;
        id v23 = &v19;
        __int16 v24 = 2113;
        id v25 = v6;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_FAULT, "No cached data exists for key %{private,geo:TileKey}.*P. Cannot associate it with subscription '%{private}@'", buf, 0x1Cu);
      }
    }
    else
    {
      [a1 _markDataAtRow:v12 associatedWithSubscriptionIdentifier:v6];
    }
    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __70__GEOTileDB__markDataForTileKey_associatedWithSubscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_trackFailureOnDBQueueWithKey:(int *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  int v7 = *a3;
  int v8 = a3[1];
  int v9 = a3[2];
  int v10 = a3[3];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v12 = *(void **)(a1 + 8);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__GEOTileDB__trackFailureOnDBQueueWithKey_tileSet_shouldProactivelyLoad___block_invoke;
  v23[3] = &unk_1E53D9020;
  v23[4] = &v28;
  void v23[5] = &v24;
  id v13 = v12;
  id v14 = v23;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__5;
  id v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  id v34 = __LookupFailureInfo_block_invoke;
  uint64_t v35 = &unk_1E53D9C40;
  id v15 = v13;
  id v36 = v15;
  int v38 = &v45;
  int v39 = v7;
  int v40 = v8;
  int v41 = v9;
  int v42 = v10;
  uint64_t v16 = v14;
  int v37 = v16;
  [v15 statementForKey:@"LookupFailureInfo" statementBlock:&v32];
  unint64_t v17 = (unint64_t)(Current + *MEMORY[0x1E4F1CF78]);

  _Block_object_dispose(&v45, 8);
  uint64_t v18 = *(void **)(a1 + 8);
  BOOL v19 = (a5 & 1) != 0 || *((unsigned char *)v29 + 24) != 0;
  if (v25[3] > v17) {
    unint64_t v17 = v25[3];
  }
  id v20 = v18;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__5;
  id v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  id v34 = __InsertFailedTile_block_invoke;
  uint64_t v35 = &unk_1E53D9D30;
  id v21 = v20;
  id v36 = v21;
  int v37 = &v45;
  int v39 = v7;
  int v40 = v8;
  int v41 = v9;
  int v42 = v10;
  int v43 = a4;
  BOOL v44 = v19;
  int v38 = (uint64_t *)v17;
  [v21 executeStatement:@"InsertFailedTile" statementBlock:&v32];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

uint64_t __73__GEOTileDB__trackFailureOnDBQueueWithKey_tileSet_shouldProactivelyLoad___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return 0;
}

- (uint64_t)deleteDataForKey:(long long *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = *a3;
  id v3 = *(void **)(a1 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__GEOTileDB_deleteDataForKey___block_invoke;
  v5[3] = &unk_1E53D7FE8;
  v5[4] = a1;
  return [v3 executeAsync:v5];
}

void __30__GEOTileDB_deleteDataForKey___block_invoke(uint64_t a1)
{
  int v2 = [[_GEOTileDBDeleteTileOperation alloc] initWithTileKey:a1 + 40];
  [*(id *)(*(void *)(a1 + 32) + 16) prunePendingOperationsSupercededByOperation:v2];
  [(_GEOTileDBDeleteTileOperation *)v2 performWithDB:*(void *)(a1 + 32)];
}

- (void)_deleteDataOnDBQueueForKey:(int *)a3
{
  int v4 = *a3;
  int v5 = a3[1];
  int v6 = a3[2];
  int v7 = a3[3];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = -1;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__5;
  id v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  int v8 = *(void **)(a1 + 8);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__GEOTileDB__deleteDataOnDBQueueForKey___block_invoke;
  v18[3] = &unk_1E53D9048;
  void v18[4] = &v25;
  v18[5] = &v19;
  id v9 = v8;
  int v10 = v18;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__5;
  v37[4] = __Block_byref_object_dispose__5;
  id v38 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __LookupTileExternalDataUUIDForKey_block_invoke;
  v29[3] = &unk_1E53D9C40;
  id v11 = v9;
  id v30 = v11;
  uint64_t v32 = v37;
  int v33 = v4;
  int v34 = v5;
  int v35 = v6;
  int v36 = v7;
  uint64_t v12 = v10;
  id v31 = v12;
  [v11 statementForKey:@"LookupTileExternalDataUUIDForKey" statementBlock:v29];

  _Block_object_dispose(v37, 8);
  uint64_t v13 = v26[3];
  if (v13 != -1) {
    DeleteData(*(void **)(a1 + 8), v13);
  }
  DeleteFailedTile(*(void **)(a1 + 8), v4, v5, v6, v7);
  id v14 = (void *)v20[5];
  if (v14)
  {
    id v15 = *(void **)(a1 + 136);
    uint64_t v16 = [v14 UUIDString];
    unint64_t v17 = [v15 URLByAppendingPathComponent:v16];

    [*(id *)(a1 + 8) deleteExternalResourceAtURL:v17 error:0];
    [*(id *)(a1 + 160) tileDBDidDeleteExternalResource:a1];
  }
  *(unsigned char *)(a1 + 40) = 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __40__GEOTileDB__deleteDataOnDBQueueForKey___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

- (void)deleteDataForTilesets:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__GEOTileDB_deleteDataForTilesets___block_invoke;
  void v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeAsync:v7];
}

void __35__GEOTileDB_deleteDataForTilesets___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _flushPendingWrites];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntValue];
        char v10 = 0;
        [*(id *)(a1 + 32) _deleteTileSet:v8 deletedExternalResources:&v10];
        char v9 = v10 | v5;
        BOOL v5 = v9 != 0;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);

    if (v9) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "tileDBDidDeleteExternalResource:");
    }
  }
  else
  {
  }
}

- (void)flushPendingWritesWithGroup:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = v4;
  if (v4) {
    dispatch_group_enter(v4);
  }
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__GEOTileDB_flushPendingWritesWithGroup___block_invoke;
  v8[3] = &unk_1E53D8998;
  void v8[4] = self;
  char v9 = v5;
  int v7 = v5;
  [(GEOSQLiteDB *)db executeAsync:v8];
}

void __41__GEOTileDB_flushPendingWritesWithGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _flushPendingWrites];
  id v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

- (void)_flushPendingWrites
{
  uint64_t v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  writeQueue = self->_writeQueue;

  [(_GEOTileDBWriteQueue *)writeQueue flushPendingOperations:1];
}

- (void)evaluateDevicePostureAgainstCurrentManifest:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = v4;
  if (v4) {
    dispatch_group_enter(v4);
  }
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke;
  v10[3] = &unk_1E53D8998;
  void v10[4] = self;
  long long v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_3;
  v8[3] = &unk_1E53D9070;
  char v9 = v11;
  int v7 = v11;
  [(GEOSQLiteDB *)db executeAsync:v10 errorHandler:v8];
}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__5;
  long long v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__5;
  int v7 = __Block_byref_object_dispose__5;
  id v8 = 0;
  geo_isolate_sync_data();
  [*(id *)(a1 + 32) _invalidateTileSetsForNewDevicePostureCountry:v10[5] newDevicePostureRegion:v4[5] oldDevicePostureCountry:v10[5] oldDevicePostureRegion:v4[5]];
  id v2 = *(NSObject **)(a1 + 40);
  if (v2) {
    dispatch_group_leave(v2);
  }
  _Block_object_dispose(&v3, 8);

  _Block_object_dispose(&v9, 8);
}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 104));
  id v2 = *(void **)(a1[4] + 112);
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v3, v2);
}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

- (void)_updateDevicePosture
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEOCountryConfiguration *)self->_countryConfiguration countryCode];
  _postureRegion(self->_overrideLocale);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = _languageLocale(self->_overrideLocale);
  uint64_t v6 = (__CFString *)[v5 copy];

  int v7 = GEOGetTileDBLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138478083;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Setting device posture (country / region) to (%{private}@ / %{private}@)", buf, 0x16u);
  }

  if (!v6 || !v3 || !v4)
  {

    uint64_t v4 = @"US";
    uint64_t v6 = @"en:en_US";
    uint64_t v3 = @"US";
  }
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  int v34 = __Block_byref_object_copy__5;
  int v35 = __Block_byref_object_dispose__5;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__5;
  uint64_t v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__5;
  id v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  id v8 = v3;
  uint64_t v9 = v4;
  char v10 = v6;
  geo_isolate_sync_data();
  if ((v32[5] || v26[5])
    && (!-[__CFString isEqual:](v8, "isEqual:")
     || ([(__CFString *)v9 isEqual:v26[5]] & 1) == 0))
  {
    [(GEOTileDB *)self _invalidateTileSetsForNewDevicePostureCountry:v8 newDevicePostureRegion:v9 oldDevicePostureCountry:v32[5] oldDevicePostureRegion:v26[5]];
  }
  if (![(__CFString *)v8 isEqual:v32[5]]
    || ![(__CFString *)v9 isEqual:v26[5]]
    || ([(__CFString *)v10 isEqualToString:v20[5]] & 1) == 0)
  {
    uint64_t v11 = self->_db;
    long long v12 = v10;
    long long v13 = v8;
    id v14 = v9;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__5;
    v37[4] = __Block_byref_object_dispose__5;
    id v38 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __SetDevicePosture_block_invoke;
    int v40 = &unk_1E53D9D58;
    id v15 = v11;
    int v41 = v15;
    uint64_t v16 = v12;
    int v42 = v16;
    uint64_t v45 = v37;
    unint64_t v17 = v13;
    int v43 = v17;
    uint64_t v18 = v14;
    BOOL v44 = v18;
    [(GEOSQLiteDB *)v15 executeStatement:@"SetDevicePosture" statementBlock:buf];

    _Block_object_dispose(v37, 8);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __33__GEOTileDB__updateDevicePosture__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 112));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(void **)(v9 + 96);
  *(void *)(v9 + 96) = v8;
}

- (void)_invalidateTileSetsForNewDevicePostureCountry:(id)a3 newDevicePostureRegion:(id)a4 oldDevicePostureCountry:(id)a5 oldDevicePostureRegion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(GEOTileDB *)self _flushPendingWrites];
  if ([v10 isEqual:v12]) {
    char v14 = [v11 isEqualToString:v13] ^ 1;
  }
  else {
    char v14 = 1;
  }
  id v15 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __129__GEOTileDB__invalidateTileSetsForNewDevicePostureCountry_newDevicePostureRegion_oldDevicePostureCountry_oldDevicePostureRegion___block_invoke;
  v20[3] = &unk_1E53D90C0;
  id v21 = v10;
  id v22 = v11;
  char v26 = v14;
  id v23 = v12;
  id v24 = v13;
  uint64_t v25 = self;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 iterateActiveTileSets:v20];
}

void __129__GEOTileDB__invalidateTileSetsForNewDevicePostureCountry_newDevicePostureRegion_oldDevicePostureCountry_oldDevicePostureRegion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v6 = a2;
  if (([v6 isDisputedBordersAllowlistedForCountry:*(void *)(a1 + 32) region:*(void *)(a1 + 40)] & 1) != 0
    || *(unsigned char *)(a1 + 72)
    && [v6 isDisputedBordersAllowlistedForCountry:*(void *)(a1 + 48) region:*(void *)(a1 + 56)])
  {
    [*(id *)(a1 + 64) _invalidateTileSet:a4];
  }
}

- (void)_invalidateTileSet:(id)a3
{
  unsigned int var0 = a3.var0;
  [(GEOTileDB *)self _flushPendingWrites];
  uint64_t v5 = self->_db;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__5;
  void v13[4] = __Block_byref_object_dispose__5;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __InvalidateTileSet_block_invoke;
  v9[3] = &unk_1E53D9D80;
  id v6 = v5;
  unsigned int v12 = var0;
  id v10 = v6;
  id v11 = v13;
  [(GEOSQLiteDB *)v6 executeStatement:@"InvalidateTileSet" statementBlock:v9];

  _Block_object_dispose(v13, 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__GEOTileDB__invalidateTileSet___block_invoke;
  void v7[3] = &unk_1E53D90E8;
  void v7[4] = self;
  unsigned int v8 = var0;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v7);
}

uint64_t __32__GEOTileDB__invalidateTileSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateTileSubscriptionStatesForDataType:a2 dataSubtype:*(unsigned int *)(a1 + 40)];
}

- (BOOL)_deleteTileSet:(id)a3 deletedExternalResources:(BOOL *)a4
{
  unsigned int var0 = a3.var0;
  [(GEOTileDB *)self _flushPendingWrites];
  uint64_t v39 = 0;
  int v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  db = self->_db;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke;
  v30[3] = &unk_1E53D9110;
  v30[4] = &v35;
  v30[5] = &v31;
  unsigned int v8 = db;
  uint64_t v9 = v30;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__5;
  id v55 = __Block_byref_object_dispose__5;
  id v56 = 0;
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  uint64_t v45 = __CalculateSizeOfTileSet_block_invoke;
  uint64_t v46 = &unk_1E53D9DA8;
  id v10 = v8;
  unsigned int v50 = var0;
  uint64_t v47 = v10;
  id v49 = &v51;
  id v11 = v9;
  uint64_t v48 = v11;
  BOOL v12 = [(GEOSQLiteDB *)v10 statementForKey:@"CalculateSizeOfTileSet" statementBlock:&v43];

  _Block_object_dispose(&v51, 8);
  if (*((unsigned char *)v32 + 24))
  {
    id v13 = self->_db;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_2;
    v29[3] = &unk_1E53D8D00;
    void v29[4] = self;
    v29[5] = &v39;
    id v14 = v13;
    id v15 = v29;
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x3032000000;
    uint64_t v54 = __Block_byref_object_copy__5;
    id v55 = __Block_byref_object_dispose__5;
    id v56 = 0;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    uint64_t v45 = __GetExternalResourcesForTileSet_block_invoke;
    uint64_t v46 = &unk_1E53D9DA8;
    id v16 = v14;
    unsigned int v50 = var0;
    uint64_t v47 = v16;
    id v49 = &v51;
    id v17 = v15;
    uint64_t v48 = v17;
    [(GEOSQLiteDB *)v16 statementForKey:@"GetExternalResourcesForTileSet" statementBlock:&v43];

    _Block_object_dispose(&v51, 8);
  }
  id v18 = self->_db;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__5;
  id v55 = __Block_byref_object_dispose__5;
  id v56 = 0;
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  uint64_t v45 = __DeleteTileSet_block_invoke;
  uint64_t v46 = &unk_1E53D9D80;
  id v19 = v18;
  LODWORD(v49) = var0;
  uint64_t v47 = v19;
  uint64_t v48 = &v51;
  [(GEOSQLiteDB *)v19 executeStatement:@"DeleteTileSet" statementBlock:&v43];

  _Block_object_dispose(&v51, 8);
  id v20 = self->_db;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__5;
  id v55 = __Block_byref_object_dispose__5;
  id v56 = 0;
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  uint64_t v45 = __DeleteFailedTilesForTileSet_block_invoke;
  uint64_t v46 = &unk_1E53D9D80;
  id v21 = v20;
  LODWORD(v49) = var0;
  uint64_t v47 = v21;
  uint64_t v48 = &v51;
  [(GEOSQLiteDB *)v21 executeStatement:@"DeleteFailedTilesForTileSet" statementBlock:&v43];

  _Block_object_dispose(&v51, 8);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_3;
  v27[3] = &unk_1E53D90E8;
  v27[4] = self;
  unsigned int v28 = var0;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v27);
  if (v12)
  {
    if (self->_tileDataSizeIsValid)
    {
      unint64_t tileDataSize = self->_tileDataSize;
      unint64_t v23 = v36[3];
      BOOL v24 = tileDataSize >= v23;
      unint64_t v25 = tileDataSize - v23;
      if (v24)
      {
        self->_unint64_t tileDataSize = v25;
        if (!a4) {
          goto LABEL_11;
        }
      }
      else
      {
        self->_unint64_t tileDataSize = 0;
        if (!a4) {
          goto LABEL_11;
        }
      }
      goto LABEL_10;
    }
  }
  else
  {
    self->_tileDataSizeIsValid = 0;
  }
  if (a4) {
LABEL_10:
  }
    *a4 = *((unsigned char *)v40 + 24);
LABEL_11:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 != 0;
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
    uint64_t v4 = [a2 UUIDString];
    uint64_t v5 = [v3 URLByAppendingPathComponent:v4];

    [*(id *)(*(void *)(a1 + 32) + 8) deleteExternalResourceAtURL:v5 error:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateTileSubscriptionStatesForDataType:a2 dataSubtype:*(unsigned int *)(a1 + 40)];
}

- (void)_setEdition:(unsigned int)a3 forTileSet:(id)a4
{
  unsigned int var0 = a4.var0;
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v18 = a4.var0;
  editionsMap = self->_editionsMap;
  unsigned int v8 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  uint64_t v9 = [(NSMutableDictionary *)editionsMap objectForKeyedSubscript:v8];

  if (!v9)
  {
LABEL_6:
    id v13 = self->_db;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    void v19[4] = __Block_byref_object_dispose__5;
    id v20 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __SetEdition_block_invoke;
    id v22 = &unk_1E53D7A50;
    id v14 = v13;
    unint64_t v23 = v14;
    BOOL v24 = v19;
    unsigned int v25 = var0;
    int v26 = v5;
    [(GEOSQLiteDB *)v14 executeStatement:@"SetEdition" statementBlock:buf];

    _Block_object_dispose(v19, 8);
    id v15 = [NSNumber numberWithUnsignedInt:v5];
    id v16 = self->_editionsMap;
    id v17 = [NSNumber numberWithUnsignedInt:v18];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

    goto LABEL_7;
  }
  if ([v9 unsignedIntValue] != v5)
  {
    id v10 = GEOGetTileDBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = GEOTileDBTileSetShortDescription((unsigned __int8 *)&v18);
      int v12 = [v9 unsignedIntValue];
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v5;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "Tile edition upgrade for tileSet %@: %d=>%d", buf, 0x18u);
    }
    unsigned int var0 = v18;
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)_dropAllTileData
{
  [(GEOTileDB *)self _flushPendingWrites];
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__GEOTileDB__dropAllTileData__block_invoke;
  v6[3] = &unk_1E53D9160;
  void v6[4] = self;
  void v6[5] = &v7;
  BOOL v4 = [(GEOSQLiteDB *)db executeInTransaction:v6];
  self->_tileDataSizeIsValid = 1;
  self->_unint64_t tileDataSize = 0;
  if (*((unsigned char *)v8 + 24)) {
    [(GEOObserverHashTable *)self->_observers tileDBDidDeleteExternalResource:self];
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __29__GEOTileDB__dropAllTileData__block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v11[2] = __29__GEOTileDB__dropAllTileData__block_invoke_2;
  v11[3] = &unk_1E53D8D00;
  long long v12 = v2;
  id v4 = v3;
  uint64_t v5 = v11;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__5;
  void v17[4] = __Block_byref_object_dispose__5;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __GetAllTileExternalResources_block_invoke;
  v13[3] = &unk_1E53D7C78;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = v5;
  id v15 = v7;
  id v16 = v17;
  [v6 statementForKey:@"GetAllTileExternalResources" statementBlock:v13];

  _Block_object_dispose(v17, 8);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"DeleteAllTiles" statementBlock:&__block_literal_global_1174];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__GEOTileDB__dropAllTileData__block_invoke_3;
  v10[3] = &unk_1E53D9138;
  void v10[4] = *(void *)(a1 + 32);
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v10);
  return v8;
}

uint64_t __29__GEOTileDB__dropAllTileData__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
    id v4 = [a2 UUIDString];
    uint64_t v5 = [v3 URLByAppendingPathComponent:v4];

    [*(id *)(*(void *)(a1 + 32) + 8) deleteExternalResourceAtURL:v5 error:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

void __29__GEOTileDB__dropAllTileData__block_invoke_3(uint64_t a1, int a2)
{
}

- (void)_invalidateAllTileData
{
  [(_GEOTileDBWriteQueue *)self->_writeQueue dropAllPendingOperations];
  [(GEOSQLiteDB *)self->_db executeStatement:@"InvalidateAllData" statementBlock:&__block_literal_global_1179];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__GEOTileDB__invalidateAllTileData__block_invoke;
  v3[3] = &unk_1E53D9138;
  v3[4] = self;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v3);
}

void __35__GEOTileDB__invalidateAllTileData__block_invoke(uint64_t a1, int a2)
{
}

- (void)_invalidateTileSubscriptionStatesForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4
{
  id v6 = self->_db;
  v15[0] = 0;
  v15[1] = v15;
  void v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__5;
  v15[4] = __Block_byref_object_dispose__5;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __BulkUpdateSubscriptionDataState_block_invoke;
  v8[3] = &unk_1E53D9DF8;
  uint64_t v7 = v6;
  uint64_t v9 = v7;
  char v10 = v15;
  unsigned int v12 = a3;
  unsigned int v13 = a4;
  uint64_t v11 = 1;
  char v14 = 0;
  [(GEOSQLiteDB *)v7 executeStatement:@"BulkUpdateSubscriptionDataState" statementBlock:v8];

  _Block_object_dispose(v15, 8);
}

- (void)_invalidatedTilesReferencedBySubscription:(int64_t)a3 tileSet:(unsigned int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__GEOTileDB__invalidatedTilesReferencedBySubscription_tileSet___block_invoke;
  v4[3] = &unk_1E53D9188;
  void v4[4] = self;
  void v4[5] = a3;
  unsigned int v5 = a4;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v4);
}

void __63__GEOTileDB__invalidatedTilesReferencedBySubscription_tileSet___block_invoke(uint64_t a1, int a2)
{
}

- (void)evictVeryOldTilesWithGroup:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4) {
    dispatch_group_enter(v4);
  }
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke;
  v10[3] = &unk_1E53D8998;
  void v10[4] = self;
  uint64_t v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke_2;
  v8[3] = &unk_1E53D9070;
  uint64_t v9 = v11;
  uint64_t v7 = v11;
  [(GEOSQLiteDB *)db executeAsync:v10 errorHandler:v8];
}

void __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _evictVeryOldTiles:0];
  long long v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

void __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

- (void)_evictVeryOldTiles:(BOOL *)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v6 = *MEMORY[0x1E4F1CF78];
  unint64_t v7 = (unint64_t)(Current + -15552000.0 + *MEMORY[0x1E4F1CF78]);
  [(GEOTileDB *)self _invalidateSubscriptionsReferencingTilesOlderThan:v7 forTileSet:0];
  uint64_t v24 = 0;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  db = self->_db;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __32__GEOTileDB__evictVeryOldTiles___block_invoke;
  id v21 = &unk_1E53D8D00;
  id v22 = self;
  unint64_t v23 = &v24;
  uint64_t v9 = db;
  char v10 = &v18;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__5;
  int v40 = __Block_byref_object_dispose__5;
  id v41 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = __GetOldTileExternalResources_block_invoke;
  uint64_t v31 = &unk_1E53D9BC8;
  uint64_t v11 = v9;
  char v34 = &v36;
  unint64_t v35 = v7;
  uint64_t v32 = v11;
  unsigned int v12 = v10;
  uint64_t v33 = v12;
  [(GEOSQLiteDB *)v11 statementForKey:@"GetOldTileExternalResources", &v28, v18, v19, v20, v21, v22, v23 statementBlock];

  _Block_object_dispose(&v36, 8);
  unsigned int v13 = self->_db;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__5;
  int v40 = __Block_byref_object_dispose__5;
  id v41 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = __DeleteOldTileData_block_invoke;
  uint64_t v31 = &unk_1E53D7A50;
  char v14 = v13;
  uint64_t v33 = &v36;
  char v34 = (uint64_t *)v7;
  uint64_t v32 = v14;
  [(GEOSQLiteDB *)v14 executeStatement:@"DeleteOldTileData" statementBlock:&v28];

  _Block_object_dispose(&v36, 8);
  unint64_t v15 = (unint64_t)(v6 + CFAbsoluteTimeGetCurrent() + -1209600.0);
  id v16 = self->_db;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__5;
  int v40 = __Block_byref_object_dispose__5;
  id v41 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = __DeleteOldFailedTiles_block_invoke;
  uint64_t v31 = &unk_1E53D7A50;
  id v17 = v16;
  uint64_t v33 = &v36;
  char v34 = (uint64_t *)v15;
  uint64_t v32 = v17;
  [(GEOSQLiteDB *)v17 executeStatement:@"DeleteOldFailedTiles" statementBlock:&v28];

  _Block_object_dispose(&v36, 8);
  self->_tileDataSizeIsValid = 0;
  if (a3) {
    *a3 = *((unsigned char *)v25 + 24);
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __32__GEOTileDB__evictVeryOldTiles___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
    id v4 = [a2 UUIDString];
    unsigned int v5 = [v3 URLByAppendingPathComponent:v4];

    [*(id *)(*(void *)(a1 + 32) + 8) deleteExternalResourceAtURL:v5 error:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

- (void)_invalidateSubscriptionsReferencingTilesOlderThan:(unint64_t)a3 forTileSet:(id *)a4
{
  unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  db = self->_db;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__GEOTileDB__invalidateSubscriptionsReferencingTilesOlderThan_forTileSet___block_invoke;
  v23[3] = &unk_1E53D91B0;
  uint64_t v26 = a4;
  id v10 = v7;
  id v24 = v10;
  id v11 = v8;
  id v25 = v11;
  unsigned int v12 = db;
  unsigned int v13 = v23;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__5;
  v35[4] = __Block_byref_object_dispose__5;
  id v36 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __FindSubscriptionsReferencingOldTiles_block_invoke;
  id v30 = &unk_1E53D9BC8;
  char v14 = v12;
  uint64_t v33 = v35;
  unint64_t v34 = a3;
  uint64_t v31 = v14;
  unint64_t v15 = v13;
  id v32 = v15;
  [(GEOSQLiteDB *)v14 statementForKey:@"FindSubscriptionsReferencingOldTiles" statementBlock:buf];

  _Block_object_dispose(v35, 8);
  uint64_t v16 = [v10 count];
  if (v16 != [v11 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionPKs.count == subscriptionTileSets.count", buf, 2u);
  }
  uint64_t v17 = [v10 count];
  if (v17 == [v11 count] && objc_msgSend(v10, "count"))
  {
    unint64_t v18 = 0;
    do
    {
      uint64_t v19 = [v10 objectAtIndexedSubscript:v18];
      uint64_t v20 = [v19 longLongValue];

      id v21 = [v11 objectAtIndexedSubscript:v18];
      uint64_t v22 = [v21 unsignedIntValue];

      [(GEOTileDB *)self _invalidatedTilesReferencedBySubscription:v20 tileSet:v22];
      ++v18;
    }
    while (v18 < [v10 count]);
  }
}

uint64_t __74__GEOTileDB__invalidateSubscriptionsReferencingTilesOlderThan_forTileSet___block_invoke(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  double v6 = (_DWORD *)a1[6];
  if (!v6)
  {
    if (!a4) {
      return 1;
    }
    goto LABEL_4;
  }
  if (*v6 == a3 && (a4 & 1) != 0)
  {
LABEL_4:
    unint64_t v7 = (void *)a1[4];
    uint64_t v8 = [NSNumber numberWithLongLong:a2];
    [v7 addObject:v8];

    uint64_t v9 = (void *)a1[5];
    id v10 = [NSNumber numberWithUnsignedInt:a3];
    [v9 addObject:v10];
  }
  return 1;
}

- (void)_invalidateSubscriptionsReferencingOldestTilesWithLimit:(unint64_t)a3
{
  unsigned int v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [MEMORY[0x1E4F1CA48] array];
  db = self->_db;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  unint64_t v23 = __69__GEOTileDB__invalidateSubscriptionsReferencingOldestTilesWithLimit___block_invoke;
  id v24 = &unk_1E53D91D8;
  id v8 = v5;
  id v25 = v8;
  id v9 = v6;
  id v26 = v9;
  id v10 = db;
  id v11 = &v21;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__5;
  v35[4] = __Block_byref_object_dispose__5;
  id v36 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __FindSubscriptionsReferencingOldestNTiles_block_invoke;
  id v30 = &unk_1E53D9BC8;
  unsigned int v12 = v10;
  uint64_t v33 = v35;
  unint64_t v34 = a3;
  uint64_t v31 = v12;
  unsigned int v13 = v11;
  id v32 = v13;
  [(GEOSQLiteDB *)v12 statementForKey:@"FindSubscriptionsReferencingOldestNTiles", buf, v21, v22, v23, v24 statementBlock];

  _Block_object_dispose(v35, 8);
  uint64_t v14 = [v8 count];
  if (v14 != [v9 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionPKs.count == subscriptionTileSets.count", buf, 2u);
  }
  uint64_t v15 = [v8 count];
  if (v15 == [v9 count] && objc_msgSend(v8, "count"))
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v8 objectAtIndexedSubscript:v16];
      uint64_t v18 = [v17 longLongValue];

      uint64_t v19 = [v9 objectAtIndexedSubscript:v16];
      uint64_t v20 = [v19 unsignedIntValue];

      [(GEOTileDB *)self _invalidatedTilesReferencedBySubscription:v18 tileSet:v20];
      ++v16;
    }
    while (v16 < [v8 count]);
  }
}

uint64_t __69__GEOTileDB__invalidateSubscriptionsReferencingOldestTilesWithLimit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    double v6 = *(void **)(a1 + 32);
    unint64_t v7 = [NSNumber numberWithLongLong:a2];
    [v6 addObject:v7];

    id v8 = *(void **)(a1 + 40);
    id v9 = [NSNumber numberWithUnsignedInt:a3];
    [v8 addObject:v9];
  }
  return 1;
}

- (void)_enumerateAllKeysOnQueueIncludingData:(BOOL)a3 dataHandler:(id)a4 callbackQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke;
  v17[3] = &unk_1E53D9228;
  BOOL v20 = a3;
  void v17[4] = self;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  unsigned int v13 = db;
  uint64_t v14 = v17;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__5;
  v25[4] = __Block_byref_object_dispose__5;
  id v26 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __GetDataForAllKeys_block_invoke;
  v21[3] = &unk_1E53D7C78;
  uint64_t v15 = v13;
  uint64_t v22 = v15;
  unint64_t v16 = v14;
  id v23 = v16;
  id v24 = v25;
  [(GEOSQLiteDB *)v15 statementForKey:@"GetDataForAllKeys" statementBlock:v21];

  _Block_object_dispose(v25, 8);
}

uint64_t __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, unint64_t a7, void *a8, void *a9, char a10, __int16 a11, char a12)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v17 = a8;
  id v18 = a9;
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v20 = (double *)MEMORY[0x1E4F1CF78];
  uint64_t v37 = v17;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v21 = v17;
    if (!v17)
    {
      id v22 = [MEMORY[0x1E4F1C9B8] data];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = v21;
LABEL_6:
  id v23 = v22;
  double v24 = *v20;
  if (v22) {
    id v25 = [[GEOTileData alloc] initWithData:v22];
  }
  else {
    id v25 = 0;
  }
  double v26 = Current + v24 - (double)a7;
  unint64_t v27 = a4 | (unint64_t)(a5 << 32);
  char v28 = a10 & ~[*(id *)(a1 + 32) _isTileSetTTLExpired:a6 age:v26];
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke_2;
  block[3] = &unk_1E53D9200;
  uint64_t v46 = &v38;
  uint64_t v29 = *(NSObject **)(a1 + 40);
  id v30 = *(id *)(a1 + 48);
  id v44 = v18;
  id v45 = v30;
  unint64_t v48 = a2 | (unint64_t)(a3 << 32);
  unint64_t v49 = v27;
  char v50 = v28;
  uint64_t v43 = v25;
  char v51 = a12;
  double v47 = v26;
  id v31 = v18;
  id v32 = v25;
  dispatch_sync(v29, block);
  uint64_t v33 = *((unsigned __int8 *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  return v33;
}

uint64_t __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_group_enter(v11);
  db = self->_db;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke;
  v19[3] = &unk_1E53D9250;
  BOOL v23 = a3;
  id v22 = v12;
  void v19[4] = self;
  id v20 = v10;
  uint64_t v21 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2;
  v17[3] = &unk_1E53D9070;
  id v18 = v21;
  uint64_t v14 = v21;
  id v15 = v10;
  id v16 = v12;
  [(GEOSQLiteDB *)db executeAsync:v19 errorHandler:v17];
}

void __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _flushPendingWrites];
  [*(id *)(a1 + 32) _enumerateAllKeysOnQueueIncludingData:*(unsigned __int8 *)(a1 + 64) dataHandler:*(void *)(a1 + 56) callbackQueue:*(void *)(a1 + 40)];
  long long v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2(uint64_t a1)
{
}

- (id)_allFullyDownloadedOfflineSubscriptions
{
  uint64_t v3 = [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration activeVersions];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke;
    v11[3] = &unk_1E53D9278;
    id v12 = v4;
    id v6 = v4;
    FetchSubscriptions(db, 0, v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_2;
    v9[3] = &unk_1E53D92C8;
    void v9[4] = self;
    id v10 = v3;
    unint64_t v7 = objc_msgSend(v6, "_geo_filtered:", v9);
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  if ((a5 & 0x400) != 0)
  {
    unsigned int v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithLongLong:a2];
    [v5 addObject:v6];
  }
  return 1;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5;
  BOOL v23 = __Block_byref_object_dispose__5;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = [v3 longLongValue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_3;
  void v16[3] = &unk_1E53D92A0;
  id v17 = *(id *)(a1 + 40);
  id v18 = &v19;
  GetSubscriptionDataStates(v4, v5, v16);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if ((objc_msgSend((id)v20[5], "containsObject:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12) & 1) == 0)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_3(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a2 & 0x400) != 0)
  {
    if (a5)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        long long v12 = [NSNumber numberWithUnsignedInt:a3];
        long long v13 = [v11 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 unsignedLongLongValue];

        if (v14 == a4)
        {
          long long v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v16 = [NSNumber numberWithUnsignedInt:a3];
          [v15 addObject:v16];
        }
      }
    }
  }
  return 1;
}

- (void)_enumerateSubscriptionExpirationDates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval, (uint64_t)off_1E91157E8);
  uint64_t v7 = GEOConfigGetUint64(GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval, (uint64_t)off_1E91157F8);
  uint64_t v8 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
  uint64_t v9 = [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration lastUpdatedDate];
  uint64_t v10 = v9;
  unint64_t v11 = -1;
  if (v9 && v8)
  {
    long long v12 = [v9 dateByAddingTimeInterval:(double)(unint64_t)v8];
    [v12 timeIntervalSince1970];
    unint64_t v11 = (unint64_t)v13;
  }
  uint64_t v14 = [(GEOTileDB *)self _allFullyDownloadedOfflineSubscriptions];
  db = self->_db;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __51__GEOTileDB__enumerateSubscriptionExpirationDates___block_invoke;
  id v25 = &unk_1E53D92F0;
  uint64_t v28 = Uint64;
  uint64_t v29 = v7;
  unint64_t v30 = v11;
  id v16 = v14;
  id v26 = v16;
  id v17 = v4;
  id v27 = v17;
  id v18 = db;
  uint64_t v19 = &v22;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__5;
  v35[4] = __Block_byref_object_dispose__5;
  id v36 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __GetAllSubscriptionTimestamps_block_invoke;
  v31[3] = &unk_1E53D7C78;
  id v20 = v18;
  id v32 = v20;
  uint64_t v21 = v19;
  uint64_t v33 = v21;
  unint64_t v34 = v35;
  [(GEOSQLiteDB *)v20 statementForKey:@"GetAllSubscriptionTimestamps", v31, v22, v23, v24, v25 statementBlock];

  _Block_object_dispose(v35, 8);
}

uint64_t __51__GEOTileDB__enumerateSubscriptionExpirationDates___block_invoke(void *a1, uint64_t a2, void *a3, __int16 a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13 = a3;
  if ((a4 & 0x400) != 0)
  {
    if (GEOConfigGetBOOL(GeoOfflineConfig_OptimizeStorageEnabled, (uint64_t)off_1E91157D8))
    {
      uint64_t v15 = 6;
      if (a7)
      {
        uint64_t v16 = a7;
      }
      else
      {
        uint64_t v15 = 7;
        uint64_t v16 = a6;
      }
      unint64_t v14 = a1[v15] + v16;
    }
    else
    {
      unint64_t v14 = -1;
    }
    if (a1[8] != -1)
    {
      id v17 = (void *)a1[4];
      id v18 = [NSNumber numberWithLongLong:a2];
      if ([v17 containsObject:v18])
      {
        if (v14 == -1)
        {
        }
        else
        {
          unint64_t v19 = a1[8];

          if (v19 >= v14) {
            goto LABEL_17;
          }
        }
        unint64_t v14 = a1[8];
      }
      else
      {
      }
    }
  }
  else
  {
    unint64_t v14 = -1;
  }
LABEL_17:
  if (a5)
  {
    double v20 = *MEMORY[0x1E4F1CF78] + (double)a5;
    if (v14 == -1 || v14 > (unint64_t)v20) {
      unint64_t v14 = (unint64_t)v20;
    }
  }
  if (v14 != -1) {
    (*(void (**)(double))(a1[5] + 16))((double)v14 - *MEMORY[0x1E4F1CF78]);
  }

  return 1;
}

- (void)_removeExpiredSubscriptions
{
  id v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke;
  v5[3] = &unk_1E53D8B98;
  v5[4] = self;
  [(GEOSQLiteDB *)db ensureInTransaction:v5];
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  unint64_t v49 = [MEMORY[0x1E4F1CA48] array];
  id v56 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v58 = [MEMORY[0x1E4F1CA60] dictionary];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  long long v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = *(void **)(a1 + 32);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2;
  v81[3] = &unk_1E53D9318;
  CFAbsoluteTime v84 = Current;
  id v5 = v2;
  id v82 = v5;
  id v55 = v3;
  id v83 = v55;
  [v4 _enumerateSubscriptionExpirationDates:v81];
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__5;
  v79[4] = __Block_byref_object_dispose__5;
  id v80 = 0;
  if ([v5 count])
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 8);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_581;
    v78[3] = &unk_1E53D9340;
    v78[4] = v79;
    ReadGlobalOfflineMetadata(v6, v78);
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
  if (!v7)
  {
    LOBYTE(v57) = 0;
    goto LABEL_20;
  }
  int v57 = 0;
  uint64_t v53 = *(void *)v75;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v75 != v53) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      uint64_t v10 = [v9 unsignedLongLongValue];
      uint64_t v68 = 0;
      int v69 = &v68;
      uint64_t v70 = 0x3032000000;
      int v71 = __Block_byref_object_copy__5;
      unsigned int v72 = __Block_byref_object_dispose__5;
      id v73 = 0;
      unint64_t v11 = *(void **)(*(void *)(a1 + 32) + 8);
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_583;
      v67[3] = &unk_1E53D9368;
      v67[4] = &v68;
      v67[5] = v79;
      id v12 = v11;
      id v13 = v67;
      v85[0] = 0;
      v85[1] = v85;
      v85[2] = 0x3032000000;
      v85[3] = __Block_byref_object_copy__5;
      v85[4] = __Block_byref_object_dispose__5;
      id v86 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v90 = __FetchSubscriptionForPK_block_invoke;
      int v91 = &unk_1E53D9BC8;
      id v14 = v12;
      uint64_t v94 = v85;
      uint64_t v95 = v10;
      id v92 = v14;
      uint64_t v15 = v13;
      id v93 = v15;
      [v14 statementForKey:@"FetchSubscriptionForPK" statementBlock:&buf];

      _Block_object_dispose(v85, 8);
      uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
      id v17 = [(id)v69[5] identifier];
      LOBYTE(v16) = RemoveSubscription(v16, 0, v17);

      if (v16)
      {
        uint64_t v18 = [(id)v69[5] policy];
        unint64_t v19 = v56;
        if (!v18) {
          goto LABEL_12;
        }
        if (v18 == 1)
        {
          unint64_t v19 = v49;
LABEL_12:
          [v19 addObject:v69[5]];
        }
        double v20 = [v55 objectForKeyedSubscript:v9];
        uint64_t v21 = [v20 integerValue];

        uint64_t v22 = [NSNumber numberWithInteger:v21];
        uint64_t v23 = [v58 objectForKeyedSubscript:v22];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          id v25 = [MEMORY[0x1E4F1CA48] array];
          id v26 = [NSNumber numberWithInteger:v21];
          [v58 setObject:v25 forKeyedSubscript:v26];
        }
        id v27 = [NSNumber numberWithInteger:v21];
        uint64_t v28 = [v58 objectForKeyedSubscript:v27];
        [v28 addObject:v69[5]];

        v57 |= ((unint64_t)[(id)v69[5] dataTypes] >> 10) & 1;
      }
      _Block_object_dispose(&v68, 8);
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
  }
  while (v7);
LABEL_20:

  if ([v56 count])
  {
    uint64_t v29 = GEOGetTileDBLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v56 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_INFO, "Expired %llu opportunistic subscriptions", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([v49 count])
  {
    id v31 = GEOGetTileDBLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = [v49 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v32;
      _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_INFO, "Expired %llu user-initiated subscriptions", (uint8_t *)&buf, 0xCu);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v51 = v49;
    uint64_t v33 = [v51 countByEnumeratingWithState:&v63 objects:v87 count:16];
    if (v33)
    {
      uint64_t v52 = *(void *)v64;
      while (2)
      {
        uint64_t v34 = 0;
        uint64_t v54 = v33;
        do
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v51);
          }
          unint64_t v35 = *(void **)(*((void *)&v63 + 1) + 8 * v34);
          id v36 = [v35 regulatoryRegionID];
          int v37 = [v36 unsignedIntValue];

          uint64_t v38 = *(void **)(*(void *)(a1 + 32) + 8);
          uint64_t v39 = [v35 identifier];
          uint64_t v40 = [v35 _originatingBundleIdentifier];
          uint64_t v41 = [v35 dataTypes];
          uint64_t v42 = [v35 policy];
          uint64_t v43 = [v35 region];
          id v44 = [v43 data];
          id v45 = [v35 displayName];
          LOBYTE(v37) = InsertExpiredSubscription(v38, v39, v40, v41, v42, v44, v45, v37);

          if ((v37 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: InsertExpiredSubscription(_db, ((void *)0), subscription.identifier, subscription.originatingBundleIdentifier, (uint64_t)subscription.dataTypes, (uint64_t)subscription.policy, subscription.region.data, subscription.displayName, regulatoryRegionID)", (uint8_t *)&buf, 2u);
            }

            uint64_t v47 = 0;
            goto LABEL_42;
          }
          ++v34;
        }
        while (v54 != v34);
        uint64_t v33 = [v51 countByEnumeratingWithState:&v63 objects:v87 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
  }
  if ([v56 count] || objc_msgSend(v49, "count"))
  {
    if (v57) {
      [*(id *)(a1 + 32) _cleanUpDataForRemovedOfflineSubscriptionsWithError:0];
    }
    objc_initWeak((id *)&buf, *(id *)(a1 + 32));
    uint64_t v46 = *(void **)(*(void *)(a1 + 32) + 8);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_586;
    v60[3] = &unk_1E53D93B8;
    objc_copyWeak(&v62, (id *)&buf);
    id v61 = v58;
    [v46 addTransactionPostCommitAction:v60];

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)&buf);
  }
  uint64_t v47 = 1;
LABEL_42:
  _Block_object_dispose(v79, 8);

  return v47;
}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (*(double *)(a1 + 48) > a5)
  {
    switch(a4)
    {
      case 1:
        uint64_t v10 = GEOGetTileDBLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_DWORD *)id v17 = 141558275;
        *(void *)&void v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(void *)&v17[14] = v9;
        unint64_t v11 = "Will expire subscription '%{private,mask.hash}@' because its expirationDate has passed";
        break;
      case 2:
        uint64_t v10 = GEOGetTileDBLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_DWORD *)id v17 = 141558275;
        *(void *)&void v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(void *)&v17[14] = v9;
        unint64_t v11 = "Will expire subscription '%{private,mask.hash}@' because it hasn't been used recently";
        break;
      case 3:
        uint64_t v10 = GEOGetTileDBLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_DWORD *)id v17 = 141558275;
        *(void *)&void v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(void *)&v17[14] = v9;
        unint64_t v11 = "Will expire subscription '%{private,mask.hash}@' because it was never used";
        break;
      case 6:
        uint64_t v10 = GEOGetTileDBLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_DWORD *)id v17 = 141558275;
        *(void *)&void v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(void *)&v17[14] = v9;
        unint64_t v11 = "Will expire subscription '%{private,mask.hash}@' because it has not been updated within the required interval";
        break;
      default:
        goto LABEL_13;
    }
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, v11, v17, 0x16u);
LABEL_12:

LABEL_13:
    id v12 = *(void **)(a1 + 32);
    id v13 = objc_msgSend(NSNumber, "numberWithLongLong:", a2, *(_OWORD *)v17, *(void *)&v17[16], v18);
    [v12 addObject:v13];

    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = [NSNumber numberWithInteger:a4];
    uint64_t v16 = [NSNumber numberWithLongLong:a2];
    [v14 setObject:v15 forKey:v16];
  }
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_581(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_583(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  unint64_t v19 = [[GEOMapRegion alloc] initWithData:v16];

  double v20 = [[GEOMapDataSubscription alloc] initWithIdentifier:v18 originatingBundleIdentifier:v17 dataTypes:a5 policy:a6 expirationDate:0 region:v19 displayName:v15 regulatoryRegionID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  return 1;
}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_586(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cleanUpDeletedExternalDataIfNecessary];
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_587;
    v5[3] = &unk_1E53D9390;
    v5[4] = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_587(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "tileDB:didExpireSubscriptions:forReason:", *(void *)(a1 + 32), v5, objc_msgSend(a2, "integerValue"));
}

- (void)_supportsOfflineDidChange:(id)a3
{
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__GEOTileDB__supportsOfflineDidChange___block_invoke;
  v4[3] = &unk_1E53D79D8;
  void v4[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v4];
}

uint64_t __39__GEOTileDB__supportsOfflineDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireOfflineSubscriptionsForRegulatoryRegionIfNecessary];
}

- (void)_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary
{
  uint64_t v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(GEOOfflineDataConfiguration *)self->_offlineDataConfiguration regulatoryRegionID];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke;
  v11[3] = &unk_1E53D9340;
  void v11[4] = &v12;
  ReadGlobalOfflineMetadata(db, v11);
  BOOL v6 = GEOSupportsOfflineMaps();
  if (v4 != *((_DWORD *)v13 + 6) || !v6)
  {
    uint64_t v8 = self->_db;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2;
    v9[3] = &unk_1E53D9450;
    void v9[4] = self;
    void v9[5] = &v12;
    unsigned int v10 = v4;
    [(GEOSQLiteDB *)v8 ensureInTransaction:v9];
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [MEMORY[0x1E4F1CA48] array];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_3;
  v45[3] = &unk_1E53D93E0;
  uint64_t v47 = *(void *)(a1 + 40);
  id v32 = v1;
  id v46 = v32;
  id v3 = v2;
  unsigned int v4 = v45;
  uint64_t v48 = 0;
  unint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__5;
  uint64_t v52 = __Block_byref_object_dispose__5;
  id v53 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v56 = __RemoveAllSubscriptionsForDataType_block_invoke;
  int v57 = &unk_1E53D9BC8;
  id v5 = v3;
  uint64_t v60 = &v48;
  uint64_t v61 = 1024;
  id v58 = v5;
  BOOL v6 = v4;
  uint64_t v59 = v6;
  LOBYTE(v4) = [v5 statementForKey:@"RemoveAllSubscriptionsForDataType" statementBlock:&buf];

  _Block_object_dispose(&v48, 8);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: RemoveAllSubscriptionsForDataType(_db, ((void *)0), (uint64_t)GEOMapDataSubscriptionDataTypeOffline, ^BOOL(int64_t rowid, NSString *identifier, NSString *originating_bundle_id, uint64_t data_types, uint64_t policy, uint64_t expiration_timestamp, NSData *map_region, NSString *display_name, uint64_t insert_timestamp) { GEOMapRegion *region = [[GEOMapRegion alloc] initWithData:map_region]; GEOMapDataSubscription *subscription = ["
        "[GEOMapDataSubscription alloc] initWithIdentifier:identifier originatingBundleIdentifier:originating_bundle_id d"
        "ataTypes:(GEOMapDataSubscriptionDataType)data_types policy:(GEOMapDataSubscriptionPolicy)policy expirationDate:("
        "(void *)0) region:region displayName:display_name regulatoryRegionID:@(existingRegulatoryRegionID)]; [expiredSub"
        "scriptions addObject:subscription]; return __objc_yes; })",
        (uint8_t *)&buf,
        2u);
    }

    goto LABEL_25;
  }

  int v7 = *(_DWORD *)(a1 + 48);
  id v8 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v48 = 0;
  unint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__5;
  uint64_t v52 = __Block_byref_object_dispose__5;
  id v53 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v56 = __SetGlobalOfflineMetadata_block_invoke;
  int v57 = &unk_1E53D9D80;
  id v9 = v8;
  LODWORD(v60) = v7;
  id v58 = v9;
  uint64_t v59 = &v48;
  char v10 = [v9 executeStatement:@"SetGlobalOfflineMetadata" statementBlock:&buf];

  _Block_object_dispose(&v48, 8);
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: SetGlobalOfflineMetadata(_db, ((void *)0), regulatoryRegionID)", (uint8_t *)&buf, 2u);
    }
LABEL_25:
    uint64_t v30 = 0;
    goto LABEL_19;
  }
  if ([v32 count])
  {
    int v11 = *(_DWORD *)(a1 + 48);
    int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v13 = GEOGetTileDBLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11 == v12)
    {
      if (v14)
      {
        uint64_t v15 = [v32 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v15;
        id v16 = "Removed %llu subscriptions due to offline feature being disabled";
LABEL_9:
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v14)
    {
      uint64_t v17 = [v32 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v17;
      id v16 = "Removed %llu subscriptions due to offline regulatory region ID change";
      goto LABEL_9;
    }

    [*(id *)(a1 + 32) _cleanUpDataForRemovedOfflineSubscriptionsWithError:0];
    objc_msgSend(v32, "_geo_filtered:", &__block_literal_global_593);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v18)
    {
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 8);
          uint64_t v22 = objc_msgSend(v20, "identifier", v32);
          uint64_t v23 = [v20 _originatingBundleIdentifier];
          uint64_t v24 = [v20 dataTypes];
          uint64_t v25 = [v20 policy];
          id v26 = [v20 region];
          id v27 = [v26 data];
          uint64_t v28 = [v20 displayName];
          InsertExpiredSubscription(v21, v22, v23, v24, v25, v27, v28, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v18);
    }

    objc_initWeak((id *)&buf, *(id *)(a1 + 32));
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 8);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2_594;
    v36[3] = &unk_1E53D9428;
    objc_copyWeak(&v39, (id *)&buf);
    int v40 = *(_DWORD *)(a1 + 48);
    uint64_t v38 = *(void *)(a1 + 40);
    id v37 = v32;
    [v29 addTransactionPostCommitAction:v36];

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)&buf);
  }
  uint64_t v30 = 1;
LABEL_19:

  return v30;
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  unint64_t v19 = [[GEOMapRegion alloc] initWithData:v16];

  double v20 = [GEOMapDataSubscription alloc];
  uint64_t v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v22 = [(GEOMapDataSubscription *)v20 initWithIdentifier:v18 originatingBundleIdentifier:v17 dataTypes:a5 policy:a6 expirationDate:0 region:v19 displayName:v15 regulatoryRegionID:v21];

  [*(id *)(a1 + 32) addObject:v22];
  return 1;
}

BOOL __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_590(uint64_t a1, void *a2)
{
  return [a2 policy] == 1;
}

void __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2_594(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unsigned int v4 = WeakRetained;
    [WeakRetained _cleanUpDeletedExternalDataIfNecessary];
    if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = 4;
    }
    [v4[20] tileDB:v4 didExpireSubscriptions:*(void *)(a1 + 32) forReason:v3];
    id WeakRetained = v4;
  }
}

- (void)expireSubscriptionsIfNecessaryWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53D7F70;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_3;
  v11[3] = &unk_1E53D8C88;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(GEOSQLiteDB *)db executeAsync:v14 errorHandler:v11];
}

void __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeExpiredSubscriptions];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E53DA028;
  long long v2 = *(NSObject **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getNextSubscriptionExpirationDateWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke;
  v14[3] = &unk_1E53D7F70;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_4;
  v11[3] = &unk_1E53D8C88;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(GEOSQLiteDB *)db executeAsync:v14 errorHandler:v11];
}

void __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v15 = 0;
  id v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  long long v2 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_2;
  v10[3] = &unk_1E53D9478;
  void v10[4] = &v11;
  void v10[5] = &v15;
  [v2 _enumerateSubscriptionExpirationDates:v10];
  if (*((unsigned char *)v12 + 24))
  {
    id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v16[3]];
  }
  else
  {
    id v3 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_3;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_2(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) || *(double *)(v2 + 24) > a2)
  {
    *(double *)(v2 + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_5;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)addSubscription:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    db = self->_db;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke;
    v15[3] = &unk_1E53D94C8;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_3;
    v12[3] = &unk_1E53D8C88;
    id v13 = v17;
    id v14 = v18;
    [(GEOSQLiteDB *)db executeAsync:v15 errorHandler:v12];
  }
}

void __44__GEOTileDB_addSubscription_queue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  char v4 = [v2 _addSubscriptionOnDBQueue:v3 error:&v13];
  id v5 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_2;
  v9[3] = &unk_1E53D94A0;
  id v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v12 = v4;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __44__GEOTileDB_addSubscription_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(v2 + 16))(v2, *(unsigned char *)(a1 + 48) != 0, v3);
}

void __44__GEOTileDB_addSubscription_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  char v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __44__GEOTileDB_addSubscription_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)_addSubscriptionOnDBQueue:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = GEOGetTileDBLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 identifier];
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Adding subscription '%{private}@'", (uint8_t *)&buf, 0xCu);
  }
  id v10 = [v6 region];
  id v11 = [v10 data];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5;
  id v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  db = self->_db;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke;
  v19[3] = &unk_1E53D9540;
  void v19[4] = self;
  id v13 = v6;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  p_long long buf = &buf;
  BOOL v15 = [(GEOSQLiteDB *)db ensureInTransaction:v19];
  BOOL v16 = v15;
  if (a4) {
    char v17 = v15;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }

  _Block_object_dispose(&buf, 8);
  return v16;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v66 = 0;
  int v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = -1;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 40) identifier];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_2;
  v57[3] = &unk_1E53D94F0;
  uint64_t v60 = &v66;
  id v58 = *(id *)(a1 + 40);
  id v59 = *(id *)(a1 + 48);
  uint64_t v61 = &v62;
  FetchSubscription(v2, v3, v57);

  char v4 = (void *)v67[3];
  if (*((unsigned char *)v63 + 24))
  {
    if (v4 == (void *)-1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v70) = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: existingSubscriptionPK != InvalidRowID", (uint8_t *)&v70, 2u);
      }
      uint64_t v14 = 0;
    }
    else
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 8);
      id v6 = [*(id *)(a1 + 40) expirationDate];
      [v6 timeIntervalSinceReferenceDate];
      double v8 = v7;
      id v9 = [*(id *)(a1 + 40) displayName];
      id v10 = v5;
      id v11 = v9;
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      CFAbsoluteTime v84 = __Block_byref_object_copy__5;
      v85 = __Block_byref_object_dispose__5;
      id v86 = 0;
      *(void *)&long long v70 = MEMORY[0x1E4F143A8];
      *((void *)&v70 + 1) = 3221225472;
      uint64_t v71 = (uint64_t)__UpdateSubscriptionExpirationAndDisplayName_block_invoke;
      uint64_t v72 = (uint64_t)&unk_1E53D9E70;
      id v12 = v10;
      id v73 = v12;
      long long v75 = buf;
      id v76 = v4;
      id v77 = (id)v8;
      id v13 = v11;
      id v74 = v13;
      uint64_t v14 = [v12 executeStatement:@"UpdateSubscriptionExpirationAndDisplayName" statementBlock:&v70];
      BOOL v15 = *(void **)(*(void *)&buf[8] + 40);
      if (v15) {
        id v16 = v15;
      }

      _Block_object_dispose(buf, 8);
      id v17 = v15;

      if (v14)
      {
        uint64_t v18 = *(void *)(a1 + 32);
        unint64_t v19 = *(void **)(v18 + 160);
        id v20 = [*(id *)(a1 + 40) identifier];
        [v19 tileDB:v18 didUpdateSubscriptionWithIdentifier:v20];
      }
      else
      {
        unint64_t v49 = GEOGetTileDBLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v70) = 138543362;
          *(void *)((char *)&v70 + 4) = v17;
          _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_ERROR, "Failed to update subscription: %{public}@", (uint8_t *)&v70, 0xCu);
        }

        uint64_t v50 = *(void *)(*(void *)(a1 + 56) + 8);
        id v51 = v17;
        id v20 = *(void **)(v50 + 40);
        *(void *)(v50 + 40) = v51;
      }
    }
  }
  else
  {
    if (v4 == (void *)-1)
    {
      *(void *)&long long v70 = 0;
      *((void *)&v70 + 1) = &v70;
      uint64_t v71 = 0x2020000000;
      uint64_t v72 = -1;
      id v21 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v22 = [*(id *)(a1 + 40) identifier];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_595;
      v56[3] = &unk_1E53D9518;
      v56[4] = &v70;
      FetchExpiredSubscription(v21, v22, v56);

      if (*(void *)(*((void *)&v70 + 1) + 24) != -1)
      {
        uint64_t v23 = GEOGetTileDBLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = [*(id *)(a1 + 40) identifier];
          *(_DWORD *)long long buf = 141558275;
          *(void *)&uint8_t buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v24;
          _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_INFO, "Subscription '%{private, mask.hash}@' was previously expired. Removing it from the expired list", buf, 0x16u);
        }
        RemoveExpiredSubscription(*(void **)(*(void *)(a1 + 32) + 8), 0, *(void *)(*((void *)&v70 + 1) + 24));
      }
      _Block_object_dispose(&v70, 8);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    id v26 = *(void **)(*(void *)(a1 + 32) + 8);
    id v27 = [*(id *)(a1 + 40) identifier];
    uint64_t v28 = [*(id *)(a1 + 40) _originatingBundleIdentifier];
    uint64_t v55 = [*(id *)(a1 + 40) dataTypes];
    uint64_t v54 = [*(id *)(a1 + 40) policy];
    uint64_t v29 = [*(id *)(a1 + 40) expirationDate];
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v30;
    id v32 = *(void **)(a1 + 48);
    uint64_t v33 = [*(id *)(a1 + 40) displayName];
    id v53 = v29;
    unint64_t v34 = (unint64_t)(Current + *MEMORY[0x1E4F1CF78]);
    id v35 = v26;
    id v36 = v27;
    id v37 = v28;
    id v38 = v32;
    id v39 = v33;
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    CFAbsoluteTime v84 = __Block_byref_object_copy__5;
    v85 = __Block_byref_object_dispose__5;
    id v86 = 0;
    *(void *)&long long v70 = MEMORY[0x1E4F143A8];
    *((void *)&v70 + 1) = 3221225472;
    uint64_t v71 = (uint64_t)__InsertSubscription_block_invoke;
    uint64_t v72 = (uint64_t)&unk_1E53D9E98;
    id v40 = v35;
    id v73 = v40;
    id v41 = v36;
    id v74 = v41;
    id v78 = buf;
    long long v42 = v37;
    long long v75 = v42;
    uint64_t v79 = v55;
    uint64_t v80 = v54;
    unint64_t v81 = (unint64_t)v31;
    id v43 = v38;
    id v76 = v43;
    id v44 = v39;
    id v77 = v44;
    unint64_t v82 = v34;
    uint64_t v14 = [v40 executeStatement:@"InsertSubscription" statementBlock:&v70];
    id v45 = *(void **)(*(void *)&buf[8] + 40);
    if (v45) {
      id v46 = v45;
    }

    _Block_object_dispose(buf, 8);
    id v47 = v45;

    if ((v14 & 1) == 0)
    {
      uint64_t v48 = GEOGetTileDBLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v70) = 138543362;
        *(void *)((char *)&v70 + 4) = v47;
        _os_log_impl(&dword_188D96000, v48, OS_LOG_TYPE_ERROR, "Failed to insert subscription: %{public}@", (uint8_t *)&v70, 0xCu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v45);
    }
  }
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  return v14;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a8;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  id v16 = [*(id *)(a1 + 32) _originatingBundleIdentifier];
  if (v16 != v14)
  {
    double v8 = [*(id *)(a1 + 32) _originatingBundleIdentifier];
    if (![v14 isEqualToString:v8])
    {
LABEL_9:

      goto LABEL_15;
    }
  }
  if ([*(id *)(a1 + 32) dataTypes] != a5 || objc_msgSend(*(id *)(a1 + 32), "policy") != a6)
  {
    if (v16 == v14)
    {

      goto LABEL_15;
    }
    goto LABEL_9;
  }
  int v17 = [v15 isEqualToData:*(void *)(a1 + 40)];
  if (v16 == v14)
  {

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {

    if ((v17 & 1) == 0) {
      goto LABEL_15;
    }
  }
  uint64_t v18 = GEOGetTileDBLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    unint64_t v19 = [*(id *)(a1 + 32) identifier];
    int v21 = 138477827;
    uint64_t v22 = v19;
    _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "New subscription '%{private}@' is identical to existing one, except for expiration date and/or display name. Updating existing record.", (uint8_t *)&v21, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_15:

  return 1;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_595(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)removeSubscriptionWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke;
  v18[3] = &unk_1E53D94C8;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_3;
  v15[3] = &unk_1E53D8C88;
  id v16 = v20;
  id v17 = v21;
  id v12 = v21;
  id v13 = v20;
  id v14 = v8;
  [(GEOSQLiteDB *)db executeAsync:v18 errorHandler:v15];
}

void __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  char v4 = [v2 _removeSubscriptionOnDBQueue:v3 error:&v13];
  id v5 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_2;
  v9[3] = &unk_1E53D94A0;
  id v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v12 = v4;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(v2 + 16))(v2, *(unsigned char *)(a1 + 48) != 0, v3);
}

void __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  char v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)_removeSubscriptionOnDBQueue:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v33 = 0;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = -1;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  db = self->_db;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke;
  v27[3] = &unk_1E53D9368;
  v27[4] = &v29;
  void v27[5] = v28;
  FetchSubscription(db, v6, v27);
  if (v30[3] != -1) {
    goto LABEL_3;
  }
  id v9 = self->_db;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_2;
  v26[3] = &unk_1E53D9568;
  void v26[4] = &v29;
  v26[5] = v28;
  v26[6] = &v33;
  FetchExpiredSubscription(v9, v6, v26);
  if (v30[3] != -1)
  {
LABEL_3:
    int v10 = *((unsigned __int8 *)v34 + 24);
    id v11 = GEOGetTileDBLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)long long buf = 141558275;
        *(void *)&uint8_t buf[4] = 1752392040;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v6;
        id v13 = "Removing expired subscription '%{private, mask.hash}@'";
LABEL_8:
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, v13, buf, 0x16u);
      }
    }
    else if (v12)
    {
      *(_DWORD *)long long buf = 141558275;
      *(void *)&uint8_t buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v6;
      id v13 = "Removing subscription '%{private, mask.hash}@'";
      goto LABEL_8;
    }

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v42 = __Block_byref_object_copy__5;
    id v43 = __Block_byref_object_dispose__5;
    id v44 = 0;
    id v14 = self->_db;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_597;
    v20[3] = &unk_1E53D9590;
    uint64_t v22 = &v33;
    uint64_t v23 = buf;
    void v20[4] = self;
    uint64_t v24 = &v29;
    id v15 = v6;
    id v21 = v15;
    uint64_t v25 = v28;
    BOOL v16 = [(GEOSQLiteDB *)v14 executeInTransaction:v20];
    id v17 = GEOGetTileDBLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v37 = 141558275;
      uint64_t v38 = 1752392040;
      __int16 v39 = 2113;
      id v40 = v15;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Done removing subscription '%{private, mask.hash}@'", v37, 0x16u);
    }

    if (v16)
    {
      [(GEOTileDB *)self _cleanUpDeletedExternalDataIfNecessary];
    }
    else if (a4)
    {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  id v19 = GEOGetTileDBLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 141558275;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "Could not remove subscription '%{private, mask.hash}@', as that is not a known identifier", buf, 0x16u);
  }

  LOBYTE(v16) = 0;
LABEL_16:
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

uint64_t __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a5;
  return 0;
}

uint64_t __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return 0;
}

BOOL __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_597(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  char v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v2 + 8);
  id v8 = *(void **)(v5 + 40);
  id v7 = (id *)(v5 + 40);
  id v6 = v8;
  if (v3)
  {
    id obj = v6;
    char v9 = RemoveExpiredSubscription(v4, &obj, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    objc_storeStrong(v7, obj);
    if ((v9 & 1) == 0)
    {
      BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)long long buf = 0;
        id v11 = MEMORY[0x1E4F14500];
        BOOL v12 = "Assertion failed: RemoveExpiredSubscription(_db, &error, subscriptionPK)";
LABEL_12:
        _os_log_fault_impl(&dword_188D96000, v11, OS_LOG_TYPE_FAULT, v12, buf, 2u);
        return 0;
      }
      return result;
    }
    return 1;
  }
  id v18 = v6;
  char v13 = RemoveSubscription(v4, &v18, *(void **)(a1 + 40));
  objc_storeStrong(v7, v18);
  if (v13)
  {
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 25) & 4) != 0)
    {
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      id v17 = *(id *)(v15 + 40);
      int v16 = [v14 _cleanUpDataForRemovedOfflineSubscriptionsWithError:&v17];
      objc_storeStrong((id *)(v15 + 40), v17);
      if (!v16) {
        return 0;
      }
    }
    return 1;
  }
  BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_WORD *)long long buf = 0;
    id v11 = MEMORY[0x1E4F14500];
    BOOL v12 = "Assertion failed: RemoveSubscription(_db, &error, identifier)";
    goto LABEL_12;
  }
  return result;
}

- (BOOL)_cleanUpDataForRemovedOfflineSubscriptionsWithError:(id *)a3
{
  char v4 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v4);

  if ([(GEOSQLiteDB *)self->_db executeStatement:@"MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription" statementBlock:&__block_literal_global_1192])
  {
    if ([(GEOSQLiteDB *)self->_db executeStatement:@"DeleteOfflineBatchRefsNotAssociatedWithSubscription" statementBlock:&__block_literal_global_1194])
    {
      if ([(GEOSQLiteDB *)self->_db executeStatement:@"DeleteOfflineDataNotAssociatedWithSubscription" statementBlock:&__block_literal_global_1196])
      {
        if ([(GEOSQLiteDB *)self->_db executeStatement:@"DeleteOfflineBatchesNotAssociatedWithSubscription" statementBlock:&__block_literal_global_1198])
        {
          if ([(GEOSQLiteDB *)self->_db executeStatement:@"MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch" statementBlock:&__block_literal_global_1200])
          {
            if ([(GEOSQLiteDB *)self->_db executeStatement:@"DeleteOfflineDataNotAssociatedWithBatch" statementBlock:&__block_literal_global_1202])
            {
              LOBYTE(v5) = 1;
              return v5;
            }
            BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
            if (!v5) {
              return v5;
            }
            __int16 v10 = 0;
            id v6 = MEMORY[0x1E4F14500];
            id v7 = "Assertion failed: DeleteOfflineDataNotAssociatedWithBatch(_db, error)";
            id v8 = (uint8_t *)&v10;
          }
          else
          {
            BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
            if (!v5) {
              return v5;
            }
            __int16 v11 = 0;
            id v6 = MEMORY[0x1E4F14500];
            id v7 = "Assertion failed: MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch(_db, error)";
            id v8 = (uint8_t *)&v11;
          }
        }
        else
        {
          BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
          if (!v5) {
            return v5;
          }
          __int16 v12 = 0;
          id v6 = MEMORY[0x1E4F14500];
          id v7 = "Assertion failed: DeleteOfflineBatchesNotAssociatedWithSubscription(_db, error)";
          id v8 = (uint8_t *)&v12;
        }
      }
      else
      {
        BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
        if (!v5) {
          return v5;
        }
        __int16 v13 = 0;
        id v6 = MEMORY[0x1E4F14500];
        id v7 = "Assertion failed: DeleteOfflineDataNotAssociatedWithSubscription(_db, error)";
        id v8 = (uint8_t *)&v13;
      }
    }
    else
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (!v5) {
        return v5;
      }
      __int16 v14 = 0;
      id v6 = MEMORY[0x1E4F14500];
      id v7 = "Assertion failed: DeleteOfflineBatchRefsNotAssociatedWithSubscription(_db, error)";
      id v8 = (uint8_t *)&v14;
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (!v5) {
      return v5;
    }
    __int16 v15 = 0;
    id v6 = MEMORY[0x1E4F14500];
    id v7 = "Assertion failed: MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription(_db, error)";
    id v8 = (uint8_t *)&v15;
  }
  _os_log_fault_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, v7, v8, 2u);
  LOBYTE(v5) = 0;
  return v5;
}

- (void)fetchAllSubscriptionsWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    db = self->_db;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke;
    v13[3] = &unk_1E53D7F70;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_3;
    v10[3] = &unk_1E53D8C88;
    id v11 = v14;
    id v12 = v15;
    [(GEOSQLiteDB *)db executeAsync:v13 errorHandler:v10];
  }
}

void __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v13 = 0;
  int v3 = [v2 _fetchSubscriptionsWithIdentifiers:0 error:&v13];
  id v4 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_2;
  v9[3] = &unk_1E53D95B8;
  BOOL v5 = *(NSObject **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v11 = v4;
  id v12 = v6;
  id v10 = v3;
  id v7 = v4;
  id v8 = v3;
  dispatch_async(v5, v9);
}

uint64_t __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__GEOTileDB__fetchSubscriptionsWithIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  if (a7 && *(void *)(a1 + 56) > (unint64_t)a7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v19 = *(void **)(a1 + 32);
    if (v19)
    {
      uint64_t v31 = a5;
      uint64_t v32 = a6;
      id v33 = v16;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (_GEOMapDataSubscriptionIdentifierIsCompatible(v25, v15))
            {
              id v27 = GEOGetTileDBLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138478083;
                id v39 = v15;
                __int16 v40 = 2113;
                id v41 = v25;
                _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' matches requested identifier '%{private}@", buf, 0x16u);
              }

              a6 = v32;
              id v16 = v33;
              a5 = v31;
              goto LABEL_19;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      id v26 = GEOGetTileDBLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138477827;
        id v39 = v15;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' does not match requested identifiers", buf, 0xCu);
      }

      id v16 = v33;
    }
    else
    {
LABEL_19:
      if (a7)
      {
        a7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(unint64_t)a7];
      }
      uint64_t v28 = [[GEOMapRegion alloc] initWithData:v17];
      if (v28)
      {
        uint64_t v29 = [[GEOMapDataSubscription alloc] initWithIdentifier:v15 originatingBundleIdentifier:v16 dataTypes:a5 policy:a6 expirationDate:a7 region:v28 displayName:v18];
        [*(id *)(a1 + 40) addObject:v29];
      }
      else
      {
        GEOGetTileDBLog();
        uint64_t v29 = (GEOMapDataSubscription *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138477827;
          id v39 = v15;
          _os_log_impl(&dword_188D96000, &v29->super, OS_LOG_TYPE_ERROR, "Invalid region associated with subscription '%{private}@'", buf, 0xCu);
        }
      }
    }
  }

  return 1;
}

- (void)fetchAllExpiredSubscriptionsWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    db = self->_db;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke;
    v13[3] = &unk_1E53D7F70;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_3;
    v10[3] = &unk_1E53D8C88;
    id v11 = v14;
    id v12 = v15;
    [(GEOSQLiteDB *)db executeAsync:v13 errorHandler:v10];
  }
}

void __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v13 = 0;
  id v3 = [v2 _fetchExpiredSubscriptionsWithIdentifiers:0 error:&v13];
  id v4 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_2;
  v9[3] = &unk_1E53D95B8;
  id v5 = *(NSObject **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v11 = v4;
  id v12 = v6;
  id v10 = v3;
  id v7 = v4;
  id v8 = v3;
  dispatch_async(v5, v9);
}

uint64_t __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __61__GEOTileDB__fetchExpiredSubscriptionsWithIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = *(void **)(a1 + 32);
  if (v19)
  {
    unsigned int v32 = a8;
    uint64_t v33 = a4;
    uint64_t v34 = a5;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (_GEOMapDataSubscriptionIdentifierIsCompatible(v25, v15))
          {
            id v27 = GEOGetTileDBLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138478083;
              id v40 = v15;
              __int16 v41 = 2113;
              long long v42 = v25;
              _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' matches requested identifier '%{private}@", buf, 0x16u);
            }

            a4 = v33;
            a5 = v34;
            a8 = v32;
            goto LABEL_15;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    GEOGetTileDBLog();
    id v26 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138477827;
      id v40 = v15;
      _os_log_impl(&dword_188D96000, &v26->super.super, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' does not match requested identifiers", buf, 0xCu);
    }
  }
  else
  {
LABEL_15:
    id v26 = [[GEOMapRegion alloc] initWithData:v17];
    if (v26)
    {
      uint64_t v28 = [GEOMapDataSubscription alloc];
      uint64_t v29 = [NSNumber numberWithUnsignedInt:a8];
      double v30 = [(GEOMapDataSubscription *)v28 initWithIdentifier:v15 originatingBundleIdentifier:v16 dataTypes:a4 policy:a5 expirationDate:0 region:v26 displayName:v18 regulatoryRegionID:v29];

      [*(id *)(a1 + 40) addObject:v30];
    }
    else
    {
      double v30 = GEOGetTileDBLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138477827;
        id v40 = v15;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, "Invalid region associated with subscription '%{private}@'", buf, 0xCu);
      }
    }
  }
  return 1;
}

- (void)fetchSubscriptionMetadataWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke;
  v18[3] = &unk_1E53D94C8;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_2;
  v15[3] = &unk_1E53D8C88;
  id v16 = v20;
  id v17 = v21;
  id v12 = v21;
  id v13 = v20;
  id v14 = v8;
  [(GEOSQLiteDB *)db executeAsync:v18 errorHandler:v15];
}

uint64_t __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSubscriptionMetadataWithIdentifierOnQueue:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
}

void __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_3;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_fetchSubscriptionMetadataWithIdentifierOnQueue:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = -1;
  db = self->_db;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke;
  v38[3] = &unk_1E53D8E90;
  v38[4] = &v39;
  GetSubscriptionPK(db, v8, v38);
  if (v40[3] == -1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_2;
    block[3] = &unk_1E53DA028;
    id v37 = v10;
    id v15 = v10;
    dispatch_async(v9, block);
    id v25 = v37;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = self->_db;
    uint64_t v14 = v40[3];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_3;
    v34[3] = &unk_1E53D9630;
    id v15 = v12;
    id v35 = v15;
    GetSubscriptionDataStates(v13, v14, v34);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    id v16 = self->_db;
    uint64_t v17 = v40[3];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_4;
    v29[3] = &unk_1E53D9340;
    void v29[4] = &v30;
    id v18 = v16;
    id v19 = v29;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__5;
    v48[4] = __Block_byref_object_dispose__5;
    id v49 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __GetSubscriptionDownloadState_block_invoke;
    v43[3] = &unk_1E53D9BC8;
    id v20 = v18;
    id v46 = v48;
    uint64_t v47 = v17;
    uint64_t v44 = v20;
    id v21 = v19;
    id v45 = v21;
    [(GEOSQLiteDB *)v20 statementForKey:@"GetSubscriptionDownloadState" statementBlock:v43];

    _Block_object_dispose(v48, 8);
    uint64_t v22 = [GEOTileDBSubscriptionMetadata alloc];
    uint64_t v23 = [(GEOTileDBSubscriptionMetadata *)v22 initWithDataStates:v15 downloadState:v31[3]];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_5;
    v26[3] = &unk_1E53D7C50;
    id v27 = v23;
    id v28 = v10;
    uint64_t v24 = v23;
    id v25 = v10;
    dispatch_async(v9, v26);

    _Block_object_dispose(&v30, 8);
  }

  _Block_object_dispose(&v39, 8);
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_3(uint64_t a1, int a2, int a3, uint64_t a4, char a5, unsigned int a6, uint64_t a7)
{
  uint64_t v14 = [_GEOTileDBSubscriptionMetadataDataState alloc];
  if (v14)
  {
    v18.receiver = v14;
    v18.super_class = (Class)_GEOTileDBSubscriptionMetadataDataState;
    id v15 = objc_msgSendSuper2(&v18, sel_init);
    id v16 = v15;
    if (v15)
    {
      *((_DWORD *)v15 + 4) = a2;
      *((_DWORD *)v15 + 5) = a3;
      *((void *)v15 + 1) = a4;
      *((unsigned char *)v15 + 24) = a5;
      *((void *)v15 + 4) = a6;
      *((void *)v15 + 5) = a7;
    }
  }
  else
  {
    id v16 = 0;
  }
  [*(id *)(a1 + 32) addObject:v16];

  return 1;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_4(uint64_t a1, unsigned int a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)setSubscriptionWithIdentifier:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7
{
  id v12 = a3;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __89__GEOTileDB_setSubscriptionWithIdentifier_isFullyLoaded_forDataType_dataSubtype_version___block_invoke;
  v15[3] = &unk_1E53D9658;
  void v15[4] = self;
  id v16 = v12;
  BOOL v20 = a4;
  unsigned int v18 = a5;
  unsigned int v19 = a6;
  unint64_t v17 = a7;
  id v14 = v12;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

uint64_t __89__GEOTileDB_setSubscriptionWithIdentifier_isFullyLoaded_forDataType_dataSubtype_version___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _flushPendingWrites];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  uint64_t v6 = *(unsigned int *)(a1 + 60);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v2 _setSubscriptionWithIdentifierOnQueue:v3 isFullyLoaded:v4 forDataType:v5 dataSubtype:v6 version:v7];
}

- (void)_setSubscriptionWithIdentifierOnQueue:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7
{
  BOOL v10 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = -1;
  db = self->_db;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke;
  v35[3] = &unk_1E53D8E90;
  v35[4] = &v36;
  GetSubscriptionPK(db, v12, v35);
  uint64_t v14 = v37[3];
  if (v14 == -1)
  {
    BOOL v20 = GEOGetTileDBLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    if (v10)
    {
      id v15 = self->_db;
      if (a5 == 1024)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_601;
        v26[3] = &unk_1E53D9110;
        void v26[4] = &v31;
        v26[5] = &v27;
        id v16 = v15;
        unint64_t v17 = v26;
        uint64_t v40 = 0;
        uint64_t v41 = &v40;
        uint64_t v42 = 0x3032000000;
        uint64_t v43 = __Block_byref_object_copy__5;
        uint64_t v44 = __Block_byref_object_dispose__5;
        id v45 = 0;
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v47 = __GetSubscriptionSizeForOfflineLayer_block_invoke;
        uint64_t v48 = &unk_1E53D9EC0;
        unsigned int v18 = v16;
        id v49 = v18;
        id v51 = &v40;
        uint64_t v52 = v14;
        unsigned int v54 = a6;
        unint64_t v53 = a7;
        unsigned int v19 = v17;
        id v50 = v19;
        [(GEOSQLiteDB *)v18 statementForKey:@"GetSubscriptionSizeForOfflineLayer" statementBlock:&buf];

        _Block_object_dispose(&v40, 8);
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_2;
        v25[3] = &unk_1E53D9110;
        v25[4] = &v31;
        void v25[5] = &v27;
        id v21 = v15;
        uint64_t v22 = v25;
        uint64_t v40 = 0;
        uint64_t v41 = &v40;
        uint64_t v42 = 0x3032000000;
        uint64_t v43 = __Block_byref_object_copy__5;
        uint64_t v44 = __Block_byref_object_dispose__5;
        id v45 = 0;
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v47 = __GetSubscriptionSizeForTileset_block_invoke;
        uint64_t v48 = &unk_1E53D9EE8;
        uint64_t v23 = v21;
        id v51 = &v40;
        uint64_t v52 = v14;
        id v49 = v23;
        LODWORD(v53) = a6;
        BYTE4(v53) = a7 == 1;
        uint64_t v24 = v22;
        id v50 = v24;
        [(GEOSQLiteDB *)v23 statementForKey:@"GetSubscriptionSizeForTileset" statementBlock:&buf];

        _Block_object_dispose(&v40, 8);
      }
    }
    SetSubscriptionDataState(self->_db, v37[3], a5, a6, a7, v10, *((_DWORD *)v32 + 6), v28[3]);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  _Block_object_dispose(&v36, 8);
}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_601(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a2;
  return 1;
}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a2;
  return 1;
}

- (void)setDownloadState:(int64_t)a3 forSubscriptionWithIdentifier:(id)a4
{
  id v6 = a4;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke;
  v9[3] = &unk_1E53D9680;
  void v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

void __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke(void *a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = -1;
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = *(void **)(a1[4] + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke_2;
  v8[3] = &unk_1E53D8E90;
  void v8[4] = &v9;
  GetSubscriptionPK(v3, v2, v8);
  uint64_t v4 = v10[3];
  if (v4 != -1)
  {
    uint64_t v5 = a1[6];
    id v6 = *(id *)(a1[4] + 8);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__5;
    void v18[4] = __Block_byref_object_dispose__5;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __SetSubscriptionDownloadState_block_invoke;
    v13[3] = &unk_1E53D9C18;
    id v7 = v6;
    id v15 = v18;
    uint64_t v16 = v4;
    id v14 = v7;
    int v17 = v5;
    [v7 executeStatement:@"SetSubscriptionDownloadState" statementBlock:v13];

    _Block_object_dispose(v18, 8);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)clearDownloadStateForSubscriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke;
  void v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeAsync:v7];
}

void __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke_2;
  void v7[3] = &unk_1E53D8E90;
  void v7[4] = &v8;
  GetSubscriptionPK(v3, v2, v7);
  uint64_t v4 = v9[3];
  if (v4 != -1)
  {
    id v5 = *(id *)(*(void *)(a1 + 32) + 8);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    void v16[3] = __Block_byref_object_copy__5;
    void v16[4] = __Block_byref_object_dispose__5;
    id v17 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __ClearSubscriptionDownloadState_block_invoke;
    v12[3] = &unk_1E53D7A50;
    id v6 = v5;
    id v14 = v16;
    uint64_t v15 = v4;
    id v13 = v6;
    [v6 executeStatement:@"ClearSubscriptionDownloadState" statementBlock:v12];

    _Block_object_dispose(v16, 8);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithBool:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];

  return 1;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithBool:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];

  return 1;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_9;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5
{
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5 shouldOverwriteExistingValue:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke;
  v15[3] = &unk_1E53D9720;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a6;
  BOOL v19 = a4;
  id v13 = v11;
  id v14 = v10;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

void __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = -1;
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke_2;
  v17[3] = &unk_1E53D8E90;
  void v17[4] = &v18;
  GetSubscriptionPK(v3, v2, v17);
  uint64_t v4 = v19;
  if (v19[3] == -1)
  {
    id v7 = GEOGetTileDBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 48);
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
      uint64_t v4 = v19;
    }
    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = v4[3];
    char v11 = *(unsigned char *)(a1 + 57);
    if (*(unsigned char *)(a1 + 56))
    {
      id v12 = v9;
      id v13 = v6;
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3032000000;
      id v25 = __Block_byref_object_copy__5;
      id v26 = __Block_byref_object_dispose__5;
      id v27 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v29 = __SetSubscriptionShouldSyncToPairedDevice_block_invoke;
      uint64_t v30 = &unk_1E53D9F10;
      id v14 = v12;
      uint64_t v33 = &v22;
      uint64_t v34 = v10;
      id v31 = v14;
      id v7 = v13;
      uint64_t v32 = v7;
      char v35 = v11;
      [v14 executeStatement:@"SetSubscriptionShouldSyncToPairedDevice" statementBlock:&buf];
    }
    else
    {
      id v15 = v9;
      id v16 = v6;
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3032000000;
      id v25 = __Block_byref_object_copy__5;
      id v26 = __Block_byref_object_dispose__5;
      id v27 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v29 = __SetSubscriptionShouldSyncToPairedDeviceNoOverwrite_block_invoke;
      uint64_t v30 = &unk_1E53D9F10;
      id v14 = v15;
      uint64_t v33 = &v22;
      uint64_t v34 = v10;
      id v31 = v14;
      id v7 = v16;
      uint64_t v32 = v7;
      char v35 = v11;
      [v14 executeStatement:@"SetSubscriptionShouldSyncToPairedDeviceNoOverwrite" statementBlock:&buf];
    }

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)clearShouldSyncSubscriptionsForPairedDevice:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__GEOTileDB_clearShouldSyncSubscriptionsForPairedDevice___block_invoke;
  void v7[3] = &unk_1E53D8998;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeAsync:v7];
}

void __57__GEOTileDB_clearShouldSyncSubscriptionsForPairedDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  id v4 = v3;
  id v5 = *(id *)(*(void *)(a1 + 40) + 8);
  id v6 = v4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__5;
  void v13[4] = __Block_byref_object_dispose__5;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __ClearSubscriptionsForSyncToPairedDevice_block_invoke;
  v9[3] = &unk_1E53D7E08;
  id v7 = v5;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  id v12 = v13;
  [v7 executeStatement:@"ClearSubscriptionsForSyncToPairedDevice" statementBlock:v9];

  _Block_object_dispose(v13, 8);
}

- (void)addData:(id)a3 forOfflineDataBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 containedKeys:(id)a7 forSubscriptionIdentifier:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v14)
  {
    BOOL v19 = [v14 fileURL];

    if (v19)
    {
      unint64_t v39 = a5;
      id v42 = v18;
      id v43 = v16;
      id v20 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v21 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v22 = NSTemporaryDirectory();
      uint64_t v23 = [v21 fileURLWithPath:v22 isDirectory:1];

      uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v25 = [v23 path];
      char v26 = [v24 fileExistsAtPath:v25];

      if (v26)
      {
        id v40 = v17;
        id v41 = v15;
        id v27 = 0;
      }
      else
      {
        id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v53 = 0;
        char v29 = [v28 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:&v53];
        id v27 = v53;

        if ((v29 & 1) == 0)
        {
          uint64_t v38 = GEOGetTileDBLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v55 = v27;
            _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Failed to create temporary directory: %{public}@", buf, 0xCu);
          }

          id v18 = v42;
          goto LABEL_17;
        }
        id v40 = v17;
        id v41 = v15;
      }
      uint64_t v30 = [v20 UUIDString];
      id v31 = [v23 URLByAppendingPathComponent:v30];

      uint64_t v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v33 = [v14 fileURL];
      id v52 = v27;
      char v34 = [v32 moveItemAtURL:v33 toURL:v31 error:&v52];
      id v35 = v52;

      if ((v34 & 1) == 0)
      {
        id v37 = GEOGetTileDBLog();
        id v16 = v43;
        id v17 = v40;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v55 = v35;
          _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_ERROR, "Failed to move external file to temporary directory: %{public}@", buf, 0xCu);
        }

        id v15 = v41;
        id v18 = v42;
        goto LABEL_17;
      }
      [v14 _replaceFileURL:v31];

      id v17 = v40;
      id v15 = v41;
      id v18 = v42;
      id v16 = v43;
      a5 = v39;
    }
    else
    {
      id v20 = 0;
    }
    db = self->_db;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __97__GEOTileDB_addData_forOfflineDataBatchKey_version_etag_containedKeys_forSubscriptionIdentifier___block_invoke;
    v44[3] = &unk_1E53D9748;
    v44[4] = self;
    id v20 = v20;
    id v45 = v20;
    id v46 = v14;
    id v47 = v15;
    unint64_t v51 = a5;
    id v48 = v16;
    id v49 = v17;
    id v50 = v18;
    [(GEOSQLiteDB *)db executeAsync:v44];

LABEL_17:
  }
}

void __97__GEOTileDB_addData_forOfflineDataBatchKey_version_etag_containedKeys_forSubscriptionIdentifier___block_invoke(uint64_t a1)
{
  if (MarkExternalDataForDeletion(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40)))
  {
    if ([*(id *)(a1 + 32) _prepareDataForPersistence:*(void *)(a1 + 48) isIdenticalToExistingStaleData:0 preferredExternalResourceUUID:*(void *)(a1 + 40) externalResourceUUID:0])objc_msgSend(*(id *)(a1 + 32), "_addDataOnDBQueueWithData:forOfflineBatchKey:version:etag:externalResourceUUID:containedKeys:subscriptionIdentifier:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 88), *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 80)); {
  }
    }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: MarkExternalDataForDeletion(_db, ((void *)0), newExternalResourceUUID)", buf, 2u);
  }
}

- (void)_addDataOnDBQueueWithData:(id)a3 forOfflineBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 externalResourceUUID:(id)a7 containedKeys:(id)a8 subscriptionIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  db = self->_db;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke;
  v28[3] = &unk_1E53D9798;
  void v28[4] = self;
  id v29 = v16;
  id v30 = v20;
  id v31 = v15;
  id v32 = v18;
  id v33 = v17;
  id v34 = v19;
  unint64_t v35 = a5;
  id v22 = v19;
  id v23 = v17;
  id v24 = v18;
  id v25 = v15;
  id v26 = v20;
  id v27 = v16;
  [(GEOSQLiteDB *)db executeInTransaction:v28];
}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x2020000000;
  uint64_t v79 = -1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  int v4 = [*(id *)(a1 + 40) layer];
  uint64_t v5 = *(void *)(a1 + 88);
  id v6 = [*(id *)(a1 + 40) key];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_2;
  v75[3] = &unk_1E53D9770;
  v75[4] = &v76;
  CheckExistenceOfOfflineBatchKey(v3, v4, v5, v6, v75);

  if (v77[3] != -1)
  {
    id v7 = GEOGetTileDBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Adding offline batch which already exists in DB. Ignoring.", buf, 2u);
    }

    if (*(void *)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 32), "_markDataAtRow:associatedWithSubscriptionIdentifier:", v77[3]);
    }
    goto LABEL_21;
  }
  uint64_t v8 = [*(id *)(a1 + 32) _insertDataRowForData:*(void *)(a1 + 56) ETag:0 externalResourceUUID:*(void *)(a1 + 64) timestamp:0 subscriptionIdentifier:*(void *)(a1 + 48)];
  if (v8 == -1) {
    goto LABEL_31;
  }
  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  int v10 = [*(id *)(a1 + 40) layer];
  id v11 = [*(id *)(a1 + 40) key];
  unint64_t v12 = *(void *)(a1 + 88);
  id v13 = *(void **)(a1 + 72);
  id v14 = v9;
  id v15 = v11;
  id v16 = v13;
  uint64_t v92 = 0;
  id v93 = &v92;
  uint64_t v94 = 0x3032000000;
  uint64_t v95 = __Block_byref_object_copy__5;
  uint64_t v96 = __Block_byref_object_dispose__5;
  id v97 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v81 = 3221225472;
  unint64_t v82 = __InsertOfflineDataBatch_block_invoke;
  id v83 = &unk_1E53D9F60;
  id v17 = v14;
  LODWORD(v90) = v10;
  id v84 = v17;
  uint64_t v87 = &v92;
  id v18 = (uint64_t *)v15;
  v85 = v18;
  unint64_t v88 = v12;
  id v19 = (uint64_t *)v16;
  id v86 = v19;
  uint64_t v89 = v8;
  char v20 = [v17 executeStatement:@"InsertOfflineDataBatch" statementBlock:buf];

  _Block_object_dispose(&v92, 8);
  if ((v20 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)long long buf = 0;
    id v59 = MEMORY[0x1E4F14500];
    uint64_t v60 = "Assertion failed: InsertOfflineDataBatch(_db, ((void *)0), (uint32_t)key.layer, key.key, version, etag, pk)";
LABEL_38:
    _os_log_fault_impl(&dword_188D96000, v59, OS_LOG_TYPE_FAULT, v60, buf, 2u);
    goto LABEL_31;
  }
  uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 8) lastInsertRowID];
  if (v21 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)long long buf = 0;
    id v59 = MEMORY[0x1E4F14500];
    uint64_t v60 = "Assertion failed: batchPK != InvalidRowID";
    goto LABEL_38;
  }
  uint64_t v64 = (uint64_t *)v21;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = *(id *)(a1 + 80);
  uint64_t v22 = [obj countByEnumeratingWithState:&v71 objects:v98 count:16];
  if (!v22) {
    goto LABEL_20;
  }
  unint64_t v61 = (unint64_t)(Current + *MEMORY[0x1E4F1CF78]);
  uint64_t v63 = *(void *)v72;
  while (2)
  {
    uint64_t v65 = v22;
    for (uint64_t i = 0; i != v65; ++i)
    {
      if (*(void *)v72 != v63) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      id v25 = objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v24, v61);
      uint64_t v67 = 0;
      uint64_t v68 = &v67;
      uint64_t v69 = 0x2020000000;
      uint64_t v70 = -1;
      id v26 = *(void **)(*(void *)(a1 + 32) + 8);
      int v27 = [*(id *)(a1 + 40) layer];
      unint64_t v28 = *(void *)(a1 + 88);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_604;
      v66[3] = &unk_1E53D8E90;
      v66[4] = &v67;
      id v29 = v26;
      id v30 = v24;
      id v31 = v66;
      uint64_t v92 = 0;
      id v93 = &v92;
      uint64_t v94 = 0x3032000000;
      uint64_t v95 = __Block_byref_object_copy__5;
      uint64_t v96 = __Block_byref_object_dispose__5;
      id v97 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v81 = 3221225472;
      unint64_t v82 = __GetOfflineDataPKForKey_block_invoke;
      id v83 = &unk_1E53D9F38;
      id v32 = v29;
      LODWORD(v89) = v27;
      id v84 = v32;
      uint64_t v87 = &v92;
      unint64_t v88 = v28;
      id v33 = (uint64_t *)v30;
      v85 = v33;
      id v34 = v31;
      id v86 = v34;
      [v32 statementForKey:@"GetOfflineDataPKForKey" statementBlock:buf];

      _Block_object_dispose(&v92, 8);
      uint64_t v35 = v68[3];
      if (v35 == -1)
      {
        uint64_t v36 = *(void **)(*(void *)(a1 + 32) + 8);
        int v37 = [*(id *)(a1 + 40) layer];
        uint64_t v38 = *(uint64_t **)(a1 + 88);
        id v39 = v36;
        id v40 = v33;
        uint64_t v92 = 0;
        id v93 = &v92;
        uint64_t v94 = 0x3032000000;
        uint64_t v95 = __Block_byref_object_copy__5;
        uint64_t v96 = __Block_byref_object_dispose__5;
        id v97 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        uint64_t v81 = 3221225472;
        unint64_t v82 = __InsertOfflineData_block_invoke;
        id v83 = &unk_1E53D9F88;
        id v41 = v39;
        LODWORD(v89) = v37;
        id v84 = v41;
        id v86 = &v92;
        id v42 = v40;
        v85 = v42;
        uint64_t v87 = v38;
        unint64_t v88 = v61;
        LOBYTE(v40) = [v41 executeStatement:@"InsertOfflineData" statementBlock:buf];

        _Block_object_dispose(&v92, 8);
        if ((v40 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            int v57 = MEMORY[0x1E4F14500];
            id v58 = "Assertion failed: InsertOfflineData(_db, ((void *)0), (uint32_t)key.layer, serviceKey, version, ((0) >"
                  " (timestamp) ? (0) : (timestamp)))";
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 8) lastInsertRowID];
        v68[3] = v35;
        if (v35 == -1)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            int v57 = MEMORY[0x1E4F14500];
            id v58 = "Assertion failed: offlineDataPK != InvalidRowID";
LABEL_29:
            _os_log_fault_impl(&dword_188D96000, v57, OS_LOG_TYPE_FAULT, v58, buf, 2u);
          }
LABEL_30:
          _Block_object_dispose(&v67, 8);

          goto LABEL_31;
        }
      }
      id v43 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v44 = [v25 offset];
      uint64_t v45 = [v25 length];
      int v46 = [*(id *)(a1 + 40) layer];
      uint64_t v47 = *(void *)(a1 + 88);
      id v48 = v43;
      uint64_t v92 = 0;
      id v93 = &v92;
      uint64_t v94 = 0x3032000000;
      uint64_t v95 = __Block_byref_object_copy__5;
      uint64_t v96 = __Block_byref_object_dispose__5;
      id v97 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v81 = 3221225472;
      unint64_t v82 = __InsertOfflineDataBatchReference_block_invoke;
      id v83 = &unk_1E53D9FB0;
      id v49 = v48;
      id v84 = v49;
      v85 = &v92;
      id v86 = v64;
      uint64_t v87 = (uint64_t *)v35;
      unint64_t v88 = v44;
      uint64_t v89 = v45;
      int v91 = v46;
      uint64_t v90 = v47;
      LOBYTE(v46) = [v49 executeStatement:@"InsertOfflineDataBatchReference" statementBlock:buf];

      _Block_object_dispose(&v92, 8);
      if ((v46 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          int v57 = MEMORY[0x1E4F14500];
          id v58 = "Assertion failed: InsertOfflineDataBatchReference(_db, ((void *)0), batchPK, offlineDataPK, (int64_t)fil"
                "eInfo.offset, (int64_t)fileInfo.length, (uint32_t)key.layer, version)";
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      _Block_object_dispose(&v67, 8);
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v71 objects:v98 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_20:

  id v50 = *(void **)(a1 + 64);
  id v51 = *(id *)(*(void *)(a1 + 32) + 8);
  id v52 = v50;
  uint64_t v92 = 0;
  id v93 = &v92;
  uint64_t v94 = 0x3032000000;
  uint64_t v95 = __Block_byref_object_copy__5;
  uint64_t v96 = __Block_byref_object_dispose__5;
  id v97 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v81 = 3221225472;
  unint64_t v82 = __ClearExternalDataPendingDeletion_block_invoke;
  id v83 = &unk_1E53D7E08;
  id v53 = v51;
  id v84 = v53;
  unsigned int v54 = (uint64_t *)v52;
  v85 = v54;
  id v86 = &v92;
  LOBYTE(v52) = [v53 executeStatement:@"ClearExternalDataPendingDeletion" statementBlock:buf];

  _Block_object_dispose(&v92, 8);
  if ((v52 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      id v59 = MEMORY[0x1E4F14500];
      uint64_t v60 = "Assertion failed: ClearExternalDataPendingDeletion(_db, ((void *)0), externalResourceUUID)";
      goto LABEL_38;
    }
LABEL_31:
    uint64_t v55 = 0;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v55 = 1;
LABEL_22:
  _Block_object_dispose(&v76, 8);
  return v55;
}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a4;
  return 0;
}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_604(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)getDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke;
  v22[3] = &unk_1E53D97C0;
  void v22[4] = self;
  id v23 = v12;
  unint64_t v26 = a4;
  BOOL v27 = a5;
  id v24 = v13;
  id v25 = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3;
  v19[3] = &unk_1E53D8C88;
  id v20 = v24;
  id v21 = v25;
  id v16 = v25;
  id v17 = v24;
  id v18 = v12;
  [(GEOSQLiteDB *)db executeAsync:v22 errorHandler:v19];
}

void __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  id v16 = 0;
  id v6 = [v2 _dataForOfflineKeyOnDBQueue:v3 version:v4 associatedWithFullyLoadedSubscription:v5 error:&v16];
  id v7 = v16;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2;
  v12[3] = &unk_1E53D95B8;
  uint64_t v8 = *(NSObject **)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v14 = v7;
  id v15 = v9;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)dataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__5;
  id v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__5;
  BOOL v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke;
  v17[3] = &unk_1E53D97E8;
  id v19 = &v29;
  void v17[4] = self;
  id v12 = v10;
  id v20 = &v23;
  unint64_t v21 = a4;
  BOOL v22 = a5;
  id v18 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
  void v16[3] = &unk_1E53D9810;
  void v16[4] = &v23;
  [(GEOSQLiteDB *)db executeSync:v17 errorHandler:v16];
  id v13 = v30;
  if (a6)
  {
    if (v30[5])
    {
      *a6 = 0;
    }
    else
    {
      *a6 = (id) v24[5];
      id v13 = v30;
    }
  }
  id v14 = (id)v13[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 _dataForOfflineKeyOnDBQueue:v3 version:v5 associatedWithFullyLoadedSubscription:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)_dataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v96 = 0;
  id v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = -1;
  uint64_t v90 = 0;
  int v91 = &v90;
  uint64_t v92 = 0x3032000000;
  id v93 = __Block_byref_object_copy__5;
  uint64_t v94 = __Block_byref_object_dispose__5;
  id v95 = 0;
  db = self->_db;
  if (v7)
  {
    int v13 = [v10 layer];
    id v14 = [v10 serviceKey];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke;
    v89[3] = &unk_1E53D9048;
    v89[4] = &v96;
    v89[5] = &v90;
    char DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKeyInFullyLoadedSubscription(db, a6, v13, a4, v14, v89);
  }
  else
  {
    int v16 = [v10 layer];
    id v17 = [v10 serviceKey];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
    v88[3] = &unk_1E53D9048;
    v88[4] = &v96;
    v88[5] = &v90;
    char DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKey(db, a6, v16, a4, v17, v88);
  }
  if ((DataForOfflineKeyInFullyLoadedSubscription & 1) == 0) {
    goto LABEL_12;
  }
  if (a6) {
    *a6 = 0;
  }
  id v18 = v97;
  if (v97[3] == -1)
  {
LABEL_12:
    unint64_t v26 = 0;
    goto LABEL_34;
  }
  id v19 = (void *)v91[5];
  if (v19)
  {
    externalDataDirectory = self->_externalDataDirectory;
    unint64_t v21 = [v19 UUIDString];
    BOOL v22 = -[NSURL URLByAppendingPathComponent:isDirectory:](externalDataDirectory, "URLByAppendingPathComponent:isDirectory:", v21, [v10 layer] == 12);

    uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v24 = [v22 path];
    int v25 = [v23 fileExistsAtPath:v24];

    if (v25)
    {
      if ([v10 layer] == 12)
      {
        unint64_t v26 = [[GEOTileData alloc] initWithFileURL:v22];
      }
      else
      {
        BOOL v27 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v22 error:0];
        if (v27) {
          unint64_t v26 = [[GEOTileData alloc] initWithFileHandle:v27];
        }
        else {
          unint64_t v26 = 0;
        }
      }
    }
    else
    {
      unint64_t v26 = 0;
    }

    id v18 = v97;
  }
  else
  {
    unint64_t v26 = 0;
  }
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = -1;
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x3032000000;
  uint64_t v81 = __Block_byref_object_copy__5;
  unint64_t v82 = __Block_byref_object_dispose__5;
  id v83 = 0;
  uint64_t v74 = 0;
  long long v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v70 = 0;
  long long v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  id v28 = self->_db;
  uint64_t v29 = v18[3];
  uint64_t v57 = MEMORY[0x1E4F143A8];
  uint64_t v58 = 3221225472;
  id v59 = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_3;
  uint64_t v60 = &unk_1E53D9838;
  unint64_t v61 = &v84;
  uint64_t v62 = &v78;
  uint64_t v63 = &v74;
  uint64_t v64 = &v70;
  uint64_t v65 = &v66;
  id v30 = v28;
  uint64_t v31 = &v57;
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x3032000000;
  uint64_t v103 = __Block_byref_object_copy__5;
  uint64_t v104 = __Block_byref_object_dispose__5;
  id v105 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v107 = __GetBatchDataForOfflineDataPK_block_invoke;
  uint64_t v108 = &unk_1E53D9BC8;
  id v32 = v30;
  uint64_t v111 = &v100;
  uint64_t v112 = v29;
  uint64_t v109 = v32;
  id v33 = v31;
  v110 = v33;
  [(GEOSQLiteDB *)v32 statementForKey:@"GetBatchDataForOfflineDataPK" statementBlock:&buf];

  _Block_object_dispose(&v100, 8);
  if (v26) {
    goto LABEL_32;
  }
  if (!v79[5])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_54;
    }
    LOWORD(buf) = 0;
    id v52 = MEMORY[0x1E4F14500];
    id v53 = "Assertion failed: batchUUID != ((void *)0)";
    goto LABEL_39;
  }
  if (v67[3] + v71[3] > (unint64_t)v75[3])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_54;
    }
    LOWORD(buf) = 0;
    id v52 = MEMORY[0x1E4F14500];
    id v53 = "Assertion failed: offsetIntoBatch + sizeInBatch <= batchSize";
    goto LABEL_39;
  }
  id v34 = GEOGetTileDBLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_188D96000, v34, OS_LOG_TYPE_DEBUG, "Extracting key %{private}@ from containing batch", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v35 = self->_externalDataDirectory;
  uint64_t v36 = [(id)v79[5] UUIDString];
  int v37 = [(NSURL *)v35 URLByAppendingPathComponent:v36 isDirectory:0];

  uint64_t v38 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v37 error:a6];
  id v39 = v38;
  if (!v38)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_47:

      goto LABEL_54;
    }
    LOWORD(buf) = 0;
    unsigned int v54 = MEMORY[0x1E4F14500];
    uint64_t v55 = "Assertion failed: fileHandle != ((void *)0)";
LABEL_56:
    _os_log_fault_impl(&dword_188D96000, v54, OS_LOG_TYPE_FAULT, v55, (uint8_t *)&buf, 2u);
    goto LABEL_47;
  }
  if (([v38 seekToOffset:v71[3] error:a6] & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_47;
    }
    LOWORD(buf) = 0;
    unsigned int v54 = MEMORY[0x1E4F14500];
    uint64_t v55 = "Assertion failed: [fileHandle seekToOffset:offsetIntoBatch error:errorPtr]";
    goto LABEL_56;
  }
  id v40 = -[GEOTileDB extractDataForOfflineKey:fromBatchFileHandle:batchSize:sizeInBatch:externalDataDirectory:error:]((uint64_t)self, v10, v39, v75[3], v67[3], self->_externalDataDirectory, a6);
  id v41 = v40;
  if (!v40)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: extracted != ((void *)0)", (uint8_t *)&buf, 2u);
    }
    goto LABEL_53;
  }
  id v42 = [v40 externalResourceUUID];
  BOOL v43 = v42 == 0;

  if (!v43)
  {
    uint64_t v44 = self->_db;
    uint64_t v45 = v97[3];
    int v46 = [v41 externalResourceUUID];
    uint64_t v56 = v37;
    uint64_t v47 = v44;
    id v48 = v46;
    uint64_t v100 = 0;
    uint64_t v101 = &v100;
    uint64_t v102 = 0x3032000000;
    uint64_t v103 = __Block_byref_object_copy__5;
    uint64_t v104 = __Block_byref_object_dispose__5;
    id v105 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v107 = __SetOfflineDataExtUUID_block_invoke;
    uint64_t v108 = &unk_1E53D7A28;
    id v49 = v47;
    uint64_t v111 = &v100;
    uint64_t v112 = v45;
    uint64_t v109 = v49;
    id v50 = (uint64_t *)v48;
    v110 = v50;
    [(GEOSQLiteDB *)v49 executeStatement:@"SetOfflineDataExtUUID" statementBlock:&buf];

    _Block_object_dispose(&v100, 8);
  }
  objc_msgSend(v41, "data", v56, v57, v58, v59, v60, v61, v62, v63, v64, v65);
  unint64_t v26 = (GEOTileData *)objc_claimAutoreleasedReturnValue();
  if (([v39 closeAndReturnError:a6] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [fileHandle closeAndReturnError:errorPtr]", (uint8_t *)&buf, 2u);
    }

LABEL_53:
    goto LABEL_54;
  }

  if (!v26)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_54:
      unint64_t v26 = 0;
      goto LABEL_33;
    }
    LOWORD(buf) = 0;
    id v52 = MEMORY[0x1E4F14500];
    id v53 = "Assertion failed: result != ((void *)0)";
LABEL_39:
    _os_log_fault_impl(&dword_188D96000, v52, OS_LOG_TYPE_FAULT, v53, (uint8_t *)&buf, 2u);
    goto LABEL_54;
  }
LABEL_32:
  [(GEOTileDB *)self _setLastAccessTime:v85[3] forMostRecentlyUsedSubscriptionReferencingDataRow:CFAbsoluteTimeGetCurrent()];
LABEL_33:
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
LABEL_34:
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);

  return v26;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13 = a4;
  if (((a7 | a6) & 0x8000000000000000) == 0)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    *(void *)(*(void *)(a1[6] + 8) + 24) = a5;
    *(void *)(*(void *)(a1[7] + 8) + 24) = a6;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a7;
  }

  return 0;
}

- (void)determineIfOfflineDataExistsForKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke;
  v22[3] = &unk_1E53D97C0;
  void v22[4] = self;
  id v23 = v12;
  unint64_t v26 = a4;
  BOOL v27 = a5;
  id v24 = v13;
  id v25 = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3;
  v19[3] = &unk_1E53D8C88;
  id v20 = v24;
  id v21 = v25;
  id v16 = v25;
  id v17 = v24;
  id v18 = v12;
  [(GEOSQLiteDB *)db executeAsync:v22 errorHandler:v19];
}

void __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  id v15 = 0;
  char v6 = [v2 _hasDataForOfflineKeyOnDBQueue:v3 version:v4 associatedWithFullyLoadedSubscription:v5 error:&v15];
  id v7 = v15;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E53D94A0;
  uint64_t v8 = *(NSObject **)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  char v14 = v6;
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)hasDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  BOOL v27 = __Block_byref_object_copy__5;
  id v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke;
  v18[3] = &unk_1E53D97E8;
  id v20 = &v30;
  void v18[4] = self;
  id v12 = v10;
  id v21 = &v24;
  unint64_t v22 = a4;
  BOOL v23 = a5;
  id v19 = v12;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
  v17[3] = &unk_1E53D9810;
  void v17[4] = &v24;
  [(GEOSQLiteDB *)db executeSync:v18 errorHandler:v17];
  id v13 = v31;
  if (a6)
  {
    if (*((unsigned char *)v31 + 24) || (char v14 = (void *)v25[5]) == 0)
    {
      *a6 = 0;
    }
    else
    {
      *a6 = v14;
      id v13 = v31;
    }
  }
  char v15 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v2 _hasDataForOfflineKeyOnDBQueue:v3 version:v5 associatedWithFullyLoadedSubscription:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
}

void __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)_hasDataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v26 = 0;
  BOOL v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -1;
  db = self->_db;
  if (v7)
  {
    int v13 = [v10 layer];
    char v14 = [v10 serviceKey];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke;
    v25[3] = &unk_1E53D9860;
    v25[4] = &v26;
    char DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKeyInFullyLoadedSubscription(db, a6, v13, a4, v14, v25);

    if ((DataForOfflineKeyInFullyLoadedSubscription & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        id v16 = MEMORY[0x1E4F14500];
        id v17 = "Assertion failed: GetDataForOfflineKeyInFullyLoadedSubscription(_db, errorPtr, key.layer, version, key.ser"
              "viceKey, ^BOOL(int64_t offline_data_pk, NSUUID *externalDataUUID) { offlineDataPK = offline_data_pk; return __objc_no; })";
LABEL_11:
        _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    int v18 = [v10 layer];
    id v19 = [v10 serviceKey];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_607;
    v23[3] = &unk_1E53D9860;
    void v23[4] = &v26;
    char DataForOfflineKey = GetDataForOfflineKey(db, a6, v18, a4, v19, v23);

    if ((DataForOfflineKey & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        id v16 = MEMORY[0x1E4F14500];
        id v17 = "Assertion failed: GetDataForOfflineKey(_db, errorPtr, key.layer, version, key.serviceKey, ^BOOL(int64_t of"
              "fline_data_pk, NSUUID *externalDataUUID) { offlineDataPK = offline_data_pk; return __objc_no; })";
        goto LABEL_11;
      }
LABEL_9:
      BOOL v21 = 0;
      goto LABEL_7;
    }
  }
  BOOL v21 = v27[3] != -1;
LABEL_7:
  _Block_object_dispose(&v26, 8);

  return v21;
}

uint64_t __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_607(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_setLastAccessTime:(double)a3 forMostRecentlyUsedSubscriptionReferencingDataRow:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = -1;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  db = self->_db;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  BOOL v21 = __82__GEOTileDB__setLastAccessTime_forMostRecentlyUsedSubscriptionReferencingDataRow___block_invoke;
  unint64_t v22 = &unk_1E53D9888;
  BOOL v23 = &v29;
  uint64_t v24 = &v25;
  id v8 = db;
  id v9 = &v19;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__5;
  int v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v40 = __FetchSubscriptionsReferencingData_block_invoke;
  id v41 = &unk_1E53D9BC8;
  id v10 = v8;
  uint64_t v44 = &v33;
  int64_t v45 = a4;
  id v42 = v10;
  id v11 = v9;
  BOOL v43 = v11;
  [(GEOSQLiteDB *)v10 statementForKey:@"FetchSubscriptionsReferencingData", &buf, v19, v20, v21, v22, v23, v24 statementBlock];

  _Block_object_dispose(&v33, 8);
  id v12 = (uint64_t *)v30[3];
  if (v12 != (uint64_t *)-1)
  {
    unint64_t v13 = (unint64_t)(*MEMORY[0x1E4F1CF78] + a3);
    unint64_t v14 = v26[3];
    if (v13 < v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: newTimestamp >= mostRecentlyUsedSubscriptionTimestamp", (uint8_t *)&buf, 2u);
      }
    }
    else if (v14 && self->_timestampDeltaWriteThreshold >= (double)(v13 - v14))
    {
      id v17 = GEOGetTileDBLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v18 = v13 - v26[3];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Subscription last-access timestamp has not changed sufficiently (only %llu). Not writing.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      char v15 = self->_db;
      uint64_t v33 = 0;
      id v34 = &v33;
      uint64_t v35 = 0x3032000000;
      uint64_t v36 = __Block_byref_object_copy__5;
      int v37 = __Block_byref_object_dispose__5;
      id v38 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v40 = __SetSubscriptionLastAccessTime_block_invoke;
      id v41 = &unk_1E53D9C90;
      id v16 = v15;
      id v42 = v16;
      BOOL v43 = &v33;
      uint64_t v44 = v12;
      int64_t v45 = v13;
      [(GEOSQLiteDB *)v16 executeStatement:@"SetSubscriptionLastAccessTime" statementBlock:&buf];

      _Block_object_dispose(&v33, 8);
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

uint64_t __82__GEOTileDB__setLastAccessTime_forMostRecentlyUsedSubscriptionReferencingDataRow___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v3 + 24) == -1
    || ((v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) != 0 ? (BOOL v5 = v4 >= a3) : (BOOL v5 = 0), !v5))
  {
    *(void *)(v3 + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return 1;
}

- (void)getOfflineKeysForLayer:(unsigned int)a3 version:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke;
  v18[3] = &unk_1E53D98B0;
  unsigned int v22 = a3;
  void v18[4] = self;
  unint64_t v21 = a4;
  id v19 = v10;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_3;
  v15[3] = &unk_1E53D8C88;
  id v16 = v19;
  id v17 = v20;
  id v13 = v20;
  id v14 = v19;
  [(GEOSQLiteDB *)db executeAsync:v18 errorHandler:v15];
}

void __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 56);
  id v15 = 0;
  BOOL v5 = [v2 _getOfflineKeysForLayerOnDBQueue:v3 version:v4 error:&v15];
  id v6 = v15;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E53D95B8;
  BOOL v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_getOfflineKeysForLayerOnDBQueue:(unsigned int)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__5;
  uint64_t v24 = __Block_byref_object_dispose__5;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__GEOTileDB__getOfflineKeysForLayerOnDBQueue_version_error___block_invoke;
  v18[3] = &unk_1E53D98D8;
  unsigned int v19 = a3;
  void v18[4] = &v20;
  id v10 = db;
  id v11 = v18;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__5;
  uint64_t v36 = __Block_byref_object_dispose__5;
  id v37 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __GetAvailableOfflineKeys_block_invoke;
  v26[3] = &unk_1E53D9BF0;
  id v12 = v10;
  unsigned int v31 = a3;
  uint64_t v27 = v12;
  uint64_t v29 = &v32;
  unint64_t v30 = a4;
  id v13 = v11;
  id v28 = v13;
  BOOL v14 = [(GEOSQLiteDB *)v12 statementForKey:@"GetAvailableOfflineKeys" statementBlock:v26];
  if (a5)
  {
    id v15 = (void *)v33[5];
    if (v15) {
      *a5 = v15;
    }
  }

  _Block_object_dispose(&v32, 8);
  if (v14) {
    id v16 = (id)v21[5];
  }
  else {
    id v16 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v16;
}

uint64_t __60__GEOTileDB__getOfflineKeysForLayerOnDBQueue_version_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[GEOOfflineDataKey alloc] initWithLayer:*(unsigned int *)(a1 + 40) serviceKey:v3];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  return 1;
}

- (void)determineIfOfflineDataBatchExistsForKey:(id)a3 version:(unint64_t)a4 associatingWithSubscriptionIdentifier:(id)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke;
  v24[3] = &unk_1E53D9950;
  void v24[4] = self;
  id v25 = v12;
  unint64_t v29 = a4;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_4;
  v21[3] = &unk_1E53D8C88;
  id v22 = v27;
  id v23 = v28;
  id v17 = v28;
  id v18 = v27;
  id v19 = v13;
  id v20 = v12;
  [(GEOSQLiteDB *)db executeAsync:v24 errorHandler:v21];
}

void __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = -1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  void v16[3] = __Block_byref_object_copy__5;
  void v16[4] = __Block_byref_object_dispose__5;
  id v17 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  int v3 = [*(id *)(a1 + 40) layer];
  uint64_t v4 = *(void *)(a1 + 72);
  id v5 = [*(id *)(a1 + 40) key];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E53D9900;
  void v11[4] = &v18;
  void v11[5] = v16;
  v11[6] = &v12;
  CheckExistenceOfOfflineBatchKey(v2, v3, v4, v5, v11);

  if (v19[3] != -1 && *(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "_markDataAtRow:associatedWithSubscriptionIdentifier:", v13[3]);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_3;
  void v7[3] = &unk_1E53D9928;
  id v6 = *(NSObject **)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = &v18;
  id v10 = v16;
  dispatch_async(v6, v7);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_2(void *a1, uint64_t a2, id obj, uint64_t a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v7 = obj;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;

  return 0;
}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24) != -1, *(void *)(*(void *)(a1[6] + 8) + 40), 0);
}

void __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_5;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_4;
  void v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_deleteOfflineDataNotMatchingVersions:(id)a3 orVersions:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = v6;
  uint64_t v8 = [v6 count];
  uint64_t v33 = v7;
  if (v8 + [v7 count])
  {
    id v9 = GEOGetTileDBLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Deleting offline data not matching active or latest versions", buf, 2u);
    }

    id v10 = (void *)MEMORY[0x1E4F1CA80];
    id v11 = [v6 allKeys];
    uint64_t v12 = [v10 setWithArray:v11];

    if (v7)
    {
      id v13 = [v7 allKeys];
      [v12 addObjectsFromArray:v13];
    }
    *(void *)long long buf = 0;
    id v42 = buf;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
          int v18 = [v17 unsignedIntValue];
          uint64_t v19 = [v32 objectForKeyedSubscript:v17];
          uint64_t v20 = [v33 objectForKeyedSubscript:v17];
          uint64_t v21 = (void *)v20;
          if (v19 | v20)
          {
            BOOL v22 = v20 == 0;
            if (v19) {
              id v23 = (void *)v19;
            }
            else {
              id v23 = (void *)v20;
            }
            id v24 = v23;

            if (v22) {
              id v25 = (void *)v19;
            }
            else {
              id v25 = v21;
            }
            id v26 = v25;

            uint64_t v27 = [v24 unsignedLongLongValue];
            uint64_t v28 = [v26 unsignedLongLongValue];
            db = self->_db;
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke;
            v34[3] = &unk_1E53D99C8;
            int v35 = v18;
            v34[6] = v27;
            v34[7] = v28;
            void v34[4] = self;
            v34[5] = buf;
            [(GEOSQLiteDB *)db executeInTransaction:v34];
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)uint64_t v36 = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: versionNumber != nil || otherVersionNumber != nil", v36, 2u);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        uint64_t v14 = v30;
      }
      while (v30);
    }

    if (v42[24]) {
      [(GEOTileDB *)self _cleanUpDeletedExternalDataIfNecessary];
    }
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  int v4 = *(_DWORD *)(a1 + 64);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke_2;
  v50[3] = &unk_1E53D99A0;
  long long v51 = *(_OWORD *)(a1 + 48);
  v50[4] = &v52;
  id v5 = v3;
  id v6 = v50;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__5;
  uint64_t v60 = __Block_byref_object_dispose__5;
  id v61 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __GetAllOfflineDataBatchVersionsForLayer_block_invoke;
  uint64_t v63 = &unk_1E53D9DA8;
  id v7 = v5;
  DWORD2(v66) = v4;
  uint64_t v64 = v7;
  *(void *)&long long v66 = &v56;
  uint64_t v8 = v6;
  uint64_t v65 = v8;
  LOBYTE(v6) = [v7 statementForKey:@"GetAllOfflineDataBatchVersionsForLayer" statementBlock:buf];

  _Block_object_dispose(&v56, 8);
  if ((v6 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    *(_WORD *)long long buf = 0;
    id v41 = MEMORY[0x1E4F14500];
    id v42 = "Assertion failed: GetAllOfflineDataBatchVersionsForLayer(_db, ((void *)0), layer, ^BOOL(uint64_t version) { if"
          " (version != versionToPreserve && version != otherVersionToPreserve) { hasVersionToDelete = __objc_yes; } retu"
          "rn !hasVersionToDelete; })";
    goto LABEL_33;
  }
  int v9 = *((unsigned __int8 *)v53 + 24);
  id v10 = GEOGetTileDBLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(unsigned int *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void **)(a1 + 56);
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2050;
      uint64_t v63 = v14;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Deleting offline data for layer %llu not matching versions %{public}llu/%{public}llu", buf, 0x20u);
    }

    int v15 = *(_DWORD *)(a1 + 64);
    long long v43 = *(_OWORD *)(a1 + 48);
    id v16 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x3032000000;
    id v59 = __Block_byref_object_copy__5;
    uint64_t v60 = __Block_byref_object_dispose__5;
    id v61 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions_block_invoke;
    uint64_t v63 = &unk_1E53D9C68;
    id v17 = v16;
    int v67 = v15;
    uint64_t v64 = v17;
    uint64_t v65 = &v56;
    long long v66 = v43;
    LOBYTE(v15) = [v17 executeStatement:@"MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions" statementBlock:buf];

    _Block_object_dispose(&v56, 8);
    if (v15)
    {
      int v18 = *(_DWORD *)(a1 + 64);
      long long v44 = *(_OWORD *)(a1 + 48);
      id v19 = *(id *)(*(void *)(a1 + 32) + 8);
      uint64_t v56 = 0;
      uint64_t v57 = &v56;
      uint64_t v58 = 0x3032000000;
      id v59 = __Block_byref_object_copy__5;
      uint64_t v60 = __Block_byref_object_dispose__5;
      id v61 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __MarkForDeletionExternalDataForOfflineDataNotMatchingVersions_block_invoke;
      uint64_t v63 = &unk_1E53D9C68;
      uint64_t v20 = v19;
      int v67 = v18;
      uint64_t v64 = v20;
      uint64_t v65 = &v56;
      long long v66 = v44;
      LOBYTE(v18) = [v20 executeStatement:@"MarkForDeletionExternalDataForOfflineDataNotMatchingVersions" statementBlock:buf];

      _Block_object_dispose(&v56, 8);
      if (v18)
      {
        int v21 = *(_DWORD *)(a1 + 64);
        long long v45 = *(_OWORD *)(a1 + 48);
        id v22 = *(id *)(*(void *)(a1 + 32) + 8);
        uint64_t v56 = 0;
        uint64_t v57 = &v56;
        uint64_t v58 = 0x3032000000;
        id v59 = __Block_byref_object_copy__5;
        uint64_t v60 = __Block_byref_object_dispose__5;
        id v61 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __DeleteOfflineDataBatchRefsNotMatchingVersions_block_invoke;
        uint64_t v63 = &unk_1E53D9C68;
        id v23 = v22;
        int v67 = v21;
        uint64_t v64 = v23;
        uint64_t v65 = &v56;
        long long v66 = v45;
        LOBYTE(v21) = [v23 executeStatement:@"DeleteOfflineDataBatchRefsNotMatchingVersions" statementBlock:buf];

        _Block_object_dispose(&v56, 8);
        if (v21)
        {
          int v24 = *(_DWORD *)(a1 + 64);
          long long v46 = *(_OWORD *)(a1 + 48);
          id v25 = *(id *)(*(void *)(a1 + 32) + 8);
          uint64_t v56 = 0;
          uint64_t v57 = &v56;
          uint64_t v58 = 0x3032000000;
          id v59 = __Block_byref_object_copy__5;
          uint64_t v60 = __Block_byref_object_dispose__5;
          id v61 = 0;
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __DeleteOfflineDataNotMatchingVersions_block_invoke;
          uint64_t v63 = &unk_1E53D9C68;
          id v26 = v25;
          int v67 = v24;
          uint64_t v64 = v26;
          uint64_t v65 = &v56;
          long long v66 = v46;
          LOBYTE(v24) = [v26 executeStatement:@"DeleteOfflineDataNotMatchingVersions" statementBlock:buf];

          _Block_object_dispose(&v56, 8);
          if (v24)
          {
            int v27 = *(_DWORD *)(a1 + 64);
            long long v47 = *(_OWORD *)(a1 + 48);
            id v28 = *(id *)(*(void *)(a1 + 32) + 8);
            uint64_t v56 = 0;
            uint64_t v57 = &v56;
            uint64_t v58 = 0x3032000000;
            id v59 = __Block_byref_object_copy__5;
            uint64_t v60 = __Block_byref_object_dispose__5;
            id v61 = 0;
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __DeleteDataForOfflineBatchesNotMatchingVersions_block_invoke;
            uint64_t v63 = &unk_1E53D9C68;
            unint64_t v29 = v28;
            int v67 = v27;
            uint64_t v64 = v29;
            uint64_t v65 = &v56;
            long long v66 = v47;
            LOBYTE(v27) = [v29 executeStatement:@"DeleteDataForOfflineBatchesNotMatchingVersions" statementBlock:buf];

            _Block_object_dispose(&v56, 8);
            if (v27)
            {
              int v30 = *(_DWORD *)(a1 + 64);
              long long v48 = *(_OWORD *)(a1 + 48);
              id v31 = *(id *)(*(void *)(a1 + 32) + 8);
              uint64_t v56 = 0;
              uint64_t v57 = &v56;
              uint64_t v58 = 0x3032000000;
              id v59 = __Block_byref_object_copy__5;
              uint64_t v60 = __Block_byref_object_dispose__5;
              id v61 = 0;
              *(void *)long long buf = MEMORY[0x1E4F143A8];
              *(void *)&uint8_t buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __DeleteOfflineDataBatchNotMatchingVersions_block_invoke;
              uint64_t v63 = &unk_1E53D9C68;
              uint64_t v32 = v31;
              int v67 = v30;
              uint64_t v64 = v32;
              uint64_t v65 = &v56;
              long long v66 = v48;
              LOBYTE(v30) = [v32 executeStatement:@"DeleteOfflineDataBatchNotMatchingVersions" statementBlock:buf];

              _Block_object_dispose(&v56, 8);
              if (v30)
              {
                int v33 = *(_DWORD *)(a1 + 64);
                long long v49 = *(_OWORD *)(a1 + 48);
                id v34 = *(id *)(*(void *)(a1 + 32) + 8);
                uint64_t v56 = 0;
                uint64_t v57 = &v56;
                uint64_t v58 = 0x3032000000;
                id v59 = __Block_byref_object_copy__5;
                uint64_t v60 = __Block_byref_object_dispose__5;
                id v61 = 0;
                *(void *)long long buf = MEMORY[0x1E4F143A8];
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = __ClearSubscriptionDataStatesNotMatchingVersions_block_invoke;
                uint64_t v63 = &unk_1E53D9FD8;
                id v11 = v34;
                uint64_t v64 = v11;
                uint64_t v65 = &v56;
                int v67 = 1024;
                int v68 = v33;
                long long v66 = v49;
                LOBYTE(v33) = [v11 executeStatement:@"ClearSubscriptionDataStatesNotMatchingVersions" statementBlock:buf];

                _Block_object_dispose(&v56, 8);
                if (v33)
                {
                  uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
                  int v36 = 1;
                  *(unsigned char *)(v35 + 24) = 1;
                  goto LABEL_16;
                }
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  id v41 = MEMORY[0x1E4F14500];
                  id v42 = "Assertion failed: ClearSubscriptionDataStatesNotMatchingVersions(_db, ((void *)0), (uint32_t)GEO"
                        "MapDataSubscriptionDataTypeOffline, layer, versionToPreserve, otherVersionToPreserve)";
                  goto LABEL_33;
                }
LABEL_34:
                int v36 = 0;
                LODWORD(v11) = 0;
                goto LABEL_16;
              }
              if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                goto LABEL_34;
              }
              *(_WORD *)long long buf = 0;
              id v41 = MEMORY[0x1E4F14500];
              id v42 = "Assertion failed: DeleteOfflineDataBatchNotMatchingVersions(_db, ((void *)0), layer, versionToPreser"
                    "ve, otherVersionToPreserve)";
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                goto LABEL_34;
              }
              *(_WORD *)long long buf = 0;
              id v41 = MEMORY[0x1E4F14500];
              id v42 = "Assertion failed: DeleteDataForOfflineBatchesNotMatchingVersions(_db, ((void *)0), layer, versionToP"
                    "reserve, otherVersionToPreserve)";
            }
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
              goto LABEL_34;
            }
            *(_WORD *)long long buf = 0;
            id v41 = MEMORY[0x1E4F14500];
            id v42 = "Assertion failed: DeleteOfflineDataNotMatchingVersions(_db, ((void *)0), layer, versionToPreserve, oth"
                  "erVersionToPreserve)";
          }
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_34;
          }
          *(_WORD *)long long buf = 0;
          id v41 = MEMORY[0x1E4F14500];
          id v42 = "Assertion failed: DeleteOfflineDataBatchRefsNotMatchingVersions(_db, ((void *)0), layer, versionToPreser"
                "ve, otherVersionToPreserve)";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_34;
        }
        *(_WORD *)long long buf = 0;
        id v41 = MEMORY[0x1E4F14500];
        id v42 = "Assertion failed: MarkForDeletionExternalDataForOfflineDataNotMatchingVersions(_db, ((void *)0), layer, ve"
              "rsionToPreserve, otherVersionToPreserve)";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)long long buf = 0;
      id v41 = MEMORY[0x1E4F14500];
      id v42 = "Assertion failed: MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions(_db, ((void *)0), layer, v"
            "ersionToPreserve, otherVersionToPreserve)";
    }
LABEL_33:
    _os_log_fault_impl(&dword_188D96000, v41, OS_LOG_TYPE_FAULT, v42, buf, 2u);
    goto LABEL_34;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = *(unsigned int *)(a1 + 64);
    uint64_t v38 = *(void *)(a1 + 48);
    long long v39 = *(void **)(a1 + 56);
    *(_DWORD *)long long buf = 134218496;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2050;
    uint64_t v63 = v39;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Database contains no data for layer %llu not matching versions %{public}llu/%{public}llu. Nothing to delete.", buf, 0x20u);
  }

  int v36 = 0;
  LODWORD(v11) = 1;
LABEL_16:
  _Block_object_dispose(&v52, 8);
  return (v36 | v11) & 1;
}

BOOL __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke_2(void *a1, uint64_t a2)
{
  if (a1[5] != a2 && a1[6] != a2) {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  }
  return *(unsigned char *)(*(void *)(a1[4] + 8) + 24) == 0;
}

- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__GEOTileDB_offlineDataConfiguration_didChangeActiveVersions___block_invoke;
  v11[3] = &unk_1E53D99F0;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(GEOSQLiteDB *)db executeFromIsolationQueue:v11];
}

void __62__GEOTileDB_offlineDataConfiguration_didChangeActiveVersions___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) latestAvailableVersions];
  [v1 _deleteOfflineDataNotMatchingVersions:v2 orVersions:v3];
}

- (void)offlineDataConfiguration:(id)a3 didChangeLatestAvailableVersions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__GEOTileDB_offlineDataConfiguration_didChangeLatestAvailableVersions___block_invoke;
  v11[3] = &unk_1E53D99F0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(GEOSQLiteDB *)db executeFromIsolationQueue:v11];
}

void __71__GEOTileDB_offlineDataConfiguration_didChangeLatestAvailableVersions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) activeVersions];
  [v2 _deleteOfflineDataNotMatchingVersions:v3 orVersions:*(void *)(a1 + 48)];
}

- (void)offlineDataConfiguration:(id)a3 didChangeRegulatoryRegionID:(unsigned int)a4
{
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__GEOTileDB_offlineDataConfiguration_didChangeRegulatoryRegionID___block_invoke;
  v5[3] = &unk_1E53D79D8;
  v5[4] = self;
  -[GEOSQLiteDB executeFromIsolationQueue:](db, "executeFromIsolationQueue:", v5, *(void *)&a4);
}

uint64_t __66__GEOTileDB_offlineDataConfiguration_didChangeRegulatoryRegionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireOfflineSubscriptionsForRegulatoryRegionIfNecessary];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideLocale, 0);
  objc_storeStrong(&self->_tileElevationConfigListener, 0);
  objc_storeStrong(&self->_timestampDeltaWriteThresholdConfigListener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_createdExternalDataDirectoryIsolater, 0);
  objc_storeStrong((id *)&self->_externalDataDirectory, 0);
  objc_storeStrong((id *)&self->_dbDirectory, 0);
  objc_storeStrong((id *)&self->_editionsMap, 0);
  objc_storeStrong((id *)&self->_devicePostureRegion, 0);
  objc_storeStrong((id *)&self->_devicePostureCountry, 0);
  objc_storeStrong((id *)&self->_devicePostureLocale, 0);
  objc_storeStrong((id *)&self->_infrequentlyChangingMetadataIsolater, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

- (void)storeShiftResponse:(id)a3
{
}

- (void)storeShiftResponse:(id)a3 forSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v8 length])
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceReferenceDate];
    unint64_t v11 = (unint64_t)v10;

    db = self->_db;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke;
    v14[3] = &unk_1E53D9A40;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v8;
    unint64_t v18 = v11;
    id v17 = v7;
    [(GEOSQLiteDB *)db executeAsync:v14];
  }
  else
  {
    id v13 = GEOGetTileDBLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "unable to store response, data length == 0", buf, 2u);
    }
  }
}

void __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke_2;
  void v7[3] = &unk_1E53D9A18;
  void v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v11 = v5;
  id v10 = v6;
  [v3 executeInTransaction:v7];
}

uint64_t __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  [*(id *)(a1 + 40) originalCoordinate];
  uint64_t v4 = v3;
  [*(id *)(a1 + 40) originalCoordinate];
  uint64_t v6 = v5;
  id v7 = v2;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__5;
  long long v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __RemoveExactShiftEntry_block_invoke;
  int v27 = &unk_1E53D9C90;
  id v8 = v7;
  id v28 = v8;
  unint64_t v29 = &v35;
  uint64_t v30 = v4;
  uint64_t v31 = v6;
  [v8 executeStatement:@"RemoveExactShiftEntry" statementBlock:&v24];

  _Block_object_dispose(&v35, 8);
  uint64_t result = InsertData(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 48), 0, [*(id *)(a1 + 48) length], 0);
  if (result)
  {
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) lastInsertRowID];
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void *)(a1 + 64);
    [*(id *)(a1 + 40) originalCoordinate];
    uint64_t v14 = v13;
    [*(id *)(a1 + 40) originalCoordinate];
    uint64_t v16 = v15;
    [*(id *)(a1 + 40) radius];
    uint64_t v18 = v17;
    id v19 = v11;
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__5;
    long long v39 = __Block_byref_object_dispose__5;
    id v40 = 0;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __AddShiftEntry_block_invoke;
    int v27 = &unk_1E53D9CE0;
    id v20 = v19;
    unint64_t v29 = &v35;
    uint64_t v30 = v12;
    id v28 = v20;
    uint64_t v31 = v14;
    uint64_t v32 = v16;
    uint64_t v33 = v18;
    uint64_t v34 = v10;
    int v21 = [v20 executeStatement:@"AddShiftEntry" statementBlock:&v24];

    _Block_object_dispose(&v35, 8);
    if (v21)
    {
      id v22 = *(void **)(a1 + 32);
      id v23 = [*(id *)(a1 + 56) identifier];
      [v22 _markDataAtRow:v10 associatedWithSubscriptionIdentifier:v23];

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)findShiftResponseForCoordinate:(id)a3 reduceRadius:(double)a4 queue:(id)a5 completion:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v11 = a5;
  uint64_t v12 = (void *)[a6 copy];
  uint64_t v13 = v12;
  db = self->_db;
  if (db)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_2;
    v19[3] = &unk_1E53D9AB8;
    void v19[4] = self;
    double v22 = var0;
    double v23 = var1;
    double v24 = a4;
    id v20 = v11;
    id v21 = v13;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_5;
    void v16[3] = &unk_1E53D8C88;
    uint64_t v17 = v20;
    id v18 = v21;
    [(GEOSQLiteDB *)db executeAsync:v19 errorHandler:v16];

    uint64_t v15 = v20;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke;
    block[3] = &unk_1E53DA028;
    id v26 = v12;
    dispatch_async(v11, block);
    uint64_t v15 = v26;
  }
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_2(uint64_t a1)
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = -1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__5;
  void v20[4] = __Block_byref_object_dispose__5;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__5;
  void v18[4] = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 72);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_3;
  v17[3] = &unk_1E53D9A68;
  void v17[4] = v22;
  void v17[5] = v20;
  v17[6] = v18;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v4 = v2;
  uint64_t v5 = v17;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  uint64_t v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __FindShiftEntry_block_invoke;
  v23[3] = &unk_1E53DA000;
  id v6 = v4;
  id v24 = v6;
  id v26 = &v29;
  long long v27 = v11;
  uint64_t v28 = v3;
  id v7 = v5;
  id v25 = v7;
  [v6 statementForKey:@"FindShiftEntry" statementBlock:v23];
  id v8 = (void *)v30[5];
  if (v8) {
    id v9 = v8;
  }

  _Block_object_dispose(&v29, 8);
  objc_storeStrong(&v19, v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_4;
  block[3] = &unk_1E53D9A90;
  uint64_t v10 = *(NSObject **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = v20;
  uint64_t v15 = v22;
  uint64_t v16 = v18;
  dispatch_async(v10, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  id obj = v8;
  id v9 = v5;
  uint64_t v10 = v9;
  if (v9 && [v9 length])
  {
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&obj];
  }
  else
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-17 reason:@"empty blob"];
    uint64_t v11 = 0;
    id obj = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_storeStrong(v7, obj);
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return 0;
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40));
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_6;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, -1, *(void *)(a1 + 32));
}

- (void)findShiftResponseForCoordinate:(id)a3 withinRadius:(double)a4 queue:(id)a5 completion:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v11 = a5;
  uint64_t v12 = (void *)[a6 copy];
  id v13 = v12;
  db = self->_db;
  if (db)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_2;
    v19[3] = &unk_1E53D9AB8;
    void v19[4] = self;
    double v22 = var0;
    double v23 = var1;
    double v24 = a4;
    id v20 = v11;
    id v21 = v13;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_5;
    void v16[3] = &unk_1E53D8C88;
    uint64_t v17 = v20;
    id v18 = v21;
    [(GEOSQLiteDB *)db executeAsync:v19 errorHandler:v16];

    uint64_t v15 = v20;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke;
    block[3] = &unk_1E53DA028;
    id v26 = v12;
    dispatch_async(v11, block);
    uint64_t v15 = v26;
  }
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_2(uint64_t a1)
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = -1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__5;
  void v20[4] = __Block_byref_object_dispose__5;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__5;
  void v18[4] = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 72);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_3;
  v17[3] = &unk_1E53D9A68;
  void v17[4] = v22;
  void v17[5] = v20;
  v17[6] = v18;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v4 = v2;
  id v5 = v17;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  uint64_t v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __FindShiftEntryWithin_block_invoke;
  v23[3] = &unk_1E53DA000;
  id v6 = v4;
  id v24 = v6;
  id v26 = &v29;
  long long v27 = v11;
  uint64_t v28 = v3;
  id v7 = v5;
  id v25 = v7;
  [v6 statementForKey:@"FindShiftEntryWithin" statementBlock:v23];
  id v8 = (void *)v30[5];
  if (v8) {
    id v9 = v8;
  }

  _Block_object_dispose(&v29, 8);
  objc_storeStrong(&v19, v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_4;
  block[3] = &unk_1E53D9A90;
  uint64_t v10 = *(NSObject **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = v20;
  uint64_t v15 = v22;
  uint64_t v16 = v18;
  dispatch_async(v10, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  id obj = v8;
  id v9 = v5;
  uint64_t v10 = v9;
  if (v9 && [v9 length])
  {
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&obj];
  }
  else
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-17 reason:@"empty blob"];
    uint64_t v11 = 0;
    id obj = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_storeStrong(v7, obj);
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return 0;
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40));
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_6;
  void v7[3] = &unk_1E53D7C50;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, -1, *(void *)(a1 + 32));
}

- (void)linkShiftResponse:(int64_t)a3 toSubscription:(id)a4
{
  id v6 = a4;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__GEOTileDB_GEOLocationShifterPersistence__linkShiftResponse_toSubscription___block_invoke;
  v9[3] = &unk_1E53D9680;
  id v10 = v6;
  int64_t v11 = a3;
  void v9[4] = self;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

void __77__GEOTileDB_GEOLocationShifterPersistence__linkShiftResponse_toSubscription___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v1 _markDataAtRow:v2 associatedWithSubscriptionIdentifier:v3];
}

- (void)pruneShiftEntries
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -GEOConfigGetDouble(GeoServicesConfig_LocationShiftMaxCacheAgeSeconds, (uint64_t)off_1E9113E58));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOTileDB *)self pruneShiftEntriesOlderThan:v3 maximumEntriesToKeep:GEOConfigGetUInteger(GeoServicesConfig_LocationShiftMaxCacheCount, (uint64_t)off_1E9113E68)];
}

- (void)pruneShiftEntriesOlderThan:(id)a3 maximumEntriesToKeep:(int)a4
{
  id v6 = a3;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__GEOTileDB_GEOLocationShifterPersistence__pruneShiftEntriesOlderThan_maximumEntriesToKeep___block_invoke;
  v9[3] = &unk_1E53D7E80;
  int v11 = a4;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

void __92__GEOTileDB_GEOLocationShifterPersistence__pruneShiftEntriesOlderThan_maximumEntriesToKeep___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 >= 1)
  {
    if (v2 >= 0x2710) {
      int v3 = 10000;
    }
    else {
      int v3 = *(_DWORD *)(a1 + 48);
    }
    id v4 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__5;
    id v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v29 = __PruneCachedShiftEntriesByCount_block_invoke;
    uint64_t v30 = &unk_1E53D9D80;
    id v5 = v4;
    LODWORD(v33) = v3;
    id v31 = v5;
    uint64_t v32 = &v22;
    [v5 executeStatement:@"PruneCachedShiftEntriesByCount" statementBlock:&buf];
    id v6 = (void *)v23[5];
    if (v6)
    {
      id v7 = v6;

      _Block_object_dispose(&v22, 8);
      id v8 = v7;
      id v9 = GEOGetTileDBLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Unable to prune locsh cache entries: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {

      _Block_object_dispose(&v22, 8);
    }
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = v10;
    [v11 timeIntervalSinceNow];
    if (v12 < -15552000.0)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");

      id v11 = (id)v13;
    }
    [v11 timeIntervalSinceReferenceDate];
    unint64_t v15 = (unint64_t)v14;
    id v16 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__5;
    id v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v29 = __PruneCachedShiftEntriesByDate_block_invoke;
    uint64_t v30 = &unk_1E53D7A50;
    id v17 = v16;
    uint64_t v32 = &v22;
    unint64_t v33 = v15;
    id v31 = v17;
    [v17 executeStatement:@"PruneCachedShiftEntriesByDate" statementBlock:&buf];
    id v18 = (void *)v23[5];
    if (v18)
    {
      id v19 = v18;

      _Block_object_dispose(&v22, 8);
      id v20 = v19;
      id v21 = GEOGetTileDBLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Unable to prune locsh cache entries: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {

      _Block_object_dispose(&v22, 8);
    }
  }
}

- (void)removeAllShiftEntries
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntries__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

uint64_t __65__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
           "DROP TABLE shiftresponse");
}

- (void)removeAllShiftEntriesSync
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntriesSync__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

uint64_t __69__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntriesSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
           "DROP TABLE shiftresponse");
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_enter(v8);
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke;
  v15[3] = &unk_1E53D9B30;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  double v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

void __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_2;
  void v7[3] = &unk_1E53D9B08;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v3 = v2;
  id v4 = v7;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__5;
  void v14[4] = __Block_byref_object_dispose__5;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __ListAllShiftEntries_block_invoke;
  v10[3] = &unk_1E53D7C78;
  id v5 = v3;
  id v11 = v5;
  id v6 = v4;
  id v12 = v6;
  id v13 = v14;
  [v5 statementForKey:@"ListAllShiftEntries" statementBlock:v10];

  _Block_object_dispose(v14, 8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_2(uint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_3;
  block[3] = &unk_1E53D9AE0;
  id v10 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v15 = v9;
  id v16 = v11;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;
  id v12 = v9;
  dispatch_async_and_wait(v10, block);

  return 1;
}

uint64_t __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (GEOTileDBExtractedData)extractDataForOfflineKey:(void *)a3 fromBatchFileHandle:(size_t)a4 batchSize:(unint64_t)a5 sizeInBatch:(void *)a6 externalDataDirectory:(void *)a7 error:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a6;
  if (a1)
  {
    id v16 = v14;
    *(void *)long long buf = 0;
    if (([v16 getOffset:buf error:a7] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v80 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [fileHandle getOffset:&originalOffset error:outError]", v80, 2u);
      }
      goto LABEL_84;
    }
    if (a5 <= 3)
    {
      uint64_t v17 = 0;
      goto LABEL_15;
    }
    double v18 = [v16 readDataUpToLength:4 error:a7];
    if (v18)
    {
      if ([v16 seekToOffset:*(void *)buf error:a7])
      {
        id v19 = v18;
        uint64_t v20 = *(void *)[v19 bytes];
        uint64_t v17 = 2049;
        if (v20 > 846755425)
        {
          if (v20 != 846755426)
          {
            uint64_t v21 = 1853388386;
LABEL_12:
            if (v20 != v21) {
              uint64_t v17 = 0;
            }
          }
        }
        else if (v20 != 762869346)
        {
          uint64_t v21 = 829978210;
          goto LABEL_12;
        }

LABEL_15:
        id v78 = v14;

        id v74 = v13;
        id v77 = v15;
        if ([v13 layer] == 12)
        {
          id v79 = v16;
          id v22 = v15;
          id v23 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v24 = (void *)MEMORY[0x1E4F1CB10];
          uint64_t v25 = NSTemporaryDirectory();
          id v26 = [v23 UUIDString];
          id v27 = [(id)v25 stringByAppendingPathComponent:v26];
          uint64_t v28 = [v24 fileURLWithPath:v27 isDirectory:0];

          uint64_t v29 = [MEMORY[0x1E4F1C9B8] data];
          LOBYTE(v25) = [v29 writeToURL:v28 atomically:0];

          if (v25)
          {
            uint64_t v30 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v28 error:a7];
            if (v30)
            {
              if (-[GEOTileDB _extractDataFromFileHandle:sizeInBatch:toFileHandle:compressionAlgorithm:error:](v79, a5, v30, v17, a7))
              {
                id v31 = [v23 UUIDString];
                uint64_t v32 = [v22 URLByAppendingPathComponent:v31 isDirectory:1];

                unint64_t v33 = GEOGetTileDBLog_0();
                BOOL v34 = +[GEOUnarchiver unarchiveDataAtURL:v28 toURL:v32 log:v33 error:a7];

                if (([v30 closeAndReturnError:0] & 1) == 0
                  && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [writeHandle closeAndReturnError:NULL]", buf, 2u);
                }
                uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v74);
                [v35 removeItemAtURL:v28 error:0];

                if (v34)
                {
                  int v36 = [[GEOTileData alloc] initWithFileURL:v32];
                  uint64_t v37 = [[GEOTileDBExtractedData alloc] initWithData:v36 externalResourceUUID:v23];

                  id v13 = v75;
                }
                else
                {
                  id v13 = v75;
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: unarchived", buf, 2u);
                  }
                  uint64_t v37 = 0;
                }
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: decompressed", buf, 2u);
                }
                objc_msgSend(v30, "closeAndReturnError:", 0, v74);
                uint64_t v37 = 0;
                id v13 = v76;
              }
            }
            else
            {
              id v13 = v74;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: writeHandle != ((void *)0)", buf, 2u);
              }
              uint64_t v37 = 0;
            }
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [[NSData data] writeToURL:tempURL atomically:__objc_no]", buf, 2u);
            }
            uint64_t v37 = 0;
            id v13 = v74;
          }

          goto LABEL_25;
        }
        id v39 = v13;
        id v22 = v16;
        id v23 = v15;
        id v79 = v39;
        int v40 = [v39 layer];
        if (v40 == 12)
        {
          if (v17 != 2049) {
            goto LABEL_42;
          }
        }
        else
        {
          unint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_DataExternalResourceSizeThreshold, (uint64_t)off_1E9115678);
          if (v17 != 2049)
          {
            if (UInteger <= a5) {
              goto LABEL_42;
            }
            uint64_t v66 = [v22 readDataUpToLength:a5 error:a7];
            if (v66)
            {
              int v67 = (void *)v66;
              int v68 = [[GEOTileData alloc] initWithData:v66];
              uint64_t v37 = [[GEOTileDBExtractedData alloc] initWithData:v68];

LABEL_25:
              id v38 = 0;
              goto LABEL_61;
            }
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
              goto LABEL_103;
            }
            *(_WORD *)long long buf = 0;
            long long v71 = MEMORY[0x1E4F14500];
            uint64_t v72 = "Assertion failed: data != ((void *)0)";
            uint64_t v73 = buf;
            goto LABEL_110;
          }
        }
        id v42 = GEOGetTileDBLog_0();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_DEBUG, "Data appears to be LZFSE-compressed", buf, 2u);
        }

        if (3 * a5 >= GEOConfigGetUInteger(GeoOfflineConfig_DataExternalResourceSizeThreshold, (uint64_t)off_1E9115678)) {
          goto LABEL_42;
        }
        *(void *)long long buf = 0;
        if (objc_msgSend(v22, "getOffset:error:", buf, 0, v13))
        {
          long long v43 = (uint8_t *)mmap(0, a4, 1, 2, [v22 fileDescriptor], 0);
          if (v43)
          {
            long long v44 = v43;
            id v45 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:3 * a5];
            long long v46 = (uint8_t *)[v45 mutableBytes];
            size_t v47 = [v45 length];
            size_t v48 = compression_decode_buffer(v46, v47, &v44[*(void *)buf], a5, 0, (compression_algorithm)v17);
            if (v48 != [v45 length])
            {
              [v45 setLength:v48];
              uint64_t v60 = [[GEOTileData alloc] initWithData:v45];
              uint64_t v37 = [[GEOTileDBExtractedData alloc] initWithData:v60];

              munmap(v44, a4);
LABEL_60:
              id v38 = 0;
              id v13 = v74;
LABEL_61:

              id v61 = v38;
              id v16 = v61;
              if (v37)
              {
                id v15 = v77;
                if (v61)
                {
                  *(void *)uint64_t v80 = 66053;
                  id v16 = v61;
                  int v62 = fsctl((const char *)[v16 fileSystemRepresentation], 0xC0084A44uLL, v80, 0);
                  if (v62)
                  {
                    int v63 = v62;
                    uint64_t v64 = GEOGetTileDBLog_0();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 67109378;
                      *(_DWORD *)&uint8_t buf[4] = v63;
                      *(_WORD *)&uint8_t buf[8] = 2114;
                      *(void *)&buf[10] = v16;
                      _os_log_impl(&dword_188D96000, v64, OS_LOG_TYPE_ERROR, "Failed to mark external resource as purgeable: %i -- %{public}@", buf, 0x12u);
                    }
                  }
                }
                id v14 = v78;
              }
              else
              {
                id v15 = v77;
                id v14 = v78;
              }
              goto LABEL_69;
            }
            long long v49 = GEOGetTileDBLog_0();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)uint64_t v80 = 0;
              _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_DEBUG, "In-memory decompression required too much memory. Will write to file instead", v80, 2u);
            }

            munmap(v44, a4);
LABEL_42:
            id v50 = GEOGetTileDBLog_0();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138477827;
              *(void *)&uint8_t buf[4] = v79;
              _os_log_impl(&dword_188D96000, v50, OS_LOG_TYPE_DEBUG, "Will cache extracted key %{private}@ on-disk", buf, 0xCu);
            }

            long long v51 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v52 = [v51 UUIDString];
            id v53 = [v23 URLByAppendingPathComponent:v52 isDirectory:0];

            uint64_t v54 = [MEMORY[0x1E4F1C9B8] data];
            char v55 = [v54 writeToURL:v53 atomically:0];

            if (v55)
            {
              uint64_t v56 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v53 error:a7];
              if (v56)
              {
                if (-[GEOTileDB _extractDataFromFileHandle:sizeInBatch:toFileHandle:compressionAlgorithm:error:](v22, a5, v56, v17, a7))
                {
                  if (v40 == 12)
                  {
                    uint64_t v57 = [[GEOTileData alloc] initWithFileURL:v53];
                    uint64_t v37 = [[GEOTileDBExtractedData alloc] initWithData:v57 externalResourceUUID:v51];
                  }
                  else
                  {
                    uint64_t v58 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v53 error:0];
                    if (v58)
                    {
                      uint64_t v57 = (GEOTileData *)v58;
                      id v59 = [[GEOTileData alloc] initWithFileHandle:v58];
                      uint64_t v37 = [[GEOTileDBExtractedData alloc] initWithData:v59 externalResourceUUID:v51];
                    }
                    else
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: readHandle != nil", buf, 2u);
                      }
                      uint64_t v57 = 0;
                      uint64_t v37 = 0;
                    }
                  }

                  id v13 = v74;
                  if (([v56 closeAndReturnError:0] & 1) == 0
                    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [writeHandle closeAndReturnError:NULL]", buf, 2u);
                  }
                  if (v37) {
                    id v38 = v53;
                  }
                  else {
                    id v38 = 0;
                  }

                  goto LABEL_61;
                }
                [v56 closeAndReturnError:0];
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: writeHandle != ((void *)0)", buf, 2u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [[NSData data] writeToURL:newExternalResourceFileURL atomically:__objc_no]", buf, 2u);
            }

            uint64_t v37 = 0;
            goto LABEL_60;
          }
          goto LABEL_103;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
LABEL_103:
          uint64_t v37 = 0;
          goto LABEL_25;
        }
        *(_WORD *)uint64_t v80 = 0;
        long long v71 = MEMORY[0x1E4F14500];
        uint64_t v72 = "Assertion failed: [fileHandle getOffset:&offset error:((void *)0)]";
        uint64_t v73 = v80;
LABEL_110:
        _os_log_fault_impl(&dword_188D96000, v71, OS_LOG_TYPE_FAULT, v72, v73, 2u);
        goto LABEL_103;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_83;
      }
      *(_WORD *)uint64_t v80 = 0;
      uint64_t v69 = MEMORY[0x1E4F14500];
      uint64_t v70 = "Assertion failed: [fileHandle seekToOffset:originalOffset error:outError]";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
LABEL_83:

LABEL_84:
        uint64_t v37 = 0;
LABEL_69:

        goto LABEL_70;
      }
      *(_WORD *)uint64_t v80 = 0;
      uint64_t v69 = MEMORY[0x1E4F14500];
      uint64_t v70 = "Assertion failed: firstFourBytes != ((void *)0)";
    }
    _os_log_fault_impl(&dword_188D96000, v69, OS_LOG_TYPE_FAULT, v70, v80, 2u);
    goto LABEL_83;
  }
  uint64_t v37 = 0;
LABEL_70:

  return v37;
}

- (uint64_t)_extractDataFromFileHandle:(void *)a1 sizeInBatch:(unint64_t)a2 toFileHandle:(void *)a3 compressionAlgorithm:(uint64_t)a4 error:(void *)a5
{
  id v9 = a1;
  id v10 = a3;
  if (a4)
  {
    id v11 = GEOGetTileDBLog_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Decompressing data to external file", buf, 2u);
    }

    *(void *)long long buf = 0;
    uint64_t v12 = GEODecompressFileHandleToFileHandle(v9, a2, v10, (compression_algorithm)a4, (id *)buf);
    uint64_t v13 = v12;
    if (a5 && (v12 & 1) == 0) {
      *a5 = *(id *)buf;
    }
    if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: decompressed", v26, 2u);
    }

    goto LABEL_22;
  }
  if (!a2)
  {
    id v14 = 0;
LABEL_20:
    char v20 = 1;
    goto LABEL_21;
  }
  id v14 = 0;
  while (1)
  {
    id v15 = (void *)MEMORY[0x18C1203C0]();
    if (a2 >= 0x8000) {
      uint64_t v16 = 0x8000;
    }
    else {
      uint64_t v16 = a2;
    }
    id v25 = 0;
    uint64_t v17 = [v9 readDataUpToLength:v16 error:&v25];
    id v18 = v25;

    if (!v17)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      id v22 = MEMORY[0x1E4F14500];
      id v23 = "Assertion failed: bytes != nil";
LABEL_27:
      _os_log_fault_impl(&dword_188D96000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
      goto LABEL_31;
    }
    if ([v17 length] != v16)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      id v22 = MEMORY[0x1E4F14500];
      id v23 = "Assertion failed: bytes.length == bytesToRead";
      goto LABEL_27;
    }
    id v24 = 0;
    char v19 = [v10 writeData:v17 error:&v24];
    id v14 = v24;

    if ((v19 & 1) == 0) {
      break;
    }
    a2 -= v16;

    if (!a2) {
      goto LABEL_20;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: wrote", buf, 2u);
  }
  id v18 = v14;
LABEL_31:

  if (a5)
  {
    id v14 = v18;
    char v20 = 0;
    *a5 = v14;
  }
  else
  {
    char v20 = 0;
    id v14 = v18;
  }
LABEL_21:
  unsigned __int8 v28 = v20;

  uint64_t v13 = v28;
LABEL_22:

  return v13;
}

@end
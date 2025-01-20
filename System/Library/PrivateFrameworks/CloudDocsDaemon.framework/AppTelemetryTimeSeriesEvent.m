@interface AppTelemetryTimeSeriesEvent
+ (id)_newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(id)a4 error:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7;
+ (id)itemStatsInvestigationWithFoundInfo:(id)a3;
+ (id)newAggregatedEventWithIdentifier:(int)a3 recordID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7 count:(int64_t)a8;
+ (id)newBasehashSaltingProblemCountWithProblemCount:(int)a3 mangledID:(id)a4 itemIDString:(id)a5;
+ (id)newBoolEvent:(int)a3 eventGroupUUID:(id)a4 value:(BOOL)a5;
+ (id)newCADownloadErrorCountEventWithCount:(int)a3;
+ (id)newCADownloadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7;
+ (id)newCASyncDownErrorCountEventWithCount:(int)a3;
+ (id)newCASyncDownErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6;
+ (id)newCASyncUpItemErrorCountEventWithCount:(int)a3;
+ (id)newCASyncUpItemErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7;
+ (id)newCASyncUpZoneErrorCountEventWithCount:(int)a3;
+ (id)newCASyncUpZoneErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6;
+ (id)newCATotalErrorCountEventWithCount:(int)a3;
+ (id)newCAUploadErrorCountEventWithCount:(int)a3;
+ (id)newCAUploadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7;
+ (id)newChainedDirectoryMissingChainPCSEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5;
+ (id)newChildCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6;
+ (id)newConsistencyCheckerFailedEvent;
+ (id)newContentPolicyProblemCountWithProblemCount:(int)a3;
+ (id)newCorruptPackageDownloadEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 error:(id)a5 itemIDString:(id)a6;
+ (id)newCorruptSharingOptionsProblemWithProblemCount:(int)a3;
+ (id)newDBResetEventWithError:(id)a3 description:(id)a4;
+ (id)newDanglingZombieProblemCountWithProblemCount:(int)a3;
+ (id)newDatabaseIDMismatchEventWithFPDatabaseID:(id)a3 cloudDocsDatabaseID:(id)a4;
+ (id)newDeepScanEventWithReason:(id)a3 appLibrary:(id)a4;
+ (id)newDoubleEvent:(int)a3 eventGroupUUID:(id)a4 value:(double)a5;
+ (id)newEDPKeysMismatchForRecordID:(id)a3 mangledID:(id)a4;
+ (id)newFSEventToSyncUpEventWithDuration:(double)a3;
+ (id)newFileBouncedManyTimes;
+ (id)newFileChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5;
+ (id)newFileReadErrorWithError:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6;
+ (id)newFolderSharePCSChainingEventWithTime:(double)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 errorDescription:(id)a8;
+ (id)newFolderSharingCountMismatchEventWithCount:(int)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
+ (id)newFullyConsistentEvent;
+ (id)newIntEvent:(int)a3 UUID:(id)a4 value:(int)a5;
+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5;
+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5 round:(BOOL)a6;
+ (id)newMissingApplyJobEventWithNumberMissing:(unsigned int)a3;
+ (id)newMissingAssetContentEventWithRecordID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4;
+ (id)newMissingDownloaderJobEventWithNumberMissing:(unsigned int)a3;
+ (id)newMissingPushEventWithNumberOutOfSync:(unsigned int)a3;
+ (id)newMissingReaderJobEventWithNumberMissing:(unsigned int)a3;
+ (id)newMissingShareAliasEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5;
+ (id)newMissingSyncUpJobEventWithNumberMissing:(unsigned int)a3;
+ (id)newMissingUploaderJobEventWithNumberMissing:(unsigned int)a3;
+ (id)newNSErrorEvent:(int)a3 eventGroupUUID:(id)a4 value:(id)a5;
+ (id)newNonMigratedItemEvent:(id)a3 foundInfo:(id)a4;
+ (id)newOperationTimedOutEventWithTime:(double)a3 type:(id)a4 nonDiscretionary:(BOOL)a5 hasForegroundClients:(BOOL)a6;
+ (id)newPackageChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5;
+ (id)newPermanentlyInconsistentEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4;
+ (id)newQBSDirFaultsCountEvent:(unint64_t)a3 serverTruthDirFaultCount:(unint64_t)a4 serverTruthDirCount:(unint64_t)a5 timeSinceLogin:(unint64_t)a6 serverTruthTotalItemsCount:(unint64_t)a7 zonesNeverFullSync:(unint64_t)a8;
+ (id)newQBSOperationPrformanceEventWithTime:(double)a3 type:(id)a4 recordsFetched:(unint64_t)a5 recordsFetchedTotalMetadataSize:(unint64_t)a6 xattrsFetchedTotalSize:(unint64_t)a7;
+ (id)newRecursiveItemCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6;
+ (id)newReimportDomainFailureEventWithError:(id)a3 description:(id)a4;
+ (id)newShareAcceptationEventWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7;
+ (id)newShareAliasCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6;
+ (id)newShareAliasInSharedFolderEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4;
+ (id)newShareCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6;
+ (id)newSyncBoostingProblemCountWithProblemCount:(int)a3;
+ (id)newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:(unsigned int)a3;
+ (id)newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:(unsigned int)a3;
+ (id)newTelemetryEventInZoneWithMangledID:(id)a3;
+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4;
+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 fromError:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7;
+ (id)newTestMetricEventWithMagnitude:(unsigned int)a3;
+ (id)newTimestampEvent:(int)a3 eventGroupUUID:(id)a4 value:(unint64_t)a5;
+ (id)newUploadErrorForEventName:(id)a3 foundInfo:(id)a4;
+ (id)newUserDownloadEventWithDuration:(double)a3;
+ (id)newZoneResetEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 lastSyncDate:(id)a5 error:(id)a6 errorDescription:(id)a7;
- (AppTelemetryInvestigation)investigation;
- (BOOL)hasInvestigation;
- (BOOL)hasMagnitude;
- (BOOL)hasMagnitudeBool;
- (BOOL)hasMagnitudeDouble;
- (BOOL)hasMagnitudeFloat;
- (BOOL)hasMagnitudeInt;
- (BOOL)hasMagnitudeLong;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)magnitudeBool;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (double)magnitudeDouble;
- (float)magnitudeFloat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)magnitudeAsString:(int)a3;
- (int)StringAsMagnitude:(id)a3;
- (int)magnitude;
- (int)magnitudeInt;
- (int64_t)magnitudeLong;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)telemetrySchema;
- (void)_populateUUID:(id)a3;
- (void)clearOneofValuesForMagnitude;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMagnitude:(BOOL)a3;
- (void)setHasMagnitudeBool:(BOOL)a3;
- (void)setHasMagnitudeDouble:(BOOL)a3;
- (void)setHasMagnitudeFloat:(BOOL)a3;
- (void)setHasMagnitudeInt:(BOOL)a3;
- (void)setHasMagnitudeLong:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInvestigation:(id)a3;
- (void)setMagnitude:(int)a3;
- (void)setMagnitudeBool:(BOOL)a3;
- (void)setMagnitudeDouble:(double)a3;
- (void)setMagnitudeFloat:(float)a3;
- (void)setMagnitudeInt:(int)a3;
- (void)setMagnitudeLong:(int64_t)a3;
- (void)setTelemetrySchema:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryTimeSeriesEvent

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(AppTelemetryTimeSeriesEvent *)self data];
  [v6 sqliteBind:a3 index:v4];
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  if (sqlite3_value_type(a3) != 4) {
    return 0;
  }
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteValue:a3];
  id v6 = (void *)[v4 initWithData:v5];

  return v6;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (sqlite3_column_type(a3, a4) != 4) {
    return 0;
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteStatement:a3 atIndex:v4];
  v8 = (void *)[v6 initWithData:v7];

  return v8;
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  return (id)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:0];
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3
{
  id v4 = a3;
  v5 = +[BRCUserDefaults defaultsForMangledID:0];
  id v6 = objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", v4, objc_msgSend(v5, "supportsEnhancedDrivePrivacy"), 0, 0, 0);

  return v6;
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 fromError:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7
{
  BOOL v9 = a4;
  v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = [v12 numberWithBool:v9];
  v18 = (void *)[a1 _newTelemetryEventInZoneWithMangledID:v16 enhancedDrivePrivacyEnabled:v17 error:v15 errorDescription:v14 itemIDString:v13];

  return v18;
}

+ (id)_newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(id)a4 error:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  [(AppTelemetryTimeSeriesEvent *)v16 setTimestamp:time(0)];
  if (v11 || v13 || v14 || (v17 = 0, v18 = 0, v15))
  {
    v18 = objc_opt_new();
    [(AppTelemetryTimeSeriesEvent *)v16 setInvestigation:v18];
    if (v11)
    {
      v19 = [v11 appLibraryOrZoneName];
      v20 = [v19 dataUsingEncoding:4];
      [v18 setZoneName:v20];

      objc_msgSend(v18, "setSharedZone:", objc_msgSend(v11, "isShared"));
    }
    if (v13)
    {
      v21 = [v13 domain];
      [v18 setErrorDomain:v21];

      objc_msgSend(v18, "setErrorCode:", objc_msgSend(v13, "code"));
      if (!v14)
      {
        v22 = objc_msgSend(v13, "brc_cloudKitErrorMessage");
        v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          objc_msgSend(v13, "br_errorDescription");
          id v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v14 = v24;
      }
      v25 = [v13 userInfo];
      v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v26)
      {
        v27 = [v26 domain];
        [v18 setUnderlyingErrorDomain:v27];

        objc_msgSend(v18, "setUnderlyingErrorCode:", objc_msgSend(v26, "code"));
      }
    }
    if (v14)
    {
      v28 = +[BRCUserDefaults defaultsForMangledID:0];
      unint64_t v29 = [v28 telemetryErrorDescriptionMaxLength];

      if ([v14 length] > v29)
      {
        uint64_t v30 = [v14 substringToIndex:v29];

        id v14 = (id)v30;
      }
      [v18 setErrorDescription:v14];
      v17 = v14;
      if (v15) {
        goto LABEL_20;
      }
    }
    else
    {
      v17 = 0;
      if (v15) {
LABEL_20:
      }
        [v18 setItemID:v15];
    }
  }
  if (v12) {
    objc_msgSend(v18, "setIsEnhancedDrivePrivacyEnabled:", objc_msgSend(v12, "BOOLValue"));
  }

  return v16;
}

+ (id)newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:30];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:31];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newFolderSharingCountMismatchEventWithCount:(int)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5
{
  uint64_t v5 = *(void *)&a3;
  id v6 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a4 enhancedDrivePrivacyEnabled:a5];
  [v6 setTelemetrySchema:2];
  [v6 setMagnitudeInt:v5];
  return v6;
}

+ (id)newMissingPushEventWithNumberOutOfSync:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:3];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newPermanentlyInconsistentEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4];
  [v4 setTelemetrySchema:4];
  [v4 setMagnitudeBool:1];
  return v4;
}

+ (id)newTestMetricEventWithMagnitude:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc(MEMORY[0x1E4F594E8]);
  id v6 = (void *)[v5 initWithZoneName:@"com.apple.testZone" ownerName:*MEMORY[0x1E4F19C08]];
  v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:v6];
  [v7 setTelemetrySchema:6];
  [v7 setMagnitudeInt:v3];

  return v7;
}

+ (id)newShareAliasInSharedFolderEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4];
  [v4 setTelemetrySchema:7];
  [v4 setMagnitudeBool:1];
  return v4;
}

+ (id)newZoneResetEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 lastSyncDate:(id)a5 error:(id)a6 errorDescription:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = (void *)[a1 newTelemetryEventInZoneWithMangledID:v14 enhancedDrivePrivacyEnabled:v9 fromError:a6 errorDescription:v12 itemIDString:0];
  id v16 = +[BRCUserDefaults defaultsForMangledID:v14];

  v17 = [v16 benignTelemetryErrorDescriptions];
  v18 = v17;
  if (v12 && ([v17 containsObject:v12] & 1) != 0) {
    uint64_t v19 = 9;
  }
  else {
    uint64_t v19 = 8;
  }
  [v15 setTelemetrySchema:v19];
  v20 = [MEMORY[0x1E4F1C9C8] date];
  [v20 timeIntervalSinceDate:v13];
  double v22 = v21;

  [v15 setMagnitudeDouble:v22];
  return v15;
}

+ (id)newDBResetEventWithError:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v9 = objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, objc_msgSend(v8, "supportsEnhancedDrivePrivacy"), v7, v6, 0);

  [v9 setTelemetrySchema:10];
  [v9 setMagnitudeInt:1];
  return v9;
}

+ (id)newReimportDomainFailureEventWithError:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v9 = objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, objc_msgSend(v8, "supportsEnhancedDrivePrivacy"), v7, v6, 0);

  [v9 setTelemetrySchema:43];
  [v9 setMagnitudeInt:1];
  return v9;
}

+ (id)newMissingApplyJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:11];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newMissingSyncUpJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:12];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newMissingUploaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:14];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newMissingReaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:13];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newMissingDownloaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:15];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCorruptPackageDownloadEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 error:(id)a5 itemIDString:(id)a6
{
  id v6 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:a5 errorDescription:0 itemIDString:a6];
  [v6 setTelemetrySchema:21];
  [v6 setMagnitudeInt:1];
  return v6;
}

+ (id)newChainedDirectoryMissingChainPCSEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  id v5 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v5 setTelemetrySchema:22];
  [v5 setMagnitudeInt:1];
  return v5;
}

+ (id)newFolderSharePCSChainingEventWithTime:(double)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 errorDescription:(id)a8
{
  BOOL v9 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a4 enhancedDrivePrivacyEnabled:a5 fromError:a7 errorDescription:a8 itemIDString:a6];
  [v9 setTelemetrySchema:17];
  [v9 setMagnitudeDouble:a3];
  return v9;
}

+ (id)newShareAcceptationEventWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_msgSend(v12, "brc_cloudKitErrorMessage");
  v17 = (void *)[a1 newTelemetryEventInZoneWithMangledID:v14 enhancedDrivePrivacyEnabled:v8 fromError:v12 errorDescription:v16 itemIDString:v13];

  [v17 setTelemetrySchema:18];
  v18 = [v17 investigation];
  [v18 setLastStep:v15];

  [v17 setMagnitudeInt:1];
  return v17;
}

+ (id)newSyncBoostingProblemCountWithProblemCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:23];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCorruptSharingOptionsProblemWithProblemCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:34];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newContentPolicyProblemCountWithProblemCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:35];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newBasehashSaltingProblemCountWithProblemCount:(int)a3 mangledID:(id)a4 itemIDString:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  id v6 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a4 enhancedDrivePrivacyEnabled:1 fromError:0 errorDescription:0 itemIDString:a5];
  [v6 setTelemetrySchema:36];
  [v6 setMagnitudeInt:v5];
  return v6;
}

+ (id)newEDPKeysMismatchForRecordID:(id)a3 mangledID:(id)a4
{
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a4 enhancedDrivePrivacyEnabled:1 fromError:0 errorDescription:0 itemIDString:a3];
  [v4 setTelemetrySchema:37];
  return v4;
}

+ (id)newDanglingZombieProblemCountWithProblemCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:40];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newFSEventToSyncUpEventWithDuration:(double)a3
{
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:19];
  [v4 setMagnitudeDouble:a3];
  return v4;
}

+ (id)newUserDownloadEventWithDuration:(double)a3
{
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:20];
  [v4 setMagnitudeDouble:a3];
  return v4;
}

+ (id)newDeepScanEventWithReason:(id)a3 appLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v8 setTelemetrySchema:24];
  [v8 setMagnitudeInt:1];
  BOOL v9 = [v6 dataUsingEncoding:4];

  v10 = [v8 investigation];
  [v10 setZoneName:v9];

  id v11 = [v8 investigation];
  [v11 setReason:v7];

  return v8;
}

+ (id)newOperationTimedOutEventWithTime:(double)a3 type:(id)a4 nonDiscretionary:(BOOL)a5 hasForegroundClients:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v11 setTelemetrySchema:25];
  [v11 setMagnitudeDouble:a3];
  id v12 = [v11 investigation];
  [v12 setOperationType:v10];

  id v13 = [v11 investigation];
  [v13 setNonDiscretionary:v7];

  id v14 = [v11 investigation];
  [v14 setHasForegroundClients:v6];

  return v11;
}

+ (id)newQBSOperationPrformanceEventWithTime:(double)a3 type:(id)a4 recordsFetched:(unint64_t)a5 recordsFetchedTotalMetadataSize:(unint64_t)a6 xattrsFetchedTotalSize:(unint64_t)a7
{
  id v12 = a4;
  id v13 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v13 setTelemetrySchema:32];
  [v13 setMagnitudeDouble:(double)(a7 + a6) / a3];
  id v14 = [v13 investigation];
  id v15 = [v14 qbsPerformance];
  [v15 setOperationType:v12];

  id v16 = [v13 investigation];
  v17 = [v16 qbsPerformance];
  [v17 setRecordsFetched:a5];

  v18 = [v13 investigation];
  uint64_t v19 = [v18 qbsPerformance];
  [v19 setRecordsFetchedTotalMetadataSize:a6];

  v20 = [v13 investigation];
  double v21 = [v20 qbsPerformance];
  [v21 setXattrsFetchedTotalSize:a7];

  return v13;
}

+ (id)newFileBouncedManyTimes
{
  v2 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v2 setTelemetrySchema:29];
  [v2 setMagnitudeInt:1];
  return v2;
}

+ (id)newFullyConsistentEvent
{
  v2 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v2 setTelemetrySchema:100];
  [v2 setMagnitudeInt:1];
  return v2;
}

+ (id)newFileChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  uint64_t v5 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v5 setTelemetrySchema:101];
  [v5 setMagnitudeInt:1];
  return v5;
}

+ (id)newPackageChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  uint64_t v5 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v5 setTelemetrySchema:102];
  [v5 setMagnitudeInt:1];
  return v5;
}

+ (id)newFileReadErrorWithError:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6
{
  BOOL v6 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a4 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:a6];
  [v6 setTelemetrySchema:108];
  [v6 setMagnitudeInt:1];
  return v6;
}

+ (id)newChildCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v7 setTelemetrySchema:103];
  [v7 setMagnitudeInt:v6];
  return v7;
}

+ (id)newRecursiveItemCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v7 setTelemetrySchema:104];
  [v7 setMagnitudeInt:v6];
  return v7;
}

+ (id)newShareAliasCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v7 setTelemetrySchema:105];
  [v7 setMagnitudeInt:v6];
  return v7;
}

+ (id)newShareCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v7 setTelemetrySchema:106];
  [v7 setMagnitudeInt:v6];
  return v7;
}

+ (id)newMissingShareAliasEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  uint64_t v5 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a3 enhancedDrivePrivacyEnabled:a4 fromError:0 errorDescription:0 itemIDString:a5];
  [v5 setTelemetrySchema:26];
  [v5 setMagnitudeInt:1];
  return v5;
}

+ (id)newConsistencyCheckerFailedEvent
{
  v2 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v2 setTelemetrySchema:107];
  [v2 setMagnitudeInt:1];
  return v2;
}

+ (id)newCATotalErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:200];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCASyncUpZoneErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:204];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCASyncDownErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:205];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCASyncUpItemErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:203];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCAUploadErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:201];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCADownloadErrorCountEventWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0];
  [v4 setTelemetrySchema:202];
  [v4 setMagnitudeInt:v3];
  return v4;
}

+ (id)newCASyncUpZoneErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6
{
  BOOL v6 = a4;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a6 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:0];
  [v7 setTelemetrySchema:213];
  [v7 setMagnitudeInt:1];
  BOOL v8 = [v7 investigation];
  [v8 setIsPCSChained:v6];

  return v7;
}

+ (id)newCASyncDownErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6
{
  BOOL v6 = a4;
  BOOL v7 = (void *)[a1 newTelemetryEventInZoneWithMangledID:a6 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:0];
  [v7 setTelemetrySchema:214];
  [v7 setMagnitudeInt:1];
  BOOL v8 = [v7 investigation];
  [v8 setIsPCSChained:v6];

  return v7;
}

+ (id)newCAUploadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v10 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:0];
  [v10 setTelemetrySchema:210];
  [v10 setMagnitudeInt:v7];
  id v11 = [v10 investigation];
  [v11 setIsPCSChained:v9];

  id v12 = [v10 investigation];
  [v12 setSharedZone:v8];

  return v10;
}

+ (id)newCADownloadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v10 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:0];
  [v10 setTelemetrySchema:211];
  [v10 setMagnitudeInt:v7];
  id v11 = [v10 investigation];
  [v11 setIsPCSChained:v9];

  id v12 = [v10 investigation];
  [v12 setSharedZone:v8];

  return v10;
}

+ (id)newCASyncUpItemErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v10 = (void *)[a1 newTelemetryEventInZoneWithMangledID:0 enhancedDrivePrivacyEnabled:a5 fromError:a3 errorDescription:0 itemIDString:0];
  [v10 setTelemetrySchema:212];
  [v10 setMagnitudeInt:v7];
  id v11 = [v10 investigation];
  [v11 setIsPCSChained:v9];

  id v12 = [v10 investigation];
  [v12 setSharedZone:v8];

  return v10;
}

+ (id)newMissingAssetContentEventWithRecordID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (objc_class *)MEMORY[0x1E4F594E8];
  id v7 = a3;
  id v8 = [v6 alloc];
  BOOL v9 = [v7 zoneID];
  id v10 = (void *)[v8 initWithRecordZoneID:v9];

  id v11 = [v7 recordName];

  id v12 = (void *)[a1 newTelemetryEventInZoneWithMangledID:v10 enhancedDrivePrivacyEnabled:v4 fromError:0 errorDescription:0 itemIDString:v11];
  [v12 setTelemetrySchema:27];
  [v12 setMagnitudeInt:1];

  return v12;
}

+ (id)newQBSDirFaultsCountEvent:(unint64_t)a3 serverTruthDirFaultCount:(unint64_t)a4 serverTruthDirCount:(unint64_t)a5 timeSinceLogin:(unint64_t)a6 serverTruthTotalItemsCount:(unint64_t)a7 zonesNeverFullSync:(unint64_t)a8
{
  id v14 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v15 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v14 setInvestigation:v15];

  id v16 = objc_alloc_init(AppTelemetryQBSInvestigation);
  v17 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  [v17 setQbsInvestigation:v16];

  [(AppTelemetryTimeSeriesEvent *)v14 setTelemetrySchema:28];
  [(AppTelemetryTimeSeriesEvent *)v14 setTimestamp:time(0)];
  v18 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  uint64_t v19 = [v18 qbsInvestigation];
  [v19 setClientTruthDirFaultCount:a3];

  v20 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  double v21 = [v20 qbsInvestigation];
  [v21 setServerTruthDirFaultCount:a4];

  double v22 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  v23 = [v22 qbsInvestigation];
  [v23 setServerTruthDirCount:a5];

  id v24 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  v25 = [v24 qbsInvestigation];
  [v25 setTimeSinceLogin:a6];

  v26 = [(AppTelemetryTimeSeriesEvent *)v14 investigation];
  v27 = [v26 qbsInvestigation];
  [v27 setServerTruthTotalItemsCount:a7];

  if (a8)
  {
    v28 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v29 = [v28 qbsExpectedItemsFetchedPerInterval];
    [v28 qbsExpectedItemsFetchedCheckInterval];
    if (v29 * (unint64_t)((double)a6 / v30) > a7) {
      uint64_t v31 = a8;
    }
    else {
      uint64_t v31 = -(int)a8;
    }
    [(AppTelemetryTimeSeriesEvent *)v14 setMagnitudeInt:v31];
  }
  else
  {
    [(AppTelemetryTimeSeriesEvent *)v14 setMagnitudeInt:0];
  }
  return v14;
}

- (void)_populateUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AppTelemetryTimeSeriesEvent *)self telemetrySchema];
  BOOL v6 = [(AppTelemetryTimeSeriesEvent *)self investigation];
  id v7 = v6;
  if (v5 < 0x190) {
    [v6 setEventGroupUUID:v4];
  }
  else {
    [v6 setMigrationUUID:v4];
  }
}

+ (id)newIntEvent:(int)a3 UUID:(id)a4 value:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  BOOL v9 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v8 setInvestigation:v9];

  [(AppTelemetryTimeSeriesEvent *)v8 setTelemetrySchema:v6];
  [(AppTelemetryTimeSeriesEvent *)v8 setMagnitudeInt:v5];
  [(AppTelemetryTimeSeriesEvent *)v8 setTimestamp:time(0)];
  [(AppTelemetryTimeSeriesEvent *)v8 _populateUUID:v7];

  return v8;
}

+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = (void *)[(id)objc_opt_class() newLongEvent:v6 UUID:v7 value:a5 round:0];

  return v8;
}

+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5 round:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  if (v6)
  {
    id v10 = [NSNumber numberWithLongLong:a5];
    a5 = objc_msgSend(v10, "br_roundedLongLongValue");
  }
  id v11 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v12 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v11 setInvestigation:v12];

  [(AppTelemetryTimeSeriesEvent *)v11 setTelemetrySchema:v8];
  [(AppTelemetryTimeSeriesEvent *)v11 setMagnitudeLong:a5];
  [(AppTelemetryTimeSeriesEvent *)v11 setTimestamp:time(0)];
  [(AppTelemetryTimeSeriesEvent *)v11 _populateUUID:v9];

  return v11;
}

+ (id)newDoubleEvent:(int)a3 eventGroupUUID:(id)a4 value:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v9 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v8 setInvestigation:v9];

  [(AppTelemetryTimeSeriesEvent *)v8 setTelemetrySchema:v6];
  [(AppTelemetryTimeSeriesEvent *)v8 setMagnitudeDouble:a5];
  [(AppTelemetryTimeSeriesEvent *)v8 setTimestamp:time(0)];
  id v10 = [(AppTelemetryTimeSeriesEvent *)v8 investigation];
  [v10 setEventGroupUUID:v7];

  return v8;
}

+ (id)newBoolEvent:(int)a3 eventGroupUUID:(id)a4 value:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v9 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v8 setInvestigation:v9];

  [(AppTelemetryTimeSeriesEvent *)v8 setTelemetrySchema:v6];
  [(AppTelemetryTimeSeriesEvent *)v8 setMagnitudeBool:v5];
  [(AppTelemetryTimeSeriesEvent *)v8 setTimestamp:time(0)];
  id v10 = [(AppTelemetryTimeSeriesEvent *)v8 investigation];
  [v10 setEventGroupUUID:v7];

  return v8;
}

+ (id)newNSErrorEvent:(int)a3 eventGroupUUID:(id)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v10 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v9 setInvestigation:v10];

  [(AppTelemetryTimeSeriesEvent *)v9 setTelemetrySchema:v6];
  [(AppTelemetryTimeSeriesEvent *)v9 setMagnitudeInt:1];
  [(AppTelemetryTimeSeriesEvent *)v9 setTimestamp:time(0)];
  id v11 = [v7 domain];
  id v12 = [(AppTelemetryTimeSeriesEvent *)v9 investigation];
  [v12 setErrorDomain:v11];

  uint64_t v13 = [v7 code];
  id v14 = [(AppTelemetryTimeSeriesEvent *)v9 investigation];
  [v14 setErrorCode:v13];

  id v15 = [v7 description];

  id v16 = [(AppTelemetryTimeSeriesEvent *)v9 investigation];
  [v16 setErrorDescription:v15];

  v17 = [(AppTelemetryTimeSeriesEvent *)v9 investigation];
  [v17 setEventGroupUUID:v8];

  return v9;
}

+ (id)newTimestampEvent:(int)a3 eventGroupUUID:(id)a4 value:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  id v9 = objc_alloc_init(AppTelemetryInvestigation);
  [(AppTelemetryTimeSeriesEvent *)v8 setInvestigation:v9];

  [(AppTelemetryTimeSeriesEvent *)v8 setTelemetrySchema:v6];
  [(AppTelemetryTimeSeriesEvent *)v8 setMagnitudeInt:1];
  [(AppTelemetryTimeSeriesEvent *)v8 setTimestamp:a5];
  id v10 = [(AppTelemetryTimeSeriesEvent *)v8 investigation];
  [v10 setEventGroupUUID:v7];

  return v8;
}

+ (id)itemStatsInvestigationWithFoundInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AppTelemetryItemStatsInvestigation);
  BOOL v5 = [v3 objectForKey:*MEMORY[0x1E4F25AE0]];
  uint64_t v6 = v5;
  if (v5) {
    -[AppTelemetryItemStatsInvestigation setItemNumber:](v4, "setItemNumber:", [v5 longLongValue]);
  }

  id v7 = [v3 objectForKey:*MEMORY[0x1E4F25B18]];
  id v8 = v7;
  if (v7) {
    -[AppTelemetryItemStatsInvestigation setStMode:](v4, "setStMode:", [v7 longLongValue]);
  }

  id v9 = [v3 objectForKey:*MEMORY[0x1E4F25AA8]];
  id v10 = v9;
  if (v9) {
    -[AppTelemetryItemStatsInvestigation setStFlags:](v4, "setStFlags:", [v9 longLongValue]);
  }

  id v11 = [v3 objectForKey:*MEMORY[0x1E4F25AF8]];
  id v12 = v11;
  if (v11) {
    -[AppTelemetryItemStatsInvestigation setHasMoreLinks:](v4, "setHasMoreLinks:", [v11 longLongValue]);
  }

  uint64_t v13 = [v3 objectForKey:*MEMORY[0x1E4F25B08]];
  id v14 = v13;
  if (v13) {
    -[AppTelemetryItemStatsInvestigation setHasAcls:](v4, "setHasAcls:", [v13 BOOLValue]);
  }

  id v15 = [v3 objectForKey:*MEMORY[0x1E4F25B28]];
  id v16 = v15;
  if (v15) {
    -[AppTelemetryItemStatsInvestigation setParentHasAcls:](v4, "setParentHasAcls:", [v15 BOOLValue]);
  }

  v17 = [v3 objectForKey:*MEMORY[0x1E4F25AC8]];
  v18 = v17;
  if (v17) {
    -[AppTelemetryItemStatsInvestigation setDataProtectionClass:](v4, "setDataProtectionClass:", [v17 intValue]);
  }

  uint64_t v19 = [v3 objectForKey:*MEMORY[0x1E4F25B00]];
  v20 = v19;
  if (v19) {
    -[AppTelemetryItemStatsInvestigation setIsUnderDirStatFolder:](v4, "setIsUnderDirStatFolder:", [v19 BOOLValue]);
  }

  double v21 = [v3 objectForKey:*MEMORY[0x1E4F25AD8]];
  double v22 = v21;
  if (v21) {
    -[AppTelemetryItemStatsInvestigation setStatDocID:](v4, "setStatDocID:", [v21 longLongValue]);
  }

  v23 = [v3 objectForKey:*MEMORY[0x1E4F25B10]];
  id v24 = v23;
  if (v23) {
    -[AppTelemetryItemStatsInvestigation setStatLogicalSize:](v4, "setStatLogicalSize:", [v23 longLongValue]);
  }

  v25 = [v3 objectForKey:*MEMORY[0x1E4F25B30]];
  v26 = v25;
  if (v25) {
    -[AppTelemetryItemStatsInvestigation setStatPhysicalSize:](v4, "setStatPhysicalSize:", [v25 longLongValue]);
  }

  v27 = [v3 objectForKey:*MEMORY[0x1E4F25AD0]];
  v28 = v27;
  if (v27) {
    -[AppTelemetryItemStatsInvestigation setStatDirEntryCount:](v4, "setStatDirEntryCount:", [v27 longLongValue]);
  }

  uint64_t v29 = [v3 objectForKey:*MEMORY[0x1E4F25B40]];
  double v30 = v29;
  if (v29)
  {
    -[AppTelemetryItemStatsInvestigation setIsOwnedByLoggedInUser:](v4, "setIsOwnedByLoggedInUser:", [v29 unsignedIntValue] == 0);
    -[AppTelemetryItemStatsInvestigation setIsOwnedByRoot:](v4, "setIsOwnedByRoot:", [v30 unsignedIntValue] == 1);
  }
  uint64_t v31 = [v3 objectForKey:*MEMORY[0x1E4F25AE8]];
  v32 = v31;
  if (v31)
  {
    v33 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v31, "intValue"));
    v34 = [v33 stringValue];
    [(AppTelemetryItemStatsInvestigation *)v4 setFinderInfoFlagsBase64:v34];
  }
  v35 = [v3 objectForKey:*MEMORY[0x1E4F25B38]];
  v36 = v35;
  if (v35) {
    -[AppTelemetryItemStatsInvestigation setIsResourceFork:](v4, "setIsResourceFork:", [v35 BOOLValue]);
  }

  v37 = [v3 objectForKey:*MEMORY[0x1E4F25AC0]];
  v38 = v37;
  if (v37) {
    -[AppTelemetryItemStatsInvestigation setSyncRootEnum:](v4, "setSyncRootEnum:", [v37 intValue]);
  }

  v39 = [v3 objectForKey:*MEMORY[0x1E4F25AB0]];
  v40 = v39;
  if (v39) {
    -[AppTelemetryItemStatsInvestigation setBTime:](v4, "setBTime:", [v39 longLongValue]);
  }

  v41 = [v3 objectForKey:*MEMORY[0x1E4F25AB8]];
  v42 = v41;
  if (v41) {
    -[AppTelemetryItemStatsInvestigation setBTimeIsBusy:](v4, "setBTimeIsBusy:", [v41 BOOLValue]);
  }

  v43 = [v3 objectForKey:*MEMORY[0x1E4F25B20]];
  v44 = v43;
  if (v43) {
    -[AppTelemetryItemStatsInvestigation setMTime:](v4, "setMTime:", [v43 longLongValue]);
  }

  v45 = [v3 objectForKey:*MEMORY[0x1E4F25B70]];
  v46 = v45;
  if (v45) {
    -[AppTelemetryItemStatsInvestigation setXattrCount:](v4, "setXattrCount:", [v45 intValue]);
  }

  v47 = [v3 objectForKey:*MEMORY[0x1E4F25B68]];
  v48 = v47;
  if (v47) {
    -[AppTelemetryItemStatsInvestigation setCompressionType:](v4, "setCompressionType:", [v47 intValue]);
  }

  v49 = [v3 objectForKey:*MEMORY[0x1E4F25B90]];
  v50 = v49;
  if (v49) {
    -[AppTelemetryItemStatsInvestigation setIsQuarantined:](v4, "setIsQuarantined:", [v49 BOOLValue]);
  }

  v51 = [v3 objectForKey:*MEMORY[0x1E4F25B80]];
  v52 = v51;
  if (v51) {
    -[AppTelemetryItemStatsInvestigation setXattrHasDemotion:](v4, "setXattrHasDemotion:", [v51 BOOLValue]);
  }

  v53 = [v3 objectForKey:*MEMORY[0x1E4F25B88]];
  v54 = v53;
  if (v53) {
    -[AppTelemetryItemStatsInvestigation setXattrHasPromotion:](v4, "setXattrHasPromotion:", [v53 BOOLValue]);
  }

  v55 = [v3 objectForKey:*MEMORY[0x1E4F25B78]];
  v56 = v55;
  if (v55) {
    -[AppTelemetryItemStatsInvestigation setXattrHasBeforeBounce:](v4, "setXattrHasBeforeBounce:", [v55 BOOLValue]);
  }

  v57 = [v3 objectForKey:*MEMORY[0x1E4F25A78]];
  if (v57)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setUtType:v57];
    }
  }

  v58 = [v3 objectForKey:*MEMORY[0x1E4F25A60]];
  v59 = v58;
  if (v58) {
    -[AppTelemetryItemStatsInvestigation setFileNameLength:](v4, "setFileNameLength:", [v58 longLongValue]);
  }

  v60 = [v3 objectForKey:*MEMORY[0x1E4F25A70]];
  v61 = v60;
  if (v60) {
    -[AppTelemetryItemStatsInvestigation setPathLength:](v4, "setPathLength:", [v60 longLongValue]);
  }

  v62 = [v3 objectForKey:*MEMORY[0x1E4F25A50]];
  v63 = v62;
  if (v62) {
    -[AppTelemetryItemStatsInvestigation setIsAppleDouble:](v4, "setIsAppleDouble:", [v62 BOOLValue]);
  }

  v64 = [v3 objectForKey:*MEMORY[0x1E4F25A68]];
  v65 = v64;
  if (v64) {
    -[AppTelemetryItemStatsInvestigation setPathDepth:](v4, "setPathDepth:", [v64 longLongValue]);
  }

  v66 = [v3 objectForKey:*MEMORY[0x1E4F25A48]];
  if (v66)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setFileNameExtension:v66];
    }
  }

  v67 = [v3 objectForKey:*MEMORY[0x1E4F25A80]];
  if (v67)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setNameUnicodeNorm:v67];
    }
  }

  v68 = [v3 objectForKey:*MEMORY[0x1E4F25A58]];
  v69 = v68;
  if (v68) {
    -[AppTelemetryItemStatsInvestigation setNameIsTrashed:](v4, "setNameIsTrashed:", [v68 BOOLValue]);
  }

  v70 = [v3 objectForKey:*MEMORY[0x1E4F25B58]];
  v71 = v70;
  if (v70) {
    -[AppTelemetryItemStatsInvestigation setReadErrorCode:](v4, "setReadErrorCode:", [v70 longLongValue]);
  }

  v72 = [v3 objectForKey:*MEMORY[0x1E4F25B50]];
  v73 = v72;
  if (v72) {
    -[AppTelemetryItemStatsInvestigation setSysPageSize:](v4, "setSysPageSize:", [v72 longLongValue]);
  }

  v74 = [v3 objectForKey:*MEMORY[0x1E4F25B60]];
  v75 = v74;
  if (v74) {
    -[AppTelemetryItemStatsInvestigation setSysUID:](v4, "setSysUID:", [v74 longLongValue]);
  }

  v76 = [v3 objectForKey:*MEMORY[0x1E4F25B48]];
  v77 = v76;
  if (v76) {
    -[AppTelemetryItemStatsInvestigation setSysDocIDResolutionOK:](v4, "setSysDocIDResolutionOK:", [v76 BOOLValue]);
  }

  uint64_t v78 = *MEMORY[0x1E4F25A90];
  v79 = [v3 objectForKey:*MEMORY[0x1E4F25A90]];
  v80 = v79;
  if (v79) {
    -[AppTelemetryItemStatsInvestigation setIsPurgable:](v4, "setIsPurgable:", [v79 BOOLValue]);
  }

  v81 = [v3 objectForKey:v78];
  v82 = [v3 objectForKey:*MEMORY[0x1E4F25A98]];
  v83 = v82;
  if (v82) {
    -[AppTelemetryItemStatsInvestigation setPurgeGenCount:](v4, "setPurgeGenCount:", [v82 longLongValue]);
  }

  v84 = [v3 objectForKey:*MEMORY[0x1E4F25A88]];
  v85 = v84;
  if (v84) {
    -[AppTelemetryItemStatsInvestigation setPurgeATime:](v4, "setPurgeATime:", [v84 longLongValue]);
  }

  v86 = [v3 objectForKey:*MEMORY[0x1E4F25AA0]];
  v87 = v86;
  if (v86) {
    -[AppTelemetryItemStatsInvestigation setPurgeSyncRoot:](v4, "setPurgeSyncRoot:", [v86 longLongValue]);
  }

  v88 = [v3 objectForKey:*MEMORY[0x1E4F25AF0]];
  v89 = v88;
  if (v88) {
    -[AppTelemetryItemStatsInvestigation setFsGenCount:](v4, "setFsGenCount:", [v88 longLongValue]);
  }

  v90 = [v3 objectForKey:*MEMORY[0x1E4F259C0]];
  v91 = v90;
  if (v90) {
    -[AppTelemetryItemStatsInvestigation setDbErrorCode:](v4, "setDbErrorCode:", [v90 longLongValue]);
  }

  v92 = [v3 objectForKey:*MEMORY[0x1E4F259C8]];
  if (v92)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setDbErrorDomain:v92];
    }
  }

  v93 = [v3 objectForKey:*MEMORY[0x1E4F259B0]];
  v94 = v93;
  if (v93) {
    -[AppTelemetryItemStatsInvestigation setDbCapabilities:](v4, "setDbCapabilities:", [v93 longLongValue]);
  }

  v95 = [v3 objectForKey:*MEMORY[0x1E4F25A18]];
  v96 = v95;
  if (v95) {
    -[AppTelemetryItemStatsInvestigation setDbTransferState:](v4, "setDbTransferState:", [v95 longLongValue]);
  }

  v97 = [v3 objectForKey:*MEMORY[0x1E4F25A10]];
  v98 = v97;
  if (v97) {
    -[AppTelemetryItemStatsInvestigation setDbSharingState:](v4, "setDbSharingState:", [v97 longLongValue]);
  }

  v99 = [v3 objectForKey:*MEMORY[0x1E4F25A00]];
  v100 = v99;
  if (v99) {
    -[AppTelemetryItemStatsInvestigation setDbIsApplibrary:](v4, "setDbIsApplibrary:", [v99 BOOLValue]);
  }

  v101 = [v3 objectForKey:*MEMORY[0x1E4F259B8]];
  v102 = v101;
  if (v101) {
    -[AppTelemetryItemStatsInvestigation setDbEffectiveContentPolicy:](v4, "setDbEffectiveContentPolicy:", [v101 longLongValue]);
  }

  v103 = [v3 objectForKey:*MEMORY[0x1E4F25A08]];
  v104 = v103;
  if (v103) {
    -[AppTelemetryItemStatsInvestigation setDbIsPackage:](v4, "setDbIsPackage:", [v103 BOOLValue]);
  }

  v105 = [v3 objectForKey:*MEMORY[0x1E4F259E8]];
  v106 = v105;
  if (v105) {
    -[AppTelemetryItemStatsInvestigation setDbFsContentStatus:](v4, "setDbFsContentStatus:", [v105 longLongValue]);
  }

  v107 = [v3 objectForKey:*MEMORY[0x1E4F259D0]];
  v108 = v107;
  if (v107) {
    -[AppTelemetryItemStatsInvestigation setDbFpContentStatus:](v4, "setDbFpContentStatus:", [v107 longLongValue]);
  }

  v109 = [v3 objectForKey:*MEMORY[0x1E4F259F8]];
  v110 = v109;
  if (v109) {
    -[AppTelemetryItemStatsInvestigation setDbFsImportStatus:](v4, "setDbFsImportStatus:", [v109 longLongValue]);
  }

  v111 = [v3 objectForKey:*MEMORY[0x1E4F259E0]];
  v112 = v111;
  if (v111) {
    -[AppTelemetryItemStatsInvestigation setDbFpImportStatus:](v4, "setDbFpImportStatus:", [v111 longLongValue]);
  }

  v113 = [v3 objectForKey:*MEMORY[0x1E4F259F0]];
  v114 = v113;
  if (v113) {
    -[AppTelemetryItemStatsInvestigation setDbFsDeletionStatus:](v4, "setDbFsDeletionStatus:", [v113 longLongValue]);
  }

  v115 = [v3 objectForKey:*MEMORY[0x1E4F259D8]];
  v116 = v115;
  if (v115) {
    -[AppTelemetryItemStatsInvestigation setDbFpDeletionStatus:](v4, "setDbFpDeletionStatus:", [v115 longLongValue]);
  }

  v117 = [v3 objectForKey:*MEMORY[0x1E4F25A30]];
  v118 = v117;
  if (v117) {
    -[AppTelemetryItemStatsInvestigation setDiagFailuresBitmap:](v4, "setDiagFailuresBitmap:", [v117 longLongValue]);
  }

  v119 = [v3 objectForKey:*MEMORY[0x1E4F25A20]];
  v120 = v119;
  if (v119) {
    -[AppTelemetryItemStatsInvestigation setDiagErrorCode:](v4, "setDiagErrorCode:", [v119 longLongValue]);
  }

  v121 = [v3 objectForKey:*MEMORY[0x1E4F25A38]];
  v122 = v121;
  if (v121) {
    -[AppTelemetryItemStatsInvestigation setDiagUnderlyingErrorCode:](v4, "setDiagUnderlyingErrorCode:", [v121 longLongValue]);
  }

  v123 = [v3 objectForKey:*MEMORY[0x1E4F25A28]];
  if (v123)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setDiagErrorDomain:v123];
    }
  }

  v124 = [v3 objectForKey:*MEMORY[0x1E4F25A40]];
  if (v124)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AppTelemetryItemStatsInvestigation *)v4 setDiagUnderlyingErrorDomain:v124];
    }
  }

  v125 = [v3 objectForKey:*MEMORY[0x1E4F25988]];
  v126 = v125;
  if (v125) {
    -[AppTelemetryItemStatsInvestigation setApfsAvailableSpace:](v4, "setApfsAvailableSpace:", [v125 longLongValue]);
  }

  v127 = [v3 objectForKey:*MEMORY[0x1E4F259A0]];
  v128 = v127;
  if (v127) {
    -[AppTelemetryItemStatsInvestigation setApfsFlags:](v4, "setApfsFlags:", [v127 longLongValue]);
  }

  v129 = [v3 objectForKey:*MEMORY[0x1E4F25990]];
  v130 = v129;
  if (v129) {
    -[AppTelemetryItemStatsInvestigation setApfsBlockSize:](v4, "setApfsBlockSize:", [v129 longLongValue]);
  }

  v131 = [v3 objectForKey:*MEMORY[0x1E4F259A8]];
  v132 = v131;
  if (v131) {
    -[AppTelemetryItemStatsInvestigation setApfsRole:](v4, "setApfsRole:", [v131 longLongValue]);
  }

  v133 = [v3 objectForKey:*MEMORY[0x1E4F25998]];
  v134 = v133;
  if (v133) {
    -[AppTelemetryItemStatsInvestigation setApfsEncrypted:](v4, "setApfsEncrypted:", [v133 BOOLValue]);
  }

  v135 = v4;
  return v135;
}

+ (id)newNonMigratedItemEvent:(id)a3 foundInfo:(id)a4
{
  id v5 = a4;
  id v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:403 UUID:a3 value:1];
  id v7 = +[AppTelemetryTimeSeriesEvent itemStatsInvestigationWithFoundInfo:v5];

  id v8 = [v6 investigation];
  [v8 setItemStatsInvestigation:v7];

  return v6;
}

+ (id)newUploadErrorForEventName:(id)a3 foundInfo:(id)a4
{
  id v5 = a4;
  id v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:210 UUID:a3 value:1];
  id v7 = +[AppTelemetryTimeSeriesEvent itemStatsInvestigationWithFoundInfo:v5];

  id v8 = [v6 investigation];
  [v8 setItemStatsInvestigation:v7];

  return v6;
}

+ (id)newDatabaseIDMismatchEventWithFPDatabaseID:(id)a3 cloudDocsDatabaseID:(id)a4
{
  id v5 = a4;
  id v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:38 UUID:a3 value:1];
  id v7 = [v6 investigation];
  [v7 setMigrationUUID:v5];

  return v6;
}

+ (id)newAggregatedEventWithIdentifier:(int)a3 recordID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7 count:(int64_t)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = objc_msgSend(v14, "br_errorDescription");
  uint64_t v19 = (void *)[a1 _newTelemetryEventInZoneWithMangledID:v16 enhancedDrivePrivacyEnabled:v15 error:v14 errorDescription:v18 itemIDString:v17];

  [v19 setMagnitudeLong:a8];
  [v19 setTelemetrySchema:v12];
  return v19;
}

- (void)setMagnitudeFloat:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = 1;
  *(unsigned char *)&self->_has |= 0x10u;
  self->_magnitudeFloat = a3;
}

- (void)setHasMagnitudeFloat:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMagnitudeFloat
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMagnitudeDouble:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = 2;
  *(unsigned char *)&self->_has |= 1u;
  self->_magnitudeDouble = a3;
}

- (void)setHasMagnitudeDouble:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMagnitudeDouble
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMagnitudeInt:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = 3;
  *(unsigned char *)&self->_has |= 0x20u;
  self->_magnitudeInt = a3;
}

- (void)setHasMagnitudeInt:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMagnitudeInt
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMagnitudeBool:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = 4;
  *(unsigned char *)&self->_has |= 0x40u;
  self->_magnitudeBool = a3;
}

- (void)setHasMagnitudeBool:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMagnitudeBool
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMagnitudeLong:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = 5;
  *(unsigned char *)&self->_has |= 2u;
  self->_magnitudeLong = a3;
}

- (void)setHasMagnitudeLong:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMagnitudeLong
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)magnitude
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_magnitude;
  }
  else {
    return 0;
  }
}

- (void)setMagnitude:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_magnitude = a3;
}

- (void)setHasMagnitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMagnitude
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)magnitudeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E699A230[a3];
  }
  return v3;
}

- (int)StringAsMagnitude:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"magnitude_float"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"magnitude_double"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"magnitude_int"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"magnitude_BOOL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"magnitude_long"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForMagnitude
{
  *(unsigned char *)&self->_has &= ~8u;
  self->_magnitude = 0;
  *(unsigned char *)&self->_has &= ~0x10u;
  self->_magnitudeFloat = 0.0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_magnitudeDouble = 0.0;
  *(unsigned char *)&self->_has &= ~0x20u;
  self->_magnitudeInt = 0;
  *(unsigned char *)&self->_has &= ~0x40u;
  self->_magnitudeBool = 0;
  *(unsigned char *)&self->_has &= ~2u;
  self->_magnitudeLong = 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasInvestigation
{
  return self->_investigation != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryTimeSeriesEvent;
  int v4 = [(AppTelemetryTimeSeriesEvent *)&v8 description];
  id v5 = [(AppTelemetryTimeSeriesEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_telemetrySchema];
  [v3 setObject:v4 forKey:@"telemetrySchema"];

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)&double v5 = self->_magnitudeFloat;
    id v11 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v11 forKey:@"magnitude_float"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v12 = [NSNumber numberWithDouble:self->_magnitudeDouble];
  [v3 setObject:v12 forKey:@"magnitude_double"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v13 = [NSNumber numberWithInt:self->_magnitudeInt];
  [v3 setObject:v13 forKey:@"magnitude_int"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  id v14 = [NSNumber numberWithBool:self->_magnitudeBool];
  [v3 setObject:v14 forKey:@"magnitude_BOOL"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  id v15 = [NSNumber numberWithLongLong:self->_magnitudeLong];
  [v3 setObject:v15 forKey:@"magnitude_long"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  uint64_t magnitude = self->_magnitude;
  if (magnitude >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_magnitude);
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = off_1E699A230[magnitude];
  }
  [v3 setObject:v17 forKey:@"magnitude"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    id v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];
  }
LABEL_9:
  investigation = self->_investigation;
  if (investigation)
  {
    id v9 = [(AppTelemetryInvestigation *)investigation dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"investigation"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryTimeSeriesEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  double v5 = v6;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    double v5 = v6;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  double v5 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  double v5 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint64Field();
    double v5 = v6;
  }
LABEL_10:
  if (self->_investigation)
  {
    PBDataWriterWriteSubmessage();
    double v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[10] = self->_magnitude;
    *((unsigned char *)v4 + 60) |= 8u;
  }
  v4[13] = self->_telemetrySchema;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[11] = LODWORD(self->_magnitudeFloat);
    *((unsigned char *)v4 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = *(void *)&self->_magnitudeDouble;
  *((unsigned char *)v4 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[12] = self->_magnitudeInt;
  *((unsigned char *)v4 + 60) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 56) = self->_magnitudeBool;
  *((unsigned char *)v4 + 60) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((void *)v4 + 2) = self->_magnitudeLong;
  *((unsigned char *)v4 + 60) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    *((void *)v4 + 3) = self->_timestamp;
    *((unsigned char *)v4 + 60) |= 4u;
  }
LABEL_10:
  if (self->_investigation)
  {
    id v6 = v4;
    objc_msgSend(v4, "setInvestigation:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_magnitude;
    *(unsigned char *)(v5 + 60) |= 8u;
  }
  *(_DWORD *)(v5 + 52) = self->_telemetrySchema;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)(v5 + 44) = self->_magnitudeFloat;
    *(unsigned char *)(v5 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 8) = self->_magnitudeDouble;
  *(unsigned char *)(v5 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 48) = self->_magnitudeInt;
  *(unsigned char *)(v5 + 60) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    *(void *)(v5 + 16) = self->_magnitudeLong;
    *(unsigned char *)(v5 + 60) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_14:
  *(unsigned char *)(v5 + 56) = self->_magnitudeBool;
  *(unsigned char *)(v5 + 60) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
LABEL_10:
  id v8 = [(AppTelemetryInvestigation *)self->_investigation copyWithZone:a3];
  id v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_magnitude != *((_DWORD *)v4 + 10)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_43;
  }
  if (self->_telemetrySchema != *((_DWORD *)v4 + 13)) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_magnitudeFloat != *((float *)v4 + 11)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_magnitudeDouble != *((double *)v4 + 1)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_magnitudeInt != *((_DWORD *)v4 + 12)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x40) != 0)
    {
      if (self->_magnitudeBool)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_43;
        }
        goto LABEL_31;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_31;
      }
    }
LABEL_43:
    char v6 = 0;
    goto LABEL_44;
  }
  if ((*((unsigned char *)v4 + 60) & 0x40) != 0) {
    goto LABEL_43;
  }
LABEL_31:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_magnitudeLong != *((void *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_timestamp != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_43;
  }
  investigation = self->_investigation;
  if ((unint64_t)investigation | *((void *)v4 + 4)) {
    char v6 = -[AppTelemetryInvestigation isEqual:](investigation, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_44:

  return v6;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_magnitude;
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int telemetrySchema = self->_telemetrySchema;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    float magnitudeFloat = self->_magnitudeFloat;
    float v8 = -magnitudeFloat;
    if (magnitudeFloat >= 0.0) {
      float v8 = self->_magnitudeFloat;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (has)
  {
    double magnitudeDouble = self->_magnitudeDouble;
    double v13 = -magnitudeDouble;
    if (magnitudeDouble >= 0.0) {
      double v13 = self->_magnitudeDouble;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v16 = 2654435761 * self->_magnitudeInt;
    if ((has & 0x40) != 0)
    {
LABEL_22:
      uint64_t v17 = 2654435761 * self->_magnitudeBool;
      if ((has & 2) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v18 = 0;
      if ((has & 4) != 0) {
        goto LABEL_24;
      }
LABEL_28:
      unint64_t v19 = 0;
      return (2654435761 * telemetrySchema) ^ v4 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(AppTelemetryInvestigation *)self->_investigation hash];
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v17 = 0;
  if ((has & 2) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v18 = 2654435761 * self->_magnitudeLong;
  if ((has & 4) == 0) {
    goto LABEL_28;
  }
LABEL_24:
  unint64_t v19 = 2654435761u * self->_timestamp;
  return (2654435761 * telemetrySchema) ^ v4 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(AppTelemetryInvestigation *)self->_investigation hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    self->_uint64_t magnitude = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
  self->_unsigned int telemetrySchema = *((_DWORD *)v4 + 13);
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_float magnitudeFloat = *((float *)v4 + 11);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_5:
      if ((v6 & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_double magnitudeDouble = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_magnitudeInt = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x20u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_magnitudeBool = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_has |= 0x40u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_8:
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  self->_magnitudeLong = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_9:
    self->_timestamp = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
  investigation = self->_investigation;
  uint64_t v8 = v5[4];
  if (investigation)
  {
    if (!v8) {
      goto LABEL_22;
    }
    float v9 = v5;
    -[AppTelemetryInvestigation mergeFrom:](investigation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_22;
    }
    float v9 = v5;
    -[AppTelemetryTimeSeriesEvent setInvestigation:](self, "setInvestigation:");
  }
  uint64_t v5 = v9;
LABEL_22:
}

- (unsigned)telemetrySchema
{
  return self->_telemetrySchema;
}

- (void)setTelemetrySchema:(unsigned int)a3
{
  self->_unsigned int telemetrySchema = a3;
}

- (float)magnitudeFloat
{
  return self->_magnitudeFloat;
}

- (double)magnitudeDouble
{
  return self->_magnitudeDouble;
}

- (int)magnitudeInt
{
  return self->_magnitudeInt;
}

- (BOOL)magnitudeBool
{
  return self->_magnitudeBool;
}

- (int64_t)magnitudeLong
{
  return self->_magnitudeLong;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AppTelemetryInvestigation)investigation
{
  return self->_investigation;
}

- (void)setInvestigation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
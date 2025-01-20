@interface CKOperationGroup(BRAdditions)
+ (id)br_aggressiveChaining;
+ (id)br_collaborationUpload;
+ (id)br_downloadConflictingVersions;
+ (id)br_downloadOpportunistic;
+ (id)br_downloadOptimizeStorageOff;
+ (id)br_downloadSpeculative;
+ (id)br_downloadThumbnails;
+ (id)br_downloadThumbnailsUserInitiated;
+ (id)br_downloadUpdatedDocuments;
+ (id)br_downloadUserInitiated;
+ (id)br_fetchIdentityXPC;
+ (id)br_fetchNonLocalVersions;
+ (id)br_fetchParentChain;
+ (id)br_fetchRecents;
+ (id)br_listDirectoryContents;
+ (id)br_locateRecord;
+ (id)br_logout;
+ (id)br_operationGroupWithName:()BRAdditions;
+ (id)br_osUpgradeMigration;
+ (id)br_partialSaltingCompletion;
+ (id)br_publishingRequest;
+ (id)br_purge;
+ (id)br_quotaUpdateTelemetry;
+ (id)br_quotaUpdateUploader;
+ (id)br_quotaUpdateXPC;
+ (id)br_sharingMisc;
+ (id)br_syncDown;
+ (id)br_syncDownAppLaunch;
+ (id)br_syncDownAppLibraryMetadata;
+ (id)br_syncDownInitial;
+ (id)br_syncDownPeriodic;
+ (id)br_syncDownPushTriggered;
+ (id)br_syncDownZoneHealth;
+ (id)br_syncUp;
+ (id)br_syncUpAndDownShareDB;
+ (id)br_syncUpAppLibraryMetadata;
+ (id)br_syncUpZoneHealth;
+ (id)br_testTrigger;
+ (id)br_upload;
+ (id)br_zoneConsolidation;
+ (id)br_zoneConsolidationManual;
+ (id)br_zoneHealthSimulation;
@end

@implementation CKOperationGroup(BRAdditions)

+ (id)br_syncDown
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownPeriodic
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (periodic)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownInitial
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (initial)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownPushTriggered
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (push triggered)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownAppLaunch
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (app launch)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownAppLibraryMetadata
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (app library metadata)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncDownZoneHealth
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync down (zone health)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_listDirectoryContents
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"List directory", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_fetchParentChain
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Fetch parent chain", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_locateRecord
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Locate record", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_fetchRecents
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Fetch recent documents", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncUp
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync up", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncUpAppLibraryMetadata
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync up (app library metadata)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncUpZoneHealth
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync up (zone health)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadThumbnails
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (thumbnails)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadThumbnailsUserInitiated
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (thumbnails user initiated)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadUserInitiated
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (user initiated)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadOpportunistic
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (opportunistic)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadOptimizeStorageOff
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (optimize storage off)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadUpdatedDocuments
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (updated documents)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadConflictingVersions
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (conflicting versions)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_downloadSpeculative
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Download (speculative)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_upload
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Upload", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_collaborationUpload
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Collaboration upload", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_quotaUpdateUploader
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Quota update (uploader)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_quotaUpdateXPC
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Quota update (xpc request)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_quotaUpdateTelemetry
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Quota update (telemetry)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_zoneConsolidation
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Zone consolidation", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_zoneConsolidationManual
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Zone consolidation (manual)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_zoneHealthSimulation
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Zone health simulation", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_publishingRequest
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Publishing request", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_syncUpAndDownShareDB
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sync up & down (shared db)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_sharingMisc
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Sharing misc.", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_fetchIdentityXPC
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Fetch identity (xpc request)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_purge
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Purge", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_fetchNonLocalVersions
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Fetch non local versions", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_osUpgradeMigration
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"OS upgrade migration", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_aggressiveChaining
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Aggressive PCS Chaining", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_partialSaltingCompletion
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Aggressive salting (partially salted)", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_logout
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Logout", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_testTrigger
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v1 = NSString;
  int v2 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v3 = "";
  if (v2) {
    v3 = " (SB)";
  }
  v4 = [v1 stringWithFormat:@"%@%s", @"Test Trigger", v3];
  [v0 setName:v4];

  return v0;
}

+ (id)br_operationGroupWithName:()BRAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F1A218];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = NSString;
  int v7 = objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
  v8 = "";
  if (v7) {
    v8 = " (SB)";
  }
  v9 = [v6 stringWithFormat:@"%@%s", v4, v8];

  [v5 setName:v9];

  return v5;
}

@end
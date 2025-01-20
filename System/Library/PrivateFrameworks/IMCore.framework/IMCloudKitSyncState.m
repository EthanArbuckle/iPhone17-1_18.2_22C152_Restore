@interface IMCloudKitSyncState
- (BOOL)accountNeedsRepair;
- (BOOL)canChangeEnabledSetting;
- (BOOL)canEnableSyncing;
- (BOOL)canStartSyncing;
- (BOOL)hasAvailableRecordsToDownload;
- (BOOL)hasExited;
- (BOOL)hasNotSyncedInLastSevenDays;
- (BOOL)isBetweenInitialAndFullSync;
- (BOOL)isDisablingDevices;
- (BOOL)isSyncEnabledForDisplayOnly;
- (BOOL)isSyncing;
- (BOOL)isSyncingAvailable;
- (BOOL)isSyncingEnabled;
- (BOOL)isSyncingPaused;
- (BOOL)shouldFetchSyncStatistics;
- (BOOL)shouldSendSyncProgress;
- (BOOL)syncingFailed;
- (IMCloudKitSyncState)init;
- (IMCloudKitSyncState)initWithAccountEnabled:(BOOL)a3 stateDictionary:(id)a4;
- (IMCloudKitSyncStatistics)statistics;
- (NSArray)errors;
- (NSDate)exitDate;
- (NSDate)lastFullPartialSyncDate;
- (NSDate)lastFullSyncDate;
- (NSDate)lastSyncDate;
- (NSString)description;
- (NSString)syncStatusText;
- (double)lastDownloadProgress;
- (id)createSyncProgressWithSyncStatistics:(id)a3;
- (id)syncErrorWithDomain:(id)a3 code:(int64_t)a4;
- (int64_t)accountStatus;
- (int64_t)changingEnabledState;
- (int64_t)syncControllerRecordType;
- (int64_t)syncControllerSyncType;
- (unint64_t)syncControllerSyncState;
- (unint64_t)syncJobState;
- (unint64_t)syncStatus;
- (unint64_t)syncType;
@end

@implementation IMCloudKitSyncState

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState__lastSyncDate);
}

- (IMCloudKitSyncState)initWithAccountEnabled:(BOOL)a3 stateDictionary:(id)a4
{
  BOOL v4 = a3;
  if (a4) {
    uint64_t v5 = sub_1A4CBB0AC();
  }
  else {
    uint64_t v5 = 0;
  }
  return (IMCloudKitSyncState *)sub_1A4B0C6BC(v4, v5);
}

- (unint64_t)syncControllerSyncState
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerSyncState);
}

- (int64_t)syncControllerSyncType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerSyncType);
}

- (int64_t)syncControllerRecordType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerRecordType);
}

- (BOOL)hasExited
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_hasExited);
}

- (int64_t)changingEnabledState
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_changingEnabledState);
}

- (BOOL)isDisablingDevices
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_isDisablingDevices);
}

- (BOOL)hasAvailableRecordsToDownload
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_hasAvailableRecordsToDownload);
}

- (NSArray)errors
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_errors))
  {
    swift_bridgeObjectRetain();
    sub_1A4B0E048(&qword_1E965B4A8);
    v2 = (void *)sub_1A4CBB14C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (int64_t)accountStatus
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_accountStatus);
}

- (unint64_t)syncType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncType);
}

- (unint64_t)syncStatus
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncStatus);
}

- (unint64_t)syncJobState
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncJobState);
}

- (IMCloudKitSyncStatistics)statistics
{
  return (IMCloudKitSyncStatistics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___IMCloudKitSyncState_statistics));
}

- (double)lastDownloadProgress
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_lastDownloadProgress);
}

- (NSDate)exitDate
{
  return (NSDate *)sub_1A4C94EC0(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__exitDate);
}

- (NSDate)lastFullSyncDate
{
  return (NSDate *)sub_1A4C94EC0(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastFullSyncDate);
}

- (NSDate)lastFullPartialSyncDate
{
  return (NSDate *)sub_1A4C94EC0(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastFullPartialSyncDate);
}

- (NSDate)lastSyncDate
{
  return (NSDate *)sub_1A4C94EC0(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastSyncDate);
}

- (BOOL)isSyncing
{
  v2 = self;
  char v3 = sub_1A4C95228();

  return v3 & 1;
}

- (BOOL)isSyncingPaused
{
  v2 = self;
  char v3 = sub_1A4C953F8();

  return v3 & 1;
}

- (BOOL)isSyncingEnabled
{
  v2 = self;
  char v3 = sub_1A4C9552C();

  return v3 & 1;
}

- (BOOL)isSyncingAvailable
{
  v2 = self;
  char v3 = sub_1A4C95838();

  return v3 & 1;
}

- (BOOL)syncingFailed
{
  v2 = self;
  char v3 = [(IMCloudKitSyncState *)v2 errors];

  if (v3) {
  return v3 != 0;
  }
}

- (BOOL)canEnableSyncing
{
  v2 = self;
  unsigned __int8 v3 = sub_1A4C95C74();

  return v3 & 1;
}

- (BOOL)canStartSyncing
{
  v2 = self;
  unsigned __int8 v3 = sub_1A4C95D20();

  return v3 & 1;
}

- (BOOL)canChangeEnabledSetting
{
  v2 = self;
  if ([(IMCloudKitSyncState *)v2 isSyncingAvailable]
    && (id)[(IMCloudKitSyncState *)v2 changingEnabledState] != (id)1)
  {
    id v4 = [(IMCloudKitSyncState *)v2 changingEnabledState];

    return v4 != (id)2;
  }
  else
  {

    return 0;
  }
}

- (BOOL)isSyncEnabledForDisplayOnly
{
  v2 = self;
  char v3 = sub_1A4C95E54();

  return v3 & 1;
}

- (NSString)syncStatusText
{
  v2 = self;
  sub_1A4C96228();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isBetweenInitialAndFullSync
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState__isBetweenInitialAndFullSync);
}

- (BOOL)accountNeedsRepair
{
  sub_1A4CBB0CC();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_1A4CBB0BC();
  id v5 = [(IMCloudKitSyncState *)v3 syncErrorWithDomain:v4 code:3];

  swift_bridgeObjectRelease();
  if (v5) {

  }
  return v5 != 0;
}

- (id)syncErrorWithDomain:(id)a3 code:(int64_t)a4
{
  uint64_t v6 = sub_1A4CBB0CC();
  uint64_t v8 = v7;
  v9 = self;
  id v10 = sub_1A4C96720(v6, v8, (id)a4);

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1A4CBAE1C();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v2 = self;
  IMCloudKitSyncState.description.getter();

  uint64_t v3 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (IMCloudKitSyncState)init
{
  result = (IMCloudKitSyncState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)shouldSendSyncProgress
{
  v2 = self;
  unsigned __int8 v3 = sub_1A4C9FE00();

  return v3 & 1;
}

- (BOOL)shouldFetchSyncStatistics
{
  v2 = self;
  unsigned __int8 v3 = sub_1A4C9FF04();

  return v3 & 1;
}

- (BOOL)hasNotSyncedInLastSevenDays
{
  v2 = self;
  BOOL v3 = sub_1A4C9FFD4();

  return v3;
}

- (id)createSyncProgressWithSyncStatistics:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  char v6 = sub_1A4C9758C(v4);
  id v7 = sub_1A4C977C0(v6, (uint64_t)v4, (uint64_t)a3);

  return v7;
}

@end
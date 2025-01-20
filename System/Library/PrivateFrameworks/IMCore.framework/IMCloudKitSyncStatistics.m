@interface IMCloudKitSyncStatistics
+ (double)calculatePercentageOfTotal:(double)a3 count:(double)a4;
+ (id)_createSyncStatisticsDictionary:(int64_t)a3 messageSyncCount:(int64_t)a4 messageUnresolvedCount:(int64_t)a5 chatCount:(int64_t)a6 chatSyncCount:(int64_t)a7 chatUnresolvedCount:(int64_t)a8 attachmentCount:(int64_t)a9 attachmentSyncCount:(int64_t)a10 attachmentUnresolvedCount:(int64_t)a11 serverRecordCounts:(id)a12 syncStoreCounts:(id)a13;
+ (id)_createSyncStatisticsDictionaryForSyncControllerSyncState:(unint64_t)a3 syncType:(int64_t)a4 count:(double)a5 max:(double)a6 unresolved:(double)a7;
+ (id)percentStringFromDouble:(double)a3;
+ (id)percentStringFromTotal:(double)a3 count:(double)a4;
- (IMCloudKitSyncStatistics)init;
- (IMCloudKitSyncStatistics)initWithStatisticsDictionary:(id)a3;
- (NSString)description;
- (double)percentSynced;
- (id)_syncStatisticsDictionary;
- (int64_t)remainingMessagesCount;
- (int64_t)serverAttachmentLiveCount;
- (int64_t)serverAttachmentTotalCount;
- (int64_t)serverChatLiveCount;
- (int64_t)serverChatTotalCount;
- (int64_t)serverMessageLiveCount;
- (int64_t)serverMessageTotalCount;
- (int64_t)serverMessageUpdateLiveCount;
- (int64_t)serverMessageUpdateTotalCount;
- (int64_t)serverRecoverableMessageLiveCount;
- (int64_t)serverRecoverableMessageTotalCount;
- (int64_t)syncStoreWritableAttachmentCount;
- (int64_t)syncStoreWritableChatCount;
- (int64_t)syncStoreWritableMessageCount;
- (int64_t)syncStoreWritableMessageUpdateCount;
- (int64_t)syncStoreWritableRecoverableMessageCount;
- (int64_t)syncStoreWrittenAttachmentCount;
- (int64_t)syncStoreWrittenChatCount;
- (int64_t)syncStoreWrittenMessageCount;
- (int64_t)syncStoreWrittenMessageUpdateCount;
- (int64_t)syncStoreWrittenRecoverableMessageCount;
- (int64_t)syncedAttachmentCount;
- (int64_t)syncedChatCount;
- (int64_t)syncedMessageCount;
- (int64_t)syncedRecordCount;
- (int64_t)totalAttachmentCount;
- (int64_t)totalChatCount;
- (int64_t)totalMessageCount;
- (int64_t)totalRecordCount;
- (int64_t)unresolvedAttachmentCount;
- (int64_t)unresolvedChatCount;
- (int64_t)unresolvedMessageCount;
- (int64_t)unresolvedRecordCount;
@end

@implementation IMCloudKitSyncStatistics

- (int64_t)syncedChatCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 32];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)totalChatCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 40];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)unresolvedChatCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 56];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverChatTotalCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 96];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverChatLiveCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 104];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWritableChatCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 72];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWrittenChatCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 80];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncedMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 128];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)totalMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 136];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)unresolvedMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 152];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverMessageTotalCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 192];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverMessageLiveCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 200];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWritableMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 168];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWrittenMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 176];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncedAttachmentCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 224];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)totalAttachmentCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 232];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)unresolvedAttachmentCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 248];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverAttachmentTotalCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 288];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverAttachmentLiveCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 296];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWritableAttachmentCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 264];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWrittenAttachmentCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 272];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverMessageUpdateTotalCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 384];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverMessageUpdateLiveCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 392];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWritableMessageUpdateCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 360];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWrittenMessageUpdateCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 368];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverRecoverableMessageTotalCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 480];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)serverRecoverableMessageLiveCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 488];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWritableRecoverableMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 456];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncStoreWrittenRecoverableMessageCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 464];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)syncedRecordCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)totalRecordCount
{
  int64_t result = *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncStatistics_statistics);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)unresolvedRecordCount
{
  int64_t result = *(void *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 8];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (double)percentSynced
{
  v2 = self;
  double v3 = (double)[(IMCloudKitSyncStatistics *)v2 syncedRecordCount];
  int64_t v4 = [(IMCloudKitSyncStatistics *)v2 totalRecordCount];

  return v3 / (double)v4;
}

- (int64_t)remainingMessagesCount
{
  v2 = self;
  double v3 = [(IMCloudKitSyncStatistics *)v2 totalMessageCount];
  int64_t result = [(IMCloudKitSyncStatistics *)v2 syncedMessageCount];
  v5 = &v3[-result];
  if (__OFSUB__(v3, result))
  {
    __break(1u);
  }
  else
  {
    int64_t v6 = [(IMCloudKitSyncStatistics *)v2 unresolvedMessageCount];

    if (!__OFSUB__(v5, v6)) {
      return (unint64_t)&v5[-v6] & ~((uint64_t)&v5[-v6] >> 63);
    }
  }
  __break(1u);
  return result;
}

+ (double)calculatePercentageOfTotal:(double)a3 count:(double)a4
{
  double v4 = a4 / a3;
  BOOL v5 = a3 == 0.0;
  double result = 1.0;
  if (!v5) {
    return v4;
  }
  return result;
}

+ (id)percentStringFromDouble:(double)a3
{
  sub_1A4B0C510(0, (unint64_t *)&qword_1E965DA70);
  MEMORY[0x1A62627E0](a3);
  if (v4)
  {
    BOOL v5 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)percentStringFromTotal:(double)a3 count:(double)a4
{
  objc_msgSend(a1, sel_calculatePercentageOfTotal_count_, a3, a4);
  id v5 = objc_msgSend(a1, sel_percentStringFromDouble_);
  if (v5)
  {
    sub_1A4CBB0CC();

    id v5 = (id)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }

  return v5;
}

- (NSString)description
{
  v2 = self;
  IMCloudKitSyncStatistics.description.getter();

  double v3 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (IMCloudKitSyncStatistics)init
{
  double result = (IMCloudKitSyncStatistics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (IMCloudKitSyncStatistics)initWithStatisticsDictionary:(id)a3
{
  sub_1A4CBB0AC();
  id v3 = objc_allocWithZone((Class)IMCloudKitSyncStatistics);
  uint64_t v4 = (IMCloudKitSyncStatistics *)sub_1A4CA2D7C();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

+ (id)_createSyncStatisticsDictionary:(int64_t)a3 messageSyncCount:(int64_t)a4 messageUnresolvedCount:(int64_t)a5 chatCount:(int64_t)a6 chatSyncCount:(int64_t)a7 chatUnresolvedCount:(int64_t)a8 attachmentCount:(int64_t)a9 attachmentSyncCount:(int64_t)a10 attachmentUnresolvedCount:(int64_t)a11 serverRecordCounts:(id)a12 syncStoreCounts:(id)a13
{
  uint64_t v18 = sub_1A4CBB0AC();
  sub_1A4B0C510(0, &qword_1E965DD40);
  uint64_t v19 = sub_1A4CBB0AC();
  v20 = (void *)sub_1A4CB66F4(a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v20;
}

+ (id)_createSyncStatisticsDictionaryForSyncControllerSyncState:(unint64_t)a3 syncType:(int64_t)a4 count:(double)a5 max:(double)a6 unresolved:(double)a7
{
  swift_getObjCClassMetadata();
  v11 = (void *)sub_1A4CB69DC(a4, a5, a6, a7);

  return v11;
}

- (id)_syncStatisticsDictionary
{
  v2 = self;
  id v3 = sub_1A4CB64D4();

  return v3;
}

@end
@interface IMDScheduledMessageStore
- (CKRecordZoneID)recordZoneID;
- (IMDScheduledMessageStore)init;
- (id)messageRecordsToUploadToCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4;
- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3;
- (void)clearTombstonesForRecordIDs:(id)a3;
@end

@implementation IMDScheduledMessageStore

- (CKRecordZoneID)recordZoneID
{
  v3 = self;
  v4 = self;
  result = (CKRecordZoneID *)objc_msgSend(v3, sel_sharedInstance);
  if (result)
  {
    v6 = result;
    id v7 = [(CKRecordZoneID *)result scheduledMessageRecordZoneID];

    return (CKRecordZoneID *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)messageRecordsToUploadToCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4
{
  v5 = self;
  sub_1D98986F8(a4);

  v6 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3
{
  _s12IMDaemonCore21ScheduledMessageStoreC25recordIDsAndGUIDsToDelete9withLimitSaySDys11AnyHashableVypGGs5Int64V_tF_0(a3);
  sub_1D96867CC(&qword_1EBE2B4B0);
  v3 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  sub_1D968E084(0, (unint64_t *)&qword_1EBE2B4D0);
  unint64_t v4 = sub_1D9906F20();
  v5 = self;
  _s12IMDaemonCore21ScheduledMessageStoreC15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0(v4);

  swift_bridgeObjectRelease();
}

- (IMDScheduledMessageStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(IMDMessageStore *)&v3 init];
}

@end
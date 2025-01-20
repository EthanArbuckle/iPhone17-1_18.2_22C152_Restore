@interface IMDRecoverableMessageStore
- (IMDRecoverableMessageStore)init;
- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (void)clearTombstonesForRecordIDs:(id)a3;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
@end

@implementation IMDRecoverableMessageStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  v7 = self;
  RecoverableMessageStore.batchOfRecordsToWrite(filter:limit:)(a3, a4);

  sub_1D968E084(0, &qword_1EBE2B540);
  v8 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  RecoverableMessageStore.recordUpdateSucceeded(forRecord:)((CKRecord)v4);
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v9 = a5;
  v8 = self;
  sub_1D98DB854(v7, v9);
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  v5 = self;
  RecoverableMessageStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D968E084(0, (unint64_t *)&qword_1EBE2B4D0);
  sub_1D989836C();
  v6 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  sub_1D968E084(0, (unint64_t *)&qword_1EBE2B4D0);
  sub_1D9906F20();
  id v4 = self;
  _s12IMDaemonCore23RecoverableMessageStoreC15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

- (IMDRecoverableMessageStore)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDRecoverableMessageStore_metadataByRecordNameMap) = (Class)MEMORY[0x1E4FBC868];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(IMDRecoverableMessageStore *)&v5 init];
}

- (void).cxx_destruct
{
}

@end
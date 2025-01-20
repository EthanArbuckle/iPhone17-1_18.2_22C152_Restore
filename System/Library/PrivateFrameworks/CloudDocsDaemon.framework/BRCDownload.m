@interface BRCDownload
- (BOOL)progressPublished;
- (BRCClientZone)clientZone;
- (BRCDownload)initWithDocument:(id)a3 stageID:(id)a4;
- (BRCItemID)itemID;
- (BRCProgress)progress;
- (CKRecord)record;
- (CKRecord)secondaryRecord;
- (CKRecordID)recordID;
- (CKRecordID)secondaryRecordID;
- (NSNumber)transferID;
- (NSString)etag;
- (NSString)etagIfLoser;
- (NSString)stageID;
- (int)kind;
- (unint64_t)doneSize;
- (unint64_t)totalSize;
- (void)dealloc;
- (void)setDoneSize:(unint64_t)a3;
- (void)setProgressPublished:(BOOL)a3;
- (void)setRecord:(id)a3;
@end

@implementation BRCDownload

- (int)kind
{
  return -1;
}

- (NSString)etagIfLoser
{
  return 0;
}

- (NSNumber)transferID
{
  return (NSNumber *)[NSNumber numberWithLongLong:self->_throttleID];
}

- (CKRecordID)secondaryRecordID
{
  return 0;
}

- (CKRecord)secondaryRecord
{
  return 0;
}

- (BRCDownload)initWithDocument:(id)a3 stageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCDownload;
  v8 = [(BRCDownload *)&v20 init];
  if (v8)
  {
    v8->_throttleID = [v6 dbRowID];
    uint64_t v9 = [v6 itemID];
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    uint64_t v11 = [v6 documentRecordID];
    recordID = v8->_recordID;
    v8->_recordID = (CKRecordID *)v11;

    objc_storeStrong((id *)&v8->_stageID, a4);
    v13 = [v6 desiredVersion];
    v14 = [v13 ckInfo];
    uint64_t v15 = [v14 etag];
    etag = v8->_etag;
    v8->_etag = (NSString *)v15;

    uint64_t v17 = [v6 clientZone];
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v17;
  }
  return v8;
}

- (void)dealloc
{
  if ([(BRCDownload *)self progressPublished]) {
    [(BRCProgress *)self->_progress brc_unpublish];
  }
  v3.receiver = self;
  v3.super_class = (Class)BRCDownload;
  [(BRCDownload *)&v3 dealloc];
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (BOOL)progressPublished
{
  return self->_progressPublished;
}

- (void)setProgressPublished:(BOOL)a3
{
  self->_progressPublished = a3;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSString)stageID
{
  return self->_stageID;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
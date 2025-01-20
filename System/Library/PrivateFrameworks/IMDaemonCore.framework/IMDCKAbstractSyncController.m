@interface IMDCKAbstractSyncController
- (BOOL)_fetchedAllChangesFromCloudKit;
- (BOOL)isSyncing;
- (IMDCKAbstractSyncControllerDelegate)delegate;
- (IMDCKSyncState)syncState;
- (id)_syncTokenKey;
- (id)_syncTokenStore;
- (id)ckUtilities;
- (id)describeRecordCounts;
- (id)errorAnalyzer;
- (id)latestSyncToken;
- (id)recordStore;
- (id)syncStateDebuggingInfo:(id)a3;
- (int64_t)syncControllerRecordType;
- (unint64_t)recordsRead;
- (unint64_t)recordsWriteFailed;
- (unint64_t)recordsWritten;
- (void)countRecordOnRead:(BOOL)a3 didSucceed:(BOOL)a4;
- (void)deleteSyncToken;
- (void)resetRecordCounts;
- (void)setBroadcastedSyncStateStateToFinished;
- (void)setBroadcastedSyncStateStateToStarting;
- (void)setBroadcastedSyncStateToDeleting;
- (void)setBroadcastedSyncStateToDownloading;
- (void)setBroadcastedSyncStateToStartingInitialSync;
- (void)setBroadcastedSyncStateToStartingPeriodicSync;
- (void)setBroadcastedSyncStateToUploading;
- (void)setDelegate:(id)a3;
- (void)setIsSyncing:(BOOL)a3;
- (void)setLatestSyncToken:(id)a3;
- (void)setRecordsRead:(unint64_t)a3;
- (void)setRecordsWriteFailed:(unint64_t)a3;
- (void)setRecordsWritten:(unint64_t)a3;
- (void)syncBatchCompleted:(unint64_t)a3;
@end

@implementation IMDCKAbstractSyncController

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance];
}

- (void)setIsSyncing:(BOOL)a3
{
  self->_isSyncing = a3;
  if (a3) {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateStateToStarting];
  }
  else {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateStateToFinished];
  }
}

- (id)recordStore
{
  return 0;
}

- (id)_syncTokenStore
{
  return 0;
}

- (id)errorAnalyzer
{
  return (id)[MEMORY[0x1E4F6EA68] sharedInstance];
}

- (IMDCKSyncState)syncState
{
  v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  v3 = [v2 syncState];

  return (IMDCKSyncState *)v3;
}

- (id)_syncTokenKey
{
  return @"changeToken";
}

- (void)setLatestSyncToken:(id)a3
{
  id v4 = a3;
  id v6 = [(IMDCKAbstractSyncController *)self _syncTokenStore];
  v5 = [(IMDCKAbstractSyncController *)self _syncTokenKey];
  [v6 persistToken:v4 forKey:v5];
}

- (void)deleteSyncToken
{
  id v4 = [(IMDCKAbstractSyncController *)self _syncTokenStore];
  v3 = [(IMDCKAbstractSyncController *)self _syncTokenKey];
  [v4 persistToken:0 forKey:v3];
}

- (id)latestSyncToken
{
  v3 = [(IMDCKAbstractSyncController *)self _syncTokenStore];
  id v4 = [(IMDCKAbstractSyncController *)self _syncTokenKey];
  v5 = [v3 tokenForKey:v4];

  return v5;
}

- (void)resetRecordCounts
{
  [(IMDCKAbstractSyncController *)self setRecordsRead:0];
  [(IMDCKAbstractSyncController *)self setRecordsWritten:0];

  [(IMDCKAbstractSyncController *)self setRecordsWriteFailed:0];
}

- (void)countRecordOnRead:(BOOL)a3 didSucceed:(BOOL)a4
{
  if (a3)
  {
    unint64_t v5 = [(IMDCKAbstractSyncController *)self recordsRead] + 1;
    [(IMDCKAbstractSyncController *)self setRecordsRead:v5];
  }
  else if (a4)
  {
    unint64_t v6 = [(IMDCKAbstractSyncController *)self recordsWriteFailed] + 1;
    [(IMDCKAbstractSyncController *)self setRecordsWriteFailed:v6];
  }
  else
  {
    unint64_t v7 = [(IMDCKAbstractSyncController *)self recordsWritten] + 1;
    [(IMDCKAbstractSyncController *)self setRecordsWritten:v7];
  }
}

- (id)describeRecordCounts
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%lu,%lu,%lu)", -[IMDCKAbstractSyncController recordsRead](self, "recordsRead"), -[IMDCKAbstractSyncController recordsWritten](self, "recordsWritten"), -[IMDCKAbstractSyncController recordsWriteFailed](self, "recordsWriteFailed"));
}

- (int64_t)syncControllerRecordType
{
  return 0;
}

- (void)setBroadcastedSyncStateStateToFinished
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 0, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateStateToStarting
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 1, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateToDownloading
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 2, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateToUploading
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 4, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateToDeleting
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setSyncControllerSyncState:withRecordType:", 3, -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateToStartingPeriodicSync
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setStartingPeriodicSyncWithRecordType:", -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (void)setBroadcastedSyncStateToStartingInitialSync
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  objc_msgSend(v3, "setStartingInitialSyncWithRecordType:", -[IMDCKAbstractSyncController syncControllerRecordType](self, "syncControllerRecordType"));
}

- (id)syncStateDebuggingInfo:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  unint64_t v5 = [(IMDCKAbstractSyncController *)self syncState];
  unint64_t v6 = [v5 description];
  [v4 setObject:v6 forKey:@"syncState"];

  [(IMDCKAbstractSyncController *)self addSyncDebuggingInfoToDictionary:v4];

  return v4;
}

- (void)syncBatchCompleted:(unint64_t)a3
{
  unint64_t v5 = [(IMDCKAbstractSyncController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IMDCKAbstractSyncController *)self delegate];
    [v7 syncController:self syncBatchCompleted:a3];
  }
}

- (BOOL)_fetchedAllChangesFromCloudKit
{
  return IMGetDomainBoolForKey();
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (unint64_t)recordsRead
{
  return self->_recordsRead;
}

- (void)setRecordsRead:(unint64_t)a3
{
  self->_recordsRead = a3;
}

- (unint64_t)recordsWritten
{
  return self->_recordsWritten;
}

- (void)setRecordsWritten:(unint64_t)a3
{
  self->_recordsWritten = a3;
}

- (unint64_t)recordsWriteFailed
{
  return self->_recordsWriteFailed;
}

- (void)setRecordsWriteFailed:(unint64_t)a3
{
  self->_recordsWriteFailed = a3;
}

- (IMDCKAbstractSyncControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMDCKAbstractSyncControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
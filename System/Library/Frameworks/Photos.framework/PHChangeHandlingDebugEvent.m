@interface PHChangeHandlingDebugEvent
- (BOOL)cloudSyncEnabled;
- (BOOL)isValid;
- (BOOL)isValue;
- (BOOL)unknownMergeEvent;
- (double)distributeExternalTimestamp;
- (double)distributeInternalTimestamp;
- (double)endTimestamp;
- (double)firstSyncTimestamp;
- (double)lastSyncTimestamp;
- (double)startTimestamp;
- (id)description;
- (int64_t)changeCount;
- (int64_t)transactionCount;
- (unint64_t)deletedCount;
- (unint64_t)externalObserversCount;
- (unint64_t)fetchResultCount;
- (unint64_t)insertedCount;
- (unint64_t)internalObserversCount;
- (unint64_t)kind;
- (unint64_t)lastTransactionNumber;
- (unint64_t)threadID;
- (unint64_t)updatedCount;
- (unsigned)qosClass;
- (void)_start;
- (void)reset;
- (void)setChangeCount:(int64_t)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDeletedCount:(unint64_t)a3;
- (void)setDistributeExternalTimestamp:(double)a3;
- (void)setDistributeInternalTimestamp:(double)a3;
- (void)setEndTimestamp:(double)a3;
- (void)setExternalObserversCount:(unint64_t)a3;
- (void)setFetchResultCount:(unint64_t)a3;
- (void)setFirstSyncTimestamp:(double)a3;
- (void)setInsertedCount:(unint64_t)a3;
- (void)setInternalObserversCount:(unint64_t)a3;
- (void)setKind:(unint64_t)a3;
- (void)setLastSyncTimestamp:(double)a3;
- (void)setLastTransactionNumber:(unint64_t)a3;
- (void)setQosClass:(unsigned int)a3;
- (void)setStartTimestamp:(double)a3;
- (void)setThreadID:(unint64_t)a3;
- (void)setTransactionCount:(int64_t)a3;
- (void)setUnknownMergeEvent:(BOOL)a3;
- (void)setUpdatedCount:(unint64_t)a3;
- (void)startProcessPendingChanges;
- (void)startPublishCloudStatus;
@end

@implementation PHChangeHandlingDebugEvent

- (BOOL)isValue
{
  return self->_valid;
}

- (void)setFirstSyncTimestamp:(double)a3
{
  self->_firstSyncTimestamp = a3;
}

- (double)firstSyncTimestamp
{
  return self->_firstSyncTimestamp;
}

- (void)setLastSyncTimestamp:(double)a3
{
  self->_lastSyncTimestamp = a3;
}

- (double)lastSyncTimestamp
{
  return self->_lastSyncTimestamp;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setChangeCount:(int64_t)a3
{
  self->_changeCount = a3;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setLastTransactionNumber:(unint64_t)a3
{
  self->_lastTransactionNumber = a3;
}

- (unint64_t)lastTransactionNumber
{
  return self->_lastTransactionNumber;
}

- (void)setFetchResultCount:(unint64_t)a3
{
  self->_fetchResultCount = a3;
}

- (unint64_t)fetchResultCount
{
  return self->_fetchResultCount;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (BOOL)unknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setDeletedCount:(unint64_t)a3
{
  self->_deletedCount = a3;
}

- (unint64_t)deletedCount
{
  return self->_deletedCount;
}

- (void)setUpdatedCount:(unint64_t)a3
{
  self->_updatedCount = a3;
}

- (unint64_t)updatedCount
{
  return self->_updatedCount;
}

- (void)setInsertedCount:(unint64_t)a3
{
  self->_insertedCount = a3;
}

- (unint64_t)insertedCount
{
  return self->_insertedCount;
}

- (void)setEndTimestamp:(double)a3
{
  self->_endTimestamp = a3;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setDistributeExternalTimestamp:(double)a3
{
  self->_distributeExternalTimestamp = a3;
}

- (double)distributeExternalTimestamp
{
  return self->_distributeExternalTimestamp;
}

- (void)setDistributeInternalTimestamp:(double)a3
{
  self->_distributeInternalTimestamp = a3;
}

- (double)distributeInternalTimestamp
{
  return self->_distributeInternalTimestamp;
}

- (void)setExternalObserversCount:(unint64_t)a3
{
  self->_externalObserversCount = a3;
}

- (unint64_t)externalObserversCount
{
  return self->_externalObserversCount;
}

- (void)setInternalObserversCount:(unint64_t)a3
{
  self->_internalObserversCount = a3;
}

- (unint64_t)internalObserversCount
{
  return self->_internalObserversCount;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (id)description
{
  if ([(PHChangeHandlingDebugEvent *)self isValid])
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    [(PHChangeHandlingDebugEvent *)self startTimestamp];
    double v5 = v4;
    v6 = objc_msgSend(MEMORY[0x1E4F8A228], "stringFromTimestamp:");
    unint64_t v7 = [(PHChangeHandlingDebugEvent *)self threadID];
    [(PHChangeHandlingDebugEvent *)self qosClass];
    v8 = PLShortStringFromQoSClass();
    [v3 appendFormat:@"%@: thr: 0x%-8llx qos: %@", v6, v7, v8];

    [v3 appendFormat:@" int: %tu, ext: %tu", -[PHChangeHandlingDebugEvent internalObserversCount](self, "internalObserversCount"), -[PHChangeHandlingDebugEvent externalObserversCount](self, "externalObserversCount")];
    if ([(PHChangeHandlingDebugEvent *)self kind] == 1)
    {
      unint64_t v9 = [(PHChangeHandlingDebugEvent *)self insertedCount];
      unint64_t v10 = [(PHChangeHandlingDebugEvent *)self updatedCount];
      unint64_t v11 = [(PHChangeHandlingDebugEvent *)self deletedCount];
      BOOL v12 = [(PHChangeHandlingDebugEvent *)self unknownMergeEvent];
      v13 = @"NO";
      if (v12) {
        v13 = @"YES";
      }
      [v3 appendFormat:@" ins: %tu, upd: %tu, del: %tu: unk: %@", v9, v10, v11, v13];
      objc_msgSend(v3, "appendFormat:", @" fr cnt: %tu", -[PHChangeHandlingDebugEvent fetchResultCount](self, "fetchResultCount"));
      [v3 appendFormat:@" tx#: %llu, tx cnt: %zd, ch cnt: %zd", -[PHChangeHandlingDebugEvent lastTransactionNumber](self, "lastTransactionNumber"), -[PHChangeHandlingDebugEvent transactionCount](self, "transactionCount"), -[PHChangeHandlingDebugEvent changeCount](self, "changeCount")];
    }
    else if ([(PHChangeHandlingDebugEvent *)self kind] == 2)
    {
      v14 = (void *)MEMORY[0x1E4F8A228];
      [(PHChangeHandlingDebugEvent *)self lastSyncTimestamp];
      v15 = objc_msgSend(v14, "stringFromTimestamp:");
      v16 = (void *)MEMORY[0x1E4F8A228];
      [(PHChangeHandlingDebugEvent *)self firstSyncTimestamp];
      v17 = objc_msgSend(v16, "stringFromTimestamp:");
      BOOL v18 = [(PHChangeHandlingDebugEvent *)self cloudSyncEnabled];
      v19 = @"NO";
      if (v18) {
        v19 = @"YES";
      }
      [v3 appendFormat:@" cld: %@, lsd: %@, fsd: %@", v19, v15, v17];
    }
    [(PHChangeHandlingDebugEvent *)self distributeInternalTimestamp];
    if (v20 > 0.0)
    {
      [(PHChangeHandlingDebugEvent *)self distributeInternalTimestamp];
      objc_msgSend(v3, "appendFormat:", @" dist int: %+.3f", v21 - v5);
    }
    [(PHChangeHandlingDebugEvent *)self distributeExternalTimestamp];
    if (v22 > 0.0)
    {
      [(PHChangeHandlingDebugEvent *)self distributeExternalTimestamp];
      objc_msgSend(v3, "appendFormat:", @" dist ext: %+.3f", v23 - v5);
    }
    [(PHChangeHandlingDebugEvent *)self endTimestamp];
    if (v24 <= 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v26 = @" now: %+.3f";
    }
    else
    {
      [(PHChangeHandlingDebugEvent *)self endTimestamp];
      v26 = @" end: %+.3f";
    }
    objc_msgSend(v3, "appendFormat:", v26, v25 - v5);
  }
  else
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"<unused: %p>", self);
  }

  return v3;
}

- (BOOL)isValid
{
  return [(PHChangeHandlingDebugEvent *)self kind] != 0;
}

- (void)reset
{
  [(PHChangeHandlingDebugEvent *)self setKind:0];
  [(PHChangeHandlingDebugEvent *)self setStartTimestamp:0.0];
  [(PHChangeHandlingDebugEvent *)self setQosClass:0];
  [(PHChangeHandlingDebugEvent *)self setThreadID:0];
  [(PHChangeHandlingDebugEvent *)self setInternalObserversCount:0];
  [(PHChangeHandlingDebugEvent *)self setExternalObserversCount:0];
  [(PHChangeHandlingDebugEvent *)self setDistributeInternalTimestamp:0.0];
  [(PHChangeHandlingDebugEvent *)self setDistributeExternalTimestamp:0.0];
  [(PHChangeHandlingDebugEvent *)self setEndTimestamp:0.0];
  [(PHChangeHandlingDebugEvent *)self setInsertedCount:0];
  [(PHChangeHandlingDebugEvent *)self setUpdatedCount:0];
  [(PHChangeHandlingDebugEvent *)self setDeletedCount:0];
  [(PHChangeHandlingDebugEvent *)self setUnknownMergeEvent:0];
  [(PHChangeHandlingDebugEvent *)self setFetchResultCount:0];
  [(PHChangeHandlingDebugEvent *)self setLastTransactionNumber:0];
  [(PHChangeHandlingDebugEvent *)self setTransactionCount:0];
  [(PHChangeHandlingDebugEvent *)self setChangeCount:0];
  [(PHChangeHandlingDebugEvent *)self setCloudSyncEnabled:0];
  [(PHChangeHandlingDebugEvent *)self setLastSyncTimestamp:0.0];

  [(PHChangeHandlingDebugEvent *)self setFirstSyncTimestamp:0.0];
}

- (void)_start
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[PHChangeHandlingDebugEvent setStartTimestamp:](self, "setStartTimestamp:");
  [(PHChangeHandlingDebugEvent *)self setQosClass:qos_class_self()];
  __uint64_t v3 = 0;
  pthread_threadid_np(0, &v3);
  [(PHChangeHandlingDebugEvent *)self setThreadID:v3];
}

- (void)startPublishCloudStatus
{
  [(PHChangeHandlingDebugEvent *)self _start];

  [(PHChangeHandlingDebugEvent *)self setKind:2];
}

- (void)startProcessPendingChanges
{
  [(PHChangeHandlingDebugEvent *)self _start];

  [(PHChangeHandlingDebugEvent *)self setKind:1];
}

@end
@interface IMCloudKitSyncProgressRuntimeTest
- (double)progressRescheduleDelay;
- (id)createSyncStatisticsForMockSyncState:(id)a3;
- (unint64_t)maxProgressCount;
- (unint64_t)progressCount;
- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4;
- (void)setMaxProgressCount:(unint64_t)a3;
- (void)setProgressCount:(unint64_t)a3;
- (void)setProgressRescheduleDelay:(double)a3;
- (void)setUp;
- (void)startTest;
@end

@implementation IMCloudKitSyncProgressRuntimeTest

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
  objc_msgSend_testLog_(self, a2, @"Test got syncState progress: %@", (uint64_t)a4, a4);
  objc_msgSend_progressRescheduleDelay(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4BCF160;
  v10[3] = &unk_1E5B7ACD0;
  v10[4] = self;
  objc_msgSend_dispatchAfter_block_(self, v8, (uint64_t)v10, v9);
}

- (void)startTest
{
  objc_msgSend_testLog_(self, a2, @"Starting test", v2);

  MEMORY[0x1F4181798](self, sel_sendSyncStateChangedEvent, v4, v5);
}

- (id)createSyncStatisticsForMockSyncState:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_IMCloudKitSyncControllerSyncState(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_IMCloudKitSyncControllerSyncRecordType(v4, v9, v10, v11);

  objc_msgSend_progressCount(self, v13, v14, v15);
  objc_msgSend_maxProgressCount(self, v16, v17, v18);

  return (id)MEMORY[0x1F4181798](IMCloudKitSyncStatistics, sel__createSyncStatisticsDictionaryForSyncControllerSyncState_syncType_count_max_unresolved_, v8, v12);
}

- (void)setUp
{
  v6.receiver = self;
  v6.super_class = (Class)IMCloudKitSyncProgressRuntimeTest;
  [(IMCloudKitEventNotificationManagerRuntimeTest *)&v6 setUp];
  objc_msgSend_setProgressRescheduleDelay_(self, v3, v4, v5, 3.0);
}

- (unint64_t)progressCount
{
  return self->_progressCount;
}

- (void)setProgressCount:(unint64_t)a3
{
  self->_progressCount = a3;
}

- (unint64_t)maxProgressCount
{
  return self->_maxProgressCount;
}

- (void)setMaxProgressCount:(unint64_t)a3
{
  self->_maxProgressCount = a3;
}

- (double)progressRescheduleDelay
{
  return self->_progressRescheduleDelay;
}

- (void)setProgressRescheduleDelay:(double)a3
{
  self->_progressRescheduleDelay = a3;
}

@end
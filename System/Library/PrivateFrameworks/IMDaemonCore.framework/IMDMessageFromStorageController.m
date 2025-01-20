@interface IMDMessageFromStorageController
+ (id)SMSStorageController;
+ (id)iMessageStorageController;
- (BOOL)isAwaitingStorageTimer;
- (IMDMessageFromStorageController)initWithMessageStore:(id)a3;
- (IMDMessageStore)messageStore;
- (IMTimingCollection)timingComingBackFromStorage;
- (NSMutableSet)messagesReceivedDuringStorage;
- (NSString)serviceName;
- (NSTimer)storageTimer;
- (double)lastMessageStorageTimerInterval;
- (double)storageTimerInterval;
- (id)_broadcasterForTesting;
- (id)broadcaster;
- (unint64_t)messagesProcessedComingBackFromStorage;
- (unint64_t)pendingReadReceiptFromStorageCount;
- (void)_postMessagesFromStorage:(id)a3;
- (void)_storageTimerFired;
- (void)_submitStorageMetricsWithError:(unint64_t)a3;
- (void)_updateStorageTimerWithInterval:(double)a3;
- (void)decrementPendingReadReceiptFromStorageCount;
- (void)incrementPendingReadReceiptFromStorageCount;
- (void)noteItemFromStorage:(id)a3;
- (void)noteItemFromStorage:(id)a3 extendsStorageTimer:(BOOL)a4;
- (void)noteLastItemFromStorage:(id)a3;
- (void)noteLastItemProcessed;
- (void)noteLastItemProcessedWithError:(unint64_t)a3;
- (void)setLastMessageStorageTimerInterval:(double)a3;
- (void)setMessageStore:(id)a3;
- (void)setMessagesProcessedComingBackFromStorage:(unint64_t)a3;
- (void)setMessagesReceivedDuringStorage:(id)a3;
- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3;
- (void)setServiceName:(id)a3;
- (void)setStorageTimer:(id)a3;
- (void)setStorageTimerInterval:(double)a3;
- (void)setTimingComingBackFromStorage:(id)a3;
- (void)set_broadcasterForTesting:(id)a3;
@end

@implementation IMDMessageFromStorageController

+ (id)iMessageStorageController
{
  if (qword_1EBE2BB28 != -1) {
    dispatch_once(&qword_1EBE2BB28, &unk_1F3390B00);
  }
  [(id)qword_1EBE2BB20 setServiceName:*MEMORY[0x1E4F6E1B0]];
  v2 = (void *)qword_1EBE2BB20;

  return v2;
}

+ (id)SMSStorageController
{
  if (qword_1EBE2BC90 != -1) {
    dispatch_once(&qword_1EBE2BC90, &unk_1F3390B20);
  }
  [(id)qword_1EBE2BC98 setServiceName:*MEMORY[0x1E4F6E1A0]];
  v2 = (void *)qword_1EBE2BC98;

  return v2;
}

- (IMDMessageFromStorageController)initWithMessageStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDMessageFromStorageController;
  v6 = [(IMDMessageFromStorageController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageStore, a3);
    *(_OWORD *)&v7->_storageTimerInterval = xmmword_1D991CE30;
  }

  return v7;
}

- (id)broadcaster
{
  v2 = +[IMDBroadcastController sharedProvider];
  v3 = [v2 broadcasterForChatListeners];

  return v3;
}

- (BOOL)isAwaitingStorageTimer
{
  return self->_storageTimer != 0;
}

- (void)noteItemFromStorage:(id)a3
{
}

- (void)noteItemFromStorage:(id)a3 extendsStorageTimer:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = [(IMDMessageFromStorageController *)self messageStore];
    [v7 setSuppressDatabaseUpdates:1];

    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Noting item from storage (%@)", (uint8_t *)&v16, 0xCu);
      }
    }
    if (self->_timingComingBackFromStorage)
    {
      unint64_t v9 = self->_messagesProcessedComingBackFromStorage + 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "This is the first item from stroage starting timer", (uint8_t *)&v16, 2u);
        }
      }
      v11 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      timingComingBackFromStorage = self->_timingComingBackFromStorage;
      self->_timingComingBackFromStorage = v11;

      [(IMTimingCollection *)self->_timingComingBackFromStorage startTimingForKey:@"ProcessingMessagesFromStorage"];
      self->_messagesProcessedComingBackFromStorage = 0;
      unint64_t v9 = 1;
    }
    self->_messagesProcessedComingBackFromStorage = v9;
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    if (!messagesReceivedDuringStorage)
    {
      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v15 = self->_messagesReceivedDuringStorage;
      self->_messagesReceivedDuringStorage = v14;

      messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    }
    [(NSMutableSet *)messagesReceivedDuringStorage addObject:v6];
    if (a4 || !self->_storageTimer)
    {
      [(IMDMessageFromStorageController *)self storageTimerInterval];
      -[IMDMessageFromStorageController _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:");
    }
  }
}

- (void)noteLastItemFromStorage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(IMDMessageFromStorageController *)self messageStore];
    [v5 setSuppressDatabaseUpdates:1];

    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Noting last item from storage (%@)", (uint8_t *)&v10, 0xCu);
      }
    }
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    if (!messagesReceivedDuringStorage)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      unint64_t v9 = self->_messagesReceivedDuringStorage;
      self->_messagesReceivedDuringStorage = v8;

      messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    }
    [(NSMutableSet *)messagesReceivedDuringStorage addObject:v4];
    [(IMDMessageFromStorageController *)self lastMessageStorageTimerInterval];
    -[IMDMessageFromStorageController _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:");
  }
}

- (void)noteLastItemProcessed
{
}

- (void)noteLastItemProcessedWithError:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  timingComingBackFromStorage = self->_timingComingBackFromStorage;
  if (timingComingBackFromStorage)
  {
    [(IMTimingCollection *)timingComingBackFromStorage stopTimingForKey:@"ProcessingMessagesFromStorage"];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = self->_timingComingBackFromStorage;
        unint64_t messagesProcessedComingBackFromStorage = self->_messagesProcessedComingBackFromStorage;
        int v10 = 134218242;
        unint64_t v11 = messagesProcessedComingBackFromStorage;
        __int16 v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Finished processing %lu items from storage %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [(IMDMessageFromStorageController *)self _submitStorageMetricsWithError:a3];
    unint64_t v9 = self->_timingComingBackFromStorage;
    self->_timingComingBackFromStorage = 0;

    self->_unint64_t messagesProcessedComingBackFromStorage = 0;
  }
}

- (void)_submitStorageMetricsWithError:(unint64_t)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (IMIsRunningInUnitTesting())
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Should not be submitting metrics during unit tests. This method should be stubbed", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    v16[0] = *MEMORY[0x1E4F6DD48];
    id v6 = [NSNumber numberWithUnsignedInteger:self->_messagesProcessedComingBackFromStorage];
    v17[0] = v6;
    v16[1] = *MEMORY[0x1E4F6DDA0];
    v7 = NSNumber;
    [(IMTimingCollection *)self->_timingComingBackFromStorage totalTimeForKey:@"ProcessingMessagesFromStorage"];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    v17[1] = v8;
    v16[2] = *MEMORY[0x1E4F6DD98];
    unint64_t v9 = [(IMDMessageFromStorageController *)self serviceName];
    v17[2] = v9;
    v16[3] = *MEMORY[0x1E4F6DD90];
    int v10 = [NSNumber numberWithUnsignedInteger:a3];
    v17[3] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    if (IMOSLoggingEnabled())
    {
      __int16 v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Submitting message from storage metric with dictionary %@", (uint8_t *)&v14, 0xCu);
      }
    }
    v13 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v13 trackEvent:*MEMORY[0x1E4F6DA80] withDictionary:v11];
  }
}

- (void)_updateStorageTimerWithInterval:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 134217984;
        double v11 = a3;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Scheduling a storage invalidation timer in: %f", (uint8_t *)&v10, 0xCu);
      }
    }
    storageTimer = self->_storageTimer;
    if (storageTimer)
    {
      [(NSTimer *)storageTimer invalidate];
      v7 = self->_storageTimer;
      self->_storageTimer = 0;
    }
    v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__storageTimerFired selector:0 userInfo:0 repeats:a3];
    unint64_t v9 = self->_storageTimer;
    self->_storageTimer = v8;
  }
}

- (void)_storageTimerFired
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(IMDMessageFromStorageController *)self pendingReadReceiptFromStorageCount])
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "We have pending read receipts to process after storage timer fired", (uint8_t *)&v15, 2u);
      }
    }
    [(IMDMessageFromStorageController *)self setPendingReadReceiptFromStorageCount:0];
    [(IMDMessageFromStorageController *)self _updateStorageTimerWithInterval:15.0];
    id v4 = [(IMDMessageFromStorageController *)self messageStore];
    [v4 setSuppressDatabaseUpdates:1];
  }
  else
  {
    [(NSTimer *)self->_storageTimer invalidate];
    storageTimer = self->_storageTimer;
    self->_storageTimer = 0;

    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
        int v15 = 138412290;
        int v16 = messagesReceivedDuringStorage;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Storage timer fired, guids we need to process: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    if ([(NSMutableSet *)self->_messagesReceivedDuringStorage count]) {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_messagesReceivedDuringStorage];
    }
    else {
      id v4 = 0;
    }
    if (self->_timingComingBackFromStorage)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Chat: Missed lastItemProcessed.  This time is likely off by the last storage timer", (uint8_t *)&v15, 2u);
        }
      }
      [(IMDMessageFromStorageController *)self noteLastItemProcessedWithError:1];
    }
    unint64_t v9 = self->_messagesReceivedDuringStorage;
    self->_messagesReceivedDuringStorage = 0;

    int v10 = [(IMDMessageFromStorageController *)self messageStore];
    [v10 setSuppressDatabaseUpdates:0];

    double v11 = [(IMDMessageFromStorageController *)self messageStore];
    uint64_t v12 = [v4 allObjects];
    v13 = [v11 messagesWithGUIDs:v12];

    [(IMDMessageFromStorageController *)self _postMessagesFromStorage:v13];
    int v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:*MEMORY[0x1E4F6D568] object:0];
  }
}

- (void)_postMessagesFromStorage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        uint64_t v7 = *(void *)(*((void *)&v34 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1E016A370]();
        v8 = [(IMDMessageFromStorageController *)self messageStore];
        unint64_t v9 = [v8 chatsForMessage:v7];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (([v15 isBlackholed] & 1) == 0)
              {
                int v16 = [v15 guid];
                uint64_t v17 = [v4 objectForKey:v16];
                if (!v17)
                {
                  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
                }
                [v17 addObject:v7];
                [v4 setObject:v17 forKey:v16];
                [v5 setObject:v15 forKey:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v12);
        }

        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v23);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1D96E83C0;
  v26[3] = &unk_1E6B74180;
  id v27 = v5;
  v28 = self;
  id v29 = obj;
  id v18 = obj;
  id v19 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v26];
}

- (void)incrementPendingReadReceiptFromStorageCount
{
}

- (void)decrementPendingReadReceiptFromStorageCount
{
  unint64_t pendingReadReceiptFromStorageCount = self->_pendingReadReceiptFromStorageCount;
  if (pendingReadReceiptFromStorageCount) {
    [(IMDMessageFromStorageController *)self setPendingReadReceiptFromStorageCount:pendingReadReceiptFromStorageCount - 1];
  }
}

- (unint64_t)pendingReadReceiptFromStorageCount
{
  return self->_pendingReadReceiptFromStorageCount;
}

- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3
{
  self->_unint64_t pendingReadReceiptFromStorageCount = a3;
}

- (IMDMessageStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSTimer)storageTimer
{
  return self->_storageTimer;
}

- (void)setStorageTimer:(id)a3
{
}

- (NSMutableSet)messagesReceivedDuringStorage
{
  return self->_messagesReceivedDuringStorage;
}

- (void)setMessagesReceivedDuringStorage:(id)a3
{
}

- (IMTimingCollection)timingComingBackFromStorage
{
  return self->_timingComingBackFromStorage;
}

- (void)setTimingComingBackFromStorage:(id)a3
{
}

- (unint64_t)messagesProcessedComingBackFromStorage
{
  return self->_messagesProcessedComingBackFromStorage;
}

- (void)setMessagesProcessedComingBackFromStorage:(unint64_t)a3
{
  self->_unint64_t messagesProcessedComingBackFromStorage = a3;
}

- (id)_broadcasterForTesting
{
  return self->__broadcasterForTesting;
}

- (void)set_broadcasterForTesting:(id)a3
{
}

- (double)storageTimerInterval
{
  return self->_storageTimerInterval;
}

- (void)setStorageTimerInterval:(double)a3
{
  self->_storageTimerInterval = a3;
}

- (double)lastMessageStorageTimerInterval
{
  return self->_lastMessageStorageTimerInterval;
}

- (void)setLastMessageStorageTimerInterval:(double)a3
{
  self->_lastMessageStorageTimerInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__broadcasterForTesting, 0);
  objc_storeStrong((id *)&self->_timingComingBackFromStorage, 0);
  objc_storeStrong((id *)&self->_messagesReceivedDuringStorage, 0);
  objc_storeStrong((id *)&self->_storageTimer, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end
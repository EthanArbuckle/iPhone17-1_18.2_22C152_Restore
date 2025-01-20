@interface IMDCKMockRecordKeyZone
- (BOOL)_operationIsCloudKitMetricsOperation:(id)a3;
- (void)_handleFetchingExitRecordOperation:(id)a3;
- (void)_handleWritingCloudKitMetrics:(id)a3;
- (void)handleOperation:(id)a3;
@end

@implementation IMDCKMockRecordKeyZone

- (BOOL)_operationIsCloudKitMetricsOperation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "recordsToSave", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "recordID"), "recordName"), "isEqualToString:", @"SyncCompleteRecord"))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (void)handleOperation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Dispatching operation %@", buf, 0xCu);
    }
  }
  uint64_t v6 = [(IMDCKMockRecordZone *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D9700FCC;
  v7[3] = &unk_1E6B746B8;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async((dispatch_queue_t)v6, v7);
}

- (void)_handleWritingCloudKitMetrics:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Mocking writing up Cloudkit metrics", v6, 2u);
    }
  }
  uint64_t v5 = [a3 modifyRecordsCompletionBlock];
  (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, 0, 0, 0);
}

- (void)_handleFetchingExitRecordOperation:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Mock fetching exit record", buf, 2u);
    }
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "recordIDs"), "firstObject");
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Exit" recordID:v5];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
  uint64_t v8 = [a3 fetchRecordsCompletionBlock];
  (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, v7, 0);
}

@end
@interface IMAutomationBatchMessageOperations
- (id)beginRecordingMessagesToReplayDatabase:(id)a3 error:(id *)a4;
- (id)sendMessagesfromReplayDatabase:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (id)stopRecordingDatabaseError:(id *)a3;
@end

@implementation IMAutomationBatchMessageOperations

- (id)sendMessagesfromReplayDatabase:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v7, v8, v9);
  char v13 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v6, v12);

  if (v13)
  {
    v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    objc_msgSend_replayMessagesFromDatabasePath_(v17, v18, (uint64_t)v6, v19);
  }
  else
  {
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v14, @"Requested to replay a database that does not exist at path: %@", v16, v6);
    v22 = (void *)v20;
    if (a5)
    {
      uint64_t v27 = v20;
      v28[0] = *MEMORY[0x1E4F28568];
      v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v28, (uint64_t)&v27, 1);
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v24, v25, @"com.messages.automation", 1, v23);
    }
  }

  return 0;
}

- (id)beginRecordingMessagesToReplayDatabase:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  objc_msgSend_beginRecordingMessagesToReplayDatabase_(v8, v9, (uint64_t)v4, v10);

  return 0;
}

- (id)stopRecordingDatabaseError:(id *)a3
{
  id v4 = objc_msgSend_sharedInstance(IMDaemonController, a2, (uint64_t)a3, v3);
  objc_msgSend_stopRecordingMessagesReplayDatabase(v4, v5, v6, v7);

  return 0;
}

@end
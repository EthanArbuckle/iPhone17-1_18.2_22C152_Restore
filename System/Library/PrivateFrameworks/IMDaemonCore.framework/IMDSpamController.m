@interface IMDSpamController
+ (id)sharedInstance;
- (BOOL)_isDisabled;
- (BOOL)shouldCheckForSpamWithExtensionInChat:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (IMDSpamController)init;
- (NSMutableDictionary)chatGUIDToCountMap;
- (NSMutableDictionary)chatGUIDToSpamCheckTimerMap;
- (double)spamExtensionCutoffTime;
- (id)chatRegistry;
- (void)__queryServerForID:(id)a3 count:(id)a4 completion:(id)a5;
- (void)_spamCheckTimerFired:(id)a3;
- (void)_updateSpamCheckTimerWithInterval:(double)a3 forChatGUID:(id)a4;
- (void)checkForSpamWithExtensionInChat:(id)a3 forMessageBody:(id)a4 sender:(id)a5 withCompletion:(id)a6;
- (void)detectSpam:(id)a3 chatGUID:(id)a4;
- (void)setChatGUIDToCountMap:(id)a3;
- (void)setChatGUIDToSpamCheckTimerMap:(id)a3;
- (void)setSpamExtensionCutoffTime:(double)a3;
@end

@implementation IMDSpamController

+ (id)sharedInstance
{
  if (qword_1EBE2B810 != -1) {
    dispatch_once(&qword_1EBE2B810, &unk_1F33907E0);
  }
  v2 = (void *)qword_1EBE2B938;

  return v2;
}

- (IMDSpamController)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDSpamController;
  v2 = [(IMDSpamController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_chatGUIDToSpamCheckTimerMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      chatGUIDToSpamCheckTimerMap = v3->_chatGUIDToSpamCheckTimerMap;
      v3->_chatGUIDToSpamCheckTimerMap = (NSMutableDictionary *)Mutable;
    }
    if (!v3->_chatGUIDToCountMap)
    {
      CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      chatGUIDToCountMap = v3->_chatGUIDToCountMap;
      v3->_chatGUIDToCountMap = (NSMutableDictionary *)v6;
    }
  }
  [(IMDSpamController *)v3 setSpamExtensionCutoffTime:10.0];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Instantiated IMDSpamController", v10, 2u);
    }
  }
  return v3;
}

- (void)__queryServerForID:(id)a3 count:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Performing server query with alias: %@, count: %@", buf, 0x16u);
    }
  }
  if (IMStringIsEmail()) {
    uint64_t v11 = MEMORY[0x1E01687E0](v7);
  }
  else {
    uint64_t v11 = MEMORY[0x1E0168800](v7, 0, 1);
  }
  v12 = (void *)v11;
  v14 = v9;
  id v13 = v9;
  IDSCheckiMessageUnknownSender();
}

- (void)_updateSpamCheckTimerWithInterval:(double)a3 forChatGUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (a3 >= 0.0)
  {
    uint64_t v9 = [v6 length];
    int v10 = IMOSLoggingEnabled();
    if (!v9)
    {
      if (!v10) {
        goto LABEL_22;
      }
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        double v21 = *(double *)&v7;
        __int16 v22 = 2048;
        double v23 = a3;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Stopping spam check for chatGUID: %@ interval: %f", buf, 0x16u);
      }
      goto LABEL_5;
    }
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        double v21 = a3;
        __int16 v22 = 2112;
        double v23 = *(double *)&v7;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Scheduling a spam check with interval: %f for chatGUID: %@", buf, 0x16u);
      }
    }
    if (!self->_chatGUIDToSpamCheckTimerMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      chatGUIDToSpamCheckTimerMap = self->_chatGUIDToSpamCheckTimerMap;
      self->_chatGUIDToSpamCheckTimerMap = Mutable;
    }
    if (a3 <= 0.0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1D96BF878;
      v17[3] = &unk_1E6B73218;
      id v18 = v7;
      uint64_t v19 = self;
      dispatch_async(MEMORY[0x1E4F14428], v17);
    }
    else
    {
      v14 = [(NSMutableDictionary *)self->_chatGUIDToSpamCheckTimerMap objectForKey:v7];
      v15 = v14;
      if (v14)
      {
        [v14 invalidate];
        [(NSMutableDictionary *)self->_chatGUIDToSpamCheckTimerMap removeObjectForKey:v7];
      }
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:@"message-spam-check-timer" name:1 shouldWake:self target:sel__spamCheckTimerFired_ selector:v7 userInfo:a3];

      [(NSMutableDictionary *)self->_chatGUIDToSpamCheckTimerMap setObject:v16 forKey:v7];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      double v21 = *(double *)&v7;
      __int16 v22 = 2048;
      double v23 = a3;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Stopping spam check for chatGUID: %@ interval: %f", buf, 0x16u);
    }
LABEL_5:
  }
LABEL_22:
}

- (void)_spamCheckTimerFired:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  [v4 invalidate];

  [(NSMutableDictionary *)self->_chatGUIDToSpamCheckTimerMap removeObjectForKey:v5];
  IMComponentsFromChatGUID();
  id v6 = 0;
  if ([v6 length]) {
    [(IMDSpamController *)self detectSpam:v6 chatGUID:v5];
  }
}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (BOOL)_isDisabled
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  v3 = [v2 objectForKey:@"disable-auto-detect-spam"];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)detectSpam:(id)a3 chatGUID:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDSpamController *)self chatRegistry];
  uint64_t v9 = [v8 existingChatWithGUID:v7];

  int v10 = [v9 serviceName];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  if ((v11 & 1) == 0)
  {
    if ([(IMDSpamController *)self _isDisabled]
      || ([v9 properties],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 objectForKey:@"hasViewedPotentialSpamChat"],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 BOOLValue],
          v13,
          v12,
          (v14 & 1) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          BOOL v16 = [(IMDSpamController *)self _isDisabled];
          uint64_t v17 = [v9 properties];
          id v18 = (void *)v17;
          uint64_t v19 = @"NO";
          *(_DWORD *)buf = 138412802;
          id v35 = v7;
          __int16 v36 = 2112;
          if (v16) {
            uint64_t v19 = @"YES";
          }
          v37 = v19;
          __int16 v38 = 2112;
          uint64_t v39 = v17;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "don't try to detect spam for chat: %@, disabled: %@, properties: %@", buf, 0x20u);
        }
      }
      v20 = [(IMDSpamController *)self chatGUIDToCountMap];
      [v20 removeObjectForKey:v7];
    }
    else
    {
      if (!self->_chatGUIDToCountMap)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        chatGUIDToCountMap = self->_chatGUIDToCountMap;
        self->_chatGUIDToCountMap = Mutable;
      }
      double v23 = [(IMDSpamController *)self chatGUIDToCountMap];
      uint64_t v24 = [v23 objectForKey:v7];
      uint64_t v25 = [v24 unsignedIntegerValue];

      v26 = [NSNumber numberWithUnsignedInteger:v25];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1D96BFD44;
      v30[3] = &unk_1E6B73600;
      id v27 = v7;
      id v31 = v27;
      id v32 = v9;
      v33 = self;
      [(IMDSpamController *)self __queryServerForID:v6 count:v26 completion:v30];

      v28 = [(IMDSpamController *)self chatGUIDToCountMap];
      v29 = [NSNumber numberWithUnsignedInteger:v25 + 1];
      [v28 setObject:v29 forKey:v27];

      v20 = v31;
    }
  }
}

- (BOOL)shouldCheckForSpamWithExtensionInChat:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  return 0;
}

- (void)checkForSpamWithExtensionInChat:(id)a3 forMessageBody:(id)a4 sender:(id)a5 withCompletion:(id)a6
{
  if (a6) {
    (*((void (**)(id, void, void))a6 + 2))(a6, 0, 0);
  }
}

- (NSMutableDictionary)chatGUIDToSpamCheckTimerMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChatGUIDToSpamCheckTimerMap:(id)a3
{
}

- (NSMutableDictionary)chatGUIDToCountMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChatGUIDToCountMap:(id)a3
{
}

- (double)spamExtensionCutoffTime
{
  return self->_spamExtensionCutoffTime;
}

- (void)setSpamExtensionCutoffTime:(double)a3
{
  self->_spamExtensionCutoffTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGUIDToCountMap, 0);

  objc_storeStrong((id *)&self->_chatGUIDToSpamCheckTimerMap, 0);
}

@end
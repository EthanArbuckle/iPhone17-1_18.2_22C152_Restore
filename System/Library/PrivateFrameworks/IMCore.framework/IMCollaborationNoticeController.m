@interface IMCollaborationNoticeController
+ (id)sharedInstance;
- (IMCollaborationNoticeController)init;
- (id)listener;
- (id)remoteDaemon;
- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3;
- (void)dismissNotice:(id)a3;
- (void)fetchCollaborationNoticesForChatGUID:(id)a3 completionHandler:(id)a4;
- (void)markAsViewedForNotice:(id)a3;
@end

@implementation IMCollaborationNoticeController

+ (id)sharedInstance
{
  if (qword_1EB3F2508 != -1) {
    dispatch_once(&qword_1EB3F2508, &unk_1EF8E5858);
  }
  v2 = (void *)qword_1EB3F2568;

  return v2;
}

- (IMCollaborationNoticeController)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMCollaborationNoticeController;
  v2 = [(IMCollaborationNoticeController *)&v11 init];
  v6 = v2;
  if (v2)
  {
    v7 = objc_msgSend_listener(v2, v3, v4, v5);
    objc_msgSend_addHandler_(v7, v8, (uint64_t)v6, v9);
  }
  return v6;
}

- (void)dismissNotice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[IMCollaborationNoticeController dismissNotice:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "%s dismiss notice: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = objc_msgSend_remoteDaemon(self, v5, v6, v7);
  objc_msgSend_dismissNotice_(v9, v10, (uint64_t)v4, v11);
}

- (void)markAsViewedForNotice:(id)a3
{
  id v20 = a3;
  uint64_t v7 = objc_msgSend_dateViewed(v20, v4, v5, v6);

  if (!v7)
  {
    uint64_t v11 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9, v10);
    objc_msgSend_setDateViewed_(v20, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_remoteDaemon(self, v14, v15, v16);
    objc_msgSend_updateNotice_(v17, v18, (uint64_t)v20, v19);
  }
}

- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Received notification of collaboration notice changes for guids: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  objc_msgSend___mainThreadPostNotificationName_object_(v8, v9, @"__kIMCollaborationNoticesDidChangeNotification", (uint64_t)v3);
}

- (void)fetchCollaborationNoticesForChatGUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_remoteDaemon(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchCollaborationNoticesForChatGUID_reply_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (id)remoteDaemon
{
  id v4 = objc_msgSend_sharedController(IMDaemonController, a2, v2, v3);
  v8 = objc_msgSend_remoteDaemon(v4, v5, v6, v7);

  return v8;
}

- (id)listener
{
  id v4 = objc_msgSend_sharedController(IMDaemonController, a2, v2, v3);
  v8 = objc_msgSend_listener(v4, v5, v6, v7);

  return v8;
}

@end
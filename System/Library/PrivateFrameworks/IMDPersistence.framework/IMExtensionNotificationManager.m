@interface IMExtensionNotificationManager
+ (id)sharedInstance;
- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3;
- (BOOL)shouldRetractedMessageForBalloonBundleID:(id)a3;
- (IMExtensionNotificationManager)init;
- (NSMutableArray)notificationsContext;
- (id)notificationCategories;
- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8;
- (void)setNotificationsContext:(id)a3;
@end

@implementation IMExtensionNotificationManager

+ (id)sharedInstance
{
  if (qword_1EB5ABCC8 != -1) {
    dispatch_once(&qword_1EB5ABCC8, &unk_1F084CD00);
  }
  v2 = (void *)qword_1EB5ABAD8;
  return v2;
}

- (IMExtensionNotificationManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)IMExtensionNotificationManager;
  v2 = [(IMExtensionNotificationManager *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(IMExtensionNotificationManager *)v2 setNotificationsContext:v3];

    v4 = objc_alloc_init(IMDFamilyInviteNotificationContext);
    v5 = [(IMExtensionNotificationManager *)v2 notificationsContext];
    [v5 addObject:v4];

    v6 = objc_alloc_init(IMDScreenTimeAskNotificationContext);
    v7 = [(IMExtensionNotificationManager *)v2 notificationsContext];
    [v7 addObject:v6];

    v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    [v8 isCriticalAlertingEnabled];

    v9 = objc_alloc_init(IMDSafetyMonitorNotificationContext);
    v10 = [(IMExtensionNotificationManager *)v2 notificationsContext];
    [v10 addObject:v9];

    v11 = objc_alloc_init(IMDAskToBuyNotificationContext);
    v12 = [(IMExtensionNotificationManager *)v2 notificationsContext];
    [v12 addObject:v11];

    v13 = objc_alloc_init(IMDCustomPluginNotificationContext);
    v14 = [(IMExtensionNotificationManager *)v2 notificationsContext];
    [v14 addObject:v13];
  }
  return v2;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8
{
  v22 = a7;
  v23 = a8;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v16 = self->_notificationsContext;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v21, "canPopulateUserInfoForMessageBalloonBundleID:", v13, v22, v23, (void)v24))
        {
          if (objc_opt_respondsToSelector()) {
            [v21 populateUserInfoForNotificationContent:v12 messageBalloonBundleID:v13 payloadData:v14 chatIdentifier:v15 isUrgentMessageTrigger:v22 shouldSuppressNotification:v23];
          }
          else {
            [v21 populateUserInfoForNotificationContent:v12 messageBalloonBundleID:v13 payloadData:v14];
          }
        }
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
}

- (id)notificationCategories
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_notificationsContext;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "notificationCategories", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_notificationsContext;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "canPopulateUserInfoForMessageBalloonBundleID:", v4, (void)v11))
        {
          LOBYTE(v6) = [v9 canPopulateUserInfoForMessageBalloonBundleID:v4];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldRetractedMessageForBalloonBundleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_notificationsContext;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "canPopulateUserInfoForMessageBalloonBundleID:", v4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (NSMutableArray)notificationsContext
{
  return self->_notificationsContext;
}

- (void)setNotificationsContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
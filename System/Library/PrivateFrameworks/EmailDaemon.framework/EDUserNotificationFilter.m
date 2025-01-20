@interface EDUserNotificationFilter
- (BOOL)_messageNeedsNotification:(id)a3;
- (EDUserNotificationFilter)initWithBlockedSenderReader:(id)a3 vipReader:(id)a4;
- (EMBlockedSenderReader)blockedSenderReader;
- (EMVIPReader)vipReader;
- (id)messagesNeedingNotification:(id)a3;
@end

@implementation EDUserNotificationFilter

- (EDUserNotificationFilter)initWithBlockedSenderReader:(id)a3 vipReader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDUserNotificationFilter;
  v9 = [(EDUserNotificationFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_blockedSenderReader, a3);
    objc_storeStrong((id *)&v10->_vipReader, a4);
  }

  return v10;
}

- (id)messagesNeedingNotification:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__EDUserNotificationFilter_messagesNeedingNotification___block_invoke;
  v5[3] = &unk_1E6C02500;
  v5[4] = self;
  v3 = objc_msgSend(a3, "ef_filter:", v5);

  return v3;
}

uint64_t __56__EDUserNotificationFilter_messagesNeedingNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _messageNeedsNotification:a2];
}

- (BOOL)_messageNeedsNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 flags];
  uint64_t v6 = [v4 conversationFlags];
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  v9 = [v7 dateByAddingUnit:16 value:-7 toDate:v8 options:0];

  if ([v4 isServerSearchResult])
  {
    v10 = EDUserNotificationCenterLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 remoteID];
      int v28 = 138543362;
      v29 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is a server search result.", (uint8_t *)&v28, 0xCu);
    }
  }
  else if ([v5 read])
  {
    v10 = EDUserNotificationCenterLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = [v4 remoteID];
      int v28 = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is marked as read.", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    v13 = [(EDUserNotificationFilter *)self blockedSenderReader];
    v14 = [v4 senders];
    v15 = [v14 firstObject];
    int v16 = [v13 isEmailAddressBlocked:v15];

    if (!v16)
    {
      if (v6 == 4)
      {
        v18 = [(EDUserNotificationFilter *)self vipReader];
        v19 = [v4 senders];
        v20 = [v19 firstObject];
        char v21 = [v18 isVIPAddress:v20];

        if ((v21 & 1) == 0)
        {
          v10 = EDUserNotificationCenterLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [v4 remoteID];
            int v28 = 138543362;
            v29 = v22;
            _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is in a muted conversation.", (uint8_t *)&v28, 0xCu);
          }
          goto LABEL_17;
        }
      }
      else
      {
        v23 = [v4 displayDate];
        int v24 = objc_msgSend(v23, "ef_isEarlierThanDate:", v9);

        if (v24)
        {
          v10 = EDUserNotificationCenterLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v4 remoteID];
            int v28 = 138543362;
            v29 = v25;
            _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message %{public}@ because it is more than a week old", (uint8_t *)&v28, 0xCu);
          }
          goto LABEL_17;
        }
      }
      BOOL v26 = 1;
      goto LABEL_18;
    }
    v10 = EDUserNotificationCenterLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v4 remoteID];
      int v28 = 138543362;
      v29 = v17;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Not showing notification for message: %{public}@ because it is from a blocked sender.", (uint8_t *)&v28, 0xCu);
    }
  }
LABEL_17:

  BOOL v26 = 0;
LABEL_18:

  return v26;
}

- (EMBlockedSenderReader)blockedSenderReader
{
  return self->_blockedSenderReader;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipReader, 0);

  objc_storeStrong((id *)&self->_blockedSenderReader, 0);
}

@end
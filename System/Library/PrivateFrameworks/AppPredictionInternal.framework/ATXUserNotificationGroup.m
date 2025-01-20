@interface ATXUserNotificationGroup
- (ATXUserNotificationGroup)initWithNotifications:(id)a3;
- (BOOL)hasCommunicationsNotifications;
- (BOOL)hasCriticalNotifications;
- (BOOL)hasTimeSensitiveNotifications;
- (BOOL)qualifiesForHighEngagement;
- (BOOL)runCachedCheckOnNotificationsWithIvar:(int64_t *)a3 block:(id)a4;
- (NSArray)notifications;
- (double)latestNotificationTimestamp;
- (int64_t)compare:(id)a3;
@end

@implementation ATXUserNotificationGroup

- (ATXUserNotificationGroup)initWithNotifications:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserNotificationGroup;
  v5 = [(ATXUserNotificationGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_190];
    notifications = v5->_notifications;
    v5->_notifications = (NSArray *)v6;
  }
  return v5;
}

uint64_t __50__ATXUserNotificationGroup_initWithNotifications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  [a3 timestamp];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (BOOL)runCachedCheckOnNotificationsWithIvar:(int64_t *)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t (**)(id, void))a4;
  if (*a3)
  {
    LOBYTE(v7) = *a3 == 2;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v8 = self->_notifications;
    uint64_t v7 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v14;
      int64_t v10 = 2;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v8);
          }
          if (v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * i)))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int64_t v10 = 1;
LABEL_13:

    *a3 = v10;
  }

  return v7;
}

- (BOOL)hasCriticalNotifications
{
  return [(ATXUserNotificationGroup *)self runCachedCheckOnNotificationsWithIvar:&self->_hasCriticalNotifications block:&__block_literal_global_13_1];
}

BOOL __52__ATXUserNotificationGroup_hasCriticalNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 urgency] == 0;
}

- (BOOL)hasTimeSensitiveNotifications
{
  return [(ATXUserNotificationGroup *)self runCachedCheckOnNotificationsWithIvar:&self->_hasTimeSensitiveNotifications block:&__block_literal_global_15_3];
}

BOOL __57__ATXUserNotificationGroup_hasTimeSensitiveNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 urgency] == 1;
}

- (BOOL)hasCommunicationsNotifications
{
  return [(ATXUserNotificationGroup *)self runCachedCheckOnNotificationsWithIvar:&self->_hasCommunicationsNotifications block:&__block_literal_global_17_4];
}

uint64_t __58__ATXUserNotificationGroup_hasCommunicationsNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMessage];
}

- (BOOL)qualifiesForHighEngagement
{
  return 0;
}

- (double)latestNotificationTimestamp
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_notifications;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "timestamp", (void)v10);
        if (v8 >= v6) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(ATXUserNotificationGroup *)self hasCriticalNotifications];
  if (v5 != [v4 hasCriticalNotifications])
  {
    BOOL v6 = [(ATXUserNotificationGroup *)self hasCriticalNotifications];
    goto LABEL_9;
  }
  int v7 = [(ATXUserNotificationGroup *)self hasTimeSensitiveNotifications];
  if (v7 != [v4 hasTimeSensitiveNotifications])
  {
    BOOL v6 = [(ATXUserNotificationGroup *)self hasTimeSensitiveNotifications];
    goto LABEL_9;
  }
  int v8 = [(ATXUserNotificationGroup *)self hasCommunicationsNotifications];
  if (v8 != [v4 hasCommunicationsNotifications])
  {
    BOOL v6 = [(ATXUserNotificationGroup *)self hasCommunicationsNotifications];
    goto LABEL_9;
  }
  int v9 = [(ATXUserNotificationGroup *)self qualifiesForHighEngagement];
  if (v9 != [v4 qualifiesForHighEngagement])
  {
    BOOL v6 = [(ATXUserNotificationGroup *)self qualifiesForHighEngagement];
LABEL_9:
    if (v6) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = -1;
    }
    goto LABEL_12;
  }
  [(ATXUserNotificationGroup *)self latestNotificationTimestamp];
  double v13 = v12;
  [v4 latestNotificationTimestamp];
  if (v13 == v14)
  {
    int64_t v10 = 0;
  }
  else
  {
    [(ATXUserNotificationGroup *)self latestNotificationTimestamp];
    double v16 = v15;
    [v4 latestNotificationTimestamp];
    if (v16 > v17) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = -1;
    }
  }
LABEL_12:

  return v10;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
}

@end
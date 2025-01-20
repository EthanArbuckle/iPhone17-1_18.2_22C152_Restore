@interface ATXUserNotificationResolution
- (ATXUserNotificationResolution)initWithNotificationUUID:(id)a3 numExpansions:(unint64_t)a4 resolutionType:(int64_t)a5 resolutionTimestamp:(id)a6;
- (NSDate)resolutionTimestamp;
- (NSUUID)notificationUUID;
- (int64_t)resolutionType;
- (unint64_t)numExpansions;
@end

@implementation ATXUserNotificationResolution

- (ATXUserNotificationResolution)initWithNotificationUUID:(id)a3 numExpansions:(unint64_t)a4 resolutionType:(int64_t)a5 resolutionTimestamp:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXUserNotificationResolution;
  v13 = [(ATXUserNotificationResolution *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_notificationUUID, a3);
    v14->_numExpansions = a4;
    v14->_resolutionType = a5;
    if (a5 == 3)
    {
      v15 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      v15 = (NSDate *)v12;
    }
    resolutionTimestamp = v14->_resolutionTimestamp;
    v14->_resolutionTimestamp = v15;
  }
  return v14;
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (int64_t)resolutionType
{
  return self->_resolutionType;
}

- (NSDate)resolutionTimestamp
{
  return self->_resolutionTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTimestamp, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

@end
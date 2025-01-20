@interface ASNotificationEvent
+ (id)achievementCompletionEventWithAchievement:(id)a3;
+ (id)deletedWorkoutEventWithUUID:(id)a3;
+ (id)goalCompletionEventWithActivitySummary:(id)a3;
+ (id)notificationEventWithRecord:(id)a3 friendUUID:(id)a4;
+ (id)workoutCompletionEventWithWorkout:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSUUID)friendUUID;
- (NSUUID)triggerUUID;
- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4;
- (int64_t)triggerSnapshotIndex;
- (int64_t)type;
- (void)setDate:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setTriggerSnapshotIndex:(int64_t)a3;
- (void)setTriggerUUID:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ASNotificationEvent

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ASNotificationEvent *)self type];
  v8 = [(ASNotificationEvent *)self triggerUUID];
  v9 = ASWorkoutNotificationRecordIDForType(v7, (uint64_t)v8, v6);

  v10 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingEvent" recordID:v9];
  _ASUpdateSchemaVersionOnRecord(2, v10, a4);
  v11 = objc_alloc_init(ASCodableCloudKitNotificationEvent);
  v12 = [(ASNotificationEvent *)self date];
  [v12 timeIntervalSinceReferenceDate];
  -[ASCodableCloudKitNotificationEvent setDate:](v11, "setDate:");

  [(ASCodableCloudKitNotificationEvent *)v11 setType:[(ASNotificationEvent *)self type]];
  v13 = [(ASNotificationEvent *)self triggerUUID];
  v14 = objc_msgSend(v13, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitNotificationEvent *)v11 setTriggerUUID:v14];

  [(ASCodableCloudKitNotificationEvent *)v11 setTriggerSnapshotIndex:[(ASNotificationEvent *)self triggerSnapshotIndex]];
  v15 = [(ASCodableCloudKitNotificationEvent *)v11 data];
  v16 = [v10 encryptedValues];
  [v16 setObject:v15 forKeyedSubscript:@"EncryptedData"];

  return v10;
}

+ (id)notificationEventWithRecord:(id)a3 friendUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_ASCloudKitSchemaVersionForRecord(v5) == 2)
  {
    uint64_t v7 = [v5 encryptedValues];
    id v8 = [v7 objectForKeyedSubscript:@"EncryptedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      v11 = [[ASCodableCloudKitNotificationEvent alloc] initWithData:v9];
      v10 = objc_alloc_init(ASNotificationEvent);
      v12 = (void *)MEMORY[0x263EFF910];
      [(ASCodableCloudKitNotificationEvent *)v11 date];
      v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
      [(ASNotificationEvent *)v10 setDate:v13];

      [(ASNotificationEvent *)v10 setType:[(ASCodableCloudKitNotificationEvent *)v11 type]];
      v14 = (void *)MEMORY[0x263F08C38];
      v15 = [(ASCodableCloudKitNotificationEvent *)v11 triggerUUID];
      v16 = objc_msgSend(v14, "hk_UUIDWithData:", v15);
      [(ASNotificationEvent *)v10 setTriggerUUID:v16];

      [(ASNotificationEvent *)v10 setTriggerSnapshotIndex:[(ASCodableCloudKitNotificationEvent *)v11 triggerSnapshotIndex]];
      [(ASNotificationEvent *)v10 setFriendUUID:v6];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASNotificationEvent(CloudKitCodingSupport) notificationEventWithRecord:friendUUID:]();
      }
      v10 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[ASNotificationEvent(CloudKitCodingSupport) notificationEventWithRecord:friendUUID:]();
    }
    v10 = 0;
  }

  return v10;
}

+ (id)goalCompletionEventWithActivitySummary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  [(ASNotificationEvent *)v4 setType:0];
  id v5 = [MEMORY[0x263EFF910] date];
  [(ASNotificationEvent *)v4 setDate:v5];

  [(ASNotificationEvent *)v4 setTriggerUUID:0];
  uint64_t v6 = [v3 _activitySummaryIndex];

  [(ASNotificationEvent *)v4 setTriggerSnapshotIndex:v6];

  return v4;
}

+ (id)workoutCompletionEventWithWorkout:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  [(ASNotificationEvent *)v4 setType:2];
  id v5 = [MEMORY[0x263EFF910] date];
  [(ASNotificationEvent *)v4 setDate:v5];

  uint64_t v6 = [v3 UUID];
  [(ASNotificationEvent *)v4 setTriggerUUID:v6];

  uint64_t v7 = [v3 endDate];

  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = _HKActivityCacheDateComponentsFromDate();
  [(ASNotificationEvent *)v4 setTriggerSnapshotIndex:_HKCacheIndexFromDateComponents()];

  return v4;
}

+ (id)achievementCompletionEventWithAchievement:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  [(ASNotificationEvent *)v4 setType:1];
  id v5 = [MEMORY[0x263EFF910] date];
  [(ASNotificationEvent *)v4 setDate:v5];

  uint64_t v6 = [v3 completedDate];

  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v8 = _HKActivityCacheDateComponentsFromDate();
  [(ASNotificationEvent *)v4 setTriggerSnapshotIndex:_HKCacheIndexFromDateComponents()];

  id v9 = [MEMORY[0x263F08C38] UUID];
  [(ASNotificationEvent *)v4 setTriggerUUID:v9];

  return v4;
}

+ (id)deletedWorkoutEventWithUUID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  [(ASNotificationEvent *)v4 setType:3];
  id v5 = [MEMORY[0x263EFF910] date];
  [(ASNotificationEvent *)v4 setDate:v5];

  [(ASNotificationEvent *)v4 setTriggerUUID:v3];

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(ASNotificationEvent *)self type];
  uint64_t v7 = [(ASNotificationEvent *)self date];
  id v8 = [(ASNotificationEvent *)self triggerUUID];
  int64_t v9 = [(ASNotificationEvent *)self triggerSnapshotIndex];
  v10 = [(ASNotificationEvent *)self friendUUID];
  v11 = [v3 stringWithFormat:@"%@:%p type:%ld date:%@ triggerUUID:%@ triggerSnapshotIndex:%lld friendUUID:%@", v5, self, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSUUID)triggerUUID
{
  return self->_triggerUUID;
}

- (void)setTriggerUUID:(id)a3
{
}

- (int64_t)triggerSnapshotIndex
{
  return self->_triggerSnapshotIndex;
}

- (void)setTriggerSnapshotIndex:(int64_t)a3
{
  self->_triggerSnapshotIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

@end
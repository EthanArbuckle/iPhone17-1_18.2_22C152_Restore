@interface HDNotificationManager(Medications)
- (void)removeDeliveredNotificationsForScheduleItemIdentifiers:()Medications;
@end

@implementation HDNotificationManager(Medications)

- (void)removeDeliveredNotificationsForScheduleItemIdentifiers:()Medications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v10 = a1;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%public@] Removing delivered notifications for scheduleItems: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__HDNotificationManager_Medications__removeDeliveredNotificationsForScheduleItemIdentifiers___block_invoke;
  v7[3] = &unk_1E6338308;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [a1 getDeliveredNotificationsWithCompletionHandler:v7];
}

@end
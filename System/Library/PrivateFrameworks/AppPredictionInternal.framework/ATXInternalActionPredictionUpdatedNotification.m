@interface ATXInternalActionPredictionUpdatedNotification
+ (void)postNotification;
- (ATXInternalActionPredictionUpdatedNotification)init;
- (void)registerForNotificationsWithUpdateBlock:(id)a3;
@end

@implementation ATXInternalActionPredictionUpdatedNotification

- (ATXInternalActionPredictionUpdatedNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalActionPredictionUpdatedNotification;
  v2 = [(ATXInternalActionPredictionUpdatedNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionCacheUpdated"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithUpdateBlock:(id)a3
{
  id v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__ATXInternalActionPredictionUpdatedNotification_registerForNotificationsWithUpdateBlock___block_invoke;
  v7[3] = &unk_1E68AF638;
  id v8 = v4;
  id v6 = v4;
  [(_ATXInternalNotification *)note registerForNotifications:v7];
}

uint64_t __90__ATXInternalActionPredictionUpdatedNotification_registerForNotificationsWithUpdateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)postNotification
{
}

- (void).cxx_destruct
{
}

@end
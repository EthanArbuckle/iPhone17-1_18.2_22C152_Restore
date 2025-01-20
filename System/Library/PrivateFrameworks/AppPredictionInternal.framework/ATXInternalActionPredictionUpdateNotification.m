@interface ATXInternalActionPredictionUpdateNotification
+ (void)postNotificationWithCacheRefreshTTL:(double)a3 reason:(unint64_t)a4;
- (ATXInternalActionPredictionUpdateNotification)init;
- (void)registerForNotificationsWithUpdateBlock:(id)a3;
@end

@implementation ATXInternalActionPredictionUpdateNotification

- (ATXInternalActionPredictionUpdateNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalActionPredictionUpdateNotification;
  v2 = [(ATXInternalActionPredictionUpdateNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionUpdateCache"];
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
  v7[2] = __89__ATXInternalActionPredictionUpdateNotification_registerForNotificationsWithUpdateBlock___block_invoke;
  v7[3] = &unk_1E68AF800;
  id v8 = v4;
  id v6 = v4;
  [(_ATXInternalNotification *)note registerForNotifications:v7];
}

void __89__ATXInternalActionPredictionUpdateNotification_registerForNotificationsWithUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"ttl"];
  id v4 = [v3 objectForKeyedSubscript:@"reason"];

  uint64_t v5 = *(void *)(a1 + 32);
  [v7 doubleValue];
  (*(void (**)(uint64_t, uint64_t, double))(v5 + 16))(v5, [v4 unsignedIntegerValue], v6);
}

+ (void)postNotificationWithCacheRefreshTTL:(double)a3 reason:(unint64_t)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ttl";
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  v8[1] = @"reason";
  v9[0] = v5;
  double v6 = [NSNumber numberWithUnsignedInteger:a4];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  +[_ATXInternalNotification postData:v7 forNotificationNamed:@"com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionUpdateCache"];
}

- (void).cxx_destruct
{
}

@end
@interface HDNanoHealthNotification
+ (id)category;
- (HDNanoHealthNotification)initWithNotificationManager:(id)a3;
- (id)body;
- (id)title;
- (unint64_t)destinations;
- (void)triggerNotification;
@end

@implementation HDNanoHealthNotification

- (HDNanoHealthNotification)initWithNotificationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNanoHealthNotification;
  v6 = [(HDNanoHealthNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationManager, a3);
  }

  return v7;
}

+ (id)category
{
  return @"<INVALID>";
}

- (unint64_t)destinations
{
  return 15;
}

- (id)title
{
  return &stru_1F1728D60;
}

- (id)body
{
  return &stru_1F1728D60;
}

- (void)triggerNotification
{
  v3 = [(HDNanoHealthNotification *)self title];
  v4 = [(HDNanoHealthNotification *)self body];
  id v5 = v4;
  if (self)
  {
    v6 = (objc_class *)MEMORY[0x1E4F445B0];
    id v7 = v4;
    id v8 = v3;
    id v9 = objc_alloc_init(v6);
    [v9 setTitle:v8];

    [v9 setBody:v7];
    v10 = [(id)objc_opt_class() category];
    [v9 setCategoryIdentifier:v10];

    v11 = [MEMORY[0x1E4F44640] soundWithAlertType:25];
    [v9 setSound:v11];

    [v9 setShouldIgnoreDoNotDisturb:1];
  }
  else
  {
    id v9 = 0;
  }

  v12 = [(id)objc_opt_class() category];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  v15 = [v12 stringByAppendingString:v14];

  v16 = [MEMORY[0x1E4F44628] requestWithIdentifier:v15 content:v9 trigger:0];
  objc_msgSend(v16, "setDestinations:", -[HDNanoHealthNotification destinations](self, "destinations"));
  notificationManager = self->_notificationManager;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__HDNanoHealthNotification_triggerNotification__block_invoke;
  v18[3] = &unk_1E62F2978;
  v18[4] = self;
  [(HDNotificationManager *)notificationManager postNotificationWithRequest:v16 completion:v18];
}

void __47__HDNanoHealthNotification_triggerNotification__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = @"NO";
    int v10 = 138412802;
    v11 = v8;
    __int16 v12 = 2112;
    if (a2) {
      id v9 = @"YES";
    }
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Posted %@ with success %@, error: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void).cxx_destruct
{
}

@end
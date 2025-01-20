@interface CALNDefaultEKCalendarNotificationReferenceProvider
+ (CALNDefaultEKCalendarNotificationReferenceProvider)sharedInstance;
- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 date:(id)a5 inEventStore:(id)a6;
- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 inEventStore:(id)a5;
@end

@implementation CALNDefaultEKCalendarNotificationReferenceProvider

+ (CALNDefaultEKCalendarNotificationReferenceProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CALNDefaultEKCalendarNotificationReferenceProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1) {
    dispatch_once(&sharedInstance_onceToken_20, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_17;
  return (CALNDefaultEKCalendarNotificationReferenceProvider *)v2;
}

uint64_t __68__CALNDefaultEKCalendarNotificationReferenceProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_17 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 inEventStore:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v7 = (objc_class *)MEMORY[0x263F04B48];
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithType:v5 objectID:v9 eventStore:v8];

  return v10;
}

- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 date:(id)a5 inEventStore:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = (objc_class *)MEMORY[0x263F04B48];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[[v9 alloc] initWithType:v7 objectID:v12 date:v11 eventStore:v10];

  return v13;
}

@end
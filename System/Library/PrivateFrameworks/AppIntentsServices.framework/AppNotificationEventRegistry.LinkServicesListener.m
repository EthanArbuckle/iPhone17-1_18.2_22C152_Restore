@interface AppNotificationEventRegistry.LinkServicesListener
- (void)sendAppNotificationEvents:(NSArray *)a3 reply:(id)a4;
@end

@implementation AppNotificationEventRegistry.LinkServicesListener

- (void)sendAppNotificationEvents:(NSArray *)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();
  sub_247C6DA74((uint64_t)&unk_2692AB998, (uint64_t)v7);
}

@end
@interface DOCFileProviderSyncStateProvider
- (void)didUpdateSyncInAppMessage;
- (void)didUpdateSyncProgress;
@end

@implementation DOCFileProviderSyncStateProvider

- (void)didUpdateSyncProgress
{
  swift_beginAccess();
  v3 = *(void (**)(uint64_t))&self->didUpdateInProgressFileOperationsHandler[7];
  if (v3)
  {
    swift_retain();
    uint64_t v4 = sub_100036330((uint64_t)v3);
    v3(v4);
    sub_10003B980((uint64_t)v3);
    swift_release();
  }
}

- (void)didUpdateSyncInAppMessage
{
  swift_beginAccess();
  v3 = *(void (**)(uint64_t))&self->didUpdateSyncStateInAppMessageHandler[7];
  if (v3)
  {
    swift_retain();
    uint64_t v4 = sub_100036330((uint64_t)v3);
    v3(v4);
    sub_10003B980((uint64_t)v3);
    swift_release();
  }
}

@end
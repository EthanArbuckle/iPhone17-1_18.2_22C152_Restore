@interface APUIRemoteAlertPresentationManager
- (_TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation APUIRemoteAlertPresentationManager

- (_TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager)init
{
  uint64_t v3 = OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100004384((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return [(APUIRemoteAlertPresentationManager *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  APUIRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(v4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  APUIRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  APUIRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(v6, (uint64_t)a4);
}

@end
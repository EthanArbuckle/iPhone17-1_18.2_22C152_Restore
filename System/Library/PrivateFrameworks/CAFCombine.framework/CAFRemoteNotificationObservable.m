@interface CAFRemoteNotificationObservable
- (NSString)description;
- (_TtC10CAFCombine31CAFRemoteNotificationObservable)init;
- (void)dealloc;
- (void)remoteNotificationService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateIdentifier:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateName:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateNotificationUserActions:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateSymbolNameAndColor:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4;
- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4;
- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFRemoteNotificationObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFRemoteNotificationObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFRemoteNotificationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine31CAFRemoteNotificationObservable)init
{
}

- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
}

- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
}

- (void)remoteNotificationService:(id)a3 didUpdateIdentifier:(id)a4
{
}

- (void)remoteNotificationService:(id)a3 didUpdateNotificationUserActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateNotificationUserActions:)((uint64_t)v8, v7);
}

- (void)remoteNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateUserAction:)();
}

- (void)remoteNotificationService:(id)a3 didUpdateSymbolNameAndColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateSymbolNameAndColor:)((uint64_t)v8, a4);
}

- (void)remoteNotificationService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4
{
}

- (void)remoteNotificationService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4
{
}

- (void)remoteNotificationService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFRemoteNotificationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFRemoteNotificationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFRemoteNotificationObservable.serviceDidFinishGroupUpdate(_:)();
}

@end
@interface CAFLocalNotificationObservable
- (NSString)description;
- (_TtC10CAFCombine30CAFLocalNotificationObservable)init;
- (void)dealloc;
- (void)localNotificationService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4;
- (void)localNotificationService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4;
- (void)localNotificationService:(id)a3 didUpdateIdentifier:(id)a4;
- (void)localNotificationService:(id)a3 didUpdateName:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFLocalNotificationObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFLocalNotificationObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFLocalNotificationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine30CAFLocalNotificationObservable)init
{
}

- (void)localNotificationService:(id)a3 didUpdateIdentifier:(id)a4
{
}

- (void)localNotificationService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4
{
}

- (void)localNotificationService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4
{
}

- (void)localNotificationService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFLocalNotificationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFLocalNotificationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFLocalNotificationObservable.serviceDidFinishGroupUpdate(_:)();
}

@end
@interface CAFRequestContentObservable
- (NSString)description;
- (_TtC10CAFCombine27CAFRequestContentObservable)init;
- (void)dealloc;
- (void)requestContentService:(id)a3 didUpdateContentURL:(id)a4;
- (void)requestContentService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4;
- (void)requestContentService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4;
- (void)requestContentService:(id)a3 didUpdateName:(id)a4;
- (void)requestContentService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)requestContentService:(id)a3 didUpdateUserDismissible:(BOOL)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFRequestContentObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFRequestContentObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFRequestContentObservable.__deallocating_deinit();
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
}

- (_TtC10CAFCombine27CAFRequestContentObservable)init
{
}

- (void)requestContentService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFRequestContentObservable.requestContentService(_:didUpdateOn:)();
}

- (void)requestContentService:(id)a3 didUpdateContentURL:(id)a4
{
}

- (void)requestContentService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFRequestContentObservable.requestContentService(_:didUpdateUserDismissible:)();
}

- (void)requestContentService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4
{
}

- (void)requestContentService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4
{
}

- (void)requestContentService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFRequestContentObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFRequestContentObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFRequestContentObservable.serviceDidFinishGroupUpdate(_:)();
}

@end
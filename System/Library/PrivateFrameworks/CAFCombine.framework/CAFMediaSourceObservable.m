@interface CAFMediaSourceObservable
- (NSString)description;
- (_TtC10CAFCombine24CAFMediaSourceObservable)init;
- (void)dealloc;
- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4;
- (void)mediaSourceService:(id)a3 didUpdateCurrentMediaItemIdentifier:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateDisabled:(BOOL)a4;
- (void)mediaSourceService:(id)a3 didUpdateIdentifier:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateMediaItemImages:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateMediaItems:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateMediaSourceSemanticType:(unsigned __int8)a4;
- (void)mediaSourceService:(id)a3 didUpdateName:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFMediaSourceObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFMediaSourceObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFMediaSourceObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine24CAFMediaSourceObservable)init
{
}

- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4
{
  id v5 = a3;
  v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateCurrentFrequency:)();
}

- (void)mediaSourceService:(id)a3 didUpdateCurrentMediaItemIdentifier:(id)a4
{
}

- (void)mediaSourceService:(id)a3 didUpdateMediaItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaItems:)((uint64_t)v8, a4);
}

- (void)mediaSourceService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
}

- (void)mediaSourceService:(id)a3 didUpdateIdentifier:(id)a4
{
}

- (void)mediaSourceService:(id)a3 didUpdateMediaSourceSemanticType:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaSourceSemanticType:)();
}

- (void)mediaSourceService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateDisabled:)();
}

- (void)mediaSourceService:(id)a3 didUpdateMediaItemImages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaItemImages:)((uint64_t)v8, a4);
}

- (void)mediaSourceService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFMediaSourceObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFMediaSourceObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFMediaSourceObservable.serviceDidFinishGroupUpdate(_:)();
}

@end
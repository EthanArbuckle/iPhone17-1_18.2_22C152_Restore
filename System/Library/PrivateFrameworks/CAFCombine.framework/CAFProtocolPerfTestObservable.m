@interface CAFProtocolPerfTestObservable
- (NSString)description;
- (_TtC10CAFCombine29CAFProtocolPerfTestObservable)init;
- (void)dealloc;
- (void)protocolPerfTestService:(id)a3 didUpdateName:(id)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestInt16:(signed __int16)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestInt32:(int)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestString2:(id)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestString:(id)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4;
- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt32:(unsigned int)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFProtocolPerfTestObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFProtocolPerfTestObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFProtocolPerfTestObservable.__deallocating_deinit();
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
}

- (_TtC10CAFCombine29CAFProtocolPerfTestObservable)init
{
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestInt32:(int)a4
{
  id v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestInt32:)((uint64_t)v7, a4);
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestInt16:(signed __int16)a4
{
  id v5 = a3;
  id v6 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestInt16:)();
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt32:(unsigned int)a4
{
  id v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestUInt32:)((uint64_t)v7, a4);
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4
{
  id v5 = a3;
  id v6 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestUInt16:)();
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestString:(id)a4
{
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestString2:(id)a4
{
}

- (void)protocolPerfTestService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFProtocolPerfTestObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFProtocolPerfTestObservable.serviceDidFinishGroupUpdate(_:)();
}

@end
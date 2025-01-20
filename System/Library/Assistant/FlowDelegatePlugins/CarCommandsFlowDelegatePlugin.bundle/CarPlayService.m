@interface CarPlayService
- (_TtC29CarCommandsFlowDelegatePlugin14CarPlayService)init;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdate:(id)a3 state:(unint64_t)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didAdd:(id)a4;
- (void)carManager:(id)a3 didRemove:(id)a4;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4;
@end

@implementation CarPlayService

- (_TtC29CarCommandsFlowDelegatePlugin14CarPlayService)init
{
  return (_TtC29CarCommandsFlowDelegatePlugin14CarPlayService *)sub_11DFBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin14CarPlayService_carManager));
  v3 = (char *)self + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin14CarPlayService_continuation;

  sub_11FEC4((uint64_t)v3);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_11F814(v4);
}

- (void)carDidUpdate:(id)a3 state:(unint64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_11F814(v5);
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_11F8EC((uint64_t)v8, a4);
}

- (void)carManager:(id)a3 didAdd:(id)a4
{
  sub_16160(0, &qword_1C2EA8);
  sub_14E9E0();

  swift_bridgeObjectRelease();
}

- (void)carManager:(id)a3 didRemove:(id)a4
{
  sub_16160(0, &qword_1C2EA8);
  unint64_t v6 = sub_14E9E0();
  id v7 = a3;
  v8 = self;
  sub_11FA00((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_11FB5C(v5);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_11FBC8(v6, a4);
}

@end
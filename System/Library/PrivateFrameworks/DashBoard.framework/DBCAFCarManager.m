@interface DBCAFCarManager
- (CAFCar)car;
- (_TtC9DashBoard15DBCAFCarManager)init;
- (_TtP9DashBoard23DBCAFCarManagerDelegate_)delegate;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4;
- (void)setCar:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DBCAFCarManager

- (_TtC9DashBoard15DBCAFCarManager)init
{
  return (_TtC9DashBoard15DBCAFCarManager *)DBCAFCarManager.init()();
}

- (_TtP9DashBoard23DBCAFCarManagerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC9DashBoard15DBCAFCarManager_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F8D710](v2);
  return (_TtP9DashBoard23DBCAFCarManagerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  v4 = self;
  sub_22D7F9CF8();

  swift_unknownObjectRelease();
}

- (CAFCar)car
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard15DBCAFCarManager_car);
  swift_beginAccess();
  return (CAFCar *)*v2;
}

- (void)setCar:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard15DBCAFCarManager_car);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_22D7FA224();
}

- (void).cxx_destruct
{
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard15DBCAFCarManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard15DBCAFCarManager_car);
}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  v4 = (void *)MEMORY[0x263F8EED0];
  if (a4 != 3) {
    return;
  }
  v6 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x78);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = v6();
  if (v8)
  {
    v11 = (_TtC9DashBoard15DBCAFCarManager *)v8;
    v9 = (void *)(*(uint64_t (**)(void))((*v4 & (uint64_t)v12->super.isa) + 0x60))();
    if (v9)
    {
      objc_msgSend(v9, sel_carManager_didUpdateCar_, v12, v11);

      swift_unknownObjectRelease();
      return;
    }

    v10 = v11;
  }
  else
  {

    v10 = v12;
  }
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_22D7FA9A8(a4);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  DBCAFCarManager.carDidUpdateAccessories(_:)(v4);
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  _s9DashBoard15DBCAFCarManagerC12carDidUpdate_17receivedAllValuesySo6CAFCarC_SbtF_0(v5);
}

@end
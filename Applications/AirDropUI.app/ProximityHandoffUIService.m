@interface ProximityHandoffUIService
- (_TtC9AirDropUI25ProximityHandoffUIService)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)registerForProximityHandoffInteractionUpdatesWithCompletion:(id)a3;
@end

@implementation ProximityHandoffUIService

- (_TtC9AirDropUI25ProximityHandoffUIService)init
{
  sub_100063C30();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI25ProximityHandoffUIService____lazy_storage___interface));

  swift_unknownObjectRelease();
}

- (void)registerForProximityHandoffInteractionUpdatesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000648C0((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_100064A28(v8);

  swift_unknownObjectRelease();
}

@end
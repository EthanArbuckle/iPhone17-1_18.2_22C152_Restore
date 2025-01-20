@interface JSStoreMetricsObject
- (_TtC19AppStoreKitInternal20JSStoreMetricsObject)init;
- (id)flushUnrecordedEvents;
- (id)recordEvent:(id)a3 :(id)a4;
@end

@implementation JSStoreMetricsObject

- (id)recordEvent:(id)a3 :(id)a4
{
  sub_1E1A3D718();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1E1D5CC88();
  v11 = (void *)sub_1E1D5CC98();

  return v11;
}

- (id)flushUnrecordedEvents
{
  sub_1E1A3D718();
  v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  v5 = (void *)sub_1E1D5CC98();

  return v5;
}

- (_TtC19AppStoreKitInternal20JSStoreMetricsObject)init
{
  result = (_TtC19AppStoreKitInternal20JSStoreMetricsObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
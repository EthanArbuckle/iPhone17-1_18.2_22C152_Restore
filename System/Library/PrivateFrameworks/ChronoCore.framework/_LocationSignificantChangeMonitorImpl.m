@interface _LocationSignificantChangeMonitorImpl
- (_TtC10ChronoCore37_LocationSignificantChangeMonitorImpl)init;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation _LocationSignificantChangeMonitorImpl

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore37_LocationSignificantChangeMonitorImpl_manager))
  {
    __break(1u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)swift_getObjectType();
    id v2 = v3.receiver;
    [(_LocationSignificantChangeMonitorImpl *)&v3 dealloc];
  }
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ChronoCore37_LocationSignificantChangeMonitorImpl__didChangeHandler));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DAB04E00();
}

- (_TtC10ChronoCore37_LocationSignificantChangeMonitorImpl)init
{
  result = (_TtC10ChronoCore37_LocationSignificantChangeMonitorImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
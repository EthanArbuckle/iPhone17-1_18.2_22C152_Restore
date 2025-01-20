@interface BackgroundSimulationView
+ (Class)layerClass;
- (_TtC23MonogramPosterExtension24BackgroundSimulationView)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension24BackgroundSimulationView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation BackgroundSimulationView

- (void)dealloc
{
  v2 = self;
  v3 = sub_100016270();
  os_log_type_t v4 = sub_1000164C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Deinit", v5, 2u);
    swift_slowDealloc();
  }

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for BackgroundSimulationView(0);
  [(BackgroundSimulationView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_logger;
  uint64_t v3 = sub_100016290();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

+ (Class)layerClass
{
  type metadata accessor for BackgroundSimulationLayer(0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC23MonogramPosterExtension24BackgroundSimulationView)initWithFrame:(CGRect)a3
{
  return (_TtC23MonogramPosterExtension24BackgroundSimulationView *)sub_100005B3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23MonogramPosterExtension24BackgroundSimulationView)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_100016280();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_motion) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23MonogramPosterExtension24BackgroundSimulationView_isSnapshot) = 0;

  result = (_TtC23MonogramPosterExtension24BackgroundSimulationView *)sub_100016610();
  __break(1u);
  return result;
}

@end
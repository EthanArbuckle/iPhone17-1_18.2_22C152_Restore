@interface HGBuiltinMotionDataProvider
- (NSString)description;
- (_TtC12HeadGestures27HGBuiltinMotionDataProvider)init;
@end

@implementation HGBuiltinMotionDataProvider

- (NSString)description
{
  v2 = self;
  sub_250C1C1B8();

  v3 = (void *)sub_250C1D6A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC12HeadGestures27HGBuiltinMotionDataProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager;
  id v4 = objc_allocWithZone(MEMORY[0x263F01788]);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_samplingRate) = (Class)0x4039000000000000;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HGBuiltinMotionDataProvider();
  return [(HGMotionDataProvider *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager));
}

@end
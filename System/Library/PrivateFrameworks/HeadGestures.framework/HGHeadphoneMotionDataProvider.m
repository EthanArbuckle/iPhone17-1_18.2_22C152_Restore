@interface HGHeadphoneMotionDataProvider
- (NSString)description;
- (_TtC12HeadGestures29HGHeadphoneMotionDataProvider)init;
- (void)headphoneMotionManagerDidConnect:(id)a3;
- (void)headphoneMotionManagerDidDisconnect:(id)a3;
@end

@implementation HGHeadphoneMotionDataProvider

- (NSString)description
{
  v2 = self;
  sub_250BEE790();

  v3 = (void *)sub_250C1D6A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)headphoneMotionManagerDidConnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250BEF41C();
}

- (void)headphoneMotionManagerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250BEF5AC();
}

- (_TtC12HeadGestures29HGHeadphoneMotionDataProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager;
  id v4 = objc_allocWithZone(MEMORY[0x263F01758]);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  *((unsigned char *)&v5->super.super.isa + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HGHeadphoneMotionDataProvider();
  return [(HGMotionDataProvider *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager));
}

@end
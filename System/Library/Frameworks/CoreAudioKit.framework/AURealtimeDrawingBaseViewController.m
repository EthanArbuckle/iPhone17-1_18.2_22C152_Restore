@interface AURealtimeDrawingBaseViewController
- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)init;
- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)initWithCoder:(id)a3;
- (void)checkLastRenderedTime;
- (void)viewDidLoad;
@end

@implementation AURealtimeDrawingBaseViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AURealtimeDrawingBaseViewController();
  v2 = (char *)v3.receiver;
  [(AUAppleViewControllerBase *)&v3 viewDidLoad];
  *(void *)&v2[OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_realtimeDrawingInterval] = 0x3FA999999999999ALL;
}

- (void)checkLastRenderedTime
{
  v2 = self;
  sub_21E5B59CC();
}

- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)init
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_renderingPollingInterval) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_numChannels) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_meterTimer) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController____lazy_storage___decimalFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AURealtimeDrawingBaseViewController();
  return [(AUAppleViewControllerBase *)&v3 init];
}

- (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit35AURealtimeDrawingBaseViewController *)sub_21E5B60C0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController_meterTimer));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit35AURealtimeDrawingBaseViewController____lazy_storage___decimalFormatter);
}

@end
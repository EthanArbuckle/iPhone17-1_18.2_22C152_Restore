@interface AUEQViewControllerBase
- (_TtC12CoreAudioKit22AUEQViewControllerBase)init;
- (_TtC12CoreAudioKit22AUEQViewControllerBase)initWithCoder:(id)a3;
- (void)auGraphBeginGestureWithNotification:(id)a3;
- (void)auGraphEndGestureWithNotification:(id)a3;
- (void)auParameterValueChangedWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AUEQViewControllerBase

- (void)viewDidLoad
{
  v2 = self;
  sub_21E556CA0();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_21E5570FC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_21E5581F0();
}

- (void)auParameterValueChangedWithNotification:(id)a3
{
}

- (void)auGraphBeginGestureWithNotification:(id)a3
{
}

- (void)auGraphEndGestureWithNotification:(id)a3
{
}

- (_TtC12CoreAudioKit22AUEQViewControllerBase)init
{
  return (_TtC12CoreAudioKit22AUEQViewControllerBase *)sub_21E557B04();
}

- (_TtC12CoreAudioKit22AUEQViewControllerBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit22AUEQViewControllerBase *)sub_21E557BC4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___eqView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___wholeNumberFormatter));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___decimalFormatter);
}

@end
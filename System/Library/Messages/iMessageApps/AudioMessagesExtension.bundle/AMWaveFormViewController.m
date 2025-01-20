@interface AMWaveFormViewController
- (_TtC22AudioMessagesExtension24AMWaveFormViewController)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension24AMWaveFormViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation AMWaveFormViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for AMWaveFormViewController();
  [(AMVMWaveformViewController *)&v2 viewDidLoad];
}

- (_TtC22AudioMessagesExtension24AMWaveFormViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_467B0();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC22AudioMessagesExtension24AMWaveFormViewController_currentDuration) = 0;
    id v6 = a4;
    NSString v7 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC22AudioMessagesExtension24AMWaveFormViewController_currentDuration) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AMWaveFormViewController();
  v9 = [(AMWaveFormViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC22AudioMessagesExtension24AMWaveFormViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22AudioMessagesExtension24AMWaveFormViewController_currentDuration) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AMWaveFormViewController();
  return [(AMWaveFormViewController *)&v5 initWithCoder:a3];
}

@end
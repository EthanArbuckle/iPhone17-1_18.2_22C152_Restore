@interface TVSetupCaptiveNetworkWarningViewController
- (_TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSetupCaptiveNetworkWarningViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100010690();
}

- (_TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController)initWithContentView:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue] = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  return [(TVSetupCaptiveNetworkWarningViewController *)&v6 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end
@interface D2DSetupManualAuthViewController
- (_TtC18SharingViewService32D2DSetupManualAuthViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
@end

@implementation D2DSetupManualAuthViewController

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000700C4(v4);
}

- (_TtC18SharingViewService32D2DSetupManualAuthViewController)initWithContentView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupManualAuthViewController();
  return [(D2DSetupBasePasscodeViewController *)&v5 initWithContentView:a3];
}

@end
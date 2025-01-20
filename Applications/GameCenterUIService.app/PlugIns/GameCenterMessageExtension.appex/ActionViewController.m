@interface ActionViewController
- (UIButton)actionButton;
- (UILabel)descriptionLabel;
- (_TtC26GameCenterMessageExtension20ActionViewController)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension20ActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)openSettings;
- (void)setActionButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActionViewController

- (UILabel)descriptionLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)actionButton
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setActionButton:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10003F9A4();
}

- (void)openSettings
{
  id v3 = objc_allocWithZone((Class)GKReporter);
  v4 = self;
  id v5 = [v3 init];
  [v5 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestOpenSettings];

  id v6 = [self defaultWorkspace];
  if (v6)
  {
    id v7 = v6;
    [v6 openGameCenterSettings];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC26GameCenterMessageExtension20ActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100047E68();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakInit();
    id v6 = a4;
    NSString v7 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakInit();
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActionViewController();
  v9 = [(ActionViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC26GameCenterMessageExtension20ActionViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionViewController();
  return [(ActionViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end
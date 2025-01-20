@interface HiddenAppsListWrapper
- (BOOL)canBeShownFromSuspendedState;
- (_TtC17StorageSettingsUI21HiddenAppsListWrapper)initWithCoder:(id)a3;
- (_TtC17StorageSettingsUI21HiddenAppsListWrapper)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation HiddenAppsListWrapper

- (void)viewDidLoad
{
  v2 = self;
  sub_3F8CC();
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (_TtC17StorageSettingsUI21HiddenAppsListWrapper)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_76C10();
    id v6 = a4;
    NSString v7 = sub_76BE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HiddenAppsListWrapper();
  v9 = [(HiddenAppsListWrapper *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17StorageSettingsUI21HiddenAppsListWrapper)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HiddenAppsListWrapper();
  return [(HiddenAppsListWrapper *)&v5 initWithCoder:a3];
}

@end
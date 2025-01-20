@interface NavigationSplitViewProxyViewController
- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithCoder:(id)a3;
- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavigationSplitViewProxyViewController

- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.isa
    + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.isa
    + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  v9 = [(NavigationSplitViewProxyViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  id v4 = v6.receiver;
  [(NavigationSplitViewProxyViewController *)&v6 viewDidAppear:v3];
  id v5 = [v4 navigationItem];
  [v5 setHidesSearchBarWhenScrolling:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  id v4 = v8.receiver;
  [(NavigationSplitViewProxyViewController *)&v8 viewWillAppear:v3];
  id v5 = [self currentDevice];
  unsigned int v6 = [v5 sf_isiPad];

  if (v6)
  {
    sub_1000D43D4();
  }
  else
  {
    id v7 = [v4 navigationItem];
    [v7 setHidesSearchBarWhenScrolling:0];

    id v4 = v7;
  }
}

- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  return [(NavigationSplitViewProxyViewController *)&v5 initWithCoder:a3];
}

@end
@interface DriverKitSettingsViewController
- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithCoder:(id)a3;
- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DriverKitSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_849C();
}

- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_A4F0();
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0;
    id v8 = a4;
    a3 = sub_A4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(DriverKitSettingsViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(DriverKitSettingsViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
@interface DefaultAppsViewController
- (_TtC19AppSystemSettingsUI25DefaultAppsViewController)initWithCoder:(id)a3;
- (_TtC19AppSystemSettingsUI25DefaultAppsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation DefaultAppsViewController

- (void)viewDidLoad
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_247E7EC30();
  swift_release();
}

- (void)setSpecifier:(id)a3
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_247E7F2C8(v5);
  swift_release();
}

- (_TtC19AppSystemSettingsUI25DefaultAppsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_247E82390();
    id v8 = a4;
    a3 = (id)sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(DefaultAppsViewController *)&v12 initWithNibName:a3 bundle:a4];
  swift_release();

  return v10;
}

- (_TtC19AppSystemSettingsUI25DefaultAppsViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(DefaultAppsViewController *)&v8 initWithCoder:a3];
  swift_release();
  return v6;
}

@end
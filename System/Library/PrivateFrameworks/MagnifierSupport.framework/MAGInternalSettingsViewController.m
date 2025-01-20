@interface MAGInternalSettingsViewController
- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MAGInternalSettingsViewController

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_235925074();

  if (v3)
  {
    v4 = (void *)sub_235949D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_2359258AC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_235949AC8();
    id v8 = a4;
    a3 = (id)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  uint64_t v10 = [(MAGInternalSettingsViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MAGInternalSettingsViewController *)&v5 initWithCoder:a3];
}

@end
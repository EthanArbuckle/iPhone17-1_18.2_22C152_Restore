@interface B389RolePickerViewController
- (UIPickerView)rolePickerView;
- (_TtC18SharingViewService28B389RolePickerViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService28B389RolePickerViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService28B389RolePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)pickerView:rowHeightForComponent:;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)continuePressed:(id)a3;
- (void)dismissPressed:(id)a3;
- (void)setRolePickerView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389RolePickerViewController

- (UIPickerView)rolePickerView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIPickerView *)Strong;
}

- (void)setRolePickerView:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000A83B8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  [(B389RolePickerViewController *)&v4 viewDidDisappear:v3];
}

- (void)dismissPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A9AD8();
}

- (void)continuePressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A9C24();
}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithMainController:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  return [(SVSBaseViewController *)&v6 initWithMainController:a3];
}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_unknownObjectWeakInit();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  v9 = [(B389RolePickerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  return [(B389RolePickerViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = self;
  NSString v7 = sub_1000A9D7C();

  return (int64_t)v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = self;
  sub_1000A9F58(a4);
  uint64_t v10 = v9;

  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

- (double)pickerView:rowHeightForComponent:
{
  v0 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v0 pointSize];
  double v2 = v1 + 11.0;

  return v2;
}

@end
@interface AirTagRolePickerViewController
- (_TtC18SharingViewService30AirTagRolePickerViewController)initWithContentView:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation AirTagRolePickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100091518();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_100091C40();

  return v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  sub_100091E04(a4);
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

- (_TtC18SharingViewService30AirTagRolePickerViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(AirTagRolePickerViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end
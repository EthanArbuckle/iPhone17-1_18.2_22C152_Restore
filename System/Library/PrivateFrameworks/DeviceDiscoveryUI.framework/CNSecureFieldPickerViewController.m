@interface CNSecureFieldPickerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithCoder:(id)a3;
- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContact:(id)a3;
- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContacts:(id)a3;
- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNameDrop:(id)a3 fieldSelections:(id)a4;
- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation CNSecureFieldPickerViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContacts:(id)a3
{
  sub_24CB0BCB4(0, (unint64_t *)&qword_269814790);
  sub_24CBAB4E8();
  v4 = (void *)sub_24CBAB4D8();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  v5 = [(CNContactCardFieldPicker *)&v7 initWithContacts:v4];

  return v5;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContact:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return [(CNContactCardFieldPicker *)&v5 initWithContact:a3];
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNameDrop:(id)a3 fieldSelections:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return [(CNContactCardFieldPicker *)&v7 initWithNameDrop:a3 fieldSelections:a4];
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_24CBAB418();
    id v6 = a4;
    objc_super v7 = (void *)sub_24CBAB3D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    objc_super v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  v9 = [(CNSecureFieldPickerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return [(CNSecureFieldPickerViewController *)&v5 initWithCoder:a3];
}

@end
@interface MedicationsInternalSettingsViewController
- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation MedicationsInternalSettingsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  id v2 = v7.receiver;
  [(MedicationsInternalSettingsViewController *)&v7 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_tableView, v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for MedicationsSettingsTableCell();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v6 = (void *)sub_2411606F0();
    objc_msgSend(v4, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v6);
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24115CE00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v10 = a3;
  v11 = self;
  v12 = sub_241118B38(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  return [(MedicationsInternalSettingsViewController *)&v5 initWithStyle:a3];
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_241160730();
    id v6 = a4;
    uint64_t v7 = (void *)sub_2411606F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    uint64_t v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  v9 = [(MedicationsInternalSettingsViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController *)sub_241118A6C(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsInternalSettingsViewController);
}

@end
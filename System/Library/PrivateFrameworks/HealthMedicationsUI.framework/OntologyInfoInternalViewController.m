@interface OntologyInfoInternalViewController
- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithStyle:(int64_t)a3;
- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation OntologyInfoInternalViewController

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithCoder:(id)a3
{
  result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HKTableViewController *)&v3 viewDidLoad];
  sub_1C1FFF744();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = (*(void **)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC19HealthMedicationsUI34OntologyInfoInternalViewController_conceptsDataSource))[11];
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    int64_t result = v5 + 2;
    if (!__OFADD__(v5, 2)) {
      return result;
    }
LABEL_6:
    __break(1u);
    return result;
  }
  id v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1C214B930();

  swift_bridgeObjectRelease();
  int64_t result = v10 + 2;
  if (__OFADD__(v10, 2)) {
    goto LABEL_6;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C2147D90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2147D50();
  id v10 = a3;
  v11 = self;
  v12 = (void *)OntologyInfoInternalViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithUsingInsetStyling:(BOOL)a3
{
  int64_t result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithStyle:(int64_t)a3
{
  int64_t result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  int64_t result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
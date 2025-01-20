@interface SignedClinicalDataMultiRecordViewController
- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithStyle:(int64_t)a3;
- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation SignedClinicalDataMultiRecordViewController

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithCoder:(id)a3
{
  result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C220AE94();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = sub_1C2550620();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups);
  int64_t result = swift_beginAccess();
  uint64_t v9 = *v7;
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v15 = a3;
    v16 = self;
    swift_bridgeObjectRetain();
    id v13 = (id)MEMORY[0x1C87588E0](a4, v9);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v10 = *(void **)(v9 + 8 * a4 + 32);
    id v11 = a3;
    v12 = self;
    id v13 = v10;
LABEL_5:
    id v14 = objc_msgSend(v13, sel_numberOfDisplayItems);

    return (int64_t)v14;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  id v11 = self;
  sub_1C220BCB8(v10);
  id v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithUsingInsetStyling:(BOOL)a3
{
  int64_t result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithStyle:(int64_t)a3
{
  int64_t result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  int64_t result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_profile));
  swift_bridgeObjectRelease();
}

@end
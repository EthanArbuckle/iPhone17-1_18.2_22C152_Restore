@interface SignedClinicalDataPreviewViewController
- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addRecords;
- (void)dismissAnimated:(id)a3;
- (void)dismissPreview;
- (void)learnMoreButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SignedClinicalDataPreviewViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1C248C814();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1C248D0A4(a3);
}

- (void)addRecords
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_addToHealthButton);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_showsBusyIndicator);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    v5 = v3;
    sub_1C23DA89C((uint64_t)sub_1C2490BDC, v4);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)dismissPreview
{
  v2 = self;
  sub_1C248D9E8();
}

- (void)learnMoreButtonTapped:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1C248E054();

  sub_1C224E3A4((uint64_t)v6);
}

- (void)dismissAnimated:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  -[SignedClinicalDataPreviewViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1C224E3A4((uint64_t)&v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3 = (*(void **)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_handler))[3];
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  long long v7 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1C2550620();

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  v12 = sub_1C248E6AC(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v6 = qword_1EA2DD680;
    id v7 = a3;
    uint64_t v8 = self;
    if (v6 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1EA2E0B60;
    swift_bridgeObjectRetain();
    sub_1C254C730();

    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1C254CD90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  double v8 = *MEMORY[0x1E4FB2F28];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x1E4FB2F28];
  if (!a4) {
    return 10.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  double result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  double result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  double result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  double result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_addToHealthButton));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController____lazy_storage___gmtDateFormatter);
}

@end
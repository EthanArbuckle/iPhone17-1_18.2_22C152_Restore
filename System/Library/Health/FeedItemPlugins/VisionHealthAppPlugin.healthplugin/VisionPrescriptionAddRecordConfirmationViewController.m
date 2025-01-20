@interface VisionPrescriptionAddRecordConfirmationViewController
- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addRecord;
- (void)dismissAnimated:(id)a3;
- (void)dismissPreview;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VisionPrescriptionAddRecordConfirmationViewController

- (void)viewDidLoad
{
  v2 = self;
  VisionPrescriptionAddRecordConfirmationViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VisionPrescriptionAddRecordConfirmationViewController();
  id v4 = v7.receiver;
  [(OBTableWelcomeController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);

    id v4 = v6;
  }
}

- (void)addRecord
{
  v2 = self;
  sub_241D9EA74();
}

- (void)dismissPreview
{
  v2 = self;
  sub_241D9ED3C();
}

- (void)dismissAnimated:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_241DAAF50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  -[VisionPrescriptionAddRecordConfirmationViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_241DA5B44((uint64_t)&v6, (uint64_t (*)(void))sub_241D2D9F0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_241DA9880();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241DA9830();
  id v10 = a3;
  v11 = self;
  v12 = VisionPrescriptionAddRecordConfirmationViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v6 = qword_268D4B2F0;
    id v7 = a3;
    uint64_t v8 = self;
    if (v6 != -1) {
      swift_once();
    }
    sub_241DA95E0();

    id v4 = (void *)sub_241DAA950();
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
  uint64_t v4 = sub_241DA9880();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241DA9830();
  double v8 = *MEMORY[0x263F839B8];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x263F839B8];
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

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  double result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  double result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  double result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  double result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_addToHealthButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_visionPrescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_profileStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_sampleType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_samplePredicate));
  sub_241D36E44((uint64_t)self+ OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_pinnedContentManager);
}

@end
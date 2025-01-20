@interface VisionPrescriptionRecordAddedViewController
- (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)doneButtonTapped;
- (void)viewDidLoad;
@end

@implementation VisionPrescriptionRecordAddedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241D3C748();
}

- (void)doneButtonTapped
{
  v2 = self;
  sub_241D3C968();
}

- (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin43VisionPrescriptionRecordAddedViewController_healthStore));
}

@end
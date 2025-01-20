@interface PDFPreviewViewController
- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PDFPreviewViewController

- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithCoder:(id)a3
{
  result = (_TtC15HealthRecordsUI24PDFPreviewViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C233F450();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1C233F564(a3);
}

- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24PDFPreviewViewController_pdfDocument));
}

@end
@interface SummaryAlertTileViewController
- (NSString)title;
- (_TtC9Summaries30SummaryAlertTileViewController)initWithCoder:(id)a3;
- (_TtC9Summaries30SummaryAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SummaryAlertTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241CA9CB4();
}

- (_TtC9Summaries30SummaryAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_241CDB0D0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9Summaries30SummaryAlertTileViewController *)sub_241CAB640(v5, v7, a4);
}

- (_TtC9Summaries30SummaryAlertTileViewController)initWithCoder:(id)a3
{
  return (_TtC9Summaries30SummaryAlertTileViewController *)sub_241CAB7B4(a3);
}

- (void).cxx_destruct
{
  sub_241CAD514((uint64_t)self + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel, &qword_268D43AD8, MEMORY[0x263F44060]);
  sub_241A68690((uint64_t)self + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context, &qword_268D43B00, &qword_268D43B08);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView));

  swift_release();
}

- (NSString)title
{
  v2 = self;
  sub_241CABF10();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_241CDB090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

@end
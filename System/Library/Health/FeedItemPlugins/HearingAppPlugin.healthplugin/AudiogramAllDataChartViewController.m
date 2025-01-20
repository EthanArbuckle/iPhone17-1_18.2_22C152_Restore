@interface AudiogramAllDataChartViewController
- (_TtC16HearingAppPlugin35AudiogramAllDataChartViewController)initWithCoder:(id)a3;
- (_TtC16HearingAppPlugin35AudiogramAllDataChartViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)shareButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation AudiogramAllDataChartViewController

- (_TtC16HearingAppPlugin35AudiogramAllDataChartViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2409EB538();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2409EA360();
}

- (void)shareButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_240A05128();
  sub_240A03B98();
  sub_2409EAE38();

  sub_240981514((uint64_t)&v5);
}

- (_TtC16HearingAppPlugin35AudiogramAllDataChartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16HearingAppPlugin35AudiogramAllDataChartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController_audiogramSample));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController_chartController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController_scrollViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController____lazy_storage___shareBarButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HearingAppPlugin35AudiogramAllDataChartViewController____lazy_storage___exportPDFButton);
}

@end
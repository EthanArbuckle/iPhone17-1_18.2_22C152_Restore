@interface LastMenstrualPeriodTileViewController
- (NSString)title;
- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation LastMenstrualPeriodTileViewController

- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    id v7 = a4;
    v8 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((void *)v9 + 4) = 0;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LastMenstrualPeriodTileViewController();
  v11 = [(LastMenstrualPeriodViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
  MenstrualPeriodTileViewController = (objc_class *)type metadata accessor for LastMenstrualPeriodTileViewController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = MenstrualPeriodTileViewController;
  return [(LastMenstrualPeriodViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (NSString)title
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_viewModel))
  {
    sub_241413038();
    v2 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

@end
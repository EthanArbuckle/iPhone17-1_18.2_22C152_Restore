@interface AFibBurdenLifeFactorsTileViewController
- (NSString)title;
- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithCoder:(id)a3;
- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation AFibBurdenLifeFactorsTileViewController

- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_240BB6DE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Heart39AFibBurdenLifeFactorsTileViewController *)sub_240B88CC4(v5, v7, a4);
}

- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_cacheObject) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AFibBurdenLifeFactorsTileViewController();
  return [(AFibBurdenLifeFactorsTileViewController *)&v6 initWithCoder:a3];
}

- (void)loadView
{
  v2 = self;
  sub_240B88E4C();
}

- (void).cxx_destruct
{
  sub_240B8A574((uint64_t)self + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_context, (uint64_t (*)(void))sub_240B89E0C);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_tileView);
}

- (NSString)title
{
  uint64_t v2 = qword_268C9E7A8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_240BB2980();

  v4 = (void *)sub_240BB6DA0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

@end
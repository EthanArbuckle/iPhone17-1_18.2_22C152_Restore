@interface CardioFitnessRetroComputeTipTileViewController
- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithCoder:(id)a3;
- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CardioFitnessRetroComputeTipTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_240B2379C();
}

- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController *)sub_240B267EC(v5, v7, a4);
}

- (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController)initWithCoder:(id)a3
{
  return (_TtC5Heart46CardioFitnessRetroComputeTipTileViewController *)sub_240B269D4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_240B27200((uint64_t)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController____lazy_storage___tileView));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_detail;
  uint64_t v4 = sub_240BB43B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC5Heart46CardioFitnessRetroComputeTipTileViewController_deselectionBehavior;
  uint64_t v6 = sub_240BB46D0();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end
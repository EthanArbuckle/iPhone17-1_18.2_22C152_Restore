@interface MonogramPosterBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MonogramPosterBackgroundViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000037BC();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100016360();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController *)sub_100003D80(v5, v7, a4);
}

- (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController)initWithCoder:(id)a3
{
  return (_TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController *)sub_100003F5C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_simulationView));
  sub_1000042D0((uint64_t)self + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_topBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController__backgroundColorLayer));
  v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension38MonogramPosterBackgroundViewController_logger;
  uint64_t v4 = sub_100016290();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
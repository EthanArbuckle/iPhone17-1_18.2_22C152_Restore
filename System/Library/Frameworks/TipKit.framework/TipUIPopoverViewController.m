@interface TipUIPopoverViewController
- (BOOL)_canShowWhileLocked;
- (UIPopoverPresentationController)popoverPresentationController;
- (_TtC6TipKit26TipUIPopoverViewController)initWithCoder:(id)a3;
- (_TtC6TipKit26TipUIPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TipUIPopoverViewController

- (UIPopoverPresentationController)popoverPresentationController
{
  return (UIPopoverPresentationController *)sub_24637DC70((uint64_t)self, (uint64_t)a2, 93, (uint64_t (*)(void))TipUIPopoverViewController.popoverPresentationController.getter);
}

- (void)loadView
{
}

- (void)viewDidLayoutSubviews
{
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  TipUIPopoverViewController.viewWillAppear(_:)(a3);
  swift_release();
}

- (void)traitCollectionDidChange:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  TipUIPopoverViewController.traitCollectionDidChange(_:)(v9);
  swift_release();
}

- (BOOL)_canShowWhileLocked
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  Swift::Bool canShowWhile = TipUIPopoverViewController._canShowWhileLocked()();
  swift_release();

  return canShowWhile;
}

- (_TtC6TipKit26TipUIPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    uint64_t v6 = sub_246386F30();
    a3 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = a4;
  UITraitCollection_optional v9 = (_TtC6TipKit26TipUIPopoverViewController *)TipUIPopoverViewController.init(nibName:bundle:)(v6, (uint64_t)a3, a4);
  swift_release();
  return v9;
}

- (_TtC6TipKit26TipUIPopoverViewController)initWithCoder:(id)a3
{
  sub_24637DB94();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6TipKit26TipUIPopoverViewController_delegate));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6TipKit26TipUIPopoverViewController_hostingView);
}

@end
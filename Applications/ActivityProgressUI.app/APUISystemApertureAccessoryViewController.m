@interface APUISystemApertureAccessoryViewController
- (BOOL)_canShowWhileLocked;
- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithCoder:(id)a3;
- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation APUISystemApertureAccessoryViewController

- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithCoder:(id)a3
{
  result = (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view);
  v3 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController);
  v4 = self;
  [v3 willMoveToParentViewController:v4];
  [(APUISystemApertureAccessoryViewController *)v4 addChildViewController:v3];
  [(APUISystemApertureAccessoryViewController *)v4 setView:v2];
  [v3 didMoveToParentViewController:v4];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = [(APUISystemApertureAccessoryViewController *)v5 parentViewController];
  [v6 preferredContentSizeDidChangeForChildContentContainer:a3];
  swift_unknownObjectRelease();
}

- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view));
}

@end
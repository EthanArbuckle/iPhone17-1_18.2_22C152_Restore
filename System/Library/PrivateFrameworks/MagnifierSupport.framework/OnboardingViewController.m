@interface OnboardingViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapStart;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OnboardingViewController

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7 = sub_235949AC8();
  uint64_t v9 = v8;
  if (a4)
  {
    a4 = (id)sub_235949AC8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a5;
  return (_TtC16MagnifierSupport24OnboardingViewController *)sub_235849B40(v7, v9, (uint64_t)a4, v11, a5);
}

- (void)didTapStart
{
  uint64_t v2 = MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    v5 = self;
    swift_unknownObjectRetain();
    sub_23588E618(0, (uint64_t)sub_23584B31C, v4);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    v6 = self;
  }
  [(OnboardingViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2, a3))
  {
    uint64_t v4 = self;
    sub_235836F28();

    swift_unknownObjectRelease();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2, a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_23588E618(0, (uint64_t)sub_23584B310, v6);

    swift_unknownObjectRelease();
    swift_release();
  }
}

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC16MagnifierSupport24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC16MagnifierSupport24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
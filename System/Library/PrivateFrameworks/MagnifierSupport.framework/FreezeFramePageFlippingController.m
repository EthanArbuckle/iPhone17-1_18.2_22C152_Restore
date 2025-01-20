@interface FreezeFramePageFlippingController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)init;
- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (uint64_t)didTapDoneButton:;
- (void)didActivateCameraTrayReaderButton:(id)a3;
- (void)didActivateCameraTrayShareButton:(id)a3;
- (void)didTapPageControl:(id)a3;
- (void)handleNoTextDetected;
- (void)handleShareFreezeFrameMenuItemActionWithMenuLocation:(CGRect)a3;
- (void)loadView;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)shareButtonAction:(id)a3;
- (void)singleTap:(id)a3;
- (void)textReaderModeButtonAction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation FreezeFramePageFlippingController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)singleTap:(id)a3
{
  v5 = self;
  id v6 = a3;
  v8 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  if (qword_26AF152C0 != -1) {
    swift_once();
  }
  objc_msgSend(v7, sel_postNotificationName_object_, qword_26AF18548, 0);

  sub_235661C1C();
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)init
{
  return (_TtC16MagnifierSupport33FreezeFramePageFlippingController *)sub_235661FB4();
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235668F9C();
}

- (void)didTapPageControl:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23594A6A8();
  swift_unknownObjectRelease();
  sub_235663780((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
}

- (void)loadView
{
  v2 = self;
  sub_23566398C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_235663B00();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_235663E30((uint64_t)a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FreezeFramePageFlippingController *)&v5 viewDidAppear:v3];
  sub_23566404C();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_2356648A8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FreezeFramePageFlippingController *)&v5 viewWillDisappear:v3];
  sub_2358722B0(0, 0xE000000000000000);
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  sub_2356594B0(0, (unint64_t *)&unk_26AF15260);
  unint64_t v6 = sub_235949D78();
  id v7 = a3;
  v8 = self;
  sub_235669180(v6);

  swift_bridgeObjectRelease();
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  id v9 = a3;
  v10 = self;
  sub_235669668(v9, a4, a6);
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (void *)sub_2356699A0(v7);

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (void *)sub_235669B48(v7);

  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MagnifierSupport33FreezeFramePageFlippingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_activePageIndexPath, &qword_26880F1C0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController____lazy_storage___pageController));
  swift_bridgeObjectRelease();
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_pageControlPositionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_pageControl));
  swift_bridgeObjectRelease();
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_textOverlayDelegate);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController____lazy_storage___textReaderModeButtonItem);
}

- (void)shareButtonAction:(id)a3
{
}

- (void)textReaderModeButtonAction:(id)a3
{
}

- (void)handleNoTextDetected
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_textOverlayDelegate, a2))
  {
    BOOL v3 = self;
    sub_235897D80();

    swift_unknownObjectRelease();
  }
}

- (void)handleShareFreezeFrameMenuItemActionWithMenuLocation:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  sub_23566587C(x, y, width, height);
}

- (void)didActivateCameraTrayShareButton:(id)a3
{
}

- (void)didActivateCameraTrayReaderButton:(id)a3
{
}

- (uint64_t)didTapDoneButton:
{
  if (qword_26880E400 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_235948278();
  __swift_project_value_buffer(v0, (uint64_t)qword_26880F788);
  v1 = sub_235948258();
  os_log_type_t v2 = sub_23594A148();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_235640000, v1, v2, "didTapDoneButton", v3, 2u);
    MEMORY[0x237DE9F30](v3, -1, -1);
  }

  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  return sub_2359484E8();
}

@end
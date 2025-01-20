@interface FreezeFramePageContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (NSString)description;
- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)viewForZoomingInScrollView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)doubleTap:(id)a3;
- (void)labelTapped:(id)a3;
- (void)longPress:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)shareFreezeFrameMenuItemAction;
- (void)singleTap:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FreezeFramePageContentViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (NSString)description
{
  v2 = self;
  sub_235853800();

  v3 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235859DC8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2358539E8();
}

- (void)labelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23585A1E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_2358547D0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_235855E20(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_235855FD8();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  char v7 = sub_235947B48();

  sub_23566A3AC((uint64_t)v9, &qword_26AF15750);
  return v7 & 1;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235857780(v4);
}

- (void)singleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235858120(v4);
}

- (void)doubleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2358583C4(v4);
}

- (void)longPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235858A68(v4);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_23585A3E8();

  return v10;
}

- (void)shareFreezeFrameMenuItemAction
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_pageSelectionDelegate, a2))
  {
    double v3 = *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    double v4 = *(double *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    double v5 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    double v6 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    id v7 = self;
    sub_23566587C(v3, v4, v5, v6);

    swift_unknownObjectRelease();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MagnifierSupport36FreezeFramePageContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_pageSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_scrollView));
  sub_235859D6C((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_asset);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_cachedReaderTextDocument));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___interaction));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_image));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageProcessingQueue));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___singleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___longPressGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___doubleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___editMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_myLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_readerModeViewController);
}

@end
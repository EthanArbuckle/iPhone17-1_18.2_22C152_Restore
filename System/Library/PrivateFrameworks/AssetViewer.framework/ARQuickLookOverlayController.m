@interface ARQuickLookOverlayController
- (ASVControlsView)controlsViewStack;
- (ASVRoundedButton)dismissButton;
- (ASVRoundedButton)shareButton;
- (ASVTrackingStateStatusLabel)statusPill;
- (UIButton)debugActionsButton;
- (UIButton)fileARadarButton;
- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithCoder:(id)a3;
- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)autoHide2DControls;
- (void)dealloc;
- (void)displayModeChanged;
- (void)dynamicShutterControlDidShortPress:(id)a3;
- (void)dynamicShutterControlDidStart:(id)a3;
- (void)dynamicShutterControlDidStop:(id)a3;
- (void)enableWorldModeControl:(BOOL)a3;
- (void)handleLongPressGesture:(id)a3;
- (void)loadView;
- (void)setControlsViewStack:(id)a3;
- (void)setDebugActionsButton:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setFileARadarButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setStatusPill:(id)a3;
- (void)startAutoHideControlsTimer;
- (void)stopAutoHideControlsTimerWithShouldRestart:(BOOL)a3;
- (void)takePicture;
- (void)trackedRaycastStateDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateStatusPill;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ARQuickLookOverlayController

- (ASVControlsView)controlsViewStack
{
  v2 = self;
  id v3 = sub_1E292C7F4();

  return (ASVControlsView *)v3;
}

- (void)setControlsViewStack:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack) = (Class)a3;
  id v3 = a3;
}

- (ASVRoundedButton)dismissButton
{
  v2 = self;
  id v3 = sub_1E292CBA4();

  return (ASVRoundedButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton) = (Class)a3;
  id v3 = a3;
}

- (ASVRoundedButton)shareButton
{
  v2 = self;
  id v3 = sub_1E292D058();

  return (ASVRoundedButton *)v3;
}

- (void)setShareButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)debugActionsButton
{
  v2 = self;
  id v3 = sub_1E292D4B4();

  return (UIButton *)v3;
}

- (void)setDebugActionsButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)fileARadarButton
{
  v2 = self;
  id v3 = sub_1E292D6B4();

  return (UIButton *)v3;
}

- (void)setFileARadarButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton) = (Class)a3;
  id v3 = a3;
}

- (ASVTrackingStateStatusLabel)statusPill
{
  v2 = self;
  id v3 = sub_1E292DE4C();

  return (ASVTrackingStateStatusLabel *)v3;
}

- (void)setStatusPill:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill) = (Class)a3;
  id v3 = a3;
}

- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E29352D0();
}

- (void)loadView
{
  type metadata accessor for ARQuickLookOverlayView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(ARQuickLookOverlayController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E292E050();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E292F874();
}

- (void)dealloc
{
  v2 = self;
  sub_1E292FDEC();
}

- (void).cxx_destruct
{
  sub_1E2883264((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_arTrackingState);
  sub_1E287428C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_lastResultType));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_variantsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___longPressGesture));
  sub_1E2874254((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate);
  sub_1E2883264((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_currentTrackingState);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_touchesOnScreenGestureRecognizer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_autoHideControlsTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shutterButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___displayModeControlView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shutterButton));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_coachingOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___assetLoadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_backgroundDimmingView));
  swift_release();
}

- (void)takePicture
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2))
  {
    id v3 = self;
    sub_1E28CE4C8();

    swift_unknownObjectRelease();
  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E2930A64(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E2930D60((uint64_t)a3);
}

- (void)displayModeChanged
{
  v2 = self;
  sub_1E293298C();
}

- (void)startAutoHideControlsTimer
{
  v2 = self;
  sub_1E2932C20();
}

- (void)stopAutoHideControlsTimerWithShouldRestart:(BOOL)a3
{
  id v4 = self;
  sub_1E2932D60(a3);
}

- (void)autoHide2DControls
{
  v2 = self;
  sub_1E2932E54();
}

- (void)enableWorldModeControl:(BOOL)a3
{
  id v4 = self;
  sub_1E2933204(a3);
}

- (void)updateStatusPill
{
  v2 = self;
  sub_1E2933FC0();
}

- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11AssetViewer28ARQuickLookOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)dynamicShutterControlDidShortPress:(id)a3
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2))
  {
    id v5 = a3;
    v6 = self;
    sub_1E28CE4C8();

    swift_unknownObjectRelease();
  }
}

- (void)dynamicShutterControlDidStart:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E2935788();
}

- (void)dynamicShutterControlDidStop:(id)a3
{
  uint64_t v5 = MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2);
  id v6 = a3;
  v7 = self;
  if (v5)
  {
    sub_1E28DECB0();
    swift_unknownObjectRelease();
  }
  [(ARQuickLookOverlayController *)v7 startAutoHideControlsTimer];
}

- (void)trackedRaycastStateDidChange:(id)a3
{
  uint64_t v4 = sub_1E2991818();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E29917F8();
  v8 = self;
  sub_1E294F1EC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
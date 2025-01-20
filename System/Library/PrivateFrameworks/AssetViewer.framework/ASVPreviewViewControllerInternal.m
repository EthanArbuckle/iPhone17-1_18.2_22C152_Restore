@interface ASVPreviewViewControllerInternal
- (ASVPreviewViewControllerInternal)initWithCoder:(id)a3;
- (ASVPreviewViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)currentlyDisallowsUnifiedGestureRecognizerAction;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldDisableGestures;
- (NSArray)accessibilityEntityControllers;
- (UIView)accessibilityARView;
- (_TtC11AssetViewer16EntityController)accessibilityRootEntityController;
- (_TtC11AssetViewer28ARQuickLookOverlayController)overlayController;
- (float)accessibilityDistanceInMetersFromEntityController:(id)a3;
- (void)accessibilityShowControls;
- (void)activateCoachingView;
- (void)activateCoachingViewWithDelay;
- (void)coachingOverlayViewDidDeactivate:(id)a3;
- (void)createInlinePreviewWithUUID:(id)a3 initialBounds:(CGRect)a4 contextIdReply:(id)a5;
- (void)dealloc;
- (void)didBecomeActive;
- (void)didDismissActivityViewController;
- (void)dismissButtonPressed;
- (void)dismissPreviewController;
- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4;
- (void)handleTapAtPointWithPoint:(CGPoint)a3;
- (void)hideLozengeAnimated;
- (void)inlinePreview:(id)a3 setCameraYaw:(float)a4 pitch:(float)a5 scale:(float)a6 options:(id)a7;
- (void)inlinePreview:(id)a3 setCurrentTime:(double)a4;
- (void)inlinePreview:(id)a3 setEnableGradientBackground:(BOOL)a4;
- (void)inlinePreview:(id)a3 setEnableShadows:(BOOL)a4;
- (void)inlinePreview:(id)a3 setIsLooping:(BOOL)a4;
- (void)inlinePreview:(id)a3 setIsMuted:(BOOL)a4;
- (void)inlinePreview:(id)a3 setIsPlaying:(BOOL)a4;
- (void)inlinePreview:(id)a3 setRuntimeStateObserver:(id)a4;
- (void)observeReturnedToInlineForUUID:(id)a3 fenceHandleCompletion:(id)a4;
- (void)prepareFullscreenPreview:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 fenceHandleCompletion:(id)a6;
- (void)prepareInlinePreviewWithData:(id)a3 forUUID:(id)a4 completion:(id)a5;
- (void)prepareInlinePreviewWithScopedURLWrapperAttributes:(id)a3 forUUID:(id)a4 completion:(id)a5;
- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)presentationModeDidChange:(unint64_t)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)sendARQLEvent:(id)a3 forUUID:(id)a4 completion:(id)a5;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setOverlayController:(id)a3;
- (void)shareButtonPressed;
- (void)teardownInlinePreviewWithUUID:(id)a3 completion:(id)a4;
- (void)touchesBegan:(id)a3 forUUID:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 forUUID:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 forUUID:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 forUUID:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)triggerOnInteractionsAndReEnablePhysicsWithDelay;
- (void)triggerTapToRadar;
- (void)tryPlaceModelOrRescheduleTimer;
- (void)updateBounds:(CGRect)a3 forUUID:(id)a4 fenceHandleCompletion:(id)a5;
- (void)updateInterfaceState;
- (void)updateIsWindowFullscreenWithFuncString:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ASVPreviewViewControllerInternal

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC11AssetViewer28ARQuickLookOverlayController)overlayController
{
  v2 = self;
  v3 = sub_1E28B5400();

  return (_TtC11AssetViewer28ARQuickLookOverlayController *)v3;
}

- (void)setOverlayController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController) = (Class)a3;
  id v3 = a3;
}

- (void)viewDidLoad
{
  v2 = self;
  PreviewViewController.viewDidLoad()();
}

- (void)didBecomeActive
{
  v2 = self;
  sub_1E28B9F0C(0xD000000000000011, 0x80000001E299F510);
}

- (void)updateIsWindowFullscreenWithFuncString:(id)a3
{
  uint64_t v4 = sub_1E2994218();
  unint64_t v6 = v5;
  v7 = self;
  sub_1E28B9F0C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  PreviewViewController.viewDidLayoutSubviews()();
}

- (void)dealloc
{
  v2 = self;
  PreviewViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR___ASVPreviewViewControllerInternal_configuration);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super._view + OBJC_IVAR___ASVPreviewViewControllerInternal_configuration);
  swift_bridgeObjectRelease();

  sub_1E287427C(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_videoWriter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_videoInput));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_playbackViewController));
  swift_bridgeObjectRelease();
  sub_1E28DDCF0((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_previewType, type metadata accessor for PreviewType);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController));
  sub_1E287427C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_shareSheetReplyBlock));
  sub_1E287427C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___coachingOverlayView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_lozengeLabel));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_fallbackTapGestureEntityController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_viewportDebugView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_defaultARConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_faceTrackingConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_placeModelTimer));
  sub_1E287427C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_previewCompletionHandler));
  sub_1E286EC24((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_analyticsViewDidAppearDate, &qword_1EADCB378);
  sub_1E286EC24((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_analyticsLastDisplayModeToggledDate, &qword_1EADCB378);
  swift_bridgeObjectRelease();
  sub_1E28E2920(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___arAnchorTrackedStateUpdater));
  sub_1E286EC24((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_lastPlacedAnchoringComponentTarget, (uint64_t *)&unk_1EADCD390);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E28DDCF0((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_customizationOptions, type metadata accessor for ModelCustomizationOptions);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_debugActionsState));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___replayObserver));
  unint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ASVPreviewViewControllerInternal_hideLozengeTimer);
}

- (void)hideLozengeAnimated
{
  v2 = self;
  sub_1E28BCF68();
}

- (void)updateInterfaceState
{
  v2 = self;
  sub_1E28BD028();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1E286E958(0, (unint64_t *)&qword_1EADCB4A0);
  sub_1E28E25F8((unint64_t *)&qword_1EADCB4E0, (unint64_t *)&qword_1EADCB4A0);
  uint64_t v6 = sub_1E29945A8();
  id v7 = a4;
  v8 = self;
  _s11AssetViewer21PreviewViewControllerC12touchesEnded_4withyShySo7UITouchCG_So7UIEventCSgtF_0(v6);

  swift_bridgeObjectRelease();
}

- (void)presentationModeDidChange:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v5 = self;
  _s11AssetViewer21PreviewViewControllerC25presentationModeDidChange_8animatedySo014QLPresentationG0V_SbtF_0(a3);
}

- (void)didDismissActivityViewController
{
  v2 = self;
  PreviewViewController.didDismissActivityViewController()();
}

- (ASVPreviewViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E2994218();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ASVPreviewViewControllerInternal *)PreviewViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (ASVPreviewViewControllerInternal)initWithCoder:(id)a3
{
  return (ASVPreviewViewControllerInternal *)PreviewViewController.init(coder:)(a3);
}

- (BOOL)shouldDisableGestures
{
  v2 = self;
  sub_1E28C589C();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)currentlyDisallowsUnifiedGestureRecognizerAction
{
  v2 = self;
  sub_1E28C589C();
  char v4 = v3;

  return v4 & 1;
}

- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1E28DDE54(v5);
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_1E2991AA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1E2991A48();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  PreviewViewController.preparePreviewOfFile(at:completionHandler:)((uint64_t)v9, (uint64_t)sub_1E28E2910, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)triggerOnInteractionsAndReEnablePhysicsWithDelay
{
  v2 = self;
  sub_1E28C857C();
}

- (void)previewWillAppear:(BOOL)a3
{
  char v3 = self;
  _s11AssetViewer21PreviewViewControllerC17previewWillAppearyySbF_0();
}

- (void)previewDidAppear:(BOOL)a3
{
  char v3 = self;
  _s11AssetViewer21PreviewViewControllerC16previewDidAppearyySbF_0();
}

- (void)previewWillDisappear:(BOOL)a3
{
  char v3 = self;
  _s11AssetViewer21PreviewViewControllerC20previewWillDisappearyySbF_0();
}

- (void)previewDidDisappear:(BOOL)a3
{
  uint64_t v3 = qword_1EADCA668;
  uint64_t v8 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1E29935E8();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EADCCF78);
  id v5 = sub_1E29935C8();
  os_log_type_t v6 = sub_1E2994688();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E2840000, v5, v6, "ARQL previewDidDisappear", v7, 2u);
    MEMORY[0x1E4E5F8F0](v7, -1, -1);
  }

  sub_1E28CB234();
}

- (void)dismissButtonPressed
{
  v2 = self;
  sub_1E28CDC28();
}

- (void)shareButtonPressed
{
  v2 = self;
  sub_1E28CEEA4();
}

- (void)handleTapAtPointWithPoint:(CGPoint)a3
{
  uint64_t v3 = self;
  sub_1E28E2838();
}

- (UIView)accessibilityARView
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v2 && (uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC11AssetViewer15ModelController_arView)) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  return (UIView *)v4;
}

- (void)accessibilityShowControls
{
  if (*((unsigned char *)&self->super.super.super._responderFlags + OBJC_IVAR___ASVPreviewViewControllerInternal_interfaceState) == 4)
  {
    *((unsigned char *)&self->super.super.super._responderFlags + OBJC_IVAR___ASVPreviewViewControllerInternal_interfaceState) = 3;
    [(ASVPreviewViewControllerInternal *)self updateInterfaceState];
  }
}

- (float)accessibilityDistanceInMetersFromEntityController:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v3)
  {
    id v4 = *(void **)(v3 + OBJC_IVAR____TtC11AssetViewer15ModelController_arView);
    if (v4)
    {
      id v6 = a3;
      uint64_t v7 = self;
      id v8 = v4;
      sub_1E2992E88();
      float v10 = v9;

      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (NSArray)accessibilityEntityControllers
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController))
    swift_bridgeObjectRetain();
  type metadata accessor for EntityController();
  uint64_t v2 = (void *)sub_1E2994418();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC11AssetViewer16EntityController)accessibilityRootEntityController
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v2 && (uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC11AssetViewer15ModelController_rootEntityController)) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  return (_TtC11AssetViewer16EntityController *)v4;
}

- (void)tryPlaceModelOrRescheduleTimer
{
  uint64_t v2 = self;
  sub_1E28F8854();
}

- (void)createInlinePreviewWithUUID:(id)a3 initialBounds:(CGRect)a4 contextIdReply:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v11 = sub_1E2991BB8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  v17 = (char *)aBlock - v16;
  v18 = _Block_copy(a5);
  sub_1E2991B98();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v17, v11);
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_1E2921D6C;
  *(void *)(v22 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v22 + v20, v14, v11);
  v23 = (CGFloat *)(v22 + v21);
  CGFloat *v23 = x;
  v23[1] = y;
  v23[2] = width;
  v23[3] = height;
  aBlock[4] = sub_1E2920E00;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_217;
  v24 = _Block_copy(aBlock);
  v25 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v24);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)prepareInlinePreviewWithScopedURLWrapperAttributes:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  v24 = self;
  uint64_t v7 = sub_1E2991BB8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  float v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v23 - v12;
  v14 = _Block_copy(a5);
  sub_1E2991B98();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v10, v7);
  uint64_t v19 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + v17);
  *uint64_t v19 = sub_1E29222A8;
  v19[1] = (void (*)(uint64_t, uint64_t, uint64_t))v15;
  *(void *)(v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_1E2920E20;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_207;
  unint64_t v20 = _Block_copy(aBlock);
  id v21 = a3;
  uint64_t v22 = v24;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)prepareInlinePreviewWithData:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v9 = sub_1E2991BB8();
  MEMORY[0x1F4188790](v9 - 8);
  float v10 = _Block_copy(a5);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_1E2991AC8();

  sub_1E2991B98();
  _Block_release(v10);
  sub_1E2994D88();
  __break(1u);
}

- (void)prepareFullscreenPreview:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 fenceHandleCompletion:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v36 = self;
  uint64_t v11 = sub_1E2991BB8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  unint64_t v17 = (char *)&v33 - v16;
  uint64_t v18 = _Block_copy(a6);
  v35 = v17;
  sub_1E2991B98();
  uint64_t v34 = sub_1E2994168();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  unint64_t v20 = v17;
  uint64_t v21 = v11;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v20, v11);
  unint64_t v22 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v23 = (v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v27 + v22, v14, v21);
  v28 = (CGFloat *)(v27 + v23);
  CGFloat *v28 = x;
  v28[1] = y;
  v28[2] = width;
  v28[3] = height;
  *(void *)(v27 + v24) = v34;
  v29 = (void (**)(uint64_t, uint64_t, uint64_t))(v27 + v25);
  *v29 = sub_1E2922DD4;
  v29[1] = (void (*)(uint64_t, uint64_t, uint64_t))v19;
  v30 = v36;
  *(void *)(v27 + v26) = v36;
  aBlock[4] = sub_1E2920E28;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_197;
  v31 = _Block_copy(aBlock);
  v32 = v30;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v31);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v35, v21);
}

- (void)observeReturnedToInlineForUUID:(id)a3 fenceHandleCompletion:(id)a4
{
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)aBlock - v11;
  uint64_t v13 = _Block_copy(a4);
  sub_1E2991B98();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v9, v6);
  uint64_t v18 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + v16);
  void *v18 = sub_1E2921FCC;
  v18[1] = (void (*)(uint64_t, uint64_t, uint64_t))v14;
  aBlock[4] = sub_1E2920E30;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_186;
  uint64_t v19 = _Block_copy(aBlock);
  unint64_t v20 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)dismissPreviewController
{
  uint64_t v2 = self;
  PreviewViewController.dismissPreviewController()();
}

- (void)touchesBegan:(id)a3 forUUID:(id)a4
{
}

- (void)touchesMoved:(id)a3 forUUID:(id)a4
{
}

- (void)touchesEnded:(id)a3 forUUID:(id)a4
{
}

- (void)touchesCancelled:(id)a3 forUUID:(id)a4
{
  uint64_t v5 = sub_1E2991BB8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)aBlock - v10;
  sub_1E286E958(0, (unint64_t *)&unk_1EADCCEB0);
  sub_1E2921EB8();
  uint64_t v12 = sub_1E29945A8();
  sub_1E2991B98();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v14 = (v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v15 + v13, v8, v5);
  *(void *)(v15 + v14) = v12;
  aBlock[4] = sub_1E29210EC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_176;
  unint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = self;
  swift_bridgeObjectRetain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

- (void)updateBounds:(CGRect)a3 forUUID:(id)a4 fenceHandleCompletion:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v11 = sub_1E2991BB8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)aBlock - v16;
  uint64_t v18 = _Block_copy(a5);
  sub_1E2991B98();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v17, v11);
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (CGFloat *)swift_allocObject();
  v22[2] = x;
  v22[3] = y;
  v22[4] = width;
  v22[5] = height;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v22 + v20, v14, v11);
  unint64_t v23 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v22 + v21);
  CGFloat *v23 = sub_1E2921D6C;
  v23[1] = (void (*)(uint64_t, uint64_t, uint64_t))v19;
  aBlock[4] = sub_1E2921120;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_169;
  unint64_t v24 = _Block_copy(aBlock);
  unint64_t v25 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v24);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)inlinePreview:(id)a3 setRuntimeStateObserver:(id)a4
{
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)aBlock - v11;
  uint64_t v13 = _Block_copy(a4);
  sub_1E2991B98();
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    uint64_t v13 = sub_1E2921D64;
  }
  else
  {
    uint64_t v14 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v9, v6);
  uint64_t v18 = (void *)(v17 + v16);
  void *v18 = v13;
  v18[1] = v14;
  aBlock[4] = sub_1E2921128;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_156;
  uint64_t v19 = _Block_copy(aBlock);
  unint64_t v20 = self;
  sub_1E2873E2C((uint64_t)v13);
  swift_release();
  QLRunInMainThread();
  _Block_release(v19);
  sub_1E287427C((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setEnableShadows:(BOOL)a4
{
}

- (void)inlinePreview:(id)a3 setEnableGradientBackground:(BOOL)a4
{
  uint64_t v4 = sub_1E2991BB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E2991B98();
  _s11AssetViewer21PreviewViewControllerC06inlineC0_27setEnableGradientBackgroundy10Foundation4UUIDV_SbtF_0((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)inlinePreview:(id)a3 setIsPlaying:(BOOL)a4
{
}

- (void)inlinePreview:(id)a3 setIsLooping:(BOOL)a4
{
}

- (void)inlinePreview:(id)a3 setCurrentTime:(double)a4
{
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)aBlock - v11;
  sub_1E2991B98();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v9, v6);
  *(double *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = a4;
  aBlock[4] = sub_1E2921400;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_128;
  unint64_t v15 = _Block_copy(aBlock);
  unint64_t v16 = self;
  swift_release();
  QLRunInMainThread();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setIsMuted:(BOOL)a4
{
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)aBlock - v11;
  sub_1E2991B98();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v9, v6);
  aBlock[4] = sub_1E2921408;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_121;
  unint64_t v15 = _Block_copy(aBlock);
  unint64_t v16 = self;
  swift_release();
  QLRunInMainThread();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setCameraYaw:(float)a4 pitch:(float)a5 scale:(float)a6 options:(id)a7
{
  unint64_t v25 = self;
  uint64_t v10 = sub_1E2991BB8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  unint64_t v16 = (char *)&v24 - v15;
  sub_1E2991B98();
  uint64_t v24 = sub_1E2994168();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v18 = (v12 + v17 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v19 = (v18 + 7) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v20 = (v19 + 7) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v21 + v17, v13, v10);
  *(float *)(v21 + v18) = a4;
  *(float *)(v21 + v19) = a5;
  *(float *)(v21 + v20) = a6;
  *(void *)(v21 + ((v20 + 11) & 0xFFFFFFFFFFFFFFF8)) = v24;
  aBlock[4] = sub_1E2921410;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_114;
  unint64_t v22 = _Block_copy(aBlock);
  unint64_t v23 = v25;
  swift_bridgeObjectRetain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v22);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)teardownInlinePreviewWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)aBlock - v11;
  unint64_t v13 = _Block_copy(a4);
  sub_1E2991B98();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v9, v6);
  unint64_t v18 = (void (**)())(v17 + v16);
  void *v18 = sub_1E29215EC;
  v18[1] = (void (*)())v14;
  aBlock[4] = sub_1E2921418;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_107;
  unint64_t v19 = _Block_copy(aBlock);
  unint64_t v20 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)sendARQLEvent:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  unint64_t v23 = self;
  uint64_t v6 = sub_1E2991BB8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v22 - v11;
  unint64_t v13 = _Block_copy(a5);
  uint64_t v14 = sub_1E2994168();
  sub_1E2991B98();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v9, v6);
  *(void *)(v18 + v17) = v14;
  unint64_t v19 = (void (**)(uint64_t, uint64_t))(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  *unint64_t v19 = sub_1E2921484;
  v19[1] = (void (*)(uint64_t, uint64_t))v15;
  aBlock[4] = sub_1E2921420;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E290993C;
  aBlock[3] = &block_descriptor_97;
  unint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v20);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)triggerTapToRadar
{
  uint64_t v2 = self;
  sub_1E2927A20();
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1E292BC10(v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1E292C294(v8);
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E292BF18((uint64_t)&unk_1F3DDC840, (uint64_t)sub_1E292C5D8, (uint64_t)&block_descriptor_36);
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E292BF18((uint64_t)&unk_1F3DDC7F0, (uint64_t)sub_1E292C5D0, (uint64_t)&block_descriptor_30);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PreviewViewController.session(_:didUpdate:)((ARSession)v6, (ARFrame)v7);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
}

- (void)activateCoachingView
{
  uint64_t v2 = self;
  sub_1E2990B48();
}

- (void)activateCoachingViewWithDelay
{
  uint64_t v2 = self;
  sub_1E29906FC();
}

- (void)coachingOverlayViewDidDeactivate:(id)a3
{
  id v4 = (uint64_t *)((char *)self
                 + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock);
  uint64_t v5 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock);
  id v6 = a3;
  id v7 = self;
  if (v5)
  {
    uint64_t v8 = sub_1E2873E2C((uint64_t)v5);
    v5(v8);
    sub_1E287427C((uint64_t)v5);
    uint64_t v9 = *v4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  *id v4 = 0;
  v4[1] = 0;
  sub_1E287427C(v9);
}

@end
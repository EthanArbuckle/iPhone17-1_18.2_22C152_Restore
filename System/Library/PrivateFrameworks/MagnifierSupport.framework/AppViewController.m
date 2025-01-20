@interface AppViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (_TtC16MagnifierSupport17AppViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport17AppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)userDidEndMutliShotMode:;
- (void)_dismissActivityCustomizationPane;
- (void)_dismissActivityCustomizationPaneWithText;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)applicationDidRemoveDeactivationReasonWithNotification:(id)a3;
- (void)applicationWillAddDeactivationReasonWithNotification:(id)a3;
- (void)deviceOrientationDidChange:(id)a3;
- (void)didActivateCardHidingGesture:(id)a3;
- (void)didActivateCardVisibilityGesture:(id)a3;
- (void)didLongPressToFocus:(id)a3;
- (void)didPanPreviewView:(id)a3;
- (void)didPinchToZoom:(id)a3;
- (void)didTapCloseButton:(id)a3;
- (void)didTapPipWindowButton:(id)a3;
- (void)didTapToChangeFocus:(id)a3;
- (void)loadView;
- (void)openDetectionSettings:(id)a3;
- (void)stopSpeechForVoiceOverFocusChange;
- (void)toggleAVTorchForApplicationDeactivation:(BOOL)a3;
- (void)updateAppearanceForReduceTransparency:(id)a3;
- (void)userDidExitDetectionMode:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppViewController

- (void)toggleAVTorchForApplicationDeactivation:(BOOL)a3
{
  v4 = self;
  sub_235660170(a3);
}

- (void)stopSpeechForVoiceOverFocusChange
{
  v2 = self;
  if (UIAccessibilityIsVoiceOverRunning()) {
    sub_235746468();
  }
}

- (void)userDidExitDetectionMode:(id)a3
{
  uint64_t v4 = qword_26AF13B78;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_2357F2104(0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();
}

- (void)openDetectionSettings:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2357C0CAC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = self;
  sub_2359470F8();
  sub_23583684C((uint64_t)sub_2357CC31C, v5);
  swift_release_n();
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for AppViewController();
  [(AppViewController *)&v7 viewWillDisappear:v3];
}

- (void)_dismissActivityCustomizationPaneWithText
{
  v2 = self;
  sub_23587390C();
}

- (void)_dismissActivityCustomizationPane
{
  v2 = self;
  sub_235873D20();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC16MagnifierSupport17AppViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16MagnifierSupport17AppViewController *)sub_2358A6274();
}

- (void)loadView
{
  v2 = self;
  sub_235880F00();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_235881090();
}

- (void)didTapPipWindowButton:(id)a3
{
}

- (void)didTapCloseButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358A7B38();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_2358863AC();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_235886868(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_2358873A8(a3);
}

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF12EA0);
  MEMORY[0x270FA5388](v5 - 8, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_235947498();
    uint64_t v12 = sub_2359474C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2359474C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_23589618C();

  sub_23566A3AC((uint64_t)v11, &qword_26AF12EA0);
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358A7808();
}

- (void)didPanPreviewView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_235899130(v4);
}

- (void)didTapToChangeFocus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_235899964(v4);
}

- (void)didLongPressToFocus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23589A240(v4);
}

- (void)didPinchToZoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23589A760(v4);
}

- (void)didActivateCardVisibilityGesture:(id)a3
{
}

- (void)didActivateCardHidingGesture:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport17AppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MagnifierSupport17AppViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_freezeFrameViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___controlContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___mainCardViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___cameraTrayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_currentLiveView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___cameraVideoPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_liveLensInterruptionBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___doubleTapGesture));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController__capturedPhoto;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF14FA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController__capturedImage;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF14FE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_actionButtonInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_eventInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomPanGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomPinchGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomGestureFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_controlsQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_audioQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___focusIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_focusIndicatorFadeTime));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___coachingLabel));
  sub_23574D854(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___landscapeCoachingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___detectionInformationLabel));
  sub_23574D854(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___landscapeDetectionInformationLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_coachingHideAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sceneEventAnimator));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_springBoardServer));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_activitiesNameController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_commitActivityButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_backTapEventProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_modelsManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_arOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerTipScene));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerTip));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_luminanceManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastARFrame));
  swift_bridgeObjectRelease();
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastSpeechDate, (uint64_t *)&unk_26AF12ED0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_tooFastLastDate;
  uint64_t v8 = sub_235947908();
  uint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___personDetectionManager));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectionModeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectedPersonView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectedObjectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_engine));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_languageTranslator));
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastImageDescriptionTextTime, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastTextDetectionTextDisplayTime, v8);
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastHandPoseTime, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_flashlightBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_textBoxLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerDebugLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pointSpeakInstructionsAlertController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedReaderTextDocument));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_readerModeLoadingProgressViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_readerModeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_settingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pipWindowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sessionTimer));
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sessionTimerStartTime, v8);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_captureService));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_arService));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_objectUnderstandingService));
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_stillImageStore);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pulseFeedbackProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_passthroughView));
  swift_bridgeObjectRelease();
  uint64_t v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_freezeFrameScrubberTray);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_23589CFE4(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_23589D290(v6, v7);

  return v9 & 1;
}

- (void)applicationWillAddDeactivationReasonWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23589D9E8(v4);
}

- (void)applicationDidRemoveDeactivationReasonWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23589EA34(v4);
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = self;
  sub_2358A8214(v8);
}

- (uint64_t)userDidEndMutliShotMode:
{
  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();
  return sub_2356FA3F8();
}

@end
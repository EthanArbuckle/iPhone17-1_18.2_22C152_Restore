@interface ActivityHostViewController
- (ACActivityDescriptor)acActivityDescriptor;
- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment;
- (BOOL)_canShowWhileLocked;
- (BOOL)idleTimerDisabled;
- (BOOL)shouldShareTouchesWithHost;
- (BOOL)wantsBaseContentTouchEvents;
- (NSArray)activityTouchRestrictedRects;
- (NSArray)audioCategoriesDisablingVolumeHUD;
- (NSString)description;
- (UIColor)backgroundTintColor;
- (UIColor)textColor;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)fallbackMetrics;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)resolvedMetrics;
- (_TtC18ActivityUIServices22ActivityMetricsRequest)systemProvidedMetrics;
- (_TtC18ActivityUIServices23ActivitySceneDescriptor)activitySceneDescriptor;
- (_TtC18ActivityUIServices26ActivityHostViewController)initWithActivitySceneDescriptor:(id)a3;
- (_TtC18ActivityUIServices26ActivityHostViewController)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices26ActivityHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP18ActivityUIServices34ActivityHostViewControllerDelegate_)delegate;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (unsigned)presentationMode;
- (void)dealloc;
- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)requestLaunch;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)setActivitySceneDescriptor:(id)a3;
- (void)setActivityTouchRestrictedRects:(id)a3;
- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)setBackgroundTintColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setPresentationMode:(unsigned int)a3;
- (void)setResolvedMetrics:(id)a3;
- (void)setShouldShareTouchesWithHost:(BOOL)a3;
- (void)setSystemProvidedMetrics:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setWantsBaseContentTouchEvents:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ActivityHostViewController

- (_TtP18ActivityUIServices34ActivityHostViewControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23ECEAE20](v2);
  return (_TtP18ActivityUIServices34ActivityHostViewControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)activitySceneDescriptor
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  return (_TtC18ActivityUIServices23ActivitySceneDescriptor *)*v2;
}

- (void)setActivitySceneDescriptor:(id)a3
{
}

- (ACActivityDescriptor)acActivityDescriptor
{
  uint64_t v3 = sub_23C990C60();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C959038(0, (unint64_t *)&qword_26AF227D0);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, *v7 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor, v3);
  v8 = (void *)sub_23C9911B0();
  return (ACActivityDescriptor *)v8;
}

- (unsigned)presentationMode
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
}

- (void)setPresentationMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = self;
  BSDispatchQueueAssertMain();
  sub_23C965288(v3, 0);
}

- (BOOL)wantsBaseContentTouchEvents
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsBaseContentTouchEvents:(BOOL)a3
{
  uint64_t v4 = self;
  sub_23C961AD4(a3);
}

- (UIColor)backgroundTintColor
{
  return (UIColor *)sub_23C95982C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
}

- (void)setBackgroundTintColor:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_23C97569C(a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);
}

- (UIColor)textColor
{
  return (UIColor *)sub_23C95982C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_23C97569C(a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)resolvedMetrics
{
  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_23C95982C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
}

- (void)setResolvedMetrics:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  id v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  v8 = self;

  BSDispatchQueueAssertMain();
  sub_23C96726C();
}

- (BOOL)idleTimerDisabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_23C961EB4(a3);
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_23C991060();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_23C991070();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *uint64_t v5 = v4;
  id v6 = self;
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  id v7 = (char *)v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x23ECEAE20](v7);
  if (v8)
  {
    objc_msgSend(v8, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (NSArray)activityTouchRestrictedRects
{
  swift_beginAccess();
  type metadata accessor for CGRect(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23C991060();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityTouchRestrictedRects:(id)a3
{
  type metadata accessor for CGRect(0);
  uint64_t v4 = sub_23C991070();
  uint64_t v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)systemProvidedMetrics
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  return (_TtC18ActivityUIServices22ActivityMetricsRequest *)*v2;
}

- (void)setSystemProvidedMetrics:(id)a3
{
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)fallbackMetrics
{
  v2 = self;
  id v3 = sub_23C9621D8();

  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)v3;
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  return (_TtC18ActivityUIServices26ActivityHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(a3);
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23C975C6C();
}

- (void)dealloc
{
  v2 = self;
  ActivityHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_23C9563B0((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer);
}

- (void)viewDidLoad
{
  v2 = self;
  BSDispatchQueueAssertMain();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityHostViewController();
  [(ActivityHostViewController *)&v3 viewDidLoad];
  sub_23C96834C();
  sub_23C96856C();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_23C96A610(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_23C96A910(a3);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  BSDispatchQueueAssertMain();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for ActivityHostViewController();
  [(ActivityHostViewController *)&v9 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  v8 = (char *)v7 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  if (*v8 == 1)
  {
    if (!v6)
    {
      sub_23C9681C4();
      goto LABEL_6;
    }
    sub_23C9679D8();
  }

LABEL_6:
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_23C96AD24();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  objc_super v9 = (void *)swift_allocObject();
  v9[2] = v8;
  id v10 = a4;
  v11 = self;
  sub_23C962838(v10, (uint64_t)sub_23C977558, v9, a3);

  swift_release();
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  v2 = self;
  BSDispatchQueueAssertMain();
  objc_super v3 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (v3) {
    id v4 = objc_msgSend(v3, sel_backlightSceneHostEnvironment);
  }
  else {
    id v4 = 0;
  }

  return (BLSHBacklightSceneHostEnvironment *)v4;
}

- (void)invalidate
{
  v2 = self;
  sub_23C963BE8();
}

- (NSString)description
{
  v2 = self;
  sub_23C96BD9C();

  objc_super v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)shouldShareTouchesWithHost
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  id v5 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  *id v5 = a3;
  id v6 = self;
  BSDispatchQueueAssertMain();
  if (*v5) {
    sub_23C9679D8();
  }
  else {
    sub_23C9681C4();
  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  v2 = self;
  sub_23C964020();
  id v4 = v3;

  return v4;
}

- (void)requestLaunch
{
  v2 = self;
  sub_23C9644C4();
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ActivityUIServices26ActivityHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s18ActivityUIServices0A18HostViewControllerC16sceneDidActivateyySo7FBSceneCF_0();
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s18ActivityUIServices0A18HostViewControllerC18sceneDidInvalidateyySo7FBSceneCF_0();
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  ActivityHostViewController.sceneDidDeactivate(_:withError:)(v6, a4);
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ActivityHostViewController.sceneContentStateDidChange(_:)(v4);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
  sub_23C975BB4();
  int64_t v6 = sub_23C9910E0();
  id v7 = a3;
  id v8 = self;
  ActivityHostViewController.scene(_:didReceive:)((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_23C97643C((uint64_t)v11, a6);
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23C976654(sub_23C9679D8, "[%{public}s] sceneLayerManagerDidUpdateLayers");
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23C976654((void (*)(void))sub_23C9681C4, "[%{public}s] sceneLayerManagerDidStopTrackingLayers");
}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23C976654(sub_23C9679D8, "[%{public}s] sceneLayerManagerDidStartTrackingLayers");
}

@end
@interface ARView
+ (Class)layerClass;
- (ARSession)session;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)handleTapForEntityAccessibilityWrapper:(id)a3;
- (CALayer)renderLayer;
- (NSArray)entityAccessibilityWrappers;
- (_TtC10RealityKit6ARView)initWithCoder:(id)a3;
- (_TtC10RealityKit6ARView)initWithFrame:(CGRect)a3;
- (double)contentScaleFactor;
- (float)distanceInMetersFromEntityAccessibilityWrapper:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)handleRotation:(id)a3;
- (void)handleScale:(id)a3;
- (void)handleSingleTapWithRecognizer:(id)a3;
- (void)handleTranslation:(id)a3;
- (void)layoutSubviews;
- (void)restartEngineWithNotification:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setSession:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)willResignActiveWithNotification:(id)a3;
- (void)windowDidRotateWithNotification:(id)a3;
- (void)windowWillAnimateRotationWithNotification:(id)a3;
- (void)windowWillRotateWithNotification:(id)a3;
@end

@implementation ARView

- (void)didMoveToWindow
{
  v2 = self;
  ARView.didMoveToWindow()();
}

- (void)windowWillRotateWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  ARView.windowWillRotate(notification:)((NSNotification)v4);
}

- (void)windowWillAnimateRotationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized ARView.windowWillAnimateRotation(notification:)();
}

- (void)windowDidRotateWithNotification:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC10RealityKit6ARView___disableCounterRotation;
  swift_beginAccess();
  if ((*v4 & 1) == 0
    && (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_viewCounterRotating) & 1) != 0)
  {
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_viewCounterRotating) = 0;
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_updateAfterCounterRotation) = 1;
  }
}

- (_TtC10RealityKit6ARView)initWithCoder:(id)a3
{
  return (_TtC10RealityKit6ARView *)ARView.init(coder:)(a3);
}

- (_TtC10RealityKit6ARView)initWithFrame:(CGRect)a3
{
  return (_TtC10RealityKit6ARView *)ARView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v2 = self;
  ARView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  outlined destroy of weak __ARViewDelegatePrivate?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView___delegatePrivate);
  outlined consume of ARView.Environment.Background.Value(*(void **)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR____TtC10RealityKit6ARView_environment), *((unsigned char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC10RealityKit6ARView_environment));
  swift_release();
  swift_release();

  swift_release();
  outlined destroy of CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView_updateSubscription, &demangling cache variable for type metadata for Cancellable?);
  outlined destroy of CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?((uint64_t)self + OBJC_IVAR____TtC10RealityKit6ARView_renderSubscription, &demangling cache variable for type metadata for Cancellable?);
  swift_release();

  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  uint64_t v4 = *(uint64_t *)((char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  uint64_t v5 = *(uint64_t *)((char *)&self->super._subviewCache + OBJC_IVAR____TtC10RealityKit6ARView_sessionComponents);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of (@escaping @callee_guaranteed (@guaranteed Set<ARReferenceImage>) -> ())?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Set<ARReferenceImage>) -> ())?(v5);
  v6 = (char *)self + OBJC_IVAR____TtC10RealityKit6ARView_antialiasingMode;
  uint64_t v7 = type metadata accessor for AntialiasingMode();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

- (NSArray)entityAccessibilityWrappers
{
  v2 = self;
  ARView.entityAccessibilityWrappers.getter();

  type metadata accessor for __EntityAccessibilityWrapper();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (float)distanceInMetersFromEntityAccessibilityWrapper:(id)a3
{
  if (!swift_weakLoadStrong()) {
    return 0.0;
  }
  id v5 = a3;
  v6 = self;
  ARView.__distanceInMetersFromEntity(_:)();
  float v8 = v7;

  swift_release();
  return v8;
}

- (BOOL)handleTapForEntityAccessibilityWrapper:(id)a3
{
  if (swift_weakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    uint64_t v7 = swift_retain();
    ARView.handleTapForEntity(_:shouldNotifyDelegateAlways:)(v7, 0);
    char v9 = v8;

    swift_release_n();
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

+ (Class)layerClass
{
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for CALayer);

  return (Class)swift_getObjCClassFromMetadata();
}

- (CALayer)renderLayer
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10RealityKit6ARView_renderView), sel_layer);

  return (CALayer *)v2;
}

- (double)contentScaleFactor
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ARView();
  [(ARView *)&v3 contentScaleFactor];
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ARView();
  id v4 = v10.receiver;
  [(ARView *)&v10 setContentScaleFactor:a3];
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC10RealityKit6ARView_initialized) == 1)
  {
    objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
    double v6 = v5;
    double v8 = v7;
    objc_msgSend(v4, sel_contentScaleFactor);
    ARView.resizeDrawable(size:scaleFactor:)(v6, v8, v9);
  }
}

- (void)willResignActiveWithNotification:(id)a3
{
  id v4 = a3;
  double v5 = self;
  specialized ARView.willResignActive(notification:)();
}

- (void)restartEngineWithNotification:(id)a3
{
  id v4 = a3;
  double v5 = self;
  specialized ARView.restartEngine(notification:)();
}

- (void)didMoveToSuperview
{
  id v2 = self;
  ARView.didMoveToSuperview()();
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ARView();
  id v2 = v8.receiver;
  [(ARView *)&v8 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(v2, sel_contentScaleFactor);
  ARView.resizeDrawable(size:scaleFactor:)(v4, v6, v7);
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
}

- (ARSession)session
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit6ARView_arSystem);
  if (v2) {
    return (ARSession *)*(id *)(v2 + OBJC_IVAR____TtC10RealityKit10RKARSystem_session);
  }
  __break(1u);
  return self;
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  double v5 = self;
  ARView.session.setter(v4);
}

- (void)handleTranslation:(id)a3
{
  id v4 = a3;
  double v5 = self;
  specialized ARView.handleTranslation(_:)(v4);
}

- (void)handleRotation:(id)a3
{
  id v4 = a3;
  double v5 = self;
  specialized ARView.handleRotation(_:)(v4);
}

- (void)handleScale:(id)a3
{
  id v4 = a3;
  double v5 = self;
  specialized ARView.handleScale(_:)(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = specialized ARView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UIGestureRecognizer *)a3;
  id v7 = a4;
  objc_super v8 = self;
  Swift::Bool v9 = ARView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (void)handleSingleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  id v7 = self;
  objc_msgSend(v4, sel_locationInView_, v7);
  ARView.handleTapAtPoint(point:)((CGPoint)__PAIR128__(v6, v5));
}

@end
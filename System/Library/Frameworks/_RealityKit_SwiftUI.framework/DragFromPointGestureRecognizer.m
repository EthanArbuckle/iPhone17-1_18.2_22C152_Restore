@interface DragFromPointGestureRecognizer
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)onPanInternal:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DragFromPointGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  v2 = self;
  DragFromPointGestureRecognizer.reset()();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  DragFromPointGestureRecognizer.gestureRecognizerShouldBegin(_:)(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)onPanInternal:(id)a3
{
  v3 = (double *)((char *)self
                + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_startPoint);
  if ((*((unsigned char *)&self->super.super._gestureFlags
        + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_startPoint
        + 8) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    double v6 = *v3;
    double v5 = v3[1];
    v7 = *(void (**)(double, double, double, double))((char *)&self->super.super.super.isa
                                                               + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer_onPan);
    id v8 = a3;
    v14 = self;
    id v9 = [(DragFromPointGestureRecognizer *)v14 view];
    objc_msgSend(v8, sel_locationInView_, v9);
    double v11 = v10;
    double v13 = v12;

    v7(v6, v5, v11, v13);
  }
}

- (_TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUIP33_775A7FE6C6FA1F309878473FBDD2537430DragFromPointGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  swift_release();
}

- (_TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUIP33_4ABB148B5599ED86F84C6943D86F570D30DragFromPointGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
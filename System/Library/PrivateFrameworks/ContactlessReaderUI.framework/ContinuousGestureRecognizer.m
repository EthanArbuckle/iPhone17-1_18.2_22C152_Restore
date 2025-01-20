@interface ContinuousGestureRecognizer
- (_TtC19ContactlessReaderUI27ContinuousGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ContinuousGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_23EDDD6CC(0, (unint64_t *)&qword_268C21B00);
  sub_23EDDD708();
  uint64_t v6 = sub_23EF05718();
  id v7 = a4;
  v8 = self;
  id v9 = [(ContinuousGestureRecognizer *)v8 view];
  sub_23EEA874C(v6, (uint64_t)v9);

  id v10 = [(ContinuousGestureRecognizer *)v8 view];
  sub_23EE1ADD0();

  [(ContinuousGestureRecognizer *)v8 setState:1];
  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v8 = self;
  id v6 = [(ContinuousGestureRecognizer *)v8 view];
  sub_23EEA8EE8();

  id v7 = [(ContinuousGestureRecognizer *)v8 view];
  sub_23EE1B8A4();

  [(ContinuousGestureRecognizer *)v8 setState:4];
}

- (_TtC19ContactlessReaderUI27ContinuousGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_23EF05A48();
    swift_unknownObjectRelease();
  }
  result = (_TtC19ContactlessReaderUI27ContinuousGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19ContactlessReaderUI27ContinuousGestureRecognizer_gestureView);
}

@end
@interface ChartDragGestureRecognizer
- (_TtC6Charts26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ChartDragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_21F7B3F58();
  sub_21F7B3F98();
  int64_t v6 = sub_21FA25FC0();
  id v7 = a4;
  v8 = self;
  sub_21F7B0824(v6, (uint64_t)v7);

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
}

- (void)reset
{
  v2 = self;
  sub_21F7B1890();
}

- (_TtC6Charts26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_21FA263F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC6Charts26ChartDragGestureRecognizer *)sub_21F7B1A48((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6Charts26ChartDragGestureRecognizer_initialFirstTouch));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6Charts26ChartDragGestureRecognizer_initialSecondTouch));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Charts26ChartDragGestureRecognizer_timer);
}

@end
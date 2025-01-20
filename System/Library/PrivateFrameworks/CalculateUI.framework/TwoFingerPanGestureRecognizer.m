@interface TwoFingerPanGestureRecognizer
- (_TtC11CalculateUI29TwoFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TwoFingerPanGestureRecognizer

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_249657F48();
  sub_249657F88();
  uint64_t v6 = sub_2496A05C8();
  id v7 = a4;
  v8 = self;
  sub_2496572B4(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_249657F48();
  sub_249657F88();
  uint64_t v6 = sub_2496A05C8();
  id v7 = a4;
  v8 = self;
  sub_249657428(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC11CalculateUI29TwoFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_2496A0728();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC11CalculateUI29TwoFingerPanGestureRecognizer *)sub_249657604((uint64_t)v6, (uint64_t)a4);
}

@end
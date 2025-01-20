@interface NonMovableTapGestureRecognizer
- (_TtC19VolumeLimitSettings30NonMovableTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NonMovableTapGestureRecognizer

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (_TtC19VolumeLimitSettings30NonMovableTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_CE98();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC19VolumeLimitSettings30NonMovableTapGestureRecognizer *)sub_2D14((uint64_t)v6, (uint64_t)a4);
}

@end
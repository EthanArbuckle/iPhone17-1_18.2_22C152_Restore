@interface PKLongPressGestureRecognizer
- (PKLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKLongPressGestureRecognizer

- (PKLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (PKLongPressGestureRecognizer *)PKLongPressGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void)reset
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PKLongPressGestureRecognizer_pressStartLocations) = (Class)MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v7 = self;
  if ([(PKLongPressGestureRecognizer *)v7 state] == (id)2) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 5;
  }
  [(PKLongPressGestureRecognizer *)v7 setState:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v7 = self;
  if ([(PKLongPressGestureRecognizer *)v7 state] == (id)2) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  [(PKLongPressGestureRecognizer *)v7 setState:v6];
}

- (void).cxx_destruct
{
}

@end
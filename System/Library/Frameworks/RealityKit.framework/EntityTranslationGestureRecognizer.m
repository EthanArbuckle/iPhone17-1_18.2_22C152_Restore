@interface EntityTranslationGestureRecognizer
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_TtC10RealityKit34EntityTranslationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation EntityTranslationGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  specialized EntityTranslationGestureRecognizer.touchesMoved(_:with:)();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  id v5 = self;
  LOBYTE(self) = EntityTranslationGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (_TtC10RealityKit34EntityTranslationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtC10RealityKit34EntityTranslationGestureRecognizer *)EntityTranslationGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
}

@end
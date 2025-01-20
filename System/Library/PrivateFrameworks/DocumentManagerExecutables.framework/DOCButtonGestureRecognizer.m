@interface DOCButtonGestureRecognizer
- (_TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DOCButtonGestureRecognizer

- (_TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_22BE934B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer *)DOCButtonGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
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
  sub_22BE345F8();
  sub_22BE34638();
  uint64_t v6 = sub_22BE93048();
  swift_beginAccess();
  id v7 = a4;
  v8 = self;
  sub_22BE34FAC(v6);
  swift_endAccess();
  v9 = (void *)sub_22BE93038();
  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for DOCButtonGestureRecognizer();
  [(DOCButtonGestureRecognizer *)&v10 touchesCancelled:v9 withEvent:v7];

  [(DOCButtonGestureRecognizer *)v8 setState:4];
  swift_bridgeObjectRelease();
}

- (void)reset
{
  v2 = self;
  sub_22BE34B7C();
}

@end
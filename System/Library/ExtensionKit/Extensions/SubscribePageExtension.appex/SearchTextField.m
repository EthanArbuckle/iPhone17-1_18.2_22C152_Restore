@interface SearchTextField
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)resignFirstResponder;
- (UIFont)font;
- (_TtC22SubscribePageExtension15SearchTextField)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension15SearchTextField)initWithFrame:(CGRect)a3;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)didTapWithSender:(id)a3;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
@end

@implementation SearchTextField

- (_TtC22SubscribePageExtension15SearchTextField)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15SearchTextField *)sub_1001D39C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension15SearchTextField)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D55A8();
}

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(SearchTextField *)&v4 font];

  return v2;
}

- (void)setFont:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  [(SearchTextField *)&v11 setFont:v6];
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_ghostHintLabel);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = [(SearchTextField *)&v10 font];
  [v8 setFont:v9];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001D468C();
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_1001D4934();

  return v3 & 1;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_1001D4A1C(x, y);
}

- (void)didTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001D569C();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1001D4BB0((uint64_t)v4);

  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_ghostHintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_highlightView));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_interceptingTapGesture);
}

@end
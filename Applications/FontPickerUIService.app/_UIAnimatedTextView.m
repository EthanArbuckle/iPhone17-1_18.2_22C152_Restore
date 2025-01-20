@interface _UIAnimatedTextView
- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithCoder:(id)a3;
- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIAnimatedTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[_UIAnimatedTextView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_10000A3AC(0, &qword_1000A9008);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = static NSObject.== infix(_:_:)();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView_shouldAnimate) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  return -[_UIAnimatedTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView_shouldAnimate) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  return [(_UIAnimatedTextView *)&v5 initWithCoder:a3];
}

@end
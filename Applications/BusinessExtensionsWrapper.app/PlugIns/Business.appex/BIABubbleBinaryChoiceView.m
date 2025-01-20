@interface BIABubbleBinaryChoiceView
- (_TtC8Business25BIABubbleBinaryChoiceView)initWithCoder:(id)a3;
- (_TtC8Business25BIABubbleBinaryChoiceView)initWithFrame:(CGRect)a3;
- (void)handleLeftButtonTap;
- (void)handleRightButtonTap;
@end

@implementation BIABubbleBinaryChoiceView

- (_TtC8Business25BIABubbleBinaryChoiceView)initWithFrame:(CGRect)a3
{
  return (_TtC8Business25BIABubbleBinaryChoiceView *)sub_10005A534(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8Business25BIABubbleBinaryChoiceView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_delegate);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8Business25BIABubbleBinaryChoiceView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)handleLeftButtonTap
{
}

- (void)handleRightButtonTap
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_rightButton));

  swift_unknownObjectRelease();
}

@end
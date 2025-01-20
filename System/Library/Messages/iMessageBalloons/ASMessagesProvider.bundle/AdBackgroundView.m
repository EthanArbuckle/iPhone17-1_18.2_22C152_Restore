@interface AdBackgroundView
- (_TtC18ASMessagesProvider16AdBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider16AdBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation AdBackgroundView

- (_TtC18ASMessagesProvider16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider16AdBackgroundView *)sub_31E4AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider16AdBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider16AdBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider16AdBackgroundView *)sub_77EB20();
  __break(1u);
  return result;
}

@end
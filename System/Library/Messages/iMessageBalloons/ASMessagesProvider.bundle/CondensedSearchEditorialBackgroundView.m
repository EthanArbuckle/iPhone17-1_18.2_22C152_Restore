@interface CondensedSearchEditorialBackgroundView
- (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedSearchEditorialBackgroundView

- (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView *)sub_3E0BB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider38CondensedSearchEditorialBackgroundView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_3E0E34(a3);
}

@end
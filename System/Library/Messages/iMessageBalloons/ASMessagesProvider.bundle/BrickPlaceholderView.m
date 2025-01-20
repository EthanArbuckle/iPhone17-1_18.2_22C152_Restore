@interface BrickPlaceholderView
- (_TtC18ASMessagesProvider20BrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider20BrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrickPlaceholderView

- (_TtC18ASMessagesProvider20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider20BrickPlaceholderView *)sub_652D98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_653318();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_652F04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20BrickPlaceholderView_artworkPlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider20BrickPlaceholderView_supplementaryTextPlaceholder);
}

@end
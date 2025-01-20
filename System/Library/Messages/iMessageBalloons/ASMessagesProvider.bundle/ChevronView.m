@interface ChevronView
- (_TtC18ASMessagesProvider11ChevronView)init;
- (_TtC18ASMessagesProvider11ChevronView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider11ChevronView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation ChevronView

- (_TtC18ASMessagesProvider11ChevronView)init
{
  return (_TtC18ASMessagesProvider11ChevronView *)sub_3C2608();
}

- (_TtC18ASMessagesProvider11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider11ChevronView *)sub_3C2734(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider11ChevronView)initWithCoder:(id)a3
{
  return (_TtC18ASMessagesProvider11ChevronView *)sub_3C2880(a3);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  id v2 = v3.receiver;
  [(ChevronView *)&v3 didMoveToWindow];
  sub_3C2B98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider11ChevronView_chevronImageView));
}

@end
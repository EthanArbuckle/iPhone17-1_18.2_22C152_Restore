@interface ChevronView
- (_TtC22SubscribePageExtension11ChevronView)init;
- (_TtC22SubscribePageExtension11ChevronView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension11ChevronView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation ChevronView

- (_TtC22SubscribePageExtension11ChevronView)init
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_1006456E0();
}

- (_TtC22SubscribePageExtension11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_10064580C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension11ChevronView)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension11ChevronView *)sub_100645958(a3);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  id v2 = v3.receiver;
  [(ChevronView *)&v3 didMoveToWindow];
  sub_100645C70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11ChevronView_chevronImageView));
}

@end
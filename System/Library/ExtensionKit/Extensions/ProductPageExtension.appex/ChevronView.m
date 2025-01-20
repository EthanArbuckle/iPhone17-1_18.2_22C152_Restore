@interface ChevronView
- (_TtC20ProductPageExtension11ChevronView)init;
- (_TtC20ProductPageExtension11ChevronView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension11ChevronView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation ChevronView

- (_TtC20ProductPageExtension11ChevronView)init
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10054E9C0();
}

- (_TtC20ProductPageExtension11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10054EAEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension11ChevronView)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension11ChevronView *)sub_10054EC38(a3);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  id v2 = v3.receiver;
  [(ChevronView *)&v3 didMoveToWindow];
  sub_10054EF50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11ChevronView_chevronImageView));
}

@end
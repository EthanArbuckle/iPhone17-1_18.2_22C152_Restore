@interface InteractiveSectionBackgroundView
- (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveSectionBackgroundView

- (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView *)sub_2663D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC18ASMessagesProvider32InteractiveSectionBackgroundView *)sub_26888C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2666DC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2667E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_95C9F0);
}

@end
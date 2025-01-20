@interface BIABubbleView
- (_TtC8Business13BIABubbleView)initWithCoder:(id)a3;
- (_TtC8Business13BIABubbleView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation BIABubbleView

- (void)dealloc
{
  v2 = self;
  sub_100063090();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10000FBD8((uint64_t)self + OBJC_IVAR____TtC8Business13BIABubbleView_viewModel, &qword_1000FD6C0);
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business13BIABubbleView_context);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13BIABubbleView_titleAndSubtitleView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13BIABubbleView_optionsViewController));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC8Business13BIABubbleView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_delegate);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8Business13BIABubbleView_viewModel;
  uint64_t v7 = type metadata accessor for BIABubbleViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_bubbleConstraints) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_wasSizeRequested) = 0;
  id v8 = a3;

  result = (_TtC8Business13BIABubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business13BIABubbleView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business13BIABubbleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
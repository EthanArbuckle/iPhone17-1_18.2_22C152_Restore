@interface CKTranscriptionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7ChatKit19CKTranscriptionView)initWithCoder:(id)a3;
- (_TtC7ChatKit19CKTranscriptionView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)didToggleLineCountChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation CKTranscriptionView

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_textView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC7ChatKit19CKTranscriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit19CKTranscriptionView *)sub_18F534AC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit19CKTranscriptionView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit19CKTranscriptionView *)sub_18F534C78(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F535A00();
}

- (void)didToggleLineCountChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F536620();
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CKTranscriptionView();
  [(CKTranscriptionView *)&v2 didMoveToSuperview];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_expansionButton));
  sub_18EF6E880(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_didTapExpansionButton));
  sub_18EF6E880(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_didResize));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_collapsedButtonColor));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit19CKTranscriptionView_expandedButtonColor);
}

@end
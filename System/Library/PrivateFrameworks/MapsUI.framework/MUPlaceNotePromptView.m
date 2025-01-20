@interface MUPlaceNotePromptView
- (_TtC6MapsUI21MUPlaceNotePromptView)initWithCoder:(id)a3;
- (_TtC6MapsUI21MUPlaceNotePromptView)initWithFrame:(CGRect)a3;
- (void)handleTapWithGestureRecognizer:(id)a3;
@end

@implementation MUPlaceNotePromptView

- (_TtC6MapsUI21MUPlaceNotePromptView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___topLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___bottomLabel) = 0;
  id v5 = a3;

  result = (_TtC6MapsUI21MUPlaceNotePromptView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
}

- (_TtC6MapsUI21MUPlaceNotePromptView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView_userInfoProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___topLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6MapsUI21MUPlaceNotePromptView____lazy_storage___bottomLabel);
}

@end
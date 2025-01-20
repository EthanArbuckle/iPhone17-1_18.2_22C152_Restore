@interface MUPlaceNoteContentView
- (_TtC6MapsUI22MUPlaceNoteContentView)initWithCoder:(id)a3;
- (_TtC6MapsUI22MUPlaceNoteContentView)initWithFrame:(CGRect)a3;
- (void)handleTapWithGestureRecognizer:(id)a3;
@end

@implementation MUPlaceNoteContentView

- (_TtC6MapsUI22MUPlaceNoteContentView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22MUPlaceNoteContentView____lazy_storage___topLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22MUPlaceNoteContentView____lazy_storage___iconView) = 0;
  id v5 = a3;

  result = (_TtC6MapsUI22MUPlaceNoteContentView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
}

- (_TtC6MapsUI22MUPlaceNoteContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI22MUPlaceNoteContentView_userInfoProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI22MUPlaceNoteContentView____lazy_storage___topLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6MapsUI22MUPlaceNoteContentView____lazy_storage___iconView);
}

@end
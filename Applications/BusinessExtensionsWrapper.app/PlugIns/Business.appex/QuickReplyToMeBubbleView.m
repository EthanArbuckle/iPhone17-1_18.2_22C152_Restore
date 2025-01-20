@interface QuickReplyToMeBubbleView
- (_TtC8Business24QuickReplyToMeBubbleView)initWithCoder:(id)a3;
- (_TtC8Business24QuickReplyToMeBubbleView)initWithFrame:(CGRect)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation QuickReplyToMeBubbleView

- (_TtC8Business24QuickReplyToMeBubbleView)initWithCoder:(id)a3
{
  *(void *)&self->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8Business24QuickReplyToMeBubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)tapGestureRecognized:(id)a3
{
  v4 = (_TtC8Business24QuickReplyToMeBubbleView *)a3;
  id v5 = self;
  v6 = (_TtC8Business24QuickReplyToMeBubbleView *)[(QuickReplyToMeBubbleView *)v4 view];
  if (v6)
  {
    v9 = v6;
    type metadata accessor for QuickReplyItemButton();
    v7 = (void *)swift_dynamicCastClass();
    if (v7)
    {
      id v8 = [v7 tag];
      (*(void (**)(void, void, void, id))((char *)&v5->super.super.super.isa
                                                         + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_onItemSelected))(*(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model), *(void *)&v5->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model], v5->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model + 8], v8);
    }

    v4 = v5;
  }
  else
  {
    v9 = v5;
  }
}

- (_TtC8Business24QuickReplyToMeBubbleView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business24QuickReplyToMeBubbleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_delegate;

  sub_100010D28((uint64_t)v3);
}

@end
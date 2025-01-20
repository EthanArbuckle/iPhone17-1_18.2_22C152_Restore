@interface CKTapbackAttributionView
- (CGSize)estimatedAttributionViewDismissalSizeForAnimationController:(id)a3;
- (CKMessagePartChatItem)messagePartChatItem;
- (_TtC7ChatKit24CKTapbackAttributionView)initWithCoder:(id)a3;
- (_TtC7ChatKit24CKTapbackAttributionView)initWithFrame:(CGRect)a3;
- (_TtC7ChatKit24CKTapbackAttributionView)initWithMessagePartChatItem:(id)a3;
- (_TtP7ChatKit32CKTapbackAttributionViewDelegate_)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dismiss;
- (void)layoutSubviews;
- (void)present;
- (void)setDelegate:(id)a3;
- (void)tapbackAttributionViewModel:(id)a3 didTapToSaveSticker:(id)a4;
@end

@implementation CKTapbackAttributionView

- (CKMessagePartChatItem)messagePartChatItem
{
  return (CKMessagePartChatItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_messagePartChatItem));
}

- (_TtP7ChatKit32CKTapbackAttributionViewDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP7ChatKit32CKTapbackAttributionViewDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithMessagePartChatItem:(id)a3
{
  return (_TtC7ChatKit24CKTapbackAttributionView *)CKTapbackAttributionView.init(messagePartChatItem:)(a3);
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView) = 0;
  id v4 = a3;

  result = (_TtC7ChatKit24CKTapbackAttributionView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F7671AC();
}

- (void)present
{
}

- (void)dismiss
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_18F76765C((uint64_t)a4, x, y);

  return v10;
}

- (_TtC7ChatKit24CKTapbackAttributionView)initWithFrame:(CGRect)a3
{
  result = (_TtC7ChatKit24CKTapbackAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_messagePartChatItem));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_transitionController);
}

- (void)tapbackAttributionViewModel:(id)a3 didTapToSaveSticker:(id)a4
{
  v6 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  if (*v6) {
    objc_msgSend(*v6, sel_tapbackAttributionView_didTapToSaveSticker_, self, a4);
  }
}

- (CGSize)estimatedAttributionViewDismissalSizeForAnimationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F767ED8();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
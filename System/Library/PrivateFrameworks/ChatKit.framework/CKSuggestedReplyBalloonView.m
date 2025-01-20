@interface CKSuggestedReplyBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithCoder:(id)a3;
- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithFrame:(CGRect)a3;
- (void)configureForMessagePart:(id)a3;
@end

@implementation CKSuggestedReplyBalloonView

- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CKSuggestedReplyBalloonView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit27CKSuggestedReplyBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_preferredBalloonSize);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7ChatKit27CKSuggestedReplyBalloonView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = self;
  sub_18F6968CC(width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)configureForMessagePart:(id)a3
{
  type metadata accessor for CKSuggestedReplyMessagePartChatItem();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    uint64_t v6 = v5;
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for CKSuggestedReplyBalloonView();
    id v7 = a3;
    double v8 = self;
    [(CKImageBalloonView *)&v10 configureForMessagePart:v6];
    id v9 = *(id *)(v6 + OBJC_IVAR____TtC7ChatKit35CKSuggestedReplyMessagePartChatItem_suggestedReply);
    sub_18F6964CC(v9);

    [(CKSuggestedReplyBalloonView *)v8 setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKSuggestedReplyBalloonView_view));
}

@end
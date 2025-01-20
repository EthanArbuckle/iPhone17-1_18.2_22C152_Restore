@interface CKSuggestedRepliesBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithCoder:(id)a3;
- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithFrame:(CGRect)a3;
- (void)configureForMessagePart:(id)a3;
- (void)prepareForReuse;
@end

@implementation CKSuggestedRepliesBalloonView

- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CKSuggestedRepliesBalloonView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit29CKSuggestedRepliesBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_preferredBalloonSize);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7ChatKit29CKSuggestedRepliesBalloonView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = self;
  sub_18F4E213C(width, height);
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
  id v4 = a3;
  id v5 = self;
  sub_18F4E1BA0(v4);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKSuggestedRepliesBalloonView();
  v2 = (char *)v6.receiver;
  [(CKImageBalloonView *)&v6 prepareForReuse];
  uint64_t v3 = OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view;
  id v4 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view];
  if (v4)
  {
    objc_msgSend(v4, sel_removeFromSuperview, v6.receiver, v6.super_class);
    id v5 = *(void **)&v2[v3];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&v2[v3] = 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit29CKSuggestedRepliesBalloonView_view));
}

@end
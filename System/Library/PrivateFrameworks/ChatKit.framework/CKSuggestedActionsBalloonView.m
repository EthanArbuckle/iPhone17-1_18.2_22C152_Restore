@interface CKSuggestedActionsBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKSuggestedActionsBalloonView)initWithCoder:(id)a3;
- (CKSuggestedActionsBalloonView)initWithFrame:(CGRect)a3;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)setWithActions:(id)a3 chatBotName:(id)a4;
@end

@implementation CKSuggestedActionsBalloonView

- (CKSuggestedActionsBalloonView)initWithFrame:(CGRect)a3
{
  return (CKSuggestedActionsBalloonView *)sub_18F734AEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKSuggestedActionsBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKSuggestedActionsBalloonView_actions) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v5 = OBJC_IVAR___CKSuggestedActionsBalloonView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F42B38]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR___CKSuggestedActionsBalloonView_subtitleLabel;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F42B38]), sel_init);

  result = (CKSuggestedActionsBalloonView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)setWithActions:(id)a3 chatBotName:(id)a4
{
  sub_18F7B9CE0();
  unint64_t v6 = sub_18F7B99C0();
  if (a4)
  {
    uint64_t v7 = sub_18F7B97E0();
    a4 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v9 = self;
  sub_18F734E70(v6, v7, (unint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = self;
  double v7 = sub_18F7358D0(width, height);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F73547C();
}

- (void)configureForMessagePart:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_18F735658(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKSuggestedActionsBalloonView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___CKSuggestedActionsBalloonView_subtitleLabel);
}

@end
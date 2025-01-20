@interface CKRichCardCarouselBalloonView
- (CKRichCardCarouselBalloonView)initWithCoder:(id)a3;
- (CKRichCardCarouselBalloonView)initWithFrame:(CGRect)a3;
- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4;
- (void)configureForMessagePart:(id)a3;
- (void)openAppFromNotificationExtensionWith:(id)a3;
- (void)prepareForReuse;
@end

@implementation CKRichCardCarouselBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_18F52C10C(a3);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  v2 = (char *)v4.receiver;
  [(CKBalloonView *)&v4 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR___CKRichCardCarouselBalloonView_richCards];
  *(void *)&v2[OBJC_IVAR___CKRichCardCarouselBalloonView_richCards] = 0;
}

- (CKRichCardCarouselBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  return -[CKCarouselBalloonView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (CKRichCardCarouselBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichCardCarouselBalloonView();
  return [(CKCarouselBalloonView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKRichCardCarouselBalloonView_richCards));
}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  v6 = [(CKBalloonView *)v5 delegate];
  if (v6)
  {
    v7 = v6;
    if ([(CKBalloonViewDelegate *)v6 respondsToSelector:sel_didTapChipListFromNotificationExtensionWithBalloonView_])[(CKBalloonViewDelegate *)v7 didTapChipListFromNotificationExtensionWithBalloonView:v5]; {

    }
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_super v8 = [(CKBalloonView *)v7 delegate];
  if (v8)
  {
    v9 = v8;
    if ([(CKBalloonViewDelegate *)v8 respondsToSelector:sel_balloonView_selectedChipAction_])[(CKBalloonViewDelegate *)v9 balloonView:v7 selectedChipAction:v6]; {

    }
    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end
@interface DOCAttributionPillView
- (BOOL)isHighlighted;
- (_TtC14RecentsAvocado22DOCAttributionPillView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado22DOCAttributionPillView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation DOCAttributionPillView

- (_TtC14RecentsAvocado22DOCAttributionPillView)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado22DOCAttributionPillView *)sub_1002E0F30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14RecentsAvocado22DOCAttributionPillView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002E2B3C();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCAttributionPillView();
  return [(DOCAttributionPillView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCAttributionPillView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(DOCAttributionPillView *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(DOCAttributionPillView *)&v8 setHighlighted:v3];
  sub_1002E1208(v7);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3) {
    [(DOCAttributionPillView *)v5 sendActionsForControlEvents:64];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCAttributionPillView();
  v2 = (char *)v4.receiver;
  [(DOCAttributionPillView *)&v4 layoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_backgroundView];
  objc_msgSend(v3, "bounds", v4.receiver, v4.super_class);
  [v3 _setContinuousCornerRadius:CGRectGetHeight(v5) * 0.5];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1002E2CCC();

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView_chevronView));
  sub_10005AC04(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView____lazy_storage___baseFont));
  sub_10005AC04(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView____lazy_storage___senderFont));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado22DOCAttributionPillView____lazy_storage___chevronFont);
  sub_10005AC04(v3);
}

@end
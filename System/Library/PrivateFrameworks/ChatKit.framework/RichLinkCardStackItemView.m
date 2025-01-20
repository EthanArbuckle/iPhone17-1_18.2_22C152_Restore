@interface RichLinkCardStackItemView
- (CGRect)clippingRect;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (NSCopying)userData;
- (_TtC7ChatKit25RichLinkCardStackItemView)initWithCoder:(id)a3;
- (_TtC7ChatKit25RichLinkCardStackItemView)initWithFrame:(CGRect)a3;
- (void)becomeReusable;
- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)openAppFromNotificationExtensionWith:(id)a3;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation RichLinkCardStackItemView

- (CGRect)clippingRect
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  double v3 = *(double *)((char *)&self->super.super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  double v4 = *(double *)((char *)&self->super.super.super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  double v5 = *(double *)((char *)&self->super.super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect) = a3;
}

- (_TtC7ChatKit25RichLinkCardStackItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F538DE4();
}

- (_TtC7ChatKit25RichLinkCardStackItemView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25RichLinkCardStackItemView *)sub_18F536970(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSCopying)userData
{
  double v2 = (void *)swift_unknownObjectRetain();

  return (NSCopying *)v2;
}

- (void)setUserData:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_18F539D0C((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)becomeReusable
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView) = 0;
  double v4 = self;

  id v3 = *(Class *)((char *)&v4->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView);
  *(Class *)((char *)&v4->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView) = 0;

  *((unsigned char *)&v4->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_isStandaloneBalloon) = 0;
}

- (void)configureForMessagePart:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_18F538320(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = self;
  sub_18F539E74(width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_18F538650();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichLinkCardStackItemView();
  double v2 = (char *)v5.receiver;
  [(CKImageBalloonView *)&v5 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView];
  *(void *)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView] = 0;

  double v4 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView];
  *(void *)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView] = 0;

  objc_msgSend(v2, sel_setNeedsLayout, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_actionDelegate);

  swift_unknownObjectRelease();
}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_18F538B80((uint64_t)v4);
}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_18F538CA4((uint64_t)v6, (uint64_t)v7);
}

@end
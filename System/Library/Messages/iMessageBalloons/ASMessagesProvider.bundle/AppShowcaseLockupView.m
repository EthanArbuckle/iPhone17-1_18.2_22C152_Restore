@interface AppShowcaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider21AppShowcaseLockupView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider21AppShowcaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppShowcaseLockupView

- (_TtC18ASMessagesProvider21AppShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider21AppShowcaseLockupView *)sub_67F914(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider21AppShowcaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_683AF8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_68287C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_67DE5C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_offerLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_offerLabelPresenter, (uint64_t *)&unk_951B40);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_crossLinkSubtitleLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider21AppShowcaseLockupView_type;
  uint64_t v4 = sub_76D310();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
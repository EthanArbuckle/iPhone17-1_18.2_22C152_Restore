@interface ProductTitleView
- (_TtC18ASMessagesProvider16ProductTitleView)initWithFrame:(CGRect)a3;
- (void)contentDidChange;
- (void)didTapIcon:(id)a3;
- (void)layoutSubviews;
@end

@implementation ProductTitleView

- (_TtC18ASMessagesProvider16ProductTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider16ProductTitleView *)sub_5C2DA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5C301C();
}

- (void)didTapIcon:(id)a3
{
  v3 = *(void (**)(uint64_t))&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider16ProductTitleView_iconTapHandler];
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_13318((uint64_t)v3);
    v3(v6);
    sub_13308((uint64_t)v3);
  }
}

- (void)contentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProductTitleView();
  id v2 = v3.receiver;
  [(ProductTitleView *)&v3 contentDidChange];
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);
}

- (void).cxx_destruct
{
  sub_13308(*(void *)&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider16ProductTitleView_iconTapHandler]);
  objc_super v3 = *(void **)&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider16ProductTitleView_iconTapGestureRecognizer];
}

@end
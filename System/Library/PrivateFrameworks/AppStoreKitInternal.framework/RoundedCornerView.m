@interface RoundedCornerView
- (_TtC19AppStoreKitInternal17RoundedCornerView)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal17RoundedCornerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundedCornerView

- (_TtC19AppStoreKitInternal17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC19AppStoreKitInternal17RoundedCornerView *)RoundedCornerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19AppStoreKitInternal17RoundedCornerView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19AppStoreKitInternal17RoundedCornerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedCornerView();
  v2 = (char *)v5.receiver;
  [(RoundedCornerView *)&v5 layoutSubviews];
  id v3 = (id *)&v2[OBJC_IVAR____TtC19AppStoreKitInternal17RoundedCornerView_borderView];
  swift_beginAccess();
  if (*v3)
  {
    v4 = (char *)*v3;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedCornerView();
  v4 = v8.receiver;
  id v5 = a3;
  [(RoundedCornerView *)&v8 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_traitCollection, v8.receiver, v8.super_class);
  id v7 = objc_msgSend(v6, sel_userInterfaceStyle);

  if (!v5 || v7 != objc_msgSend(v5, sel_userInterfaceStyle)) {
    (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0xE8))();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal17RoundedCornerView_borderView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal17RoundedCornerView_borderColor);
}

@end
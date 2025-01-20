@interface DynamicTypeTextView
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation DynamicTypeTextView

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithFrame:(CGRect)a3
{
  return (_TtC19AppStoreKitInternal19DynamicTypeTextView *)DynamicTypeTextView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19AppStoreKitInternal19DynamicTypeTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (UIFont)font
{
  return (UIFont *)sub_1E187801C(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1E187A430(a3);
}

- (UIColor)textColor
{
  return (UIColor *)sub_1E187801C(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (void)setTextColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  id v4 = a3;
  v5 = (char *)v8.receiver;
  [(DynamicTypeTextView *)&v8 setTextColor:v4];
  id v6 = objc_msgSend(v5, sel_textColor, v8.receiver, v8.super_class);
  v7 = *(void **)&v5[OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView__cachedTextColor];
  *(void *)&v5[OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView__cachedTextColor] = v6;

  sub_1E1878DE4();
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1E187801C(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  id v4 = a3;
  v5 = v6.receiver;
  [(DynamicTypeTextView *)&v6 setAttributedText:v4];
  if ((v5[OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView_isUpdatingAttributedText] & 1) == 0) {
    sub_1E1878DE4();
  }
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  id v2 = v7.receiver;
  id v3 = [(DynamicTypeTextView *)&v7 text];
  if (v3)
  {
    id v4 = v3;
    sub_1E1D5BE58();

    v5 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    sub_1E1D5BE58();
    id v4 = self;
    v5 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  [(DynamicTypeTextView *)&v7 setText:v5];

  sub_1E1878DE4();
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return [(DynamicTypeTextView *)&v3 textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  char v7 = 0;
  id v4 = *(void (**)(char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.super.isa) + 0x1D0);
  v5 = self;
  v4(&v7);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  [(DynamicTypeTextView *)&v6 setTextAlignment:a3];
}

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC19AppStoreKitInternal19DynamicTypeTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView_fontUseCase, (uint64_t *)&unk_1EBF36650);
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView_contentSizeCategoryMapping));
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView_customTextStyle, &qword_1EAD84FB8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView__cachedFont));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal19DynamicTypeTextView__cachedTextColor);
}

@end
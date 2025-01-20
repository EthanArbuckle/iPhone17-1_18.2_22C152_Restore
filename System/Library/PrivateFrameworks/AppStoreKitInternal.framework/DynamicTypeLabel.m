@interface DynamicTypeLabel
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIFont)font;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)initWithFrame:(CGRect)a3;
- (int64_t)lineSpacing;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setLineSpacing:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation DynamicTypeLabel

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF36650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  char v11 = 0;
  v8 = (_TtC19AppStoreKitInternal16DynamicTypeLabel *)(*(uint64_t (**)(char *, uint64_t, void, uint64_t, void, char *, void, void))(ObjectType + 136))(v5, 2, 0, 1, 0, &v11, 0, 0);
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19AppStoreKitInternal16DynamicTypeLabelC5coderACSgSo7NSCoderC_tcfc_0();
}

- (UIFont)font
{
  return (UIFont *)sub_1E187F6B0(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1E18807D0(a3);
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return [(DynamicTypeLabel *)&v3 textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  v5 = (unsigned __int8 *)self + OBJC_IVAR____TtC19AppStoreKitInternal16DynamicTypeLabel_directionalTextAlignment;
  swift_beginAccess();
  unsigned __int8 v6 = *v5;
  unsigned __int8 *v5 = 0;
  unsigned __int8 v9 = v6;
  uint64_t v7 = self;
  sub_1E187F8F0(&v9);
  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  [(DynamicTypeLabel *)&v8 setTextAlignment:a3];
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  id v2 = v7.receiver;
  objc_super v3 = [(DynamicTypeLabel *)&v7 text];
  if (v3)
  {
    uint64_t v4 = v3;
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
    uint64_t v4 = self;
    v5 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned __int8 v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  [(DynamicTypeLabel *)&v7 setText:v5];

  sub_1E187F03C(1);
}

- (int64_t)lineSpacing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return [(DynamicTypeLabel *)&v3 lineSpacing];
}

- (void)setLineSpacing:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1E187F5B4(a3);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1E187F6B0(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E187F03C(0);
  id v6 = [(DynamicTypeLabel *)v5 lineBreakMode];
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  [(DynamicTypeLabel *)&v7 setAttributedText:v4];
  [(DynamicTypeLabel *)v5 setLineBreakMode:v6];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal16DynamicTypeLabel_fontUseCaseContentSizeCategory));
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal16DynamicTypeLabel_contentSizeCategoryMapping));
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal16DynamicTypeLabel_fontUseCase, (uint64_t *)&unk_1EBF36650);
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal16DynamicTypeLabel_customTextStyle, &qword_1EAD84FB8);
}

@end
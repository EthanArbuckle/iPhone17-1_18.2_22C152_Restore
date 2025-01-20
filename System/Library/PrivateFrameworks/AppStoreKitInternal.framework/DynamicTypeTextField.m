@interface DynamicTypeTextField
- (UIFont)font;
- (_TtC19AppStoreKitInternal20DynamicTypeTextField)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal20DynamicTypeTextField)initWithFrame:(CGRect)a3;
- (int64_t)textAlignment;
- (void)setFont:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeTextField

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  v2 = [(DynamicTypeTextField *)&v4 font];
  return v2;
}

- (void)setFont:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF36650);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for DynamicTypeTextField();
  v12.receiver = self;
  v12.super_class = v8;
  id v9 = a3;
  v10 = self;
  [(DynamicTypeTextField *)&v12 setFont:v9];
  uint64_t v11 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_1E187B664((uint64_t)v7);
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return [(DynamicTypeTextField *)&v3 textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  uint64_t v5 = (unsigned __int8 *)self + OBJC_IVAR____TtC19AppStoreKitInternal20DynamicTypeTextField_directionalTextAlignment;
  swift_beginAccess();
  unsigned __int8 v6 = *v5;
  *uint64_t v5 = 0;
  unsigned __int8 v9 = v6;
  v7 = self;
  sub_1E187BF54(&v9);
  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  [(DynamicTypeTextField *)&v8 setTextAlignment:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_1E187C2B4(a3);
}

- (_TtC19AppStoreKitInternal20DynamicTypeTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal20DynamicTypeTextField_fontUseCase;
  uint64_t v9 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19AppStoreKitInternal20DynamicTypeTextField_directionalTextAlignment) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return -[DynamicTypeTextField initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19AppStoreKitInternal20DynamicTypeTextField)initWithCoder:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal20DynamicTypeTextField_fontUseCase;
  uint64_t v6 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19AppStoreKitInternal20DynamicTypeTextField_directionalTextAlignment) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return [(DynamicTypeTextField *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
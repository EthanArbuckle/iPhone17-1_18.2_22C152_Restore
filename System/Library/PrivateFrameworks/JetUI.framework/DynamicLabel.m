@interface DynamicLabel
- (UIFont)font;
- (_TtC5JetUI12DynamicLabel)initWithCoder:(id)a3;
- (_TtC5JetUI12DynamicLabel)initWithFrame:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicLabel

- (_TtC5JetUI12DynamicLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5JetUI12DynamicLabel_customTextStyle;
  v9 = (objc_class *)type metadata accessor for DynamicLabel();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[DynamicLabel initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  [(DynamicLabel *)v10 setAdjustsFontForContentSizeCategory:1];
  return v10;
}

- (_TtC5JetUI12DynamicLabel)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5JetUI12DynamicLabel_customTextStyle;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC5JetUI12DynamicLabel *)sub_1B086A6C8();
  __break(1u);
  return result;
}

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicLabel();
  v2 = [(DynamicLabel *)&v4 font];

  return v2;
}

- (void)setFont:(id)a3
{
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  objc_super v4 = *(void (**)(_OWORD *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  id v5 = a3;
  v6 = self;
  v4(v8);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for DynamicLabel();
  [(DynamicLabel *)&v7 setFont:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1B07EAB34(a3);
}

- (void).cxx_destruct
{
}

@end
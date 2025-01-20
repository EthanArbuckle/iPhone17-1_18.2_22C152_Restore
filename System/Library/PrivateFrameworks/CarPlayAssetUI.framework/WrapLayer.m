@interface WrapLayer
- (CGRect)bounds;
- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)init;
- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithCoder:(id)a3;
- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation WrapLayer

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for WrapLayer();
  [(WrapLayer *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WrapLayer();
  id v7 = v8.receiver;
  -[WrapLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
  sub_2498B0B20();
}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WrapLayer();
  return [(WrapLayer *)&v3 init];
}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_249AED968();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_2Tm(v8, v8[3]);
  uint64_t v4 = sub_249AEE0C8();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WrapLayer();
  double v5 = [(WrapLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v8);
  return v5;
}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WrapLayer();
  return [(WrapLayer *)&v5 initWithCoder:a3];
}

@end
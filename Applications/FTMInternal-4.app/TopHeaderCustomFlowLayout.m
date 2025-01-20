@interface TopHeaderCustomFlowLayout
- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)init;
- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
@end

@implementation TopHeaderCustomFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  unint64_t v8 = sub_1001A9C30(x, y, width, height);

  if (v8)
  {
    sub_1001AA084();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TopHeaderCustomFlowLayout();
  return [(TopHeaderCustomFlowLayout *)&v3 init];
}

- (_TtC13FTMInternal_425TopHeaderCustomFlowLayout)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TopHeaderCustomFlowLayout();
  return [(TopHeaderCustomFlowLayout *)&v5 initWithCoder:a3];
}

@end
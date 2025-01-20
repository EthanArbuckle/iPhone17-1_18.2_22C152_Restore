@interface DOCColumnLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC18DocumentAppIntentsP33_A65A18D3D43A08CFBAFF8A884318A3F215DOCColumnLayout)init;
- (_TtC18DocumentAppIntentsP33_A65A18D3D43A08CFBAFF8A884318A3F215DOCColumnLayout)initWithCoder:(id)a3;
@end

@implementation DOCColumnLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  char v8 = sub_1001CA9E4(x, y, width, height);

  return v8 & 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC18DocumentAppIntentsP33_A65A18D3D43A08CFBAFF8A884318A3F215DOCColumnLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCColumnLayout();
  return [(DOCColumnLayout *)&v3 init];
}

- (_TtC18DocumentAppIntentsP33_A65A18D3D43A08CFBAFF8A884318A3F215DOCColumnLayout)initWithCoder:(id)a3
{
  return (_TtC18DocumentAppIntentsP33_A65A18D3D43A08CFBAFF8A884318A3F215DOCColumnLayout *)sub_1001CAC44(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnLayout);
}

@end
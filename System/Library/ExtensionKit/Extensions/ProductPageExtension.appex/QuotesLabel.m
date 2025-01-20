@interface QuotesLabel
- (_TtC20ProductPageExtensionP33_6C7030BB687A0F942FC45A4D1FC3F9AD11QuotesLabel)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_6C7030BB687A0F942FC45A4D1FC3F9AD11QuotesLabel)initWithFrame:(CGRect)a3;
@end

@implementation QuotesLabel

- (_TtC20ProductPageExtensionP33_6C7030BB687A0F942FC45A4D1FC3F9AD11QuotesLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for QuotesLabel();
  return -[QuotesLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtensionP33_6C7030BB687A0F942FC45A4D1FC3F9AD11QuotesLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuotesLabel();
  return [(QuotesLabel *)&v5 initWithCoder:a3];
}

@end
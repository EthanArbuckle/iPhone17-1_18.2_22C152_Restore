@interface SpacerSupplementary
- (_TtC19AppStoreKitInternal19SpacerSupplementary)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal19SpacerSupplementary)initWithFrame:(CGRect)a3;
@end

@implementation SpacerSupplementary

- (_TtC19AppStoreKitInternal19SpacerSupplementary)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpacerSupplementary();
  return -[SpacerSupplementary initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19AppStoreKitInternal19SpacerSupplementary)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpacerSupplementary();
  return [(SpacerSupplementary *)&v5 initWithCoder:a3];
}

@end
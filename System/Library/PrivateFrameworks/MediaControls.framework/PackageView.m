@interface PackageView
- (_TtC13MediaControls11PackageView)initWithCoder:(id)a3;
- (_TtC13MediaControls11PackageView)initWithFrame:(CGRect)a3;
@end

@implementation PackageView

- (_TtC13MediaControls11PackageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC13MediaControls11PackageView_asset;
  sub_1AE8E0684(v11);
  sub_1AE8E06A0((uint64_t)v11, (uint64_t)v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PackageView();
  return -[PackageView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13MediaControls11PackageView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC13MediaControls11PackageView_asset;
  sub_1AE8E0684(v8);
  sub_1AE8E06A0((uint64_t)v8, (uint64_t)v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PackageView();
  return [(PackageView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AE8E06A0((uint64_t)self + OBJC_IVAR____TtC13MediaControls11PackageView_asset, (uint64_t)v2);
  sub_1AE8E0844(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AE8D33A0);
}

@end
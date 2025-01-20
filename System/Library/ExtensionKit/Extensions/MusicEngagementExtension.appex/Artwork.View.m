@interface Artwork.View
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV11MusicCoreUI7Artwork4View)initWithCoder:(id)a3;
- (_TtCV11MusicCoreUI7Artwork4View)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation Artwork.View

- (_TtCV11MusicCoreUI7Artwork4View)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized Artwork.View.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  Artwork.View.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  id v3 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess();
  v4 = &v3[*(int *)(type metadata accessor for Artwork(0) + 32)];
  if (v4[8] == 2 && v4[24] == 2)
  {
    double v5 = *((double *)v4 + 2);
    double v6 = *(double *)v4;
    v7 = self;
    double v8 = v6;
    double v9 = v5;
  }
  else
  {
    v10 = self;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  double v11 = Artwork.View.fittingImageSize(in:)(v8, v9);
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess();
  v7 = &v6[*(int *)(type metadata accessor for Artwork(0) + 32)];
  uint64_t v8 = v7[8];
  if (v8 == 255)
  {
    double v9 = self;
    double v10 = Artwork.View.fittingImageSize(in:)(width, height);
    double v12 = v11;
  }
  else
  {
    uint64_t v13 = *((void *)v7 + 2);
    uint64_t v14 = *(void *)v7;
    char v15 = v7[24];
    v16 = self;
    Artwork.Size.Dimension.value(in:)(width, height, v14, v8);
    double v10 = v17;
    Artwork.Size.Dimension.value(in:)(width, height, v13, v15);
    double v12 = v18;
  }
  double v19 = v10;
  double v20 = v12;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (_TtCV11MusicCoreUI7Artwork4View)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCV11MusicCoreUI7Artwork4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of Artwork((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, type metadata accessor for Artwork);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_imageDidChangeHandler));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_placeholderView);
}

@end
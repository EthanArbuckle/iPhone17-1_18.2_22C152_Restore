@interface ArcadeWelcomeItemView
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20ProductPageExtension21ArcadeWelcomeItemView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21ArcadeWelcomeItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArcadeWelcomeItemView

- (_TtC20ProductPageExtension21ArcadeWelcomeItemView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21ArcadeWelcomeItemView *)sub_1002FC470(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21ArcadeWelcomeItemView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_artwork) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_artworkLoader) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_shouldUpdateArtwork) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension21ArcadeWelcomeItemView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(ArcadeWelcomeItemView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1002FC930(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1002FCA44();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  double v9 = sub_1002FD200((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1002FD734((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomeItemView_artworkView));
  swift_release();

  swift_release();
}

@end
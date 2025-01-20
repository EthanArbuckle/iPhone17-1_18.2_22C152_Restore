@interface RevealingImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (_TtC20ProductPageExtension18RevealingImageView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18RevealingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingImageView

- (_TtC20ProductPageExtension18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18RevealingImageView *)sub_1003AB468(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18RevealingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003AC3EC();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingImageView();
  id v2 = v3.receiver;
  [(RevealingImageView *)&v3 layoutSubviews];
  sub_1003AA394();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_imageView));
  swift_bridgeObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_pageGrid, &qword_100955830);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_currentArtworkTemplate, &qword_10094C368);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_currentArtworkHandlerKey, &qword_100958D50);
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_delegate);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_mirrorDelegate;

  sub_10000F76C((uint64_t)v3);
}

@end
@interface RevealingImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (_TtC22SubscribePageExtension18RevealingImageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18RevealingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingImageView

- (_TtC22SubscribePageExtension18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18RevealingImageView *)sub_1005409DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18RevealingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100541960();
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
  sub_10053F908();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_imageView));
  swift_bridgeObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_pageGrid, &qword_100934590);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkTemplate, &qword_100938110);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkHandlerKey, &qword_10094F7C0);
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_delegate);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_mirrorDelegate;

  sub_10000FB1C((uint64_t)v3);
}

@end
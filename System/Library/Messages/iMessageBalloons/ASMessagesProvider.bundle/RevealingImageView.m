@interface RevealingImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (_TtC18ASMessagesProvider18RevealingImageView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18RevealingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingImageView

- (_TtC18ASMessagesProvider18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18RevealingImageView *)sub_EE0A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18RevealingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F0C60();
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
  sub_EEB84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_imageView));
  swift_bridgeObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_pageGrid, (uint64_t *)&unk_95C520);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_currentArtworkTemplate, &qword_956450);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_currentArtworkHandlerKey, &qword_956458);
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_delegate);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingImageView_mirrorDelegate;

  sub_174B8((uint64_t)v3);
}

@end
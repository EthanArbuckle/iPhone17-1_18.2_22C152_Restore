@interface IMBBubbleView
- (UIImage)image;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC8Business13IMBBubbleView)initWithCoder:(id)a3;
- (_TtC8Business13IMBBubbleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation IMBBubbleView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel));
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_image));
}

- (void)setImage:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_image);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_image) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_1000B9BF8();
}

- (_TtC8Business13IMBBubbleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BA7D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000B9EFC();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor);
  id v6 = a4;
  v7 = self;
  [(IMBBubbleView *)v7 setBackgroundColor:v5];
  [*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground) setBackgroundColor:v5];
}

- (_TtC8Business13IMBBubbleView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business13IMBBubbleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelWidthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = (char *)self + OBJC_IVAR____TtC8Business13IMBBubbleView_urlHelper;

  sub_10000FE60((uint64_t)v3);
}

@end
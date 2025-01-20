@interface DOCRenameThumbnailView
- (CGSize)intrinsicContentSize;
- (UIImage)image;
- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView)initWithImage:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCRenameThumbnailView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(DOCAspectImageView *)&v4 image];
  return v2;
}

- (void)setImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(DOCAspectImageView *)&v7 setImage:v4];
  unsigned __int8 v6 = sub_1003BDA14();
  sub_1003C6CE4(v5, v6 & 1);
}

- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView_item) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView_initialThumbnail) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView_fullSizeThumbnail) = 0;
  id v4 = a3;

  result = (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView *)sub_1004C0670();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCRenameThumbnailView *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3) {
    sub_1003BD754();
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCRenameThumbnailView *)&v4 layoutSubviews];
  unsigned __int8 v3 = sub_1003BDA14();
  sub_1003C6CE4(v2, v3 & 1);
}

- (void)thumbnailLoaded:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v2 = v10.receiver;
  [(DOCRenameThumbnailView *)&v10 intrinsicContentSize];
  id v3 = objc_msgSend(v2, "traitCollection", v10.receiver, v10.super_class);
  [v3 displayScale];

  DOCAdaptSizeToRect();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView)initWithImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCRenameThumbnailView_item));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
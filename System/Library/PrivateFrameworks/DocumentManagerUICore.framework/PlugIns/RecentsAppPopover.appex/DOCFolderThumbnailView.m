@interface DOCFolderThumbnailView
- (CGSize)intrinsicContentSize;
- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView)initWithImage:(id)a3;
- (void)didMoveToWindow;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCFolderThumbnailView

- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView_thumbnail) = 0;
  id v4 = a3;

  result = (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView *)sub_1004C0670();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  id v2 = v4.receiver;
  [(DOCFolderThumbnailView *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3) {
    sub_1003BE89C();
  }
}

- (void)thumbnailLoaded:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  id v2 = v10.receiver;
  [(DOCFolderThumbnailView *)&v10 intrinsicContentSize];
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

- (_TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView)initWithImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_F71CB5D5742CC6EB57B7CC35BCE02CD722DOCFolderThumbnailView_item));
  swift_unknownObjectRelease();
}

@end
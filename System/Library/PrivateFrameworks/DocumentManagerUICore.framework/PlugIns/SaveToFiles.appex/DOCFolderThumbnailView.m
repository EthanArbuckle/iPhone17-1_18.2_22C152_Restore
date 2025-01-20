@interface DOCFolderThumbnailView
- (CGSize)intrinsicContentSize;
- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView)initWithImage:(id)a3;
- (void)didMoveToWindow;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCFolderThumbnailView

- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView_thumbnail) = 0;
  id v4 = a3;

  result = (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView *)sub_1004D2DC0();
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
    sub_10004A1C0();
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

- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView)initWithImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D422DOCFolderThumbnailView_item));
  swift_unknownObjectRelease();
}

@end
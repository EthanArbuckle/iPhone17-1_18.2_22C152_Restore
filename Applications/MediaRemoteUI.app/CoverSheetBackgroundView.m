@interface CoverSheetBackgroundView
- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithFrame:(CGRect)a3;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation CoverSheetBackgroundView

- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaRemoteUI24CoverSheetBackgroundView *)sub_1000092E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithCoder:(id)a3
{
  return -[CoverSheetBackgroundView initWithFrame:](self, "initWithFrame:", a3, 0.0, 0.0, 0.0, 0.0);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  id v2 = v5.receiver;
  [(CoverSheetBackgroundView *)&v5 layoutSubviews];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    [v2 bounds];
    [v4 setFrame:];
  }
  sub_1000095BC();
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1000095BC();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView));

  swift_unknownObjectWeakDestroy();
}

@end
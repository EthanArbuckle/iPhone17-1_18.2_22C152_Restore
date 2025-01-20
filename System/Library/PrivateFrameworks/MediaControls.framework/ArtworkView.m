@interface ArtworkView
- (_TtC13MediaControls11ArtworkView)initWithCoder:(id)a3;
- (_TtC13MediaControls11ArtworkView)initWithFrame:(CGRect)a3;
@end

@implementation ArtworkView

- (_TtC13MediaControls11ArtworkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11ArtworkView_style) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11ArtworkView_image) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtworkView();
  return -[ArtworkView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13MediaControls11ArtworkView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11ArtworkView_style) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11ArtworkView_image) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkView();
  return [(ArtworkView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
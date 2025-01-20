@interface ArtworkSectionBackgroundView
- (_TtC20ProductPageExtension28ArtworkSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkSectionBackgroundView

- (_TtC20ProductPageExtension28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28ArtworkSectionBackgroundView *)sub_1006149A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28ArtworkSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100614F6C();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_10077C6E0();
  sub_10076C6D0();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 prepareForReuse];
  sub_10076C6F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28ArtworkSectionBackgroundView_gradientView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension28ArtworkSectionBackgroundView_artworkView);
}

@end
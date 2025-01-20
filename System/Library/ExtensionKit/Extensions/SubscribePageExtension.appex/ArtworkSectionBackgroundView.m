@interface ArtworkSectionBackgroundView
- (_TtC22SubscribePageExtension28ArtworkSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkSectionBackgroundView

- (_TtC22SubscribePageExtension28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28ArtworkSectionBackgroundView *)sub_1006EB2D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28ArtworkSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006EB898();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_100768000();
  sub_1007582C0();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 prepareForReuse];
  sub_1007582E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28ArtworkSectionBackgroundView_gradientView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28ArtworkSectionBackgroundView_artworkView);
}

@end
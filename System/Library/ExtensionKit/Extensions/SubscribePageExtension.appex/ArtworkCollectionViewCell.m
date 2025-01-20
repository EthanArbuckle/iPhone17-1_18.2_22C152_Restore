@interface ArtworkCollectionViewCell
- (_TtC22SubscribePageExtension25ArtworkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkCollectionViewCell

- (_TtC22SubscribePageExtension25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension25ArtworkCollectionViewCell *)sub_1003262E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension25ArtworkCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC22SubscribePageExtension25ArtworkCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell();
  v2 = (char *)v5.receiver;
  [(ArtworkCollectionViewCell *)&v5 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView];
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  sub_100758320(v6, v4);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell();
  id v2 = v4.receiver;
  [(ArtworkCollectionViewCell *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, "contentView", v4.receiver, v4.super_class);
  [v3 frame];

  sub_1007582C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_itemLayoutContext;

  sub_10002D20C((uint64_t)v3);
}

@end
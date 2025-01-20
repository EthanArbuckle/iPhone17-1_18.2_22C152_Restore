@interface LargeHeroBreakoutCollectionViewCell
- (_TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didTapActionButton;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LargeHeroBreakoutCollectionViewCell

- (_TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell *)sub_1002301FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002318F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100230C40();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10022EA6C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(LargeHeroBreakoutCollectionViewCell *)&v6 traitCollectionDidChange:v4];
  sub_10022F47C();
}

- (void)didTapActionButton
{
  v2 = *(void (**)(uint64_t))(*(char **)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_detailsView)
                                      + OBJC_IVAR____TtC20ProductPageExtension19BreakoutDetailsView_callToActionButtonHandler);
  if (v2)
  {
    id v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002311E0((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_detailsView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35LargeHeroBreakoutCollectionViewCell_detailPosition;
  uint64_t v4 = sub_1007768E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

@end
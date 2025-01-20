@interface HeroCarouselCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HeroCarouselCollectionViewCell

- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)sub_10026B420(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026DD84();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10026BBE8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10026BD4C();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (__objc2_class **)a3;
  v5 = self;
  sub_10026BF2C(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  sub_100019840(0, (unint64_t *)&qword_100954370);
  id v7 = a3;
  v8 = (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)a4;
  v9 = self;
  if ((sub_10077CB10() & 1) != 0
    && (v10 = (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)[(HeroCarouselCollectionViewCell *)v8 view]) != 0)
  {
    v11 = v10;
    type metadata accessor for HeroCarouselItemView();
    BOOL v12 = swift_dynamicCastClass() != 0;

    v8 = v9;
    v9 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)handleTap:(id)a3
{
  id v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_pageControl);
    id v6 = a3;
    id v7 = self;
    sub_1000194C0((uint64_t)v3);
    v3([v5 currentPage]);
    sub_1000194B0((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_carouselView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_state, &qword_100951690);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler));
  swift_weakDestroy();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock));
  swift_unknownObjectWeakDestroy();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_100958900);
  swift_release();
  sub_100019524((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_playbackId);

  swift_unknownObjectWeakDestroy();
}

@end
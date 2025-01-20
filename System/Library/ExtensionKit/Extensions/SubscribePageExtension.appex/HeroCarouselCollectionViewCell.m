@interface HeroCarouselCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HeroCarouselCollectionViewCell

- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)sub_1004935AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100495EF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100493D74();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100493ED8();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004940B8(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  sub_10001A860(0, (unint64_t *)&qword_10093D730);
  id v7 = a3;
  v8 = (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)a4;
  v9 = self;
  if ((sub_100768430() & 1) != 0
    && (v10 = (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)[(HeroCarouselCollectionViewCell *)v8 view]) != 0)
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
                                 + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_pageControl);
    id v6 = a3;
    id v7 = self;
    sub_10001A4E0((uint64_t)v3);
    v3([v5 currentPage]);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_carouselView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_state, &qword_10093F708);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler));
  swift_weakDestroy();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock));
  swift_unknownObjectWeakDestroy();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_100940200);
  swift_release();
  sub_10001A544((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_playbackId);

  swift_unknownObjectWeakDestroy();
}

@end
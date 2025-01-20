@interface HeroCarouselCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HeroCarouselCollectionViewCell

- (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell *)sub_225778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_228080();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_225F40();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2260A4();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (_UNKNOWN **)a3;
  v5 = self;
  sub_226284(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  sub_FE2C(0, (unint64_t *)&qword_95D220);
  id v7 = a3;
  v8 = (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell *)a4;
  v9 = self;
  if ((sub_77E510() & 1) != 0
    && (v10 = (_TtC18ASMessagesProvider30HeroCarouselCollectionViewCell *)[(HeroCarouselCollectionViewCell *)v8 view]) != 0)
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
                                 + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC18ASMessagesProvider16HeroCarouselView_pageControl);
    id v6 = a3;
    id v7 = self;
    sub_13318((uint64_t)v3);
    v3([v5 currentPage]);
    sub_13308((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_carouselView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_state, &qword_954228);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_didSelectHandler));
  swift_weakDestroy();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_impressionsUpdateBlock));
  swift_unknownObjectWeakDestroy();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_959C20);
  swift_release();
  sub_22B60((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselCollectionViewCell_playbackId);

  swift_unknownObjectWeakDestroy();
}

@end
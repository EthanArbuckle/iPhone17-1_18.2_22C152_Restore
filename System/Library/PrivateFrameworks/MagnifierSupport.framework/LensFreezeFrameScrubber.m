@interface LensFreezeFrameScrubber
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)didTapAddButton:(id)a3;
- (void)didTapScrollView:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation LensFreezeFrameScrubber

- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport23LensFreezeFrameScrubber *)sub_23592E3B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235932864();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_235930F40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator));
  id v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_activeItemIndexPath;
  uint64_t v4 = sub_235947B38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___activeItemIndicator));
  swift_release();
}

- (void)didTapScrollView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235931788(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235931C70(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  id v8 = a3;
  v11 = self;
  v9 = sub_235931B3C(x);
  if ((v10 & 1) == 0) {
    *(void *)&a5->double x = v9;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)didTapAddButton:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();

  sub_23566A3AC((uint64_t)v6, &qword_26AF15750);
}

- (unint64_t)accessibilityTraits
{
  unint64_t result = *MEMORY[0x263F83248];
  uint64_t v3 = *MEMORY[0x263F832D8];
  if (!*MEMORY[0x263F83248])
  {
    if (!v3) {
      return 0;
    }
LABEL_5:
    result |= v3;
    return result;
  }
  if ((v3 & ~result) != 0) {
    goto LABEL_5;
  }
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_235932A74();
  if (v2)
  {
    uint64_t v3 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (void)accessibilityDecrement
{
  uint64_t v2 = self;
  sub_235932034();
}

- (void)accessibilityIncrement
{
  uint64_t v2 = self;
  sub_23593216C();
}

- (id)_accessibilitySupplementaryFooterViews
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF15740);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23594FD70;
  id v4 = self;
  id v5 = sub_23592E160();
  *(void *)(v3 + 56) = sub_2356594B0(0, &qword_26AF15440);
  *(void *)(v3 + 32) = v5;

  v6 = (void *)sub_235949D58();
  swift_bridgeObjectRelease();
  return v6;
}

@end
@interface LensFiltersScrubber
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)didTapScrollView:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation LensFiltersScrubber

- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport19LensFiltersScrubber *)sub_23569822C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23569D768();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23569B868();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_maskedView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber____lazy_storage___overlayBox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_overlayBoxLeadingAnchorConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber____lazy_storage___activeItemIndicator);
}

- (void)didTapScrollView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23569C550(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23569CA38(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  id v8 = a3;
  v11 = self;
  v9 = sub_23569C904(x);
  if ((v10 & 1) == 0) {
    *(void *)&a5->double x = v9;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
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

- (NSString)accessibilityLabel
{
  sub_23569DC94();
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

- (NSString)accessibilityHint
{
  uint64_t v2 = self;
  sub_23569CD78();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)accessibilityDecrement
{
  uint64_t v2 = self;
  sub_23569D140();
}

- (void)accessibilityIncrement
{
  uint64_t v2 = self;
  sub_23569D3D4();
}

@end
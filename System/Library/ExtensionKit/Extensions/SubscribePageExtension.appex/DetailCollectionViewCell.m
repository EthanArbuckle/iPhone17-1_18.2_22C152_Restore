@interface DetailCollectionViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension24DetailCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24DetailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)wasTapped;
@end

@implementation DetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_100322818(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_100322818(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC22SubscribePageExtension24DetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24DetailCollectionViewCell *)sub_100322A54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24DetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10032491C();
}

- (void)wasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100323580();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100323FEC(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  uint64_t v3 = *(void (**)(void *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v8[3] = sub_10001A860(0, &qword_10093A1E8);
    v8[0] = a3;
    id v6 = a3;
    double v7 = self;
    sub_10001A4E0((uint64_t)v3);
    v3(v8);
    sub_10001A4D0((uint64_t)v3);
    sub_10000FED8((uint64_t)v8, &qword_1009360F0);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100324340();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_previousTitleTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_previousSubtitleTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_accessoryView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_accessory, &qword_10093A1C0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_topDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_bottomDivider));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_accessoryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_backgroundSelectionView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_selectionHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension24DetailCollectionViewCell_tapGestureRecognizer);
}

@end
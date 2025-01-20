@interface DOCItemCollectionViewSectionHeader
- (_TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityTitleLabel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation DOCItemCollectionViewSectionHeader

- (_TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader *)sub_1003FBCE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100401C30();
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCItemCollectionViewSectionHeader();
  id v2 = v5.receiver;
  [(DOCItemCollectionViewSectionHeader *)&v5 didMoveToWindow];
  id v3 = objc_msgSend(v2, "window", v5.receiver, v5.super_class);

  if (v3)
  {
    id v4 = [v2 traitCollection];
    sub_1003FF1FC();

    id v2 = v4;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1003FDE30();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004BDB00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BDAC0();
  v8 = self;
  sub_1003FF5D8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  id v2 = self;
  id v3 = sub_1003FFB9C();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_sortingDescriptor, (uint64_t *)&unk_10061B1D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_1001A7194(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(void *)&self->seeLessString[OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_representedCollectionSection]);
  sub_100035EB4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_toggleExpandedHandler));
  sub_100035EB4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_sortButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader_customBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover34DOCItemCollectionViewSectionHeader__labelForAX);
}

@end
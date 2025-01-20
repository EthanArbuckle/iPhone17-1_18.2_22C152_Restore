@interface DOCItemCollectionViewSectionHeader
- (_TtC11SaveToFiles34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3;
- (_TtC11SaveToFiles34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityTitleLabel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation DOCItemCollectionViewSectionHeader

- (_TtC11SaveToFiles34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles34DOCItemCollectionViewSectionHeader *)sub_100383674(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11SaveToFiles34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100389618();
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
    sub_100386B8C();

    id v2 = v4;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1003857C0();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004D0230();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004D01F0();
  v8 = self;
  sub_100386F68((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  id v2 = self;
  id v3 = sub_10038752C();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_sortingDescriptor, (uint64_t *)&unk_100630E00);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_100319930(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(void *)&self->seeLessString[OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_representedCollectionSection]);
  sub_10003B980(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_toggleExpandedHandler));
  sub_10003B980(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_sortButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader_customBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles34DOCItemCollectionViewSectionHeader__labelForAX);
}

@end
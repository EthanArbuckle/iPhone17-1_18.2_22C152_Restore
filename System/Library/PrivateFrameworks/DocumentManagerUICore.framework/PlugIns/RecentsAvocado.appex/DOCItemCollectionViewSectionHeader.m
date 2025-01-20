@interface DOCItemCollectionViewSectionHeader
- (_TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityTitleLabel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation DOCItemCollectionViewSectionHeader

- (_TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader *)sub_1000F76C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FD6EC();
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
    sub_1000FABD8();

    id v2 = v4;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1000F980C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004CCB30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CCAF0();
  v8 = self;
  sub_1000FAFB4((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  id v2 = self;
  id v3 = sub_1000FB578();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_sortingDescriptor, (uint64_t *)&unk_10062AC40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_1000FDDB8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(void *)&self->seeLessString[OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_representedCollectionSection]);
  sub_1000388F0(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_toggleExpandedHandler));
  sub_1000388F0(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_sortButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader_customBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado34DOCItemCollectionViewSectionHeader__labelForAX);
}

@end
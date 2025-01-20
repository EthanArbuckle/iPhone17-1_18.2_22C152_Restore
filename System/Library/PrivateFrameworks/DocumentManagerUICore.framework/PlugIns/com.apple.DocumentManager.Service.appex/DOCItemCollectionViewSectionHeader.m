@interface DOCItemCollectionViewSectionHeader
- (_TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityTitleLabel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation DOCItemCollectionViewSectionHeader

- (_TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader *)sub_100177E98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10017DE84();
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
    sub_10017B3B0();

    id v2 = v4;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_100179FE4();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004CC2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CC2A0();
  v8 = self;
  sub_10017B78C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  id v2 = self;
  id v3 = sub_10017BD50();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003B3B8((uint64_t)self+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_sortingDescriptor, (uint64_t *)&unk_10062D120);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_10017E524(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(void *)&self->seeLessString[OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_representedCollectionSection]);
  sub_10003B0A8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_toggleExpandedHandler));
  sub_10003B0A8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_sortButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader_customBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCItemCollectionViewSectionHeader__labelForAX);
}

@end
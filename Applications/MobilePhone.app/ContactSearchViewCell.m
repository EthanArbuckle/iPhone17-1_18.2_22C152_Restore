@interface ContactSearchViewCell
- (_TtC11MobilePhone21ContactSearchViewCell)initWithCoder:(id)a3;
- (_TtC11MobilePhone21ContactSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)callButtonTapped;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)prepareForReuse;
- (void)videoButtonTapped;
@end

@implementation ContactSearchViewCell

- (_TtC11MobilePhone21ContactSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11MobilePhone21ContactSearchViewCell *)ContactSearchViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC11MobilePhone21ContactSearchViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ContactSearchViewCell.init(coder:)();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(ContactSearchViewCell *)&v3 prepareForReuse];
  *(void *)&v2[OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_idsStatusSubscription] = 0;

  swift_release();
}

- (void)callButtonTapped
{
  v2 = self;
  ContactSearchViewCell.callButtonTapped()();
}

- (void)videoButtonTapped
{
  v2 = self;
  ContactSearchViewCell.videoButtonTapped()();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_avatarView);
  v11 = self;
  id v12 = [(ContactSearchViewCell *)v11 traitCollection];
  id v13 = [v12 preferredContentSizeCategory];

  LOBYTE(v12) = UIContentSizeCategory.isAccessibilityCategory.getter();
  [v10 setHidden:v12 & 1];
  ContactSearchViewCell.updateConstraintsForAccessibility()();

  outlined destroy of Notification?((uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_contactSummarizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_avatarViewControllerSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_avatarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_detailLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell____lazy_storage___textContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_callButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_videoButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_contact));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone21ContactSearchViewCell_matchedPhoneNumber));
  swift_bridgeObjectRelease();

  swift_release();
}

@end
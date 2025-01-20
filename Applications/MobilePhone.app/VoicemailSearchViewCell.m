@interface VoicemailSearchViewCell
- (_TtC11MobilePhone23VoicemailSearchViewCell)initWithCoder:(id)a3;
- (_TtC11MobilePhone23VoicemailSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation VoicemailSearchViewCell

- (_TtC11MobilePhone23VoicemailSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC11MobilePhone23VoicemailSearchViewCell *)VoicemailSearchViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC11MobilePhone23VoicemailSearchViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized VoicemailSearchViewCell.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  VoicemailSearchViewCell.traitCollectionDidChange(_:)(v9);
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v10 = self;
  VoicemailSearchViewCell.layoutForAccessibility()();

  outlined destroy of Locale?((uint64_t)v7, &demangling cache variable for type metadata for Notification?);
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_transcriptView));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_callButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_item));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_avatarViewControllerSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_avatarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_contactStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_unreadIndicatorImageView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
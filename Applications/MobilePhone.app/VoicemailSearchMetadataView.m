@interface VoicemailSearchMetadataView
- (_TtC11MobilePhone27VoicemailSearchMetadataView)init;
- (_TtC11MobilePhone27VoicemailSearchMetadataView)initWithCoder:(id)a3;
- (_TtC11MobilePhone27VoicemailSearchMetadataView)initWithFrame:(CGRect)a3;
- (void)didTapCall;
- (void)handleContentSizeCategoryDidChange:(id)a3;
@end

@implementation VoicemailSearchMetadataView

- (_TtC11MobilePhone27VoicemailSearchMetadataView)init
{
  return (_TtC11MobilePhone27VoicemailSearchMetadataView *)VoicemailSearchMetadataView.init()();
}

- (_TtC11MobilePhone27VoicemailSearchMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized VoicemailSearchMetadataView.init(coder:)();
}

- (void)didTapCall
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = (void (**)(void))(Strong + OBJC_IVAR____TtC11MobilePhone23VoicemailSearchViewCell_callButtonTapHandler);
    swift_beginAccess();
    v6 = *v5;
    v7 = self;
    outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)v6);

    if (v6)
    {
      v6();
      outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v6);
    }
  }
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
  VoicemailSearchMetadataView.updateLayoutForAccessibility()();

  outlined destroy of Notification?((uint64_t)v7);
}

- (_TtC11MobilePhone27VoicemailSearchMetadataView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MobilePhone27VoicemailSearchMetadataView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_callButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_metadataContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_textContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_titleStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_subtitleStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_badgeView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone27VoicemailSearchMetadataView_unreadIndicatorImageView));

  swift_bridgeObjectRelease();
}

@end
@interface MPLegacyVoicemail
+ (MPLegacyVoicemail)mock;
- (MPLegacyVoicemail)init;
- (MPLegacyVoicemail)initWithAccountID:(id)a3 label:(id)a4 hasUnreadMessages:(BOOL)a5;
- (NSUUID)accountID;
@end

@implementation MPLegacyVoicemail

- (NSUUID)accountID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (MPLegacyVoicemail)initWithAccountID:(id)a3 label:(id)a4 hasUnreadMessages:(BOOL)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR___MPLegacyVoicemail_accountID, v10, v7);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___MPLegacyVoicemail_label);
  uint64_t *v14 = v11;
  v14[1] = v13;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___MPLegacyVoicemail_hasUnreadMessages) = a5;
  v15 = (objc_class *)type metadata accessor for LegacyVoicemail();
  v18.receiver = self;
  v18.super_class = v15;
  v16 = [(MPLegacyVoicemail *)&v18 init];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

+ (MPLegacyVoicemail)mock
{
  if (one-time initialization token for mock != -1) {
    swift_once();
  }
  NSUUID v2 = (void *)static LegacyVoicemail.mock;

  return (MPLegacyVoicemail *)v2;
}

- (MPLegacyVoicemail)init
{
  result = (MPLegacyVoicemail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSUUID v2 = (char *)self + OBJC_IVAR___MPLegacyVoicemail_accountID;
  uint64_t v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end
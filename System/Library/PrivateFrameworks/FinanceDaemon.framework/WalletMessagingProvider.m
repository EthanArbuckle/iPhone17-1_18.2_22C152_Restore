@interface WalletMessagingProvider
+ (id)makeProvider;
- (_TtC13FinanceDaemon23WalletMessagingProvider)init;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
- (void)processMessagesWithCompletionHandler:(id)a3;
@end

@implementation WalletMessagingProvider

+ (id)makeProvider
{
  id v2 = _s13FinanceDaemon23WalletMessagingProviderC04makeE0ACyFZ_0();
  return v2;
}

- (void)processMessagesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE6840);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D74102F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA81FEB0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA81FEC0;
  v12[5] = v11;
  v13 = self;
  sub_1D73FB7E8((uint64_t)v7, (uint64_t)&unk_1EA81FED0, (uint64_t)v12);
  swift_release();
}

- (_TtC13FinanceDaemon23WalletMessagingProvider)init
{
  result = (_TtC13FinanceDaemon23WalletMessagingProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_userDefaults);
  v3 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_imageProcessingService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)connectApplicationMessageSink:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  WalletMessagingProvider.connect(_:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_1D74017A8();
  swift_unknownObjectRelease();

  return v8;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1D7402AD8();
  swift_unknownObjectRelease();
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  WalletMessagingProvider.applicationMessageSink(_:tappedMessageWith:)(a3, v7);
  swift_unknownObjectRelease();
}

@end
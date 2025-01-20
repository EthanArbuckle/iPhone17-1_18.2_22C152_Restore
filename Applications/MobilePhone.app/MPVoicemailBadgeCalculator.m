@interface MPVoicemailBadgeCalculator
- (MPVoicemailBadgeCalculator)init;
- (id)listenWithHandler:(id)a3;
@end

@implementation MPVoicemailBadgeCalculator

- (id)listenWithHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned PhoneBadge) -> ();
  *(void *)(v6 + 24) = v5;
  v7 = *(uint64_t (**)(void *, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xD8);
  v8 = self;
  swift_retain();
  v9 = (void *)v7(&thunk for @escaping @callee_guaranteed (@unowned PhoneBadge) -> ()partial apply, v6);

  swift_release();
  swift_release();

  return v9;
}

- (MPVoicemailBadgeCalculator)init
{
  result = (MPVoicemailBadgeCalculator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MPVoicemailBadgeCalculator_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MPVoicemailBadgeCalculator_accountManager);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MPVoicemailBadgeCalculator_vvmSource);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MPVoicemailBadgeCalculator_legacySource);
  swift_release();

  swift_bridgeObjectRelease();
}

@end
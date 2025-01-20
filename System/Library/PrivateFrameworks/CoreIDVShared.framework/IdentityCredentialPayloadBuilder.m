@interface IdentityCredentialPayloadBuilder
- (_TtC13CoreIDVShared32IdentityCredentialPayloadBuilder)init;
@end

@implementation IdentityCredentialPayloadBuilder

- (_TtC13CoreIDVShared32IdentityCredentialPayloadBuilder)init
{
  result = (_TtC13CoreIDVShared32IdentityCredentialPayloadBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D78607E8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC13CoreIDVShared32IdentityCredentialPayloadBuilder_identifierStringData), *(void *)&self->version[OBJC_IVAR____TtC13CoreIDVShared32IdentityCredentialPayloadBuilder_identifierStringData]);
  v3 = (char *)self + OBJC_IVAR____TtC13CoreIDVShared32IdentityCredentialPayloadBuilder_delegate;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end
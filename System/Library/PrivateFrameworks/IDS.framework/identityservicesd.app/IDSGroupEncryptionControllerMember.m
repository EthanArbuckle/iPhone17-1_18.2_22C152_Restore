@interface IDSGroupEncryptionControllerMember
- (BOOL)isEqual:(id)a3;
- (BOOL)isLightweight;
- (IDSURI)uri;
- (NSString)description;
- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)init;
- (int64_t)hash;
- (void)setIsLightweight:(BOOL)a3;
@end

@implementation IDSGroupEncryptionControllerMember

- (IDSURI)uri
{
  return (IDSURI *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri));
}

- (int64_t)hash
{
  return (int64_t)[*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri) hash];
}

- (NSString)description
{
  v2 = self;
  sub_100450B18();

  NSString v3 = sub_100726420();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100726870();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_100450C70((uint64_t)v8);

  sub_100450D90((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)isLightweight
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x60);
  NSString v3 = self;
  LOBYTE(v2) = v2();

  return v2 & 1;
}

- (void)setIsLightweight:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x68);
  v5 = self;
  v4(v3);
}

- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)init
{
  result = (_TtC17identityservicesd34IDSGroupEncryptionControllerMember *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri));
}

@end
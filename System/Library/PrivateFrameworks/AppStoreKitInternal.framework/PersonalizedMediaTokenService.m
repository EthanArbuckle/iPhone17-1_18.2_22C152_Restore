@interface PersonalizedMediaTokenService
- (_TtC19AppStoreKitInternal29PersonalizedMediaTokenService)init;
- (id)fetchMediaToken;
- (void)accountsDidChange;
- (void)invalidateMediaToken;
@end

@implementation PersonalizedMediaTokenService

- (id)fetchMediaToken
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_tokenService), sel_fetchMediaToken);
  return v2;
}

- (void)accountsDidChange
{
  id v2 = self;
  sub_1E1BFE9C4();
}

- (void)invalidateMediaToken
{
}

- (_TtC19AppStoreKitInternal29PersonalizedMediaTokenService)init
{
  result = (_TtC19AppStoreKitInternal29PersonalizedMediaTokenService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_tokenService));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_queue);
}

@end
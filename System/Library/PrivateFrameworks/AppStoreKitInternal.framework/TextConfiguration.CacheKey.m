@interface TextConfiguration.CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey)init;
- (int64_t)hash;
@end

@implementation TextConfiguration.CacheKey

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1E158240C();

  return v3;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self
     + OBJC_IVAR____TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey_fontSource;
  uint64_t v4 = sub_1E1D57D68();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey_contentSizeCategory);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1E1D5CDD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1E1642B4C((uint64_t)v8);

  sub_1E15B07DC((uint64_t)v8, &qword_1EBF40DE0);
  return v6 & 1;
}

- (_TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey)init
{
  result = (_TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
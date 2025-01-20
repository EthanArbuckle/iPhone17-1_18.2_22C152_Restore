@interface CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey)init;
- (int64_t)hash;
@end

@implementation CacheKey

- (void).cxx_destruct
{
  sub_1B07BCA18(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase), *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase], *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 8], *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 16], *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 24], self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 32]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_traitCollection);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B086A438();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1B07B8758((uint64_t)v8);

  sub_1B07B86F8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase);
  uint64_t v4 = *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase];
  uint64_t v5 = *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 8];
  uint64_t v6 = *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 16];
  uint64_t v7 = *(void *)&self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 24];
  char v8 = self->useCase[OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_useCase + 32];
  sub_1B086A958();
  v9 = self;
  sub_1B07BCAAC(v3, v4, v5, v6, v7, v8);
  FontUseCase.hash(into:)();
  uint64_t v10 = sub_1B086A998();
  sub_1B07BCA18(v3, v4, v5, v6, v7, v8);
  unint64_t v11 = (unint64_t)objc_msgSend(*(id *)((char *)&v9->super.isa+ OBJC_IVAR____TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey_traitCollection), sel_hash);

  return v11 ^ v10;
}

- (_TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey)init
{
  result = (_TtC5JetUIP33_925E47A64C9969C34ACE8A7AFC4CB7868CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
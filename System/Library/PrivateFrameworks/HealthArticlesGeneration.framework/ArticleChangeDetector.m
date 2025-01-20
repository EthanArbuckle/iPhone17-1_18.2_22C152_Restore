@interface ArticleChangeDetector
- (_TtC24HealthArticlesGeneration21ArticleChangeDetector)init;
- (void)articleStatusDidChange:(id)a3;
@end

@implementation ArticleChangeDetector

- (void)articleStatusDidChange:(id)a3
{
  uint64_t v4 = sub_1E0AC4360();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC4340();
  v8 = self;
  sub_1E0AB6DD0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC24HealthArticlesGeneration21ArticleChangeDetector)init
{
  result = (_TtC24HealthArticlesGeneration21ArticleChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers);
}

@end
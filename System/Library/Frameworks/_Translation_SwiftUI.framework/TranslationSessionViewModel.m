@interface TranslationSessionViewModel
- (_TtC20_Translation_SwiftUI27TranslationSessionViewModel)init;
- (void)needsUserInterventionForTextSession:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation TranslationSessionViewModel

- (_TtC20_Translation_SwiftUI27TranslationSessionViewModel)init
{
  result = (_TtC20_Translation_SwiftUI27TranslationSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration));
  sub_24671F9E4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion));
  v3 = (char *)self + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel___observationRegistrar;
  uint64_t v4 = sub_2467290E0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)needsUserInterventionForTextSession:(id)a3 configuration:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_246721F90(v11, (uint64_t)sub_246721F88, v9);

  swift_release();
}

@end
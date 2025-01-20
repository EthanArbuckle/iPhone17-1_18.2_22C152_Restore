@interface LanguageSupportRemoteModel
- (BOOL)shouldAcceptWithConnection:(id)a3;
- (_TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel)init;
- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6;
- (void)startRequestWithConfiguration:(id)a3;
@end

@implementation LanguageSupportRemoteModel

- (_TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel)init
{
  return (_TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel *)sub_10000ADC0();
}

- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v14 = a3;
  id v12 = a5;
  v13 = self;
  sub_100015DE0(a4, v12, (uint64_t)sub_10001699C, v11);
  swift_release();
}

- (void).cxx_destruct
{
  sub_100006C7C((uint64_t)self + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale, &qword_100028EF0);
  sub_100006C7C((uint64_t)self + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale, &qword_100028EF0);
  swift_bridgeObjectRelease();
  sub_100006C7C((uint64_t)self + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale, &qword_100028EF0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration));
  sub_10000D178(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion));
  v3 = (char *)self
     + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  uint64_t v4 = sub_10001E218();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)startRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  LanguageSupportRemoteModel.startRequest(configuration:)(v4);
}

- (BOOL)shouldAcceptWithConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  LanguageSupportRemoteModel.shouldAccept(connection:)((NSXPCConnection)v4);

  return 1;
}

@end
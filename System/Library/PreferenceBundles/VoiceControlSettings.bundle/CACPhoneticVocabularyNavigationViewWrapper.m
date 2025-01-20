@interface CACPhoneticVocabularyNavigationViewWrapper
+ (id)createWithLocale:(id)a3 completionHandler:(id)a4;
- (_TtC20VoiceControlSettings42CACPhoneticVocabularyNavigationViewWrapper)init;
@end

@implementation CACPhoneticVocabularyNavigationViewWrapper

+ (id)createWithLocale:(id)a3 completionHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_38FE0();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  v9 = (void *)_s20VoiceControlSettings42CACPhoneticVocabularyNavigationViewWrapperC6create6locale17completionHandlerSo16UIViewControllerCSS_yyctFZ_0(v5, v7, (uint64_t)sub_2C8AC, v8);
  swift_bridgeObjectRelease();
  swift_release();

  return v9;
}

- (_TtC20VoiceControlSettings42CACPhoneticVocabularyNavigationViewWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CACPhoneticVocabularyNavigationViewWrapper();
  return [(CACPhoneticVocabularyNavigationViewWrapper *)&v3 init];
}

@end
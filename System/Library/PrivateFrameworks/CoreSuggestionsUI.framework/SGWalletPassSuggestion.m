@interface SGWalletPassSuggestion
- (SGSuggestionDelegate)suggestionDelegate;
- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)init;
- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)initWithRealtimeWalletPass:(id)a3;
- (id)realtimeSuggestion;
- (id)suggestionCategory;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionPrimaryAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (int64_t)suggestionActionButtonType;
- (int64_t)suggestionCategoryActionButtonType;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation SGWalletPassSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  v2 = (void *)sub_1B5BB2008();
  return (SGSuggestionDelegate *)v2;
}

- (void)setSuggestionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B5BB20A0();
}

- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)initWithRealtimeWalletPass:(id)a3
{
  return (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion *)SGWalletPassSuggestion.init(realtimeWalletPass:)(a3);
}

- (id)suggestionCategory
{
  sub_1B5B8D08C();
  return self;
}

- (id)suggestionTitle
{
  v2 = self;
  sub_1B5BB2DE4();

  v3 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)suggestionSubtitle
{
  v3 = self;
  sub_1B5BB2FF4();
  OUTLINED_FUNCTION_19_0();

  if (v2)
  {
    v4 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)suggestionPrimaryAction
{
  uint64_t v2 = self;
  id v3 = sub_1B5BB3314();

  return v3;
}

- (int64_t)suggestionActionButtonType
{
  return sub_1B5BB37D8();
}

- (id)suggestionCategoryId
{
  return sub_1B5BB3964(self, (uint64_t)a2, (void (*)(void))sub_1B5B9AFFC);
}

- (id)suggestionCategoryImage
{
  uint64_t v2 = self;
  id v3 = (void *)sub_1B5BB3830();

  return v3;
}

- (id)suggestionCategoryTitle
{
  return sub_1B5BB3964(self, (uint64_t)a2, (void (*)(void))sub_1B5BB3934);
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B5BB3B6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B5B9B1E0);
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  unint64_t v5 = sub_1B5BC9FE0();
  v6 = self;
  sub_1B5BB39EC(v5);
  OUTLINED_FUNCTION_19_0();

  swift_bridgeObjectRelease();
  if (a3)
  {
    v7 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return sub_1B5BB3B6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B5BB39EC);
}

- (int64_t)suggestionCategoryActionButtonType
{
  return sub_1B5BB37D8();
}

- (id)realtimeSuggestion
{
  uint64_t v2 = self;
  id v3 = (void *)sub_1B5BB3C30();

  return v3;
}

- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)init
{
}

- (void).cxx_destruct
{
  sub_1B5B81CF4((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_suggestionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger;
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(char *))(v4 + 8))(v3);

  unint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passViewManager);
}

@end
@interface SGContactSuggestion
- (SGSuggestionDelegate)suggestionDelegate;
- (_TtC17CoreSuggestionsUI19SGContactSuggestion)init;
- (_TtC17CoreSuggestionsUI19SGContactSuggestion)initWithSgContact:(id)a3;
- (id)mailingAddressFromPostalAddress:(id)a3;
- (id)realtimeSuggestion;
- (id)suggestionCategory;
- (id)suggestionCategoryIconSFSymbol;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionDismissAction;
- (id)suggestionIconSFSymbol;
- (id)suggestionImage;
- (id)suggestionPrimaryAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (int64_t)suggestionActionButtonType;
- (int64_t)suggestionCategoryActionButtonType;
- (void)confirm:(BOOL)a3 suggestion:(id)a4 completion:(id)a5;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation SGContactSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  v2 = (void *)sub_1B5B8B718();
  return (SGSuggestionDelegate *)v2;
}

- (void)setSuggestionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B5B8B7C4();
}

- (_TtC17CoreSuggestionsUI19SGContactSuggestion)initWithSgContact:(id)a3
{
  return (_TtC17CoreSuggestionsUI19SGContactSuggestion *)SGContactSuggestion.init(sgContact:)(a3);
}

- (id)suggestionTitle
{
  v2 = self;
  sub_1B5B8BBA8();

  v3 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)suggestionPrimaryAction
{
  v2 = self;
  id v3 = sub_1B5B8BFE0();

  return v3;
}

- (id)suggestionSubtitle
{
  id v3 = self;
  sub_1B5B8CB94();
  OUTLINED_FUNCTION_19_0();

  if (v2)
  {
    sub_1B5BC9F00();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)suggestionDismissAction
{
  uint64_t v2 = self;
  id v3 = sub_1B5B8CDA4();

  return v3;
}

- (int64_t)suggestionActionButtonType
{
  return sub_1B5B8CEAC();
}

- (id)suggestionImage
{
  uint64_t v2 = self;
  Class v3 = sub_1B5B8CEEC();

  return v3;
}

- (id)suggestionIconSFSymbol
{
  return sub_1B5B8D4EC(self, (uint64_t)a2, (void (*)(void))sub_1B5B8D040);
}

- (id)suggestionCategory
{
  sub_1B5B8D08C();
  return self;
}

- (id)suggestionCategoryId
{
  return sub_1B5B8D194(self, (uint64_t)a2, (void (*)(void))sub_1B5B8D0CC);
}

- (id)suggestionCategoryImage
{
  uint64_t v2 = self;
  v3.super.isa = j___s17CoreSuggestionsUI19SGContactSuggestionC12contactImageSo7UIImageCyF().super.isa;

  return v3.super.isa;
}

- (id)suggestionCategoryTitle
{
  return sub_1B5B8D194(self, (uint64_t)a2, (void (*)(void))sub_1B5B8D160);
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B5B8D410(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B5B8D204);
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  unint64_t v5 = sub_1B5BC9FE0();
  v6 = self;
  sub_1B5B8D29C(v5);
  OUTLINED_FUNCTION_19_0();

  swift_bridgeObjectRelease();
  if (a3)
  {
    sub_1B5BC9F00();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    self = 0;
  }
  return self;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return sub_1B5B8D410(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B5B8D29C);
}

- (int64_t)suggestionCategoryActionButtonType
{
  return sub_1B5B8CEAC();
}

- (id)suggestionCategoryIconSFSymbol
{
  return sub_1B5B8D4EC(self, (uint64_t)a2, (void (*)(void))sub_1B5B8E8FC);
}

- (id)realtimeSuggestion
{
  uint64_t v2 = self;
  id v3 = sub_1B5B8D540();

  return v3;
}

- (_TtC17CoreSuggestionsUI19SGContactSuggestion)init
{
}

- (void).cxx_destruct
{
  sub_1B5B81CF4((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact));
  id v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger;
  uint64_t v4 = sub_1B5BC9230();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  unint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  v6 = (CNContactViewController *)a3;
  id v7 = a4;
  v8 = self;
  v11.is_nil = (char)v8;
  v9 = v8;
  v11.value.super.isa = (Class)a4;
  SGContactSuggestion.contactViewController(_:didCompleteWith:)(v6, v11);
}

- (void)confirm:(BOOL)a3 suggestion:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1B5BA8714;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a4;
  CNContact_optional v11 = self;
  SGContactSuggestion.confirm(_:suggestion:completion:)(a3, (uint64_t)v10, (uint64_t)v8, v9);
  sub_1B5BA86CC((uint64_t)v8);
}

- (id)mailingAddressFromPostalAddress:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  SGContactSuggestion.mailingAddressFromPostalAddress(_:)(v4);
  OUTLINED_FUNCTION_7_5();

  v6 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v6;
}

@end
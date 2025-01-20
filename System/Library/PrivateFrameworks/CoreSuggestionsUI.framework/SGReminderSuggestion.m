@interface SGReminderSuggestion
- (BOOL)wantsExtendedDetailOnlyView;
- (CLLocation)location;
- (NSAttributedString)notes;
- (NSAttributedString)title;
- (NSDateComponents)dueDateComponents;
- (NSString)locationString;
- (NSURL)url;
- (NSUserActivity)userActivity;
- (SGSuggestionDelegate)suggestionDelegate;
- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)init;
- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)initWithRealtimeReminder:(id)a3;
- (id)realtimeSuggestion;
- (id)suggestionAttributedSubtitle;
- (id)suggestionCategory;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionDismissAction;
- (id)suggestionImage;
- (id)suggestionPrimaryAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (int64_t)locationProximity;
- (int64_t)suggestionActionButtonType;
- (int64_t)suggestionCategoryActionButtonType;
- (void)dismissViewController:(id)a3 finished:(BOOL)a4;
- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation SGReminderSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  v2 = (void *)sub_1B5BA2960();
  return (SGSuggestionDelegate *)v2;
}

- (void)setSuggestionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B5BA29F8();
}

- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)initWithRealtimeReminder:(id)a3
{
  return (_TtC17CoreSuggestionsUI20SGReminderSuggestion *)SGReminderSuggestion.init(realtimeReminder:)(a3);
}

- (NSAttributedString)title
{
  v2 = self;
  id v3 = sub_1B5BA2FC8();

  return (NSAttributedString *)v3;
}

- (NSAttributedString)notes
{
  v2 = self;
  id v3 = sub_1B5BA30C8();

  return (NSAttributedString *)v3;
}

- (NSDateComponents)dueDateComponents
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C00);
  uint64_t v5 = OUTLINED_FUNCTION_19_1(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_59();
  v6 = self;
  sub_1B5BA323C(v2);

  uint64_t v7 = sub_1B5BC9070();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload(v2, 1, v7) != 1)
  {
    v8 = (void *)sub_1B5BC9050();
    OUTLINED_FUNCTION_2_2();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
  }
  return (NSDateComponents *)v8;
}

- (CLLocation)location
{
  uint64_t v2 = self;
  id v3 = sub_1B5BA3340();

  return (CLLocation *)v3;
}

- (NSString)locationString
{
  uint64_t v2 = self;
  sub_1B5BA3640();
  uint64_t v4 = v3;

  if (v4)
  {
    OUTLINED_FUNCTION_6_4();
    uint64_t v5 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSURL)url
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  uint64_t v3 = OUTLINED_FUNCTION_19_1(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_65();
  uint64_t v6 = v5 - v4;
  sub_1B5BA37D8(v5 - v4);
  uint64_t v7 = sub_1B5BC9140();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) != 1)
  {
    v8 = (void *)sub_1B5BC9110();
    OUTLINED_FUNCTION_2_2();
    uint64_t v9 = OUTLINED_FUNCTION_6_4();
    v10(v9);
  }
  return (NSURL *)v8;
}

- (NSUserActivity)userActivity
{
  uint64_t v2 = self;
  sub_1B5BA3864();
  uint64_t v4 = v3;

  return (NSUserActivity *)v4;
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return 1;
}

- (int64_t)locationProximity
{
  uint64_t v2 = self;
  int64_t v3 = sub_1B5BA3BC4();

  return v3;
}

- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = a5;
  sub_1B5BA3C3C((uint64_t)v8, a4);
}

- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)init
{
}

- (void).cxx_destruct
{
  sub_1B5B81CF4((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_suggestionDelegate);

  swift_bridgeObjectRelease();
  int64_t v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_logger;
  sub_1B5BC9230();
  OUTLINED_FUNCTION_2_2();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

- (void)dismissViewController:(id)a3 finished:(BOOL)a4
{
  uint64_t v6 = (UIViewController *)a3;
  uint64_t v7 = self;
  SGReminderSuggestion.dismissViewController(_:finished:)(v6, a4);
}

- (id)suggestionTitle
{
  uint64_t v2 = self;
  SGReminderSuggestion.suggestionTitle()();

  int64_t v3 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)suggestionPrimaryAction
{
  uint64_t v2 = self;
  int64_t v3 = (void *)SGReminderSuggestion.suggestionPrimaryAction()();

  return v3;
}

- (id)suggestionImage
{
  uint64_t v2 = self;
  int64_t v3 = (void *)SGReminderSuggestion.suggestionImage()();

  return v3;
}

- (id)suggestionDismissAction
{
  uint64_t v2 = self;
  int64_t v3 = (void *)SGReminderSuggestion.suggestionDismissAction()();

  return v3;
}

- (id)suggestionSubtitle
{
  int64_t v3 = self;
  SGReminderSuggestion.suggestionSubtitle()();
  OUTLINED_FUNCTION_19_0();

  if (v2)
  {
    uint64_t v4 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)suggestionAttributedSubtitle
{
  uint64_t v2 = self;
  int64_t v3 = (void *)SGReminderSuggestion.suggestionAttributedSubtitle()();

  return v3;
}

- (int64_t)suggestionActionButtonType
{
  return SGReminderSuggestion.suggestionActionButtonType()();
}

- (id)suggestionCategory
{
  SGReminderSuggestion.suggestionCategory()();
  return self;
}

- (id)suggestionCategoryId
{
  return sub_1B5BB89C0(self, (uint64_t)a2, (void (*)(void))SGReminderSuggestion.suggestionCategoryId());
}

- (id)suggestionCategoryImage
{
  uint64_t v2 = self;
  v3.super.isa = SGReminderSuggestion.suggestionCategoryImage()().super.isa;

  return v3.super.isa;
}

- (id)suggestionCategoryTitle
{
  return sub_1B5BB89C0(self, (uint64_t)a2, (void (*)(void))SGReminderSuggestion.suggestionCategoryTitle());
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B5BB8D08(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SGReminderSuggestion.suggestionCategoryTitle(forItems:));
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v5 = sub_1B5BC9FE0();
  uint64_t v6 = self;
  SGReminderSuggestion.suggestionCategorySubtitle(forItems:)((Swift::OpaquePointer)v5);
  OUTLINED_FUNCTION_19_0();

  swift_bridgeObjectRelease();
  if (a3)
  {
    uint64_t v7 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return sub_1B5BB8D08(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SGReminderSuggestion.suggestionCategoryLocalizedCount(ofItems:));
}

- (int64_t)suggestionCategoryActionButtonType
{
  return SGReminderSuggestion.suggestionActionButtonType()();
}

- (id)realtimeSuggestion
{
  uint64_t v2 = self;
  SGReminderSuggestion.realtimeSuggestion()();
  uint64_t v4 = v3;

  return v4;
}

@end
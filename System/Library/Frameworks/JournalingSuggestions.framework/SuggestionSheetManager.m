@interface SuggestionSheetManager
- (_TtC21JournalingSuggestions22SuggestionSheetManager)init;
- (void)suggestionSheetController:(id)a3 didTransitionTo:(unint64_t)a4;
- (void)suggestionSheetController:(id)a3 shouldPerformTask:(unint64_t)a4 forSuggestion:(id)a5;
- (void)suggestionSheetControllerDidCancel:(id)a3;
- (void)suggestionSheetControllerShouldShowBlankComposeView:(id)a3;
@end

@implementation SuggestionSheetManager

- (void)suggestionSheetController:(id)a3 didTransitionTo:(unint64_t)a4
{
  id v7 = a3;
  v6 = self;
  specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(a4);
}

- (void)suggestionSheetControllerDidCancel:(id)a3
{
  id v5 = a3;
  v4 = self;
  specialized SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)();
}

- (void)suggestionSheetControllerShouldShowBlankComposeView:(id)a3
{
  uint64_t v4 = one-time initialization token for bridge;
  id v10 = a3;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.bridge);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2444BF000, v7, v8, "Picker:BCV", v9, 2u);
    MEMORY[0x245691070](v9, -1, -1);
  }
}

- (void)suggestionSheetController:(id)a3 shouldPerformTask:(unint64_t)a4 forSuggestion:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = self;
  SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(v10, a4, v8);
}

- (_TtC21JournalingSuggestions22SuggestionSheetManager)init
{
  return (_TtC21JournalingSuggestions22SuggestionSheetManager *)SuggestionSheetManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock));

  swift_bridgeObjectRelease();
}

@end
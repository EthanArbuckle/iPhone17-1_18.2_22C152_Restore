@interface SGSuggestionTableController
- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithCoder:(id)a3;
- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithStore:(id)a3 delegate:(id)a4 suggestionPresenter:(id)a5 suggestionList:(id)a6;
- (void)dealloc;
- (void)dismissViewController:(id)a3;
- (void)dismissalPressed:(id)a3;
- (void)presentViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SGSuggestionTableController

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithStore:(id)a3 delegate:(id)a4 suggestionPresenter:(id)a5 suggestionList:(id)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  return (_TtC17CoreSuggestionsUI27SGSuggestionTableController *)SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5B9C9EC();
}

- (void)dealloc
{
  v2 = self;
  SGSuggestionTableController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_store));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController));
  sub_1B5B81CF4((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_presenterDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionPresenter));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionList);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5B9CDB0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_4();
  sub_1B5B9D9A4();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_4();
  sub_1B5B9DB90();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_4();
  sub_1B5B9DD18();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_4();
  sub_1B5B9DF24();
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_22_0();
  sub_1B5B9E0B4(v6);
}

- (void)dismissViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_22_0();
  sub_1B5B9E238(v6);
}

- (void)dismissalPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5B9E454();
}

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B5BC9F40();
  }
  id v5 = a4;
  SGSuggestionTableController.init(nibName:bundle:)();
}

@end
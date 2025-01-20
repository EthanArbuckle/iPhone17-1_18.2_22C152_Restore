@interface HMSuggestionsController
- (_TtC13HearingModeUI23HMSuggestionsController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingModeUI23HMSuggestionsController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)earTipSuggestionTapped;
- (void)buttonTapped;
- (void)viewDidLoad;
@end

@implementation HMSuggestionsController

- (void)viewDidLoad
{
  v2 = self;
  sub_2512A727C();
}

- (void)buttonTapped
{
  v5 = self;
  v2 = (_TtC13HearingModeUI23HMSuggestionsController *)[(HMSuggestionsController *)v5 navigationController];
  if (v2)
  {
    v3 = v2;
    [(HMSuggestionsController *)v2 dismissViewControllerAnimated:1 completion:0];

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }
}

- (_TtC13HearingModeUI23HMSuggestionsController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingModeUI23HMSuggestionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingModeUI23HMSuggestionsController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingModeUI23HMSuggestionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)earTipSuggestionTapped
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2D830);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2512C3E98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3E88();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_2512A8204((uint64_t)v2);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = objc_msgSend(self, sel_sharedApplication);
  v9 = (void *)sub_2512C3E68();
  sub_25129ED40(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_25129FB14(&qword_269B2D920);
  v10 = (void *)sub_2512C4728();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_openURL_options_completionHandler_, v9, v10, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
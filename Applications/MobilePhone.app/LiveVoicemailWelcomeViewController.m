@interface LiveVoicemailWelcomeViewController
+ (BOOL)shouldShowVoicemailOnboarding;
- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithDelegate:(id)a3;
- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton;
- (void)didTapLinkButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LiveVoicemailWelcomeViewController

+ (BOOL)shouldShowVoicemailOnboarding
{
  return specialized static LiveVoicemailWelcomeViewController.shouldShowVoicemailOnboarding.getter() & 1;
}

- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithDelegate:(id)a3
{
  swift_getObjectType();
  uint64_t v4 = swift_unknownObjectRetain();

  return (_TtC11MobilePhone34LiveVoicemailWelcomeViewController *)specialized LiveVoicemailWelcomeViewController.init(delegate:)(v4, self);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LiveVoicemailWelcomeViewController();
  id v2 = v3.receiver;
  [(LiveVoicemailWelcomeViewController *)&v3 viewDidLoad];
  LiveVoicemailWelcomeViewController.configureViewHierarchy()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Tips.Event<Tips.EmptyDonation>);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for LiveVoicemailWelcomeViewController();
  v11.receiver = self;
  v11.super_class = v9;
  v10 = self;
  [(LiveVoicemailWelcomeViewController *)&v11 viewDidAppear:v3];
  static LiveVoicemailTip.onboardingViewedEvent.getter();
  Tips.Event.sendDonation<>(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  specialized Defaults.showLiveVoicemailOnboarding.setter(0);
}

- (void)didTapContinueButton
{
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11MobilePhone34LiveVoicemailWelcomeViewController_delegate];
  if (v3) {
    [v3 didTapContinueWithViewController:self];
  }
}

- (void)didTapLinkButton
{
  id v2 = self;
  LiveVoicemailWelcomeViewController.didTapLinkButton()();
}

- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC11MobilePhone34LiveVoicemailWelcomeViewController *)LiveVoicemailWelcomeViewController.init(title:detailText:symbolName:contentLayout:)(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC11MobilePhone34LiveVoicemailWelcomeViewController *)LiveVoicemailWelcomeViewController.init(title:detailText:symbolName:contentLayout:)(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC11MobilePhone34LiveVoicemailWelcomeViewController *)LiveVoicemailWelcomeViewController.init(title:detailText:icon:contentLayout:)(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11MobilePhone34LiveVoicemailWelcomeViewController_contentViewHeightConstraint];
}

@end
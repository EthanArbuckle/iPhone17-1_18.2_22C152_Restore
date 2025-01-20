@interface FeedbackRemoteViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithCoder:(id)a3;
- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackDraftViewControllerDidCancel:(id)a3;
- (void)feedbackDraftViewControllerDidLoadForm:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FeedbackRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000022E4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100002648(a3);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100007850;
  }
  id v7 = a3;
  v8 = self;
  sub_100006464(v6);
  sub_100007448((uint64_t)v6);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100007490;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10000310C(a3, v6, (void (*)(void))v7);
  sub_100007448((uint64_t)v6);
}

- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  v9 = [(FeedbackRemoteViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithCoder:(id)a3
{
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  return [(FeedbackRemoteViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100007430(*(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state]);

  swift_unknownObjectRelease();
}

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1000065F8(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000067B4();
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000693C((uint64_t)v9, a5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  uint64_t v4 = qword_100011DA0;
  id v5 = a3;
  uint64_t v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000071D8(v6, (uint64_t)qword_100011DA8);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Controller cancelled.", v9, 2u);
    swift_slowDealloc();
  }

  sub_100004E1C();
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_type_t v8 = self;
  sub_100006C10(v7);
}

- (void)feedbackDraftViewControllerDidLoadForm:(id)a3
{
  uint64_t v4 = qword_100011DA0;
  id v10 = a3;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000071D8(v6, (uint64_t)qword_100011DA8);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Feedback form loaded successfully", v9, 2u);
    swift_slowDealloc();
  }
}

- (void)didInvalidateForRemoteAlert
{
  if (qword_100011DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000071D8(v0, (uint64_t)qword_100011DA8);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)v3 = 136446210;
    sub_100005988(0xD00000000000001DLL, 0x8000000100008CD0, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Terminating self", v6, 2u);
    swift_slowDealloc();
  }

  id v7 = [self sharedApplication];
  [v7 terminateWithSuccess];
}

@end
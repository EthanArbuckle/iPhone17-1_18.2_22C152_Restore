@interface FBAFollowupResponseViewController
- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6;
- (BOOL)isUnsolicited;
- (FBKContentItem)contentItem;
- (FBKFeedbackFollowup)followup;
- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4;
- (void)attachmentsAlertDidSelectOption:(id)a3;
- (void)awakeFromNib;
- (void)cancelAndDismissFollowupResponseController;
- (void)dealloc;
- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4;
- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6;
- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)keyboardWillShowWithNotification:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setIsUnsolicited:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userDidCancel;
- (void)userDidTapSend;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FBAFollowupResponseViewController

- (FBKFeedbackFollowup)followup
{
  return (FBKFeedbackFollowup *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                        + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_followup));
}

- (void)setFollowup:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10006A524(a3);
}

- (FBKContentItem)contentItem
{
  return (FBKContentItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem));
}

- (void)setContentItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isUnsolicited
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_isUnsolicited);
}

- (void)setIsUnsolicited:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_isUnsolicited) = a3;
}

- (void)awakeFromNib
{
  v2 = self;
  sub_10006AADC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10006ABE8();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10006AF74(a3);
}

- (void)dealloc
{
  v2 = self;
  static os_log_type_t.info.getter();
  os_log(_:dso:log:_:_:)();
  id v3 = [self defaultCenter];
  [v3 removeObserver:v2];

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for FBAFollowupResponseViewController();
  [(FBAFollowupResponseViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_followup));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_devicesController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___addAttachmentsController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_dataSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_log));
  swift_bridgeObjectRelease();
  sub_100059188(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_createFollowupSavedHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_bigSendButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_sendButtonInItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___cachedFollowupDisplayTextCell));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___cachedCommentsCell);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10006B2C0(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_10006B520(a3);

  sub_100052464((uint64_t)v10, (uint64_t *)&unk_100122D70);
}

- (void)userDidTapSend
{
  v2 = self;
  sub_10006B8B4();
}

- (void)userDidCancel
{
  v2 = self;
  sub_10006D148();
}

- (void)cancelAndDismissFollowupResponseController
{
  v2 = self;
  sub_10006D3F0();
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_100075624();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100075758((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100075FC8();
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)keyboardWillShowWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  static os_log_type_t.debug.getter();
  sub_10004DE60((uint64_t *)&unk_100122860);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000D86F0;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100054550();
  *(void *)(v5 + 32) = 0xD00000000000001FLL;
  *(void *)(v5 + 40) = 0x80000001000E3130;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  NSNotification.keyboardAttributes.getter((uint64_t)v7);
  *(Class *)((char *)&v6->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_keyboardHeight) = v8;
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  static os_log_type_t.debug.getter();
  sub_10004DE60((uint64_t *)&unk_100122860);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000D86F0;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_100054550();
  *(void *)(v6 + 32) = 0xD00000000000001FLL;
  *(void *)(v6 + 40) = 0x80000001000E3110;
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000760D0();
}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_10007268C(a3);
}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_100072938(v5, v7, a4);
}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_100072C64(a3);
}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
  type metadata accessor for FBAAddAttachmentsController();
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v15 = a6;
  uint64_t v14 = self;
  sub_10005DA28(v12, v14, v11, (uint64_t)v15);
}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_100056B94(0, (unint64_t *)&unk_100122F70);
  sub_100060DE8();
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  id v11 = self;
  sub_1000990D0(v8, v11, (uint64_t)sub_1000768B8, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10006A208();
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = 1;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = v6;
  sub_10007016C(1, 0, 0, 0, (uint64_t)sub_100076884, v7);

  swift_release();
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1000596F4(v8);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10006A208();
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 1;
  *(void *)(v9 + 24) = v8;
  id v10 = v8;
  sub_10007016C(1, 0, 0, 0, (uint64_t)sub_100076884, v9);

  swift_release();
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10006A208();
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = v8;
  id v10 = v8;
  sub_10007016C(0, 0, 0, 0, (uint64_t)sub_100076884, v9);

  swift_release();
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_10006A208();
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = v11;
  id v13 = v11;
  sub_10007016C(0, 0, 0, 0, (uint64_t)sub_100076884, v12);

  swift_release();
}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100073548(v6, a4);
}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  uint64_t v8 = sub_10004DE60(&qword_100122880);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  BOOL v13 = *((unsigned char *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_readinessState) != 5;
  sub_100052464((uint64_t)v10, &qword_100122880);
  return v13;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_100076244(v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000765D0();
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000766A4();
}

@end
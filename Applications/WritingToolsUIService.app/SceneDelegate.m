@interface SceneDelegate
- (UIWindow)window;
- (WTSession)session;
- (_TtC21WritingToolsUIService13SceneDelegate)init;
- (void)beginTextPlaceholder;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)copyText:(id)a3;
- (void)dealloc;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didDismissInputWarningforSessionWithUUID:(id)a3;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)enableIntelligentEntryFieldView:(BOOL)a3;
- (void)enableSmallDetent:(BOOL)a3;
- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4;
- (void)endWritingTools;
- (void)endWritingToolsWithError:(id)a3;
- (void)enrollmentBegan;
- (void)localKeyboardChanged:(id)a3;
- (void)photosPickerSessionBegan;
- (void)photosPickerSessionDismissed;
- (void)preferredContentSizeChanged:(CGSize)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5;
- (void)redo;
- (void)remoteKeyboardChanged:(id)a3;
- (void)replaceSelectionWithText:(id)a3;
- (void)resetPresentationSelectedDetent;
- (void)savePresentationStyle:(int64_t)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setFeedbackHiddenDetentEnabled:(BOOL)a3;
- (void)setIsHostingControllerHeightConstraintActive:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setWindow:(id)a3;
- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6;
- (void)showContentWarningWithTitle:(id)a3 message:(id)a4;
- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3;
- (void)sourceResponderHorizontalSizeClassChanged:(int64_t)a3;
- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3;
- (void)undo;
- (void)updatePromptEntryState:(int64_t)a3;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)windowingModeEnabledChanged:(BOOL)a3;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (WTSession)session
{
  return (WTSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                              + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session));
}

- (void)setSession:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000D0F28(v8, v10);
}

- (void)dealloc
{
  v2 = self;
  sub_1000CAA18();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  sub_10002784C((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_writingToolsView, &qword_100201588);
  swift_release();
  swift_release();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_hostingControllerBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_hostingControllerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_pendingKeyboardInformation));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_rootViewController);
}

- (void)localKeyboardChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000CAD30(v4);
}

- (void)remoteKeyboardChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000CADC8(v4);
}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v14 - v11;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000D47E4((uint64_t)v12, a4, (uint64_t)v10);
  v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v10, v6);
  v13(v12, v6);
}

- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  __chkstk_darwin(v7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  __chkstk_darwin(v3 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (void)didDismissInputWarningforSessionWithUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000D48B8((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1000CBB3C(a3, (uint64_t)sub_1000D47DC, v7);

  swift_release();
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  sub_1000085FC(0, &qword_1001FD300);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  id v7 = a3;
  id v8 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v10 = [v6 actionForDidBeginWritingToolsSession:v7 contexts:isa];

  sub_1000CDBCC(v10);
  swift_bridgeObjectRelease();
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v7 = self;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = [v7 actionForWritingToolsSession:v8 didReceiveAction:a4];
  sub_1000CDBCC(v10);
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1000CC274(v6, a4);
}

- (void)endWritingTools
{
  v2 = self;
  sub_1000CC6F0(0);
}

- (void)endWritingToolsWithError:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_1000CC6F0(a3);
}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (v6)
    {
      id v7 = self;
      NSString v8 = String._bridgeToObjectiveC()();
      goto LABEL_6;
    }
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v9 = self;
  NSString v8 = 0;
LABEL_6:
  id v10 = self;
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 actionForShowContentWarningWithTitle:v8 message:v11];

  sub_1000CDBCC(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  id v7 = _Block_copy(a6);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v7;
  v18 = self;
  sub_1000CCB04(v8, v10, v11, v13, v14, v16, (uint64_t)sub_1000D505C, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  sub_1000085FC(0, (unint64_t *)&qword_100201570);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = self;
  id v14 = a3;
  id v15 = a6;
  uint64_t v16 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v18 = [v13 actionForProofreadingSession:v14 didReceiveSuggestions:isa location:location length:length inContext:v15 finished:v7];

  sub_1000CDBCC(v18);
  swift_bridgeObjectRelease();
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = self;
  id v15 = a3;
  id v16 = a6;
  uint64_t v17 = self;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v19 = [v14 actionForProofreadingSession:v15 didUpdateState:a4 forSuggestionWithUUID:isa inContext:v16];

  sub_1000CDBCC(v19);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v14 = self;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = self;
  id v19 = [v14 actionForCompositionSession:v15 didReceiveText:v16 replacementRange:location length:v17 inContext:v17 finished:v7];
  sub_1000CDBCC(v19);
}

- (void)replaceSelectionWithText:(id)a3
{
}

- (void)copyText:(id)a3
{
}

- (void)undo
{
}

- (void)redo
{
}

- (void)beginTextPlaceholder
{
}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  v12[4] = sub_1000D47CC;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100048B2C;
  v12[3] = &unk_1001ED650;
  uint64_t v9 = _Block_copy(v12);
  uint64_t v10 = self;
  swift_retain();
  swift_release();
  id v11 = [v8 actionForEndTextPlaceholderWillInsertText:v4 completion:v9];
  _Block_release(v9);
  sub_1000CDBCC(v11);

  swift_release();
}

- (void)enableSmallDetent:(BOOL)a3
{
}

- (void)setFeedbackHiddenDetentEnabled:(BOOL)a3
{
}

- (void)enableIntelligentEntryFieldView:(BOOL)a3
{
}

- (void)setIsHostingControllerHeightConstraintActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_hostingControllerHeightConstraint);
  uint64_t v6 = self;
  [v4 setActive:v3];
  uint64_t v5 = *(Class *)((char *)&v6->super.super.isa
                + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_hostingControllerBottomConstraint);
  if (v5) {
    [v5 setActive:v3 ^ 1];
  }
}

- (void)preferredContentSizeChanged:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  sub_1000CD44C(width, height);
}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  sub_1000CD8E8(x, y, width, height);
}

- (void)savePresentationStyle:(int64_t)a3
{
  swift_getKeyPath();
  sub_1000D4F6C((unint64_t *)&qword_1001FAE20, (void (*)(uint64_t))type metadata accessor for CommonUIManager);
  BOOL v4 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
}

- (void)sourceResponderHorizontalSizeClassChanged:(int64_t)a3
{
  swift_getKeyPath();
  sub_1000D4F6C((unint64_t *)&qword_1001FB410, (void (*)(uint64_t))type metadata accessor for PresentationModel);
  BOOL v4 = self;
  swift_retain();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
  swift_release();
}

- (void)windowingModeEnabledChanged:(BOOL)a3
{
  swift_getKeyPath();
  sub_1000D4F6C((unint64_t *)&qword_1001FB410, (void (*)(uint64_t))type metadata accessor for PresentationModel);
  BOOL v4 = self;
  swift_retain();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
  swift_release();
}

- (void)updatePromptEntryState:(int64_t)a3
{
  uint64_t v5 = self;
  uint64_t v6 = self;
  id v7 = [v5 actionForPromptEntryModeUpdateWithState:a3];
  sub_1000CDBCC(v7);
}

- (void)enrollmentBegan
{
}

- (void)photosPickerSessionBegan
{
}

- (void)photosPickerSessionDismissed
{
}

- (void)resetPresentationSelectedDetent
{
}

- (_TtC21WritingToolsUIService13SceneDelegate)init
{
  return (_TtC21WritingToolsUIService13SceneDelegate *)sub_1000CFFF8();
}

@end
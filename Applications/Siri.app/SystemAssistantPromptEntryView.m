@interface SystemAssistantPromptEntryView
- (BOOL)becomeFirstResponder;
- (BOOL)getIsInTamaleAndCollapsed;
- (BOOL)resignFirstResponder;
- (CGSize)intrinsicContentSize;
- (_TtC4Siri30SystemAssistantPromptEntryView)initWithCoder:(id)a3;
- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3;
- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3 dictationReplacementAction:(id)a4;
- (_TtP4Siri38SystemAssistantPromptEntryViewDelegate_)delegate;
- (double)minimumTextFieldHeight;
- (void)animateOutTextFieldAndButton:(id)a3;
- (void)clearText;
- (void)closeButtonTapped;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)layoutSubviews;
- (void)makeTextViewVisible:(BOOL)a3;
- (void)prefillWithText:(id)a3;
- (void)promptEntryViewDidSubmitWithoutView;
- (void)promptEntryViewDidSubmitWithoutViewForSuggestionWithInvocationText:(id)a3;
- (void)resetIsInTamaleAndCollapsed;
- (void)resignKeyboard;
- (void)setDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInGenerativeAssistantTextFollowup;
- (void)setIsInTamaleAndCollapsed:(BOOL)a3;
- (void)setRequestSourceIsQuickTypeTamale:(BOOL)a3;
- (void)setText:(id)a3;
- (void)stopLatencyAnimationIfNeeded;
- (void)textViewDidDismissEditMenu:(id)a3;
- (void)textViewWillPresentEditMenu:(id)a3;
@end

@implementation SystemAssistantPromptEntryView

- (double)minimumTextFieldHeight
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView) intrinsicContentSize];
  return v2;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtP4Siri38SystemAssistantPromptEntryViewDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Siri38SystemAssistantPromptEntryViewDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3 dictationReplacementAction:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC4Siri30SystemAssistantPromptEntryView *)sub_1000A8E58(a4, x, y, width, height);
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000A9754();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setIsInAmbient:(BOOL)a3
{
  double v3 = self;
  dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonVisible.setter();
}

- (BOOL)getIsInTamaleAndCollapsed
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_isInTamaleAndCollapsed);
}

- (void)setIsInTamaleAndCollapsed:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1000A9AFC(a3);
}

- (void)resetIsInTamaleAndCollapsed
{
  double v2 = self;
  sub_1000AAA98();
}

- (void)animateOutTextFieldAndButton:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1000AC374((uint64_t)sub_1000AF240, v5);

  swift_release();
}

- (void)closeButtonTapped
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = self;
    [v4 tamaleCloseButtonTapped];

    swift_unknownObjectRelease();
  }
}

- (void)setText:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  uint64_t v5 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  id v6 = String._bridgeToObjectiveC()();
  [v5 setText:v6];

  swift_bridgeObjectRelease();
}

- (void)clearText
{
  double v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView);
  uint64_t v5 = self;
  double v3 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setText:v4];

  [v2 invalidateIntrinsicContentSize];
}

- (void)resignKeyboard
{
  double v2 = self;
  id v3 = (id)IntelligenceUI.PromptEntryView.textView.getter();
  [v3 resignFirstResponder];
}

- (void)prefillWithText:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView);
  uint64_t v5 = self;
  id v6 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 setText:v7];

  [v4 invalidateIntrinsicContentSize];
  sub_1000AE5C8();

  swift_bridgeObjectRelease();
}

- (void)setIsInGenerativeAssistantTextFollowup
{
  double v2 = self;
  sub_1000ACE6C();
}

- (void)setRequestSourceIsQuickTypeTamale:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_requestSourceIsQuickTypeTamale) = a3;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1000AD2A0();
}

- (BOOL)becomeFirstResponder
{
  double v2 = self;
  id v3 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  unsigned __int8 v4 = [v3 becomeFirstResponder];

  return v4;
}

- (BOOL)resignFirstResponder
{
  double v2 = self;
  unsigned __int8 v3 = sub_1000AD3E8();

  return v3 & 1;
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AE750();
}

- (void)promptEntryViewDidSubmitWithoutViewForSuggestionWithInvocationText:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_textIsProvidedBySuggestion) = 1;
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_invocationTextForSuggestion);
  *uint64_t v5 = v4;
  v5[1] = v6;
  NSString v7 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1000AEA0C();

  swift_bridgeObjectRelease();
}

- (void)promptEntryViewDidSubmitWithoutView
{
  double v2 = self;
  sub_1000AEA0C();
}

- (void)makeTextViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v5 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  id v7 = v5;
  double v6 = 0.0;
  if (v3) {
    double v6 = 1.0;
  }
  [v5 setAlpha:v6];
}

- (void)stopLatencyAnimationIfNeeded
{
  double v2 = self;
  sub_1000AD874();
}

- (void)textViewWillPresentEditMenu:(id)a3
{
}

- (void)textViewDidDismissEditMenu:(id)a3
{
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC4Siri30SystemAssistantPromptEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10007E630((uint64_t)self + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryViewDismissButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryViewBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_closeButtonBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_dropletView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_closeButton);
}

@end
@interface PosterEditFlowReporter
- (_TtC10ContactsUI22PosterEditFlowReporter)init;
- (void)dealloc;
- (void)didCancelFromAvatarEditor;
- (void)didCancelFromCarousel;
- (void)didCancelFromOnboardingNew;
- (void)didCancelFromOnboardingWelcome;
- (void)didCancelFromPosterEditor;
- (void)didDelete;
- (void)didFinish;
- (void)didModifyAvatar;
- (void)didModifyPoster;
- (void)didSkipAvatar;
- (void)didSkipPoster;
- (void)startingFromContactsWithMeCard:(BOOL)a3 isEditing:(BOOL)a4;
- (void)startingFromOnboardingWithMeCard:(BOOL)a3;
- (void)startingFromSNAPWithMeCard:(BOOL)a3;
- (void)willEditAvatar;
- (void)willEditCreatingNew;
- (void)willEditPoster;
@end

@implementation PosterEditFlowReporter

- (void)dealloc
{
  v2 = self;
  sub_18B6ADF94();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PosterEditFlowReporter();
  [(PosterEditFlowReporter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI22PosterEditFlowReporter_logger;
  uint64_t v4 = sub_18B984398();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10ContactsUI22PosterEditFlowReporter_startTime;
  uint64_t v6 = sub_18B9866B8();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)startingFromSNAPWithMeCard:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18B6AC788(a3);
}

- (void)startingFromContactsWithMeCard:(BOOL)a3 isEditing:(BOOL)a4
{
  uint64_t v6 = self;
  sub_18B6AC954(a3, a4);
}

- (void)startingFromOnboardingWithMeCard:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18B6ACBF4(a3);
}

- (void)willEditCreatingNew
{
  v2 = self;
  sub_18B6ACDCC();
}

- (void)willEditAvatar
{
  v2 = self;
  sub_18B6ACE28();
}

- (void)willEditPoster
{
  v2 = self;
  sub_18B6ACFD8();
}

- (void)didModifyAvatar
{
  v2 = self;
  sub_18B6AD034();
}

- (void)didModifyPoster
{
  v2 = self;
  sub_18B6AD090();
}

- (void)didSkipAvatar
{
  v2 = self;
  sub_18B6AD25C();
}

- (void)didSkipPoster
{
  v2 = self;
  sub_18B6AD2B8();
}

- (void)didCancelFromCarousel
{
  v2 = self;
  sub_18B6AD484();
}

- (void)didCancelFromOnboardingWelcome
{
  v2 = self;
  sub_18B6AD64C();
}

- (void)didCancelFromOnboardingNew
{
  v2 = self;
  sub_18B6AD810();
}

- (void)didCancelFromAvatarEditor
{
  v2 = self;
  sub_18B6AD9D8();
}

- (void)didCancelFromPosterEditor
{
  v2 = self;
  sub_18B6ADBD8();
}

- (void)didDelete
{
  v2 = self;
  sub_18B6ADDD8();
}

- (void)didFinish
{
  v2 = self;
  sub_18B6ADF94();
}

- (_TtC10ContactsUI22PosterEditFlowReporter)init
{
  return (_TtC10ContactsUI22PosterEditFlowReporter *)PosterEditFlowReporter.init()();
}

@end
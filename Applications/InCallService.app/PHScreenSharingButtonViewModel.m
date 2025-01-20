@interface PHScreenSharingButtonViewModel
- (NSString)callUUID;
- (PHScreenSharingButtonViewModel)init;
- (PHScreenSharingButtonViewModel)initWithCall:(id)a3 callCenter:(id)a4;
- (id)listenWith:(id)a3;
- (int64_t)currentState;
- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4;
- (void)userDidRequestScreenSharingToEnd;
- (void)userIsPresentingShareSheet;
@end

@implementation PHScreenSharingButtonViewModel

- (NSString)callUUID
{
  v2 = self;
  sub_10012A3EC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)currentState
{
  v2 = self;
  int64_t v3 = sub_10012A45C();

  return v3;
}

- (PHScreenSharingButtonViewModel)initWithCall:(id)a3 callCenter:(id)a4
{
  return (PHScreenSharingButtonViewModel *)sub_10012A59C(a3, (uint64_t)a4);
}

- (void)userDidRequestScreenSharingToEnd
{
  v2 = self;
  sub_10012AE94();
}

- (void)userIsPresentingShareSheet
{
  v2 = self;
  sub_10012B074();
}

- (PHScreenSharingButtonViewModel)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100129FFC((uint64_t)self + OBJC_IVAR___PHScreenSharingButtonViewModel_conversationProvider);
  swift_bridgeObjectRelease();

  swift_release();
}

- (id)listenWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)sub_10012B5E4((uint64_t)sub_10012CA80, v5);

  swift_release();

  return v7;
}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10012C2D0();
}

@end
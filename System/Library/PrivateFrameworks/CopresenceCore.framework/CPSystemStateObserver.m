@interface CPSystemStateObserver
- (BOOL)allowScreenSharing;
- (BOOL)allowScreenSharingInitiation;
- (BOOL)allowSharePlay;
- (CPSystemStateObserver)init;
- (CPSystemStateObserver)initWithQueue:(id)a3;
- (void)addObserver:(id)a3 withQueue:(id)a4;
- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
@end

@implementation CPSystemStateObserver

- (BOOL)allowSharePlay
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowSharePlay.getter);
}

- (BOOL)allowScreenSharing
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowScreenSharing.getter);
}

- (BOOL)allowScreenSharingInitiation
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowScreenSharingInitiation.getter);
}

- (CPSystemStateObserver)initWithQueue:(id)a3
{
  return (CPSystemStateObserver *)CPSystemStateObserver.init(queue:)(a3);
}

- (void)addObserver:(id)a3 withQueue:(id)a4
{
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xE0);
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  uint64_t v10 = v7();
  (*(void (**)(id, id))(*(void *)v10 + 160))(a3, v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (CPSystemStateObserver)init
{
  result = (CPSystemStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  specialized CPSystemStateObserver.audioPolicyManager(_:sharePlayAllowedStateChanged:)();
  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized CPSystemStateObserver.conversationManager(_:screeningChangedFor:)(v7);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized CPSystemStateObserver.conversationManager(_:stateChangedFor:)(v7);
}

@end
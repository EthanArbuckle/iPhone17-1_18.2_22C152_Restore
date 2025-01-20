@interface PlaybackController
- (_TtC9MusicCore18PlaybackController)init;
- (id)requestedPropertySetForEngine:(id)a3;
- (void)engine:(id)a3 didEndSharedListeningSessionWithError:(id)a4;
- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 didPauseForLeaseEndWithError:(id)a4;
- (void)engine:(id)a3 didReceiveSharedListeningEvent:(id)a4;
- (void)engine:(id)a3 requiresAuthorizationToPlayItem:(id)a4 reason:(int64_t)a5 authorizationHandler:(id)a6;
@end

@implementation PlaybackController

- (id)requestedPropertySetForEngine:(id)a3
{
  uint64_t v4 = one-time initialization token for properties;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  id v7 = (id)static SharedListening.Event.properties;

  return v7;
}

- (void)engine:(id)a3 didReceiveSharedListeningEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized PlaybackController.engine(_:didReceive:)(v7);
}

- (void)engine:(id)a3 didEndSharedListeningSessionWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  specialized PlaybackController.engine(_:didEndSharedListeningSessionWithError:)((uint64_t)a4);
}

- (void)engine:(id)a3 didPauseForLeaseEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  specialized PlaybackController.engine(_:didPauseForLeaseEndWithError:)(a4);
}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5
{
  type metadata accessor for UIMenu(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  v9 = (void *)swift_allocObject();
  v9[2] = a5;
  v9[3] = self;
  v9[4] = a4;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  id v13 = v11;
  v14 = v12;
  id v15 = v10;
  id v16 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(closure #1 in PlaybackController.engine(_:didFailToPlayFirstItem:withError:)partial apply, (uint64_t)v9);

  swift_release();
}

- (void)engine:(id)a3 requiresAuthorizationToPlayItem:(id)a4 reason:(int64_t)a5 authorizationHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  type metadata accessor for UIMenu(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  v12 = (void *)swift_allocObject();
  v12[2] = a5;
  v12[3] = self;
  v12[4] = a4;
  v12[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> ();
  v12[6] = v11;
  id v13 = a4;
  v14 = self;
  id v15 = v13;
  id v16 = a3;
  swift_retain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(partial apply for closure #1 in PlaybackController.engine(_:requiresAuthorizationToPlay:reason:authorizationHandler:), (uint64_t)v12);

  swift_release();

  swift_release();
}

- (_TtC9MusicCore18PlaybackController)init
{
  result = (_TtC9MusicCore18PlaybackController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC9MusicCore18PlaybackController_coordinator);
  swift_release();
  outlined consume of PlaybackController.NowPlayingPresentationDescriptor?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor), *(void *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor], *(void *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor + 8]);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore18PlaybackController_ageVerificationWrapper);
}

@end
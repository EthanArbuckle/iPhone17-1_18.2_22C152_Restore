@interface SiriQuickTypeGestureActivationManager
- (_TtC4Siri37SiriQuickTypeGestureActivationManager)init;
- (void)canActivateWithCompletionHandler:(id)a3;
- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
@end

@implementation SiriQuickTypeGestureActivationManager

- (_TtC4Siri37SiriQuickTypeGestureActivationManager)init
{
  return (_TtC4Siri37SiriQuickTypeGestureActivationManager *)SiriQuickTypeGestureActivationManager.init()();
}

- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007D3B4(&qword_100171280);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001712F0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001712F8;
  v12[5] = v11;
  swift_retain();
  sub_10009276C((uint64_t)v7, (uint64_t)&unk_100171300, (uint64_t)v12);
  swift_release();
}

- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007D3B4(&qword_100171280);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001712D0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001712D8;
  v12[5] = v11;
  swift_retain();
  sub_10009276C((uint64_t)v7, (uint64_t)&unk_1001712E0, (uint64_t)v12);
  swift_release();
}

- (void)canActivateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007D3B4(&qword_100171280);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100171290;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001712A0;
  v12[5] = v11;
  swift_retain();
  sub_10009276C((uint64_t)v7, (uint64_t)&unk_1001712B0, (uint64_t)v12);
  swift_release();
}

@end
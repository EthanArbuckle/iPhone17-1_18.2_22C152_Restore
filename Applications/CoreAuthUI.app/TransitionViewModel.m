@interface TransitionViewModel
+ (_TtC10CoreAuthUI19TransitionViewModel)shared;
- (_TtC10CoreAuthUI19TransitionViewModel)init;
- (id)childControllerFor:(int64_t)a3 type:(int64_t)a4 allowsLandscape:(BOOL)a5;
- (id)delegates;
- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4;
- (void)mechanismEvent:(int64_t)a3 reply:(id)a4;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setDelegates:(id)a3;
- (void)setupConnection;
- (void)suspendConnection;
- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5;
@end

@implementation TransitionViewModel

+ (_TtC10CoreAuthUI19TransitionViewModel)shared
{
  if (qword_10009E5A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10009FC00;

  return (_TtC10CoreAuthUI19TransitionViewModel *)v2;
}

- (id)delegates
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  return *v2;
}

- (void)setDelegates:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC10CoreAuthUI19TransitionViewModel)init
{
  return (_TtC10CoreAuthUI19TransitionViewModel *)sub_1000349FC();
}

- (id)childControllerFor:(int64_t)a3 type:(int64_t)a4 allowsLandscape:(BOOL)a5
{
  v8 = self;
  v9 = sub_100035070(a3, a4, a5);

  return v9;
}

- (void)setupConnection
{
  v2 = self;
  sub_100037328();
}

- (void)suspendConnection
{
  v2 = self;
  sub_100037B90();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__connection;
  uint64_t v4 = sub_100028560(&qword_10009D1D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__remoteUIHost;
  uint64_t v6 = sub_100028560(&qword_10009D1D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__mechanism;
  uint64_t v8 = sub_100028560(&qword_10009D1E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__backoffCounter;
  uint64_t v10 = sub_100028560(&qword_10009D1E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__internalInfo;
  uint64_t v12 = sub_100028560(&qword_10009D1F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__controllerToShow;
  uint64_t v14 = sub_100028560(&qword_10009D1F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__completionHandler;
  uint64_t v16 = sub_100028560((uint64_t *)&unk_10009D200);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  v17 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_log;
  uint64_t v18 = type metadata accessor for Logger();
  v19 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);

  v19(v17, v18);
}

- (void)mechanismEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_10003A328;
  }
  else
  {
    uint64_t v7 = 0;
  }
  memset(v9, 0, sizeof(v9));
  uint64_t v8 = self;
  sub_100037FA8(a3, (uint64_t)v9, (uint64_t)v6, v7);
  sub_10002F024((uint64_t)v9, &qword_10009D580);
  sub_10002A998((uint64_t)v6);
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (!a4)
  {
    memset(v12, 0, sizeof(v12));
    v11 = self;
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v9 = self;
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  uint64_t v8 = sub_10003A328;
LABEL_6:
  sub_100037FA8(a3, (uint64_t)v12, (uint64_t)v8, v10);
  sub_10002A998((uint64_t)v8);

  sub_10002F024((uint64_t)v12, &qword_10009D580);
}

- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_10002A9E0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_10003847C(a3, (uint64_t)v6, v7);
  sub_10002A998((uint64_t)v6);
}

- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_100039E7C;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  sub_100038760(a3, (uint64_t)a4, (uint64_t)v8, v9);
  sub_10002A998((uint64_t)v8);

  swift_bridgeObjectRelease();
}

@end
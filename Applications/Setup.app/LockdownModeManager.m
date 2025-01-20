@interface LockdownModeManager
- (BOOL)hasStagedEnablement;
- (_TtC5Setup19LockdownModeManager)init;
- (int64_t)accountState;
- (int64_t)deviceState;
- (void)acknowledgeWithCompletionHandler:(id)a3;
- (void)enableWithStrategy:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchAccountStateWithCompletionHandler:(id)a3;
- (void)setHasStagedEnablement:(BOOL)a3;
@end

@implementation LockdownModeManager

- (int64_t)deviceState
{
  return sub_100037DB8(self, (uint64_t)a2, (uint64_t (*)(void))&LockdownModeManager.enabled.getter);
}

- (int64_t)accountState
{
  return sub_100037DB8(self, (uint64_t)a2, (uint64_t (*)(void))&LockdownModeManager.enabledInAccount.getter);
}

- (BOOL)hasStagedEnablement
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement);
}

- (void)setHasStagedEnablement:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement) = a3;
}

- (void)fetchAccountStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10031DF58;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031DF60;
  v12[5] = v11;
  v13 = self;
  sub_10003F8F8((uint64_t)v7, (uint64_t)&unk_10031DF68, (uint64_t)v12);
  swift_release();
}

- (void)enableWithStrategy:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031DF38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031DF40;
  v14[5] = v13;
  v15 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031DF48, (uint64_t)v14);
  swift_release();
}

- (void)acknowledgeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10031DF28;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031E190;
  v12[5] = v11;
  v13 = self;
  sub_10003F8F8((uint64_t)v7, (uint64_t)&unk_10031D850, (uint64_t)v12);
  swift_release();
}

- (_TtC5Setup19LockdownModeManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager____lazy_storage___manager) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LockdownModeManager();
  return [(LockdownModeManager *)&v3 init];
}

- (void).cxx_destruct
{
}

@end
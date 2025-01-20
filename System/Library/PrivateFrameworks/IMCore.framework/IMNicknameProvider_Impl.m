@interface IMNicknameProvider_Impl
- (BOOL)hasObservedTransitionForHandleID:(id)a3;
- (BOOL)haveNicknamesLoaded;
- (IMNicknameProvider_Impl)init;
- (id)allNicknamesForContact:(id)a3;
- (id)currentNicknameForContact:(id)a3;
- (id)nicknameForContact:(id)a3;
- (id)nicknameForHandleID:(id)a3;
- (id)pendingNicknameForContact:(id)a3;
- (id)unknownSenderRecordInfoFor:(id)a3;
- (void)bannerActionTappedFrom:(id)a3 on:(unint64_t)a4;
- (void)connectionStartedWithNotification:(id)a3;
- (void)dealloc;
- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3;
- (void)nicknamesDidChangeWithNotification:(id)a3;
- (void)sendNameOnlyTo:(id)a3 from:(id)a4;
- (void)sendPersonalNicknameTo:(id)a3;
- (void)sendPersonalNicknameTo:(id)a3 from:(id)a4;
- (void)setNicknameListener:(id)a3;
- (void)setPersonalNicknameWith:(id)a3;
- (void)updatePendingNicknameWith:(id)a3;
@end

@implementation IMNicknameProvider_Impl

- (IMNicknameProvider_Impl)init
{
  return (IMNicknameProvider_Impl *)NicknameProvider.init()();
}

- (BOOL)haveNicknamesLoaded
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController), sel_isInitialLoadComplete);
}

- (void)connectionStartedWithNotification:(id)a3
{
  uint64_t v4 = sub_1A4CBAE0C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4CBADFC();
  v8 = self;
  sub_1A4CAF0FC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dealloc
{
  v2 = self;
  NicknameProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1A4CAC9A0((uint64_t)self + OBJC_IVAR___IMNicknameProvider_Impl_listener);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
}

- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A4B0E048((uint64_t *)&unk_1EB3F2030);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A4CBB1DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E965DCD8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E965DBF0;
  v12[5] = v11;
  v13 = self;
  sub_1A4CB3944((uint64_t)v7, (uint64_t)&unk_1E965D260, (uint64_t)v12);
  swift_release();
}

- (id)nicknameForHandleID:(id)a3
{
  uint64_t v4 = sub_1A4CBB0CC();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_1A4CAFD38(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)nicknameForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1A4CAFF2C((uint64_t)v4);

  return v6;
}

- (id)currentNicknameForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1A4CAFFA0((uint64_t)v4);

  return v6;
}

- (id)pendingNicknameForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1A4CB0014((uint64_t)v4);

  return v6;
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  sub_1A4CBB0CC();
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v10[4] = nullsub_31;
  v10[5] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1A4B02D48;
  v10[3] = &unk_1EF8E75D8;
  uint64_t v5 = _Block_copy(v10);
  id v6 = self;
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  v7 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  id v8 = (void *)sub_1A4CBB0BC();
  LOBYTE(v7) = objc_msgSend(v7, sel_hasObservedTransitionForHandleID_, v8);

  swift_bridgeObjectRelease();
  return (char)v7;
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
  uint64_t v6 = sub_1A4CBB0CC();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1A4CB0464(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (id)allNicknamesForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A4CB099C((uint64_t)v4);

  sub_1A4CB4FE0();
  uint64_t v6 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)updatePendingNicknameWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A4CB0E44(v4);
}

- (void)setPersonalNicknameWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A4CB1314(v4);
}

- (void)nicknamesDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A4CB15EC(v4);
}

- (void)setNicknameListener:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v7[4] = nullsub_31;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1A4B02D48;
  v7[3] = &unk_1EF8E4608;
  uint64_t v5 = _Block_copy(v7);
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
}

- (void)sendPersonalNicknameTo:(id)a3
{
  uint64_t v4 = sub_1A4CBB0CC();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  sub_1A4CB1948(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)sendPersonalNicknameTo:(id)a3 from:(id)a4
{
  uint64_t v5 = sub_1A4CBB0CC();
  unint64_t v7 = v6;
  uint64_t v8 = sub_1A4CBB0CC();
  unint64_t v10 = v9;
  v11 = self;
  sub_1A4CB1C24(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sendNameOnlyTo:(id)a3 from:(id)a4
{
  uint64_t v5 = sub_1A4CBB15C();
  uint64_t v6 = sub_1A4CBB0CC();
  unint64_t v8 = v7;
  unint64_t v9 = self;
  sub_1A4CB1FB4(v5, v6, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)unknownSenderRecordInfoFor:(id)a3
{
  uint64_t v4 = sub_1A4CBB0CC();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  uint64_t v8 = sub_1A4CB22D0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_1A4B0E048((uint64_t *)&unk_1E965B5F0);
    unint64_t v9 = (void *)sub_1A4CBB14C();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)bannerActionTappedFrom:(id)a3 on:(unint64_t)a4
{
  uint64_t v6 = sub_1A4CBB0CC();
  unint64_t v8 = v7;
  unint64_t v9 = self;
  sub_1A4CB2618(v6, v8, a4);

  swift_bridgeObjectRelease();
}

@end
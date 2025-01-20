@interface IMDScheduledMessageCoordinator
+ (void)notifyPeersWithScheduledMessageUpdate:(id)a3 scheduleState:(unint64_t)a4;
- (IMDScheduledMessageCoordinator)init;
- (IMDScheduledMessageCoordinator)initWithServiceSession:(id)a3;
- (id)description;
- (id)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7;
- (void)dealloc;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14;
- (void)handleMessageDidReplace:(id)a3 newMessage:(id)a4;
- (void)informOfCancelledMessageWithMessageGUID:(id)a3 success:(BOOL)a4 cancelType:(unint64_t)a5 error:(id)a6;
- (void)removeFailedEditsFrom:(id)a3;
- (void)serviceSession:(id)a3 willMoveChatToRecentlyDeleted:(id)a4;
- (void)serviceSession:(id)a3 willRemoveChat:(id)a4;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)timerDidFire;
- (void)updateTimerForTimeInterval:(double)a3;
@end

@implementation IMDScheduledMessageCoordinator

- (IMDScheduledMessageCoordinator)initWithServiceSession:(id)a3
{
  v4 = self;
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  id v7 = objc_msgSend(self, sel_sharedInstance);
  id v8 = objc_msgSend(self, sel_sharedInstance);
  id v9 = objc_allocWithZone((Class)IMDScheduledMessageCoordinator);
  v10 = (IMDScheduledMessageCoordinator *)sub_1D98BFC74(v5, v6, v7, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (void)dealloc
{
  v2 = self;
  sub_1D98C0318();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDScheduledMessageCoordinator_timer);
}

- (void)updateTimerForTimeInterval:(double)a3
{
  v4 = self;
  sub_1D98C05A8(a3);
}

- (void)informOfCancelledMessageWithMessageGUID:(id)a3 success:(BOOL)a4 cancelType:(unint64_t)a5 error:(id)a6
{
  uint64_t v10 = sub_1D9906DA0();
  uint64_t v12 = v11;
  id v14 = a6;
  v13 = self;
  sub_1D98C8804(v10, v12, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)removeFailedEditsFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D98C97DC(v4);
}

- (void)timerDidFire
{
  v2 = self;
  sub_1D98C2EC4();
}

- (id)description
{
  v2 = self;
  sub_1D98C4ADC();

  v3 = (void *)sub_1D9906D70();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMDScheduledMessageCoordinator)init
{
  result = (IMDScheduledMessageCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleMessageDidReplace:(id)a3 newMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D98C6C90(v6, v7);
}

+ (void)notifyPeersWithScheduledMessageUpdate:(id)a3 scheduleState:(unint64_t)a4
{
  uint64_t v5 = sub_1D9906DA0();
  sub_1D98C9F98(v5, v6, a4);

  swift_bridgeObjectRelease();
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  uint64_t v13 = sub_1D96867CC(&qword_1EBE2AD70);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1D9906DA0();
  unint64_t v18 = v17;
  if (a7)
  {
    sub_1D9906520();
    uint64_t v19 = sub_1D9906550();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_1D9906550();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  }
  id v21 = a3;
  id v22 = a6;
  v23 = self;
  sub_1D98CAA10(v21, v16, v18, a5);

  swift_bridgeObjectRelease();
  sub_1D968E508((uint64_t)v15, &qword_1EBE2AD70);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14
{
  uint64_t v17 = sub_1D9906DA0();
  unint64_t v19 = v18;
  id v20 = a11;
  id v21 = self;
  sub_1D98CAF28(a3, v17, v19, a5);

  swift_bridgeObjectRelease();
}

- (id)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7
{
  int v8 = a5;
  uint64_t v11 = (void (*)(void, void, void))sub_1D9906DA0();
  uint64_t v13 = v12;
  id v14 = a3;
  id v15 = a7;
  uint64_t v16 = self;
  sub_1D98CB284(v14, v11, v13, v8);
  unint64_t v18 = v17;

  swift_bridgeObjectRelease();

  return v18;
}

- (void)serviceSession:(id)a3 willRemoveChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  sub_1D98CCBA0(v7, "%@ Handling chat %@ being removed.");
}

- (void)serviceSession:(id)a3 willMoveChatToRecentlyDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  sub_1D98CCBA0(v7, "%@ Handling chat %@ being moved to recently deleted.");
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v2 = qword_1EBE2ADF8;
  id v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D9906BA0();
  sub_1D9686810(v3, (uint64_t)qword_1EBE2C280);
  id v4 = sub_1D9906B80();
  os_log_type_t v5 = sub_1D9907160();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D967A000, v4, v5, "Notified about leaving dataProtection lock", v6, 2u);
    MEMORY[0x1E016AD90](v6, -1, -1);
  }

  [(IMDScheduledMessageCoordinator *)v7 updateTimerForTimeInterval:120.0];
}

@end
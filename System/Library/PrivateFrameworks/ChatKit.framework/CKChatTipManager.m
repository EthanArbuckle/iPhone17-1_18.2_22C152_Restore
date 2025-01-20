@interface CKChatTipManager
- (BOOL)presentingTip;
- (CKCheckInTipsViewDelegate)checkInDelegate;
- (_TtC7ChatKit16CKChatTipManager)init;
- (_TtC7ChatKit16CKChatTipManager)initWithChatController:(id)a3;
- (void)chatControllerDidAppear;
- (void)chatControllerDidDisappear;
- (void)dismissTipIfPresented;
- (void)presentCheckInTip;
- (void)setCheckInDelegate:(id)a3;
- (void)undoOrEditMessageUsed;
@end

@implementation CKChatTipManager

- (CKCheckInTipsViewDelegate)checkInDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit16CKChatTipManager_checkInDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKCheckInTipsViewDelegate *)v3;
}

- (void)setCheckInDelegate:(id)a3
{
}

- (_TtC7ChatKit16CKChatTipManager)initWithChatController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC7ChatKit16CKChatTipManager *)sub_18F574C9C(v3);

  return v4;
}

- (void)chatControllerDidAppear
{
}

- (void)chatControllerDidDisappear
{
  v2 = self;
  sub_18F571C1C();
}

- (void)undoOrEditMessageUsed
{
  uint64_t v3 = sub_18F7B6D50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v9[0] = sub_18F570D88();
  v9[1] = v8;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4F422A0], v3);
  sub_18F574E5C();
  sub_18F7B6BA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (void)dismissTipIfPresented
{
  v2 = self;
  sub_18F5727A8();
}

- (BOOL)presentingTip
{
  v2 = self;
  char v3 = sub_18F572904();

  return v3 & 1;
}

- (void)presentCheckInTip
{
}

- (_TtC7ChatKit16CKChatTipManager)init
{
  result = (_TtC7ChatKit16CKChatTipManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit16CKChatTipManager_checkInDelegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end
@interface CKBalloonEmphasisManager
- (BOOL)isEmphasisActive;
- (BOOL)isMessageEmphasizedWithChatItemGUID:(id)a3;
- (CKBalloonEmphasisManager)init;
- (void)addEmphasisWithAssociatedChatItemGUID:(id)a3;
- (void)addEmphasisWithChatItemGUID:(id)a3;
- (void)clearEmphasisGUIDs;
@end

@implementation CKBalloonEmphasisManager

- (BOOL)isEmphasisActive
{
  v2 = (char *)self + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedChatItemGUIDs;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) != 0;
}

- (void)addEmphasisWithChatItemGUID:(id)a3
{
}

- (void)addEmphasisWithAssociatedChatItemGUID:(id)a3
{
}

- (void)clearEmphasisGUIDs
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedChatItemGUIDs);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC870];
  void *v3 = MEMORY[0x1E4FBC870];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.isa + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedAssociatedChatItemGUIDs);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)isMessageEmphasizedWithChatItemGUID:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedChatItemGUIDs);
  swift_beginAccess();
  uint64_t v8 = *v7;
  v9 = self;
  sub_18F7B6CA0();
  char v10 = sub_18F5EBB94(v4, v6, v8);
  swift_bridgeObjectRelease();
  v11 = (uint64_t *)((char *)v9 + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedAssociatedChatItemGUIDs);
  swift_beginAccess();
  uint64_t v12 = *v11;
  sub_18F7B6CA0();
  LOBYTE(v4) = sub_18F5EBB94(v4, v6, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v10 | v4) & 1;
}

- (CKBalloonEmphasisManager)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedChatItemGUIDs) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKBalloonEmphasisManager_emphasizedAssociatedChatItemGUIDs) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BalloonEmphasisManager();
  return [(CKBalloonEmphasisManager *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
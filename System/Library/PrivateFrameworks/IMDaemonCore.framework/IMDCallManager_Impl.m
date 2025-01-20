@interface IMDCallManager_Impl
- (IMDCallManager_Impl)init;
- (IMDCallManager_Impl)initWithServiceSession:(id)a3;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 conversationUpdatedMessagesGroupUUID:(id)a4;
- (void)dealloc;
@end

@implementation IMDCallManager_Impl

- (IMDCallManager_Impl)initWithServiceSession:(id)a3
{
  v4 = self;
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  id v7 = objc_msgSend(v6, sel_conversationManager);

  id v8 = objc_msgSend(self, sel_sharedFeatureFlags);
  id v9 = objc_allocWithZone((Class)type metadata accessor for CallManager());
  v10 = sub_1D98864DC(v5, v7, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (IMDCallManager_Impl *)v10;
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDCallManager_Impl_newChatListenerTask))
  {
    v3 = self;
    swift_retain();
    sub_1D9907040();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CallManager();
  [(IMDCallManager_Impl *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
}

- (IMDCallManager_Impl)init
{
  result = (IMDCallManager_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D988E894(v7, "Received notification that conversation was added: %@", (uint64_t)&unk_1F3392EF0, (uint64_t)&unk_1EA8C8A48);
}

- (void)conversationManager:(id)a3 conversationUpdatedMessagesGroupUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D988E894(v7, "Received notification that conversation messagesGroupUUID was added: %@", (uint64_t)&unk_1F3392E78, (uint64_t)&unk_1EA8C89B0);
}

@end
@interface EDDaemonInterfaceFactory
- (EDCategorySubsystem)categorySubsystem;
- (EDDaemonInterfaceFactory)initWithPersistence:(id)a3 categorySubsystem:(id)a4;
- (EDPersistence)persistence;
- (id)newAccountRepository;
- (id)newActivityRegistry;
- (id)newClientResumerWithClientState:(id)a3;
- (id)newDiagnosticInfoGathererWithServerRemoteClientsProvider:(id)a3;
- (id)newFetchController;
- (id)newMailboxRepository;
- (id)newMessageRepositoryWithResumable:(id)a3;
- (id)newOutgoingMessageRepository;
- (id)newSearchableIndex;
- (id)newSenderRepository;
- (id)newVIPManagerInterface;
- (id)sharedInteractionLogger;
- (void)setCategorySubsystem:(id)a3;
- (void)test_tearDown;
@end

@implementation EDDaemonInterfaceFactory

- (id)newMailboxRepository
{
  v3 = [EDMailboxRepository alloc];
  v4 = [(EDDaemonInterfaceFactory *)self persistence];
  v5 = [v4 mailboxPersistence];
  v6 = [(EDMailboxRepository *)v3 initWithMailboxPersistence:v5];

  return v6;
}

- (id)newDiagnosticInfoGathererWithServerRemoteClientsProvider:(id)a3
{
  id v4 = a3;
  v5 = [EDDiagnosticInfoGatherer alloc];
  id v6 = [(EDDaemonInterfaceFactory *)self newFetchController];
  v7 = [(EDDaemonInterfaceFactory *)self persistence];
  v8 = [(EDDiagnosticInfoGatherer *)v5 initWithFetchController:v6 remoteClientsProvider:v4 persistence:v7];

  return v8;
}

- (id)newClientResumerWithClientState:(id)a3
{
  id v4 = a3;
  v5 = [EDClientResumer alloc];
  id v6 = [MEMORY[0x1E4F29268] currentConnection];
  v7 = EFBundleIdentifierForXPCConnection();
  v8 = [(EDDaemonInterfaceFactory *)self persistence];
  v9 = [v8 hookRegistry];
  v10 = [(EDClientResumer *)v5 initWithClientBundleIdentifier:v7 hookRegistry:v9 clientState:v4];

  return v10;
}

- (id)newAccountRepository
{
  v3 = [EDAccountRepository alloc];
  id v4 = [(EDDaemonInterfaceFactory *)self persistence];
  v5 = [v4 accountsProvider];
  id v6 = [(EDDaemonInterfaceFactory *)self persistence];
  v7 = [v6 hookRegistry];
  v8 = [(EDAccountRepository *)v3 initWithAccountsProvider:v5 hookRegistry:v7];

  return v8;
}

- (id)newMessageRepositoryWithResumable:(id)a3
{
  id v54 = a3;
  id v4 = [EDMessageRepository alloc];
  v46 = [(EDDaemonInterfaceFactory *)self persistence];
  v53 = [v46 messagePersistence];
  v45 = [(EDDaemonInterfaceFactory *)self persistence];
  v52 = [v45 conversationPersistence];
  v44 = [(EDDaemonInterfaceFactory *)self persistence];
  v43 = [v44 threadPersistence];
  v42 = [(EDDaemonInterfaceFactory *)self persistence];
  v41 = [v42 remoteContentPersistence];
  v40 = [(EDDaemonInterfaceFactory *)self persistence];
  v39 = [v40 messageChangeManager];
  v38 = [(EDDaemonInterfaceFactory *)self persistence];
  v37 = [v38 richLinkPersistence];
  v36 = [(EDDaemonInterfaceFactory *)self persistence];
  v5 = [v36 attachmentPersistenceManager];
  v35 = [(EDDaemonInterfaceFactory *)self persistence];
  id v6 = [v35 categoryPersistence];
  v34 = [(EDDaemonInterfaceFactory *)self persistence];
  v33 = [v34 senderPersistence];
  v32 = [(EDDaemonInterfaceFactory *)self persistence];
  v7 = [v32 activityPersistence];
  v31 = [(EDDaemonInterfaceFactory *)self persistence];
  v30 = [v31 businessPersistence];
  v29 = [(EDDaemonInterfaceFactory *)self persistence];
  v8 = [v29 businessCloudStorage];
  v28 = [(EDDaemonInterfaceFactory *)self persistence];
  v51 = [v28 hookRegistry];
  v27 = [(EDDaemonInterfaceFactory *)self persistence];
  v50 = [v27 mailboxPersistence];
  v26 = [(EDDaemonInterfaceFactory *)self persistence];
  v25 = [v26 searchProvider];
  v24 = [(EDDaemonInterfaceFactory *)self persistence];
  v9 = [v24 userProfileProvider];
  v23 = [(EDDaemonInterfaceFactory *)self persistence];
  v22 = [v23 vipManager];
  id v49 = [(EDDaemonInterfaceFactory *)self newFetchController];
  v21 = [(EDDaemonInterfaceFactory *)self persistence];
  v48 = [v21 remoteContentManager];
  v20 = [(EDDaemonInterfaceFactory *)self persistence];
  v47 = [v20 remoteContentCacheConfiguration];
  v19 = [(EDDaemonInterfaceFactory *)self persistence];
  v18 = [v19 blockedSenderManager];
  v17 = [(EDDaemonInterfaceFactory *)self persistence];
  v10 = [v17 listUnsubscribeHandler];
  v16 = [(EDDaemonInterfaceFactory *)self persistence];
  v15 = [v16 remindMeNotificationController];
  v14 = [(EDDaemonInterfaceFactory *)self persistence];
  v11 = [v14 accountsProvider];
  v13 = -[EDMessageRepository initWithMessagePersistence:conversationPersistence:threadPersistence:remoteContentPersistence:messageChangeManager:richLinkPersistence:attachmentPersistenceManager:categoryPersistence:senderPersistence:activityPersistence:businessPersistence:businessCloudStorage:hookRegistry:mailboxPersistence:searchProvider:userProfileProvider:vipManager:fetchController:observerResumer:remoteContentManager:remoteContentCacheConfiguration:blockedSenderManager:listUnsubscribeHandler:remindMeNotificationController:accountsProvider:](v4, "initWithMessagePersistence:conversationPersistence:threadPersistence:remoteContentPersistence:messageChangeManager:richLinkPersistence:attachmentPersistenceManager:categoryPersistence:senderPersistence:activityPersistence:businessPersistence:businessCloudStorage:hookRegistry:mailboxPersistence:searchProvider:userProfileProvider:vipManager:fetchController:observerResumer:remoteContentManager:remoteContentCacheConfiguration:blockedSenderManager:listUnsubscribeHandler:remindMeNotificationController:accountsProvider:", v53, v52, v43, v5, v6, v33, v7, v30, v8, v51, v50, v25, v9,
          v22,
          v49,
          v54,
          v48,
          v47,
          v18,
          v10,
          v15,
          v11);

  return v13;
}

- (EDPersistence)persistence
{
  return self->_persistence;
}

- (id)newActivityRegistry
{
  v3 = [EDActivityRegistry alloc];
  id v4 = [(EDPersistence *)self->_persistence hookRegistry];
  v5 = [(EDPersistence *)self->_persistence activityPersistence];
  id v6 = [(EDActivityRegistry *)v3 initWithHookRegistry:v4 activityPersistence:v5];

  return v6;
}

- (EDDaemonInterfaceFactory)initWithPersistence:(id)a3 categorySubsystem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDDaemonInterfaceFactory;
  v9 = [(EDDaemonInterfaceFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistence, a3);
    objc_storeStrong((id *)&v10->_categorySubsystem, a4);
  }

  return v10;
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDDaemonInterfaceFactory.m", 47, @"%s can only be called from unit tests", "-[EDDaemonInterfaceFactory test_tearDown]");
  }
  id v4 = [(EDDaemonInterfaceFactory *)self persistence];
  objc_msgSend(v4, "test_tearDown");
}

- (id)newFetchController
{
  return 0;
}

- (id)newOutgoingMessageRepository
{
}

- (id)newSenderRepository
{
  v3 = [EDSenderRepository alloc];
  id v4 = [(EDDaemonInterfaceFactory *)self persistence];
  id v5 = [v4 senderPersistence];
  id v6 = [(EDSenderRepository *)v3 initWithSenderPersistence:v5];

  return v6;
}

- (id)newSearchableIndex
{
  v2 = [(EDDaemonInterfaceFactory *)self persistence];
  v3 = [v2 searchableIndexManager];

  [v3 enableIndexingAndBeginScheduling:0];
  id v4 = [v3 index];

  return v4;
}

- (id)sharedInteractionLogger
{
  v2 = [(EDDaemonInterfaceFactory *)self categorySubsystem];
  v3 = [v2 interactionLogger];

  return v3;
}

- (id)newVIPManagerInterface
{
  v3 = [EDVIPManagerProxy alloc];
  id v4 = [(EDDaemonInterfaceFactory *)self persistence];
  id v5 = [v4 vipManager];
  id v6 = [(EDVIPManagerProxy *)v3 initWithVIPManager:v5];

  return v6;
}

- (EDCategorySubsystem)categorySubsystem
{
  return self->_categorySubsystem;
}

- (void)setCategorySubsystem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySubsystem, 0);

  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
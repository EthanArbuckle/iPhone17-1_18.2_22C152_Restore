@interface DaemonInterfaceFactory
- (DaemonInterfaceFactory)initWithPersistence:(id)a3 categorySubsystem:(id)a4 sharedFetchController:(id)a5;
- (id)newFetchController;
- (id)newOutgoingMessageRepository;
@end

@implementation DaemonInterfaceFactory

- (DaemonInterfaceFactory)initWithPersistence:(id)a3 categorySubsystem:(id)a4 sharedFetchController:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DaemonInterfaceFactory;
  v10 = [(DaemonInterfaceFactory *)&v13 initWithPersistence:a3 categorySubsystem:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_sharedFetchController, a5);
  }

  return v11;
}

- (id)newFetchController
{
  return self->_sharedFetchController;
}

- (id)newOutgoingMessageRepository
{
  v3 = [OutgoingMessageRepository_iOS alloc];
  v4 = [(DaemonInterfaceFactory *)self persistence];
  v5 = [v4 messagePersistence];
  v6 = [(DaemonInterfaceFactory *)self persistence];
  v7 = [v6 messageChangeManager];
  v8 = [(OutgoingMessageRepository_iOS *)v3 initWithMessagePersistence:v5 messageChangeManager:v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end
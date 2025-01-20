@interface EMFetchController
+ (id)remoteInterface;
- (EMFetchController)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (id)diagnosticInformation;
- (void)performFetchForOTC;
- (void)performFetchOfType:(int)a3;
- (void)performFetchOfType:(int)a3 accounts:(id)a4;
- (void)performFetchOfType:(int)a3 mailboxes:(id)a4;
- (void)setConnection:(id)a3;
- (void)setSuppressedContexts:(id)a3;
@end

@implementation EMFetchController

- (void)performFetchOfType:(int)a3 mailboxes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_13);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(EMFetchController *)self connection];
  v7 = [v6 remoteObjectProxy];
  [v7 performFetchOfType:v4 mailboxObjectIds:v8];
}

- (void)performFetchOfType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(EMFetchController *)self connection];
  uint64_t v4 = [v5 remoteObjectProxy];
  [v4 performFetchOfType:v3];
}

- (void)setSuppressedContexts:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(EMFetchController *)self connection];
  id v5 = [v4 remoteObjectProxy];
  [v5 setSuppressedContexts:v6];
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86AF8];
  [v5 setClasses:v4 forSelector:sel_performFetchOfType_mailboxObjectIds_ argumentIndex:1 ofReply:0];

  return v5;
}

- (EMFetchController)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFetchController;
  id v6 = [(EMFetchController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

id __50__EMFetchController_performFetchOfType_mailboxes___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (void)performFetchForOTC
{
  id v3 = [(EMFetchController *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 performFetchForOTC];
}

- (void)performFetchOfType:(int)a3 accounts:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_65);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(EMFetchController *)self connection];
  v7 = [v6 remoteObjectProxy];
  [v7 performFetchOfType:v4 accountIds:v8];
}

id __49__EMFetchController_performFetchOfType_accounts___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  id v3 = [v2 representedObjectID];

  return v3;
}

- (id)diagnosticInformation
{
  v2 = [(EMFetchController *)self connection];
  id v3 = [v2 remoteObjectProxy];
  uint64_t v4 = [v3 diagnosticInformation];

  return v4;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface Client
- (BOOL)entitled;
- (Client)initWithConnection:(id)a3 entitled:(BOOL)a4;
- (int)pid;
- (void)didWriteLog:(id)a3 filePath:(id)a4;
- (void)failedToWriteLog:(id)a3 error:(id)a4;
- (void)registerForEvents:(id)a3 replyHandler:(id)a4;
- (void)registerForWrites:(id)a3 replyHandler:(id)a4;
- (void)willWriteLog:(id)a3 details:(id)a4;
@end

@implementation Client

- (Client)initWithConnection:(id)a3 entitled:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)Client;
  v8 = [(Client *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_entitled = a4;
    objc_storeStrong((id *)&v8->_connection, a3);
    uint64_t v10 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v10;

    eventTypes = v9->_eventTypes;
    v9->_eventTypes = 0;

    writeTypes = v9->_writeTypes;
    v9->_writeTypes = 0;
  }
  return v9;
}

- (int)pid
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

- (void)willWriteLog:(id)a3 details:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  eventTypes = self->_eventTypes;
  v8 = [v14 bugType];
  LODWORD(eventTypes) = [(NSSet *)eventTypes containsObject:v8];

  if (eventTypes)
  {
    id v9 = [objc_alloc((Class)OSALogEvent) initWithIdentity:v14 details:v6];
    uint64_t v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v10 receivedLogEvent:v9];
  }
  writeTypes = self->_writeTypes;
  v12 = [v14 bugType];
  LODWORD(writeTypes) = [(NSSet *)writeTypes containsObject:v12];

  if (writeTypes)
  {
    v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v13 willWriteLog:v14];
  }
}

- (void)didWriteLog:(id)a3 filePath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  writeTypes = self->_writeTypes;
  v8 = [v11 bugType];
  LODWORD(writeTypes) = [(NSSet *)writeTypes containsObject:v8];

  if (writeTypes)
  {
    id v9 = [objc_alloc((Class)OSALogWriteResult) initWithIdentity:v11 filePath:v6];
    uint64_t v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v10 didWriteLog:v9];
  }
}

- (void)failedToWriteLog:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  writeTypes = self->_writeTypes;
  v8 = [v11 bugType];
  LODWORD(writeTypes) = [(NSSet *)writeTypes containsObject:v8];

  if (writeTypes)
  {
    id v9 = [objc_alloc((Class)OSALogWriteResult) initWithIdentity:v11 error:v6];
    uint64_t v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v10 didWriteLog:v9];
  }
}

- (void)registerForEvents:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_10000EE04(v9);
  if (self->_entitled)
  {
    objc_storeStrong((id *)&self->_eventTypes, a3);
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v8 = sub_10000EF9C();
    v7[2](v7, v8);

    id v7 = (void (**)(id, void))v8;
  }
}

- (void)registerForWrites:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_10000EE04(v9);
  if (self->_entitled)
  {
    objc_storeStrong((id *)&self->_writeTypes, a3);
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v8 = sub_10000EF9C();
    v7[2](v7, v8);

    id v7 = (void (**)(id, void))v8;
  }
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTypes, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end
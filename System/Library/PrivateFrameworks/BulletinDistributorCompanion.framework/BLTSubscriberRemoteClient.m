@interface BLTSubscriberRemoteClient
- (BLTSubscriberRemoteClient)init;
- (BLTSubscriberRemoteClient)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)sectionIDs;
- (id)sectionIDsForBulletins;
- (id)subscriptionInfos;
- (void)dealloc;
- (void)pingWithBulletin:(id)a3;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation BLTSubscriberRemoteClient

- (BLTSubscriberRemoteClient)init
{
  return [(BLTSubscriberRemoteClient *)self initWithConnection:0];
}

- (BLTSubscriberRemoteClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTSubscriberRemoteClient;
  v6 = [(BLTSubscriberRemoteClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTSubscriberRemoteClient;
  [(BLTSubscriberRemoteClient *)&v4 dealloc];
}

- (id)sectionIDs
{
  return 0;
}

- (id)sectionIDsForBulletins
{
  return 0;
}

- (id)subscriptionInfos
{
  return 0;
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 pingWithRecordID:v7 forSectionID:v6];
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v11 pingWithRecordID:v10 forSectionID:v9 ack:v8];
}

- (void)pingWithBulletin:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 pingWithBulletin:v4];
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 pingWithBulletin:v7 ack:v6];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
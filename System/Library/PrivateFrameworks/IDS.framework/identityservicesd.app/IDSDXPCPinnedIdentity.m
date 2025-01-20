@interface IDSDXPCPinnedIdentity
- (IDSDXPCPinnedIdentity)initWithQueue:(id)a3 connection:(id)a4;
- (IDSDXPCPinnedIdentity)initWithQueue:(id)a3 connection:(id)a4 pinnedIdentityController:(id)a5;
- (IDSPinnedIdentityController)pinnedIdentityController;
- (IDSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (void)clearAllPinnedIdentities;
- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3;
- (void)fetchIdentityForPinningWithCompletion:(id)a3;
- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setPinnedIdentityController:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IDSDXPCPinnedIdentity

- (IDSDXPCPinnedIdentity)initWithQueue:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IDSPinnedIdentityController sharedInstance];
  v9 = [(IDSDXPCPinnedIdentity *)self initWithQueue:v7 connection:v6 pinnedIdentityController:v8];

  return v9;
}

- (IDSDXPCPinnedIdentity)initWithQueue:(id)a3 connection:(id)a4 pinnedIdentityController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSDXPCPinnedIdentity;
  v12 = [(IDSDXPCPinnedIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    objc_storeStrong((id *)&v13->_pinnedIdentityController, a5);
  }

  return v13;
}

- (void)fetchIdentityForPinningWithCompletion:(id)a3
{
}

- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4
{
}

- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3
{
}

- (void)clearAllPinnedIdentities
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSPinnedIdentityController)pinnedIdentityController
{
  return self->_pinnedIdentityController;
}

- (void)setPinnedIdentityController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedIdentityController, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
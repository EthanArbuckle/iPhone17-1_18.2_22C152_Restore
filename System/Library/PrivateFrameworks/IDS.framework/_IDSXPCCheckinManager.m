@interface _IDSXPCCheckinManager
+ (id)sharedInstance;
- (IDSXPCAdapter)XPCAdapter;
- (NSMutableDictionary)connectionInfoByServiceIdentifier;
- (_IDSXPCCheckinManager)init;
- (_IDSXPCCheckinManager)initWithXPCAdapter:(id)a3;
- (os_unfair_lock_s)checkinLock;
- (void)_performLockedAccess:(id)a3;
- (void)_temporarilyStoreMessage:(id)a3 forServiceIdentifier:(id)a4;
- (void)noteCreatedService:(id)a3;
- (void)noteFinishedTransactionForService:(id)a3;
- (void)setCheckinLock:(os_unfair_lock_s)a3;
- (void)setConnectionInfoByServiceIdentifier:(id)a3;
- (void)setXPCAdapter:(id)a3;
- (void)teardownAll;
- (void)teardownService:(id)a3;
@end

@implementation _IDSXPCCheckinManager

- (void)_performLockedAccess:(id)a3
{
  p_checkinLock = &self->_checkinLock;
  v5 = (void (**)(id, NSMutableDictionary *))a3;
  os_unfair_lock_lock(p_checkinLock);
  v5[2](v5, self->_connectionInfoByServiceIdentifier);

  os_unfair_lock_unlock(p_checkinLock);
}

- (_IDSXPCCheckinManager)init
{
  v3 = [MEMORY[0x1E4F6B430] XPCAdapter];
  v4 = [(_IDSXPCCheckinManager *)self initWithXPCAdapter:v3];

  return v4;
}

- (void)noteCreatedService:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_191911254;
    v6[3] = &unk_1E572D420;
    id v7 = v4;
    v8 = self;
    [(_IDSXPCCheckinManager *)self _performLockedAccess:v6];
  }
}

- (_IDSXPCCheckinManager)initWithXPCAdapter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_IDSXPCCheckinManager;
  v6 = [(_IDSXPCCheckinManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_checkinLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectionInfoByServiceIdentifier = v7->_connectionInfoByServiceIdentifier;
    v7->_connectionInfoByServiceIdentifier = v8;

    objc_storeStrong((id *)&v7->_XPCAdapter, a3);
  }

  return v7;
}

- (IDSXPCAdapter)XPCAdapter
{
  return self->_XPCAdapter;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191918BC0;
  block[3] = &unk_1E5729360;
  block[4] = a1;
  if (qword_1EB2BD788 != -1) {
    dispatch_once(&qword_1EB2BD788, block);
  }
  v2 = (void *)qword_1EB2BD790;

  return v2;
}

- (void)noteFinishedTransactionForService:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_191A0FBB8;
    v6[3] = &unk_1E572D448;
    id v7 = v4;
    [(_IDSXPCCheckinManager *)self _performLockedAccess:v6];
  }
}

- (void)teardownService:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_191A0FD64;
    v6[3] = &unk_1E572D448;
    id v7 = v4;
    [(_IDSXPCCheckinManager *)self _performLockedAccess:v6];
  }
}

- (void)teardownAll
{
}

- (void)_temporarilyStoreMessage:(id)a3 forServiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191A0FFDC;
    v9[3] = &unk_1E572D420;
    id v10 = v7;
    id v11 = v6;
    [(_IDSXPCCheckinManager *)self _performLockedAccess:v9];
  }
}

- (NSMutableDictionary)connectionInfoByServiceIdentifier
{
  return self->_connectionInfoByServiceIdentifier;
}

- (void)setConnectionInfoByServiceIdentifier:(id)a3
{
}

- (os_unfair_lock_s)checkinLock
{
  return self->_checkinLock;
}

- (void)setCheckinLock:(os_unfair_lock_s)a3
{
  self->_checkinLock = a3;
}

- (void)setXPCAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCAdapter, 0);

  objc_storeStrong((id *)&self->_connectionInfoByServiceIdentifier, 0);
}

@end
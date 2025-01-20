@interface CKWaiterWrapper
- (CKDZoneGatekeeperWaiter)waiter;
- (CKWaiterWrapper)initWithWaiter:(id)a3 zoneIDs:(id)a4 waitCompletedHandler:(id)a5 activity:(id)a6;
- (NSArray)zoneIDs;
- (NSString)personaID;
- (OS_os_activity)activity;
- (id)CKPropertiesDescription;
- (id)description;
- (id)waitCompletedHandler;
- (void)invokeWaitCompletedHandler:(BOOL)a3;
@end

@implementation CKWaiterWrapper

- (CKWaiterWrapper)initWithWaiter:(id)a3 zoneIDs:(id)a4 waitCompletedHandler:(id)a5 activity:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKWaiterWrapper;
  v15 = [(CKWaiterWrapper *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_waiter, a3);
    objc_storeStrong((id *)&v16->_zoneIDs, a4);
    v17 = _Block_copy(v13);
    id waitCompletedHandler = v16->_waitCompletedHandler;
    v16->_id waitCompletedHandler = v17;

    objc_storeStrong((id *)&v16->_activity, a6);
    uint64_t v19 = CKCurrentPersonaID();
    personaID = v16->_personaID;
    v16->_personaID = (NSString *)v19;
  }
  return v16;
}

- (void)invokeWaitCompletedHandler:(BOOL)a3
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_msgSend_activity(self, a2, a3);
  os_activity_scope_enter(v5, &state);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4D922C0;
  v6[3] = &unk_1E64F1DB8;
  v6[4] = self;
  BOOL v7 = a3;
  CKMuckingWithPersonas(v6);
  os_activity_scope_leave(&state);
}

- (id)description
{
  return (id)((uint64_t (*)(CKWaiterWrapper *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_ckShortDescription(self->_waiter, a2, v2);
  BOOL v7 = objc_msgSend_stringWithFormat_(v4, v6, @"waiter=%@, zoneIDs=%@", v5, self->_zoneIDs);

  return v7;
}

- (CKDZoneGatekeeperWaiter)waiter
{
  return self->_waiter;
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (id)waitCompletedHandler
{
  return self->_waitCompletedHandler;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong(&self->_waitCompletedHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong((id *)&self->_waiter, 0);
}

@end
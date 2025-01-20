@interface CKDPCSKeySyncTracker
- (BOOL)KRSReturnedExistingIdentity;
- (BOOL)isManatee;
- (BOOL)racedWithGuitarfishRepairCallback;
- (NSDate)completionDate;
- (NSError)syncError;
- (NSNumber)syncStatus;
- (NSString)accountDsid;
- (NSString)requestorOperationID;
- (NSString)serviceName;
- (OS_dispatch_group)syncGroup;
- (unint64_t)state;
- (void)setAccountDsid:(id)a3;
- (void)setCompletionDate:(id)a3;
- (void)setKRSReturnedExistingIdentity:(BOOL)a3;
- (void)setManatee:(BOOL)a3;
- (void)setRacedWithGuitarfishRepairCallback:(BOOL)a3;
- (void)setRequestorOperationID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSyncError:(id)a3;
- (void)setSyncGroup:(id)a3;
- (void)setSyncStatus:(id)a3;
- (void)waitOnSyncWithQueue:(id)a3 waiterOperationID:(id)a4 handler:(id)a5;
@end

@implementation CKDPCSKeySyncTracker

- (unint64_t)state
{
  v4 = objc_msgSend_syncGroup(self, a2, v2);

  if (!v4) {
    return 0;
  }
  v7 = objc_msgSend_completionDate(self, v5, v6);
  objc_msgSend_timeIntervalSinceNow(v7, v8, v9);
  double v11 = v10;

  v14 = objc_msgSend_completionDate(self, v12, v13);

  if (v14 && fabs(v11) < 1800.0) {
    return 2;
  }
  v18 = objc_msgSend_syncStatus(self, v15, v16);
  if (v18) {
    unint64_t v17 = 3;
  }
  else {
    unint64_t v17 = 1;
  }

  return v17;
}

- (void)waitOnSyncWithQueue:(id)a3 waiterOperationID:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = a3;
  uint64_t v13 = objc_msgSend_syncGroup(self, v11, v12);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EA4344;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_group_notify(v13, v10, block);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)accountDsid
{
  return self->_accountDsid;
}

- (void)setAccountDsid:(id)a3
{
}

- (BOOL)isManatee
{
  return self->_manatee;
}

- (void)setManatee:(BOOL)a3
{
  self->_manatee = a3;
}

- (OS_dispatch_group)syncGroup
{
  return self->_syncGroup;
}

- (void)setSyncGroup:(id)a3
{
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
}

- (NSNumber)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(id)a3
{
}

- (NSError)syncError
{
  return self->_syncError;
}

- (void)setSyncError:(id)a3
{
}

- (BOOL)KRSReturnedExistingIdentity
{
  return self->_KRSReturnedExistingIdentity;
}

- (void)setKRSReturnedExistingIdentity:(BOOL)a3
{
  self->_KRSReturnedExistingIdentity = a3;
}

- (NSString)requestorOperationID
{
  return self->_requestorOperationID;
}

- (void)setRequestorOperationID:(id)a3
{
}

- (BOOL)racedWithGuitarfishRepairCallback
{
  return self->_racedWithGuitarfishRepairCallback;
}

- (void)setRacedWithGuitarfishRepairCallback:(BOOL)a3
{
  self->_racedWithGuitarfishRepairCallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestorOperationID, 0);
  objc_storeStrong((id *)&self->_syncError, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_syncGroup, 0);
  objc_storeStrong((id *)&self->_accountDsid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
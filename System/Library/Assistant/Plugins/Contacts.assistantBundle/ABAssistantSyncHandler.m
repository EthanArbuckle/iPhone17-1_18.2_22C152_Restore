@interface ABAssistantSyncHandler
- (ABAssistantSyncWorker)syncWorker;
- (CNContactStore)contactStore;
- (NSString)changeHistoryClientIdentifier;
- (id)syncSnapshotForKey:(id)a3;
- (id)syncVerificationKeyForKey:(id)a3;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)setChangeHistoryClientIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setSyncWorker:(id)a3;
- (void)syncDidEnd;
@end

@implementation ABAssistantSyncHandler

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (id)syncSnapshotForKey:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_syncWorker(self, v5, v6);
  v9 = objc_msgSend_syncSnapshotForKey_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)syncVerificationKeyForKey:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_syncWorker(self, v5, v6);
  v9 = objc_msgSend_syncVerificationKeyForKey_(v7, v8, (uint64_t)v4);

  return v9;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_msgSend_syncWorker(self, v14, v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginSyncWithAnchor_validity_forKey_beginInfo_(v17, v16, (uint64_t)v13, v12, v11, v10);
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_syncWorker(self, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getChangeAfterAnchor_changeInfo_(v11, v10, (uint64_t)v7, v6);
}

- (void)syncDidEnd
{
  objc_msgSend_syncWorker(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncDidEnd(v5, v3, v4);
}

- (ABAssistantSyncWorker)syncWorker
{
  return self->_syncWorker;
}

- (void)setSyncWorker:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (NSString)changeHistoryClientIdentifier
{
  return self->_changeHistoryClientIdentifier;
}

- (void)setChangeHistoryClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistoryClientIdentifier, 0);
  objc_storeStrong((id *)&self->_syncWorker, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
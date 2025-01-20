@interface ABAssistantSyncPeople
- (ABAssistantSyncPeople)init;
- (BOOL)hasContactsForFullSync;
- (BOOL)verifyChangeHistory;
- (id)_currentSyncSnapshotProperty;
- (id)contactsForFullSync;
- (id)copyChangeHistoryAfterSyncAnchor:(id)a3;
- (id)currentSyncSnapshotAnchorString;
- (id)expectedSyncKeyPrefix;
- (id)fullSyncSnapshotProperty;
- (id)getLastClearedSyncAnchor;
- (id)newSADomainObjectFromCNContact:(id)a3;
- (id)newSADomainObjectFromCNContactWithIdentifier:(id)a3;
- (id)newSADomainObjectFromDeletedContactIdentifier:(id)a3;
- (int64_t)currentSyncSnapshotCount;
- (void)clearChangeHistoryToSyncAnchor:(id)a3;
- (void)resetCurrentSyncSnapshot;
- (void)setCurrentSyncSnapshotAnchorString:(id)a3;
@end

@implementation ABAssistantSyncPeople

- (ABAssistantSyncPeople)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABAssistantSyncPeople;
  v2 = [(ABAssistantSyncPeople *)&v8 init];
  if (v2)
  {
    v3 = [ABAssistantSyncWorker alloc];
    v5 = objc_msgSend_initWithDelegate_(v3, v4, (uint64_t)v2);
    objc_msgSend_setSyncWorker_(v2, v6, (uint64_t)v5);
  }
  return v2;
}

- (id)expectedSyncKeyPrefix
{
  return @"com.apple.contact.people";
}

- (id)fullSyncSnapshotProperty
{
  v3 = NSString;
  v4 = objc_msgSend_changeHistoryClientIdentifier(self, a2, v2);
  v6 = objc_msgSend_stringWithFormat_(v3, v5, @"%@-fullSyncSequenceNumberSnapshot", v4);

  return v6;
}

- (id)getLastClearedSyncAnchor
{
  v4 = objc_msgSend_contactStore(self, a2, v2);
  v7 = objc_msgSend_changeHistoryClientIdentifier(self, v5, v6);
  id v19 = 0;
  v9 = objc_msgSend_latestConsumedChangeHistoryAnchorForClientIdentifier_error_(v4, v8, (uint64_t)v7, &v19);
  id v10 = v19;

  if (v9)
  {
    v11 = [ABAssistantSyncAnchor alloc];
    uint64_t v14 = objc_msgSend_sequenceNumber(v9, v12, v13);
    v16 = objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v11, v15, v14, 0xFFFFFFFFLL);
  }
  else
  {
    if (v10)
    {
      v17 = (void *)*MEMORY[0x263F28380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
        sub_221CB06D0(v17, self);
      }
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)verifyChangeHistory
{
  v4 = objc_msgSend_contactStore(self, a2, v2);
  v7 = objc_msgSend_changeHistoryClientIdentifier(self, v5, v6);
  char v9 = objc_msgSend_verifyChangeHistoryForClientIdentifier_error_(v4, v8, (uint64_t)v7, 0);

  return v9;
}

- (void)clearChangeHistoryToSyncAnchor:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFE9D8]);
  uint64_t v8 = objc_msgSend_sequenceNumber(v4, v6, v7);
  id v10 = objc_msgSend_initWithSequenceNumber_(v5, v9, v8);
  id v11 = objc_alloc(MEMORY[0x263EFE9E0]);
  uint64_t v14 = objc_msgSend_changeHistoryClientIdentifier(self, v12, v13);
  v16 = objc_msgSend_initWithClientIdentifier_(v11, v15, (uint64_t)v14);

  objc_msgSend_setToChangeAnchor_(v16, v17, (uint64_t)v10);
  v20 = objc_msgSend_contactStore(self, v18, v19);
  id v31 = 0;
  objc_msgSend_executeChangeHistoryClearRequest_error_(v20, v21, (uint64_t)v16, &v31);
  id v22 = v31;

  if (v22)
  {
    v23 = (void *)*MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG))
    {
      v24 = v23;
      v27 = objc_msgSend_changeHistoryClientIdentifier(self, v25, v26);
      uint64_t v30 = objc_msgSend_sequenceNumber(v4, v28, v29);
      *(_DWORD *)buf = 136315906;
      v33 = "-[ABAssistantSyncPeople clearChangeHistoryToSyncAnchor:]";
      __int16 v34 = 2112;
      v35 = v27;
      __int16 v36 = 2048;
      uint64_t v37 = v30;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_debug_impl(&dword_221CA8000, v24, OS_LOG_TYPE_DEBUG, "%s Failed to get clear change history for %@ to sequence number = %li, error = %@", buf, 0x2Au);
    }
  }
}

- (BOOL)hasContactsForFullSync
{
  v3 = objc_msgSend_contactStore(self, a2, v2);
  id v5 = objc_msgSend_individualContactCountWithError_(v3, v4, 0);
  BOOL v8 = objc_msgSend_integerValue(v5, v6, v7) > 0;

  return v8;
}

- (id)contactsForFullSync
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc(MEMORY[0x263EFEA18]);
  uint64_t v6 = objc_msgSend_descriptorsForRequiredKeysForConversionType_(MEMORY[0x263F333F0], v5, 2);
  BOOL v8 = objc_msgSend_initWithKeysToFetch_(v4, v7, (uint64_t)v6);

  objc_msgSend_setUnifyResults_(v8, v9, 0);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = -1;
  v12 = objc_msgSend_contactStore(self, v10, v11);
  id v24 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_221CAA3FC;
  v21[3] = &unk_2645E7068;
  id v13 = v3;
  id v22 = v13;
  v23 = v25;
  char Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v12, v14, (uint64_t)v8, &v24, v21);
  id v16 = v24;

  v17 = (os_log_t *)MEMORY[0x263F28380];
  if ((Request_error_usingBlock & 1) == 0)
  {
    v18 = *MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB07FC(v18);
    }
  }

  if (v16 && os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG)) {
    sub_221CB077C();
  }
  id v19 = v13;
  _Block_object_dispose(v25, 8);

  return v19;
}

- (id)copyChangeHistoryAfterSyncAnchor:(id)a3
{
  id v4 = objc_opt_new();
  objc_msgSend_setShouldUnifyResults_(v4, v5, 0);
  BOOL v8 = objc_msgSend_contactStore(self, v6, v7);
  id v17 = 0;
  id v10 = objc_msgSend_changeHistoryWithFetchRequest_error_(v8, v9, (uint64_t)v4, &v17);
  id v11 = v17;

  if (v11)
  {
    uint64_t v14 = (void *)*MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB0904(v14, self);
    }
  }
  v15 = objc_msgSend_contactChanges(v10, v12, v13);

  return v15;
}

- (id)newSADomainObjectFromCNContact:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSADomainObjectFromCNContactWithIdentifier:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  __int16 v34 = sub_221CAA81C;
  v35 = sub_221CAA82C;
  id v36 = 0;
  id v5 = objc_alloc(MEMORY[0x263EFEA18]);
  uint64_t v7 = objc_msgSend_descriptorsForRequiredKeysForConversionType_(MEMORY[0x263F333F0], v6, 2);
  char v9 = objc_msgSend_initWithKeysToFetch_(v5, v8, (uint64_t)v7);

  objc_msgSend_setUnifyResults_(v9, v10, 0);
  id v11 = (void *)MEMORY[0x263EFE9F8];
  v37[0] = v4;
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)v37, 1);
  v15 = objc_msgSend_predicateForContactsWithIdentifiers_(v11, v14, (uint64_t)v13);
  objc_msgSend_setPredicate_(v9, v16, (uint64_t)v15);

  id v19 = objc_msgSend_contactStore(self, v17, v18);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_221CAA834;
  v29[3] = &unk_2645E7090;
  v29[4] = &v31;
  id v30 = 0;
  char Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v19, v20, (uint64_t)v9, &v30, v29);
  id v22 = v30;

  id v24 = (os_log_t *)MEMORY[0x263F28380];
  if ((Request_error_usingBlock & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
    sub_221CB0A48();
  }
  if (v22)
  {
    v25 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEBUG)) {
      sub_221CB09B0((uint64_t)v4, (uint64_t)v22, v25);
    }
  }
  uint64_t v26 = v32[5];
  if (v26) {
    v27 = objc_msgSend_newSADomainObjectFromCNContact_(self, v23, v26);
  }
  else {
    v27 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v27;
}

- (id)newSADomainObjectFromDeletedContactIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F64B28];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v7 = objc_msgSend_assistantIDFromContactID_(MEMORY[0x263F333F8], v6, (uint64_t)v4);

  objc_msgSend_setIdentifier_(v5, v8, (uint64_t)v7);
  return v5;
}

- (id)_currentSyncSnapshotProperty
{
  id v3 = NSString;
  id v4 = objc_msgSend_changeHistoryClientIdentifier(self, a2, v2);
  uint64_t v6 = objc_msgSend_stringWithFormat_(v3, v5, @"%@-currentSyncAnchorSnapshot", v4);

  return v6;
}

- (void)setCurrentSyncSnapshotAnchorString:(id)a3
{
  id v4 = a3;
  objc_msgSend__currentSyncSnapshotProperty(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveString_forKey_(ABAssistantSyncInfoPersistence, v7, (uint64_t)v4, v8);
}

- (void)resetCurrentSyncSnapshot
{
}

- (id)currentSyncSnapshotAnchorString
{
  id v4 = objc_msgSend__currentSyncSnapshotProperty(self, a2, v2);
  uint64_t v6 = objc_msgSend_stringForKey_(ABAssistantSyncInfoPersistence, v5, (uint64_t)v4);

  char v9 = objc_msgSend_contactStore(self, v7, v8);
  id v11 = objc_msgSend_anchorWithString_forContactStore_(ABAssistantSyncAnchor, v10, (uint64_t)v6, v9);

  uint64_t v13 = objc_msgSend_copyChangeHistoryAfterSyncAnchor_(self, v12, (uint64_t)v11);
  id v16 = objc_msgSend_lastObject(v13, v14, v15);
  id v19 = v16;
  if (v16)
  {
    v20 = objc_msgSend_changeAnchor(v16, v17, v18);
    uint64_t v23 = objc_msgSend_sequenceNumber(v20, v21, v22);
    uint64_t v26 = objc_msgSend_iOSLegacyIdentifier(v19, v24, v25);
    uint64_t v28 = objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v27, v23, v26);

    uint64_t v6 = (void *)v28;
  }

  return v6;
}

- (int64_t)currentSyncSnapshotCount
{
  id v3 = objc_msgSend_contactStore(self, a2, v2);
  id v5 = objc_msgSend_individualContactCountWithError_(v3, v4, 0);
  int64_t v8 = objc_msgSend_integerValue(v5, v6, v7);

  return v8;
}

@end
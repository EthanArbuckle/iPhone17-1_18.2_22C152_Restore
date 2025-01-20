@interface IMDCKMockRecordZone
- (IDSKVStore)recordStore;
- (IMDCKMockRecordZone)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)_ckRecordFromData:(id)a3;
- (id)_fetchRecordZoneChangesOptionsFromOperation:(id)a3;
- (id)_kvStorePath;
- (id)_serializedCKRecordData:(id)a3;
- (unint64_t)_fetchResultLimit:(id)a3;
- (void)_handleFetchZoneChangesOperation:(id)a3;
- (void)_handleModifyRecordsOperation:(id)a3;
- (void)dealloc;
- (void)handleOperation:(id)a3;
- (void)setRecordStore:(id)a3;
@end

@implementation IMDCKMockRecordZone

- (id)_kvStorePath
{
  return (id)[NSString stringWithFormat:@"%@/%@", @"/var/mobile/Library/SMS/CloudKitMockStore/", self->_identifier];
}

- (IMDCKMockRecordZone)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMDCKMockRecordZone;
  v4 = [(IMDCKMockRecordZone *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_identifier = (NSString *)a3;
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[a3 cStringUsingEncoding:4], 0);
    v5->_recordStore = (IDSKVStore *)objc_msgSend(objc_alloc(MEMORY[0x1E4F6B810]), "initWithPath:storeName:dataProtectionClass:", -[IMDCKMockRecordZone _kvStorePath](v5, "_kvStorePath"), v5->_identifier, 0);
  }
  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)IMDCKMockRecordZone;
  [(IMDCKMockRecordZone *)&v3 dealloc];
}

- (void)handleOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = (uint64_t)a3;
      __int16 v14 = 2112;
      v15 = [(IMDCKMockRecordZone *)self identifier];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Mock Handle operation %@ identifier %@", buf, 0x16u);
    }
  }
  int64_t v6 = arc4random() % 0x3C;
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Adding random delay of %@ seconds", buf, 0xCu);
    }
  }
  dispatch_time_t v9 = dispatch_time(0, v6);
  v10 = [(IMDCKMockRecordZone *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D97B1B60;
  v11[3] = &unk_1E6B746B8;
  v11[4] = a3;
  v11[5] = self;
  dispatch_after(v9, (dispatch_queue_t)v10, v11);
}

- (id)_fetchRecordZoneChangesOptionsFromOperation:(id)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend(a3, "configurationsByRecordZoneID"), "allValues");

  return (id)[v3 firstObject];
}

- (unint64_t)_fetchResultLimit:(id)a3
{
  id v3 = [(IMDCKMockRecordZone *)self _fetchRecordZoneChangesOptionsFromOperation:a3];

  return MEMORY[0x1F4181798](v3, sel_resultsLimit);
}

- (id)_ckRecordFromData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  id v3 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v6];
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Failed to unarchive mock ck record data. Error: %@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (void)_handleFetchZoneChangesOperation:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = [(IMDCKMockRecordZone *)self identifier];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "ID %@ MOCK Handling fetchRecordZoneChangesOperation", buf, 0xCu);
    }
  }
  unsigned int v6 = [a3 fetchAllChanges];
  unint64_t v7 = [(IMDCKMockRecordZone *)self _fetchResultLimit:a3];
  uint64_t v8 = @"NO";
  if (v6) {
    uint64_t v8 = @"YES";
  }
  v32 = v8;
  uint64_t v33 = *MEMORY[0x1E4F19C40];
  do
  {
    v39 = 0;
    uint64_t v40 = 0;
    uint64_t v9 = (void *)[(IDSKVStore *)[(IMDCKMockRecordZone *)self recordStore] datasUpToLimit:v7 deleteContext:&v40 error:&v39];
    if (v39)
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = [(IMDCKMockRecordZone *)self identifier];
          *(_DWORD *)buf = 138412546;
          v43 = v11;
          __int16 v44 = 2112;
          v45 = v39;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "%@ Error reading from MOCK store %@ ", buf, 0x16u);
        }
      }
    }
    unint64_t v12 = [v9 count];
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        *(_DWORD *)buf = 138412802;
        v15 = @"NO";
        if (v12 >= v7) {
          v15 = @"YES";
        }
        v43 = (NSString *)v14;
        __int16 v44 = 2112;
        v45 = v15;
        __int16 v46 = 2112;
        v47 = v32;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "About to give back %@ records moreComing %@ fetchAllChanges %@", buf, 0x20u);
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v16 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v9);
          }
          id v19 = [(IMDCKMockRecordZone *)self _ckRecordFromData:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          uint64_t v20 = [a3 recordChangedBlock];
          (*(void (**)(uint64_t, id))(v20 + 16))(v20, v19);
        }
        uint64_t v16 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v16);
    }
    v34 = 0;
    v21 = [(IMDCKMockRecordZone *)self recordStore];
    [(IDSKVStore *)v21 deleteBatchWithContext:v40 error:&v34];
    if (v34)
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [(IMDCKMockRecordZone *)self identifier];
          *(_DWORD *)buf = 138412546;
          v43 = v23;
          __int16 v44 = 2112;
          v45 = v34;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "%@ Error deleting from MOCK store %@ ", buf, 0x16u);
        }
      }
    }
    uint64_t v24 = [a3 recordZoneChangeTokensUpdatedBlock];
    (*(void (**)(uint64_t, uint64_t, void, void))(v24 + 16))(v24, objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject"), 0, 0);
    HIDWORD(v25) = -858993459 * arc4random();
    LODWORD(v25) = HIDWORD(v25);
    if ((v25 >> 1) <= 0x19999999)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F33C5BC8, &unk_1F33C5BE0, &unk_1F33C5BF8, 0);
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v33, objc_msgSend((id)objc_msgSend(v27, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v27, "count")), "integerValue"), 0);
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v43 = (NSString *)v26;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Introducing random error %@", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    BOOL v29 = v12 >= v7;
    uint64_t v30 = [a3 recordZoneFetchCompletionBlock];
    (*(void (**)(uint64_t, uint64_t, void, void, BOOL, uint64_t))(v30 + 16))(v30, objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject"), 0, 0, v29, v26);
  }
  while (v29 & v6);
  uint64_t v31 = [a3 fetchRecordZoneChangesCompletionBlock];
  (*(void (**)(uint64_t, void))(v31 + 16))(v31, 0);
}

- (id)_serializedCKRecordData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v4 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v9 = "-[IMDCKMockRecordZone _serializedCKRecordData:]";
        __int16 v10 = 2112;
        id v11 = a3;
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%s: Unable to archive record %@, error %@", buf, 0x20u);
      }
    }
  }
  return v4;
}

- (void)_handleModifyRecordsOperation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = [(IMDCKMockRecordZone *)self identifier];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "ID %@ MOCK Handling modifyRecordsOperation", buf, 0xCu);
    }
  }
  unsigned int v6 = (void *)[a3 recordsToSave];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v8 = 138412290;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = -[IMDCKMockRecordZone _serializedCKRecordData:](self, "_serializedCKRecordData:", v11, v21);
        uint64_t v22 = 0;
        -[IDSKVStore persistData:forKey:error:](-[IMDCKMockRecordZone recordStore](self, "recordStore"), "persistData:forKey:error:", v12, objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName"), &v22);
        BOOL v13 = v22 == 0;
        int v14 = IMOSLoggingEnabled();
        if (v13)
        {
          if (v14)
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName");
              *(_DWORD *)buf = v21;
              v28 = (NSString *)v18;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Successfully persisted record %@ ", buf, 0xCu);
            }
          }
          uint64_t v19 = [a3 perRecordCompletionBlock];
          (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v11, 0);
        }
        else if (v14)
        {
          v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName");
            *(_DWORD *)buf = 138412546;
            v28 = (NSString *)v16;
            __int16 v29 = 2112;
            uint64_t v30 = v22;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Error persisting record %@ error %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }
  uint64_t v20 = [a3 modifyRecordsCompletionBlock];
  (*(void (**)(uint64_t, void *, void, void))(v20 + 16))(v20, v6, 0, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSKVStore)recordStore
{
  return self->_recordStore;
}

- (void)setRecordStore:(id)a3
{
}

@end
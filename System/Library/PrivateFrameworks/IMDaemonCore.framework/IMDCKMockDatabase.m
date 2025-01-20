@interface IMDCKMockDatabase
- (IMDCKMockDatabase)init;
- (NSDictionary)identifierToZoneMap;
- (id)_initWithContainer:(id)a3 scope:(int64_t)a4;
- (id)_zoneIdentifierForOperation:(id)a3;
- (id)_zoneManager;
- (void)addOperation:(id)a3;
- (void)dealloc;
@end

@implementation IMDCKMockDatabase

- (id)_initWithContainer:(id)a3 scope:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IMDCKMockDatabase;
  v4 = [(IMDCKMockDatabase *)&v10 _initWithContainer:a3 scope:a4];
  if (v4)
  {
    v5 = [(IMDCKMockRecordZone *)[IMDCKMockRecordKeyZone alloc] initWithIdentifier:@"recordKeyZone"];
    v6 = [[IMDCKMockRecordZone alloc] initWithIdentifier:@"chatManateeZone"];
    v7 = [[IMDCKMockRecordZone alloc] initWithIdentifier:@"messageManateeZone"];
    v8 = [[IMDCKMockRecordZone alloc] initWithIdentifier:@"attachmentManateeZone"];
    v4[3] = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, -[IMDCKMockRecordZone identifier](v5, "identifier"), v6, -[IMDCKMockRecordZone identifier](v6, "identifier"), v7, -[IMDCKMockRecordZone identifier](v7, "identifier"), v8, -[IMDCKMockRecordZone identifier](v8, "identifier"), 0);
  }
  return v4;
}

- (IMDCKMockDatabase)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMDCKMockDatabase;
  v2 = [(IMDCKMockDatabase *)&v5 init];
  if (v2)
  {
    v3 = [[IMDCKMockRecordZone alloc] initWithIdentifier:@"recordKeyZone"];
    v2->_identifierToZoneMap = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v3, -[IMDCKMockRecordZone identifier](v3, "identifier"), 0);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDCKMockDatabase;
  [(IMDCKMockDatabase *)&v3 dealloc];
}

- (id)_zoneManager
{
  return +[IMDRecordZoneManager sharedInstance];
}

- (id)_zoneIdentifierForOperation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v5 = (void *)[a3 recordsToSave];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = @"recordKeyZone";
      uint64_t v9 = *(void *)v24;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", @"SyncCompleteRecordType")) {
          return v8;
        }
        if (objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", @"chatEncryptedv2")) {
          return @"chatManateeZone";
        }
        if (objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", @"MessageEncryptedV3")) {
          return @"messageManateeZone";
        }
        if (objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", @"attachment")) {
          return @"attachmentManateeZone";
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v7) {
            goto LABEL_4;
          }
          return &stru_1F3398578;
        }
      }
    }
    return &stru_1F3398578;
  }
  if (![a3 isMemberOfClass:objc_opt_class()])
  {
    if ([a3 isMemberOfClass:objc_opt_class()])
    {
      v17 = objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject");
      v8 = @"chatManateeZone";
      if (objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", @"chatManateeZone")) {
        return v8;
      }
      v8 = @"messageManateeZone";
      if (objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", @"messageManateeZone")) {
        return v8;
      }
      v8 = @"attachmentManateeZone";
      if (objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", @"attachmentManateeZone")) {
        return v8;
      }
    }
    return &stru_1F3398578;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = objc_msgSend(a3, "recordIDs", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (!v13) {
    return &stru_1F3398578;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v20;
  v8 = @"recordKeyZone";
LABEL_17:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v20 != v15) {
      objc_enumerationMutation(v12);
    }
    if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "zoneID"), "isEqual:", objc_msgSend(-[IMDCKMockDatabase _zoneManager](self, "_zoneManager"), "deDupeSaltZoneID")))return v8; {
    if (v14 == ++v16)
    }
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v14) {
        goto LABEL_17;
      }
      return &stru_1F3398578;
    }
  }
}

- (void)addOperation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Adding operation %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [(IMDCKMockDatabase *)self _zoneIdentifierForOperation:a3];
  id v7 = [(NSDictionary *)[(IMDCKMockDatabase *)self identifierToZoneMap] objectForKey:v6];
  if (v7)
  {
    [v7 handleOperation:a3];
  }
  else if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Did not find mock database for operation %@ zoneID %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (NSDictionary)identifierToZoneMap
{
  return self->_identifierToZoneMap;
}

@end
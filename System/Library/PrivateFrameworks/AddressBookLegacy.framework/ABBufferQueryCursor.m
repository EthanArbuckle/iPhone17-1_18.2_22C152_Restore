@interface ABBufferQueryCursor
- (ABBufferQuery)query;
- (ABBufferQueryCursor)initWithAddressBook:(void *)a3 predicate:(id)a4 propertyIdentifierSet:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 suggestedContactsPerBatch:(int64_t)a8 managedConfiguration:(id)a9 identifierAuditMode:(int64_t)a10 authorizationContext:(id)a11;
- (ABBufferQueryCursor)initWithQuery:(id)a3 batchSize:(int64_t)a4;
- (BOOL)hasFoundAnyImageDataForCurrentContact;
- (CNManagedConfiguration)managedConfiguration;
- (NSData)currentRecordIndividualUniqueIDAuditData;
- (NSData)currentRecordLinkedUniqueIDAuditData;
- (NSMutableData)mutableData;
- (NSMutableDictionary)matchInfo;
- (NSMutableSet)contactIdentifiers;
- (int)contactLinkUUIDColumn;
- (int)contactPreferredForImageColumn;
- (int)currentMultivalueIdentifier;
- (int)currentPropertyID;
- (int)currentRecordID;
- (int)multivalueEntryKeyColumn;
- (int)multivalueEntryValueColumn;
- (int)multivalueIdentifierColumn;
- (int)multivalueLabelColumn;
- (int)multivaluePropertyIDColumn;
- (int)multivalueUUIDColumn;
- (int)multivalueValueColumn;
- (int)personLinkColumn;
- (int64_t)countOfContactsInBuffer;
- (int64_t)currentMultivalue;
- (int64_t)maxContactsPerBatch;
- (int64_t)resumeToken;
- (sqlite3_blob)incompleteBlob;
- (unint64_t)blobBytesWritten;
- (unint64_t)blobLength;
- (unint64_t)maxBufferSize;
- (void)dealloc;
- (void)fetchNextBatchWithReply:(id)a3;
- (void)setBlobBytesWritten:(unint64_t)a3;
- (void)setBlobLength:(unint64_t)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setContactLinkUUIDColumn:(int)a3;
- (void)setContactPreferredForImageColumn:(int)a3;
- (void)setCountOfContactsInBuffer:(int64_t)a3;
- (void)setCurrentMultivalue:(int64_t)a3;
- (void)setCurrentMultivalueIdentifier:(int)a3;
- (void)setCurrentPropertyID:(int)a3;
- (void)setCurrentRecordID:(int)a3;
- (void)setCurrentRecordIndividualUniqueIDAuditData:(id)a3;
- (void)setCurrentRecordLinkedUniqueIDAuditData:(id)a3;
- (void)setHasFoundAnyImageDataForCurrentContact:(BOOL)a3;
- (void)setIncompleteBlob:(sqlite3_blob *)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setMaxBufferSize:(unint64_t)a3;
- (void)setMaxContactsPerBatch:(int64_t)a3;
- (void)setMultivalueEntryKeyColumn:(int)a3;
- (void)setMultivalueEntryValueColumn:(int)a3;
- (void)setMultivalueIdentifierColumn:(int)a3;
- (void)setMultivalueLabelColumn:(int)a3;
- (void)setMultivaluePropertyIDColumn:(int)a3;
- (void)setMultivalueUUIDColumn:(int)a3;
- (void)setMultivalueValueColumn:(int)a3;
- (void)setMutableData:(id)a3;
- (void)setPersonLinkColumn:(int)a3;
- (void)setResumeToken:(int64_t)a3;
@end

@implementation ABBufferQueryCursor

- (ABBufferQueryCursor)initWithAddressBook:(void *)a3 predicate:(id)a4 propertyIdentifierSet:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 suggestedContactsPerBatch:(int64_t)a8 managedConfiguration:(id)a9 identifierAuditMode:(int64_t)a10 authorizationContext:(id)a11
{
  v13 = [[ABBufferQuery alloc] initWithAddressBook:a3 predicate:a4 requestedProperties:a5 includeLinkedContacts:a6 sortOrder:*(void *)&a7 managedConfiguration:a9 identifierAuditStyle:a10 authorizationContext:a11];
  if (v13)
  {
    v14 = v13;
    v15 = [(ABBufferQueryCursor *)self initWithQuery:v13 batchSize:a8];

    return v15;
  }
  else
  {

    return 0;
  }
}

- (ABBufferQueryCursor)initWithQuery:(id)a3 batchSize:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)ABBufferQueryCursor;
  v6 = [(ABBufferQueryCursor *)&v41 init];
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 5) = -1;
    *(void *)(v6 + 12) = -1;
    int Count = CFDictionaryGetCount((CFDictionaryRef)[a3 propertyIndices]);
    int64_t v9 = 2000;
    if (a4) {
      int64_t v9 = a4;
    }
    *((void *)v7 + 18) = 3145728;
    *((void *)v7 + 19) = v9;
    CFDictionaryRef v10 = (const __CFDictionary *)[a3 propertyIndices];
    if (!CFDictionaryGetValueIfPresent(v10, (const void *)kABPersonLinkProperty, (const void **)(v7 + 60))) {
      *((_DWORD *)v7 + 15) = -1;
    }
    v11 = (void *)[a3 requestedPropertyIdentifiers];
    int v12 = [v11 containsIndex:kABCPersonLinkUUIDProperty];
    if (v12) {
      int v13 = Count + 2;
    }
    else {
      int v13 = Count + 1;
    }
    if (v12) {
      int v14 = Count + 1;
    }
    else {
      int v14 = -1;
    }
    *((_DWORD *)v7 + 13) = v14;
    v15 = (void *)[a3 requestedPropertyIdentifiers];
    int v16 = [v15 containsIndex:kABCPersonIsPreferredImageProperty];
    int v17 = v13 + v16;
    if (v16) {
      int v18 = v13;
    }
    else {
      int v18 = -1;
    }
    *((_DWORD *)v7 + 14) = v18;
    int v19 = [a3 needsMultivalueTable];
    int v20 = v17 + v19;
    if (v19) {
      int v21 = v17;
    }
    else {
      int v21 = -1;
    }
    *((_DWORD *)v7 + 6) = v21;
    int v22 = [a3 needsMultivalueTable];
    int v23 = v20 + v22;
    if (v22) {
      int v24 = v20;
    }
    else {
      int v24 = -1;
    }
    *((_DWORD *)v7 + 7) = v24;
    int v25 = [a3 needsMultivalueTable];
    int v26 = v23 + v25;
    if (v25) {
      int v27 = v23;
    }
    else {
      int v27 = -1;
    }
    *((_DWORD *)v7 + 8) = v27;
    int v28 = [a3 needsMultivalueTable];
    int v29 = v26 + v28;
    if (v28) {
      int v30 = v26;
    }
    else {
      int v30 = -1;
    }
    *((_DWORD *)v7 + 9) = v30;
    int v31 = [a3 needsMultivalueTable];
    int v32 = v29 + v31;
    if (v31) {
      int v33 = v29;
    }
    else {
      int v33 = -1;
    }
    *((_DWORD *)v7 + 10) = v33;
    int v34 = [a3 needsMultivalueEntryTable];
    int v35 = v32 + v34;
    if (v34) {
      int v36 = v32;
    }
    else {
      int v36 = -1;
    }
    *((_DWORD *)v7 + 11) = v36;
    if ([a3 needsMultivalueEntryTable]) {
      int v37 = v35;
    }
    else {
      int v37 = -1;
    }
    *((_DWORD *)v7 + 12) = v37;
    *((void *)v7 + 21) = a3;
    *((void *)v7 + 8) = objc_opt_new();
    v38 = ABOSLogImageMetadata();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *((void *)v7 + 8);
      *(_DWORD *)buf = 134218240;
      v43 = v7;
      __int16 v44 = 2048;
      uint64_t v45 = v39;
      _os_log_impl(&dword_19DCDB000, v38, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) created buffer (%p)", buf, 0x16u);
    }
    *((void *)v7 + 9) = objc_opt_new();
    if (objc_msgSend((id)objc_msgSend(a3, "predicate"), "matchInfoProvider")) {
      *((void *)v7 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
  }
  return (ABBufferQueryCursor *)v7;
}

- (void)fetchNextBatchWithReply:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v5 = [(ABBufferQuery *)self->_query statement];
  if (v5)
  {
    v6 = (sqlite3_stmt **)v5;
    if (v5->var1)
    {
      if (v5->var0 && v5->var0->var1)
      {
        int v43 = kABPersonWatchWallpaperImageDataProperty;
        int v44 = kABPersonWallpaperProperty;
        int v42 = kABPersonWallpaperMetadataProperty;
        id v45 = a3;
        while (1)
        {
          do
          {
            if (![(ABBufferQueryCursor *)self resumeToken])
            {
              int v7 = sqlite3_step(v6[1]);
              if (v7 != 100)
              {
                if (v7 == 101)
                {
                  id v39 = objc_alloc_init(MEMORY[0x1E4F5A3C0]);
                  [v39 setData:self->_mutableData];
                  [v39 setMatchInfo:self->_matchInfo];
                  [v39 setIdentifierAccountingData:self->_contactIdentifiers];
                  (*((void (**)(id, id, uint64_t, void))a3 + 2))(a3, v39, 1, 0);
                  CPSqliteStatementReset();
                  [(ABBufferQuery *)self->_query setStatement:0];
                }
                else
                {
                  uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ABSQLiteErrorDomain" code:sqlite3_errcode(*((sqlite3 **)*v6 + 1)) userInfo:0];
                  objc_super v41 = ABOSLogGeneral();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                    -[ABBufferQueryCursor fetchNextBatchWithReply:]((uint64_t)v6, v41);
                  }
                  (*((void (**)(id, void, void, uint64_t))a3 + 2))(a3, 0, 0, v40);
                }
                goto LABEL_54;
              }
            }
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v50 = __ABAddressBookPersonBufferRowHandler_block_invoke;
            v51 = &unk_1E5989790;
            v52 = self;
            id v53 = a3;
          }
          while (![[(ABBufferQueryCursor *)self query] propertyIndices]);
          uint64_t v8 = sqlite3_column_int(v6[1], 0);
          if ([(ABBufferQueryCursor *)self currentRecordID] != v8)
          {
            [(ABBufferQueryCursor *)self setHasFoundAnyImageDataForCurrentContact:0];
            [(ABBufferQueryCursor *)self setCurrentPropertyID:0xFFFFFFFFLL];
          }
          if ([(ABBufferQueryCursor *)self currentRecordID] != v8
            || [(ABBufferQueryCursor *)self resumeToken])
          {
            break;
          }
LABEL_38:
          if (![(NSIndexSet *)[[(ABBufferQueryCursor *)self query] requestedMultivalueIdentifiers] count]|| sqlite3_column_type(v6[1], [(ABBufferQueryCursor *)self multivaluePropertyIDColumn]) == 5)
          {
            goto LABEL_50;
          }
          uint64_t v21 = sqlite3_column_int(v6[1], [(ABBufferQueryCursor *)self multivaluePropertyIDColumn]);
          ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(v21);
          uint64_t v22 = sqlite3_column_int(v6[1], [(ABBufferQueryCursor *)self multivalueIdentifierColumn]);
          if ([(ABBufferQueryCursor *)self currentPropertyID] == v21)
          {
            if ([(ABBufferQueryCursor *)self currentMultivalueIdentifier] == v22) {
              goto LABEL_48;
            }
          }
          else
          {
            [(ABBufferQueryCursor *)self setCurrentPropertyID:v21];
            char v54 = 3;
            *(_DWORD *)v55 = v21;
            [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:&v54 length:5];
          }
          [(ABBufferQueryCursor *)self setCurrentMultivalueIdentifier:v22];
          int v23 = sqlite3_column_bytes(v6[1], [(ABBufferQueryCursor *)self multivalueUUIDColumn]);
          int v24 = sqlite3_column_blob(v6[1], [(ABBufferQueryCursor *)self multivalueUUIDColumn]);
          int v25 = sqlite3_column_bytes(v6[1], [(ABBufferQueryCursor *)self multivalueLabelColumn]);
          uint64_t v59 = 0;
          uint64_t v57 = 0;
          uint64_t v58 = 0;
          ABPropertyType v26 = ABPersonGetTypeOfProperty([(ABBufferQueryCursor *)self currentPropertyID]);
          if (v26 == 261)
          {
            uint64_t v27 = 0;
            uint64_t v28 = 0;
          }
          else
          {
            GetBytePointerAndLengthForTypeAtColumn((uint64_t)v6, v26, [(ABBufferQueryCursor *)self multivalueValueColumn], &v59, &v58, (double *)&v57);
            uint64_t v28 = v58;
            uint64_t v27 = v59;
          }
          char v54 = 4;
          *(_DWORD *)v55 = v22;
          *(void *)&v55[4] = v23;
          *(void *)&v55[12] = v25;
          uint64_t v56 = v28;
          [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:&v54 length:29];
          [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:v24 length:v23];
          [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:sqlite3_column_blob(v6[1], [(ABBufferQueryCursor *)self multivalueLabelColumn]) length:v25];
          [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:v27 length:v28];
          a3 = v45;
LABEL_48:
          if (TypeOfProperty == 261)
          {
            char v54 = 5;
            int v29 = sqlite3_column_bytes(v6[1], [(ABBufferQueryCursor *)self multivalueEntryKeyColumn]);
            int v30 = sqlite3_column_bytes(v6[1], [(ABBufferQueryCursor *)self multivalueEntryValueColumn]);
            *(void *)v55 = v29;
            uint64_t v31 = v30;
            *(void *)&v55[8] = v30;
            [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:&v54 length:17];
            [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:sqlite3_column_blob(v6[1], [(ABBufferQueryCursor *)self multivalueEntryKeyColumn]) length:v29];
            [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:sqlite3_column_blob(v6[1], [(ABBufferQueryCursor *)self multivalueEntryValueColumn]) length:v31];
          }
LABEL_50:
          int v32 = [(ABSQLPredicate *)[[(ABBufferQueryCursor *)self query] predicate] matchInfoProvider];
          if (v32)
          {
            uint64_t v33 = v32[2](v32, v8);
            if (v33)
            {
              uint64_t v34 = v33;
              int v35 = [(ABBufferQueryCursor *)self matchInfo];
              -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v34, [NSNumber numberWithInt:v8]);
            }
          }
        }
        [(ABBufferQueryCursor *)self setCurrentRecordID:v8];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __ABAddressBookPersonBufferRowHandler_block_invoke_520;
        v61 = &unk_1E59897B8;
        v62 = self;
        v63 = v6;
        int v64 = v8;
        if (v50((uint64_t)v49, (uint64_t)buf)) {
          return;
        }
        AppendBaseProperties((uint64_t)v6, self);
        if ([(ABBufferQueryCursor *)self resumeToken])
        {
LABEL_30:
          if (![(ABBufferQueryCursor *)self resumeToken])
          {
            if ([[(ABBufferQueryCursor *)self query] requestedWallpaperData])
            {
              AppendPropertyBlobData(v8, v44, self);
            }
            if ([[(ABBufferQueryCursor *)self query] requestedWatchWallpaperImageData])
            {
              AppendPropertyBlobData(v8, v43, self);
            }
            if ([[(ABBufferQueryCursor *)self query] requestedWallpaperMetadata])
            {
              AppendPropertyBlobData(v8, v42, self);
            }
          }
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __ABAddressBookPersonBufferRowHandler_block_invoke_2;
          v47[3] = &unk_1E59897E0;
          int v48 = v8;
          v47[4] = self;
          if (v50((uint64_t)v49, (uint64_t)v47)) {
            return;
          }
          goto LABEL_38;
        }
        int64_t v9 = [[(ABBufferQueryCursor *)self query] requestedPropertyIdentifiers];
        if (![(NSIndexSet *)v9 containsIndex:kABCPersonLinkUUIDProperty]) {
          goto LABEL_27;
        }
        if (sqlite3_column_type(v6[1], [(ABBufferQueryCursor *)self contactLinkUUIDColumn]) == 5) {
          goto LABEL_19;
        }
        CFDictionaryRef v10 = sqlite3_column_blob(v6[1], [(ABBufferQueryCursor *)self contactLinkUUIDColumn]);
        int v11 = sqlite3_column_bytes(v6[1], [(ABBufferQueryCursor *)self contactLinkUUIDColumn]);
        char v54 = 2;
        *(_DWORD *)v55 = kABCPersonLinkUUIDProperty;
        *(void *)&v55[4] = v11;
        [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:&v54 length:13];
        int v12 = [(ABBufferQueryCursor *)self mutableData];
        [(NSMutableData *)v12 appendBytes:v10 length:*(void *)&v55[4]];
        if ([[(ABBufferQueryCursor *)self query] contactidentifierAuditMode] != 2)
        {
LABEL_19:
          v15 = 0;
        }
        else
        {
          int v13 = [(ABBufferQueryCursor *)self mutableData];
          NSUInteger v14 = [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] length];
          v15 = (NSData *)[(NSMutableData *)v13 subdataWithRange:v14 - *(void *)&v55[4]];
        }
        if ([[(ABBufferQueryCursor *)self query] contactidentifierAuditMode] != 2)
        {
LABEL_27:
          int v19 = [[(ABBufferQueryCursor *)self query] requestedPropertyIdentifiers];
          if ([(NSIndexSet *)v19 containsIndex:kABCPersonIsPreferredImageProperty]
            && sqlite3_column_type(v6[1], [(ABBufferQueryCursor *)self contactPreferredForImageColumn]) != 5)
          {
            LODWORD(v59) = sqlite3_column_int(v6[1], [(ABBufferQueryCursor *)self contactPreferredForImageColumn]);
            char v54 = 2;
            *(_DWORD *)v55 = kABCPersonIsPreferredImageProperty;
            *(void *)&v55[4] = 4;
            [(NSMutableData *)[(ABBufferQueryCursor *)self mutableData] appendBytes:&v54 length:13];
            int v20 = [(ABBufferQueryCursor *)self mutableData];
            [(NSMutableData *)v20 appendBytes:&v59 length:*(void *)&v55[4]];
          }
          goto LABEL_30;
        }
        if ([(NSData *)v15 length])
        {
          if ([(NSData *)v15 isEqualToData:[(ABBufferQueryCursor *)self currentRecordLinkedUniqueIDAuditData]])
          {
LABEL_26:
            [(ABBufferQueryCursor *)self setCurrentRecordLinkedUniqueIDAuditData:v15];
            goto LABEL_27;
          }
          int v16 = [(ABBufferQueryCursor *)self contactIdentifiers];
          int v17 = v15;
        }
        else
        {
          int v18 = [(ABBufferQueryCursor *)self contactIdentifiers];
          int v17 = [(ABBufferQueryCursor *)self currentRecordIndividualUniqueIDAuditData];
          int v16 = v18;
        }
        [(NSMutableSet *)v16 addObject:v17];
        goto LABEL_26;
      }
    }
  }
  (*((void (**)(id, void, void, uint64_t))a3 + 2))(a3, 0, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"ABSQLiteErrorDomain" code:1 userInfo:0]);
LABEL_54:
  [(NSMutableSet *)self->_contactIdentifiers removeAllObjects];
  int v36 = ABOSLogImageMetadata();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    mutableData = self->_mutableData;
    uint64_t v38 = [(NSMutableData *)mutableData length];
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = mutableData;
    *(_WORD *)&buf[22] = 2048;
    v61 = (void *)v38;
    _os_log_impl(&dword_19DCDB000, v36, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) fetchNextBatchWithReply, releasing buffer (%p) [%lu]", buf, 0x20u);
  }

  self->_mutableData = 0;
}

- (ABBufferQuery)query
{
  return self->_query;
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (int)currentRecordID
{
  return self->_currentRecordID;
}

- (int)multivaluePropertyIDColumn
{
  return self->_multivaluePropertyIDColumn;
}

- (int)currentPropertyID
{
  return self->_currentPropertyID;
}

- (int)multivalueUUIDColumn
{
  return self->_multivalueUUIDColumn;
}

- (int)multivalueLabelColumn
{
  return self->_multivalueLabelColumn;
}

- (void)setCurrentPropertyID:(int)a3
{
  self->_currentPropertyID = a3;
}

- (int)multivalueIdentifierColumn
{
  return self->_multivalueIdentifierColumn;
}

- (void)setCurrentMultivalueIdentifier:(int)a3
{
  self->_currentMultivalueIdentifier = a3;
}

- (int)multivalueValueColumn
{
  return self->_multivalueValueColumn;
}

- (int)contactLinkUUIDColumn
{
  return self->_contactLinkUUIDColumn;
}

- (void)setHasFoundAnyImageDataForCurrentContact:(BOOL)a3
{
  self->_hasFoundAnyImageDataForCurrentContact = a3;
}

- (int64_t)maxContactsPerBatch
{
  return self->_maxContactsPerBatch;
}

- (int64_t)countOfContactsInBuffer
{
  return self->_countOfContactsInBuffer;
}

- (unint64_t)maxBufferSize
{
  return self->_maxBufferSize;
}

- (int64_t)resumeToken
{
  return self->_resumeToken;
}

- (void)setResumeToken:(int64_t)a3
{
  self->_resumeToken = a3;
}

- (void)setCurrentRecordID:(int)a3
{
  self->_currentRecordID = a3;
}

- (void)setCountOfContactsInBuffer:(int64_t)a3
{
  self->_countOfContactsInBuffer = a3;
}

- (int)currentMultivalueIdentifier
{
  return self->_currentMultivalueIdentifier;
}

- (int)contactPreferredForImageColumn
{
  return self->_contactPreferredForImageColumn;
}

- (int)multivalueEntryValueColumn
{
  return self->_multivalueEntryValueColumn;
}

- (int)multivalueEntryKeyColumn
{
  return self->_multivalueEntryKeyColumn;
}

- (NSMutableSet)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setCurrentRecordIndividualUniqueIDAuditData:(id)a3
{
}

- (NSData)currentRecordIndividualUniqueIDAuditData
{
  return self->_currentRecordIndividualUniqueIDAuditData;
}

- (NSMutableDictionary)matchInfo
{
  return self->_matchInfo;
}

- (BOOL)hasFoundAnyImageDataForCurrentContact
{
  return self->_hasFoundAnyImageDataForCurrentContact;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  incompleteBlob = self->_incompleteBlob;
  if (incompleteBlob) {
    sqlite3_blob_close(incompleteBlob);
  }
  if (self->_mutableData)
  {
    v4 = ABOSLogImageMetadata();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    mutableData = self->_mutableData;
    if (v5)
    {
      NSUInteger v7 = [(NSMutableData *)self->_mutableData length];
      *(_DWORD *)buf = 134218496;
      CFDictionaryRef v10 = self;
      __int16 v11 = 2048;
      int v12 = mutableData;
      __int16 v13 = 2048;
      NSUInteger v14 = v7;
      _os_log_impl(&dword_19DCDB000, v4, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) dealloc, releasing buffer (%p) [%lu]", buf, 0x20u);
      mutableData = self->_mutableData;
    }
  }
  else
  {
    mutableData = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)ABBufferQueryCursor;
  [(ABBufferQueryCursor *)&v8 dealloc];
}

- (void)setMutableData:(id)a3
{
}

- (void)setContactIdentifiers:(id)a3
{
}

- (void)setMatchInfo:(id)a3
{
}

- (sqlite3_blob)incompleteBlob
{
  return self->_incompleteBlob;
}

- (void)setIncompleteBlob:(sqlite3_blob *)a3
{
  self->_incompleteBlob = a3;
}

- (unint64_t)blobBytesWritten
{
  return self->_blobBytesWritten;
}

- (void)setBlobBytesWritten:(unint64_t)a3
{
  self->_blobBytesWritten = a3;
}

- (unint64_t)blobLength
{
  return self->_blobLength;
}

- (void)setBlobLength:(unint64_t)a3
{
  self->_blobLength = a3;
}

- (int64_t)currentMultivalue
{
  return self->_currentMultivalue;
}

- (void)setCurrentMultivalue:(int64_t)a3
{
  self->_currentMultivalue = a3;
}

- (NSData)currentRecordLinkedUniqueIDAuditData
{
  return self->_currentRecordLinkedUniqueIDAuditData;
}

- (void)setCurrentRecordLinkedUniqueIDAuditData:(id)a3
{
}

- (void)setMaxBufferSize:(unint64_t)a3
{
  self->_maxBufferSize = a3;
}

- (void)setMaxContactsPerBatch:(int64_t)a3
{
  self->_maxContactsPerBatch = a3;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setMultivaluePropertyIDColumn:(int)a3
{
  self->_multivaluePropertyIDColumn = a3;
}

- (void)setMultivalueIdentifierColumn:(int)a3
{
  self->_multivalueIdentifierColumn = a3;
}

- (void)setMultivalueUUIDColumn:(int)a3
{
  self->_multivalueUUIDColumn = a3;
}

- (void)setMultivalueValueColumn:(int)a3
{
  self->_multivalueValueColumn = a3;
}

- (void)setMultivalueLabelColumn:(int)a3
{
  self->_multivalueLabelColumn = a3;
}

- (void)setMultivalueEntryKeyColumn:(int)a3
{
  self->_multivalueEntryKeyColumn = a3;
}

- (void)setMultivalueEntryValueColumn:(int)a3
{
  self->_multivalueEntryValueColumn = a3;
}

- (void)setContactLinkUUIDColumn:(int)a3
{
  self->_contactLinkUUIDColumn = a3;
}

- (void)setContactPreferredForImageColumn:(int)a3
{
  self->_contactPreferredForImageColumn = a3;
}

- (int)personLinkColumn
{
  return self->_personLinkColumn;
}

- (void)setPersonLinkColumn:(int)a3
{
  self->_personLinkColumn = a3;
}

- (void)fetchNextBatchWithReply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = sqlite3_errmsg(*(sqlite3 **)(*(void *)a1 + 8));
  int v4 = 136315138;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_19DCDB000, a2, OS_LOG_TYPE_ERROR, "Error handling SQL statement in ABAddressBookCopyPersonBufferForQuery: %s", (uint8_t *)&v4, 0xCu);
}

@end
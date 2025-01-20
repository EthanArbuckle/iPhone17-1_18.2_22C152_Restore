@interface ABAssistantSyncAnchor
+ (id)anchorWithString:(id)a3 forContactStore:(id)a4;
+ (id)stringValueForFullSyncWithContactLegacyIdentifier:(int)a3;
+ (id)stringValueWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4;
- (ABAssistantSyncAnchor)init;
- (ABAssistantSyncAnchor)initWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4;
- (BOOL)isOlderThanAnchor:(id)a3;
- (BOOL)shouldClearChangeHistoryForPreviouslySyncedContacts;
- (BOOL)shouldFullSync;
- (BOOL)shouldResetSync;
- (BOOL)shouldResumePreviousFullSync;
- (NSString)stringValue;
- (id)description;
- (id)shortDescription;
- (int)contactLegacyIdentifier;
- (int64_t)sequenceNumber;
- (void)resetSync;
@end

@implementation ABAssistantSyncAnchor

- (ABAssistantSyncAnchor)initWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ABAssistantSyncAnchor;
  result = [(ABAssistantSyncAnchor *)&v7 init];
  if (result)
  {
    result->_sequenceNumber = a3;
    result->_contactLegacyIdentifier = a4;
  }
  return result;
}

- (ABAssistantSyncAnchor)init
{
  return (ABAssistantSyncAnchor *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(self, a2, -1, 0xFFFFFFFFLL);
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)contactLegacyIdentifier
{
  return self->_contactLegacyIdentifier;
}

+ (id)stringValueWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%li %d", a3, a4);
}

+ (id)stringValueForFullSyncWithContactLegacyIdentifier:(int)a3
{
  return (id)objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, a2, -1, *(void *)&a3);
}

- (NSString)stringValue
{
  return (NSString *)objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, a2, self->_sequenceNumber, self->_contactLegacyIdentifier);
}

- (id)description
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_sequenceNumber(self, a2, v2);
  uint64_t v8 = objc_msgSend_contactLegacyIdentifier(self, v6, v7);
  if (objc_msgSend_shouldResetSync(self, v9, v10)) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (objc_msgSend_shouldClearChangeHistoryForPreviouslySyncedContacts(self, v11, v12)) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  if (objc_msgSend_shouldFullSync(self, v14, v15)) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if (objc_msgSend_shouldResumePreviousFullSync(self, v17, v18)) {
    return (id)objc_msgSend_stringWithFormat_(v4, v20, @"sequenceNumber = %li, contactLegacyIdentifier = %d, shouldResetSync = %@, shouldDeleteSyncedContacts = %@, shouldFullSync = %@, shouldResumePreviousFullSync = %@", v5, v8, v13, v16, v19, @"YES");
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(v4, v20, @"sequenceNumber = %li, contactLegacyIdentifier = %d, shouldResetSync = %@, shouldDeleteSyncedContacts = %@, shouldFullSync = %@, shouldResumePreviousFullSync = %@", v5, v8, v13, v16, v19, @"NO");
  }
}

- (id)shortDescription
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_sequenceNumber(self, a2, v2);
  uint64_t v8 = objc_msgSend_contactLegacyIdentifier(self, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, @"sequenceNumber = %li, contactLegacyIdentifier = %d", v5, v8);
}

- (BOOL)shouldResetSync
{
  return self->_sequenceNumber == -1 && self->_contactLegacyIdentifier == -1;
}

- (BOOL)shouldFullSync
{
  return self->_sequenceNumber == -1;
}

- (BOOL)shouldResumePreviousFullSync
{
  return self->_sequenceNumber == -1 && self->_contactLegacyIdentifier > 0;
}

- (BOOL)shouldClearChangeHistoryForPreviouslySyncedContacts
{
  return self->_sequenceNumber > 0;
}

+ (id)anchorWithString:(id)a3 forContactStore:(id)a4
{
  id v5 = a3;
  id v7 = a4;
  if (v5)
  {
    uint64_t v8 = objc_msgSend_componentsSeparatedByString_(v5, v6, @" ");
    if (objc_msgSend_count(v8, v9, v10) != 2) {
      goto LABEL_9;
    }
    uint64_t v30 = 0;
    uint64_t v12 = (void *)MEMORY[0x263F08B08];
    v13 = objc_msgSend_objectAtIndex_(v8, v11, 0);
    uint64_t v15 = objc_msgSend_scannerWithString_(v12, v14, (uint64_t)v13);
    int v17 = objc_msgSend_scanInteger_(v15, v16, (uint64_t)&v30);

    if (!v17) {
      goto LABEL_9;
    }
    uint64_t v20 = v30;
    if (v30 >= -1
      && v20 <= (int)objc_msgSend_saveSequenceCount(v7, v18, v19)
      && (objc_msgSend_objectAtIndexedSubscript_(v8, v21, 1),
          v22 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = objc_msgSend_intValue(v22, v23, v24),
          v22,
          v25 != -1))
    {
      v26 = [ABAssistantSyncAnchor alloc];
      v28 = (ABAssistantSyncAnchor *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v26, v27, v30, v25);

      if (v28) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_9:
    }
  }
  v28 = objc_alloc_init(ABAssistantSyncAnchor);
LABEL_11:

  return v28;
}

- (BOOL)isOlderThanAnchor:(id)a3
{
  id v6 = a3;
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = objc_msgSend_sequenceNumber(self, v4, v5);
  if (v7 >= objc_msgSend_sequenceNumber(v6, v8, v9))
  {
    uint64_t v13 = objc_msgSend_sequenceNumber(self, v10, v11);
    if (v13 == objc_msgSend_sequenceNumber(v6, v14, v15))
    {
      int v18 = objc_msgSend_contactLegacyIdentifier(self, v16, v17);
      BOOL v12 = v18 < (int)objc_msgSend_contactLegacyIdentifier(v6, v19, v20);
      goto LABEL_7;
    }
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (void)resetSync
{
  self->_sequenceNumber = -1;
  self->_contactLegacyIdentifier = -1;
}

@end
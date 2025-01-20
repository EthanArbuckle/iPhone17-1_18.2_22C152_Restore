@interface CKSyncEngineFetchedZoneDeletion
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKRecordZoneID)zoneID;
- (CKSyncEngineFetchedZoneDeletion)initWithZoneID:(id)a3 reason:(int64_t)a4;
- (CKSyncEngineZoneDeletionReason)reason;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineFetchedZoneDeletion

- (CKSyncEngineFetchedZoneDeletion)initWithZoneID:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  id v26 = 0;
  char v8 = _CKCheckArgument((uint64_t)"zoneID", v7, 0, 0, 0, &v26);
  id v9 = v26;
  if ((v8 & 1) == 0)
  {
    v13 = v9;
    v14 = [CKException alloc];
    uint64_t v18 = objc_msgSend_code(v13, v15, v16, v17);
    v22 = objc_msgSend_localizedDescription(v13, v19, v20, v21);
    id v24 = (id)objc_msgSend_initWithCode_format_(v14, v23, v18, @"%@", v22);

    objc_exception_throw(v24);
  }

  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineFetchedZoneDeletion;
  v10 = [(CKSyncEngineFetchedZoneDeletion *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zoneID, a3);
    v11->_reason = a4;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchedZoneDeletion *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchedZoneDeletion *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"FetchedZoneDeletion";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_reason(self, v5, v6, v7);
  if (v8 > 2) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"reason", @"Unknown", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"reason", (uint64_t)off_1E54604F0[v8], 0);
  }
  objc_msgSend_zoneID(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, @"zoneID", (uint64_t)v14, 0);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKSyncEngineZoneDeletionReason)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end
@interface CKSyncEngineFetchedRecordDeletion
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKRecordID)recordID;
- (CKRecordType)recordType;
- (CKSyncEngineFetchedRecordDeletion)initWithRecordID:(id)a3 recordType:(id)a4;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineFetchedRecordDeletion

- (CKSyncEngineFetchedRecordDeletion)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v27 = 0;
  char v9 = _CKCheckArgument((uint64_t)"recordID", v7, 0, 0, 0, &v27);
  id v10 = v27;
  if ((v9 & 1) == 0)
  {
    v14 = v10;
    v15 = [CKException alloc];
    uint64_t v19 = objc_msgSend_code(v14, v16, v17, v18);
    v23 = objc_msgSend_localizedDescription(v14, v20, v21, v22);
    id v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, @"%@", v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKSyncEngineFetchedRecordDeletion;
  v11 = [(CKSyncEngineFetchedRecordDeletion *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordID, a3);
    objc_storeStrong((id *)&v12->_recordType, a4);
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchedRecordDeletion *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchedRecordDeletion *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"FetchedRecordDeletion";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_recordType(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"recordType", (uint64_t)v8, 0);

  objc_msgSend_recordID(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, @"recordID", (uint64_t)v14, 0);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecordType)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
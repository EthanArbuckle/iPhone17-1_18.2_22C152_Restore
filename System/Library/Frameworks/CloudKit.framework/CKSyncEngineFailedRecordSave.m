@interface CKSyncEngineFailedRecordSave
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKRecord)record;
- (CKSyncEngineFailedRecordSave)initWithRecord:(id)a3 error:(id)a4;
- (NSError)error;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineFailedRecordSave

- (CKSyncEngineFailedRecordSave)initWithRecord:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v29 = 0;
  char v9 = _CKCheckArgument((uint64_t)"record", v7, 0, 0, 0, &v29);
  id v10 = v29;
  if ((v9 & 1) == 0
    || (v10,
        id v28 = 0,
        char v11 = _CKCheckArgument((uint64_t)"error", v8, 0, 0, 0, &v28),
        id v10 = v28,
        (v11 & 1) == 0))
  {
    v15 = v10;
    v16 = [CKException alloc];
    uint64_t v20 = objc_msgSend_code(v15, v17, v18, v19);
    v24 = objc_msgSend_localizedDescription(v15, v21, v22, v23);
    id v26 = (id)objc_msgSend_initWithCode_format_(v16, v25, v20, @"%@", v24);

    objc_exception_throw(v26);
  }

  v27.receiver = self;
  v27.super_class = (Class)CKSyncEngineFailedRecordSave;
  v12 = [(CKSyncEngineFailedRecordSave *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_record, a3);
    objc_storeStrong((id *)&v13->_error, a4);
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFailedRecordSave *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFailedRecordSave *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"FailedRecordSave";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_record(self, v5, v6, v7);
  v12 = objc_msgSend_conciseDescription(v8, v9, v10, v11);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, @"record", (uint64_t)v12, 0);

  objc_msgSend_error(self, v14, v15, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, @"error", (uint64_t)v18, 0);
}

- (CKRecord)record
{
  return self->_record;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

@end
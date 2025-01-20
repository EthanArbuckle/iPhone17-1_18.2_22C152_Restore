@interface CKRecordDecryptInfo
- (CKRecord)record;
- (CKRecordDecryptInfo)init;
- (CKRecordDecryptInfo)initWithRecord:(id)a3 callbackQueue:(id)a4;
- (NSError)error;
- (OS_dispatch_group)decryptGroup;
- (id)callback;
- (unint64_t)numUnwrapAttempts;
- (void)_setupDecryptCallbackForQueue:(id)a3;
- (void)setCallback:(id)a3;
- (void)setDecryptGroup:(id)a3;
- (void)setError:(id)a3;
- (void)setNumUnwrapAttempts:(unint64_t)a3;
@end

@implementation CKRecordDecryptInfo

- (CKRecordDecryptInfo)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"You must call -[%@ initWithRecord:callbackQueue:]", v5);

  objc_exception_throw(v7);
}

- (CKRecordDecryptInfo)initWithRecord:(id)a3 callbackQueue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v12 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 66, @"You can't decrypt a nil record");

    if (v12) {
      goto LABEL_3;
    }
  }
  v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 67, @"You must specify a callback queue");

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)CKRecordDecryptInfo;
  v13 = [(CKRecordDecryptInfo *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_record, a3);
    objc_msgSend__setupDecryptCallbackForQueue_(v14, v15, (uint64_t)v12);
  }

  return v14;
}

- (void)_setupDecryptCallbackForQueue:(id)a3
{
  v4 = a3;
  v5 = (OS_dispatch_group *)dispatch_group_create();
  decryptGroup = self->_decryptGroup;
  self->_decryptGroup = v5;

  id v9 = objc_msgSend_decryptGroup(self, v7, v8);
  dispatch_group_enter(v9);

  objc_initWeak(&location, self);
  v12 = objc_msgSend_decryptGroup(self, v10, v11);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FE0594;
  v13[3] = &unk_1E64F09E0;
  objc_copyWeak(&v14, &location);
  dispatch_group_notify(v12, v4, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (CKRecord)record
{
  return self->_record;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_dispatch_group)decryptGroup
{
  return self->_decryptGroup;
}

- (void)setDecryptGroup:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (unint64_t)numUnwrapAttempts
{
  return self->_numUnwrapAttempts;
}

- (void)setNumUnwrapAttempts:(unint64_t)a3
{
  self->_numUnwrapAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_decryptGroup, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
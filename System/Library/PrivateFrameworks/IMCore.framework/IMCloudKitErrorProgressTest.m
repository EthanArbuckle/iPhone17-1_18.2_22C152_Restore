@interface IMCloudKitErrorProgressTest
- (IMCloudKitErrorProgressTest)initWithErrorCode:(int64_t)a3;
- (NSError)error;
- (void)setError:(id)a3;
- (void)willUpdateSyncState:(id)a3;
@end

@implementation IMCloudKitErrorProgressTest

- (IMCloudKitErrorProgressTest)initWithErrorCode:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMCloudKitErrorProgressTest;
  v5 = [(IMCloudKitErrorProgressTest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v4, *MEMORY[0x1E4F6D138], a3, 0);
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (void)willUpdateSyncState:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_super v9 = objc_msgSend_error(self, v6, v7, v8);
  v17[0] = v9;
  v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v17, 1);
  v14 = objc_msgSend_serializedErrorArrayFromErrorArray_im_(v4, v12, (uint64_t)v11, v13);
  objc_msgSend_setIMCloudKitSyncErrors_(v5, v15, (uint64_t)v14, v16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CKDRecordResponse
- (CKDRecordResponse)initWithRecordID:(id)a3 record:(id)a4 etag:(id)a5;
- (CKRecord)record;
- (CKRecordID)recordID;
- (NSString)etag;
- (id)CKPropertiesDescription;
- (id)description;
@end

@implementation CKDRecordResponse

- (CKDRecordResponse)initWithRecordID:(id)a3 record:(id)a4 etag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CKDRecordResponse;
  v13 = [(CKDRecordResponse *)&v21 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v11, v12);
    recordID = v13->_recordID;
    v13->_recordID = (CKRecordID *)v14;

    objc_storeStrong((id *)&v13->_record, a4);
    uint64_t v18 = objc_msgSend_copy(v10, v16, v17);
    etag = v13->_etag;
    v13->_etag = (NSString *)v18;
  }
  return v13;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_recordID(self, a2, v2);
  id v8 = objc_msgSend_etag(self, v6, v7);
  uint64_t v12 = objc_msgSend_record(self, v9, v10);
  v13 = @"true";
  if (!v12) {
    v13 = @"false";
  }
  uint64_t v14 = objc_msgSend_stringWithFormat_(v4, v11, @"recordID=%@, etag=%@, hasRecord=%@", v5, v8, v13);

  return v14;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordResponse *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (NSString)etag
{
  return self->_etag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
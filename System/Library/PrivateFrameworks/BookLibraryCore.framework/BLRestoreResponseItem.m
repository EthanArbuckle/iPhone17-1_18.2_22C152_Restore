@interface BLRestoreResponseItem
+ (BOOL)supportsSecureCoding;
- (BLRestoreResponseItem)initWithCoder:(id)a3;
- (BLRestoreResponseItem)initWithStoreItemID:(id)a3 downloadID:(id)a4 error:(id)a5;
- (BOOL)success;
- (NSError)error;
- (NSNumber)storeItemID;
- (NSString)downloadID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setError:(id)a3;
- (void)setStoreItemID:(id)a3;
@end

@implementation BLRestoreResponseItem

- (BLRestoreResponseItem)initWithStoreItemID:(id)a3 downloadID:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLRestoreResponseItem;
  v12 = [(BLRestoreResponseItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeItemID, a3);
    objc_storeStrong((id *)&v13->_downloadID, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (BOOL)success
{
  v4 = objc_msgSend_downloadID(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLRestoreResponseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BLRestoreResponseItem;
  BOOL v5 = [(BLRestoreResponseItem *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"storeItemID");
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"downloadID");
    downloadID = v5->_downloadID;
    v5->_downloadID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"error");
    error = v5->_error;
    v5->_error = (NSError *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_storeItemID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"storeItemID");

  v13 = objc_msgSend_downloadID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"downloadID");

  objc_msgSend_error(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v19, @"error");
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_storeItemID(self, v9, v10, v11);
  objc_msgSend_setStoreItemID_(v8, v13, (uint64_t)v12, v14);

  v18 = objc_msgSend_downloadID(self, v15, v16, v17);
  objc_msgSend_setDownloadID_(v8, v19, (uint64_t)v18, v20);

  v24 = objc_msgSend_error(self, v21, v22, v23);
  objc_msgSend_setError_(v8, v25, (uint64_t)v24, v26);

  return v8;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);

  objc_storeStrong((id *)&self->_storeItemID, 0);
}

@end
@interface CKDAnonymousShareTuple
+ (BOOL)supportsSecureCoding;
- (CKDAnonymousShareTuple)initWithCoder:(id)a3;
- (CKDAnonymousShareTuple)initWithZoneID:(id)a3 shareID:(id)a4;
- (CKRecordID)shareID;
- (CKRecordZoneID)zoneID;
- (NSString)ckAnonymousShareHashIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCkAnonymousShareHashIdentifier:(id)a3;
@end

@implementation CKDAnonymousShareTuple

- (CKDAnonymousShareTuple)initWithZoneID:(id)a3 shareID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAnonymousShareTuple;
  v10 = [(CKDAnonymousShareTuple *)&v18 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    zoneID = v10->_zoneID;
    v10->_zoneID = (CKRecordZoneID *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    shareID = v10->_shareID;
    v10->_shareID = (CKRecordID *)v15;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_zoneID(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"CKDAnonymousShareZoneID");

  uint64_t v11 = objc_msgSend_shareID(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"CKDAnonymousShareShareID");

  objc_msgSend_ckAnonymousShareHashIdentifier(self, v13, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v16, @"CKDAnonymousShareHashIdentifier");
}

- (CKDAnonymousShareTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKDAnonymousShareTuple;
  v5 = [(CKDAnonymousShareTuple *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"CKDAnonymousShareZoneID");
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"CKDAnonymousShareShareID");
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"CKDAnonymousShareHashIdentifier");
    ckAnonymousShareHashIdentifier = v5->_ckAnonymousShareHashIdentifier;
    v5->_ckAnonymousShareHashIdentifier = (NSString *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKDAnonymousShareTuple);
  id v7 = objc_msgSend_zoneID(self, v5, v6);
  uint64_t v10 = objc_msgSend_copy(v7, v8, v9);
  zoneID = v4->_zoneID;
  v4->_zoneID = (CKRecordZoneID *)v10;

  uint64_t v14 = objc_msgSend_shareID(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  shareID = v4->_shareID;
  v4->_shareID = (CKRecordID *)v17;

  v21 = objc_msgSend_ckAnonymousShareHashIdentifier(self, v19, v20);
  uint64_t v24 = objc_msgSend_copy(v21, v22, v23);
  ckAnonymousShareHashIdentifier = v4->_ckAnonymousShareHashIdentifier;
  v4->_ckAnonymousShareHashIdentifier = (NSString *)v24;

  return v4;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (NSString)ckAnonymousShareHashIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCkAnonymousShareHashIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAnonymousShareHashIdentifier, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
@interface CKPackageReference
+ (BOOL)supportsSecureCoding;
- (CKPackageReference)initWithCoder:(id)a3;
- (CKPackageReference)initWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6;
- (CKRecordID)recordID;
- (NSData)signature;
- (NSString)fieldName;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation CKPackageReference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPackageReference)initWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKPackageReference;
  v14 = [(CKPackageReference *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recordID, a3);
    v15->_databaseScope = a4;
    objc_storeStrong((id *)&v15->_fieldName, a5);
    objc_storeStrong((id *)&v15->_signature, a6);
  }

  return v15;
}

- (CKPackageReference)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"recordID");
  uint64_t v10 = objc_msgSend_decodeIntegerForKey_(v4, v8, @"databaseScope", v9);
  uint64_t v11 = objc_opt_class();
  id v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"fieldName");
  uint64_t v14 = objc_opt_class();
  v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"signature");

  v18 = (CKPackageReference *)objc_msgSend_initWithRecordID_databaseScope_fieldName_signature_(self, v17, (uint64_t)v7, v10, v13, v16);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  recordID = self->_recordID;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)recordID, @"recordID");
  objc_msgSend_encodeInteger_forKey_(v9, v6, self->_databaseScope, @"databaseScope");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_fieldName, @"fieldName");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_signature, @"signature");
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
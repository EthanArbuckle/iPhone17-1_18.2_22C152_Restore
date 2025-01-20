@interface CKDAnonymousZoneDataObject
- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3;
- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3 changeType:(int)a4 deleteType:(int)a5;
- (NSData)encryptedTupleData;
- (int)changeType;
- (int)deleteType;
@end

@implementation CKDAnonymousZoneDataObject

- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDAnonymousZoneDataObject;
  v7 = [(CKDAnonymousZoneDataObject *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    encryptedTupleData = v7->_encryptedTupleData;
    v7->_encryptedTupleData = (NSData *)v8;
  }
  return v7;
}

- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3 changeType:(int)a4 deleteType:(int)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDAnonymousZoneDataObject;
  objc_super v11 = [(CKDAnonymousZoneDataObject *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v8, v9, v10);
    encryptedTupleData = v11->_encryptedTupleData;
    v11->_encryptedTupleData = (NSData *)v12;

    v11->_changeType = a4;
    v11->_deleteType = a5;
  }

  return v11;
}

- (NSData)encryptedTupleData
{
  return self->_encryptedTupleData;
}

- (int)changeType
{
  return self->_changeType;
}

- (int)deleteType
{
  return self->_deleteType;
}

- (void).cxx_destruct
{
}

@end
@interface CKInitiateParticipantVettingOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKInitiateParticipantVettingOperationInfo)initWithCoder:(id)a3;
- (CKShareMetadata)shareMetadata;
- (NSString)address;
- (NSString)participantID;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setShareMetadata:(id)a3;
@end

@implementation CKInitiateParticipantVettingOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_shareMetadata(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"ShareMetadata");

  v13 = objc_msgSend_participantID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"ParticipantID");

  v18 = objc_msgSend_address(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"Address");

  v20.receiver = self;
  v20.super_class = (Class)CKInitiateParticipantVettingOperationInfo;
  [(CKOperationInfo *)&v20 encodeWithCoder:v4];
}

- (CKInitiateParticipantVettingOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKInitiateParticipantVettingOperationInfo;
  v5 = [(CKOperationInfo *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ShareMetadata");
    shareMetadata = v5->_shareMetadata;
    v5->_shareMetadata = (CKShareMetadata *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"ParticipantID");
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"Address");
    address = v5->_address;
    v5->_address = (NSString *)v16;
  }
  return v5;
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);

  objc_storeStrong((id *)&self->_shareMetadata, 0);
}

@end
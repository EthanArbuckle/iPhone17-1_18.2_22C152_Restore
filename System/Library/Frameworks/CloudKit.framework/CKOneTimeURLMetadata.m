@interface CKOneTimeURLMetadata
+ (BOOL)supportsSecureCoding;
- (CKEncryptedData)encryptedOneTimeFullToken;
- (CKOneTimeURLMetadata)initWithCoder:(id)a3;
- (CKOneTimeURLMetadata)initWithEncryptedOneTimeFullToken:(id)a3 participantID:(id)a4;
- (CKOneTimeURLMetadata)initWithSharingKeyBytes:(id)a3 sharingKeySeed:(id)a4 participantID:(id)a5;
- (NSData)encryptedOneTimeFullTokenData;
- (NSData)oneTimeShortSharingTokenHashData;
- (NSData)sharingKeyBytes;
- (NSData)sharingKeySeed;
- (NSString)oneTimeShortSharingToken;
- (NSString)participantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)oneTimeFullToken;
- (id)oneTimeFullTokenProtoMessageData;
- (id)oneTimeShortSharingTokenData;
- (id)oneTimeShortTokenWithRoutingKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedOneTimeFullToken:(id)a3;
@end

@implementation CKOneTimeURLMetadata

- (CKOneTimeURLMetadata)initWithSharingKeyBytes:(id)a3 sharingKeySeed:(id)a4 participantID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)CKOneTimeURLMetadata;
  v14 = [(CKOneTimeURLMetadata *)&v37 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    sharingKeyBytes = v14->_sharingKeyBytes;
    v14->_sharingKeyBytes = (NSData *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    sharingKeySeed = v14->_sharingKeySeed;
    v14->_sharingKeySeed = (NSData *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v25;

    v27 = [CKEncryptedData alloc];
    v31 = objc_msgSend_oneTimeFullTokenProtoMessageData(v14, v28, v29, v30);
    uint64_t v34 = objc_msgSend_initWithData_(v27, v32, (uint64_t)v31, v33);
    encryptedOneTimeFullToken = v14->_encryptedOneTimeFullToken;
    v14->_encryptedOneTimeFullToken = (CKEncryptedData *)v34;
  }
  return v14;
}

- (CKOneTimeURLMetadata)initWithEncryptedOneTimeFullToken:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)CKOneTimeURLMetadata;
  v11 = [(CKOneTimeURLMetadata *)&v54 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_data(v6, v8, v9, v10);

    if (v12)
    {
      v16 = [CKDPOneTimeFullTokenInfo alloc];
      uint64_t v20 = objc_msgSend_encryptedOneTimeFullToken(v11, v17, v18, v19);
      uint64_t v24 = objc_msgSend_data(v20, v21, v22, v23);
      v27 = objc_msgSend_initWithData_(v16, v25, (uint64_t)v24, v26);

      v31 = objc_msgSend_sharingKeyBytes(v27, v28, v29, v30);
      uint64_t v35 = objc_msgSend_copy(v31, v32, v33, v34);
      sharingKeyBytes = v11->_sharingKeyBytes;
      v11->_sharingKeyBytes = (NSData *)v35;

      v40 = objc_msgSend_sharingKeySeed(v27, v37, v38, v39);
      uint64_t v44 = objc_msgSend_copy(v40, v41, v42, v43);
      sharingKeySeed = v11->_sharingKeySeed;
      v11->_sharingKeySeed = (NSData *)v44;
    }
    uint64_t v46 = objc_msgSend_copy(v7, v13, v14, v15);
    participantID = v11->_participantID;
    v11->_participantID = (NSString *)v46;

    uint64_t v51 = objc_msgSend_copy(v6, v48, v49, v50);
    encryptedOneTimeFullToken = v11->_encryptedOneTimeFullToken;
    v11->_encryptedOneTimeFullToken = (CKEncryptedData *)v51;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_encryptedOneTimeFullToken(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, @"encryptedOneTimeFullToken");

  uint64_t v13 = objc_msgSend_participantID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, @"participantID");

  uint64_t v18 = objc_msgSend_sharingKeySeed(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, @"sharingKeySeed");

  uint64_t v23 = objc_msgSend_sharingKeyBytes(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, @"sharingKeyBytes");
}

- (CKOneTimeURLMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKOneTimeURLMetadata;
  v5 = [(CKOneTimeURLMetadata *)&v24 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"encryptedOneTimeFullToken");
    encryptedOneTimeFullToken = v5->_encryptedOneTimeFullToken;
    v5->_encryptedOneTimeFullToken = (CKEncryptedData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"participantID");
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"sharingKeySeed");
    sharingKeySeed = v5->_sharingKeySeed;
    v5->_sharingKeySeed = (NSData *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"sharingKeyBytes");
    sharingKeyBytes = v5->_sharingKeyBytes;
    v5->_sharingKeyBytes = (NSData *)v21;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CKOneTimeURLMetadata, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_init(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_encryptedOneTimeFullToken, v11, (uint64_t)a3, v12);
  uint64_t v14 = (void *)v10[1];
  v10[1] = v13;

  uint64_t v17 = objc_msgSend_copyWithZone_(self->_participantID, v15, (uint64_t)a3, v16);
  uint64_t v18 = (void *)v10[4];
  v10[4] = v17;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_sharingKeySeed, v19, (uint64_t)a3, v20);
  uint64_t v22 = (void *)v10[3];
  v10[3] = v21;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_sharingKeyBytes, v23, (uint64_t)a3, v24);
  uint64_t v26 = (void *)v10[2];
  v10[2] = v25;

  return v10;
}

- (id)oneTimeFullTokenProtoMessageData
{
  uint64_t v3 = objc_alloc_init(CKDPOneTimeFullTokenInfo);
  uint64_t v7 = objc_msgSend_sharingKeyBytes(self, v4, v5, v6);
  objc_msgSend_setSharingKeyBytes_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_setSharingKeyType_(v3, v10, 0, v11);
  uint64_t v15 = objc_msgSend_sharingKeySeed(self, v12, v13, v14);
  objc_msgSend_setSharingKeySeed_(v3, v16, (uint64_t)v15, v17);

  uint64_t v21 = objc_msgSend_data(v3, v18, v19, v20);

  return v21;
}

- (id)oneTimeFullToken
{
  v78[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_encryptedOneTimeFullToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_data(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_encryptedOneTimeFullToken(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_data(v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_CKBase64URLSafeString(v17, v18, v19, v20);

    uint64_t v22 = [CKDPOneTimeFullTokenInfo alloc];
    uint64_t v26 = objc_msgSend_encryptedOneTimeFullToken(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_data(v26, v27, v28, v29);
    uint64_t v33 = objc_msgSend_initWithData_(v22, v31, (uint64_t)v30, v32);

    objc_super v37 = objc_msgSend_sharingKeyBytes(v33, v34, v35, v36);
    v41 = (NSData *)objc_msgSend_copy(v37, v38, v39, v40);
    sharingKeyBytes = self->_sharingKeyBytes;
    self->_sharingKeyBytes = v41;

    uint64_t v46 = objc_msgSend_sharingKeySeed(v33, v43, v44, v45);
    uint64_t v50 = (NSData *)objc_msgSend_copy(v46, v47, v48, v49);
    sharingKeySeed = self->_sharingKeySeed;
    self->_sharingKeySeed = v50;

LABEL_3:
    __int16 v77 = 0;
    int v76 = 32;
    v53 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v52, (uint64_t)&v76, 3);
    v57 = objc_msgSend_CKBase64URLSafeString(v53, v54, v55, v56);

    v78[0] = v57;
    v78[1] = v21;
    v59 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v58, (uint64_t)v78, 2);
    v62 = objc_msgSend_componentsJoinedByString_(v59, v60, (uint64_t)&stru_1ED7F5C98, v61);

    goto LABEL_8;
  }
  uint64_t v63 = objc_msgSend_sharingKeyBytes(self, v10, v11, v12);
  if (v63)
  {
    v67 = (void *)v63;
    v68 = objc_msgSend_sharingKeySeed(self, v64, v65, v66);

    if (v68)
    {
      uint64_t v33 = objc_msgSend_oneTimeFullTokenProtoMessageData(self, v69, v70, v71);
      uint64_t v21 = objc_msgSend_CKBase64URLSafeString(v33, v72, v73, v74);
      goto LABEL_3;
    }
  }
  v62 = 0;
LABEL_8:

  return v62;
}

- (id)oneTimeShortSharingTokenData
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_oneTimeFullToken(self, a2, v2, v3);
  uint64_t v7 = (void *)v5;
  if (v5)
  {
    v18[0] = @"one-time-link-encryption-key";
    v18[1] = v5;
    uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v18, 2);
    uint64_t v11 = objc_msgSend_componentsJoinedByString_(v8, v9, (uint64_t)&stru_1ED7F5C98, v10);

    uint64_t v15 = objc_msgSend_sharingKeySeed(self, v12, v13, v14);
    uint64_t v16 = CKHKDFSHA256(v15, v11, 16);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (NSString)oneTimeShortSharingToken
{
  id v4 = objc_msgSend_oneTimeShortSharingTokenData(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)oneTimeShortTokenWithRoutingKey:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v11 = objc_msgSend_oneTimeShortSharingToken(self, v5, v6, v7);
  if (!v11)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "Couldn't get a one-time short sharing token";
    uint64_t v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_16;
  }
  if (objc_msgSend_length(v4, v8, v9, v10) == 3)
  {
    v23[0] = v4;
    v23[1] = v11;
    uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v23, 2);
    uint64_t v16 = objc_msgSend_componentsJoinedByString_(v13, v14, (uint64_t)&stru_1ED7F5C98, v15);

    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v21 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v4;
    uint64_t v18 = "Routing key is invalid: \"%{public}@\"";
    uint64_t v19 = v21;
    uint32_t v20 = 12;
LABEL_16:
    _os_log_error_impl(&dword_18AF10000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
  }
LABEL_11:
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (NSData)oneTimeShortSharingTokenHashData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_oneTimeShortSharingToken(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = (const void *)objc_msgSend_UTF8String(v4, v5, v6, v7, 0, 0, 0, 0);
    CC_LONG v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v8, v10, 4, v11);
    CC_SHA256(v9, v12, (unsigned __int8 *)&v16);
    uint64_t v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v13, (uint64_t)&v16, 32);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return (NSData *)v14;
}

- (NSData)encryptedOneTimeFullTokenData
{
  uint64_t v5 = objc_msgSend_oneTimeFullToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_oneTimeShortSharingTokenData(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_encryptFullToken_shortSharingTokenData_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);

  return (NSData *)v11;
}

- (CKEncryptedData)encryptedOneTimeFullToken
{
  return self->_encryptedOneTimeFullToken;
}

- (void)setEncryptedOneTimeFullToken:(id)a3
{
}

- (NSData)sharingKeyBytes
{
  return self->_sharingKeyBytes;
}

- (NSData)sharingKeySeed
{
  return self->_sharingKeySeed;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_sharingKeySeed, 0);
  objc_storeStrong((id *)&self->_sharingKeyBytes, 0);

  objc_storeStrong((id *)&self->_encryptedOneTimeFullToken, 0);
}

@end
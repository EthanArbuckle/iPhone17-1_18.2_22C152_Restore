@interface CKDeviceToDeviceShareInvitationToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKDeviceToDeviceShareInvitationToken)init;
- (CKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3;
- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4;
- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5;
- (NSData)sharingInvitationData;
- (NSString)participantID;
- (NSURL)shareURL;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDeviceToDeviceShareInvitationToken

- (CKDeviceToDeviceShareInvitationToken)init
{
  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, @"You can't call init on %@", v4);

  objc_exception_throw(v6);
}

- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKDeviceToDeviceShareInvitationToken;
  v14 = [(CKDeviceToDeviceShareInvitationToken *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    sharingInvitationData = v14->_sharingInvitationData;
    v14->_sharingInvitationData = (NSData *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    shareURL = v14->_shareURL;
    v14->_shareURL = (NSURL *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_sharingInvitationData(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"ShareInvitationData");

  uint64_t v13 = objc_msgSend_shareURL(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, @"ShareURL");

  uint64_t v18 = objc_msgSend_participantID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, @"ParticipantID");
}

- (CKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend__strictSecureDecodingEnabled(v4, v5, v6, v7) & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v21 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_fault_impl(&dword_18AF10000, v21, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Must use strict secure decoding to decode a CKDeviceToDeviceShareInvitationToken. Any attempt to decode a CKDeviceToDeviceShareInvitationToken without strict secure decoding enabled will return nil. See -[NSKeyedArchiver _enableStrictSecureDecodingMode] or +[NSKeyedArchiver _strictlyUnarchivedObjectOfClasses:].", v26, 2u);
    }
    uint64_t v23 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, @"CKErrorDomain", 12, @"Must use strict secure decoding to decode a CKDeviceToDeviceShareInvitationToken.");
    objc_msgSend_failWithError_(v4, v24, (uint64_t)v23, v25);

    uint64_t v19 = 0;
  }
  else
  {
    id v8 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"ShareInvitationData");
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"ShareURL");
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"ParticipantID");
    self = (CKDeviceToDeviceShareInvitationToken *)(id)objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(self, v18, (uint64_t)v11, (uint64_t)v14, v17);

    uint64_t v19 = self;
  }

  return v19;
}

- (id)CKPropertiesDescription
{
  id v8 = objc_msgSend_shareURL(self, a2, v2, v3);
  if (v8)
  {
    objc_msgSend_stringWithFormat_(NSString, v5, @", shareURL=%@", v7, v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_1ED7F5C98;
  }
  uint64_t v13 = objc_msgSend_participantID(self, v5, v6, v7);
  if (v13)
  {
    v14 = NSString;
    uint64_t v15 = objc_msgSend_participantID(self, v10, v11, v12);
    objc_msgSend_stringWithFormat_(v14, v16, @", participantID=%@", v17, v15);
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v18 = &stru_1ED7F5C98;
  }

  uint64_t v19 = NSString;
  uint64_t v23 = objc_msgSend_sharingInvitationData(self, v20, v21, v22);
  v26 = objc_msgSend_stringWithFormat_(v19, v24, @"sharingInvitationData=%@%@%@", v25, v23, v9, v18);

  return v26;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDeviceToDeviceShareInvitationToken *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKDeviceToDeviceShareInvitationToken *)a3;
  if (v4 == self)
  {
    char v35 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      id v8 = v4;
      uint64_t v12 = objc_msgSend_shareURL(self, v9, v10, v11);
      uint64_t v16 = objc_msgSend_shareURL(v8, v13, v14, v15);
      int v17 = CKObjectsAreBothNilOrEqual(v12, v16);

      if (v17
        && (objc_msgSend_sharingInvitationData(self, v18, v19, v20),
            uint64_t v21 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_sharingInvitationData(v8, v22, v23, v24),
            uint64_t v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = CKObjectsAreBothNilOrEqual(v21, v25),
            v25,
            v21,
            v26))
      {
        v30 = objc_msgSend_participantID(self, v27, v28, v29);
        v34 = objc_msgSend_participantID(v8, v31, v32, v33);
        char v35 = CKObjectsAreBothNilOrEqual(v30, v34);
      }
      else
      {
        char v35 = 0;
      }
    }
    else
    {
      char v35 = 0;
    }
  }

  return v35;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_sharingInvitationData(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_shareURL(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_participantID(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);

  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
}

@end
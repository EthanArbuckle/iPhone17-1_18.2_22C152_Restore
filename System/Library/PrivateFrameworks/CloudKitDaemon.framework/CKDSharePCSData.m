@interface CKDSharePCSData
+ (BOOL)supportsSecureCoding;
+ (CKDSharePCSData)dataWithShare:(id)a3 serviceType:(unint64_t)a4;
+ (CKDSharePCSData)dataWithShareID:(id)a3 pcsData:(id)a4;
- (CKDSharePCSData)initWithCoder:(id)a3;
- (CKDSharePCSData)initWithShareID:(id)a3 pcsData:(id)a4;
- (CKRecordID)shareID;
- (NSData)myParticipantPCSData;
- (NSData)publicPCSData;
- (NSDate)shareModificationDate;
- (NSString)publicPCSEtag;
- (NSString)shareEtag;
- (_OpaquePCSShareProtection)myParticipantPCS;
- (_OpaquePCSShareProtection)preKeyRollInvitedPCS;
- (_OpaquePCSShareProtection)publicPCS;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)myParticipantPermission;
- (int64_t)myParticipantRole;
- (int64_t)publicPermission;
- (unint64_t)serviceType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMyParticipantPCS:(_OpaquePCSShareProtection *)a3;
- (void)setMyParticipantPCSData:(id)a3;
- (void)setMyParticipantPermission:(int64_t)a3;
- (void)setMyParticipantRole:(int64_t)a3;
- (void)setPreKeyRollInvitedPCS:(_OpaquePCSShareProtection *)a3;
- (void)setPublicPCS:(_OpaquePCSShareProtection *)a3;
- (void)setPublicPCSData:(id)a3;
- (void)setPublicPCSEtag:(id)a3;
- (void)setPublicPermission:(int64_t)a3;
- (void)setServiceType:(unint64_t)a3;
- (void)setShareEtag:(id)a3;
- (void)setShareID:(id)a3;
- (void)setShareModificationDate:(id)a3;
@end

@implementation CKDSharePCSData

- (CKDSharePCSData)initWithShareID:(id)a3 pcsData:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDSharePCSData;
  v8 = [(CKDPCSData *)&v11 initWithPCSData:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_shareID, a3);
  }

  return v9;
}

+ (CKDSharePCSData)dataWithShare:(id)a3 serviceType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend_recordID(v5, v7, v8);
  v12 = objc_msgSend_invitedProtectionData(v5, v10, v11);
  v14 = objc_msgSend_initWithShareID_pcsData_(v6, v13, (uint64_t)v9, v12);

  if (v14)
  {
    v17 = objc_msgSend_publicProtectionData(v5, v15, v16);
    objc_msgSend_setPublicPCSData_(v14, v18, (uint64_t)v17);

    v21 = objc_msgSend_invitedProtectionEtag(v5, v19, v20);
    objc_msgSend_setEtag_(v14, v22, (uint64_t)v21);

    objc_msgSend_setServiceType_(v14, v23, a4);
    v26 = objc_msgSend_modificationDate(v5, v24, v25);
    objc_msgSend_setShareModificationDate_(v14, v27, (uint64_t)v26);

    v30 = objc_msgSend_currentUserParticipant(v5, v28, v29);
    uint64_t v33 = objc_msgSend_permission(v30, v31, v32);
    objc_msgSend_setMyParticipantPermission_(v14, v34, v33);
    uint64_t v37 = objc_msgSend_role(v30, v35, v36);
    objc_msgSend_setMyParticipantRole_(v14, v38, v37);
    v41 = objc_msgSend_protectionInfo(v30, v39, v40);
    objc_msgSend_setMyParticipantPCSData_(v14, v42, (uint64_t)v41);

    uint64_t v45 = objc_msgSend_publicPermission(v5, v43, v44);
    objc_msgSend_setPublicPermission_(v14, v46, v45);
    v49 = objc_msgSend_etag(v5, v47, v48);
    objc_msgSend_setShareEtag_(v14, v50, (uint64_t)v49);

    v53 = objc_msgSend_publicProtectionEtag(v5, v51, v52);
    objc_msgSend_setPublicPCSEtag_(v14, v54, (uint64_t)v53);

    v57 = objc_msgSend_publicProtectionData(v5, v55, v56);
    objc_msgSend_setPublicPCSData_(v14, v58, (uint64_t)v57);
  }
  return (CKDSharePCSData *)v14;
}

+ (CKDSharePCSData)dataWithShareID:(id)a3 pcsData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend_initWithShareID_pcsData_(v7, v8, (uint64_t)v6, v5);

  return (CKDSharePCSData *)v9;
}

- (void)dealloc
{
  publicPCS = self->_publicPCS;
  if (publicPCS)
  {
    CFRelease(publicPCS);
    self->_publicPCS = 0;
  }
  myParticipantPCS = self->_myParticipantPCS;
  if (myParticipantPCS)
  {
    CFRelease(myParticipantPCS);
    self->_myParticipantPCS = 0;
  }
  preKeyRollInvitedPCS = self->_preKeyRollInvitedPCS;
  if (preKeyRollInvitedPCS)
  {
    CFRelease(preKeyRollInvitedPCS);
    self->_preKeyRollInvitedPCS = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKDSharePCSData;
  [(CKDPCSData *)&v6 dealloc];
}

- (void)setPublicPCS:(_OpaquePCSShareProtection *)a3
{
  obj = self;
  objc_sync_enter(obj);
  publicPCS = obj->_publicPCS;
  if (publicPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id v5 = obj;
      publicPCS = obj->_publicPCS;
    }
    else
    {
      id v5 = obj;
    }
    v5->_publicPCS = a3;
    if (publicPCS) {
      CFRelease(publicPCS);
    }
  }
  objc_sync_exit(obj);
}

- (void)setMyParticipantPCS:(_OpaquePCSShareProtection *)a3
{
  obj = self;
  objc_sync_enter(obj);
  myParticipantPCS = obj->_myParticipantPCS;
  if (myParticipantPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id v5 = obj;
      myParticipantPCS = obj->_myParticipantPCS;
    }
    else
    {
      id v5 = obj;
    }
    v5->_myParticipantPCS = a3;
    if (myParticipantPCS) {
      CFRelease(myParticipantPCS);
    }
  }
  objc_sync_exit(obj);
}

- (void)setPreKeyRollInvitedPCS:(_OpaquePCSShareProtection *)a3
{
  obj = self;
  objc_sync_enter(obj);
  preKeyRollInvitedPCS = obj->_preKeyRollInvitedPCS;
  if (preKeyRollInvitedPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id v5 = obj;
      preKeyRollInvitedPCS = obj->_preKeyRollInvitedPCS;
    }
    else
    {
      id v5 = obj;
    }
    v5->_preKeyRollInvitedPCS = a3;
    if (preKeyRollInvitedPCS) {
      CFRelease(preKeyRollInvitedPCS);
    }
  }
  objc_sync_exit(obj);
}

- (id)CKPropertiesDescription
{
  v3 = (void *)MEMORY[0x1C8789E70](self, a2);
  v30.receiver = self;
  v30.super_class = (Class)CKDSharePCSData;
  v4 = [(CKDPCSData *)&v30 CKPropertiesDescription];
  id v7 = objc_msgSend_mutableCopy(v4, v5, v6);

  if (objc_msgSend_publicPCS(self, v8, v9))
  {
    uint64_t v12 = objc_msgSend_publicPCS(self, v10, v11);
    objc_msgSend_appendFormat_(v7, v13, @", publicPCS=%@", v12);
  }
  v14 = objc_msgSend_publicPCSData(self, v10, v11);

  if (v14)
  {
    v17 = objc_msgSend_publicPCSData(self, v15, v16);
    objc_msgSend_appendFormat_(v7, v18, @", publicPCSData=%@", v17);
  }
  v19 = objc_msgSend_publicPCSEtag(self, v15, v16);

  if (v19)
  {
    v22 = objc_msgSend_publicPCSEtag(self, v20, v21);
    objc_msgSend_appendFormat_(v7, v23, @", publicPCSEtag=%@", v22);
  }
  v24 = objc_msgSend_shareEtag(self, v20, v21);

  if (v24)
  {
    v27 = objc_msgSend_shareEtag(self, v25, v26);
    objc_msgSend_appendFormat_(v7, v28, @", shareEtag=%@", v27);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1C8789E70]();
  v46.receiver = self;
  v46.super_class = (Class)CKDSharePCSData;
  [(CKDPCSData *)&v46 encodeWithCoder:v4];
  uint64_t v8 = objc_msgSend_shareID(self, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"ShareID");

  uint64_t v12 = objc_msgSend_publicPCSData(self, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"PublicPCSData");

  uint64_t v16 = objc_msgSend_publicPCSEtag(self, v14, v15);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, @"PublicPCSEtag");

  uint64_t v20 = objc_msgSend_myParticipantPCSData(self, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, @"MyParticipantPCS");

  uint64_t v24 = objc_msgSend_myParticipantPermission(self, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, @"MyParticipantPermission");
  uint64_t v28 = objc_msgSend_myParticipantRole(self, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, @"MyParticipantType");
  uint64_t v32 = objc_msgSend_publicPermission(self, v30, v31);
  objc_msgSend_encodeInteger_forKey_(v4, v33, v32, @"PublicPermission");
  uint64_t v36 = objc_msgSend_serviceType(self, v34, v35);
  objc_msgSend_encodeInteger_forKey_(v4, v37, v36, @"ServiceType");
  uint64_t v40 = objc_msgSend_shareEtag(self, v38, v39);
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v40, @"ShareEtag");

  uint64_t v44 = objc_msgSend_shareModificationDate(self, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"shareModificationDate");
}

- (CKDSharePCSData)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKDSharePCSData;
  id v5 = [(CKDPCSData *)&v36 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"ShareID");
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"PublicPCSData");
    publicPCSData = v5->_publicPCSData;
    v5->_publicPCSData = (NSData *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"PublicPCSEtag");
    publicPCSEtag = v5->_publicPCSEtag;
    v5->_publicPCSEtag = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"MyParticipantPCS");
    myParticipantPCSData = v5->_myParticipantPCSData;
    v5->_myParticipantPCSData = (NSData *)v21;

    v5->_myParticipantPermission = objc_msgSend_decodeIntegerForKey_(v4, v23, @"MyParticipantPermission");
    v5->_myParticipantRole = objc_msgSend_decodeIntegerForKey_(v4, v24, @"MyParticipantType");
    v5->_publicPermission = objc_msgSend_decodeIntegerForKey_(v4, v25, @"PublicPermission");
    v5->_serviceType = objc_msgSend_decodeIntegerForKey_(v4, v26, @"ServiceType");
    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"ShareEtag");
    shareEtag = v5->_shareEtag;
    v5->_shareEtag = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"shareModificationDate");
    shareModificationDate = v5->_shareModificationDate;
    v5->_shareModificationDate = (NSDate *)v33;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v78.receiver = self;
  v78.super_class = (Class)CKDSharePCSData;
  id v4 = [(CKDPCSData *)&v78 copyWithZone:a3];
  uint64_t v7 = objc_msgSend_shareID(self, v5, v6);
  v10 = objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setShareID_(v4, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_serviceType(self, v12, v13);
  objc_msgSend_setServiceType_(v4, v15, v14);
  v18 = objc_msgSend_shareEtag(self, v16, v17);
  uint64_t v21 = objc_msgSend_copy(v18, v19, v20);
  objc_msgSend_setShareEtag_(v4, v22, (uint64_t)v21);

  uint64_t v25 = objc_msgSend_publicPermission(self, v23, v24);
  objc_msgSend_setPublicPermission_(v4, v26, v25);
  uint64_t v29 = objc_msgSend_myParticipantRole(self, v27, v28);
  objc_msgSend_setMyParticipantRole_(v4, v30, v29);
  uint64_t v33 = objc_msgSend_myParticipantPermission(self, v31, v32);
  objc_msgSend_setMyParticipantPermission_(v4, v34, v33);
  uint64_t v37 = objc_msgSend_myParticipantPCSData(self, v35, v36);
  uint64_t v40 = objc_msgSend_copy(v37, v38, v39);
  objc_msgSend_setMyParticipantPCSData_(v4, v41, (uint64_t)v40);

  uint64_t v44 = objc_msgSend_publicPCSEtag(self, v42, v43);
  v47 = objc_msgSend_copy(v44, v45, v46);
  objc_msgSend_setPublicPCSEtag_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_publicPCSData(self, v49, v50);
  v54 = objc_msgSend_copy(v51, v52, v53);
  objc_msgSend_setPublicPCSData_(v4, v55, (uint64_t)v54);

  v58 = objc_msgSend_shareModificationDate(self, v56, v57);
  v61 = objc_msgSend_copy(v58, v59, v60);
  objc_msgSend_setShareModificationDate_(v4, v62, (uint64_t)v61);

  if (objc_msgSend_myParticipantPCS(self, v63, v64))
  {
    objc_msgSend_myParticipantPCS(self, v65, v66);
    v67 = (const void *)PCSFPCopyObject();
    objc_msgSend_setMyParticipantPCS_(v4, v68, (uint64_t)v67);
    if (v67) {
      CFRelease(v67);
    }
  }
  if (objc_msgSend_publicPCS(self, v65, v66))
  {
    objc_msgSend_publicPCS(self, v69, v70);
    v71 = (const void *)PCSFPCopyObject();
    objc_msgSend_setPublicPCS_(v4, v72, (uint64_t)v71);
    if (v71) {
      CFRelease(v71);
    }
  }
  if (objc_msgSend_preKeyRollInvitedPCS(self, v69, v70))
  {
    objc_msgSend_preKeyRollInvitedPCS(self, v73, v74);
    v75 = (const void *)PCSFPCopyObject();
    objc_msgSend_setPreKeyRollInvitedPCS_(v4, v76, (uint64_t)v75);
    if (v75) {
      CFRelease(v75);
    }
  }
  return v4;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (NSDate)shareModificationDate
{
  return self->_shareModificationDate;
}

- (void)setShareModificationDate:(id)a3
{
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)shareEtag
{
  return self->_shareEtag;
}

- (void)setShareEtag:(id)a3
{
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (void)setPublicPermission:(int64_t)a3
{
  self->_publicPermission = a3;
}

- (int64_t)myParticipantRole
{
  return self->_myParticipantRole;
}

- (void)setMyParticipantRole:(int64_t)a3
{
  self->_myParticipantRole = a3;
}

- (int64_t)myParticipantPermission
{
  return self->_myParticipantPermission;
}

- (void)setMyParticipantPermission:(int64_t)a3
{
  self->_myParticipantPermission = a3;
}

- (_OpaquePCSShareProtection)myParticipantPCS
{
  return self->_myParticipantPCS;
}

- (NSData)myParticipantPCSData
{
  return self->_myParticipantPCSData;
}

- (void)setMyParticipantPCSData:(id)a3
{
}

- (_OpaquePCSShareProtection)preKeyRollInvitedPCS
{
  return self->_preKeyRollInvitedPCS;
}

- (_OpaquePCSShareProtection)publicPCS
{
  return self->_publicPCS;
}

- (NSString)publicPCSEtag
{
  return self->_publicPCSEtag;
}

- (void)setPublicPCSEtag:(id)a3
{
}

- (NSData)publicPCSData
{
  return self->_publicPCSData;
}

- (void)setPublicPCSData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPCSData, 0);
  objc_storeStrong((id *)&self->_publicPCSEtag, 0);
  objc_storeStrong((id *)&self->_myParticipantPCSData, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_shareModificationDate, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

@end
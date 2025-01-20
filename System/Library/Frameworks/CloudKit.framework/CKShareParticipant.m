@interface CKShareParticipant
+ (BOOL)supportsSecureCoding;
+ (id)oneTimeURLParticipant;
+ (void)initialize;
- (BOOL)acceptedInProcess;
- (BOOL)createdInProcess;
- (BOOL)forceSendPublicKeyForAnonymousParticipants;
- (BOOL)isAnonymousInvitedParticipant;
- (BOOL)isApprovedRequester;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrgAdminUser;
- (BOOL)usesOneTimeURL;
- (BOOL)wantsNewInvitationToken;
- (CKDeviceToDeviceShareInvitationToken)invitationToken;
- (CKRecordID)shareID;
- (CKShareParticipant)initWithCoder:(id)a3;
- (CKShareParticipantAcceptanceStatus)acceptanceStatus;
- (CKShareParticipantPermission)permission;
- (CKShareParticipantRole)role;
- (CKShareParticipantType)type;
- (CKUserIdentity)userIdentity;
- (NSData)encryptedPersonalInfo;
- (NSData)oneTimeURLSharingKeySeed;
- (NSData)protectionInfo;
- (NSData)protectionInfoPublicKey;
- (NSDate)invitationDate;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)inviterID;
- (NSString)participantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)initInternalWithUserIdentity:(id)a3;
- (id)redactedDescription;
- (id)unifiedContactsInStore:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (int64_t)mutableInvitationTokenStatus;
- (int64_t)originalAcceptanceStatus;
- (int64_t)originalParticipantRole;
- (int64_t)originalPermission;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_stripPersonalInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptanceStatus:(int64_t)a3;
- (void)setAcceptedInProcess:(BOOL)a3;
- (void)setCreatedInProcess:(BOOL)a3;
- (void)setEncryptedPersonalInfo:(id)a3;
- (void)setForceSendPublicKeyForAnonymousParticipants:(BOOL)a3;
- (void)setInvitationDate:(id)a3;
- (void)setInvitationToken:(id)a3;
- (void)setInviterID:(id)a3;
- (void)setIsAnonymousInvitedParticipant:(BOOL)a3;
- (void)setIsApprovedRequester:(BOOL)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setIsOrgAdminUser:(BOOL)a3;
- (void)setMutableInvitationTokenStatus:(int64_t)a3;
- (void)setOneTimeURLSharingKeySeed:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPermission:(CKShareParticipantPermission)permission;
- (void)setProtectionInfo:(id)a3;
- (void)setProtectionInfoPublicKey:(id)a3;
- (void)setRole:(CKShareParticipantRole)role;
- (void)setShareID:(id)a3;
- (void)setType:(CKShareParticipantType)type;
- (void)setUserIdentity:(id)a3;
- (void)setUserIdentity_modelMutation:(id)a3;
- (void)setUsesOneTimeURL:(BOOL)a3;
- (void)setWantsNewInvitationToken:(BOOL)a3;
@end

@implementation CKShareParticipant

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

+ (id)oneTimeURLParticipant
{
  v2 = [CKUserIdentity alloc];
  inited = objc_msgSend_initInternal(v2, v3, v4, v5);
  objc_msgSend_setHasiCloudAccount_(inited, v7, 0, v8);
  id v9 = objc_alloc((Class)objc_opt_class());
  v12 = objc_msgSend_initInternalWithUserIdentity_(v9, v10, (uint64_t)inited, v11);
  objc_msgSend_setUsesOneTimeURL_(v12, v13, 1, v14);
  v15 = CKRandomDataWithLength(0x10uLL);
  objc_msgSend_setOneTimeURLSharingKeySeed_(v12, v16, (uint64_t)v15, v17);

  return v12;
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)CKShareParticipant;
  v2 = [(CKShareParticipant *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CKCreateGUID();
    uint64_t v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    *(_OWORD *)(v2 + 40) = xmmword_18B1F3C30;
    *(_OWORD *)(v2 + 88) = xmmword_18B1F3C30;
    *((void *)v2 + 3) = 2;
    *((void *)v2 + 13) = 2;
    *((void *)v2 + 8) = 1;
  }
  return v2;
}

- (id)initInternalWithUserIdentity:(id)a3
{
  id v4 = a3;
  inited = objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = (void *)inited[4];
    inited[4] = v12;
  }
  return inited;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_userIdentity(self, v5, v6, v7);
  uint64_t inited = objc_msgSend_initInternalWithUserIdentity_(v4, v9, (uint64_t)v8, v10);

  v15 = objc_msgSend_participantID(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
  v20 = *(void **)(inited + 56);
  *(void *)(inited + 56) = v19;

  *(unsigned char *)(inited + 9) = objc_msgSend_isCurrentUser(self, v21, v22, v23);
  *(unsigned char *)(inited + 10) = objc_msgSend_isOrgAdminUser(self, v24, v25, v26);
  v30 = objc_msgSend_inviterID(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v35 = *(void **)(inited + 80);
  *(void *)(inited + 80) = v34;

  *(void *)(inited + 40) = objc_msgSend_role(self, v36, v37, v38);
  *(void *)(inited + 48) = objc_msgSend_acceptanceStatus(self, v39, v40, v41);
  *(void *)(inited + 24) = objc_msgSend_permission(self, v42, v43, v44);
  *(void *)(inited + 88) = objc_msgSend_originalParticipantRole(self, v45, v46, v47);
  *(void *)(inited + 96) = objc_msgSend_originalAcceptanceStatus(self, v48, v49, v50);
  *(void *)(inited + 104) = objc_msgSend_originalPermission(self, v51, v52, v53);
  v57 = objc_msgSend_protectionInfo(self, v54, v55, v56);
  uint64_t v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = *(void **)(inited + 112);
  *(void *)(inited + 112) = v61;

  v66 = objc_msgSend_encryptedPersonalInfo(self, v63, v64, v65);
  uint64_t v70 = objc_msgSend_copy(v66, v67, v68, v69);
  v71 = *(void **)(inited + 128);
  *(void *)(inited + 128) = v70;

  v75 = objc_msgSend_invitationToken(self, v72, v73, v74);
  uint64_t v79 = objc_msgSend_copy(v75, v76, v77, v78);
  v80 = *(void **)(inited + 152);
  *(void *)(inited + 152) = v79;

  v84 = objc_msgSend_protectionInfoPublicKey(self, v81, v82, v83);
  uint64_t v88 = objc_msgSend_copy(v84, v85, v86, v87);
  v89 = *(void **)(inited + 120);
  *(void *)(inited + 120) = v88;

  *(unsigned char *)(inited + 8) = objc_msgSend_wantsNewInvitationToken(self, v90, v91, v92);
  *(void *)(inited + 64) = objc_msgSend_mutableInvitationTokenStatus(self, v93, v94, v95);
  *(unsigned char *)(inited + 13) = objc_msgSend_isAnonymousInvitedParticipant(self, v96, v97, v98);
  *(unsigned char *)(inited + 15) = objc_msgSend_isApprovedRequester(self, v99, v100, v101);
  v105 = objc_msgSend_invitationDate(self, v102, v103, v104);
  uint64_t v109 = objc_msgSend_copy(v105, v106, v107, v108);
  v110 = *(void **)(inited + 136);
  *(void *)(inited + 136) = v109;

  v114 = objc_msgSend_oneTimeURLSharingKeySeed(self, v111, v112, v113);
  uint64_t v118 = objc_msgSend_copy(v114, v115, v116, v117);
  v119 = *(void **)(inited + 144);
  *(void *)(inited + 144) = v118;

  *(unsigned char *)(inited + 16) = objc_msgSend_usesOneTimeURL(self, v120, v121, v122);
  uint64_t v126 = objc_msgSend_shareID(self, v123, v124, v125);
  v127 = *(void **)(inited + 72);
  *(void *)(inited + 72) = v126;

  return (id)inited;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKShareParticipant *)a3;
  if (v4 == self)
  {
    char isEquivalentToUserIdentityOrPublicKey = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v9 = objc_msgSend_role(self, v6, v7, v8);
      if (v9 == objc_msgSend_role(v5, v10, v11, v12))
      {
        v16 = objc_msgSend_participantID(self, v13, v14, v15);
        v20 = objc_msgSend_participantID(v5, v17, v18, v19);
        char v21 = CKObjectsAreBothNilOrEqual(v16, v20);

        if (v21)
        {
          char isEquivalentToUserIdentityOrPublicKey = 1;
        }
        else
        {
          uint64_t v26 = objc_msgSend_userIdentity(self, v22, v23, v24);
          uint64_t v32 = objc_msgSend_userIdentity(v5, v27, v28, v29);
          if (v26 == v32) {
            char isEquivalentToUserIdentityOrPublicKey = 1;
          }
          else {
            char isEquivalentToUserIdentityOrPublicKey = objc_msgSend_isEquivalentToUserIdentityOrPublicKey_(v26, v30, (uint64_t)v32, v31);
          }
        }
      }
      else
      {
        char isEquivalentToUserIdentityOrPublicKey = 0;
      }
    }
    else
    {
      char isEquivalentToUserIdentityOrPublicKey = 0;
    }
  }

  return isEquivalentToUserIdentityOrPublicKey;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_participantID(self, a2, v2, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_hash(v5, v6, v7, v8);
    unint64_t v14 = objc_msgSend_role(self, v11, v12, v13) ^ v10;
  }
  else
  {
    uint64_t v15 = objc_msgSend_userIdentity(self, v6, v7, v8);
    uint64_t v19 = objc_msgSend_hash(v15, v16, v17, v18);
    unint64_t v14 = objc_msgSend_role(self, v20, v21, v22) ^ v19;
  }
  return v14;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v79 = a3;
  uint64_t v10 = objc_msgSend_participantID(self, v4, v5, v6);
  if (v10) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v79, v7, @"participantID", (uint64_t)v10, 0);
  }
  uint64_t v11 = objc_msgSend_shareID(self, v7, v8, v9);

  if (v11)
  {
    uint64_t v15 = objc_msgSend_shareID(self, v12, v13, v14);
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v79, v16, @"shareID", (uint64_t)v15, 0);
  }
  if (objc_msgSend_isCurrentUser(self, v12, v13, v14)) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v17, @"isCurrentUser", @"true", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v17, @"isCurrentUser", @"false", 0);
  }
  if (objc_msgSend_isOrgAdminUser(self, v18, v19, v20)) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v21, @"isOrgAdminUser", @"true", 0);
  }
  unint64_t v24 = objc_msgSend_role(self, v21, v22, v23);
  if (v24)
  {
    uint64_t v28 = CKStringFromParticipantRole(v24, v25, v26, v27);
    objc_msgSend_addProperty_value_shouldRedact_(v79, v29, @"role", (uint64_t)v28, 0);
  }
  uint64_t v30 = objc_msgSend_permission(self, v25, v26, v27);
  uint64_t v33 = @"none";
  switch(v30)
  {
    case 0:
      break;
    case 1:
      goto LABEL_17;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v31, @"permission", @"readOnly", 0);
      break;
    case 3:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v31, @"permission", @"readWrite", 0);
      break;
    case 4:
      uint64_t v33 = @"derived";
LABEL_17:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v31, @"permission", (uint64_t)v33, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v31, @"permission", @"unknown", 0);
      break;
  }
  uint64_t v34 = objc_msgSend_acceptanceStatus(self, v31, v32, (uint64_t)v33);
  uint64_t v37 = @"Pending";
  switch(v34)
  {
    case 0:
      break;
    case 1:
      goto LABEL_22;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v35, @"acceptanceStatus", @"Accepted", 0);
      break;
    case 4:
      uint64_t v37 = @"Unsubscribed";
LABEL_22:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v35, @"acceptanceStatus", (uint64_t)v37, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v35, @"acceptanceStatus", @"Removed", 0);
      break;
  }
  uint64_t v41 = objc_msgSend_userIdentity(self, v35, v36, (uint64_t)v37);
  if (v41) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v79, v38, @"identity", (uint64_t)v41, 0);
  }
  v42 = objc_msgSend_protectionInfo(self, v38, v39, v40);
  uint64_t v46 = objc_msgSend_length(v42, v43, v44, v45);

  if (v46) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v47, @"hasProtectionInfo", @"true", 0);
  }
  uint64_t v50 = objc_msgSend_invitationToken(self, v47, v48, v49);

  if (v50) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v51, @"hasInvitationToken", @"true", 0);
  }
  v54 = objc_msgSend_protectionInfoPublicKey(self, v51, v52, v53);
  uint64_t v58 = objc_msgSend_length(v54, v55, v56, v57);

  if (v58) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v59, @"hasProtectionInfoPublicKey", @"true", 0);
  }
  if (objc_msgSend_wantsNewInvitationToken(self, v59, v60, v61)) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v62, @"wantsNewInvitationToken", @"true", 0);
  }
  uint64_t v65 = objc_msgSend_invitationTokenStatus(self, v62, v63, v64);
  uint64_t v68 = @"Healthy";
  switch(v65)
  {
    case 0:
      break;
    case 1:
      goto LABEL_37;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v66, @"invitationTokenStatus", @"Expired", 0);
      break;
    case 3:
      uint64_t v68 = @"NeedsNewToken";
LABEL_37:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v66, @"invitationTokenStatus", (uint64_t)v68, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v79, v66, @"invitationTokenStatus", @"Unknown", 0);
      break;
  }
  if (objc_msgSend_isAnonymousInvitedParticipant(self, v66, v67, (uint64_t)v68)) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v69, @"isAnonymousInvitedParticipant", @"true", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v69, @"isAnonymousInvitedParticipant", @"false", 0);
  }
  if (objc_msgSend_isApprovedRequester(self, v70, v71, v72)) {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v73, @"isApprovedRequester", @"true", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v79, v73, @"isApprovedRequester", @"false", 0);
  }
  uint64_t v78 = objc_msgSend_invitationDate(self, v74, v75, v76);
  if (v78) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v79, v77, @"invitationDate", (uint64_t)v78, 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShareParticipant *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShareParticipant *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (NSString)debugDescription
{
  uint64_t v75 = NSString;
  v79.receiver = self;
  v79.super_class = (Class)CKShareParticipant;
  uint64_t v78 = [(CKShareParticipant *)&v79 description];
  uint64_t v77 = objc_msgSend_participantID(self, v3, v4, v5);
  int isCurrentUser = objc_msgSend_isCurrentUser(self, v6, v7, v8);
  uint64_t v76 = objc_msgSend_inviterID(self, v10, v11, v12);
  unint64_t v16 = objc_msgSend_role(self, v13, v14, v15);
  uint64_t v74 = CKStringFromParticipantRole(v16, v17, v18, v19);
  uint64_t v23 = objc_msgSend_permission(self, v20, v21, v22);
  if ((unint64_t)(v23 - 1) > 3) {
    uint64_t v27 = @"unknown";
  }
  else {
    uint64_t v27 = off_1E5464808[v23 - 1];
  }
  uint64_t v73 = v27;
  unint64_t v28 = objc_msgSend_acceptanceStatus(self, v24, v25, v26);
  if (v28 > 4) {
    uint64_t v32 = @"Removed";
  }
  else {
    uint64_t v32 = off_1E5464828[v28];
  }
  uint64_t v71 = v32;
  uint64_t v72 = objc_msgSend_shareID(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_userIdentity(self, v33, v34, v35);
  uint64_t v40 = objc_msgSend_protectionInfo(self, v37, v38, v39);
  uint64_t v44 = objc_msgSend_length(v40, v41, v42, v43);
  uint64_t v48 = objc_msgSend_invitationToken(self, v45, v46, v47);
  unint64_t v55 = objc_msgSend_invitationTokenStatus(self, v49, v50, v51) - 1;
  if (v55 > 2) {
    uint64_t v56 = @"Unknown";
  }
  else {
    uint64_t v56 = off_1E5464850[v55];
  }
  uint64_t v57 = @"false";
  if (isCurrentUser) {
    uint64_t v58 = @"true";
  }
  else {
    uint64_t v58 = @"false";
  }
  if (objc_msgSend_isAnonymousInvitedParticipant(self, v52, v53, v54)) {
    v62 = @"true";
  }
  else {
    v62 = @"false";
  }
  if (objc_msgSend_isApprovedRequester(self, v59, v60, v61)) {
    uint64_t v57 = @"true";
  }
  v66 = objc_msgSend_invitationDate(self, v63, v64, v65);
  uint64_t v69 = objc_msgSend_stringWithFormat_(v75, v67, @"[%@ participantID=\"%@\", isCurrentUser=\"%@\", inviterID=\"%@\", role=\"%@\", permission=\"%@\", acceptanceStatus=\"%@\", shareID=\"%@\", identity=\"%@\", protectionInfo=(%lu bytes), invitationToken=\"%@\", invitationTokenStatus=\"%@\", isAnonymousInvitedParticipant=\"%@\", isApprovedRequester=\"%@\", invitationDate=\"%@\"]", v68, v78, v77, v58, v76, v74, v73, v71, v72, v36, v44, v48, v56, v62, v57, v66);

  return (NSString *)v69;
}

- (void)_stripPersonalInfo
{
  if (objc_msgSend_createdInProcess(self, a2, v2, v3) && objc_msgSend_role(self, v5, v6, v7) == 1)
  {
    uint64_t v8 = objc_msgSend_userIdentity(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_lookupInfo(v8, v9, v10, v11);
    objc_msgSend__stripPersonalInfo(v12, v13, v14, v15);
  }
  if (objc_msgSend_acceptedInProcess(self, v5, v6, v7))
  {
    id v22 = (id)objc_opt_new();
    uint64_t v19 = objc_msgSend_userIdentity(self, v16, v17, v18);
    objc_msgSend_setNameComponents_(v19, v20, (uint64_t)v22, v21);
  }
}

- (CKShareParticipantType)type
{
  unint64_t v4 = objc_msgSend_role(self, a2, v2, v3);
  if (v4 > 4) {
    return 0;
  }
  else {
    return qword_18B1F3C40[v4];
  }
}

- (void)setType:(CKShareParticipantType)type
{
  if ((unint64_t)(type - 1) > 3) {
    objc_msgSend_setRole_(self, a2, 0, v3);
  }
  else {
    objc_msgSend_setRole_(self, a2, qword_18B1F3C68[type - 1], v3);
  }
}

- (CKShareParticipantPermission)permission
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  CKShareParticipantPermission permission = v2->_permission;
  objc_sync_exit(v2);

  return permission;
}

- (void)setPermission:(CKShareParticipantPermission)permission
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v7 = obj;
  if (obj->_permission != permission)
  {
    if (permission == CKShareParticipantPermissionUnknown)
    {
      uint64_t v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
      uint64_t v11 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"-[CKShareParticipant setPermission:]", v10);
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v8, v12, (uint64_t)v11, @"CKShareParticipant.m", 365, @"Invalid participant permission CKShareParticipantPermissionUnknown");

      uint64_t v7 = obj;
    }
    v7->_CKShareParticipantPermission permission = permission;
  }
  objc_sync_exit(v7);
}

- (id)unifiedContactsInStore:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v106 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_userIdentity(self, v9, v10, v11);
  unint64_t v16 = objc_msgSend_lookupInfo(v12, v13, v14, v15);

  uint64_t v17 = objc_opt_new();
  uint64_t v18 = objc_opt_new();
  id v22 = objc_msgSend_emailAddress(v16, v19, v20, v21);

  if (v22)
  {
    id v27 = sub_18B0F56B8(v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_emailAddress(v16, v28, v29, v30);
    uint64_t v34 = objc_msgSend_predicateForContactsMatchingEmailAddress_(v27, v32, (uint64_t)v31, v33);

    if (v34)
    {
      uint64_t v37 = objc_msgSend_addObject_(v18, v35, (uint64_t)v34, v36);
      uint64_t v121 = 0;
      uint64_t v122 = &v121;
      uint64_t v123 = 0x2020000000;
      uint64_t v41 = (uint64_t *)qword_1EB279CA8;
      uint64_t v124 = qword_1EB279CA8;
      if (!qword_1EB279CA8)
      {
        uint64_t v111 = MEMORY[0x1E4F143A8];
        uint64_t v112 = 3221225472;
        uint64_t v113 = (uint64_t)sub_18B0F6494;
        v114 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E545FF40;
        v115 = (void (*)(uint64_t))&v121;
        uint64_t v42 = sub_18B0F62CC(v37, v38, v39, v40);
        v122[3] = (uint64_t)dlsym(v42, "CNContactEmailAddressesKey");
        qword_1EB279CA8 = *(void *)(*((void *)v115 + 1) + 24);
        uint64_t v41 = (uint64_t *)v122[3];
      }
      _Block_object_dispose(&v121, 8);
      if (!v41)
      {
        uint64_t v94 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v43, v44, v45);
        uint64_t v97 = objc_msgSend_stringWithUTF8String_(NSString, v95, (uint64_t)"NSString *getCNContactEmailAddressesKey(void)", v96);
        uint64_t v98 = dlerror();
        objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v94, v99, (uint64_t)v97, @"CKShareParticipant.m", 28, @"%s", v98);

        goto LABEL_37;
      }
      if (*v41) {
        objc_msgSend_addObject_(v17, v43, *v41, v45);
      }
    }
  }
  uint64_t v46 = objc_msgSend_phoneNumber(v16, v24, v25, v26);

  if (!v46) {
    goto LABEL_21;
  }
  uint64_t v121 = 0;
  uint64_t v122 = &v121;
  uint64_t v123 = 0x2050000000;
  uint64_t v50 = (void *)qword_1EB279CB0;
  uint64_t v124 = qword_1EB279CB0;
  if (!qword_1EB279CB0)
  {
    uint64_t v111 = MEMORY[0x1E4F143A8];
    uint64_t v112 = 3221225472;
    uint64_t v113 = (uint64_t)sub_18B0F64E4;
    v114 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E545FF40;
    v115 = (void (*)(uint64_t))&v121;
    sub_18B0F64E4((uint64_t)&v111, v47, v48, v49);
    uint64_t v50 = (void *)v122[3];
  }
  id v51 = v50;
  _Block_object_dispose(&v121, 8);
  unint64_t v55 = objc_msgSend_phoneNumber(v16, v52, v53, v54);
  uint64_t v58 = objc_msgSend_phoneNumberWithStringValue_(v51, v56, (uint64_t)v55, v57);

  if (v58)
  {
    id v63 = sub_18B0F56B8(v59, v60, v61, v62);
    uint64_t v68 = objc_msgSend_predicateForContactsMatchingPhoneNumber_(v63, v64, (uint64_t)v58, v65);
    if (!v68)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v69 = objc_msgSend_addObject_(v18, v66, (uint64_t)v68, v67);
    uint64_t v121 = 0;
    uint64_t v122 = &v121;
    uint64_t v123 = 0x2020000000;
    uint64_t v73 = (uint64_t *)qword_1EB279CB8;
    uint64_t v124 = qword_1EB279CB8;
    if (!qword_1EB279CB8)
    {
      uint64_t v111 = MEMORY[0x1E4F143A8];
      uint64_t v112 = 3221225472;
      uint64_t v113 = (uint64_t)sub_18B0F65AC;
      v114 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E545FF40;
      v115 = (void (*)(uint64_t))&v121;
      uint64_t v74 = sub_18B0F62CC(v69, v70, v71, v72);
      uint64_t v75 = dlsym(v74, "CNContactPhoneNumbersKey");
      *(void *)(*((void *)v115 + 1) + 24) = v75;
      qword_1EB279CB8 = *(void *)(*((void *)v115 + 1) + 24);
      uint64_t v73 = (uint64_t *)v122[3];
    }
    _Block_object_dispose(&v121, 8);
    if (v73)
    {
      if (*v73) {
        objc_msgSend_addObject_(v17, v76, *v73, v78);
      }
      goto LABEL_19;
    }
    uint64_t v100 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v76, v77, v78);
    uint64_t v103 = objc_msgSend_stringWithUTF8String_(NSString, v101, (uint64_t)"NSString *getCNContactPhoneNumbersKey(void)", v102);
    uint64_t v104 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v100, v105, (uint64_t)v103, @"CKShareParticipant.m", 29, @"%s", v104);

LABEL_37:
    __break(1u);
  }
LABEL_20:

LABEL_21:
  objc_super v79 = objc_msgSend_mutableCopy(v8, v47, v48, v49);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v80 = v17;
  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v117, (uint64_t)v125, 16);
  if (v84)
  {
    uint64_t v85 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v118 != v85) {
          objc_enumerationMutation(v80);
        }
        uint64_t v87 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        if ((objc_msgSend_containsObject_(v79, v82, v87, v83) & 1) == 0) {
          objc_msgSend_addObject_(v79, v82, v87, v83);
        }
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v82, (uint64_t)&v117, (uint64_t)v125, 16);
    }
    while (v84);
  }

  uint64_t v111 = 0;
  uint64_t v112 = (uint64_t)&v111;
  uint64_t v113 = 0x3032000000;
  v114 = sub_18AF13EE4;
  v115 = sub_18AF13928;
  id v116 = 0;
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = sub_18B0F579C;
  v107[3] = &unk_1E54647A8;
  id v88 = v106;
  id v108 = v88;
  id v89 = v79;
  id v109 = v89;
  v110 = &v111;
  uint64_t v92 = objc_msgSend_CKFlatMap_(v18, v90, (uint64_t)v107, v91);
  if (a5) {
    *a5 = *(id *)(v112 + 40);
  }

  _Block_object_dispose(&v111, 8);

  return v92;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v130 = a3;
  unint64_t v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_participantID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v130, v9, (uint64_t)v8, @"ParticipantID");

  uint64_t v13 = objc_msgSend_inviterID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v130, v14, (uint64_t)v13, @"InviterID");

  uint64_t v18 = objc_msgSend_userIdentity(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v130, v19, (uint64_t)v18, @"UserIdentity");

  uint64_t isCurrentUser = objc_msgSend_isCurrentUser(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v130, v24, isCurrentUser, @"IsCurrentUser");
  uint64_t isOrgAdminUser = objc_msgSend_isOrgAdminUser(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v130, v29, isOrgAdminUser, @"IsOrgAdminUser");
  uint64_t v33 = objc_msgSend_role(self, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v130, v34, v33, @"Type");
  uint64_t v38 = objc_msgSend_acceptanceStatus(self, v35, v36, v37);
  objc_msgSend_encodeInt64_forKey_(v130, v39, v38, @"AcceptanceStatus");
  uint64_t v43 = objc_msgSend_permission(self, v40, v41, v42);
  objc_msgSend_encodeInt64_forKey_(v130, v44, v43, @"Permission");
  uint64_t v48 = objc_msgSend_originalParticipantRole(self, v45, v46, v47);
  objc_msgSend_encodeInt64_forKey_(v130, v49, v48, @"OriginalParticipantType");
  uint64_t v53 = objc_msgSend_originalAcceptanceStatus(self, v50, v51, v52);
  objc_msgSend_encodeInt64_forKey_(v130, v54, v53, @"OriginalAcceptanceStatus");
  uint64_t v58 = objc_msgSend_originalPermission(self, v55, v56, v57);
  objc_msgSend_encodeInt64_forKey_(v130, v59, v58, @"OriginalPermission");
  id v63 = objc_msgSend_protectionInfo(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v130, v64, (uint64_t)v63, @"ProtectionInfo");

  uint64_t v68 = objc_msgSend_encryptedPersonalInfo(self, v65, v66, v67);
  objc_msgSend_encodeObject_forKey_(v130, v69, (uint64_t)v68, @"EncryptedPersonalInfo");

  uint64_t v73 = objc_msgSend_createdInProcess(self, v70, v71, v72);
  objc_msgSend_encodeBool_forKey_(v130, v74, v73, @"CreatedInProcess");
  uint64_t v78 = objc_msgSend_acceptedInProcess(self, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v130, v79, v78, @"AcceptedInProcess");
  uint64_t v83 = objc_msgSend_invitationToken(self, v80, v81, v82);
  objc_msgSend_encodeObject_forKey_(v130, v84, (uint64_t)v83, @"InvitationToken");

  id v88 = objc_msgSend_protectionInfoPublicKey(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v130, v89, (uint64_t)v88, @"ProtectionInfoPublicKey");

  uint64_t v93 = objc_msgSend_wantsNewInvitationToken(self, v90, v91, v92);
  objc_msgSend_encodeBool_forKey_(v130, v94, v93, @"wantsNewInvitationToken");
  uint64_t v98 = objc_msgSend_mutableInvitationTokenStatus(self, v95, v96, v97);
  objc_msgSend_encodeInt64_forKey_(v130, v99, v98, @"mutableInvitationTokenStatus");
  uint64_t isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(self, v100, v101, v102);
  objc_msgSend_encodeBool_forKey_(v130, v104, isAnonymousInvitedParticipant, @"isAnonymousInvitedParticipant");
  uint64_t isApprovedRequester = objc_msgSend_isApprovedRequester(self, v105, v106, v107);
  objc_msgSend_encodeBool_forKey_(v130, v109, isApprovedRequester, @"isApprovedRequester");
  uint64_t v113 = objc_msgSend_invitationDate(self, v110, v111, v112);
  objc_msgSend_encodeObject_forKey_(v130, v114, (uint64_t)v113, @"invitationDate");

  uint64_t v118 = objc_msgSend_usesOneTimeURL(self, v115, v116, v117);
  objc_msgSend_encodeBool_forKey_(v130, v119, v118, @"usesOneTimeURL");
  uint64_t v123 = objc_msgSend_oneTimeURLSharingKeySeed(self, v120, v121, v122);
  objc_msgSend_encodeObject_forKey_(v130, v124, (uint64_t)v123, @"oneTimeURLSharingKeySeed");

  v128 = objc_msgSend_shareID(self, v125, v126, v127);
  objc_msgSend_encodeObject_forKey_(v130, v129, (uint64_t)v128, @"ShareID");
}

- (CKShareParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CKShareParticipant;
  uint64_t v5 = [(CKShareParticipant *)&v86 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"ParticipantID");
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"InviterID");
    inviterID = v5->_inviterID;
    v5->_inviterID = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"UserIdentity");
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (CKUserIdentity *)v22;

    v5->_uint64_t isCurrentUser = objc_msgSend_decodeBoolForKey_(v4, v24, @"IsCurrentUser", v25);
    v5->_uint64_t isOrgAdminUser = objc_msgSend_decodeBoolForKey_(v4, v26, @"IsOrgAdminUser", v27);
    v5->_role = objc_msgSend_decodeInt64ForKey_(v4, v28, @"Type", v29);
    v5->_acceptanceStatus = objc_msgSend_decodeInt64ForKey_(v4, v30, @"AcceptanceStatus", v31);
    v5->_CKShareParticipantPermission permission = objc_msgSend_decodeInt64ForKey_(v4, v32, @"Permission", v33);
    v5->_originalParticipantRole = objc_msgSend_decodeInt64ForKey_(v4, v34, @"OriginalParticipantType", v35);
    v5->_originalAcceptanceStatus = objc_msgSend_decodeInt64ForKey_(v4, v36, @"OriginalAcceptanceStatus", v37);
    v5->_originalPermission = objc_msgSend_decodeInt64ForKey_(v4, v38, @"OriginalPermission", v39);
    uint64_t v40 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"ProtectionInfo");
    protectionInfo = v5->_protectionInfo;
    v5->_protectionInfo = (NSData *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"EncryptedPersonalInfo");
    encryptedPersonalInfo = v5->_encryptedPersonalInfo;
    v5->_encryptedPersonalInfo = (NSData *)v46;

    v5->_createdInProcess = objc_msgSend_decodeBoolForKey_(v4, v48, @"CreatedInProcess", v49);
    v5->_acceptedInProcess = objc_msgSend_decodeBoolForKey_(v4, v50, @"AcceptedInProcess", v51);
    uint64_t v52 = objc_opt_class();
    uint64_t v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, @"InvitationToken");
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v54;

    uint64_t v56 = objc_opt_class();
    uint64_t v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, @"ProtectionInfoPublicKey");
    protectionInfoPublicKey = v5->_protectionInfoPublicKey;
    v5->_protectionInfoPublicKey = (NSData *)v58;

    v5->_wantsNewInvitationToken = objc_msgSend_decodeBoolForKey_(v4, v60, @"wantsNewInvitationToken", v61);
    v5->_uint64_t isAnonymousInvitedParticipant = objc_msgSend_decodeBoolForKey_(v4, v62, @"isAnonymousInvitedParticipant", v63);
    v5->_uint64_t isApprovedRequester = objc_msgSend_decodeBoolForKey_(v4, v64, @"isApprovedRequester", v65);
    uint64_t v66 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"invitationDate");
    invitationDate = v5->_invitationDate;
    v5->_invitationDate = (NSDate *)v68;

    v5->_usesOneTimeURL = objc_msgSend_decodeBoolForKey_(v4, v70, @"usesOneTimeURL", v71);
    uint64_t v72 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, @"oneTimeURLSharingKeySeed");
    oneTimeURLSharingKeySeed = v5->_oneTimeURLSharingKeySeed;
    v5->_oneTimeURLSharingKeySeed = (NSData *)v74;

    uint64_t v76 = objc_opt_class();
    uint64_t v78 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"ShareID");
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v78;

    if (objc_msgSend_containsValueForKey_(v4, v80, @"mutableInvitationTokenStatus", v81)) {
      uint64_t v84 = objc_msgSend_decodeInt64ForKey_(v4, v82, @"mutableInvitationTokenStatus", v83);
    }
    else {
      uint64_t v84 = 1;
    }
    v5->_mutableInvitationTokenStatus = v84;
  }

  return v5;
}

- (void)setUserIdentity_modelMutation:(id)a3
{
  uint64_t v5 = (CKUserIdentity *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  userIdentity = self->_userIdentity;
  self->_userIdentity = v5;

  MEMORY[0x1F41817F8](v5, userIdentity);
}

- (CKUserIdentity)userIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentity:(id)a3
{
}

- (CKShareParticipantRole)role
{
  return self->_role;
}

- (void)setRole:(CKShareParticipantRole)role
{
  self->_role = role;
}

- (CKShareParticipantAcceptanceStatus)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  self->_acceptanceStatus = a3;
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParticipantID:(id)a3
{
}

- (BOOL)wantsNewInvitationToken
{
  return self->_wantsNewInvitationToken;
}

- (void)setWantsNewInvitationToken:(BOOL)a3
{
  self->_wantsNewInvitationToken = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_uint64_t isCurrentUser = a3;
}

- (BOOL)isOrgAdminUser
{
  return self->_isOrgAdminUser;
}

- (void)setIsOrgAdminUser:(BOOL)a3
{
  self->_uint64_t isOrgAdminUser = a3;
}

- (int64_t)mutableInvitationTokenStatus
{
  return self->_mutableInvitationTokenStatus;
}

- (void)setMutableInvitationTokenStatus:(int64_t)a3
{
  self->_mutableInvitationTokenStatus = a3;
}

- (CKRecordID)shareID
{
  return (CKRecordID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setShareID:(id)a3
{
}

- (NSString)inviterID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInviterID:(id)a3
{
}

- (int64_t)originalParticipantRole
{
  return self->_originalParticipantRole;
}

- (int64_t)originalAcceptanceStatus
{
  return self->_originalAcceptanceStatus;
}

- (int64_t)originalPermission
{
  return self->_originalPermission;
}

- (BOOL)createdInProcess
{
  return self->_createdInProcess;
}

- (void)setCreatedInProcess:(BOOL)a3
{
  self->_createdInProcess = a3;
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  self->_acceptedInProcess = a3;
}

- (NSData)protectionInfo
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSData)protectionInfoPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setProtectionInfoPublicKey:(id)a3
{
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
}

- (BOOL)isAnonymousInvitedParticipant
{
  return self->_isAnonymousInvitedParticipant;
}

- (void)setIsAnonymousInvitedParticipant:(BOOL)a3
{
  self->_uint64_t isAnonymousInvitedParticipant = a3;
}

- (BOOL)forceSendPublicKeyForAnonymousParticipants
{
  return self->_forceSendPublicKeyForAnonymousParticipants;
}

- (void)setForceSendPublicKeyForAnonymousParticipants:(BOOL)a3
{
  self->_forceSendPublicKeyForAnonymousParticipants = a3;
}

- (BOOL)isApprovedRequester
{
  return self->_isApprovedRequester;
}

- (void)setIsApprovedRequester:(BOOL)a3
{
  self->_uint64_t isApprovedRequester = a3;
}

- (NSDate)invitationDate
{
  return self->_invitationDate;
}

- (void)setInvitationDate:(id)a3
{
}

- (BOOL)usesOneTimeURL
{
  return self->_usesOneTimeURL;
}

- (void)setUsesOneTimeURL:(BOOL)a3
{
  self->_usesOneTimeURL = a3;
}

- (NSData)oneTimeURLSharingKeySeed
{
  return self->_oneTimeURLSharingKeySeed;
}

- (void)setOneTimeURLSharingKeySeed:(id)a3
{
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInvitationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_oneTimeURLSharingKeySeed, 0);
  objc_storeStrong((id *)&self->_invitationDate, 0);
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_protectionInfoPublicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_inviterID, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_participantID, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
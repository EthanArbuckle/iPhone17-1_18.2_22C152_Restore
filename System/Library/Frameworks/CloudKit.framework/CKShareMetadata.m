@interface CKShareMetadata
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)acceptedInProcess;
- (BOOL)isCallingParticipantUsingOTL;
- (BOOL)isEqual:(id)a3;
- (CKContainerID)containerID;
- (CKDeviceToDeviceShareInvitationToken)invitationToken;
- (CKRecord)rootRecord;
- (CKRecordID)hierarchicalRootRecordID;
- (CKRecordZone)sharedZone;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKShare)share;
- (CKShareMetadata)init;
- (CKShareMetadata)initWithCoder:(id)a3;
- (CKShareMetadata)initWithShare:(id)a3 containerID:(id)a4;
- (CKShareParticipant)callingParticipant;
- (CKShareParticipantAcceptanceStatus)participantStatus;
- (CKShareParticipantPermission)participantPermission;
- (CKShareParticipantRole)participantRole;
- (CKShareParticipantType)participantType;
- (CKUserIdentity)ownerIdentity;
- (NSArray)outOfNetworkMatches;
- (NSArray)sharedItemHierarchyIDs;
- (NSData)encryptedData;
- (NSData)privateToken;
- (NSData)protectedFullToken;
- (NSData)publicToken;
- (NSString)baseToken;
- (NSString)containerIdentifier;
- (NSString)rootRecordType;
- (NSString)selectedAccountID;
- (NSURL)invitationURL;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)ckShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initInternal;
- (int64_t)environment;
- (unint64_t)hash;
- (void)CKAssignToContainerWithID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fillAnonymousCKUserID:(id)a3;
- (void)setAcceptedInProcess:(BOOL)a3;
- (void)setCallingParticipant:(id)a3;
- (void)setContainerID_modelMutation:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setHierarchicalRootRecordID:(id)a3;
- (void)setInvitationToken:(id)a3;
- (void)setOutOfNetworkMatches:(id)a3;
- (void)setOwnerIdentity:(id)a3;
- (void)setParticipantPermission:(int64_t)a3;
- (void)setParticipantRole:(int64_t)a3;
- (void)setParticipantStatus:(int64_t)a3;
- (void)setPrivateToken:(id)a3;
- (void)setProtectedFullToken:(id)a3;
- (void)setPublicToken:(id)a3;
- (void)setRootRecord:(id)a3;
- (void)setRootRecordType:(id)a3;
- (void)setSelectedAccountID:(id)a3;
- (void)setShare:(id)a3;
- (void)setSharedItemHierarchyIDs:(id)a3;
- (void)setSharedZone:(id)a3;
@end

@implementation CKShareMetadata

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKShareMetadata)init
{
  v2 = [CKException alloc];
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"Do not instantiate CKShare.Metadata, obtain them from CKFetchShareMetadataOperation or platform-specific scene / app delegate callbacks.");
  objc_exception_throw(v4);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKShareMetadata;
  id result = [(CKShareMetadata *)&v3 init];
  if (result)
  {
    *((void *)result + 4) = 0;
    *((void *)result + 5) = 0;
    *((void *)result + 6) = 0;
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (CKShareMetadata)initWithShare:(id)a3 containerID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t inited = objc_msgSend_initInternal(self, v9, v10, v11);
  v13 = (CKShareMetadata *)inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 16), a3);
    uint64_t v17 = objc_msgSend_copy(v8, v14, v15, v16);
    containerID = v13->_containerID;
    v13->_containerID = (CKContainerID *)v17;
  }
  return v13;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  objc_super v3 = objc_opt_new();
  id v4 = NSNumber;
  uint64_t v8 = objc_msgSend_participantRole(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"participantRole");

  v13 = NSNumber;
  uint64_t v17 = objc_msgSend_participantStatus(self, v14, v15, v16);
  v20 = objc_msgSend_numberWithInteger_(v13, v18, v17, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, @"participantStatus");

  v22 = NSNumber;
  uint64_t v26 = objc_msgSend_participantPermission(self, v23, v24, v25);
  v29 = objc_msgSend_numberWithInteger_(v22, v27, v26, v28);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, @"participantPermission");

  v34 = objc_msgSend_share(self, v31, v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, @"share");

  v39 = objc_msgSend_rootRecord(self, v36, v37, v38);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v40, (uint64_t)v39, @"rootRecord");

  v44 = objc_msgSend_sharedZone(self, v41, v42, v43);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, @"sharedZone");

  v49 = objc_msgSend_properties(v3, v46, v47, v48);

  return (CKRoughlyEquivalentProperties *)v49;
}

- (NSString)baseToken
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_publicToken(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    v9 = objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);
    __int16 v13 = objc_msgSend_length(v9, v10, v11, v12);
    v26[0] = 3;
    v26[1] = HIBYTE(v13);
    v26[2] = v13;
    uint64_t v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v14, (uint64_t)v26, 3);
    uint64_t v19 = objc_msgSend_CKBase64URLSafeString(v15, v16, v17, v18);
    v27[0] = v19;
    v27[1] = v9;
    v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v27, 2);
    uint64_t v24 = objc_msgSend_componentsJoinedByString_(v21, v22, (uint64_t)&stru_1ED7F5C98, v23);
  }
  else
  {
    uint64_t v24 = 0;
  }

  return (NSString *)v24;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v11 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 5, a4);
  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v12 = objc_msgSend_share(self, v8, v9, v10);
  uint64_t v16 = objc_msgSend_recordID(v12, v13, v14, v15);
  uint64_t v18 = v16;
  if (a5)
  {
    uint64_t v19 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v16, v17, 1, 1, 1);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v20, @"shareID", (uint64_t)v19);
  }
  else
  {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v17, @"shareID", (uint64_t)v16);
  }

  uint64_t v24 = objc_msgSend_uncachedURL(v12, v21, v22, v23);
  uint64_t v28 = objc_msgSend_absoluteString(v24, v25, v26, v27);
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v29, @"shareURL", (uint64_t)v28);

  uint64_t v33 = objc_msgSend_rootRecord(self, v30, v31, v32);
  uint64_t v37 = v33;
  if (v33)
  {
    if (a5)
    {
      uint64_t v38 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v33, v34, 1, 1, 1);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v39, @"rootRecord", (uint64_t)v38);
    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v34, @"rootRecord", (uint64_t)v33);
    }
  }
  v40 = objc_msgSend_hierarchicalRootRecordID(self, v34, v35, v36);
  v44 = v40;
  if (!v40)
  {
    if (a5) {
      goto LABEL_13;
    }
LABEL_15:
    v57 = objc_msgSend_containerID(self, v41, v42, v43);
    v62 = objc_msgSend_ckShortDescription(v57, v59, v60, v61);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v63, @"containerID", (uint64_t)v62);

    goto LABEL_16;
  }
  if (!a5)
  {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v41, @"rootRecordID", (uint64_t)v40);
    goto LABEL_15;
  }
  v45 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v40, v41, 1, 1, 1);
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v46, @"rootRecordID", (uint64_t)v45);

LABEL_13:
  uint64_t v47 = objc_msgSend_containerID(self, v41, v42, v43);
  v49 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v47, v48, 1, 1, 1);
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v50, @"containerID", (uint64_t)v49);

  v54 = objc_msgSend_participants(v12, v51, v52, v53);
  v57 = objc_msgSend_CKMap_(v54, v55, (uint64_t)&unk_1ED7EF5F8, v56);

  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v58, @"participants", (uint64_t)v57);
LABEL_16:

  unint64_t v70 = objc_msgSend_participantRole(self, v64, v65, v66) - 1;
  if (v70 <= 3) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, @"participantRole", (uint64_t)off_1E5465490[v70]);
  }
  unint64_t v74 = objc_msgSend_participantStatus(self, v67, v68, v69) - 1;
  if (v74 <= 3) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v71, @"participantStatus", (uint64_t)off_1E54654B0[v74]);
  }
  unint64_t v78 = objc_msgSend_participantPermission(self, v71, v72, v73) - 1;
  if (v78 <= 3) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v75, @"participantPermission", (uint64_t)off_1E54654D0[v78]);
  }
  if (a5)
  {
    v79 = objc_msgSend_requesters(v12, v75, v76, v77);
    v82 = objc_msgSend_CKMap_(v79, v80, (uint64_t)&unk_1ED7EC168, v81);

    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v83, @"requesters", (uint64_t)v82);
    v87 = objc_msgSend_ownerIdentity(self, v84, v85, v86);
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v87, v88, 1, 1, 1);
  }
  else
  {
    v87 = objc_msgSend_ownerIdentity(self, v75, v76, v77);
    objc_msgSend_description(v87, v89, v90, v91);
  v92 = };
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v93, @"Owner", (uint64_t)v92);

LABEL_26:

  return v11;
}

- (id)description
{
  return (id)((uint64_t (*)(CKShareMetadata *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  v5 = NSString;
  BOOL v6 = objc_msgSend_share(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_recordID(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_hierarchicalRootRecordID(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_containerID(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_ckShortDescription(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_ownerIdentity(self, v23, v24, v25);
  v29 = objc_msgSend_stringWithFormat_(v5, v27, @"ShareID %@, rootRecordID %@, container %@, Owner %@", v28, v10, v14, v22, v26);

  return v29;
}

- (void)CKAssignToContainerWithID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);

  if (v8)
  {
    uint64_t v12 = objc_msgSend_share(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_containerID(self, v13, v14, v15);
    objc_msgSend_CKAssignToContainerWithID_(v12, v17, (uint64_t)v16, v18);

    uint64_t v22 = objc_msgSend_rootRecord(self, v19, v20, v21);
    uint64_t v26 = objc_msgSend_containerID(self, v23, v24, v25);
    objc_msgSend_CKAssignToContainerWithID_(v22, v27, (uint64_t)v26, v28);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138412290;
      id v31 = v4;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "No container identifier set on CKShareMetadata being assigned to %@", (uint8_t *)&v30, 0xCu);
    }
  }
}

- (CKShareParticipantType)participantType
{
  uint64_t v4 = objc_msgSend_participantRole(self, a2, v2, v3);
  if ((unint64_t)(v4 - 1) > 3) {
    return 0;
  }
  else {
    return qword_18B1F3D18[v4 - 1];
  }
}

- (NSString)containerIdentifier
{
  uint64_t v4 = objc_msgSend_containerID(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (int64_t)environment
{
  uint64_t v4 = objc_msgSend_containerID(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4) {
    int64_t v9 = objc_msgSend_environment(v4, v5, v6, v7);
  }
  else {
    int64_t v9 = 1;
  }

  return v9;
}

- (void)fillAnonymousCKUserID:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_share(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_share(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_recordID(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_copyWithAnonymousCKUserID_(v16, v17, (uint64_t)v4, v18);
  objc_msgSend_replaceRecordIDWith_(v8, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_sharedZone(self, v22, v23, v24);
  v29 = objc_msgSend_sharedZone(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_zoneID(v29, v30, v31, v32);
  uint64_t v36 = objc_msgSend_copyWithAnonymousCKUserID_(v33, v34, (uint64_t)v4, v35);
  objc_msgSend_replaceZoneIDWith_(v25, v37, (uint64_t)v36, v38);

  uint64_t v42 = objc_msgSend_hierarchicalRootRecordID(self, v39, v40, v41);
  v45 = objc_msgSend_copyWithAnonymousCKUserID_(v42, v43, (uint64_t)v4, v44);
  objc_msgSend_setHierarchicalRootRecordID_(self, v46, (uint64_t)v45, v47);

  v51 = objc_msgSend_rootRecord(self, v48, v49, v50);
  v55 = objc_msgSend_rootRecord(self, v52, v53, v54);
  v59 = objc_msgSend_recordID(v55, v56, v57, v58);
  v62 = objc_msgSend_copyWithAnonymousCKUserID_(v59, v60, (uint64_t)v4, v61);
  objc_msgSend_replaceRecordIDWith_(v51, v63, (uint64_t)v62, v64);

  uint64_t v65 = objc_opt_new();
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v69 = objc_msgSend_sharedItemHierarchyIDs(self, v66, v67, v68, 0);
  uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v82, (uint64_t)v86, 16);
  if (v71)
  {
    uint64_t v74 = v71;
    uint64_t v75 = *(void *)v83;
    do
    {
      uint64_t v76 = 0;
      do
      {
        if (*(void *)v83 != v75) {
          objc_enumerationMutation(v69);
        }
        uint64_t v77 = objc_msgSend_copyWithAnonymousCKUserID_(*(void **)(*((void *)&v82 + 1) + 8 * v76), v72, (uint64_t)v4, v73);
        objc_msgSend_addObject_(v65, v78, (uint64_t)v77, v79);

        ++v76;
      }
      while (v74 != v76);
      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v82, (uint64_t)v86, 16);
    }
    while (v74);
  }

  objc_msgSend_setSharedItemHierarchyIDs_(self, v80, (uint64_t)v65, v81);
}

- (BOOL)isCallingParticipantUsingOTL
{
  uint64_t v8 = objc_msgSend_callingParticipant(self, a2, v2, v3);
  if (v8)
  {
    int64_t v9 = objc_msgSend_share(self, v5, v6, v7);
    uint64_t v13 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_allKeys(v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_callingParticipant(self, v18, v19, v20);
    uint64_t v25 = objc_msgSend_participantID(v21, v22, v23, v24);
    char v28 = objc_msgSend_containsObject_(v17, v26, (uint64_t)v25, v27);
  }
  else
  {
    char v28 = 0;
  }

  return v28;
}

- (NSURL)invitationURL
{
  int isCallingParticipantUsingOTL = objc_msgSend_isCallingParticipantUsingOTL(self, a2, v2, v3);
  int64_t v9 = objc_msgSend_share(self, v6, v7, v8);
  uint64_t v13 = v9;
  if (isCallingParticipantUsingOTL)
  {
    uint64_t v14 = objc_msgSend_callingParticipant(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_participantID(v14, v15, v16, v17);
    uint64_t v21 = objc_msgSend_oneTimeURLForParticipantID_(v13, v19, (uint64_t)v18, v20);
  }
  else
  {
    uint64_t v21 = objc_msgSend_URL(v9, v10, v11, v12);
  }

  return (NSURL *)v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t inited = objc_msgSend_initInternal(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_containerID(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);
  uint64_t v17 = (void *)inited[9];
  inited[9] = v16;

  uint64_t v21 = objc_msgSend_share(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_copy(v21, v22, v23, v24);
  uint64_t v26 = (void *)inited[2];
  inited[2] = v25;

  int v30 = objc_msgSend_rootRecord(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
  uint64_t v35 = (void *)inited[8];
  inited[8] = v34;

  v39 = objc_msgSend_hierarchicalRootRecordID(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_copy(v39, v40, v41, v42);
  uint64_t v44 = (void *)inited[3];
  inited[3] = v43;

  uint64_t v48 = objc_msgSend_rootRecordType(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_copy(v48, v49, v50, v51);
  uint64_t v53 = (void *)inited[12];
  inited[12] = v52;

  uint64_t v57 = objc_msgSend_sharedItemHierarchyIDs(self, v54, v55, v56);
  uint64_t v61 = objc_msgSend_CKDeepCopy(v57, v58, v59, v60);
  v62 = (void *)inited[11];
  inited[11] = v61;

  uint64_t v66 = objc_msgSend_callingParticipant(self, v63, v64, v65);
  uint64_t v70 = objc_msgSend_copy(v66, v67, v68, v69);
  uint64_t v71 = (void *)inited[10];
  inited[10] = v70;

  inited[4] = objc_msgSend_participantRole(self, v72, v73, v74);
  inited[5] = objc_msgSend_participantStatus(self, v75, v76, v77);
  inited[6] = objc_msgSend_participantPermission(self, v78, v79, v80);
  long long v84 = objc_msgSend_ownerIdentity(self, v81, v82, v83);
  uint64_t v88 = objc_msgSend_copy(v84, v85, v86, v87);
  v89 = (void *)inited[7];
  inited[7] = v88;

  v93 = objc_msgSend_protectedFullToken(self, v90, v91, v92);
  uint64_t v97 = objc_msgSend_copy(v93, v94, v95, v96);
  v98 = (void *)inited[15];
  inited[15] = v97;

  v102 = objc_msgSend_publicToken(self, v99, v100, v101);
  uint64_t v106 = objc_msgSend_copy(v102, v103, v104, v105);
  v107 = (void *)inited[16];
  inited[16] = v106;

  v111 = objc_msgSend_privateToken(self, v108, v109, v110);
  uint64_t v115 = objc_msgSend_copy(v111, v112, v113, v114);
  v116 = (void *)inited[17];
  inited[17] = v115;

  v120 = objc_msgSend_outOfNetworkMatches(self, v117, v118, v119);
  uint64_t v124 = objc_msgSend_copy(v120, v121, v122, v123);
  v125 = (void *)inited[19];
  inited[19] = v124;

  v129 = objc_msgSend_encryptedData(self, v126, v127, v128);
  uint64_t v133 = objc_msgSend_copy(v129, v130, v131, v132);
  v134 = (void *)inited[20];
  inited[20] = v133;

  v138 = objc_msgSend_invitationToken(self, v135, v136, v137);
  uint64_t v142 = objc_msgSend_copy(v138, v139, v140, v141);
  v143 = (void *)inited[13];
  inited[13] = v142;

  v147 = objc_msgSend_sharedZone(self, v144, v145, v146);
  uint64_t v151 = objc_msgSend_copy(v147, v148, v149, v150);
  v152 = (void *)inited[18];
  inited[18] = v151;

  v156 = objc_msgSend_selectedAccountID(self, v153, v154, v155);
  uint64_t v160 = objc_msgSend_copy(v156, v157, v158, v159);
  v161 = (void *)inited[14];
  inited[14] = v160;

  return inited;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v95 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v95, v9, (uint64_t)v8, @"ContainerID");

  uint64_t v13 = objc_msgSend_share(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v95, v14, (uint64_t)v13, @"Share");

  uint64_t v18 = objc_msgSend_rootRecord(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v95, v19, (uint64_t)v18, @"RootRecord");

  uint64_t v23 = objc_msgSend_hierarchicalRootRecordID(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v95, v24, (uint64_t)v23, @"RootRecordID");

  uint64_t v28 = objc_msgSend_rootRecordType(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v95, v29, (uint64_t)v28, @"RootRecordType");

  uint64_t v33 = objc_msgSend_sharedItemHierarchyIDs(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v95, v34, (uint64_t)v33, @"SharedItemHierarchyIDs");

  uint64_t v38 = objc_msgSend_callingParticipant(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v95, v39, (uint64_t)v38, @"CallingParticipant");

  uint64_t v43 = objc_msgSend_participantRole(self, v40, v41, v42);
  objc_msgSend_encodeInteger_forKey_(v95, v44, v43, @"ParticipantType");
  uint64_t v48 = objc_msgSend_participantStatus(self, v45, v46, v47);
  objc_msgSend_encodeInteger_forKey_(v95, v49, v48, @"ParticipantStatus");
  uint64_t v53 = objc_msgSend_participantPermission(self, v50, v51, v52);
  objc_msgSend_encodeInteger_forKey_(v95, v54, v53, @"ParticipantPermission");
  uint64_t v58 = objc_msgSend_ownerIdentity(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v95, v59, (uint64_t)v58, @"OwnerIdentity");

  v63 = objc_msgSend_protectedFullToken(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v95, v64, (uint64_t)v63, @"ProtectedFullToken");

  uint64_t v68 = objc_msgSend_publicToken(self, v65, v66, v67);
  objc_msgSend_encodeObject_forKey_(v95, v69, (uint64_t)v68, @"PublicToken");

  uint64_t v73 = objc_msgSend_privateToken(self, v70, v71, v72);
  objc_msgSend_encodeObject_forKey_(v95, v74, (uint64_t)v73, @"PrivateToken");

  unint64_t v78 = objc_msgSend_outOfNetworkMatches(self, v75, v76, v77);
  objc_msgSend_encodeObject_forKey_(v95, v79, (uint64_t)v78, @"OutOfNetworkMatches");

  uint64_t v83 = objc_msgSend_encryptedData(self, v80, v81, v82);
  objc_msgSend_encodeObject_forKey_(v95, v84, (uint64_t)v83, @"EncryptedData");

  uint64_t v88 = objc_msgSend_invitationToken(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v95, v89, (uint64_t)v88, @"InvitationToken");

  v93 = objc_msgSend_selectedAccountID(self, v90, v91, v92);
  objc_msgSend_encodeObject_forKey_(v95, v94, (uint64_t)v93, @"SelectedAccountID");
}

- (CKShareMetadata)initWithCoder:(id)a3
{
  v86[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)CKShareMetadata;
  v5 = [(CKShareMetadata *)&v85 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"ContainerID");
    containerID = v5->_containerID;
    v5->_containerID = (CKContainerID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"Share");
    share = v5->_share;
    v5->_share = (CKShare *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"RootRecord");
    rootRecord = v5->_rootRecord;
    v5->_rootRecord = (CKRecord *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"RootRecordID");
    hierarchicalRootRecordID = v5->_hierarchicalRootRecordID;
    v5->_hierarchicalRootRecordID = (CKRecordID *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"RootRecordType");
    rootRecordType = v5->_rootRecordType;
    v5->_rootRecordType = (NSString *)v25;

    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v33 = objc_msgSend_setWithObjects_(v27, v31, v28, v32, v29, v30, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, @"SharedItemHierarchyIDs");
    sharedItemHierarchyIDs = v5->_sharedItemHierarchyIDs;
    v5->_sharedItemHierarchyIDs = (NSArray *)v35;

    uint64_t v37 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"CallingParticipant");
    callingParticipant = v5->_callingParticipant;
    v5->_callingParticipant = (CKShareParticipant *)v39;

    v5->_participantRole = objc_msgSend_decodeIntegerForKey_(v4, v41, @"ParticipantType", v42);
    v5->_participantStatus = objc_msgSend_decodeIntegerForKey_(v4, v43, @"ParticipantStatus", v44);
    v5->_participantPermission = objc_msgSend_decodeIntegerForKey_(v4, v45, @"ParticipantPermission", v46);
    uint64_t v47 = objc_opt_class();
    uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, @"OwnerIdentity");
    ownerIdentity = v5->_ownerIdentity;
    v5->_ownerIdentity = (CKUserIdentity *)v49;

    uint64_t v51 = objc_opt_class();
    uint64_t v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"ProtectedFullToken");
    protectedFullToken = v5->_protectedFullToken;
    v5->_protectedFullToken = (NSData *)v53;

    uint64_t v55 = objc_opt_class();
    uint64_t v57 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v56, v55, @"PublicToken");
    publicToken = v5->_publicToken;
    v5->_publicToken = (NSData *)v57;

    uint64_t v59 = objc_opt_class();
    uint64_t v61 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, @"PrivateToken");
    privateToken = v5->_privateToken;
    v5->_privateToken = (NSData *)v61;

    v63 = (void *)MEMORY[0x1E4F1CAD0];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    v86[2] = objc_opt_class();
    uint64_t v65 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v64, (uint64_t)v86, 3);
    uint64_t v68 = objc_msgSend_setWithArray_(v63, v66, (uint64_t)v65, v67);
    uint64_t v70 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v69, (uint64_t)v68, @"OutOfNetworkMatches");
    outOfNetworkMatches = v5->_outOfNetworkMatches;
    v5->_outOfNetworkMatches = (NSArray *)v70;

    uint64_t v72 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, @"EncryptedData");
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v74;

    v5->_acceptedInProcess = 1;
    uint64_t v76 = objc_opt_class();
    uint64_t v78 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"InvitationToken");
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v78;

    uint64_t v80 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"SelectedAccountID");
    selectedAccountID = v5->_selectedAccountID;
    v5->_selectedAccountID = (NSString *)v82;
  }

  return v5;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_share(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_containerID(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_ownerIdentity(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKShareMetadata *)a3;
  if (self == v4)
  {
    char v152 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_containerID(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_containerID(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14) {
        goto LABEL_22;
      }
      uint64_t v18 = objc_msgSend_share(self, v15, v16, v17);
      uint64_t v22 = objc_msgSend_share(v5, v19, v20, v21);
      int v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23) {
        goto LABEL_22;
      }
      uint64_t v27 = objc_msgSend_rootRecord(self, v24, v25, v26);
      uint64_t v31 = objc_msgSend_rootRecord(v5, v28, v29, v30);
      int v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32) {
        goto LABEL_22;
      }
      uint64_t v36 = objc_msgSend_hierarchicalRootRecordID(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_hierarchicalRootRecordID(v5, v37, v38, v39);
      int v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41) {
        goto LABEL_22;
      }
      v45 = objc_msgSend_rootRecordType(self, v42, v43, v44);
      uint64_t v49 = objc_msgSend_rootRecordType(v5, v46, v47, v48);
      int v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50) {
        goto LABEL_22;
      }
      uint64_t v54 = objc_msgSend_callingParticipant(self, v51, v52, v53);
      uint64_t v58 = objc_msgSend_callingParticipant(v5, v55, v56, v57);
      int v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59) {
        goto LABEL_22;
      }
      uint64_t v63 = objc_msgSend_participantRole(self, v60, v61, v62);
      if (v63 != objc_msgSend_participantRole(v5, v64, v65, v66)) {
        goto LABEL_22;
      }
      uint64_t v70 = objc_msgSend_participantStatus(self, v67, v68, v69);
      if (v70 != objc_msgSend_participantStatus(v5, v71, v72, v73)) {
        goto LABEL_22;
      }
      uint64_t v77 = objc_msgSend_participantPermission(self, v74, v75, v76);
      if (v77 != objc_msgSend_participantPermission(v5, v78, v79, v80)) {
        goto LABEL_22;
      }
      long long v84 = objc_msgSend_ownerIdentity(self, v81, v82, v83);
      uint64_t v88 = objc_msgSend_ownerIdentity(v5, v85, v86, v87);
      int v89 = CKObjectsAreBothNilOrEqual(v84, v88);

      if (!v89) {
        goto LABEL_22;
      }
      v93 = objc_msgSend_protectedFullToken(self, v90, v91, v92);
      uint64_t v97 = objc_msgSend_protectedFullToken(v5, v94, v95, v96);
      int v98 = CKObjectsAreBothNilOrEqual(v93, v97);

      if (!v98) {
        goto LABEL_22;
      }
      v102 = objc_msgSend_publicToken(self, v99, v100, v101);
      uint64_t v106 = objc_msgSend_publicToken(v5, v103, v104, v105);
      int v107 = CKObjectsAreBothNilOrEqual(v102, v106);

      if (!v107) {
        goto LABEL_22;
      }
      v111 = objc_msgSend_privateToken(self, v108, v109, v110);
      uint64_t v115 = objc_msgSend_privateToken(v5, v112, v113, v114);
      int v116 = CKObjectsAreBothNilOrEqual(v111, v115);

      if (!v116) {
        goto LABEL_22;
      }
      v120 = objc_msgSend_outOfNetworkMatches(self, v117, v118, v119);
      uint64_t v124 = objc_msgSend_outOfNetworkMatches(v5, v121, v122, v123);
      int v125 = CKObjectsAreBothNilOrEqual(v120, v124);

      if (!v125) {
        goto LABEL_22;
      }
      v129 = objc_msgSend_encryptedData(self, v126, v127, v128);
      uint64_t v133 = objc_msgSend_encryptedData(v5, v130, v131, v132);
      int v134 = CKObjectsAreBothNilOrEqual(v129, v133);

      if (!v134) {
        goto LABEL_22;
      }
      v138 = objc_msgSend_invitationToken(self, v135, v136, v137);
      uint64_t v142 = objc_msgSend_invitationToken(v5, v139, v140, v141);
      int v143 = CKObjectsAreBothNilOrEqual(v138, v142);

      if (v143)
      {
        v147 = objc_msgSend_selectedAccountID(self, v144, v145, v146);
        uint64_t v151 = objc_msgSend_selectedAccountID(v5, v148, v149, v150);
        char v152 = CKObjectsAreBothNilOrEqual(v147, v151);
      }
      else
      {
LABEL_22:
        char v152 = 0;
      }
    }
    else
    {
      char v152 = 0;
    }
  }

  return v152;
}

- (void)setContainerID_modelMutation:(id)a3
{
  v5 = (CKContainerID *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  containerID = self->_containerID;
  self->_containerID = v5;

  MEMORY[0x1F41817F8](v5, containerID);
}

- (CKShare)share
{
  return (CKShare *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShare:(id)a3
{
}

- (CKRecordID)hierarchicalRootRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHierarchicalRootRecordID:(id)a3
{
}

- (CKShareParticipantRole)participantRole
{
  return self->_participantRole;
}

- (void)setParticipantRole:(int64_t)a3
{
  self->_participantRole = a3;
}

- (CKShareParticipantAcceptanceStatus)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_participantStatus = a3;
}

- (CKShareParticipantPermission)participantPermission
{
  return self->_participantPermission;
}

- (void)setParticipantPermission:(int64_t)a3
{
  self->_participantPermission = a3;
}

- (CKUserIdentity)ownerIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOwnerIdentity:(id)a3
{
}

- (CKRecord)rootRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootRecord:(id)a3
{
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 72, 1);
}

- (CKShareParticipant)callingParticipant
{
  return self->_callingParticipant;
}

- (void)setCallingParticipant:(id)a3
{
}

- (NSArray)sharedItemHierarchyIDs
{
  return self->_sharedItemHierarchyIDs;
}

- (void)setSharedItemHierarchyIDs:(id)a3
{
}

- (NSString)rootRecordType
{
  return self->_rootRecordType;
}

- (void)setRootRecordType:(id)a3
{
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInvitationToken:(id)a3
{
}

- (NSString)selectedAccountID
{
  return self->_selectedAccountID;
}

- (void)setSelectedAccountID:(id)a3
{
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
}

- (NSData)publicToken
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPublicToken:(id)a3
{
}

- (NSData)privateToken
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPrivateToken:(id)a3
{
}

- (CKRecordZone)sharedZone
{
  return self->_sharedZone;
}

- (void)setSharedZone:(id)a3
{
}

- (NSArray)outOfNetworkMatches
{
  return self->_outOfNetworkMatches;
}

- (void)setOutOfNetworkMatches:(id)a3
{
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  self->_acceptedInProcess = a3;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_outOfNetworkMatches, 0);
  objc_storeStrong((id *)&self->_sharedZone, 0);
  objc_storeStrong((id *)&self->_privateToken, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_selectedAccountID, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_rootRecordType, 0);
  objc_storeStrong((id *)&self->_sharedItemHierarchyIDs, 0);
  objc_storeStrong((id *)&self->_callingParticipant, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_rootRecord, 0);
  objc_storeStrong((id *)&self->_ownerIdentity, 0);
  objc_storeStrong((id *)&self->_hierarchicalRootRecordID, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end
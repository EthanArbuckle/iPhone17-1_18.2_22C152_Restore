@interface CKRecordZone
+ (BOOL)supportsSecureCoding;
+ (CKRecordZone)defaultRecordZone;
+ (id)systemRecordZone;
+ (void)initialize;
- (BOOL)applyPCSKeysToRemoveForTesting;
- (BOOL)hasUpdatedExpirationTimeInterval;
- (BOOL)isExpired;
- (BOOL)needsZoneishPCSRolled;
- (BOOL)serializeProtectionData;
- (BOOL)zoneKeyRollAllowed;
- (CKPCSKeysToRemove)zonePCSKeysToRemove;
- (CKPCSKeysToRemove)zoneishPCSKeysToRemove;
- (CKRecordZone)initWithCoder:(id)a3;
- (CKRecordZone)initWithZoneID:(CKRecordZoneID *)zoneID;
- (CKRecordZone)initWithZoneName:(NSString *)zoneName;
- (CKRecordZoneCapabilities)capabilities;
- (CKRecordZoneID)zoneID;
- (CKReference)share;
- (CKRequiredFeatureSet)originalRequiredFeatures;
- (CKRequiredFeatureSet)requiredFeatures;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKServerChangeToken)currentServerChangeToken;
- (NSArray)invitedKeysToRemove;
- (NSData)clientChangeToken;
- (NSData)pcsKeyID;
- (NSData)protectionData;
- (NSData)zoneishKeyID;
- (NSData)zoneishProtectionData;
- (NSDate)expirationDate;
- (NSDate)zonePCSModificationDate;
- (NSNumber)updatedExpirationTimeInterval;
- (NSString)description;
- (NSString)previousProtectionEtag;
- (NSString)protectionEtag;
- (NSString)zonePCSLastModifierDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (int)deviceCount;
- (int64_t)assetQuotaUsage;
- (int64_t)metadataQuotaUsage;
- (void)CKAssignToContainerWithID:(id)a3;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)replaceZoneIDWith:(id)a3;
- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3;
- (void)setAssetQuotaUsage:(int64_t)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setClientChangeToken:(id)a3;
- (void)setCurrentServerChangeToken:(id)a3;
- (void)setDeviceCount:(int)a3;
- (void)setExpirationAfterTimeInterval:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setHasUpdatedExpirationTimeInterval:(BOOL)a3;
- (void)setInvitedKeysToRemove:(id)a3;
- (void)setMetadataQuotaUsage:(int64_t)a3;
- (void)setNeedsZoneishPCSRolled:(BOOL)a3;
- (void)setOriginalRequiredFeatures:(id)a3;
- (void)setPcsKeyID:(id)a3;
- (void)setPreviousProtectionEtag:(id)a3;
- (void)setProtectionData:(id)a3;
- (void)setProtectionEtag:(id)a3;
- (void)setRequiredFeatures:(id)a3;
- (void)setSerializeProtectionData:(BOOL)a3;
- (void)setShare:(id)a3;
- (void)setUpdatedExpirationTimeInterval:(id)a3;
- (void)setZoneID:(id)a3;
- (void)setZoneKeyRollAllowed:(BOOL)a3;
- (void)setZonePCSKeysToRemove:(id)a3;
- (void)setZonePCSLastModifierDevice:(id)a3;
- (void)setZonePCSModificationDate:(id)a3;
- (void)setZoneishKeyID:(id)a3;
- (void)setZoneishPCSKeysToRemove:(id)a3;
- (void)setZoneishProtectionData:(id)a3;
@end

@implementation CKRecordZone

- (CKRecordZoneID)zoneID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_zoneID;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeatures, 0);
  objc_storeStrong((id *)&self->_zonePCSModificationDate, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtag, 0);
  objc_storeStrong((id *)&self->_zonePCSLastModifierDevice, 0);
  objc_storeStrong((id *)&self->_originalRequiredFeatures, 0);
  objc_storeStrong((id *)&self->_zoneishPCSKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zonePCSKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_zoneishProtectionData, 0);
  objc_storeStrong((id *)&self->_protectionEtag, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_currentServerChangeToken, 0);
  objc_storeStrong((id *)&self->_updatedExpirationTimeInterval, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);

  objc_storeStrong((id *)&self->_invitedKeysToRemove, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKRecordZone alloc];
  v8 = objc_msgSend_zoneID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_capabilities(self, v9, v10, v11);
  v13 = sub_18AF44B54(v4, v8, v12);

  v13[4] = objc_msgSend_deviceCount(self, v14, v15, v16);
  v20 = objc_msgSend_clientChangeToken(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_copy(v20, v21, v22, v23);
  v25 = (void *)*((void *)v13 + 11);
  *((void *)v13 + 11) = v24;

  v29 = objc_msgSend_currentServerChangeToken(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_copy(v29, v30, v31, v32);
  v34 = (void *)*((void *)v13 + 10);
  *((void *)v13 + 10) = v33;

  v38 = objc_msgSend_previousProtectionEtag(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_copy(v38, v39, v40, v41);
  v43 = (void *)*((void *)v13 + 21);
  *((void *)v13 + 21) = v42;

  *((void *)v13 + 22) = objc_msgSend_assetQuotaUsage(self, v44, v45, v46);
  *((void *)v13 + 23) = objc_msgSend_metadataQuotaUsage(self, v47, v48, v49);
  v53 = objc_msgSend_zonePCSModificationDate(self, v50, v51, v52);
  uint64_t v57 = objc_msgSend_copy(v53, v54, v55, v56);
  v58 = (void *)*((void *)v13 + 24);
  *((void *)v13 + 24) = v57;

  v62 = objc_msgSend_pcsKeyID(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_copy(v62, v63, v64, v65);
  v67 = (void *)*((void *)v13 + 15);
  *((void *)v13 + 15) = v66;

  v71 = objc_msgSend_zoneishKeyID(self, v68, v69, v70);
  uint64_t v75 = objc_msgSend_copy(v71, v72, v73, v74);
  v76 = (void *)*((void *)v13 + 16);
  *((void *)v13 + 16) = v75;

  *((unsigned char *)v13 + 13) = objc_msgSend_serializeProtectionData(self, v77, v78, v79);
  v83 = objc_msgSend_protectionData(self, v80, v81, v82);
  uint64_t v87 = objc_msgSend_copy(v83, v84, v85, v86);
  v88 = (void *)*((void *)v13 + 12);
  *((void *)v13 + 12) = v87;

  v92 = objc_msgSend_protectionEtag(self, v89, v90, v91);
  uint64_t v96 = objc_msgSend_copy(v92, v93, v94, v95);
  v97 = (void *)*((void *)v13 + 13);
  *((void *)v13 + 13) = v96;

  v101 = objc_msgSend_zoneishProtectionData(self, v98, v99, v100);
  uint64_t v105 = objc_msgSend_copy(v101, v102, v103, v104);
  v106 = (void *)*((void *)v13 + 14);
  *((void *)v13 + 14) = v105;

  *((unsigned char *)v13 + 12) = objc_msgSend_zoneKeyRollAllowed(self, v107, v108, v109);
  v113 = objc_msgSend_share(self, v110, v111, v112);
  uint64_t v117 = objc_msgSend_copy(v113, v114, v115, v116);
  v118 = (void *)*((void *)v13 + 6);
  *((void *)v13 + 6) = v117;

  v122 = objc_msgSend_invitedKeysToRemove(self, v119, v120, v121);
  uint64_t v126 = objc_msgSend_CKDeepCopy(v122, v123, v124, v125);
  v127 = (void *)*((void *)v13 + 3);
  *((void *)v13 + 3) = v126;

  v131 = objc_msgSend_expirationDate(self, v128, v129, v130);
  uint64_t v135 = objc_msgSend_copy(v131, v132, v133, v134);
  v136 = (void *)*((void *)v13 + 8);
  *((void *)v13 + 8) = v135;

  *((unsigned char *)v13 + 9) = objc_msgSend_isExpired(self, v137, v138, v139);
  *((unsigned char *)v13 + 10) = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v140, v141, v142);
  v146 = objc_msgSend_updatedExpirationTimeInterval(self, v143, v144, v145);
  uint64_t v150 = objc_msgSend_copy(v146, v147, v148, v149);
  v151 = (void *)*((void *)v13 + 9);
  *((void *)v13 + 9) = v150;

  v155 = objc_msgSend_requiredFeatures(self, v152, v153, v154);
  uint64_t v159 = objc_msgSend_copy(v155, v156, v157, v158);
  v160 = (void *)*((void *)v13 + 25);
  *((void *)v13 + 25) = v159;

  v164 = objc_msgSend_originalRequiredFeatures(self, v161, v162, v163);
  uint64_t v168 = objc_msgSend_copy(v164, v165, v166, v167);
  v169 = (void *)*((void *)v13 + 19);
  *((void *)v13 + 19) = v168;

  v173 = objc_msgSend_zonePCSKeysToRemove(self, v170, v171, v172);
  uint64_t v177 = objc_msgSend_copy(v173, v174, v175, v176);
  v178 = (void *)*((void *)v13 + 17);
  *((void *)v13 + 17) = v177;

  v182 = objc_msgSend_zoneishPCSKeysToRemove(self, v179, v180, v181);
  uint64_t v186 = objc_msgSend_copy(v182, v183, v184, v185);
  v187 = (void *)*((void *)v13 + 18);
  *((void *)v13 + 18) = v186;

  return v13;
}

- (NSData)zoneishProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (CKPCSKeysToRemove)zoneishPCSKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 144, 1);
}

- (NSData)zoneishKeyID
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)zonePCSModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (CKPCSKeysToRemove)zonePCSKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)zoneKeyRollAllowed
{
  return self->_zoneKeyRollAllowed;
}

- (NSNumber)updatedExpirationTimeInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (CKReference)share
{
  return (CKReference *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)serializeProtectionData
{
  return self->_serializeProtectionData;
}

- (CKRequiredFeatureSet)requiredFeatures
{
  return (CKRequiredFeatureSet *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)protectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSData)protectionData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)previousProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSData)pcsKeyID
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (CKRequiredFeatureSet)originalRequiredFeatures
{
  return (CKRequiredFeatureSet *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)metadataQuotaUsage
{
  return self->_metadataQuotaUsage;
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (NSArray)invitedKeysToRemove
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_invitedKeysToRemove;
  objc_sync_exit(v2);

  return v3;
}

- (CKRecordZone)initWithZoneName:(NSString *)zoneName
{
  v4 = zoneName;
  id v24 = 0;
  char v5 = _CKCheckArgument((uint64_t)"zoneName", v4, 0, 1, 0, &v24);
  id v6 = v24;
  if ((v5 & 1) == 0)
  {
    uint64_t v12 = v6;
    v13 = [CKException alloc];
    uint64_t v17 = objc_msgSend_code(v12, v14, v15, v16);
    v21 = objc_msgSend_localizedDescription(v12, v18, v19, v20);
    id v23 = (id)objc_msgSend_initWithCode_format_(v13, v22, v17, @"%@", v21);

    objc_exception_throw(v23);
  }

  uint64_t v7 = [CKRecordZoneID alloc];
  v9 = objc_msgSend_initWithZoneName_ownerName_(v7, v8, (uint64_t)v4, @"__defaultOwner__");
  uint64_t v10 = (CKRecordZone *)sub_18AF44B54(self, v9, 0);

  return v10;
}

- (BOOL)hasUpdatedExpirationTimeInterval
{
  return self->_hasUpdatedExpirationTimeInterval;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (int)deviceCount
{
  return self->_deviceCount;
}

- (CKServerChangeToken)currentServerChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)clientChangeToken
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (CKRecordZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (int64_t)assetQuotaUsage
{
  return self->_assetQuotaUsage;
}

+ (CKRecordZone)defaultRecordZone
{
  if (qword_1EB279F48 != -1) {
    dispatch_once(&qword_1EB279F48, &unk_1ED7EF6F8);
  }
  v2 = (void *)qword_1EB279F40;

  return (CKRecordZone *)v2;
}

+ (id)systemRecordZone
{
  if (qword_1EB279F58 != -1) {
    dispatch_once(&qword_1EB279F58, &unk_1ED7EF798);
  }
  v2 = (void *)qword_1EB279F50;

  return v2;
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKRecordZone)initWithZoneID:(CKRecordZoneID *)zoneID
{
  v4 = zoneID;
  id v21 = 0;
  char v5 = _CKCheckArgument((uint64_t)"zoneID", v4, 0, 1, 0, &v21);
  id v6 = v21;
  if ((v5 & 1) == 0)
  {
    v9 = v6;
    uint64_t v10 = [CKException alloc];
    uint64_t v14 = objc_msgSend_code(v9, v11, v12, v13);
    uint64_t v18 = objc_msgSend_localizedDescription(v9, v15, v16, v17);
    id v20 = (id)objc_msgSend_initWithCode_format_(v10, v19, v14, @"%@", v18);

    objc_exception_throw(v20);
  }

  uint64_t v7 = (CKRecordZone *)sub_18AF44B54(self, v4, 0);
  return v7;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_zoneID(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"zoneID");

  uint64_t v12 = objc_msgSend_properties(v3, v9, v10, v11);

  return (CKRoughlyEquivalentProperties *)v12;
}

- (void)setInvitedKeysToRemove:(id)a3
{
  id v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  invitedKeysToRemove = v4->_invitedKeysToRemove;
  v4->_invitedKeysToRemove = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setZoneID:(id)a3
{
  id v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
  zoneID = v4->_zoneID;
  v4->_zoneID = (CKRecordZoneID *)v8;

  objc_sync_exit(v4);
}

- (void)replaceZoneIDWith:(id)a3
{
  id v42 = a3;
  if (!v42)
  {
    uint64_t v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, (uint64_t)self, @"CKRecordZone.m", 186, @"Must not be nil");
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v12 = objc_msgSend_zoneName(v8->_zoneID, v9, v10, v11);
  uint64_t v16 = objc_msgSend_zoneName(v42, v13, v14, v15);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18);

  if ((isEqualToString & 1) == 0)
  {
    v38 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21, v22);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, (uint64_t)v8, @"CKRecordZone.m", 188, @"Must use the same zone name");
  }
  id v23 = objc_msgSend_ownerName(v8->_zoneID, v20, v21, v22);
  uint64_t v27 = objc_msgSend_ownerName(v42, v24, v25, v26);
  char v30 = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

  if ((v30 & 1) == 0)
  {
    uint64_t v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v31, v32, v33);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)v8, @"CKRecordZone.m", 189, @"Must use the same owner name");
  }
  uint64_t v34 = objc_msgSend_copy(v42, v31, v32, v33);
  zoneID = v8->_zoneID;
  v8->_zoneID = (CKRecordZoneID *)v34;

  objc_sync_exit(v8);
}

- (void)CKAssignToContainerWithID:(id)a3
{
  newValue = (char *)a3;
  if (self) {
    id Property = objc_getProperty(self, v5, 56, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v9 = v7;
  uint64_t v10 = newValue;
  if (!newValue || !v7 || (objc_msgSend_isEqual_(v7, newValue, (uint64_t)newValue, v8) & 1) != 0)
  {
    if (!self) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"CKRecordZone.m", 201, @"Cannot replace assigned container ID %@ with %@", v9, newValue);

  if (self) {
LABEL_7:
  }
    objc_setProperty_atomic_copy(self, v10, newValue, 56);
LABEL_8:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordZone)initWithCoder:(id)a3
{
  id v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)CKRecordZone;
  uint64_t v5 = [(CKRecordZone *)&v135 init];
  if (v5)
  {
    context = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ZoneID");
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"Capabilities");
    v5->_capabilities = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);

    v5->_deviceCount = objc_msgSend_decodeInt32ForKey_(v4, v16, @"DeviceCount", v17);
    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"ClientChangeToken");
    clientChangeToken = v5->_clientChangeToken;
    v5->_clientChangeToken = (NSData *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"CurrentServerChangeToken");
    currentServerChangeToken = v5->_currentServerChangeToken;
    v5->_currentServerChangeToken = (CKServerChangeToken *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"PreviousProtectionEtag");
    previousProtectionEtag = v5->_previousProtectionEtag;
    v5->_previousProtectionEtag = (NSString *)v28;

    v5->_assetQuotaUsage = objc_msgSend_decodeInt64ForKey_(v4, v30, @"AssetQuotaUsage", v31);
    v5->_metadataQuotaUsage = objc_msgSend_decodeInt64ForKey_(v4, v32, @"MetadataQuotaUsage", v33);
    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"PCSModificationDate");
    zonePCSModificationDate = v5->_zonePCSModificationDate;
    v5->_zonePCSModificationDate = (NSDate *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"PCSKeyID");
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"ZoneishKeyID");
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"ProtectionData");
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v48;

    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"ProtectionEtag");
    protectionEtag = v5->_protectionEtag;
    v5->_protectionEtag = (NSString *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"ZoneishProtectionData");
    zoneishProtectionData = v5->_zoneishProtectionData;
    v5->_zoneishProtectionData = (NSData *)v56;

    uint64_t v58 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"ShareReference");
    share = v5->_share;
    v5->_share = (CKReference *)v60;

    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    v67 = objc_msgSend_setWithObjects_(v62, v65, v63, v66, v64, 0);
    uint64_t v69 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, @"InvitedKeysToRemove");
    invitedKeysToRemove = v5->_invitedKeysToRemove;
    v5->_invitedKeysToRemove = (NSArray *)v69;

    uint64_t v71 = objc_opt_class();
    uint64_t v73 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, @"ExpirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v73;

    v5->_expired = objc_msgSend_decodeBoolForKey_(v4, v75, @"Expired", v76);
    v5->_hasUpdatedExpirationTimeInterval = objc_msgSend_decodeBoolForKey_(v4, v77, @"HasUpdatedExpiration", v78);
    uint64_t v79 = objc_opt_class();
    uint64_t v81 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, @"UpdatedExpiration");
    updatedExpirationTimeInterval = v5->_updatedExpirationTimeInterval;
    v5->_updatedExpirationTimeInterval = (NSNumber *)v81;

    v83 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    uint64_t v86 = objc_opt_class();
    uint64_t v87 = objc_opt_class();
    uint64_t v88 = objc_opt_class();
    uint64_t v89 = objc_opt_class();
    v92 = objc_msgSend_setWithObjects_(v83, v90, v84, v91, v85, v86, v87, v88, v89, 0);
    uint64_t v94 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v93, (uint64_t)v92, @"RequiredFeaturesKey");
    requiredFeatures = v5->_requiredFeatures;
    v5->_requiredFeatures = (CKRequiredFeatureSet *)v94;

    uint64_t v96 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v97 = objc_opt_class();
    uint64_t v98 = objc_opt_class();
    uint64_t v99 = objc_opt_class();
    uint64_t v100 = objc_opt_class();
    uint64_t v101 = objc_opt_class();
    uint64_t v102 = objc_opt_class();
    uint64_t v105 = objc_msgSend_setWithObjects_(v96, v103, v97, v104, v98, v99, v100, v101, v102, 0);
    uint64_t v107 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v106, (uint64_t)v105, @"OriginalRequiredFeaturesKey");
    originalRequiredFeatures = v5->_originalRequiredFeatures;
    v5->_originalRequiredFeatures = (CKRequiredFeatureSet *)v107;

    uint64_t v109 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v110 = objc_opt_class();
    uint64_t v111 = objc_opt_class();
    uint64_t v112 = objc_opt_class();
    uint64_t v113 = objc_opt_class();
    uint64_t v116 = objc_msgSend_setWithObjects_(v109, v114, v110, v115, v111, v112, v113, 0);
    uint64_t v118 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v117, (uint64_t)v116, @"ZonePCSKeysToRemove");
    zonePCSKeysToRemove = v5->_zonePCSKeysToRemove;
    v5->_zonePCSKeysToRemove = (CKPCSKeysToRemove *)v118;

    uint64_t v120 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v121 = objc_opt_class();
    uint64_t v122 = objc_opt_class();
    uint64_t v123 = objc_opt_class();
    uint64_t v124 = objc_opt_class();
    v127 = objc_msgSend_setWithObjects_(v120, v125, v121, v126, v122, v123, v124, 0);
    uint64_t v129 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v128, (uint64_t)v127, @"ZoneishPCSKeysToRemove");
    zoneishPCSKeysToRemove = v5->_zoneishPCSKeysToRemove;
    v5->_zoneishPCSKeysToRemove = (CKPCSKeysToRemove *)v129;

    v5->_applyPCSKeysToRemoveForTesting = objc_msgSend_decodeBoolForKey_(v4, v131, @"ApplyPCSKeysToRemoveForTesting", v132);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v135 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_zoneID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v135, v9, (uint64_t)v8, @"ZoneID");

  uint64_t v10 = NSNumber;
  uint64_t v14 = objc_msgSend_capabilities(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  objc_msgSend_encodeObject_forKey_(v135, v18, (uint64_t)v17, @"Capabilities");

  uint64_t v22 = objc_msgSend_deviceCount(self, v19, v20, v21);
  objc_msgSend_encodeInt32_forKey_(v135, v23, v22, @"DeviceCount");
  uint64_t v27 = objc_msgSend_clientChangeToken(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v135, v28, (uint64_t)v27, @"ClientChangeToken");

  uint64_t v32 = objc_msgSend_currentServerChangeToken(self, v29, v30, v31);
  objc_msgSend_encodeObject_forKey_(v135, v33, (uint64_t)v32, @"CurrentServerChangeToken");

  uint64_t v37 = objc_msgSend_previousProtectionEtag(self, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v135, v38, (uint64_t)v37, @"PreviousProtectionEtag");

  uint64_t v42 = objc_msgSend_assetQuotaUsage(self, v39, v40, v41);
  objc_msgSend_encodeInt64_forKey_(v135, v43, v42, @"AssetQuotaUsage");
  uint64_t v47 = objc_msgSend_metadataQuotaUsage(self, v44, v45, v46);
  objc_msgSend_encodeInt64_forKey_(v135, v48, v47, @"MetadataQuotaUsage");
  uint64_t v52 = objc_msgSend_zonePCSModificationDate(self, v49, v50, v51);
  objc_msgSend_encodeObject_forKey_(v135, v53, (uint64_t)v52, @"PCSModificationDate");

  uint64_t v57 = objc_msgSend_pcsKeyID(self, v54, v55, v56);
  objc_msgSend_encodeObject_forKey_(v135, v58, (uint64_t)v57, @"PCSKeyID");

  v62 = objc_msgSend_zoneishKeyID(self, v59, v60, v61);
  objc_msgSend_encodeObject_forKey_(v135, v63, (uint64_t)v62, @"ZoneishKeyID");

  v67 = objc_msgSend_share(self, v64, v65, v66);
  objc_msgSend_encodeObject_forKey_(v135, v68, (uint64_t)v67, @"ShareReference");

  v72 = objc_msgSend_invitedKeysToRemove(self, v69, v70, v71);
  objc_msgSend_encodeObject_forKey_(v135, v73, (uint64_t)v72, @"InvitedKeysToRemove");

  if (!byte_1E9124EF0 && objc_msgSend_serializeProtectionData(self, v74, v75, v76))
  {
    v77 = objc_msgSend_protectionData(self, v74, v75, v76);
    objc_msgSend_encodeObject_forKey_(v135, v78, (uint64_t)v77, @"ProtectionData");

    uint64_t v82 = objc_msgSend_protectionEtag(self, v79, v80, v81);
    objc_msgSend_encodeObject_forKey_(v135, v83, (uint64_t)v82, @"ProtectionEtag");

    uint64_t v87 = objc_msgSend_zoneishProtectionData(self, v84, v85, v86);
    objc_msgSend_encodeObject_forKey_(v135, v88, (uint64_t)v87, @"ZoneishProtectionData");

    if (!__sTestOverridesAvailable) {
      goto LABEL_8;
    }
    uint64_t v89 = objc_msgSend_zonePCSKeysToRemove(self, v74, v75, v76);
    objc_msgSend_encodeObject_forKey_(v135, v90, (uint64_t)v89, @"ZonePCSKeysToRemove");

    uint64_t v94 = objc_msgSend_zoneishPCSKeysToRemove(self, v91, v92, v93);
    objc_msgSend_encodeObject_forKey_(v135, v95, (uint64_t)v94, @"ZoneishPCSKeysToRemove");
  }
  if (__sTestOverridesAvailable && objc_msgSend_applyPCSKeysToRemoveForTesting(self, v74, v75, v76))
  {
    uint64_t v96 = objc_msgSend_applyPCSKeysToRemoveForTesting(self, v74, v75, v76);
    objc_msgSend_encodeBool_forKey_(v135, v97, v96, @"ApplyPCSKeysToRemoveForTesting");
    uint64_t v101 = objc_msgSend_zonePCSKeysToRemove(self, v98, v99, v100);
    objc_msgSend_encodeObject_forKey_(v135, v102, (uint64_t)v101, @"ZonePCSKeysToRemove");

    v106 = objc_msgSend_zoneishPCSKeysToRemove(self, v103, v104, v105);
    objc_msgSend_encodeObject_forKey_(v135, v107, (uint64_t)v106, @"ZoneishPCSKeysToRemove");
  }
LABEL_8:
  uint64_t v108 = objc_msgSend_expirationDate(self, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v135, v109, (uint64_t)v108, @"ExpirationDate");

  uint64_t isExpired = objc_msgSend_isExpired(self, v110, v111, v112);
  objc_msgSend_encodeBool_forKey_(v135, v114, isExpired, @"Expired");
  uint64_t hasUpdatedExpirationTimeInterval = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v115, v116, v117);
  objc_msgSend_encodeBool_forKey_(v135, v119, hasUpdatedExpirationTimeInterval, @"HasUpdatedExpiration");
  uint64_t v123 = objc_msgSend_updatedExpirationTimeInterval(self, v120, v121, v122);
  objc_msgSend_encodeObject_forKey_(v135, v124, (uint64_t)v123, @"UpdatedExpiration");

  v128 = objc_msgSend_requiredFeatures(self, v125, v126, v127);
  objc_msgSend_encodeObject_forKey_(v135, v129, (uint64_t)v128, @"RequiredFeaturesKey");

  uint64_t v133 = objc_msgSend_originalRequiredFeatures(self, v130, v131, v132);
  objc_msgSend_encodeObject_forKey_(v135, v134, (uint64_t)v133, @"OriginalRequiredFeaturesKey");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_zoneID(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"zoneID", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_capabilities(self, v10, v11, v12);
  CKStringFromCapabilities(v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"capabilities", (uint64_t)v15, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZone *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordZone *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)setExpirationAfterTimeInterval:(id)a3
{
  id v8 = a3;
  objc_msgSend_setHasUpdatedExpirationTimeInterval_(self, v4, 1, v5);
  objc_msgSend_setUpdatedExpirationTimeInterval_(self, v6, (uint64_t)v8, v7);
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (void)setShare:(id)a3
{
}

- (BOOL)applyPCSKeysToRemoveForTesting
{
  return self->_applyPCSKeysToRemoveForTesting;
}

- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3
{
  self->_applyPCSKeysToRemoveForTesting = a3;
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (void)setHasUpdatedExpirationTimeInterval:(BOOL)a3
{
  self->_uint64_t hasUpdatedExpirationTimeInterval = a3;
}

- (void)setUpdatedExpirationTimeInterval:(id)a3
{
}

- (void)setDeviceCount:(int)a3
{
  self->_deviceCount = a3;
}

- (void)setCurrentServerChangeToken:(id)a3
{
}

- (void)setClientChangeToken:(id)a3
{
}

- (void)setProtectionData:(id)a3
{
}

- (void)setProtectionEtag:(id)a3
{
}

- (void)setZoneishProtectionData:(id)a3
{
}

- (void)setPcsKeyID:(id)a3
{
}

- (void)setZoneishKeyID:(id)a3
{
}

- (void)setZonePCSKeysToRemove:(id)a3
{
}

- (void)setZoneishPCSKeysToRemove:(id)a3
{
}

- (void)setOriginalRequiredFeatures:(id)a3
{
}

- (BOOL)needsZoneishPCSRolled
{
  return self->_needsZoneishPCSRolled;
}

- (void)setNeedsZoneishPCSRolled:(BOOL)a3
{
  self->_needsZoneishPCSRolled = a3;
}

- (void)setZoneKeyRollAllowed:(BOOL)a3
{
  self->_zoneKeyRollAllowed = a3;
}

- (NSString)zonePCSLastModifierDevice
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setZonePCSLastModifierDevice:(id)a3
{
}

- (void)setPreviousProtectionEtag:(id)a3
{
}

- (void)setAssetQuotaUsage:(int64_t)a3
{
  self->_assetQuotaUsage = a3;
}

- (void)setMetadataQuotaUsage:(int64_t)a3
{
  self->_metadataQuotaUsage = a3;
}

- (void)setZonePCSModificationDate:(id)a3
{
}

- (void)setSerializeProtectionData:(BOOL)a3
{
  self->_serializeProtectionData = a3;
}

- (void)setRequiredFeatures:(id)a3
{
}

@end
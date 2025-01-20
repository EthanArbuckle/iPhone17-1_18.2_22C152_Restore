@interface CKRecord
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (CKRecord)recordWithDuplicatedPackagesOfRecord:(id)a3 error:(id *)a4;
+ (id)decryptFullToken:(id)a3 shortSharingTokenData:(id)a4;
+ (id)encryptFullToken:(id)a3 shortSharingTokenData:(id)a4;
+ (id)fullTokenFromBaseToken:(id)a3 privateToken:(id)a4;
+ (id)keyForAppendingToListField:(id)a3;
+ (id)keyForFetchingItems:(unint64_t)a3 atEndOfListField:(id)a4;
+ (id)keyForInsertingIntoListField:(id)a3 atIndex:(int64_t)a4;
+ (id)keyForListField:(id)a3 withIndexRange:(_NSRange)a4;
+ (id)shareURLWithShortToken:(id)a3 shareTitle:(id)a4 shareType:(id)a5 containerID:(id)a6 displayedHostname:(id)a7;
+ (void)initialize;
- (BOOL)applyPCSKeysToRemoveForTesting;
- (BOOL)canHostServerURLInfo;
- (BOOL)canSkipRecordSaveForMergeables;
- (BOOL)containsAssetBackedMergeableDeltas;
- (BOOL)containsAssetValues;
- (BOOL)containsIndexedKeys;
- (BOOL)containsMergeableValues;
- (BOOL)containsMergeableValuesWithDeltasToSave;
- (BOOL)containsPackageValues;
- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4;
- (BOOL)containsValuePassingTest:(id)a3;
- (BOOL)hasChainPCS;
- (BOOL)hasEncryptedData;
- (BOOL)hasModifiedEncryptedData;
- (BOOL)hasModifiedPropertiesRequiringEncryption;
- (BOOL)hasPropertiesRequiringDecryption;
- (BOOL)hasPropertiesRequiringEncryption;
- (BOOL)hasUpdatedExpirationTimeInterval;
- (BOOL)hasUpdatedParent;
- (BOOL)hasUpdatedShare;
- (BOOL)isExpired;
- (BOOL)isKnownToServer;
- (BOOL)isMergeableValueDeltaRecord;
- (BOOL)isMoreRecentThanRecord:(id)a3;
- (BOOL)needsRollAndCounterSign;
- (BOOL)prepareMergeablesForUploadInContainer:(id)a3 useAssetsIfNecessary:(BOOL)a4 error:(id *)a5;
- (BOOL)requiresRecordSaveForMergeableDeltas;
- (BOOL)serializeProtectionData;
- (BOOL)trackChanges;
- (BOOL)useLightweightPCS;
- (BOOL)wantsChainPCS;
- (BOOL)wantsPublicSharingKey;
- (BOOL)wasCached;
- (CKContainerID)containerID;
- (CKEncryptedData)chainPrivateKey;
- (CKEncryptedData)mutableEncryptedPSK;
- (CKEncryptedRecordValueStore)encryptedValueStore;
- (CKPCSKeysToRemove)pcsKeysToRemove;
- (CKRecord)init;
- (CKRecord)initWithCoder:(id)a3;
- (CKRecord)initWithRecordTransport:(id)a3;
- (CKRecord)initWithRecordType:(CKRecordType)recordType;
- (CKRecord)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID;
- (CKRecord)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID;
- (CKRecordID)creatorUserRecordID;
- (CKRecordID)lastModifiedUserRecordID;
- (CKRecordID)recordID;
- (CKRecordType)recordType;
- (CKRecordValueStore)valueStore;
- (CKReference)parent;
- (CKReference)previousParent;
- (CKReference)previousShare;
- (CKReference)share;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSArray)allKeys;
- (NSArray)allPCSKeyIDs;
- (NSArray)allTokens;
- (NSArray)changedKeys;
- (NSArray)conflictLoserEtags;
- (NSArray)tombstonedPublicKeyIDs;
- (NSData)chainParentPublicKeyID;
- (NSData)chainProtectionInfo;
- (NSData)encryptedFullTokenData;
- (NSData)encryptedPublicSharingKey;
- (NSData)mutableEncryptedPublicSharingKeyData;
- (NSData)pcsKeyID;
- (NSData)protectionData;
- (NSData)shortSharingTokenData;
- (NSData)shortSharingTokenHashData;
- (NSData)zoneishKeyID;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)modificationDate;
- (NSDictionary)originalValues;
- (NSDictionary)pluginFields;
- (NSDictionary)values;
- (NSNumber)updatedExpirationTimeInterval;
- (NSSet)changedKeysSet;
- (NSString)baseToken;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayedHostname;
- (NSString)etag;
- (NSString)fullToken;
- (NSString)modifiedByDevice;
- (NSString)previousProtectionEtag;
- (NSString)previousProtectionEtagFromUnitTest;
- (NSString)privateToken;
- (NSString)protectionEtag;
- (NSString)recordChangeTag;
- (NSString)routingKey;
- (NSString)shareEtag;
- (NSString)shortToken;
- (NSString)zoneProtectionEtag;
- (NSURL)URL;
- (NSURL)mutableURL;
- (NSURL)uncachedURL;
- (_PCSIdentityData)signingPCSIdentity;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)_allStrings;
- (id)_copyWithOptions:(int64_t)a3;
- (id)allValues;
- (id)conciseDescription;
- (id)copyWithOriginalValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5 systemFields:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4;
- (id)decryptFullToken:(id)a3;
- (id)initInternalSkippingValidationWithRecordType:(id)a3 recordID:(id)a4;
- (id)objectForKey:(CKRecordFieldKey)key;
- (id)objectForKeyedSubscript:(CKRecordFieldKey)key;
- (id)redactedDescription;
- (id)shortSharingToken;
- (int64_t)permission;
- (unint64_t)assetCount;
- (unint64_t)assetDiskSize;
- (unint64_t)size;
- (void)CKAssignToContainerWithID:(id)a3;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)claimPackagesWithSuccessBlock:(id)a3 failureBlock:(id)a4 completionBlock:(id)a5;
- (void)copyStreamingAssetServerFieldsFromServerRecord:(id)a3;
- (void)countMergeableValueMetrics:(id)a3;
- (void)dealloc;
- (void)encodeSystemFieldsWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4;
- (void)enumerateKeysAndValuesUsingBlock:(id)a3;
- (void)preTiboEncodeWithCoder:(id)a3;
- (void)releasePackages;
- (void)removePackages;
- (void)replaceRecordIDWith:(id)a3;
- (void)resetChangedKeys;
- (void)setAllPCSKeyIDs:(id)a3;
- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3;
- (void)setBaseToken:(id)a3;
- (void)setChainParentPublicKeyID:(id)a3;
- (void)setChainPrivateKey:(id)a3;
- (void)setChainProtectionInfo:(id)a3;
- (void)setChangedKeysSet:(id)a3;
- (void)setConflictLoserEtags:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreatorUserRecordID:(id)a3;
- (void)setDisplayedHostname:(id)a3;
- (void)setEncryptedValueStore:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExpirationAfterTimeInterval:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setHasUpdatedExpirationTimeInterval:(BOOL)a3;
- (void)setHasUpdatedParent:(BOOL)a3;
- (void)setHasUpdatedShare:(BOOL)a3;
- (void)setIsMergeableValueDeltaRecord:(BOOL)a3;
- (void)setKnownToServer:(BOOL)a3;
- (void)setLastModifiedUserRecordID:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setModifiedByDevice:(id)a3;
- (void)setMutableEncryptedPSK:(id)a3;
- (void)setMutableEncryptedPublicSharingKeyData:(id)a3;
- (void)setMutableURL:(id)a3;
- (void)setNeedsRollAndCounterSign:(BOOL)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setObject:(id)object forKey:(CKRecordFieldKey)key;
- (void)setObjectNoValidate:(id)a3 forKey:(id)a4;
- (void)setParent:(CKReference *)parent;
- (void)setParentReferenceFromRecord:(CKRecord *)parentRecord;
- (void)setParentReferenceFromRecordID:(CKRecordID *)parentRecordID;
- (void)setPcsKeyID:(id)a3;
- (void)setPcsKeysToRemove:(id)a3;
- (void)setPermission:(int64_t)a3;
- (void)setPluginFields:(id)a3;
- (void)setPreviousParent:(id)a3;
- (void)setPreviousProtectionEtag:(id)a3;
- (void)setPreviousProtectionEtagFromUnitTest:(id)a3;
- (void)setPreviousShare:(id)a3;
- (void)setProtectionData:(id)a3;
- (void)setProtectionEtag:(id)a3;
- (void)setRecordChangeTag:(id)a3;
- (void)setRecordChangeTag_modelMutation:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRequiresRecordSaveForMergeableDeltas:(BOOL)a3;
- (void)setRoutingKey:(id)a3;
- (void)setSerializeProtectionData:(BOOL)a3;
- (void)setShare:(id)a3;
- (void)setShareEtag:(id)a3;
- (void)setSigningPCSIdentity:(_PCSIdentityData *)a3;
- (void)setStreamingAssetRequestOptions:(id)a3;
- (void)setTombstonedPublicKeyIDs:(id)a3;
- (void)setTrackChanges:(BOOL)a3;
- (void)setUpdatedExpirationTimeInterval:(id)a3;
- (void)setUseLightweightPCS:(BOOL)a3;
- (void)setValueStore:(id)a3;
- (void)setWantsChainPCS:(BOOL)a3;
- (void)setWantsPublicSharingKey:(BOOL)a3;
- (void)setWasCached:(BOOL)a3;
- (void)setZoneProtectionEtag:(id)a3;
- (void)setZoneishKeyID:(id)a3;
- (void)updateMergeablesForSuccessfulSave;
- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4;
@end

@implementation CKRecord

- (void)dealloc
{
  signingPCSIdentity = self->_signingPCSIdentity;
  if (signingPCSIdentity)
  {
    CFRelease(signingPCSIdentity);
    self->_signingPCSIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKRecord;
  [(CKRecord *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_mutableURL, 0);
  objc_storeStrong((id *)&self->_pcsKeysToRemove, 0);
  objc_storeStrong((id *)&self->_chainParentPublicKeyID, 0);
  objc_storeStrong((id *)&self->_chainProtectionInfo, 0);
  objc_storeStrong((id *)&self->_chainPrivateKey, 0);
  objc_storeStrong((id *)&self->_previousParent, 0);
  objc_storeStrong((id *)&self->_previousShare, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtagFromUnitTest, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_zoneProtectionEtag, 0);
  objc_storeStrong((id *)&self->_protectionEtag, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtag, 0);
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_updatedExpirationTimeInterval, 0);
  objc_storeStrong((id *)&self->_encryptedValueStore, 0);
  objc_storeStrong((id *)&self->_valueStore, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedUserRecordID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_creatorUserRecordID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_tombstonedPublicKeyIDs, 0);
  objc_storeStrong((id *)&self->_allPCSKeyIDs, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_mutableEncryptedPSK, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_etag, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

+ (void)initialize
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v7[0] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v7, 1);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 0);

  MethodImplementation = class_getMethodImplementation((Class)a1, sel_initWithRecordType_recordID_);
  class_addMethod((Class)a1, sel__initSkippingValidationWithRecordType_recordID_, MethodImplementation, "@@:@@");
}

- (CKRecord)initWithRecordTransport:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_contents(v4, v5, v6, v7) == 1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28DC0]);
    v12 = objc_msgSend_localSerialization(v4, v9, v10, v11);
    id v21 = 0;
    v14 = objc_msgSend_initForReadingFromData_error_(v8, v13, (uint64_t)v12, (uint64_t)&v21);
    id v15 = v21;

    if (v14)
    {
      self = (CKRecord *)(id)objc_msgSend_initWithCoder_(self, v16, (uint64_t)v14, v17);
      v18 = self;
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v19 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_error_impl(&dword_18AF10000, v19, OS_LOG_TYPE_ERROR, "Unable to create an unarchiver from record transport %@", buf, 0xCu);
      }
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CKRecord)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"You must call -[%@ initWithRecordType:]", v5);

  objc_exception_throw(v7);
}

- (id)initInternalSkippingValidationWithRecordType:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CKRecord;
  uint64_t v11 = [(CKRecord *)&v30 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    recordType = v11->_recordType;
    v11->_recordType = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    recordID = v11->_recordID;
    v11->_recordID = (CKRecordID *)v17;

    v19 = [CKRecordValueStore alloc];
    uint64_t v22 = objc_msgSend_initWithRecord_(v19, v20, (uint64_t)v11, v21);
    valueStore = v11->_valueStore;
    v11->_valueStore = (CKRecordValueStore *)v22;

    uint64_t v24 = [CKEncryptedRecordValueStore alloc];
    uint64_t v27 = objc_msgSend_initWithRecord_(v24, v25, (uint64_t)v11, v26);
    encryptedValueStore = v11->_encryptedValueStore;
    v11->_encryptedValueStore = (CKEncryptedRecordValueStore *)v27;

    v11->_knownToServer = 0;
    v11->_trackChanges = 1;
    v11->_hasUpdatedExpirationTimeInterval = 0;
  }

  return v11;
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID
{
  id v6 = recordType;
  id v7 = recordID;
  id v31 = 0;
  char v8 = _CKCheckArgument((uint64_t)"recordType", v6, 1, 1, 0, &v31);
  id v9 = v31;
  id v10 = v9;
  if ((v8 & 1) == 0
    || (v9,
        objc_msgSend_recordName(v7, v11, v12, v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        id v30 = 0,
        char v15 = _CKCheckArgument((uint64_t)"recordID.recordName", v14, 0, 1, 0, &v30),
        id v10 = v30,
        v14,
        (v15 & 1) == 0))
  {
    v19 = [CKException alloc];
    uint64_t v23 = objc_msgSend_code(v10, v20, v21, v22);
    uint64_t v27 = objc_msgSend_localizedDescription(v10, v24, v25, v26);
    id v29 = (id)objc_msgSend_initWithCode_format_(v19, v28, v23, @"%@", v27);

    objc_exception_throw(v29);
  }

  inited = (CKRecord *)objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(self, v16, (uint64_t)v6, (uint64_t)v7);
  return inited;
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType
{
  id v4 = recordType;
  v5 = [CKRecordID alloc];
  id v6 = CKCreateGUID();
  id v9 = objc_msgSend_initWithRecordName_(v5, v7, (uint64_t)v6, v8);

  uint64_t v11 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(self, v10, (uint64_t)v4, (uint64_t)v9);
  return v11;
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID
{
  id v6 = zoneID;
  id v7 = recordType;
  uint64_t v8 = [CKRecordID alloc];
  id v9 = CKCreateGUID();
  uint64_t v11 = objc_msgSend_initWithRecordName_zoneID_(v8, v10, (uint64_t)v9, (uint64_t)v6);

  uint64_t v13 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(self, v12, (uint64_t)v7, (uint64_t)v11);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend_copyWithZone_userFields_(self, a2, (uint64_t)a3, 1);
}

- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_msgSend_recordID(self, a2, (uint64_t)a3, a4);
  id v9 = objc_msgSend_copyWithZone_recordID_userFields_(self, v8, (uint64_t)a3, (uint64_t)v7, v4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = objc_msgSend_recordID(self, a2, (uint64_t)a3, (uint64_t)a4);
  id v10 = objc_msgSend_copyWithZone_recordID_userFields_systemFields_(self, v9, (uint64_t)a3, (uint64_t)v8, v5, 1);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5 systemFields:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)objc_opt_class());
  v14 = objc_msgSend_recordType(self, v11, v12, v13);
  uint64_t inited = objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(v10, v15, (uint64_t)v14, (uint64_t)v9);

  if (v7)
  {
    v20 = objc_msgSend_valueStore(self, v17, v18, v19);
    uint64_t v24 = objc_msgSend_copy(v20, v21, v22, v23);
    uint64_t v25 = *(void **)(inited + 168);
    *(void *)(inited + 168) = v24;

    uint64_t v29 = *(void *)(inited + 168);
    if (v29) {
      objc_storeWeak((id *)(v29 + 40), (id)inited);
    }
    id v30 = objc_msgSend_encryptedValueStore(self, v26, v27, v28);
    uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
    v35 = *(void **)(inited + 176);
    *(void *)(inited + 176) = v34;

    uint64_t v39 = *(void *)(inited + 176);
    if (v39) {
      objc_storeWeak((id *)(v39 + 40), (id)inited);
    }
    v40 = objc_msgSend_pluginFields(self, v36, v37, v38);
    objc_msgSend_setPluginFields_((void *)inited, v41, (uint64_t)v40, v42);
  }
  if (v6)
  {
    v43 = objc_msgSend_creationDate(self, v17, v18, v19);
    uint64_t v47 = objc_msgSend_copy(v43, v44, v45, v46);
    v48 = *(void **)(inited + 144);
    *(void *)(inited + 144) = v47;

    v52 = objc_msgSend_modificationDate(self, v49, v50, v51);
    uint64_t v56 = objc_msgSend_copy(v52, v53, v54, v55);
    v57 = *(void **)(inited + 160);
    *(void *)(inited + 160) = v56;

    v61 = objc_msgSend_creatorUserRecordID(self, v58, v59, v60);
    uint64_t v65 = objc_msgSend_copy(v61, v62, v63, v64);
    v66 = *(void **)(inited + 136);
    *(void *)(inited + 136) = v65;

    v70 = objc_msgSend_lastModifiedUserRecordID(self, v67, v68, v69);
    uint64_t v74 = objc_msgSend_copy(v70, v71, v72, v73);
    v75 = *(void **)(inited + 152);
    *(void *)(inited + 152) = v74;

    uint64_t v79 = objc_msgSend_modifiedByDevice(self, v76, v77, v78);
    v80 = *(void **)(inited + 320);
    *(void *)(inited + 320) = v79;

    v84 = objc_msgSend_etag(self, v81, v82, v83);
    uint64_t v88 = objc_msgSend_copy(v84, v85, v86, v87);
    v89 = *(void **)(inited + 16);
    *(void *)(inited + 16) = v88;

    v93 = objc_msgSend_conflictLoserEtags(self, v90, v91, v92);
    uint64_t v97 = objc_msgSend_CKDeepCopy(v93, v94, v95, v96);
    v98 = *(void **)(inited + 120);
    *(void *)(inited + 120) = v97;

    *(unsigned char *)(inited + 34) = objc_msgSend_isKnownToServer(self, v99, v100, v101);
    *(unsigned char *)(inited + 35) = objc_msgSend_wasCached(self, v102, v103, v104);
    *(unsigned char *)(inited + 30) = objc_msgSend_serializeProtectionData(self, v105, v106, v107);
    v111 = objc_msgSend_protectionData(self, v108, v109, v110);
    uint64_t v115 = objc_msgSend_copy(v111, v112, v113, v114);
    v116 = *(void **)(inited + 328);
    *(void *)(inited + 328) = v115;

    v120 = objc_msgSend_previousProtectionEtag(self, v117, v118, v119);
    uint64_t v124 = objc_msgSend_copy(v120, v121, v122, v123);
    v125 = *(void **)(inited + 208);
    *(void *)(inited + 208) = v124;

    v129 = objc_msgSend_protectionEtag(self, v126, v127, v128);
    uint64_t v133 = objc_msgSend_copy(v129, v130, v131, v132);
    v134 = *(void **)(inited + 216);
    *(void *)(inited + 216) = v133;

    v138 = objc_msgSend_zoneProtectionEtag(self, v135, v136, v137);
    uint64_t v142 = objc_msgSend_copy(v138, v139, v140, v141);
    v143 = *(void **)(inited + 224);
    *(void *)(inited + 224) = v142;

    v147 = objc_msgSend_shareEtag(self, v144, v145, v146);
    uint64_t v151 = objc_msgSend_copy(v147, v148, v149, v150);
    v152 = *(void **)(inited + 232);
    *(void *)(inited + 232) = v151;

    v156 = objc_msgSend_zoneishKeyID(self, v153, v154, v155);
    uint64_t v160 = objc_msgSend_copy(v156, v157, v158, v159);
    v161 = *(void **)(inited + 200);
    *(void *)(inited + 200) = v160;

    v165 = objc_msgSend_pcsKeyID(self, v162, v163, v164);
    uint64_t v169 = objc_msgSend_copy(v165, v166, v167, v168);
    v170 = *(void **)(inited + 248);
    *(void *)(inited + 248) = v169;

    v174 = objc_msgSend_allPCSKeyIDs(self, v171, v172, v173);
    uint64_t v178 = objc_msgSend_CKDeepCopy(v174, v175, v176, v177);
    v179 = *(void **)(inited + 96);
    *(void *)(inited + 96) = v178;

    *(unsigned char *)(inited + 37) = objc_msgSend_useLightweightPCS(self, v180, v181, v182);
    *(unsigned char *)(inited + 38) = objc_msgSend_wantsPublicSharingKey(self, v183, v184, v185);
    v189 = objc_msgSend_routingKey(self, v186, v187, v188);
    uint64_t v193 = objc_msgSend_copy(v189, v190, v191, v192);
    v194 = *(void **)(inited + 336);
    *(void *)(inited + 336) = v193;

    v198 = objc_msgSend_baseToken(self, v195, v196, v197);
    uint64_t v202 = objc_msgSend_copy(v198, v199, v200, v201);
    v203 = *(void **)(inited + 64);
    *(void *)(inited + 64) = v202;

    v207 = objc_msgSend_mutableEncryptedPSK(self, v204, v205, v206);
    uint64_t v211 = objc_msgSend_copy(v207, v208, v209, v210);
    v212 = *(void **)(inited + 72);
    *(void *)(inited + 72) = v211;

    v216 = objc_msgSend_displayedHostname(self, v213, v214, v215);
    uint64_t v220 = objc_msgSend_copy(v216, v217, v218, v219);
    v221 = *(void **)(inited + 80);
    *(void *)(inited + 80) = v220;

    v225 = objc_msgSend_mutableURL(self, v222, v223, v224);
    uint64_t v229 = objc_msgSend_copy(v225, v226, v227, v228);
    v230 = *(void **)(inited + 304);
    *(void *)(inited + 304) = v229;

    v234 = objc_msgSend_share(self, v231, v232, v233);
    uint64_t v238 = objc_msgSend_copy(v234, v235, v236, v237);
    v239 = *(void **)(inited + 48);
    *(void *)(inited + 48) = v238;

    v243 = objc_msgSend_previousShare(self, v240, v241, v242);
    uint64_t v247 = objc_msgSend_copy(v243, v244, v245, v246);
    v248 = *(void **)(inited + 256);
    *(void *)(inited + 256) = v247;

    *(unsigned char *)(inited + 32) = objc_msgSend_hasUpdatedShare(self, v249, v250, v251);
    v255 = objc_msgSend_parent(self, v252, v253, v254);
    uint64_t v259 = objc_msgSend_copy(v255, v256, v257, v258);
    v260 = *(void **)(inited + 56);
    *(void *)(inited + 56) = v259;

    v264 = objc_msgSend_previousParent(self, v261, v262, v263);
    uint64_t v268 = objc_msgSend_copy(v264, v265, v266, v267);
    v269 = *(void **)(inited + 264);
    *(void *)(inited + 264) = v268;

    *(unsigned char *)(inited + 33) = objc_msgSend_hasUpdatedParent(self, v270, v271, v272);
    v276 = objc_msgSend_chainPrivateKey(self, v273, v274, v275);
    uint64_t v280 = objc_msgSend_copy(v276, v277, v278, v279);
    v281 = *(void **)(inited + 272);
    *(void *)(inited + 272) = v280;

    v285 = objc_msgSend_chainProtectionInfo(self, v282, v283, v284);
    uint64_t v289 = objc_msgSend_copy(v285, v286, v287, v288);
    v290 = *(void **)(inited + 280);
    *(void *)(inited + 280) = v289;

    v294 = objc_msgSend_chainParentPublicKeyID(self, v291, v292, v293);
    uint64_t v298 = objc_msgSend_copy(v294, v295, v296, v297);
    v299 = *(void **)(inited + 288);
    *(void *)(inited + 288) = v298;

    *(unsigned char *)(inited + 36) = objc_msgSend_wantsChainPCS(self, v300, v301, v302);
    v306 = objc_msgSend_tombstonedPublicKeyIDs(self, v303, v304, v305);
    uint64_t v310 = objc_msgSend_CKDeepCopy(v306, v307, v308, v309);
    v311 = *(void **)(inited + 104);
    *(void *)(inited + 104) = v310;

    *(unsigned char *)(inited + 24) = objc_msgSend_trackChanges(self, v312, v313, v314);
    v318 = objc_msgSend_expirationDate(self, v315, v316, v317);
    uint64_t v322 = objc_msgSend_copy(v318, v319, v320, v321);
    v323 = *(void **)(inited + 192);
    *(void *)(inited + 192) = v322;

    *(unsigned char *)(inited + 28) = objc_msgSend_isExpired(self, v324, v325, v326);
    *(unsigned char *)(inited + 27) = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v327, v328, v329);
    v333 = objc_msgSend_updatedExpirationTimeInterval(self, v330, v331, v332);
    uint64_t v337 = objc_msgSend_copy(v333, v334, v335, v336);
    v338 = *(void **)(inited + 184);
    *(void *)(inited + 184) = v337;

    *(unsigned char *)(inited + 25) = objc_msgSend_needsRollAndCounterSign(self, v339, v340, v341);
    v345 = objc_msgSend_pcsKeysToRemove(self, v342, v343, v344);
    uint64_t v349 = objc_msgSend_copy(v345, v346, v347, v348);
    v350 = *(void **)(inited + 296);
    *(void *)(inited + 296) = v349;
  }
  return (id)inited;
}

- (id)copyWithOriginalValues
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend_setTrackChanges_(v4, v5, 0, v6);
  objc_msgSend_valueStore(v4, v7, v8, v9);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v13 = objc_msgSend_valueStore(v4, v10, v11, v12);
  uint64_t v17 = objc_msgSend_originalValues(v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v85, (uint64_t)v90, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v86;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v86 != v23) {
          objc_enumerationMutation(v17);
        }
        uint64_t v25 = *(void *)(*((void *)&v85 + 1) + 8 * v24);
        uint64_t v26 = objc_msgSend_valueStore(v4, v19, v20, v21);
        id v30 = objc_msgSend_originalValues(v26, v27, v28, v29);
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v30, v31, v25, v32);

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setObject_forKeyedSubscript_(v4, v34, 0, v25);
        }
        else {
          objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v33, v25);
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v85, (uint64_t)v90, 16);
    }
    while (v22);
  }

  objc_sync_exit(obj);
  objc_msgSend_encryptedValueStore(v4, v35, v36, v37);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obja);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v41 = objc_msgSend_encryptedValueStore(v4, v38, v39, v40);
  uint64_t v45 = objc_msgSend_originalValues(v41, v42, v43, v44);

  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v81, (uint64_t)v89, 16);
  if (v50)
  {
    uint64_t v51 = *(void *)v82;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v82 != v51) {
          objc_enumerationMutation(v45);
        }
        uint64_t v53 = *(void *)(*((void *)&v81 + 1) + 8 * v52);
        uint64_t v54 = objc_msgSend_encryptedValueStore(v4, v47, v48, v49);
        v58 = objc_msgSend_originalValues(v54, v55, v56, v57);
        v61 = objc_msgSend_objectForKeyedSubscript_(v58, v59, v53, v60);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v65 = objc_msgSend_encryptedValues(v4, v62, v63, v64);
          objc_msgSend_setObject_forKeyedSubscript_(v65, v66, 0, v53);
        }
        else
        {
          uint64_t v65 = objc_msgSend_encryptedValueStore(v4, v62, v63, v64);
          objc_msgSend_setRawValue_forKey_(v65, v67, (uint64_t)v61, v53);
        }

        ++v52;
      }
      while (v50 != v52);
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v81, (uint64_t)v89, 16);
    }
    while (v50);
  }

  objc_sync_exit(obja);
  uint64_t v71 = objc_msgSend_trackChanges(self, v68, v69, v70);
  objc_msgSend_setTrackChanges_(v4, v72, v71, v73);
  objc_msgSend_resetChangedKeys(v4, v74, v75, v76);
  return v4;
}

- (id)_copyWithOptions:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_recordID(self, a2, a3, v3);
  uint64_t v8 = objc_msgSend_copyWithZone_recordID_userFields_systemFields_(self, v7, 0, (uint64_t)v6, ((unint64_t)a3 >> 1) & 1, a3 & 1);

  return v8;
}

+ (CKRecord)recordWithDuplicatedPackagesOfRecord:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_copy(v5, v6, v7, v8);
  objc_msgSend_setTrackChanges_(v9, v10, 0, v11);
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_18AF13DD8;
  uint64_t v39 = sub_18AF138E8;
  id v40 = 0;
  uint64_t v15 = objc_msgSend_valueStore(v5, v12, v13, v14);
  v41[0] = objc_opt_class();
  uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v41, 1);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  id v31 = sub_18B0A78E4;
  uint64_t v32 = &unk_1E5463878;
  uint64_t v34 = &v35;
  id v18 = v9;
  id v33 = v18;
  int v20 = objc_msgSend_containsValueOfClasses_passingTest_(v15, v19, (uint64_t)v17, (uint64_t)&v29);

  if (v20)
  {
    id v24 = 0;
    if (a4) {
      *a4 = (id) v36[5];
    }
  }
  else
  {
    uint64_t v25 = objc_msgSend_trackChanges(v5, v21, v22, v23, v29, v30, v31, v32);
    objc_msgSend_setTrackChanges_(v18, v26, v25, v27);
    id v24 = v18;
  }

  _Block_object_dispose(&v35, 8);

  return (CKRecord *)v24;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_recordType(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"recordType");

  uint64_t v12 = objc_msgSend_recordID(self, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, @"recordID");

  uint64_t v17 = objc_msgSend_properties(v3, v14, v15, v16);

  return (CKRoughlyEquivalentProperties *)v17;
}

- (CKRecordType)recordType
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_recordType;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecordType:(id)a3
{
  BOOL v4 = (NSString *)a3;
  id obj = self;
  objc_sync_enter(obj);
  recordType = obj->_recordType;
  obj->_recordType = v4;

  objc_sync_exit(obj);
}

- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (!a4)
  {
    uint64_t v11 = objc_msgSend_etag(v6, v7, v8, v9);

    if (v11)
    {
      uint64_t v15 = objc_msgSend_etag(v10, v12, v13, v14);
      objc_msgSend_setEtag_(self, v16, (uint64_t)v15, v17);
    }
    id v18 = objc_msgSend_creationDate(v10, v12, v13, v14);

    if (v18)
    {
      uint64_t v22 = objc_msgSend_creationDate(v10, v19, v20, v21);
      objc_msgSend_setCreationDate_(self, v23, (uint64_t)v22, v24);
    }
    uint64_t v25 = objc_msgSend_modificationDate(v10, v19, v20, v21);

    if (v25)
    {
      uint64_t v29 = objc_msgSend_modificationDate(v10, v26, v27, v28);
      objc_msgSend_setModificationDate_(self, v30, (uint64_t)v29, v31);
    }
    uint64_t v32 = objc_msgSend_signingPCSIdentityData(v10, v26, v27, v28);

    if (v32)
    {
      uint64_t v36 = objc_msgSend_signingPCSIdentityData(v10, v33, v34, v35);
      uint64_t v37 = (const void *)PCSIdentityCreateFromRaw();

      if (v37)
      {
        objc_msgSend_setSigningPCSIdentity_(self, v33, (uint64_t)v37, v35);
        CFRelease(v37);
      }
    }
    uint64_t v38 = objc_msgSend_serverRecord(v10, v33, v34, v35);
    uint64_t v42 = objc_msgSend_expirationDate(v10, v39, v40, v41);
    objc_msgSend_setExpirationDate_(self, v43, (uint64_t)v42, v44);

    objc_msgSend_setHasUpdatedExpirationTimeInterval_(self, v45, 0, v46);
    objc_msgSend_setUpdatedExpirationTimeInterval_(self, v47, 0, v48);
    uint64_t v52 = objc_msgSend_pluginFields(v38, v49, v50, v51);
    objc_msgSend_setPluginFields_(self, v53, (uint64_t)v52, v54);

    v58 = objc_msgSend_creatorUserRecordID(v38, v55, v56, v57);
    objc_msgSend_setCreatorUserRecordID_(self, v59, (uint64_t)v58, v60);

    uint64_t v64 = objc_msgSend_lastModifiedUserRecordID(v38, v61, v62, v63);
    objc_msgSend_setLastModifiedUserRecordID_(self, v65, (uint64_t)v64, v66);

    uint64_t v70 = objc_msgSend_modifiedByDevice(v38, v67, v68, v69);
    objc_msgSend_setModifiedByDevice_(self, v71, (uint64_t)v70, v72);

    uint64_t v76 = objc_msgSend_routingKey(v38, v73, v74, v75);
    objc_msgSend_setRoutingKey_(self, v77, (uint64_t)v76, v78);

    long long v82 = objc_msgSend_mutableEncryptedPSK(v38, v79, v80, v81);
    objc_msgSend_setMutableEncryptedPSK_(self, v83, (uint64_t)v82, v84);

    long long v88 = objc_msgSend_displayedHostname(v38, v85, v86, v87);
    objc_msgSend_setDisplayedHostname_(self, v89, (uint64_t)v88, v90);

    v94 = objc_msgSend_chainParentPublicKeyID(v38, v91, v92, v93);
    objc_msgSend_setChainParentPublicKeyID_(self, v95, (uint64_t)v94, v96);

    uint64_t v100 = objc_msgSend_chainProtectionInfo(v38, v97, v98, v99);
    objc_msgSend_setChainProtectionInfo_(self, v101, (uint64_t)v100, v102);

    uint64_t v106 = objc_msgSend_chainPrivateKey(v38, v103, v104, v105);
    objc_msgSend_setChainPrivateKey_(self, v107, (uint64_t)v106, v108);

    v112 = objc_msgSend_share(v38, v109, v110, v111);
    objc_msgSend_setShare_(self, v113, (uint64_t)v112, v114);

    objc_msgSend_updateMergeablesForSuccessfulSave(self, v115, v116, v117);
    objc_msgSend_copyStreamingAssetServerFieldsFromServerRecord_(self, v118, (uint64_t)v38, v119);
    objc_msgSend_setKnownToServer_(self, v120, 1, v121);
    objc_msgSend_resetChangedKeys(self, v122, v123, v124);
  }
  v125 = objc_msgSend_protectionData(v10, v7, v8, v9);
  objc_msgSend_setProtectionData_(self, v126, (uint64_t)v125, v127);

  uint64_t v131 = objc_msgSend_pcsKeyID(v10, v128, v129, v130);
  objc_msgSend_setPcsKeyID_(self, v132, (uint64_t)v131, v133);

  uint64_t v137 = objc_msgSend_allPCSKeyIDs(v10, v134, v135, v136);
  objc_msgSend_setAllPCSKeyIDs_(self, v138, (uint64_t)v137, v139);

  v143 = objc_msgSend_zoneishKeyID(v10, v140, v141, v142);
  objc_msgSend_setZoneishKeyID_(self, v144, (uint64_t)v143, v145);
}

- (void)updateMergeablesForSuccessfulSave
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = objc_opt_class();
  BOOL v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v6, 1);
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)&unk_1ED7F02D8);
}

- (void)copyStreamingAssetServerFieldsFromServerRecord:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v8 = objc_msgSend_allKeys(v4, v5, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v57, (uint64_t)v65, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v54 = *(void *)v58;
    uint64_t v14 = off_1E545F000;
    uint64_t v52 = self;
    uint64_t v53 = v8;
    do
    {
      uint64_t v15 = 0;
      do
      {
        uint64_t v16 = v14;
        if (*(void *)v58 != v54) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v57 + 1) + 8 * v15);
        id v18 = objc_msgSend_objectForKeyedSubscript_(v4, v11, v17, v12);
        uint64_t v22 = v18;
        if (v18)
        {
          id v23 = v18;
        }
        else
        {
          uint64_t v24 = objc_msgSend_encryptedValues(v4, v19, v20, v21);
          objc_msgSend_objectForKeyedSubscript_(v24, v25, v17, v26);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v14 = v16;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_objectForKeyedSubscript_(self, v27, v17, v28);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            uint64_t v46 = (void *)ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              uint64_t v47 = v46;
              uint64_t v51 = objc_msgSend_recordID(v4, v48, v49, v50);
              *(_DWORD *)buf = 138543618;
              uint64_t v62 = v17;
              __int16 v63 = 2112;
              uint64_t v64 = v51;
              _os_log_impl(&dword_18AF10000, v47, OS_LOG_TYPE_INFO, "Trying to copy streaming asset info from %{public}@ on %@, but there is no local value", buf, 0x16u);

              uint64_t v8 = v53;
            }
            goto LABEL_23;
          }
          objc_msgSend_copyServerFieldsFromStreamingAsset_(v29, v30, (uint64_t)v23, v31);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          objc_msgSend_objectForKeyedSubscript_(self, v32, v17, v33);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v34 = v23;
            id v29 = v29;
            uint64_t v38 = objc_msgSend_firstObject(v34, v35, v36, v37);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_17;
            }
            uint64_t v42 = objc_msgSend_firstObject(v29, v39, v40, v41);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            uint64_t v8 = v53;
            if (isKindOfClass)
            {
              v55[0] = MEMORY[0x1E4F143A8];
              v55[1] = 3221225472;
              v55[2] = sub_18B0A83B0;
              v55[3] = &unk_1E54638C0;
              id v56 = v29;
              objc_msgSend_enumerateObjectsUsingBlock_(v34, v44, (uint64_t)v55, v45);
              uint64_t v38 = v56;
LABEL_17:
            }
            self = v52;
LABEL_23:
            uint64_t v14 = v16;
          }
        }

LABEL_25:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v57, (uint64_t)v65, 16);
    }
    while (v13);
  }
}

- (NSString)baseToken
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_baseToken;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBaseToken:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((CKObjectsAreBothNilOrEqual(v4->_baseToken, v12) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_copy(v12, v5, v6, v7);
    baseToken = v4->_baseToken;
    v4->_baseToken = (NSString *)v8;

    objc_msgSend_setMutableURL_(v4, v10, 0, v11);
  }
  objc_sync_exit(v4);
}

- (CKEncryptedData)mutableEncryptedPSK
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_mutableEncryptedPSK;
  objc_sync_exit(v2);

  return v3;
}

- (void)setMutableEncryptedPSK:(id)a3
{
  id v23 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_data(v23, v5, v6, v7);
  id v12 = objc_msgSend_data(v4->_mutableEncryptedPSK, v9, v10, v11);
  char isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);

  if ((isEqualToData & 1) == 0)
  {
    uint64_t v19 = objc_msgSend_copy(v23, v16, v17, v18);
    mutableEncryptedPSK = v4->_mutableEncryptedPSK;
    v4->_mutableEncryptedPSK = (CKEncryptedData *)v19;

    objc_msgSend_setMutableURL_(v4, v21, 0, v22);
  }
  objc_sync_exit(v4);
}

- (void)setMutableEncryptedPublicSharingKeyData:(id)a3
{
  id v16 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend_length(v16, v5, v6, v7))
  {
    uint64_t v10 = [CKEncryptedData alloc];
    uint64_t v13 = objc_msgSend_initWithData_(v10, v11, (uint64_t)v16, v12);
    objc_msgSend_setMutableEncryptedPSK_(v4, v14, (uint64_t)v13, v15);
  }
  else
  {
    objc_msgSend_setMutableEncryptedPSK_(v4, v8, 0, v9);
  }
  objc_sync_exit(v4);
}

- (NSData)mutableEncryptedPublicSharingKeyData
{
  id v4 = objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);

  return (NSData *)v8;
}

+ (id)fullTokenFromBaseToken:(id)a3 privateToken:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = v6;
  if (v6)
  {
    if (v5)
    {
      v24[0] = v5;
      v24[1] = v6;
      uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v24, 2);
      uint64_t v12 = objc_msgSend_componentsJoinedByString_(v9, v10, (uint64_t)&stru_1ED7F5C98, v11);
    }
    else
    {
      __int16 v23 = 0;
      int v22 = 16;
      uint64_t v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v7, (uint64_t)&v22, 3);
      uint64_t v9 = objc_msgSend_CKBase64URLSafeString(v13, v14, v15, v16);

      v25[0] = v9;
      v25[1] = v8;
      uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v25, 2);
      uint64_t v12 = objc_msgSend_componentsJoinedByString_(v18, v19, (uint64_t)&stru_1ED7F5C98, v20);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSData)encryptedPublicSharingKey
{
  id v4 = objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  return (NSData *)v12;
}

- (NSString)privateToken
{
  id v4 = objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_CKBase64URLSafeString(v8, v9, v10, v11);

  return (NSString *)v12;
}

- (NSString)fullToken
{
  id v5 = objc_msgSend_baseToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_privateToken(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_fullTokenFromBaseToken_privateToken_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);

  return (NSString *)v11;
}

- (NSData)shortSharingTokenData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_fullToken(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = (const void *)objc_msgSend_UTF8String(v4, v5, v6, v7, 0, 0, 0, 0);
    CC_LONG v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v8, v10, 4, v11);
    CC_SHA256(v9, v12, (unsigned __int8 *)&v16);
    uint64_t v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v13, (uint64_t)&v16, 16);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return (NSData *)v14;
}

- (id)shortSharingToken
{
  id v4 = objc_msgSend_shortSharingTokenData(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);

  return v8;
}

- (NSData)shortSharingTokenHashData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_shortSharingToken(self, a2, v2, v3);
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

- (NSData)encryptedFullTokenData
{
  id v5 = objc_msgSend_fullToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_shortSharingTokenData(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_encryptFullToken_shortSharingTokenData_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);

  return (NSData *)v11;
}

+ (id)encryptFullToken:(id)a3 shortSharingTokenData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12) == 16)
  {
    uint64_t v15 = objc_msgSend_dataUsingEncoding_(v5, v13, 4, v14);
    long long v16 = (void *)PCSCloudKitShareTokenCopyEncryptedData();
    if (v16)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        int v22 = 138543618;
        id v23 = v16;
        __int16 v24 = 2114;
        id v25 = v6;
        _os_log_impl(&dword_18AF10000, v17, OS_LOG_TYPE_INFO, "Successfully encrypted fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
      }
      id v18 = v16;
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v20 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138543618;
        id v23 = v5;
        __int16 v24 = 2114;
        id v25 = v6;
        _os_log_error_impl(&dword_18AF10000, v20, OS_LOG_TYPE_ERROR, "Failed to encrypt fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v19 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v22 = 138543618;
      id v23 = v5;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_18AF10000, v19, OS_LOG_TYPE_INFO, "Warn: Invalid arguments - fullToken:%{public}@, shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
    }
    long long v16 = 0;
  }

  return v16;
}

+ (id)decryptFullToken:(id)a3 shortSharingTokenData:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12) == 16)
  {
    uint64_t v13 = (void *)PCSCloudKitShareTokenCopyDecryptedData();
    if (v13)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v14 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        int v19 = 138543618;
        id v20 = v13;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_18AF10000, v14, OS_LOG_TYPE_INFO, "Successfully decrypted fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
      }
      id v15 = v13;
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138543618;
        id v20 = v5;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Failed to decrypt fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v16 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v19 = 138543618;
      id v20 = v5;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_18AF10000, v16, OS_LOG_TYPE_INFO, "Warn: Invalid arguments - encryptedFullTokenData:%{public}@, shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)decryptFullToken:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shortSharingTokenData(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_decryptFullToken_shortSharingTokenData_(CKRecord, v9, (uint64_t)v4, (uint64_t)v8);

  id v11 = [NSString alloc];
  uint64_t v15 = objc_msgSend_bytes(v10, v12, v13, v14);
  uint64_t v19 = objc_msgSend_length(v10, v16, v17, v18);
  __int16 v21 = objc_msgSend_initWithBytes_length_encoding_(v11, v20, v15, v19, 4);

  return v21;
}

- (NSString)shortToken
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_shortSharingToken(self, a2, v2, v3);
  if (!v8)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v23 = (void *)ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    __int16 v24 = v23;
    uint64_t v28 = objc_msgSend_recordID(self, v25, v26, v27);
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v28;
    _os_log_error_impl(&dword_18AF10000, v24, OS_LOG_TYPE_ERROR, "Couldn't get a short sharing token for %@", buf, 0xCu);

    goto LABEL_16;
  }
  uint64_t v9 = objc_msgSend_routingKey(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);

  if (v13 == 3)
  {
    uint64_t v17 = objc_msgSend_routingKey(self, v14, v15, v16);
    v39[0] = v17;
    v39[1] = v8;
    uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v39, 2);
    id v22 = objc_msgSend_componentsJoinedByString_(v19, v20, (uint64_t)&stru_1ED7F5C98, v21);

    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v29 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = v29;
    id v34 = objc_msgSend_routingKey(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_recordID(self, v35, v36, v37);
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v34;
    __int16 v42 = 2112;
    uint64_t v43 = v38;
    _os_log_error_impl(&dword_18AF10000, v24, OS_LOG_TYPE_ERROR, "Routing key is invalid: \"%{public}@\" for %@", buf, 0x16u);

LABEL_16:
  }
LABEL_11:
  id v22 = 0;
LABEL_12:

  return (NSString *)v22;
}

+ (id)shareURLWithShortToken:(id)a3 shareTitle:(id)a4 shareType:(id)a5 containerID:(id)a6 displayedHostname:(id)a7
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v20 = a7;
  if (!v13)
  {
    uint64_t v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, (uint64_t)a1, @"CKRecord.m", 1508, @"ShareURL cannot be created without short token. Share: %@", a1);
  }
  uint64_t v46 = v16;
  uint64_t v47 = v15;
  uint64_t v21 = CKSharingContainerSlugForContainerID(v16, v14, v15);
  id v25 = objc_msgSend_CKMangledDocumentNameForURLFragment(v14, v22, v23, v24);
  v52[0] = &stru_1ED7F5C98;
  v52[1] = v21;
  v52[2] = v13;
  uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v52, 3);
  uint64_t v30 = objc_msgSend_componentsJoinedByString_(v27, v28, @"/", v29);
  id v31 = objc_alloc_init(MEMORY[0x1E4F29088]);
  objc_msgSend_setScheme_(v31, v32, @"https", v33);
  if (v20) {
    objc_msgSend_setHost_(v31, v34, (uint64_t)v20, v35);
  }
  else {
    objc_msgSend_setHost_(v31, v34, @"www.icloud.com", v35);
  }
  objc_msgSend_setPercentEncodedPath_(v31, v36, (uint64_t)v30, v37);
  if (v25 && objc_msgSend_length(v25, v38, v39, v40)) {
    objc_msgSend_setPercentEncodedFragment_(v31, v38, (uint64_t)v25, v40);
  }
  uint64_t v41 = objc_msgSend_URL(v31, v38, v39, v40);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  __int16 v42 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v49 = v41;
    __int16 v50 = 2112;
    id v51 = v31;
    _os_log_debug_impl(&dword_18AF10000, v42, OS_LOG_TYPE_DEBUG, "Share URL: %@ (%@)", buf, 0x16u);
  }

  return v41;
}

- (NSURL)uncachedURL
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_data(v5, v6, v7, v8);
  if (v9)
  {
    id v13 = (void *)v9;
    id v14 = objc_msgSend_routingKey(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

    if (v18)
    {
      id v22 = objc_msgSend_shortToken(self, v19, v20, v21);
      uint64_t v26 = objc_msgSend_CKSafeStringForURLPathComponent(v22, v23, v24, v25);

      if (v26)
      {
        uint64_t v27 = objc_opt_class();
        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(self, v28, @"cloudkit.title", v29);
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(self, v31, @"cloudkit.type", v32);
        uint64_t v37 = objc_msgSend_containerID(self, v34, v35, v36);
        uint64_t v41 = objc_msgSend_displayedHostname(self, v38, v39, v40);
        uint64_t v43 = objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v27, v42, (uint64_t)v26, (uint64_t)v30, v33, v37, v41);
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v45 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = v45;
          id v51 = objc_msgSend_recordID(self, v48, v49, v50);
          int v52 = 138412290;
          uint64_t v53 = v51;
          _os_log_error_impl(&dword_18AF10000, v47, OS_LOG_TYPE_ERROR, "Failed to get the shortToken for %@", (uint8_t *)&v52, 0xCu);
        }
        uint64_t v43 = 0;
      }

      goto LABEL_17;
    }
  }
  else
  {
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v44 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v52) = 0;
    _os_log_error_impl(&dword_18AF10000, v44, OS_LOG_TYPE_ERROR, "You cannot get the URL of a share until it's been saved to the server", (uint8_t *)&v52, 2u);
  }
  uint64_t v43 = 0;
LABEL_17:

  return (NSURL *)v43;
}

- (NSURL)URL
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v9 = objc_msgSend_mutableURL(v2, v3, v4, v5);
  if (!v9)
  {
    uint64_t v9 = objc_msgSend_uncachedURL(v2, v6, v7, v8);
    objc_msgSend_setMutableURL_(v2, v10, (uint64_t)v9, v11);
  }
  objc_sync_exit(v2);

  return (NSURL *)v9;
}

- (NSString)displayedHostname
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_displayedHostname;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDisplayedHostname:(id)a3
{
  id v12 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if ((CKObjectsAreBothNilOrEqual(v4->_displayedHostname, v12) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_copy(v12, v5, v6, v7);
    displayedHostname = v4->_displayedHostname;
    v4->_displayedHostname = (NSString *)v8;

    objc_msgSend_setMutableURL_(v4, v10, 0, v11);
  }
  objc_sync_exit(v4);
}

- (BOOL)canHostServerURLInfo
{
  return 1;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_description(self, v4, v5, v6);
  objc_msgSend_appendString_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_appendString_(v3, v10, @"\n{\n", v11);
  if (objc_msgSend_permission(self, v12, v13, v14) == 2) {
    objc_msgSend_appendFormat_(v3, v15, @"\tREAD-ONLY\n", v17);
  }
  if (objc_msgSend_isMergeableValueDeltaRecord(self, v15, v16, v17)) {
    objc_msgSend_appendFormat_(v3, v18, @"\tMERGEABLE DELTA PARTIAL RECORD\n", v20);
  }
  uint64_t v21 = objc_msgSend_creatorUserRecordID(self, v18, v19, v20);
  objc_msgSend_appendFormat_(v3, v22, @"\tcreatorUserRecordID -> %@\n", v23, v21);

  uint64_t v27 = objc_msgSend_lastModifiedUserRecordID(self, v24, v25, v26);
  objc_msgSend_appendFormat_(v3, v28, @"\tlastModifiedUserRecordID -> %@\n", v29, v27);

  uint64_t v33 = objc_msgSend_creationDate(self, v30, v31, v32);
  objc_msgSend_appendFormat_(v3, v34, @"\tcreationDate -> %@\n", v35, v33);

  uint64_t v39 = objc_msgSend_modificationDate(self, v36, v37, v38);
  objc_msgSend_appendFormat_(v3, v40, @"\tmodificationDate -> %@\n", v41, v39);

  uint64_t v48 = objc_msgSend_expirationDate(self, v42, v43, v44);
  if (v48)
  {
    int isExpired = objc_msgSend_isExpired(self, v45, v46, v47);
    int v52 = @" (expired)";
    if (!isExpired) {
      int v52 = &stru_1ED7F5C98;
    }
    objc_msgSend_appendFormat_(v3, v50, @"\texpirationDate -> %@%@\n", v51, v48, v52);
  }
  uint64_t v53 = objc_msgSend_protectionData(self, v45, v46, v47);
  long long v57 = (void *)v53;
  if (v53) {
    objc_msgSend_appendFormat_(v3, v54, @"\tprotectionData -> %@\n", v56, v53);
  }
  uint64_t v110 = v57;
  long long v58 = objc_msgSend_pcsKeysToRemove(self, v54, v55, v56);

  if (v58)
  {
    uint64_t v62 = objc_msgSend_pcsKeysToRemove(self, v59, v60, v61);
    objc_msgSend_appendFormat_(v3, v63, @"\tpcsKeysToRemove -> %@\n", v64, v62);
  }
  uint64_t v65 = objc_msgSend_modifiedByDevice(self, v59, v60, v61);
  if (objc_msgSend_length(v65, v66, v67, v68)) {
    objc_msgSend_appendFormat_(v3, v69, @"\tmodifiedByDevice -> %@\n", v71, v65);
  }
  uint64_t v72 = objc_msgSend_conflictLoserEtags(self, v69, v70, v71);
  uint64_t v76 = (void *)v72;
  if (v72) {
    objc_msgSend_appendFormat_(v3, v73, @"\tconflictLoserEtags -> %@\n", v75, v72);
  }
  uint64_t v77 = objc_msgSend_tombstonedPublicKeyIDs(self, v73, v74, v75);
  uint64_t v81 = (void *)v77;
  if (v77) {
    objc_msgSend_appendFormat_(v3, v78, @"\ttombstonedPublicKeyIDs -> %@\n", v80, v77);
  }
  long long v85 = objc_msgSend_share(self, v78, v79, v80);
  if (v85)
  {
    if (objc_msgSend_hasUpdatedShare(self, v82, v83, v84)) {
      objc_msgSend_appendFormat_(v3, v86, @"\tshare -> %@%@\n", v87, v85, @" (updated)");
    }
    else {
      objc_msgSend_appendFormat_(v3, v86, @"\tshare -> %@%@\n", v87, v85, &stru_1ED7F5C98);
    }
  }
  uint64_t v91 = objc_msgSend_parent(self, v82, v83, v84);
  if (v91)
  {
    if (objc_msgSend_hasUpdatedParent(self, v88, v89, v90)) {
      objc_msgSend_appendFormat_(v3, v92, @"\tparent-> %@%@\n", v93, v91, @" (updated)");
    }
    else {
      objc_msgSend_appendFormat_(v3, v92, @"\tparent-> %@%@\n", v93, v91, &stru_1ED7F5C98);
    }
  }
  uint64_t v111 = (void *)v48;
  if (objc_msgSend_needsRollAndCounterSign(self, v88, v89, v90)) {
    objc_msgSend_appendFormat_(v3, v94, @"\tneedsRollAndCounterSign -> YES\n", v95);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B0A9F44;
  aBlock[3] = &unk_1E54638E8;
  id v96 = v3;
  id v113 = v96;
  uint64_t v97 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v101 = objc_msgSend_valueStore(self, v98, v99, v100);
  v97[2](v97, v101, 0);

  uint64_t v105 = objc_msgSend_encryptedValueStore(self, v102, v103, v104);
  ((void (**)(void *, void *, __CFString *))v97)[2](v97, v105, @"encrypted");

  objc_msgSend_appendString_(v96, v106, @"}", v107);
  id v108 = v96;

  return (NSString *)v108;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v85 = a3;
  uint64_t v7 = objc_msgSend_recordType(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v85, v8, @"recordType", (uint64_t)v7, 0);

  id v12 = objc_msgSend_recordID(self, v9, v10, v11);
  objc_msgSend_addProperty_value_shouldRedact_(v85, v13, @"recordID", (uint64_t)v12, 0);

  uint64_t v17 = objc_msgSend_recordChangeTag(self, v14, v15, v16);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v18, @"recordChangeTag", (uint64_t)v17, 0);

  uint64_t isMergeableValueDeltaRecord = objc_msgSend_isMergeableValueDeltaRecord(self, v19, v20, v21);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v85, v23, @"isMergeableDeltaPartialRecord", isMergeableValueDeltaRecord, 0);
  uint64_t v27 = objc_msgSend_needsRollAndCounterSign(self, v24, v25, v26);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v85, v28, @"needsRollAndCounterSign", v27, 0);
  uint64_t v32 = objc_msgSend_mutableEncryptedPSK(self, v29, v30, v31);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v33, @"mutableEncryptedPSK", (uint64_t)v32, 0);

  uint64_t v37 = objc_msgSend_routingKey(self, v34, v35, v36);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v38, @"routingKey", (uint64_t)v37, 0);

  uint64_t v45 = objc_msgSend_share(self, v39, v40, v41);
  if (v45 || objc_msgSend_hasUpdatedShare(self, v42, v43, v44)) {
    objc_msgSend_addProperty_value_shouldRedact_(v85, v42, @"share", (uint64_t)v45, 0);
  }
  uint64_t v51 = objc_msgSend_parent(self, v42, v46, v47);
  if (v51 || objc_msgSend_hasUpdatedParent(self, v48, v49, v50)) {
    objc_msgSend_addProperty_value_shouldRedact_(v85, v48, @"parent", (uint64_t)v51, 0);
  }
  objc_msgSend_valueStore(self, v48, v52, v53);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v54);
  long long v58 = objc_msgSend_values(v54, v55, v56, v57);
  uint64_t v62 = objc_msgSend_count(v58, v59, v60, v61);

  if (v62)
  {
    uint64_t v66 = objc_msgSend_values(v54, v63, v64, v65);
    objc_msgSend_addProperty_value_shouldRedact_(v85, v67, @"values", (uint64_t)v66, 1);
  }
  objc_sync_exit(v54);

  objc_msgSend_encryptedValueStore(self, v68, v69, v70);
  id v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v71);
  uint64_t v75 = objc_msgSend_values(v71, v72, v73, v74);
  uint64_t v79 = objc_msgSend_count(v75, v76, v77, v78);

  if (v79)
  {
    uint64_t v83 = objc_msgSend_values(v71, v80, v81, v82);
    objc_msgSend_addProperty_value_shouldRedact_(v85, v84, @"encryptedValues", (uint64_t)v83, 1);
  }
  objc_sync_exit(v71);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v12 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 5, a4);
  if (v6)
  {
    uint64_t v13 = objc_msgSend_recordType(self, v9, v10, v11);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v14, @"recordType", (uint64_t)v13);

    uint64_t v18 = objc_msgSend_recordID(self, v15, v16, v17);
    id v22 = objc_msgSend_ckShortDescription(v18, v19, v20, v21);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v23, @"recordID", (uint64_t)v22);

    uint64_t v30 = objc_msgSend_recordChangeTag(self, v24, v25, v26);
    if (v30) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v27, @"recordChangeTag", (uint64_t)v30);
    }
    if (objc_msgSend_isMergeableValueDeltaRecord(self, v27, v28, v29)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v31, @"isMergeableDeltaPartialRecord", (uint64_t)&unk_1ED8467C8);
    }
    uint64_t v37 = objc_msgSend_share(self, v31, v32, v33);
    if (v37 || objc_msgSend_hasUpdatedShare(self, v34, v35, v36)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v34, @"share", (uint64_t)v37);
    }
    uint64_t v43 = objc_msgSend_parent(self, v34, v38, v39);
    if (v43 || objc_msgSend_hasUpdatedParent(self, v40, v41, v42)) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v40, @"parent", (uint64_t)v43);
    }
    objc_msgSend_valueStore(self, v40, v44, v45);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v46);
    uint64_t v50 = objc_msgSend_values(v46, v47, v48, v49);
    uint64_t v54 = objc_msgSend_count(v50, v51, v52, v53);

    if (v54)
    {
      uint64_t v56 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v46, v55, v7, 1, v5);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v57, @"values", (uint64_t)v56);
    }
    objc_sync_exit(v46);

    objc_msgSend_encryptedValueStore(self, v58, v59, v60);
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v61);
    uint64_t v65 = objc_msgSend_values(v61, v62, v63, v64);
    uint64_t v69 = objc_msgSend_count(v65, v66, v67, v68);

    if (v69)
    {
      id v71 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v61, v70, v7, 1, v5);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v72, @"encryptedValues", (uint64_t)v71);
    }
    objc_sync_exit(v61);
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecord *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecord *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)conciseDescription
{
  id v3 = [NSString alloc];
  BOOL v7 = objc_msgSend_recordType(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_recordID(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_ckShortDescription(v11, v12, v13, v14);
  if (objc_msgSend_isMergeableValueDeltaRecord(self, v16, v17, v18)) {
    id v22 = @" isMergeableDeltaPartialRecord=1";
  }
  else {
    id v22 = &stru_1ED7F5C98;
  }
  uint64_t v26 = objc_msgSend_recordChangeTag(self, v19, v20, v21);
  if (v26)
  {
    uint64_t v27 = NSString;
    uint64_t v28 = objc_msgSend_recordChangeTag(self, v23, v24, v25);
    uint64_t v31 = objc_msgSend_stringWithFormat_(v27, v29, @" etag=%@", v30, v28);
    id v34 = objc_msgSend_initWithFormat_(v3, v32, @"<CKRecord %@ %@%@%@>", v33, v7, v15, v22, v31);
  }
  else
  {
    id v34 = objc_msgSend_initWithFormat_(v3, v23, @"<CKRecord %@ %@%@%@>", v25, v7, v15, v22, &stru_1ED7F5C98);
  }

  return v34;
}

- (unint64_t)size
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  objc_msgSend_valueStore(self, a2, v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v9 = objc_msgSend_values(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_allKeys(v9, v10, v11, v12);

  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v107, (uint64_t)v112, 16);
  id obj = v5;
  if (v18)
  {
    uint64_t v19 = *(void *)v108;
    uint64_t v20 = 64;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v108 != v19) {
          objc_enumerationMutation(v13);
        }
        id v22 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_values(v5, v15, v16, v17);
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v22, v25);

        uint64_t v27 = sub_18B0AA944((char *)self, v26, v22);
        v20 += (uint64_t)v27;
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v107, (uint64_t)v112, 16);
    }
    while (v18);
  }
  else
  {
    uint64_t v20 = 64;
  }

  objc_sync_exit(v5);
  objc_msgSend_encryptedValueStore(self, v28, v29, v30);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v31);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v35 = objc_msgSend_values(v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend_allKeys(v35, v36, v37, v38);

  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v103, (uint64_t)v111, 16);
  if (v44)
  {
    uint64_t v45 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v104 != v45) {
          objc_enumerationMutation(v39);
        }
        uint64_t v47 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        uint64_t v48 = objc_msgSend_values(v31, v41, v42, v43);
        uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v47, v50);

        uint64_t v52 = sub_18B0AA944((char *)self, v51, v47);
        v20 += (uint64_t)v52;
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v41, (uint64_t)&v103, (uint64_t)v111, 16);
    }
    while (v44);
  }

  objc_sync_exit(v31);
  uint64_t v56 = objc_msgSend_recordID(self, v53, v54, v55);
  uint64_t v60 = objc_msgSend_size(v56, v57, v58, v59);

  if (qword_1EB279C20 != -1) {
    dispatch_once(&qword_1EB279C20, &unk_1ED7F0558);
  }
  uint64_t v64 = qword_1EB279C18;
  uint64_t v65 = objc_msgSend_recordType(self, v61, v62, v63);
  unint64_t v69 = objc_msgSend_length(v65, v66, v67, v68);
  unint64_t v70 = v69 + 2;
  if (v69 >= 0x80)
  {
    do
    {
      ++v70;
      unint64_t v71 = v69 >> 14;
      v69 >>= 7;
    }
    while (v71);
  }

  uint64_t v75 = objc_msgSend_share(self, v72, v73, v74);
  uint64_t v79 = v75;
  unint64_t v80 = v60 + v20 + v64 + v70;
  if (v75)
  {
    uint64_t v81 = objc_msgSend_recordID(v75, v76, v77, v78);
    unint64_t v85 = objc_msgSend_size(v81, v82, v83, v84);
    unint64_t v86 = v85 + 2;
    if (v85 >= 0x80)
    {
      do
      {
        ++v86;
        unint64_t v87 = v85 >> 14;
        v85 >>= 7;
      }
      while (v87);
    }

    v80 += v86;
  }
  long long v88 = objc_msgSend_parent(self, v76, v77, v78);
  uint64_t v92 = v88;
  if (v88)
  {
    uint64_t v93 = objc_msgSend_recordID(v88, v89, v90, v91);
    unint64_t v97 = objc_msgSend_size(v93, v94, v95, v96);
    unint64_t v98 = v97 + 2;
    if (v97 >= 0x80)
    {
      do
      {
        ++v98;
        unint64_t v99 = v97 >> 14;
        v97 >>= 7;
      }
      while (v99);
    }

    v80 += v98;
  }
  if (objc_msgSend_hasPropertiesRequiringEncryption(self, v89, v90, v91)) {
    unint64_t v100 = v80 + 503;
  }
  else {
    unint64_t v100 = v80;
  }

  return v100;
}

- (BOOL)hasChainPCS
{
  uint64_t v8 = objc_msgSend_chainProtectionInfo(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_chainPrivateKey(self, v5, v6, v7);
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isMoreRecentThanRecord:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_creationDate(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_modificationDate(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_creationDate(v4, v13, v14, v15);
  uint64_t v20 = objc_msgSend_modificationDate(v4, v17, v18, v19);
  uint64_t v23 = (void *)v20;
  BOOL v24 = 1;
  if (v16)
  {
    if (v20)
    {
      BOOL v24 = 0;
      if (v8)
      {
        if (v12)
        {
          uint64_t v25 = objc_msgSend_compare_(v8, v21, (uint64_t)v16, v22);
          uint64_t v28 = objc_msgSend_compare_(v12, v26, (uint64_t)v23, v27);
          if (v25)
          {
            if (v25 == 1)
            {
              if (v28 == -1)
              {
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                }
                uint64_t v29 = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
                {
                  int v31 = 138412546;
                  uint64_t v32 = self;
                  __int16 v33 = 2112;
                  id v34 = v4;
                  _os_log_fault_impl(&dword_18AF10000, v29, OS_LOG_TYPE_FAULT, "Found a record with a later modification date, but an earlier creation date. self=%@ other=%@", (uint8_t *)&v31, 0x16u);
                }
              }
              BOOL v24 = 1;
            }
            else
            {
              BOOL v24 = 0;
            }
          }
          else
          {
            BOOL v24 = v28 == 1;
          }
        }
      }
    }
  }

  return v24;
}

- (NSDictionary)values
{
  objc_msgSend_valueStore(self, a2, v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_values(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)originalValues
{
  objc_msgSend_valueStore(self, a2, v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_originalValues(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);

  return (NSDictionary *)v12;
}

- (NSSet)changedKeysSet
{
  objc_msgSend_valueStore(self, a2, v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_changedKeysSet(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);

  return (NSSet *)v12;
}

- (void)setChangedKeysSet:(id)a3
{
  id v14 = a3;
  objc_msgSend_valueStore(self, v4, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  uint64_t v11 = objc_msgSend_mutableCopy(v14, v8, v9, v10);
  objc_msgSend_setChangedKeysSet_(v7, v12, (uint64_t)v11, v13);

  objc_sync_exit(v7);
}

- (BOOL)trackChanges
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL trackChanges = v2->_trackChanges;
  objc_sync_exit(v2);

  return trackChanges;
}

- (void)setTrackChanges:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL trackChanges = a3;
  objc_msgSend_valueStore(obj, v4, v5, v6);
  id v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    v7[8] = a3;
  }

  objc_msgSend_encryptedValueStore(obj, v8, v9, v10);
  uint64_t v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    v11[8] = a3;
  }

  objc_sync_exit(obj);
}

- (NSArray)changedKeys
{
  uint64_t v5 = objc_msgSend_valueStore(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_changedKeys(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_encryptedValueStore(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_changedKeys(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_arrayByAddingObjectsFromArray_(v9, v18, (uint64_t)v17, v19);

  return (NSArray *)v20;
}

- (void)resetChangedKeys
{
  uint64_t v5 = objc_msgSend_valueStore(self, a2, v2, v3);
  objc_msgSend_resetChangedKeys(v5, v6, v7, v8);

  uint64_t v12 = objc_msgSend_encryptedValueStore(self, v9, v10, v11);
  objc_msgSend_resetChangedKeys(v12, v13, v14, v15);

  uint64_t v19 = objc_msgSend_share(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_copy(v19, v20, v21, v22);
  objc_msgSend_setPreviousShare_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_setHasUpdatedShare_(self, v26, 0, v27);
  int v31 = objc_msgSend_parent(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_copy(v31, v32, v33, v34);
  objc_msgSend_setPreviousParent_(self, v36, (uint64_t)v35, v37);

  objc_msgSend_setHasUpdatedParent_(self, v38, 0, v39);
}

- (void)replaceRecordIDWith:(id)a3
{
  id v80 = a3;
  if (!v80)
  {
    uint64_t v72 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2022, @"Must not be nil");
  }
  uint64_t v8 = objc_msgSend_recordID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_recordName(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_recordName(v80, v13, v14, v15);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18);

  if ((isEqualToString & 1) == 0)
  {
    uint64_t v74 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21, v22);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2023, @"Must have the same record name");
  }
  uint64_t v23 = objc_msgSend_recordID(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_zoneID(v23, v24, v25, v26);
  int v31 = objc_msgSend_zoneName(v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_zoneID(v80, v32, v33, v34);
  uint64_t v39 = objc_msgSend_zoneName(v35, v36, v37, v38);
  char v42 = objc_msgSend_isEqualToString_(v31, v40, (uint64_t)v39, v41);

  if ((v42 & 1) == 0)
  {
    uint64_t v76 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v43, v44, v45);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2024, @"Must use the same zone name");
  }
  id v46 = objc_msgSend_recordID(self, v43, v44, v45);
  uint64_t v50 = objc_msgSend_zoneID(v46, v47, v48, v49);
  uint64_t v54 = objc_msgSend_ownerName(v50, v51, v52, v53);
  uint64_t v58 = objc_msgSend_zoneID(v80, v55, v56, v57);
  uint64_t v62 = objc_msgSend_ownerName(v58, v59, v60, v61);
  char v65 = objc_msgSend_isEqualToString_(v54, v63, (uint64_t)v62, v64);

  if ((v65 & 1) == 0)
  {
    uint64_t v78 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v66, v67, v68);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2025, @"Must use the same owner name");
  }
  unint64_t v69 = objc_msgSend_copy(v80, v66, v67, v68);
  objc_msgSend_setRecordID_(self, v70, (uint64_t)v69, v71);
}

- (NSArray)allPCSKeyIDs
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_allPCSKeyIDs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAllPCSKeyIDs:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  allPCSKeyIDs = v4->_allPCSKeyIDs;
  v4->_allPCSKeyIDs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)tombstonedPublicKeyIDs
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_tombstonedPublicKeyIDs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTombstonedPublicKeyIDs:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  tombstonedPublicKeyIDs = v4->_tombstonedPublicKeyIDs;
  v4->_tombstonedPublicKeyIDs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSDictionary)pluginFields
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_pluginFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPluginFields:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1ED7F0598, v6);
  uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
  pluginFields = v4->_pluginFields;
  v4->_pluginFields = (NSDictionary *)v11;

  objc_sync_exit(v4);
}

- (NSArray)conflictLoserEtags
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_conflictLoserEtags;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConflictLoserEtags:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  conflictLoserEtags = v4->_conflictLoserEtags;
  v4->_conflictLoserEtags = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSString)recordChangeTag
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_etag;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecordChangeTag:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
  etag = v4->_etag;
  v4->_etag = (NSString *)v8;

  objc_sync_exit(v4);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)objectForKeyedSubscript:(CKRecordFieldKey)key
{
  id v4 = key;
  uint64_t v5 = sub_18B0A5A28();
  int v8 = objc_msgSend_containsObject_(v5, v6, (uint64_t)v4, v7);

  if (v8)
  {
    SEL v12 = NSSelectorFromString(v4);
    uint64_t v15 = (void (*)(CKRecord *, SEL))objc_msgSend_methodForSelector_(self, v13, (uint64_t)v12, v14);
    uint64_t v16 = v15(self, v12);
  }
  else
  {
    uint64_t v17 = objc_msgSend_valueStore(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v4, v19);
  }

  return v16;
}

- (id)objectForKey:(CKRecordFieldKey)key
{
  id v4 = key;
  int v8 = objc_msgSend_valueStore(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)setNilValueForKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_valueStore(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNilValueForKey_(v10, v8, (uint64_t)v4, v9);
}

- (void)setObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_valueStore(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectNoValidate_forKey_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)setObject:(id)object forKey:(CKRecordFieldKey)key
{
  id v6 = key;
  id v7 = object;
  objc_msgSend_valueStore(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (NSArray)allKeys
{
  uint64_t v5 = objc_msgSend_valueStore(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_allKeys(v5, v6, v7, v8);
  id v13 = objc_msgSend_encryptedValueStore(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_allKeys(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_arrayByAddingObjectsFromArray_(v9, v18, (uint64_t)v17, v19);

  return (NSArray *)v20;
}

- (id)allValues
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  objc_msgSend_valueStore(self, v4, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v11 = objc_msgSend_allKeys(v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_values(v7, v13, v14, v15);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, v19, v22);
        objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, v19);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v47, (uint64_t)v52, 16);
    }
    while (v16);
  }

  objc_sync_exit(v7);
  objc_msgSend_encryptedValueStore(self, v25, v26, v27);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v28);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v32 = objc_msgSend_allKeys(v28, v29, v30, v31, 0);
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v43, (uint64_t)v51, 16);
  if (v36)
  {
    uint64_t v37 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(v32);
        }
        uint64_t v39 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v28, v34, v39, v35);
        objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)v40, v39);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v43, (uint64_t)v51, 16);
    }
    while (v36);
  }

  objc_sync_exit(v28);

  return v3;
}

- (id)_allStrings
{
  uint64_t v5 = objc_msgSend_valueStore(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_allKeys(v5, v6, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B0AC854;
  v14[3] = &unk_1E5463910;
  v14[4] = self;
  uint64_t v12 = objc_msgSend_CKCompactMap_(v9, v10, (uint64_t)v14, v11);

  return v12;
}

- (NSArray)allTokens
{
  if (qword_1EB279C30 != -1) {
    dispatch_once(&qword_1EB279C30, &unk_1ED7EC468);
  }
  uint64_t v3 = objc_msgSend_expressionValueWithObject_context_((void *)qword_1EB279C28, a2, (uint64_t)self, 0);
  uint64_t v7 = objc_msgSend_allObjects(v3, v4, v5, v6);

  return (NSArray *)v7;
}

- (BOOL)containsAssetValues
{
  v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_valueStore(self, a2, v2, v3);
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v19, 3);
  if (objc_msgSend_containsValueOfClasses_passingTest_(v5, v8, (uint64_t)v7, (uint64_t)&unk_1ED7EC4A8))
  {
    char v12 = 1;
  }
  else
  {
    id v13 = objc_msgSend_encryptedValueStore(self, v9, v10, v11);
    uint64_t v18 = objc_opt_class();
    uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)&v18, 1);
    char v12 = objc_msgSend_containsValueOfClasses_passingTest_(v13, v16, (uint64_t)v15, (uint64_t)&unk_1ED7EC4C8);
  }
  return v12;
}

- (BOOL)containsPackageValues
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueStore(self, a2, v2, v3);
  v10[0] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v10, 1);
  char v8 = objc_msgSend_containsValueOfClasses_passingTest_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1ED7EC4E8);

  return v8;
}

- (BOOL)containsIndexedKeys
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = objc_msgSend_valueStore(self, a2, v2, v3, 0);
  char v8 = objc_msgSend_allKeys(v4, v5, v6, v7);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend_length(v16, v10, v11, v12))
        {
          uint64_t v17 = objc_msgSend_length(v16, v10, v11, v12);
          if (objc_msgSend_characterAtIndex_(v16, v18, v17 - 1, v19) == 93)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v21, (uint64_t)v25, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)hasPropertiesRequiringEncryption
{
  v30[4] = *MEMORY[0x1E4F143B8];
  char v8 = objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    if (v13)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend_valueStore(self, v10, v11, v12);
      v30[0] = objc_opt_class();
      v30[1] = objc_opt_class();
      v30[2] = objc_opt_class();
      v30[3] = objc_opt_class();
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v30, 4);
      if (objc_msgSend_containsValueOfClasses_passingTest_(v14, v17, (uint64_t)v16, (uint64_t)&unk_1ED7EC508))
      {
        BOOL v9 = 1;
      }
      else
      {
        long long v21 = objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        uint64_t v25 = objc_msgSend_allKeys(v21, v22, v23, v24);
        BOOL v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;
      }
    }
  }
  return v9;
}

- (BOOL)hasModifiedPropertiesRequiringEncryption
{
  v30[4] = *MEMORY[0x1E4F143B8];
  char v8 = objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    if (v13)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend_valueStore(self, v10, v11, v12);
      v30[0] = objc_opt_class();
      v30[1] = objc_opt_class();
      v30[2] = objc_opt_class();
      v30[3] = objc_opt_class();
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v30, 4);
      BOOL v9 = 1;
      if ((objc_msgSend_containsValueOfClasses_options_passingTest_(v14, v17, (uint64_t)v16, 1, &unk_1ED7EC528) & 1) == 0)
      {
        long long v21 = objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        uint64_t v25 = objc_msgSend_changedKeys(v21, v22, v23, v24);
        BOOL v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;
      }
    }
  }
  return v9;
}

- (BOOL)hasPropertiesRequiringDecryption
{
  v33[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  if (objc_msgSend_needsDecryption(v5, v6, v7, v8))
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_mutableEncryptedPSK(self, v9, v10, v11);
    if (objc_msgSend_needsDecryption(v13, v14, v15, v16))
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v20 = objc_msgSend_valueStore(self, v17, v18, v19);
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      v33[2] = objc_opt_class();
      v33[3] = objc_opt_class();
      long long v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v33, 4);
      if (objc_msgSend_containsValueOfClasses_passingTest_(v20, v23, (uint64_t)v22, (uint64_t)&unk_1ED7EC548))
      {
        char v12 = 1;
      }
      else
      {
        uint64_t v27 = objc_msgSend_encryptedValueStore(self, v24, v25, v26);
        v32[0] = objc_opt_class();
        v32[1] = objc_opt_class();
        uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v32, 2);
        char v12 = objc_msgSend_containsValueOfClasses_passingTest_(v27, v30, (uint64_t)v29, (uint64_t)&unk_1ED7EC588);
      }
    }
  }
  return v12;
}

- (BOOL)hasEncryptedData
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    if (v13)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend_valueStore(self, v10, v11, v12);
      v30[0] = objc_opt_class();
      BOOL v9 = 1;
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v30, 1);
      if ((objc_msgSend_containsValueOfClasses_passingTest_(v14, v17, (uint64_t)v16, (uint64_t)&unk_1ED7F06B8) & 1) == 0)
      {
        long long v21 = objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        uint64_t v25 = objc_msgSend_allKeys(v21, v22, v23, v24);
        BOOL v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;
      }
    }
  }
  return v9;
}

- (BOOL)hasModifiedEncryptedData
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    if (v13)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend_valueStore(self, v10, v11, v12);
      v30[0] = objc_opt_class();
      BOOL v9 = 1;
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v30, 1);
      if ((objc_msgSend_containsValueOfClasses_options_passingTest_(v14, v17, (uint64_t)v16, 1, &unk_1ED7EC5A8) & 1) == 0)
      {
        long long v21 = objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        uint64_t v25 = objc_msgSend_changedKeys(v21, v22, v23, v24);
        BOOL v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;
      }
    }
  }
  return v9;
}

- (void)setRecordChangeTag_modelMutation:(id)a3
{
}

- (void)CKAssignToContainerWithID:(id)a3
{
  long long v43 = (char *)a3;
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);
  uint64_t v10 = v43;
  uint64_t v11 = v8;
  if (v43 && v8 && (isEqual = objc_msgSend_isEqual_(v8, v43, (uint64_t)v43, v9), uint64_t v10 = v43, (isEqual & 1) == 0))
  {
    uint64_t v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v43, v13, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2277, @"Cannot replace assigned container ID %@ with %@", v11, v43);

    objc_msgSend_setContainerID_(self, v43, (uint64_t)v43, v42);
  }
  else
  {
    objc_msgSend_setContainerID_(self, v10, (uint64_t)v10, v9);
  }
  objc_msgSend_valueStore(self, v14, v15, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  long long v21 = objc_msgSend_values(v17, v18, v19, v20);
  objc_msgSend_CKAssignToContainerWithID_(v21, v22, (uint64_t)v43, v23);

  objc_sync_exit(v17);
  objc_msgSend_encryptedValueStore(self, v24, v25, v26);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v27);
  uint64_t v31 = objc_msgSend_values(v27, v28, v29, v30);
  objc_msgSend_CKAssignToContainerWithID_(v31, v32, (uint64_t)v43, v33);

  objc_sync_exit(v27);
  uint64_t v37 = objc_msgSend_pluginFields(self, v34, v35, v36);
  objc_msgSend_CKAssignToContainerWithID_(v37, v38, (uint64_t)v43, v39);
}

- (CKReference)share
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_share;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShare:(id)a3
{
  id v64 = a3;
  if (v64)
  {
    if (objc_msgSend_referenceAction(v64, v5, v6, v7))
    {
      uint64_t v60 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2303, @"Share references must be CKReferenceActionNone");
    }
    uint64_t v11 = objc_msgSend_recordID(v64, v8, v9, v10);
    uint64_t v15 = objc_msgSend_zoneID(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_zoneName(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_recordID(self, v20, v21, v22);
    id v27 = objc_msgSend_zoneID(v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_zoneName(v27, v28, v29, v30);
    char isEqualToString = objc_msgSend_isEqualToString_(v19, v32, (uint64_t)v31, v33);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36, v37);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2306, @"Share must be in the same zone as the current record");
    }
  }
  uint64_t v38 = self;
  objc_sync_enter(v38);
  if ((objc_msgSend_isEqual_(v64, v39, (uint64_t)v38->_share, v40) & 1) == 0)
  {
    if (objc_msgSend_trackChanges(v38, v41, v42, v43))
    {
      objc_msgSend_previousShare(v38, v44, v45, v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasUpdatedShare(v38, v48, v49, v50)
        && (v47 == v64 || objc_msgSend_isEqual_(v64, v51, (uint64_t)v47, v52)))
      {
        objc_msgSend_setHasUpdatedShare_(v38, v51, 0, v52);
      }
      else
      {
        objc_msgSend_setHasUpdatedShare_(v38, v51, 1, v52);
      }
    }
    else
    {
      id v47 = (id)objc_msgSend_copy(v64, v44, v45, v46);
      objc_msgSend_setPreviousShare_(v38, v53, (uint64_t)v47, v54);
    }

    uint64_t v58 = objc_msgSend_copy(v64, v55, v56, v57);
    share = v38->_share;
    v38->_share = (CKReference *)v58;
  }
  objc_sync_exit(v38);
}

- (CKReference)parent
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_parent;
  objc_sync_exit(v2);

  return v3;
}

- (void)setParent:(CKReference *)parent
{
  id v64 = parent;
  if (v64)
  {
    if (objc_msgSend_referenceAction(v64, v5, v6, v7))
    {
      uint64_t v60 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2335, @"Parent references must be CKReferenceActionNone");
    }
    uint64_t v11 = objc_msgSend_recordID(v64, v8, v9, v10);
    uint64_t v15 = objc_msgSend_zoneID(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_zoneName(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_recordID(self, v20, v21, v22);
    id v27 = objc_msgSend_zoneID(v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_zoneName(v27, v28, v29, v30);
    char isEqualToString = objc_msgSend_isEqualToString_(v19, v32, (uint64_t)v31, v33);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36, v37);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2338, @"Parent record must be in the same zone as the current record");
    }
  }
  uint64_t v38 = self;
  objc_sync_enter(v38);
  if ((objc_msgSend_isEqual_(v64, v39, (uint64_t)v38->_parent, v40) & 1) == 0)
  {
    if (objc_msgSend_trackChanges(v38, v41, v42, v43))
    {
      objc_msgSend_previousParent(v38, v44, v45, v46);
      id v47 = (CKReference *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasUpdatedParent(v38, v48, v49, v50)
        && (v47 == v64 || objc_msgSend_isEqual_(v64, v51, (uint64_t)v47, v52)))
      {
        objc_msgSend_setHasUpdatedParent_(v38, v51, 0, v52);
      }
      else
      {
        objc_msgSend_setHasUpdatedParent_(v38, v51, 1, v52);
      }
    }
    else
    {
      id v47 = (CKReference *)objc_msgSend_copy(v64, v44, v45, v46);
      objc_msgSend_setPreviousParent_(v38, v53, (uint64_t)v47, v54);
    }

    uint64_t v58 = objc_msgSend_copy(v64, v55, v56, v57);
    uint64_t v59 = v38->_parent;
    v38->_parent = (CKReference *)v58;
  }
  objc_sync_exit(v38);
}

- (void)setParentReferenceFromRecord:(CKRecord *)parentRecord
{
  if (parentRecord)
  {
    uint64_t v5 = parentRecord;
    uint64_t v6 = [CKReference alloc];
    id v8 = (id)objc_msgSend_initWithRecord_action_(v6, v7, (uint64_t)v5, 0);
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend_setParent_(self, a2, (uint64_t)v8, v3);
}

- (void)setParentReferenceFromRecordID:(CKRecordID *)parentRecordID
{
  if (parentRecordID)
  {
    uint64_t v5 = parentRecordID;
    uint64_t v6 = [CKReference alloc];
    id v8 = (id)objc_msgSend_initWithRecordID_action_(v6, v7, (uint64_t)v5, 0);
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend_setParent_(self, a2, (uint64_t)v8, v3);
}

- (_PCSIdentityData)signingPCSIdentity
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  signingPCSIdentity = v2->_signingPCSIdentity;
  objc_sync_exit(v2);

  return signingPCSIdentity;
}

- (void)setSigningPCSIdentity:(_PCSIdentityData *)a3
{
  id obj = self;
  objc_sync_enter(obj);
  signingPCSIdentity = obj->_signingPCSIdentity;
  if (signingPCSIdentity != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      uint64_t v5 = obj;
      signingPCSIdentity = obj->_signingPCSIdentity;
    }
    else
    {
      uint64_t v5 = obj;
    }
    v5->_signingPCSIdentity = a3;
    if (signingPCSIdentity) {
      CFRelease(signingPCSIdentity);
    }
  }
  objc_sync_exit(obj);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeSystemFieldsWithCoder:(NSCoder *)coder
{
  uint64_t v7 = coder;
  if (byte_1E9124EF0 && objc_msgSend_isMergeableValueDeltaRecord(self, v4, v5, v6))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v236 = 0;
      _os_log_fault_impl(&dword_18AF10000, v8, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Tried to encode system fields for a record without system fields. You'll receive a record like this when fetching changes from the server if the only mergeable fields have changed. In this case, the record will not contain any system fields, so you should not encode it. Check to make sure recordChangeTag is non-nil before encoding system fields for this record.", v236, 2u);
    }
  }
  uint64_t v9 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v13 = objc_msgSend_recordType(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v7, v14, (uint64_t)v13, @"RecordType");

  uint64_t v18 = objc_msgSend_recordID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v7, v19, (uint64_t)v18, @"RecordID");

  uint64_t v23 = objc_msgSend_creationDate(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v7, v24, (uint64_t)v23, @"RecordCtime");

  uint64_t v28 = objc_msgSend_modificationDate(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v7, v29, (uint64_t)v28, @"RecordMtime");

  uint64_t v33 = objc_msgSend_creatorUserRecordID(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v7, v34, (uint64_t)v33, @"CreatorUserRecordID");

  uint64_t v38 = objc_msgSend_lastModifiedUserRecordID(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v7, v39, (uint64_t)v38, @"LastModifiedUserRecordID");

  uint64_t v43 = objc_msgSend_modifiedByDevice(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v7, v44, (uint64_t)v43, @"ModifiedByDevice");

  long long v48 = objc_msgSend_etag(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v7, v49, (uint64_t)v48, @"ETag");

  uint64_t v53 = objc_msgSend_conflictLoserEtags(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v7, v54, (uint64_t)v53, @"ConflictLoserEtags");

  uint64_t isKnownToServer = objc_msgSend_isKnownToServer(self, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v7, v59, isKnownToServer, @"KnownToServer");
  uint64_t v63 = objc_msgSend_wasCached(self, v60, v61, v62);
  objc_msgSend_encodeBool_forKey_(v7, v64, v63, @"WasCached");
  if (byte_1E9124EF0 || objc_msgSend_serializeProtectionData(self, v65, v66, v67))
  {
    uint64_t v68 = objc_msgSend_protectionData(self, v65, v66, v67);
    objc_msgSend_encodeObject_forKey_(v7, v69, (uint64_t)v68, @"ProtectionData");

    uint64_t v73 = objc_msgSend_protectionEtag(self, v70, v71, v72);
    objc_msgSend_encodeObject_forKey_(v7, v74, (uint64_t)v73, @"ProtectionDataEtag");

    uint64_t v78 = objc_msgSend_chainProtectionInfo(self, v75, v76, v77);
    objc_msgSend_encodeObject_forKey_(v7, v79, (uint64_t)v78, @"ChainProtectionData");

    uint64_t v83 = objc_msgSend_chainPrivateKey(self, v80, v81, v82);
    objc_msgSend_encodeObject_forKey_(v7, v84, (uint64_t)v83, @"ChainPrivateKey");

    if (!__sTestOverridesAvailable) {
      goto LABEL_14;
    }
    unint64_t v85 = objc_msgSend_pcsKeysToRemove(self, v65, v66, v67);
    objc_msgSend_encodeObject_forKey_(v7, v86, (uint64_t)v85, @"PCSKeysToRemove");
  }
  if (__sTestOverridesAvailable && objc_msgSend_applyPCSKeysToRemoveForTesting(self, v65, v66, v67))
  {
    uint64_t v87 = objc_msgSend_applyPCSKeysToRemoveForTesting(self, v65, v66, v67);
    objc_msgSend_encodeBool_forKey_(v7, v88, v87, @"ApplyPCSKeysToRemoveForTesting");
  }
LABEL_14:
  uint64_t v89 = objc_msgSend_wantsChainPCS(self, v65, v66, v67);
  objc_msgSend_encodeBool_forKey_(v7, v90, v89, @"WantsChainPCSKey");
  v94 = objc_msgSend_chainParentPublicKeyID(self, v91, v92, v93);
  objc_msgSend_encodeObject_forKey_(v7, v95, (uint64_t)v94, @"ChainParentPublicKeyID");

  unint64_t v99 = objc_msgSend_previousProtectionEtag(self, v96, v97, v98);
  objc_msgSend_encodeObject_forKey_(v7, v100, (uint64_t)v99, @"PreviousProtectionDataEtag");

  long long v104 = objc_msgSend_zoneProtectionEtag(self, v101, v102, v103);
  objc_msgSend_encodeObject_forKey_(v7, v105, (uint64_t)v104, @"ZoneProtectionDataEtag");

  long long v109 = objc_msgSend_shareEtag(self, v106, v107, v108);
  objc_msgSend_encodeObject_forKey_(v7, v110, (uint64_t)v109, @"ShareEtag");

  uint64_t v114 = objc_msgSend_tombstonedPublicKeyIDs(self, v111, v112, v113);
  objc_msgSend_encodeObject_forKey_(v7, v115, (uint64_t)v114, @"TombstonedPublicKeyIDs");

  uint64_t v119 = objc_msgSend_useLightweightPCS(self, v116, v117, v118);
  objc_msgSend_encodeBool_forKey_(v7, v120, v119, @"UseLightweightPCS");
  uint64_t v124 = objc_msgSend_share(self, v121, v122, v123);
  objc_msgSend_encodeObject_forKey_(v7, v125, (uint64_t)v124, @"ShareReference");

  uint64_t v129 = objc_msgSend_previousShare(self, v126, v127, v128);
  objc_msgSend_encodeObject_forKey_(v7, v130, (uint64_t)v129, @"PreviousShareReference");

  uint64_t hasUpdatedShare = objc_msgSend_hasUpdatedShare(self, v131, v132, v133);
  objc_msgSend_encodeBool_forKey_(v7, v135, hasUpdatedShare, @"HasUpdatedShareReference");
  uint64_t v139 = objc_msgSend_parent(self, v136, v137, v138);
  objc_msgSend_encodeObject_forKey_(v7, v140, (uint64_t)v139, @"ParentReference");

  v144 = objc_msgSend_previousParent(self, v141, v142, v143);
  objc_msgSend_encodeObject_forKey_(v7, v145, (uint64_t)v144, @"PreviousParentReference");

  uint64_t hasUpdatedParent = objc_msgSend_hasUpdatedParent(self, v146, v147, v148);
  objc_msgSend_encodeBool_forKey_(v7, v150, hasUpdatedParent, @"HasUpdatedParentReference");
  uint64_t v154 = objc_msgSend_permission(self, v151, v152, v153);
  objc_msgSend_encodeInteger_forKey_(v7, v155, v154, @"Permission");
  uint64_t v159 = objc_msgSend_wantsPublicSharingKey(self, v156, v157, v158);
  objc_msgSend_encodeBool_forKey_(v7, v160, v159, @"WantsPublicSharingKey");
  uint64_t v164 = objc_msgSend_routingKey(self, v161, v162, v163);
  objc_msgSend_encodeObject_forKey_(v7, v165, (uint64_t)v164, @"RoutingKey");

  uint64_t v169 = objc_msgSend_baseToken(self, v166, v167, v168);
  objc_msgSend_encodeObject_forKey_(v7, v170, (uint64_t)v169, @"BaseToken");

  v174 = objc_msgSend_displayedHostname(self, v171, v172, v173);
  objc_msgSend_encodeObject_forKey_(v7, v175, (uint64_t)v174, @"DisplayedHostname");

  v179 = objc_msgSend_mutableEncryptedPSK(self, v176, v177, v178);
  objc_msgSend_encodeObject_forKey_(v7, v180, (uint64_t)v179, @"MutableEncryptedPublicSharingKey");

  uint64_t v184 = objc_msgSend_mutableURL(self, v181, v182, v183);
  objc_msgSend_encodeObject_forKey_(v7, v185, (uint64_t)v184, @"URL");

  v189 = objc_msgSend_previousProtectionEtagFromUnitTest(self, v186, v187, v188);
  objc_msgSend_encodeObject_forKey_(v7, v190, (uint64_t)v189, @"PreviousProtectionDataEtagFromUnitTest");

  v194 = objc_msgSend_pcsKeyID(self, v191, v192, v193);
  objc_msgSend_encodeObject_forKey_(v7, v195, (uint64_t)v194, @"PCSKeyID");

  v199 = objc_msgSend_allPCSKeyIDs(self, v196, v197, v198);
  objc_msgSend_encodeObject_forKey_(v7, v200, (uint64_t)v199, @"AllPCSKeyIDs");

  v204 = objc_msgSend_zoneishKeyID(self, v201, v202, v203);
  objc_msgSend_encodeObject_forKey_(v7, v205, (uint64_t)v204, @"ZoneishKeyID");

  uint64_t v209 = objc_msgSend_expirationDate(self, v206, v207, v208);
  objc_msgSend_encodeObject_forKey_(v7, v210, (uint64_t)v209, @"ExpirationDate");

  uint64_t isExpired = objc_msgSend_isExpired(self, v211, v212, v213);
  objc_msgSend_encodeBool_forKey_(v7, v215, isExpired, @"Expired");
  uint64_t hasUpdatedExpirationTimeInterval = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v216, v217, v218);
  objc_msgSend_encodeBool_forKey_(v7, v220, hasUpdatedExpirationTimeInterval, @"HasUpdatedExpiration");
  uint64_t v224 = objc_msgSend_updatedExpirationTimeInterval(self, v221, v222, v223);
  objc_msgSend_encodeObject_forKey_(v7, v225, (uint64_t)v224, @"UpdatedExpiration");

  uint64_t isMergeableValueDeltaRecord = objc_msgSend_isMergeableValueDeltaRecord(self, v226, v227, v228);
  objc_msgSend_encodeBool_forKey_(v7, v230, isMergeableValueDeltaRecord, @"MergeableValueDeltaRecord");
  uint64_t v234 = objc_msgSend_needsRollAndCounterSign(self, v231, v232, v233);
  objc_msgSend_encodeBool_forKey_(v7, v235, v234, @"NeedsRollAndCounterSignKey");
}

- (void)preTiboEncodeWithCoder:(id)a3
{
  id v37 = a3;
  if (!__sTestOverridesAvailable)
  {
    uint64_t v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, (uint64_t)self, @"CKRecord.m", 2475, @"Only suitable for testing");
  }
  id v8 = (void *)MEMORY[0x18C12ADA0]();
  objc_msgSend_encodeSystemFieldsWithCoder_(self, v9, (uint64_t)v37, v10);
  objc_msgSend_valueStore(self, v11, v12, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  uint64_t v18 = objc_msgSend_values(v14, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v37, v19, (uint64_t)v18, @"RecordValues");

  uint64_t v23 = objc_msgSend_originalValues(v14, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v37, v24, (uint64_t)v23, @"OriginalValues");

  uint64_t v28 = objc_msgSend_changedKeysSet(v14, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v37, v29, (uint64_t)v28, @"ChangedKeys");

  objc_sync_exit(v14);
  uint64_t v33 = objc_msgSend_pluginFields(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v37, v34, (uint64_t)v33, @"PluginFields");
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  objc_msgSend_encodeSystemFieldsWithCoder_(self, v5, (uint64_t)v22, v6);
  uint64_t v10 = objc_msgSend_valueStore(self, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v22, v11, (uint64_t)v10, @"ValueStore");

  uint64_t v15 = objc_msgSend_encryptedValueStore(self, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(v22, v16, (uint64_t)v15, @"EncryptedValueStore");

  uint64_t v20 = objc_msgSend_pluginFields(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v22, v21, (uint64_t)v20, @"PluginFields");
}

- (CKRecord)initWithCoder:(id)a3
{
  v325[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v321.receiver = self;
  v321.super_class = (Class)CKRecord;
  uint64_t v5 = [(CKRecord *)&v321 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_opt_class();
      objc_msgSend_setClass_forClassName_(v4, v8, v7, @"CKInternalEncryptedData");
    }
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"RecordType");
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"RecordID");
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v15;

    if (!v5->_recordType || !v5->_recordID)
    {
      uint64_t v308 = 0;
      goto LABEL_44;
    }
    context = v6;
    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"ValueStore");
    p_valueStore = &v5->_valueStore;
    valueStore = v5->_valueStore;
    v5->_valueStore = (CKRecordValueStore *)v19;

    if (v5->_valueStore) {
      objc_storeWeak((id *)&v5->_valueStore->_record, v5);
    }
    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"EncryptedValueStore");
    encryptedValueStore = v5->_encryptedValueStore;
    v5->_encryptedValueStore = (CKEncryptedRecordValueStore *)v24;

    p_encryptedValueStore = &v5->_encryptedValueStore;
    uint64_t v26 = v5->_encryptedValueStore;
    if (v26) {
      objc_storeWeak((id *)&v26->super._record, v5);
    }
    if (!*p_valueStore)
    {
      uint64_t v27 = [CKRecordValueStore alloc];
      uint64_t v30 = objc_msgSend_initWithRecord_(v27, v28, (uint64_t)v5, v29);
      uint64_t v31 = v5->_valueStore;
      v5->_valueStore = (CKRecordValueStore *)v30;
    }
    if (!*p_encryptedValueStore)
    {
      uint64_t v32 = [CKEncryptedRecordValueStore alloc];
      uint64_t v35 = objc_msgSend_initWithRecord_(v32, v33, (uint64_t)v5, v34);
      uint64_t v36 = v5->_encryptedValueStore;
      v5->_encryptedValueStore = (CKEncryptedRecordValueStore *)v35;
    }
    if (*p_valueStore) {
      (*p_valueStore)->_BOOL trackChanges = 0;
    }
    if (*p_encryptedValueStore) {
      (*p_encryptedValueStore)->super._BOOL trackChanges = 0;
    }
    id v37 = CKAcceptableValueClasses();
    v325[0] = objc_opt_class();
    v325[1] = objc_opt_class();
    uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v325, 2);
    uint64_t v42 = objc_msgSend_setByAddingObjectsFromArray_(v37, v40, (uint64_t)v39, v41);
    long long v44 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v43, (uint64_t)v42, @"RecordValues");
    long long v48 = objc_msgSend_mutableCopy(v44, v45, v46, v47);

    uint64_t v49 = CKAcceptableValueClasses();
    v324[0] = objc_opt_class();
    v324[1] = objc_opt_class();
    v324[2] = objc_opt_class();
    uint64_t v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)v324, 3);
    uint64_t v54 = objc_msgSend_setByAddingObjectsFromArray_(v49, v52, (uint64_t)v51, v53);
    uint64_t v56 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, @"OriginalValues");
    uint64_t v316 = objc_msgSend_mutableCopy(v56, v57, v58, v59);

    uint64_t v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    char v65 = objc_msgSend_setWithObjects_(v60, v63, v61, v64, v62, 0);
    uint64_t v314 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v65, @"ChangedKeys");

    v315 = v48;
    if (objc_msgSend_count(v48, v67, v68, v69) || objc_msgSend_count(v316, v70, v71, v72))
    {
      uint64_t v310 = v5;
      id v311 = v4;
      uint64_t v73 = objc_opt_new();
      uint64_t v77 = objc_msgSend_allKeys(v48, v74, v75, v76);
      objc_msgSend_addObjectsFromArray_(v73, v78, (uint64_t)v77, v79);

      uint64_t v83 = objc_msgSend_allKeys(v316, v80, v81, v82);
      objc_msgSend_addObjectsFromArray_(v73, v84, (uint64_t)v83, v85);

      uint64_t v89 = objc_msgSend_allObjects(v314, v86, v87, v88);
      objc_msgSend_addObjectsFromArray_(v73, v90, (uint64_t)v89, v91);

      long long v319 = 0u;
      long long v320 = 0u;
      long long v317 = 0u;
      long long v318 = 0u;
      id v92 = v73;
      uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v317, (uint64_t)v323, 16);
      if (v94)
      {
        uint64_t v97 = v94;
        uint64_t v98 = *(void *)v318;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v318 != v98) {
              objc_enumerationMutation(v92);
            }
            uint64_t v100 = *(void *)(*((void *)&v317 + 1) + 8 * i);
            uint64_t v101 = objc_msgSend_objectForKeyedSubscript_(v315, v95, v100, v96);
            long long v104 = objc_msgSend_objectForKeyedSubscript_(v316, v102, v100, v103);
            if ((sub_18B0ACE4C(v101) & 1) != 0 || (v105 = sub_18B0ACE4C(v104), long long v106 = (id *)p_valueStore, v105)) {
              long long v106 = (id *)p_encryptedValueStore;
            }
            id v107 = *v106;
            uint64_t v111 = v107;
            if (v101)
            {
              uint64_t v112 = objc_msgSend_values(v107, v108, v109, v110);
              objc_msgSend_setObject_forKeyedSubscript_(v112, v113, (uint64_t)v101, v100);
            }
            if (v104)
            {
              uint64_t v114 = objc_msgSend_originalValues(v111, v108, v109, v110);
              objc_msgSend_setObject_forKeyedSubscript_(v114, v115, (uint64_t)v104, v100);
            }
            if (objc_msgSend_containsObject_(v314, v108, v100, v110))
            {
              uint64_t v119 = objc_msgSend_changedKeysSet(v111, v116, v117, v118);
              objc_msgSend_addObject_(v119, v120, v100, v121);
            }
          }
          uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v317, (uint64_t)v323, 16);
        }
        while (v97);
      }

      uint64_t v5 = v310;
      id v4 = v311;
    }
    uint64_t v122 = CKAcceptableValueClasses();
    v322[0] = objc_opt_class();
    v322[1] = objc_opt_class();
    uint64_t v124 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v123, (uint64_t)v322, 2);
    uint64_t v127 = objc_msgSend_setByAddingObjectsFromArray_(v122, v125, (uint64_t)v124, v126);
    uint64_t v129 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v128, (uint64_t)v127, @"PluginFields");
    pluginFields = v5->_pluginFields;
    v5->_pluginFields = (NSDictionary *)v129;

    uint64_t v131 = objc_opt_class();
    uint64_t v133 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v132, v131, @"RecordCtime");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v133;

    uint64_t v135 = objc_opt_class();
    uint64_t v137 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v136, v135, @"RecordMtime");
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v137;

    uint64_t v139 = objc_opt_class();
    uint64_t v141 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v140, v139, @"CreatorUserRecordID");
    creatorUserRecordID = v5->_creatorUserRecordID;
    v5->_creatorUserRecordID = (CKRecordID *)v141;

    uint64_t v143 = objc_opt_class();
    uint64_t v145 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v144, v143, @"LastModifiedUserRecordID");
    lastModifiedUserRecordID = v5->_lastModifiedUserRecordID;
    v5->_lastModifiedUserRecordID = (CKRecordID *)v145;

    uint64_t v147 = objc_opt_class();
    uint64_t v149 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v148, v147, @"ETag");
    etag = v5->_etag;
    v5->_etag = (NSString *)v149;

    uint64_t v151 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v152 = objc_opt_class();
    uint64_t v153 = objc_opt_class();
    v156 = objc_msgSend_setWithObjects_(v151, v154, v152, v155, v153, 0);
    uint64_t v158 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v157, (uint64_t)v156, @"ConflictLoserEtags");
    conflictLoserEtags = v5->_conflictLoserEtags;
    v5->_conflictLoserEtags = (NSArray *)v158;

    v5->_knownToServer = objc_msgSend_decodeBoolForKey_(v4, v160, @"KnownToServer", v161);
    uint64_t v162 = objc_opt_class();
    uint64_t v164 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v163, v162, @"ModifiedByDevice");
    modifiedByDevice = v5->_modifiedByDevice;
    v5->_modifiedByDevice = (NSString *)v164;

    v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v166, @"WasCached", v167);
    uint64_t v168 = objc_opt_class();
    uint64_t v170 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v169, v168, @"ZoneishKeyID");
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v170;

    uint64_t v172 = objc_opt_class();
    uint64_t v174 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v173, v172, @"ProtectionData");
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v174;

    uint64_t v176 = objc_opt_class();
    uint64_t v178 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v177, v176, @"ProtectionDataEtag");
    protectionEtag = v5->_protectionEtag;
    v5->_protectionEtag = (NSString *)v178;

    uint64_t v180 = objc_opt_class();
    uint64_t v182 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v181, v180, @"PreviousProtectionDataEtag");
    previousProtectionEtag = v5->_previousProtectionEtag;
    v5->_previousProtectionEtag = (NSString *)v182;

    uint64_t v184 = objc_opt_class();
    uint64_t v186 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, @"ZoneProtectionDataEtag");
    zoneProtectionEtag = v5->_zoneProtectionEtag;
    v5->_zoneProtectionEtag = (NSString *)v186;

    uint64_t v188 = objc_opt_class();
    uint64_t v190 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v189, v188, @"ShareEtag");
    shareEtag = v5->_shareEtag;
    v5->_shareEtag = (NSString *)v190;

    uint64_t v192 = objc_opt_class();
    uint64_t v194 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v193, v192, @"ShareReference");
    share = v5->_share;
    v5->_share = (CKReference *)v194;

    uint64_t v196 = objc_opt_class();
    uint64_t v198 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v197, v196, @"PreviousShareReference");
    previousShare = v5->_previousShare;
    v5->_previousShare = (CKReference *)v198;

    v5->_uint64_t hasUpdatedShare = objc_msgSend_decodeBoolForKey_(v4, v200, @"HasUpdatedShareReference", v201);
    uint64_t v202 = objc_opt_class();
    uint64_t v204 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v203, v202, @"ParentReference");
    parent = v5->_parent;
    v5->_parent = (CKReference *)v204;

    uint64_t v206 = objc_opt_class();
    uint64_t v208 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v207, v206, @"PreviousParentReference");
    previousParent = v5->_previousParent;
    v5->_previousParent = (CKReference *)v208;

    v5->_uint64_t hasUpdatedParent = objc_msgSend_decodeBoolForKey_(v4, v210, @"HasUpdatedParentReference", v211);
    uint64_t v212 = objc_opt_class();
    uint64_t v214 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v213, v212, @"ChainParentPublicKeyID");
    chainParentPublicKeyID = v5->_chainParentPublicKeyID;
    v5->_chainParentPublicKeyID = (NSData *)v214;

    v216 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v217 = objc_opt_class();
    uint64_t v218 = objc_opt_class();
    v221 = objc_msgSend_setWithObjects_(v216, v219, v217, v220, v218, 0);
    uint64_t v223 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v222, (uint64_t)v221, @"TombstonedPublicKeyIDs");
    tombstonedPublicKeyIDs = v5->_tombstonedPublicKeyIDs;
    v5->_tombstonedPublicKeyIDs = (NSArray *)v223;

    uint64_t v225 = objc_opt_class();
    uint64_t v227 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v226, v225, @"ChainPrivateKey");
    chainPrivateKey = v5->_chainPrivateKey;
    v5->_chainPrivateKey = (CKEncryptedData *)v227;

    uint64_t v229 = objc_opt_class();
    uint64_t v231 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v230, v229, @"MutableEncryptedPublicSharingKey");
    mutableEncryptedPSK = v5->_mutableEncryptedPSK;
    v5->_mutableEncryptedPSK = (CKEncryptedData *)v231;

    uint64_t v233 = objc_opt_class();
    uint64_t v235 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v234, v233, @"ChainProtectionData");
    chainProtectionInfo = v5->_chainProtectionInfo;
    v5->_chainProtectionInfo = (NSData *)v235;

    v5->_wantsChainPCS = objc_msgSend_decodeBoolForKey_(v4, v237, @"WantsChainPCSKey", v238);
    v5->_useLightweightPCS = objc_msgSend_decodeBoolForKey_(v4, v239, @"UseLightweightPCS", v240);
    v5->_permission = objc_msgSend_decodeIntegerForKey_(v4, v241, @"Permission", v242);
    v5->_wantsPublicSharingKey = objc_msgSend_decodeBoolForKey_(v4, v243, @"WantsPublicSharingKey", v244);
    uint64_t v245 = objc_opt_class();
    uint64_t v247 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v246, v245, @"RoutingKey");
    routingKey = v5->_routingKey;
    v5->_routingKey = (NSString *)v247;

    uint64_t v249 = objc_opt_class();
    uint64_t v251 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v250, v249, @"BaseToken");
    baseToken = v5->_baseToken;
    v5->_baseToken = (NSString *)v251;

    uint64_t v253 = objc_opt_class();
    uint64_t v255 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v254, v253, @"DisplayedHostname");
    displayedHostname = v5->_displayedHostname;
    v5->_displayedHostname = (NSString *)v255;

    uint64_t v257 = objc_opt_class();
    uint64_t v259 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v258, v257, @"URL");
    mutableURL = v5->_mutableURL;
    v5->_mutableURL = (NSURL *)v259;

    uint64_t v261 = objc_opt_class();
    uint64_t v263 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v262, v261, @"PreviousProtectionDataEtagFromUnitTest");
    previousProtectionEtagFromUnitTest = v5->_previousProtectionEtagFromUnitTest;
    v5->_previousProtectionEtagFromUnitTest = (NSString *)v263;

    uint64_t v265 = objc_opt_class();
    uint64_t v267 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v266, v265, @"PCSKeyID");
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v267;

    v269 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v270 = objc_opt_class();
    uint64_t v271 = objc_opt_class();
    uint64_t v274 = objc_msgSend_setWithObjects_(v269, v272, v270, v273, v271, 0);
    uint64_t v276 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v275, (uint64_t)v274, @"AllPCSKeyIDs");
    allPCSKeyIDs = v5->_allPCSKeyIDs;
    v5->_allPCSKeyIDs = (NSArray *)v276;

    v5->_BOOL trackChanges = 1;
    uint64_t v278 = v5->_valueStore;
    if (v278) {
      v278->_BOOL trackChanges = 1;
    }
    if (*p_encryptedValueStore) {
      (*p_encryptedValueStore)->super._BOOL trackChanges = 1;
    }
    uint64_t v279 = objc_opt_class();
    uint64_t v281 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v280, v279, @"ExpirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v281;

    v5->_expired = objc_msgSend_decodeBoolForKey_(v4, v283, @"Expired", v284);
    v5->_uint64_t hasUpdatedExpirationTimeInterval = objc_msgSend_decodeBoolForKey_(v4, v285, @"HasUpdatedExpiration", v286);
    uint64_t v287 = objc_opt_class();
    uint64_t v289 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v288, v287, @"UpdatedExpiration");
    updatedExpirationTimeInterval = v5->_updatedExpirationTimeInterval;
    v5->_updatedExpirationTimeInterval = (NSNumber *)v289;

    v5->_uint64_t isMergeableValueDeltaRecord = objc_msgSend_decodeBoolForKey_(v4, v291, @"MergeableValueDeltaRecord", v292);
    v5->_needsRollAndCounterSign = objc_msgSend_decodeBoolForKey_(v4, v293, @"NeedsRollAndCounterSignKey", v294);
    v295 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v296 = objc_opt_class();
    uint64_t v297 = objc_opt_class();
    uint64_t v298 = objc_opt_class();
    uint64_t v299 = objc_opt_class();
    uint64_t v302 = objc_msgSend_setWithObjects_(v295, v300, v296, v301, v297, v298, v299, 0);
    uint64_t v304 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v303, (uint64_t)v302, @"PCSKeysToRemove");
    pcsKeysToRemove = v5->_pcsKeysToRemove;
    v5->_pcsKeysToRemove = (CKPCSKeysToRemove *)v304;

    v5->_applyPCSKeysToRemoveForTesting = objc_msgSend_decodeBoolForKey_(v4, v306, @"ApplyPCSKeysToRemoveForTesting", v307);
  }
  uint64_t v308 = v5;
LABEL_44:

  return v308;
}

- (unint64_t)assetCount
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v13, 3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0AFB4C;
  v8[3] = &unk_1E5463978;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)assetDiskSize
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v13, 3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0AFF18;
  v8[3] = &unk_1E5463978;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setStreamingAssetRequestOptions:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_valueStore(self, v5, v6, v7);
  v15[0] = objc_opt_class();
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v15, 1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B0B02D4;
  v13[3] = &unk_1E54639A0;
  id v14 = v4;
  id v11 = v4;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v8, v12, (uint64_t)v10, (uint64_t)v13);
}

- (void)releasePackages
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueStore(self, a2, v2, v3);
  v8[0] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 1);
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1ED7F07F8);
}

- (void)removePackages
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueStore(self, a2, v2, v3);
  v8[0] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 1);
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1ED7F0818);
}

- (void)claimPackagesWithSuccessBlock:(id)a3 failureBlock:(id)a4 completionBlock:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id, id))a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v16 = objc_msgSend_valueStore(self, v13, v14, v15);
  v34[0] = objc_opt_class();
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v34, 1);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = sub_18B0B0654;
  v24[3] = &unk_1E54639E8;
  id v19 = v11;
  id v25 = v19;
  id v20 = v8;
  id v27 = v20;
  uint64_t v29 = &v30;
  id v21 = v12;
  id v26 = v21;
  id v22 = v9;
  id v28 = v22;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v16, v23, (uint64_t)v18, (uint64_t)v24);

  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v31 + 24), v19, v21);
  }

  _Block_object_dispose(&v30, 8);
}

+ (id)keyForListField:(id)a3 withIndexRange:(_NSRange)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@[%ld..<%ld]", a4.location, a3, a4.location, a4.location + a4.length);
}

+ (id)keyForInsertingIntoListField:(id)a3 atIndex:(int64_t)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@[%ld..<%ld]", a4, a3, a4, a4);
}

+ (id)keyForAppendingToListField:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@[%ld..<%ld]", v3, a3, -1, 0);
}

+ (id)keyForFetchingItems:(unint64_t)a3 atEndOfListField:(id)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@[%ld..<%ld]", (uint64_t)a4, a4, ~a3, 0);
}

- (BOOL)containsMergeableValues
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v7, 1);
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_passingTest_(self, v5, (uint64_t)v4, (uint64_t)&unk_1ED7EC5E8);

  return (char)self;
}

- (BOOL)containsAssetBackedMergeableDeltas
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v7, 1);
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_passingTest_(self, v5, (uint64_t)v4, (uint64_t)&unk_1ED7EC608);

  return (char)self;
}

- (BOOL)canSkipRecordSaveForMergeables
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_isKnownToServer(self, a2, v2, v3)) {
    return 0;
  }
  id v8 = objc_msgSend_etag(self, v5, v6, v7);

  if (!v8) {
    return 0;
  }
  if (objc_msgSend_hasUpdatedExpirationTimeInterval(self, v9, v10, v11)) {
    return 0;
  }
  if (objc_msgSend_hasUpdatedShare(self, v12, v13, v14)) {
    return 0;
  }
  if (objc_msgSend_hasUpdatedParent(self, v15, v16, v17)) {
    return 0;
  }
  if (objc_msgSend_requiresRecordSaveForMergeableDeltas(self, v18, v19, v20)) {
    return 0;
  }
  uint64_t v24 = objc_msgSend_changedKeys(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);

  if (!v28) {
    return 0;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v32 = objc_msgSend_changedKeys(self, v29, v30, v31, 0);
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v34)
  {
    uint64_t v37 = v34;
    uint64_t v38 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(v32);
        }
        uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(self, v35, v40, v36);
        uint64_t v45 = v41;
        if (v41)
        {
          id v46 = v41;
        }
        else
        {
          uint64_t v47 = objc_msgSend_encryptedValues(self, v42, v43, v44);
          objc_msgSend_objectForKeyedSubscript_(v47, v48, v40, v49);
          id v46 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend_isValueIDKnownToServer(v46, v50, v51, v52) & 1) == 0)
        {

          BOOL v53 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v55, (uint64_t)v59, 16);
      BOOL v53 = 1;
      if (v37) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v53 = 1;
  }
LABEL_25:

  return v53;
}

- (BOOL)containsMergeableValuesWithDeltasToSave
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v7, 1);
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_options_passingTest_(self, v5, (uint64_t)v4, 1, &unk_1ED7EC628);

  return (char)self;
}

- (BOOL)prepareMergeablesForUploadInContainer:(id)a3 useAssetsIfNecessary:(BOOL)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = objc_opt_class();
  id v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v14, 1);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B0B0DA0;
  v12[3] = &unk_1E5463A28;
  BOOL v13 = a4;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v10, (uint64_t)v9, (uint64_t)v12);

  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (void)countMergeableValueMetrics:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v21[0] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v21, 1);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = sub_18B0B1278;
  v8[3] = &unk_1E5463A50;
  v8[4] = &v17;
  void v8[5] = &v13;
  v8[6] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v7, (uint64_t)v6, (uint64_t)v8);

  v4[2](v4, v18[3], v14[3], v10[3]);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)setExpirationAfterTimeInterval:(id)a3
{
  id v8 = a3;
  objc_msgSend_setHasUpdatedExpirationTimeInterval_(self, v4, 1, v5);
  objc_msgSend_setUpdatedExpirationTimeInterval_(self, v6, (uint64_t)v8, v7);
}

- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_valueStore(self, v10, v11, v12);
  if (objc_msgSend_containsValueOfClasses_options_passingTest_(v13, v14, (uint64_t)v8, a4, v9))
  {
    char v18 = 1;
  }
  else
  {
    uint64_t v19 = objc_msgSend_encryptedValueStore(self, v15, v16, v17);
    char v18 = objc_msgSend_containsValueOfClasses_options_passingTest_(v19, v20, (uint64_t)v8, a4, v9);
  }
  return v18;
}

- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, (uint64_t)a3, 0, a4);
}

- (BOOL)containsValuePassingTest:(id)a3
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, 0, 0, a3);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v13 = objc_msgSend_valueStore(self, v10, v11, v12);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_18B0B1648;
  uint64_t v24 = &unk_1E5463A78;
  id v14 = v9;
  id v25 = v14;
  uint64_t v26 = &v27;
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(v13, v15, (uint64_t)v8, a4, &v21);

  if (!*((unsigned char *)v28 + 24))
  {
    uint64_t v19 = objc_msgSend_encryptedValueStore(self, v16, v17, v18, v21, v22, v23, v24);
    objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(v19, v20, (uint64_t)v8, a4, v14);
  }
  _Block_object_dispose(&v27, 8);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRecordID:(id)a3
{
}

- (CKRecordID)creatorUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCreatorUserRecordID:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (CKRecordID)lastModifiedUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastModifiedUserRecordID:(id)a3
{
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setModificationDate:(id)a3
{
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerID:(id)a3
{
}

- (CKRecordValueStore)valueStore
{
  return (CKRecordValueStore *)objc_getProperty(self, a2, 168, 1);
}

- (void)setValueStore:(id)a3
{
}

- (CKEncryptedRecordValueStore)encryptedValueStore
{
  return (CKEncryptedRecordValueStore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEncryptedValueStore:(id)a3
{
}

- (BOOL)needsRollAndCounterSign
{
  return self->_needsRollAndCounterSign;
}

- (void)setNeedsRollAndCounterSign:(BOOL)a3
{
  self->_needsRollAndCounterSign = a3;
}

- (BOOL)applyPCSKeysToRemoveForTesting
{
  return self->_applyPCSKeysToRemoveForTesting;
}

- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3
{
  self->_applyPCSKeysToRemoveForTesting = a3;
}

- (BOOL)hasUpdatedExpirationTimeInterval
{
  return self->_hasUpdatedExpirationTimeInterval;
}

- (void)setHasUpdatedExpirationTimeInterval:(BOOL)a3
{
  self->_uint64_t hasUpdatedExpirationTimeInterval = a3;
}

- (NSNumber)updatedExpirationTimeInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setUpdatedExpirationTimeInterval:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (BOOL)requiresRecordSaveForMergeableDeltas
{
  return self->_requiresRecordSaveForMergeableDeltas;
}

- (void)setRequiresRecordSaveForMergeableDeltas:(BOOL)a3
{
  self->_requiresRecordSaveForMergeableDeltas = a3;
}

- (BOOL)serializeProtectionData
{
  return self->_serializeProtectionData;
}

- (void)setSerializeProtectionData:(BOOL)a3
{
  self->_serializeProtectionData = a3;
}

- (NSData)zoneishKeyID
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setZoneishKeyID:(id)a3
{
}

- (NSString)previousProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPreviousProtectionEtag:(id)a3
{
}

- (NSString)protectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProtectionEtag:(id)a3
{
}

- (NSString)zoneProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setZoneProtectionEtag:(id)a3
{
}

- (NSString)shareEtag
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setShareEtag:(id)a3
{
}

- (BOOL)isMergeableValueDeltaRecord
{
  return self->_isMergeableValueDeltaRecord;
}

- (void)setIsMergeableValueDeltaRecord:(BOOL)a3
{
  self->_uint64_t isMergeableValueDeltaRecord = a3;
}

- (NSString)previousProtectionEtagFromUnitTest
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPreviousProtectionEtagFromUnitTest:(id)a3
{
}

- (NSData)pcsKeyID
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPcsKeyID:(id)a3
{
}

- (CKReference)previousShare
{
  return (CKReference *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreviousShare:(id)a3
{
}

- (BOOL)hasUpdatedShare
{
  return self->_hasUpdatedShare;
}

- (void)setHasUpdatedShare:(BOOL)a3
{
  self->_uint64_t hasUpdatedShare = a3;
}

- (CKReference)previousParent
{
  return (CKReference *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPreviousParent:(id)a3
{
}

- (BOOL)hasUpdatedParent
{
  return self->_hasUpdatedParent;
}

- (void)setHasUpdatedParent:(BOOL)a3
{
  self->_uint64_t hasUpdatedParent = a3;
}

- (CKEncryptedData)chainPrivateKey
{
  return (CKEncryptedData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setChainPrivateKey:(id)a3
{
}

- (NSData)chainProtectionInfo
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setChainProtectionInfo:(id)a3
{
}

- (NSData)chainParentPublicKeyID
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setChainParentPublicKeyID:(id)a3
{
}

- (CKPCSKeysToRemove)pcsKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPcsKeysToRemove:(id)a3
{
}

- (NSURL)mutableURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setMutableURL:(id)a3
{
}

- (BOOL)isKnownToServer
{
  return self->_knownToServer;
}

- (void)setKnownToServer:(BOOL)a3
{
  self->_knownToServer = a3;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (NSString)etag
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEtag:(id)a3
{
}

- (NSString)modifiedByDevice
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setModifiedByDevice:(id)a3
{
}

- (NSData)protectionData
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setProtectionData:(id)a3
{
}

- (BOOL)wantsChainPCS
{
  return self->_wantsChainPCS;
}

- (void)setWantsChainPCS:(BOOL)a3
{
  self->_wantsChainPCS = a3;
}

- (BOOL)useLightweightPCS
{
  return self->_useLightweightPCS;
}

- (void)setUseLightweightPCS:(BOOL)a3
{
  self->_useLightweightPCS = a3;
}

- (NSString)routingKey
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRoutingKey:(id)a3
{
}

- (BOOL)wantsPublicSharingKey
{
  return self->_wantsPublicSharingKey;
}

- (void)setWantsPublicSharingKey:(BOOL)a3
{
  self->_wantsPublicSharingKey = a3;
}

@end
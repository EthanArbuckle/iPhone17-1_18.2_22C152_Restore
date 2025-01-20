@interface CKDProtocolTranslator
+ (id)standaloneTranslatorWithPackageStagingDirectory:(id)a3 databaseScope:(int64_t)a4;
- (BOOL)_isDefaultUserNameFromClient:(id)a3;
- (BOOL)_isDefaultUserNameFromServer:(id)a3;
- (BOOL)_valueTypeIsAnEncryptedBytesTypeForField:(id)a3;
- (BOOL)addDatabaseScopeToZoneIDs;
- (BOOL)dontCreateValidatingParentReferences;
- (BOOL)haveDownloadPreauthorizations;
- (BOOL)objectIsAnEncryptedType:(id)a3;
- (CKDPCSManager)pcsManager;
- (CKDPIdentifier)pUserID;
- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4;
- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4 requireContainerScopedUserID:(BOOL)a5;
- (CKDProtocolTranslatorIdentityDelegate)identityDelegate;
- (NSMutableDictionary)downloadPreauthorizationMap;
- (NSString)containerScopedUserID;
- (NSString)orgAdminUserID;
- (NSString)overriddenContainerScopedUserID;
- (NSString)packageStagingDirectory;
- (id)_capabilitiesFromPCapabilities:(id)a3 level:(int)a4;
- (id)_pRecordFromRecordSansValues:(id)a3 forCache:(BOOL)a4;
- (id)assetFromPAsset:(id)a3 error:(id *)a4;
- (id)blockedIdentityFromPBlockedUser:(id)a3;
- (id)containerPrivacySettingsFromPContainerPrivacySettings:(id)a3;
- (id)dateFromPDate:(id)a3;
- (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4;
- (id)deltaPRecordFromRecord:(id)a3 withAllFields:(BOOL)a4 outDeletedMergeFields:(id *)a5 outKeysToSend:(id *)a6;
- (id)deviceCapabilitySetFromPDeviceCapabilitySet:(id)a3;
- (id)downloadPreauthorizationForResponseUUID:(id)a3;
- (id)encryptedFieldValueOfType:(int)a3 withObject:(id)a4;
- (id)encryptedObjectRepresentationFromFieldValue:(id)a3;
- (id)featureSetFromPAdopterFeatureSet:(id)a3 ofFeatureClass:(Class)a4;
- (id)fieldValueFromObject:(id)a3;
- (id)fieldValueFromObject:(id)a3 forCache:(BOOL)a4;
- (id)fieldValueOfType:(int)a3 withObject:(id)a4;
- (id)fieldValueOfType:(int)a3 withObject:(id)a4 forCache:(BOOL)a5;
- (id)identityFromPUser:(id)a3;
- (id)initInternalWithContainerScopedUserID:(id)a3 orgAdminUserID:(id)a4 packageStagingDirectory:(id)a5 databaseScope:(int64_t)a6 addDatabaseScopeToZoneIDs:(BOOL)a7 pcsManager:(id)a8;
- (id)locationFieldValueWithLatitude:(double)a3 longitude:(double)a4;
- (id)mergeableDeltaFromPDelta:(id)a3 valueID:(id)a4 error:(id *)a5;
- (id)mergeableDeltaMetadataFromPMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5;
- (id)mergeableRecordValueFromPRecordField:(id)a3 inPRecordIdentifier:(id)a4 asAnonymousCKUserID:(id)a5 error:(id *)a6;
- (id)mergeableValueIDFromPMergeableValueIdentifier:(id)a3 recordName:(id)a4 fieldName:(id)a5 encrypted:(BOOL)a6 error:(id *)a7;
- (id)notificationFromPPushMessage:(id)a3;
- (id)objectRepresentationFromField:(id)a3 inRecord:(id)a4 asAnonymousCKUserID:(id)a5;
- (id)objectRepresentationFromFieldValue:(id)a3;
- (id)pAdopterFeatureSetFromFeatureSet:(id)a3;
- (id)pAdopterFeatureSetFromRequiredFeatures:(id)a3;
- (id)pAliasWithEmailAddress:(id)a3;
- (id)pAliasWithHashedStringID:(id)a3 type:(int)a4;
- (id)pAliasWithIdentityLookupInfo:(id)a3;
- (id)pAliasWithPhoneNumber:(id)a3;
- (id)pAliasWithUserRecordID:(id)a3;
- (id)pAssetFromAsset:(id)a3;
- (id)pBlockedUserFromShareBlockedIdentity:(id)a3;
- (id)pCapabilitiesFrom:(id)a3;
- (id)pContainerScopedRecordIdentifierWithPRecordIdentifier:(id)a3;
- (id)pContainerScopedRecordZoneIdentifierFromFromPRecordZoneIdentifier:(id)a3;
- (id)pContainerScopedUserIdentifierFromPUserIdentifier:(id)a3;
- (id)pDateFromDate:(id)a3;
- (id)pDeviceCapabilitiesFromDeviceCapabilitySet:(id)a3 withDeviceID:(id)a4;
- (id)pEncryptedMergeableValueFromRecordValue:(id)a3;
- (id)pFieldActionWithLocation:(int64_t)a3 length:(unint64_t)a4 values:(id)a5;
- (id)pFieldWithKey:(id)a3 value:(id)a4;
- (id)pFieldWithKey:(id)a3 value:(id)a4 forCache:(BOOL)a5;
- (id)pIdentifierFromUserRecordID:(id)a3;
- (id)pMergeableDeltaFromDelta:(id)a3 error:(id *)a4;
- (id)pMergeableDeltaMetadataFromMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5;
- (id)pMergeableValueFromMergeableValueID:(id)a3;
- (id)pMergeableValueIdentifierFromMergeableValueID:(id)a3;
- (id)pPackageFromPackage:(id)a3;
- (id)pParticipantFromShareParticipant:(id)a3 forCache:(BOOL)a4;
- (id)pProtectionInfoKeysToRemoveFromPCSKeysToRemove:(id)a3;
- (id)pQueryFromQuery:(id)a3 error:(id *)a4;
- (id)pRecordFromRecord:(id)a3;
- (id)pRecordFromRecord:(id)a3 forCache:(BOOL)a4;
- (id)pRecordIdentifierFromRecordID:(id)a3;
- (id)pRecordIdentifierFromUserRecordName:(id)a3;
- (id)pRecordZoneFromRecordZone:(id)a3;
- (id)pRecordZoneIdentifierFromRecordZoneID:(id)a3;
- (id)pReferenceFromReference:(id)a3 error:(id *)a4;
- (id)pRequesterFromShareRequester:(id)a3;
- (id)pShareFromShare:(id)a3 forCache:(BOOL)a4;
- (id)pShareIdentifierFromRecordID:(id)a3;
- (id)pShareUsageFromShareRecordID:(id)a3 at:(id)a4 withDeviceID:(id)a5;
- (id)pSignedVersionedBlobFrom:(id)a3 signature:(id)a4;
- (id)pStreamingAssetFromStreamingAsset:(id)a3 forCache:(BOOL)a4;
- (id)pSubscriptionFromSubscription:(id)a3 error:(id *)a4;
- (id)pUserIdentifierFromUserRecordName:(id)a3;
- (id)pZoneCryptoFeatureRequirmentsFromZone:(id)a3;
- (id)pZoneUsageFromZoneID:(id)a3 at:(id)a4 withDeviceID:(id)a5;
- (id)packageFromPPackage:(id)a3 error:(id *)a4;
- (id)pcsKeysToRemoveFromPProtectionInfoKeysToRemove:(id)a3;
- (id)recordFromPRecord:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)recordFromPRecord:(id)a3 error:(id *)a4;
- (id)recordIDFromPRecordIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)recordIDFromPRecordIdentifier:(id)a3 error:(id *)a4;
- (id)recordIDFromPShareIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)recordIDFromPShareIdentifier:(id)a3 error:(id *)a4;
- (id)recordIDFromPUserName:(id)a3 error:(id *)a4;
- (id)recordZoneFromPRecordZone:(id)a3 asAnonymousCKUserID:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6;
- (id)recordZoneFromPRecordZone:(id)a3 error:(id *)a4;
- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 error:(id *)a4;
- (id)referenceFromPReference:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)referenceFromPReference:(id)a3 error:(id *)a4;
- (id)requiredFeatureSetFromPAdopterFeatureSet:(id)a3;
- (id)shareFromPShare:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5;
- (id)shareFromPShare:(id)a3 error:(id *)a4;
- (id)shareParticipantFromPParticipant:(id)a3 shareID:(id)a4 error:(id *)a5;
- (id)shareRequesterFromPRequester:(id)a3;
- (id)streamingAssetFromPStreamingAsset:(id)a3 error:(id *)a4;
- (id)subscriptionFromPSubscription:(id)a3 error:(id *)a4;
- (id)userNameFromPIdentifier:(id)a3 error:(id *)a4;
- (int)fieldValueTypeFromEncryptedDataObject:(id)a3 isInList:(BOOL)a4;
- (int)fieldValueTypeFromObject:(id)a3;
- (int64_t)databaseScope;
- (int64_t)overriddenDatabaseScope;
- (unint64_t)capabilitiesFromPZoneCapabilities:(id)a3;
- (void)addCapability:(id)a3 to:(id)a4;
- (void)consumeResponseHeader:(id)a3;
- (void)setDontCreateValidatingParentReferences:(BOOL)a3;
- (void)setDownloadPreauthorization:(id)a3 forResponseUUID:(id)a4;
- (void)setIdentityDelegate:(id)a3;
- (void)setOverriddenContainerScopedUserID:(id)a3;
- (void)setOverriddenDatabaseScope:(int64_t)a3;
@end

@implementation CKDProtocolTranslator

- (int)fieldValueTypeFromEncryptedDataObject:(id)a3 isInList:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    int v6 = 21;
  }
  else {
    int v6 = 20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 2;
    int v9 = 10;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 3;
    int v9 = 15;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 7;
    int v9 = 17;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 8;
    int v9 = 18;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 5;
    int v9 = 13;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = !v4;
    int v8 = 4;
    int v9 = 12;
LABEL_16:
    if (v7) {
      int v10 = v8;
    }
    else {
      int v10 = v9;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = 10;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = 15;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = 17;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v10 = 18;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v10 = 12;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v10 = 9;
            }
            else {
              int v10 = v6;
            }
          }
        }
      }
    }
  }
LABEL_19:

  return v10;
}

- (int)fieldValueTypeFromObject:(id)a3
{
  CFNumberRef v4 = (const __CFNumber *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = CFNumberIsFloatType(v4) == 0;
    int v6 = 7;
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 2;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 3;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 1;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = objc_msgSend_fieldValueTypeFromEncryptedDataObject_isInList_(self, v8, (uint64_t)v4, 0);
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFNumberRef v9 = v4;
    if (!objc_msgSend_count(v9, v10, v11))
    {
      int v7 = 9;
      goto LABEL_26;
    }
    v13 = objc_msgSend_objectAtIndexedSubscript_(v9, v12, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v7 = 13;
LABEL_20:

LABEL_26:
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 11;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = objc_msgSend_fieldValueTypeFromEncryptedDataObject_isInList_(self, v15, (uint64_t)v13, 1);
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 10;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 12;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (CFNumberIsFloatType((CFNumberRef)v13)) {
        int v7 = 18;
      }
      else {
        int v7 = 17;
      }
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 15;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 14;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = 25;
      goto LABEL_20;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F1A018]);
    v29 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v29);
    v26 = objc_msgSend_initWithCode_format_(v28, v30, 1006, @"Can't encode array %@ of unknown child class: %@", v9, v24);
LABEL_57:
    id v27 = v26;

    objc_exception_throw(v27);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v7 = 5;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 6;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 19;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 4;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 24;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1A018]);
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v26 = objc_msgSend_initWithCode_format_(v22, v25, 1006, @"Can't encode object %@ of class %@", v4, v24);
    goto LABEL_57;
  }
  v18 = objc_msgSend_valueID(v4, v16, v17);
  int isEncrypted = objc_msgSend_isEncrypted(v18, v19, v20);

  BOOL v5 = isEncrypted == 0;
  int v6 = 28;
LABEL_3:
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = v6 + 1;
  }
LABEL_27:

  return v7;
}

- (BOOL)objectIsAnEncryptedType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_firstObject(v3, v4, v5);

    id v3 = (id)v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEncrypted = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = objc_msgSend_valueID(v3, v8, v9);
      char isEncrypted = objc_msgSend_isEncrypted(v10, v11, v12);
    }
    else
    {
      char isEncrypted = 0;
    }
  }

  return isEncrypted;
}

- (id)fieldValueFromObject:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = objc_msgSend_fieldValueTypeFromObject_(self, v6, (uint64_t)v7);
    if (objc_msgSend_objectIsAnEncryptedType_(self, v9, (uint64_t)v7)) {
      objc_msgSend_encryptedFieldValueOfType_withObject_(self, v10, v8, v7);
    }
    else {
    uint64_t v11 = objc_msgSend_fieldValueOfType_withObject_forCache_(self, v10, v8, v7, v4);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)fieldValueFromObject:(id)a3
{
  return (id)objc_msgSend_fieldValueFromObject_forCache_(self, a2, (uint64_t)a3, 0);
}

- (id)encryptedFieldValueOfType:(int)a3 withObject:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setType_(v8, v9, v4);
  objc_msgSend_setIsEncrypted_(v8, v10, 1);
  switch((int)v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
    case 15:
    case 17:
    case 18:
    case 20:
      v13 = objc_msgSend_encryptedData(v7, v11, v12);
      objc_msgSend_setBytesValue_(v8, v14, (uint64_t)v13);
      goto LABEL_3;
    case 6:
    case 13:
    case 14:
    case 16:
    case 19:
    case 24:
    case 25:
    case 28:
    case 30:
    case 31:
      v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
      int v17 = v4 - 6;
      if (v4 - 6) < 0x1A && ((0x3CCFFFFu >> v17))
      {
        v18 = off_1E64F3A50[v17];
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v15, (uint64_t)a2, self, @"CKDRecordFieldConversion.m", 373, @"Invalid type %@ on encrypted field object %@", v18, v7);
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v15, @"(unknown: %i)", v4);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v19, (uint64_t)a2, self, @"CKDRecordFieldConversion.m", 373, @"Invalid type %@ on encrypted field object %@", v18, v7);
      }

      break;
    case 9:
      objc_msgSend_setBytesValue_(v8, v11, 0);
      break;
    case 11:
    case 21:
      objc_msgSend_setIsEncrypted_(v8, v11, 0);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v21 = v7;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v38, v44, 16);
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v21);
            }
            uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = objc_alloc(MEMORY[0x1E4F1A018]);
              id v37 = (id)objc_msgSend_initWithCode_format_(v35, v36, 1006, @"Nesting arrays not supported");
              objc_exception_throw(v37);
            }
            v29 = objc_msgSend_fieldValueFromObject_(self, v28, v27);
            objc_msgSend_addListValue_(v8, v30, (uint64_t)v29);
          }
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v31, (uint64_t)&v38, v44, 16);
        }
        while (v24);
      }

      break;
    case 29:
      objc_msgSend_setIsEncrypted_(v8, v11, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = objc_msgSend_pEncryptedMergeableValueFromRecordValue_(self, v32, (uint64_t)v7);
        objc_msgSend_setEncryptedMergeableValue_(v8, v33, (uint64_t)v13);
LABEL_3:
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v34 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v7;
          _os_log_fault_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_FAULT, "Trying to create a mergeable value field from something that isn't a mergeable: %@", buf, 0xCu);
        }
      }
      break;
    default:
      break;
  }

  return v8;
}

- (id)fieldValueOfType:(int)a3 withObject:(id)a4 forCache:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  int v10 = objc_opt_new();
  objc_msgSend_setType_(v10, v11, v6);
  switch((int)v6)
  {
    case 1:
      objc_msgSend_setBytesValue_(v10, v12, (uint64_t)v9);
      goto LABEL_37;
    case 2:
      id v27 = objc_alloc_init(MEMORY[0x1E4F19EF8]);
      objc_msgSend_setDateValue_(v10, v28, (uint64_t)v27);

      objc_msgSend_timeIntervalSinceReferenceDate(v9, v29, v30);
      double v32 = v31;
      id v35 = objc_msgSend_dateValue(v10, v33, v34);
      objc_msgSend_setTime_(v35, v36, v37, v32);
      goto LABEL_23;
    case 3:
      objc_msgSend_setStringValue_(v10, v12, (uint64_t)v9);
      goto LABEL_37;
    case 4:
      id v35 = objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E4F1E5F0], v12, (uint64_t)v9);
      objc_msgSend_setLocationValue_(v10, v38, (uint64_t)v35);
      goto LABEL_23;
    case 5:
      uint64_t v25 = objc_opt_new();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = objc_msgSend_recordID(v9, v39, v40);
        id v43 = objc_msgSend_pRecordIdentifierFromRecordID_(self, v42, (uint64_t)v41);
        objc_msgSend_setRecordIdentifier_(v25, v44, (uint64_t)v43);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v41 = objc_msgSend_pRecordIdentifierFromRecordID_(self, v57, (uint64_t)v9);
          objc_msgSend_setRecordIdentifier_(v25, v58, (uint64_t)v41);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_35;
          }
          objc_msgSend_pReferenceFromReference_error_(self, v60, (uint64_t)v9, 0);
          uint64_t v25 = v41 = v25;
        }
      }

LABEL_35:
      objc_msgSend_setReferenceValue_(v10, v60, (uint64_t)v25);
      goto LABEL_36;
    case 6:
      id v35 = objc_msgSend_pAssetFromAsset_(self, v12, (uint64_t)v9);
      objc_msgSend_setAssetValue_(v10, v45, (uint64_t)v35);
      goto LABEL_23;
    case 7:
      uint64_t v46 = objc_msgSend_longLongValue(v9, v12, v13);
      objc_msgSend_setSignedValue_(v10, v47, v46);
      goto LABEL_37;
    case 8:
      objc_msgSend_doubleValue(v9, v12, v13);
      objc_msgSend_setCkDoubleValue_(v10, v48, v49);
      goto LABEL_37;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
    case 25:
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v14 = v9;
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v65, v69, 16);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v66 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v62 = objc_alloc(MEMORY[0x1E4F1A018]);
              id v64 = (id)objc_msgSend_initWithCode_format_(v62, v63, 1006, @"Nesting arrays not supported", (void)v65);
              objc_exception_throw(v64);
            }
            id v22 = objc_msgSend_fieldValueFromObject_forCache_(self, v21, v20, v5, (void)v65);
            objc_msgSend_addListValue_(v10, v23, (uint64_t)v22);
          }
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v24, (uint64_t)&v65, v69, 16);
        }
        while (v17);
      }

      goto LABEL_37;
    case 19:
      id v35 = objc_msgSend_pPackageFromPackage_(self, v12, (uint64_t)v9);
      objc_msgSend_setPackageValue_(v10, v50, (uint64_t)v35);
      goto LABEL_23;
    case 20:
    case 21:
    case 29:
      uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDRecordFieldConversion.m", 476, @"Did not expect encrypted types while creating field value");
      goto LABEL_36;
    case 24:
      id v35 = objc_msgSend_pStreamingAssetFromStreamingAsset_forCache_(self, v12, (uint64_t)v9, v5);
      objc_msgSend_setStreamingAssetValue_(v10, v51, (uint64_t)v35);
LABEL_23:

      goto LABEL_37;
    case 28:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = objc_msgSend_valueID(v9, v52, v53);
        v55 = objc_msgSend_pMergeableValueFromMergeableValueID_(self, v54, (uint64_t)v25);
        objc_msgSend_setMergeableValue_(v10, v56, (uint64_t)v55);

LABEL_36:
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v59 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v9;
          _os_log_fault_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_FAULT, "Trying to create a mergeable value field from something that isn't a mergeable record value: %@", buf, 0xCu);
        }
      }
LABEL_37:

      return v10;
    default:
      goto LABEL_37;
  }
}

- (id)fieldValueOfType:(int)a3 withObject:(id)a4
{
  return (id)objc_msgSend_fieldValueOfType_withObject_forCache_(self, a2, *(uint64_t *)&a3, a4, 0);
}

- (id)locationFieldValueWithLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v6 = objc_opt_new();
  objc_msgSend_setType_(v6, v7, 4);
  if (a4 > 180.0 || a3 < -90.0 || a3 > 90.0 || a4 < -180.0)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1A018]);
    id v17 = (id)objc_msgSend_initWithCode_format_(v15, v16, 1006, @"Invalid latitude/longitude value in location");
    objc_exception_throw(v17);
  }
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setLatitude_(v8, v9, v10, a3);
  objc_msgSend_setLongitude_(v8, v11, v12, a4);
  objc_msgSend_setLocationValue_(v6, v13, (uint64_t)v8);

  return v6;
}

- (id)encryptedObjectRepresentationFromFieldValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = 0;
  switch(objc_msgSend_type(v3, v4, v5))
  {
    case 1u:
    case 0x14u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FA0];
      goto LABEL_19;
    case 2u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FA8];
      goto LABEL_19;
    case 3u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FF8];
      goto LABEL_19;
    case 4u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FD0];
      goto LABEL_19;
    case 5u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FF0];
      goto LABEL_19;
    case 6u:
    case 0xBu:
    case 0xDu:
    case 0xEu:
    case 0x10u:
    case 0x13u:
    case 0x15u:
    case 0x18u:
    case 0x19u:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v7 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        uint64_t v22 = objc_msgSend_type(v3, v8, v9);
        int v24 = v22 - 1;
        if (v22 - 1) < 0x1F && ((0x799FFFFFu >> v24))
        {
          uint64_t v25 = off_1E64F3B20[v24];
        }
        else
        {
          objc_msgSend_stringWithFormat_(NSString, v23, @"(unknown: %i)", v22);
          uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        id v27 = v25;
        _os_log_fault_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_FAULT, "Did not expect %@ field to have encrypted flag set", buf, 0xCu);
      }
      uint64_t v6 = 0;
      break;
    case 7u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FE0];
      goto LABEL_19;
    case 8u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FB8];
      goto LABEL_19;
    case 9u:
      id v11 = objc_alloc(MEMORY[0x1E4F19FC8]);
      id v14 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v12, v13);
      uint64_t v16 = objc_msgSend_initWithData_(v11, v15, (uint64_t)v14);
      goto LABEL_20;
    case 0xAu:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FB0];
      goto LABEL_19;
    case 0xCu:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FD8];
      goto LABEL_19;
    case 0xFu:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F1A000];
      goto LABEL_19;
    case 0x11u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FE8];
      goto LABEL_19;
    case 0x12u:
      uint64_t v10 = (objc_class *)MEMORY[0x1E4F19FC0];
LABEL_19:
      id v17 = [v10 alloc];
      id v14 = objc_msgSend_bytesValue(v3, v18, v19);
      uint64_t v16 = objc_msgSend_initWithEncryptedData_(v17, v20, (uint64_t)v14);
LABEL_20:
      uint64_t v6 = (void *)v16;

      break;
    default:
      break;
  }

  return v6;
}

- (id)objectRepresentationFromFieldValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_msgSend_setValue_(v5, v6, (uint64_t)v4);

  uint64_t v8 = objc_msgSend_objectRepresentationFromField_inRecord_asAnonymousCKUserID_(self, v7, (uint64_t)v5, 0, 0);

  return v8;
}

- (id)objectRepresentationFromField:(id)a3 inRecord:(id)a4 asAnonymousCKUserID:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_value(v8, v11, v12);
  if (objc_msgSend_isEncrypted(v13, v14, v15))
  {
    uint64_t v18 = objc_msgSend_encryptedObjectRepresentationFromFieldValue_(self, v16, (uint64_t)v13);
LABEL_3:
    uint64_t v19 = (void *)v18;
  }
  else
  {
    uint64_t v19 = objc_msgSend_listValues(v13, v16, v17);

    if (v19)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v73 = 0x2020000000;
      uint64_t v74 = 0;
      uint64_t v22 = objc_msgSend_listValues(v13, v20, v21);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = sub_1C4E155DC;
      v71[3] = &unk_1E64F3A30;
      v71[4] = self;
      v71[5] = &buf;
      uint64_t v19 = objc_msgSend_CKCompactMap_(v22, v23, (uint64_t)v71);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      switch(objc_msgSend_type(v13, v20, v21))
      {
        case 1u:
          uint64_t v18 = objc_msgSend_bytesValue(v13, v25, v26);
          goto LABEL_3;
        case 2u:
          double v31 = (void *)MEMORY[0x1E4F1C9C8];
          double v32 = objc_msgSend_dateValue(v13, v25, v26);
          objc_msgSend_time(v32, v33, v34);
          uint64_t v37 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v31, v35, v36);
          goto LABEL_47;
        case 3u:
          uint64_t v18 = objc_msgSend_stringValue(v13, v25, v26);
          goto LABEL_3;
        case 4u:
          long long v38 = (void *)MEMORY[0x1E4F1E5F0];
          double v32 = objc_msgSend_locationValue(v13, v25, v26);
          uint64_t v37 = objc_msgSend_CKLocationFromPLocationCoordinate_(v38, v39, (uint64_t)v32);
          goto LABEL_47;
        case 5u:
          uint64_t v40 = objc_msgSend_referenceValue(v13, v25, v26);
          id v70 = 0;
          uint64_t v19 = objc_msgSend_referenceFromPReference_error_(self, v41, (uint64_t)v40, &v70);
          id v42 = v70;

          if (v42 || !v19)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v43 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v42;
              _os_log_error_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_ERROR, "Invalid field value (record identifier) from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 6u:
          v44 = objc_msgSend_assetValue(v13, v25, v26);
          id v69 = 0;
          uint64_t v19 = objc_msgSend_assetFromPAsset_error_(self, v45, (uint64_t)v44, &v69);
          id v46 = v69;

          if (!v19 && v46)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v47 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v46;
              _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Invalid asset type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 7u:
          v48 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v49 = objc_msgSend_signedValue(v13, v25, v26);
          uint64_t v18 = objc_msgSend_numberWithLongLong_(v48, v50, v49);
          goto LABEL_3;
        case 8u:
          v51 = (void *)MEMORY[0x1E4F28ED0];
          objc_msgSend_ckDoubleValue(v13, v25, v26);
          uint64_t v18 = objc_msgSend_numberWithDouble_(v51, v52, v53);
          goto LABEL_3;
        case 9u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
        case 0xEu:
        case 0xFu:
        case 0x10u:
        case 0x11u:
        case 0x12u:
        case 0x15u:
        case 0x19u:
          uint64_t v18 = objc_msgSend_array(MEMORY[0x1E4F1C978], v25, v26);
          goto LABEL_3;
        case 0x13u:
          v54 = objc_msgSend_packageValue(v13, v25, v26);
          id v68 = 0;
          uint64_t v19 = objc_msgSend_packageFromPPackage_error_(self, v55, (uint64_t)v54, &v68);
          id v56 = v68;

          if (!v19 && v56)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v57 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v56;
              _os_log_error_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_ERROR, "Invalid package type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 0x14u:
          id v58 = objc_alloc(MEMORY[0x1E4F19FA0]);
          double v32 = objc_msgSend_bytesValue(v13, v59, v60);
          uint64_t v37 = objc_msgSend_initWithEncryptedData_(v58, v61, (uint64_t)v32);
LABEL_47:
          uint64_t v19 = (void *)v37;

          break;
        case 0x18u:
          id v62 = objc_msgSend_streamingAssetValue(v13, v25, v26);
          id v67 = 0;
          uint64_t v19 = objc_msgSend_streamingAssetFromPStreamingAsset_error_(self, v63, (uint64_t)v62, &v67);
          id v64 = v67;

          if (!v19 && v64)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            long long v65 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v64;
              _os_log_error_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_ERROR, "Invalid streaming asset type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 0x1Cu:
        case 0x1Du:
          if (v9)
          {
            id v27 = objc_msgSend_recordIdentifier(v9, v25, v26);
            id v66 = 0;
            uint64_t v19 = objc_msgSend_mergeableRecordValueFromPRecordField_inPRecordIdentifier_asAnonymousCKUserID_error_(self, v28, (uint64_t)v8, v27, v10, &v66);
            id v29 = v66;

            if (!v19 || v29)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v30 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v29;
                _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, "Invalid mergeable value type from server: %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v19 = 0;
          }
          break;
        default:
          break;
      }
    }
  }

  return v19;
}

- (id)pFieldWithKey:(id)a3 value:(id)a4 forCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v11 = objc_msgSend_fieldValueFromObject_forCache_(self, v10, (uint64_t)v9, v5);
  if (!v11)
  {
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = CKProcessIndexedArrayKey();
  id v15 = 0;
  if (v15)
  {
    if (v12)
    {
      id v41 = objc_alloc(MEMORY[0x1E4F1A018]);
      id v43 = objc_msgSend_initWithCode_format_(v41, v42, 2018, @"Could not parse key for indexed list field operation: %@", v12);
      goto LABEL_21;
    }
    uint64_t v16 = objc_msgSend_listValues(v11, v13, v14);
    if (v16)
    {
    }
    else if (objc_msgSend_type(v11, v17, v18) != 9)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F1A018]);
      id v43 = objc_msgSend_initWithCode_format_(v46, v47, 1006, @"Invalid value type for indexed list field key %@", v8);
      goto LABEL_21;
    }
    uint64_t v29 = objc_msgSend_listValues(v11, v19, v20);
    double v31 = (void *)v29;
    if (v29) {
      objc_msgSend_pFieldActionWithLocation_length_values_(self, v30, 0, 0, v29);
    }
    else {
    double v32 = objc_msgSend_pFieldActionWithLocation_length_values_(self, v30, 0, 0, MEMORY[0x1E4F1CBF0]);
    }

    if (v32)
    {
      uint64_t v21 = objc_opt_new();
      v33 = objc_opt_new();
      objc_msgSend_setIdentifier_(v21, v34, (uint64_t)v33);

      uint64_t v37 = objc_msgSend_identifier(v21, v35, v36);
      objc_msgSend_setName_(v37, v38, (uint64_t)v15);

      objc_msgSend_addAction_(v21, v39, (uint64_t)v32);
      goto LABEL_14;
    }
    id v44 = objc_alloc(MEMORY[0x1E4F1A018]);
    id v43 = objc_msgSend_initWithCode_format_(v44, v45, 2018, @"Could not produce action for indexed list field key %@", v8);
LABEL_21:
    objc_exception_throw(v43);
  }
  uint64_t v21 = objc_opt_new();
  uint64_t v22 = objc_opt_new();
  objc_msgSend_setIdentifier_(v21, v23, (uint64_t)v22);

  uint64_t v26 = objc_msgSend_identifier(v21, v24, v25);
  objc_msgSend_setName_(v26, v27, (uint64_t)v8);

  objc_msgSend_setValue_(v21, v28, (uint64_t)v11);
LABEL_14:

LABEL_15:
  return v21;
}

- (id)pFieldWithKey:(id)a3 value:(id)a4
{
  return (id)objc_msgSend_pFieldWithKey_value_forCache_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)pFieldActionWithLocation:(int64_t)a3 length:(unint64_t)a4 values:(id)a5
{
  id v7 = a5;
  id v10 = v7;
  if (a3 != -1 || a4)
  {
    if (a4)
    {
      int v19 = a4 + a3;
      uint64_t v20 = objc_msgSend_count(v7, v8, v9);
      id v11 = objc_opt_new();
      objc_msgSend_setIndex_(v11, v21, a3);
      objc_msgSend_setIsReversed_(v11, v22, 0);
      uint64_t v14 = objc_opt_new();
      objc_msgSend_setIndex_(v14, v23, (v19 - 1));
      objc_msgSend_setIsReversed_(v14, v24, 0);
      uint64_t v25 = objc_opt_new();
      objc_msgSend_setLeft_(v25, v26, (uint64_t)v11);
      objc_msgSend_setRight_(v25, v27, (uint64_t)v14);
      uint64_t v28 = objc_opt_new();
      objc_msgSend_setRange_(v28, v29, (uint64_t)v25);
      if (v20)
      {
        double v32 = objc_msgSend_mutableCopy(v10, v30, v31);
        objc_msgSend_setValues_(v28, v33, (uint64_t)v32);

        uint64_t v34 = objc_opt_new();
        objc_msgSend_setReplaceListRange_(v34, v35, (uint64_t)v28);
      }
      else
      {
        uint64_t v34 = objc_opt_new();
        objc_msgSend_setDeleteListRange_(v34, v43, (uint64_t)v28);
      }

      goto LABEL_11;
    }
    id v11 = objc_opt_new();
    objc_msgSend_setIndex_(v11, v36, a3);
    objc_msgSend_setIsReversed_(v11, v37, 0);
    uint64_t v14 = objc_opt_new();
    objc_msgSend_setPosition_(v14, v38, (uint64_t)v11);
    objc_msgSend_setInsertAfter_(v14, v39, 0);
  }
  else
  {
    id v11 = objc_opt_new();
    objc_msgSend_setIndex_(v11, v12, 0);
    objc_msgSend_setIsReversed_(v11, v13, 1);
    uint64_t v14 = objc_opt_new();
    objc_msgSend_setPosition_(v14, v15, (uint64_t)v11);
    objc_msgSend_setInsertAfter_(v14, v16, 1);
  }
  uint64_t v40 = objc_msgSend_mutableCopy(v10, v17, v18);
  objc_msgSend_setValues_(v14, v41, (uint64_t)v40);

  uint64_t v34 = objc_opt_new();
  objc_msgSend_setInsertIntoList_(v34, v42, (uint64_t)v14);
LABEL_11:

  return v34;
}

- (id)initInternalWithContainerScopedUserID:(id)a3 orgAdminUserID:(id)a4 packageStagingDirectory:(id)a5 databaseScope:(int64_t)a6 addDatabaseScopeToZoneIDs:(BOOL)a7 pcsManager:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CKDProtocolTranslator;
  uint64_t v20 = [(CKDProtocolTranslator *)&v32 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v14, v18, v19);
    containerScopedUserID = v20->_containerScopedUserID;
    v20->_containerScopedUserID = (NSString *)v21;

    uint64_t v25 = objc_msgSend_copy(v15, v23, v24);
    orgAdminUserID = v20->_orgAdminUserID;
    v20->_orgAdminUserID = (NSString *)v25;

    v20->_databaseScope = a6;
    uint64_t v29 = objc_msgSend_copy(v16, v27, v28);
    packageStagingDirectory = v20->_packageStagingDirectory;
    v20->_packageStagingDirectory = (NSString *)v29;

    v20->_addDatabaseScopeToZoneIDs = a7;
    objc_storeStrong((id *)&v20->_pcsManager, a8);
  }

  return v20;
}

- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4
{
  return (CKDProtocolTranslator *)objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(self, a2, (uint64_t)a3, a4, a4 != 1);
}

- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4 requireContainerScopedUserID:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  uint64_t v12 = objc_msgSend_containerScopedUserID(v9, v10, v11);

  if (!v12 && v5)
  {
    id v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, @"CKDProtocolTranslator.m", 110, @"Without a user id, this translator won't do what you want");
  }
  id v15 = objc_msgSend_options(v9, v13, v14);
  char v18 = objc_msgSend_addDatabaseScopeToZoneIDs(v15, v16, v17);

  if (v18)
  {
    BOOL v21 = 1;
  }
  else
  {
    uint64_t v22 = objc_msgSend_containerID(v9, v19, v20);
    BOOL v21 = objc_msgSend_specialContainerType(v22, v23, v24) == 5;
  }
  uint64_t v25 = objc_msgSend_containerScopedUserID(v9, v19, v20);
  uint64_t v28 = objc_msgSend_orgAdminUserID(v9, v26, v27);
  uint64_t v31 = objc_msgSend_directoryContext(v9, v29, v30);
  uint64_t v34 = objc_msgSend_packageStagingDirectory(v31, v32, v33);
  uint64_t v37 = objc_msgSend_path(v34, v35, v36);
  uint64_t v40 = objc_msgSend_pcsManager(v9, v38, v39);
  inited = (CKDProtocolTranslator *)objc_msgSend_initInternalWithContainerScopedUserID_orgAdminUserID_packageStagingDirectory_databaseScope_addDatabaseScopeToZoneIDs_pcsManager_(self, v41, (uint64_t)v25, v28, v37, a4, v21, v40);

  return inited;
}

+ (id)standaloneTranslatorWithPackageStagingDirectory:(id)a3 databaseScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  inited = objc_msgSend_initInternalWithContainerScopedUserID_orgAdminUserID_packageStagingDirectory_databaseScope_addDatabaseScopeToZoneIDs_pcsManager_(v7, v8, 0, 0, v6, a4, 0, 0);

  objc_msgSend_setOverriddenContainerScopedUserID_(inited, v10, *MEMORY[0x1E4F19DB0]);
  return inited;
}

- (BOOL)haveDownloadPreauthorizations
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_downloadPreauthorizationMap != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)downloadPreauthorizationForResponseUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v7 = objc_msgSend_objectForKeyedSubscript_(v5->_downloadPreauthorizationMap, v6, (uint64_t)v4);
  objc_sync_exit(v5);

  return v7;
}

- (void)setDownloadPreauthorization:(id)a3 forResponseUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_downloadPreauthorizationMap)
  {
    if (v6)
    {
LABEL_3:
      objc_msgSend_setObject_forKeyedSubscript_(v8->_downloadPreauthorizationMap, v9, (uint64_t)v6, v7);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10);
    downloadPreauthorizationMap = v8->_downloadPreauthorizationMap;
    v8->_downloadPreauthorizationMap = (NSMutableDictionary *)v11;

    if (v6) {
      goto LABEL_3;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v13 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "Download Preauthorization Failed to Init", v14, 2u);
  }
LABEL_9:
  objc_sync_exit(v8);
}

- (void)consumeResponseHeader:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  objc_msgSend_assetAuthorizationResponses(a3, a2, (uint64_t)a3);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v47, v52, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v41 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v41) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v13 = objc_msgSend_responseHeaders(v9, v11, v12);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v43, v51, 16);
        if (v15)
        {
          uint64_t v18 = v15;
          uint64_t v19 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(v13);
              }
              BOOL v21 = *(void **)(*((void *)&v43 + 1) + 8 * j);
              uint64_t v22 = objc_msgSend_headerValue(v21, v16, v17);
              uint64_t v25 = objc_msgSend_headerKey(v21, v23, v24);
              objc_msgSend_setObject_forKey_(v10, v26, (uint64_t)v22, v25);
            }
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v43, v51, 16);
          }
          while (v18);
        }

        id v27 = objc_alloc(MEMORY[0x1E4F19E58]);
        uint64_t v30 = objc_msgSend_responseUUID(v9, v28, v29);
        uint64_t v33 = objc_msgSend_authGetResponseBody(v9, v31, v32);
        id v35 = objc_msgSend_initWithResponseUUID_contentResponseHeaders_contentResponseBody_(v27, v34, (uint64_t)v30, v10, v33);

        long long v38 = objc_msgSend_responseUUID(v9, v36, v37);
        objc_msgSend_setDownloadPreauthorization_forResponseUUID_(self, v39, (uint64_t)v35, v38);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v47, v52, 16);
    }
    while (v7);
  }
}

- (int64_t)databaseScope
{
  int64_t result = objc_msgSend_overriddenDatabaseScope(self, a2, v2);
  if (!result) {
    return self->_databaseScope;
  }
  return result;
}

- (NSString)containerScopedUserID
{
  objc_msgSend_overriddenContainerScopedUserID(self, a2, v2);
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerScopedUserID = v4;
  if (!v4)
  {
    containerScopedUserID = self->_containerScopedUserID;
    if (!containerScopedUserID) {
      containerScopedUserID = (NSString *)*MEMORY[0x1E4F19DB0];
    }
  }
  uint64_t v6 = containerScopedUserID;

  return v6;
}

- (BOOL)_isDefaultUserNameFromServer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_containerScopedUserID(self, v4, v5);
    if (objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v6)) {
      char isEqualToString = 1;
    }
    else {
      char isEqualToString = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E4F19DB0], v9, (uint64_t)v6);
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (BOOL)_isDefaultUserNameFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_containerScopedUserID(self, v5, v6);
  if (objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4)) {
    char isEqualToString = 1;
  }
  else {
    char isEqualToString = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E4F19C08], v9, (uint64_t)v4);
  }

  return isEqualToString;
}

- (CKDPIdentifier)pUserID
{
  BOOL v3 = objc_msgSend_containerScopedUserID(self, a2, v2);
  uint64_t v6 = objc_msgSend_CKDPIdentifier_User(v3, v4, v5);

  return (CKDPIdentifier *)v6;
}

- (id)recordIDFromPUserName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_msgSend__isDefaultUserNameFromServer_(self, v6, (uint64_t)v5))
  {
    id v7 = (id)*MEMORY[0x1E4F19C08];

    id v5 = v7;
  }
  if (_CKCheckArgument())
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v10 = objc_msgSend_initWithRecordName_(v8, v9, (uint64_t)v5);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)pIdentifierFromUserRecordID:(id)a3
{
  id v4 = objc_msgSend_recordName(a3, a2, (uint64_t)a3);
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    uint64_t v8 = objc_msgSend_containerScopedUserID(self, v6, v7);

    id v4 = (void *)v8;
  }
  id v9 = objc_msgSend_CKDPIdentifier_User(v4, v6, v7);

  return v9;
}

- (id)pUserIdentifierFromUserRecordName:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    if (objc_msgSend_databaseScope(self, v6, v7) == 1 || objc_msgSend_databaseScope(self, v8, v9) == 4)
    {
      id v12 = (id)*MEMORY[0x1E4F19DB0];
    }
    else
    {
      objc_msgSend_containerScopedUserID(self, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = v12;

    id v4 = v13;
  }
  uint64_t v14 = objc_msgSend_CKDPIdentifier_User(v4, v6, v7);

  return v14;
}

- (id)pContainerScopedUserIdentifierFromPUserIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromServer_(self, v5, (uint64_t)v4))
  {
    uint64_t v8 = objc_msgSend_containerScopedUserID(self, v6, v7);

    id v4 = (id)v8;
  }
  uint64_t v9 = objc_msgSend_CKDPIdentifier_User(v4, v6, v7);

  return v9;
}

- (id)pRecordIdentifierFromUserRecordName:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    uint64_t v8 = objc_msgSend_containerScopedUserID(self, v6, v7);

    id v4 = (id)v8;
  }
  uint64_t v9 = objc_msgSend_CKDPIdentifier_Record(v4, v6, v7);

  return v9;
}

- (id)userNameFromPIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_name(v5, v6, v7);
  int v9 = _CKCheckArgument();

  if (v9)
  {
    id v12 = objc_msgSend_name(v5, v10, v11);
    if (objc_msgSend_hasName(v5, v13, v14))
    {
      uint64_t v17 = objc_msgSend_name(v5, v15, v16);
      int isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v18, (uint64_t)v17);

      if (isDefaultUserNameFromServer)
      {
        id v20 = (id)*MEMORY[0x1E4F19C08];

        id v12 = v20;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)recordIDFromPRecordIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_defaultRecordZone(MEMORY[0x1E4F1A310], v10, v11);
  uint64_t v15 = objc_msgSend_zoneID(v12, v13, v14);
  uint64_t v18 = objc_msgSend_copy(v15, v16, v17);

  BOOL v21 = objc_msgSend_zoneIdentifier(v8, v19, v20);
  uint64_t v24 = objc_msgSend_ownerIdentifier(v21, v22, v23);
  id v27 = objc_msgSend_name(v24, v25, v26);
  int isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v28, (uint64_t)v27);

  if (objc_msgSend_hasZoneIdentifier(v8, v30, v31))
  {
    uint64_t v34 = objc_msgSend_zoneIdentifier(v8, v32, v33);
    uint64_t v37 = objc_msgSend_value(v34, v35, v36);
    uint64_t v40 = objc_msgSend_name(v37, v38, v39);
    char v42 = objc_msgSend_isEqualToString_(v40, v41, *MEMORY[0x1E4F19D88]) ^ 1;
  }
  else
  {
    char v42 = 0;
  }
  int v43 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v32, v33);
  if (!isDefaultUserNameFromServer || (v42 & 1) != 0 || v43)
  {
    long long v46 = objc_msgSend_zoneIdentifier(v8, v44, v45);
    uint64_t v48 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v47, (uint64_t)v46, v9, a5);

    uint64_t v18 = (void *)v48;
    if (!v48) {
      goto LABEL_10;
    }
  }
  long long v49 = objc_msgSend_value(v8, v44, v45);
  v52 = objc_msgSend_name(v49, v50, v51);
  int v53 = _CKCheckArgument();

  if (v53)
  {
    id v54 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v57 = objc_msgSend_value(v8, v55, v56);
    uint64_t v60 = objc_msgSend_name(v57, v58, v59);
    id v62 = objc_msgSend_initWithRecordName_zoneID_(v54, v61, (uint64_t)v60, v18);
  }
  else
  {
LABEL_10:
    id v62 = 0;
  }

  return v62;
}

- (id)recordIDFromPRecordIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)pRecordIdentifierFromRecordID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_recordName(v4, v6, v7);
  uint64_t v10 = objc_msgSend_pRecordIdentifierFromUserRecordName_(self, v9, (uint64_t)v8);
  objc_msgSend_setValue_(v5, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_zoneID(v4, v12, v13);

  uint64_t v16 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v15, (uint64_t)v14);
  objc_msgSend_setZoneIdentifier_(v5, v17, (uint64_t)v16);

  return v5;
}

- (id)pContainerScopedRecordIdentifierWithPRecordIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_value(v4, v6, v7);
  objc_msgSend_setValue_(v5, v9, (uint64_t)v8);

  id v12 = objc_msgSend_zoneIdentifier(v4, v10, v11);

  uint64_t v14 = objc_msgSend_pContainerScopedRecordZoneIdentifierFromFromPRecordZoneIdentifier_(self, v13, (uint64_t)v12);
  objc_msgSend_setZoneIdentifier_(v5, v15, (uint64_t)v14);

  objc_msgSend_zoneIdentifier(v5, v16, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18) {
    id v18 = v5;
  }

  return v18;
}

- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_ownerIdentifier(v8, v10, v11);
  uint64_t v14 = objc_msgSend_userNameFromPIdentifier_error_(self, v13, (uint64_t)v12, a5);

  if (!v14
    || (objc_msgSend_value(v8, v15, v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_name(v17, v18, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = _CKCheckArgument(),
        v20,
        v17,
        !v21))
  {
    uint64_t v32 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend_addDatabaseScopeToZoneIDs(self, v22, v23)) {
    goto LABEL_8;
  }
  uint64_t v26 = objc_msgSend_databaseScope(self, v24, v25);
  if (objc_msgSend_hasDatabaseType(v8, v27, v28))
  {
    unsigned int v31 = objc_msgSend_databaseType(v8, v29, v30) - 1;
    if (v31 <= 3)
    {
      uint64_t v26 = qword_1C5080898[v31];
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v26 = 0;
  }
LABEL_9:
  id v33 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v36 = objc_msgSend_value(v8, v34, v35);
  uint64_t v39 = objc_msgSend_name(v36, v37, v38);
  uint64_t v32 = objc_msgSend_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(v33, v40, (uint64_t)v39, v14, v9, v26);

LABEL_10:
  return v32;
}

- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)pRecordZoneIdentifierFromRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_zoneName(v4, v6, v7);
  uint64_t v11 = objc_msgSend_CKDPIdentifier_Zone(v8, v9, v10);
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_ownerName(v4, v13, v14);
  uint64_t v17 = objc_msgSend_pUserIdentifierFromUserRecordName_(self, v16, (uint64_t)v15);
  objc_msgSend_setOwnerIdentifier_(v5, v18, (uint64_t)v17);

  unint64_t v21 = objc_msgSend_databaseScope(v4, v19, v20);
  if (!v21) {
    unint64_t v21 = objc_msgSend_databaseScope(self, v22, v23);
  }
  if (v21 > 4) {
    objc_msgSend_setDatabaseType_(v5, v22, 1);
  }
  else {
    objc_msgSend_setDatabaseType_(v5, v22, dword_1C50808B8[v21]);
  }
  return v5;
}

- (id)pContainerScopedRecordZoneIdentifierFromFromPRecordZoneIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_value(v4, v6, v7);
  objc_msgSend_setValue_(v5, v9, (uint64_t)v8);

  id v12 = objc_msgSend_ownerIdentifier(v4, v10, v11);
  uint64_t v15 = objc_msgSend_name(v12, v13, v14);
  uint64_t v17 = objc_msgSend_pContainerScopedUserIdentifierFromPUserIdentifier_(self, v16, (uint64_t)v15);
  objc_msgSend_setOwnerIdentifier_(v5, v18, (uint64_t)v17);

  objc_msgSend_ownerIdentifier(v5, v19, v20);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (objc_msgSend_hasDatabaseType(v4, v22, v23))
    {
      uint64_t v26 = objc_msgSend_databaseType(v4, v24, v25);
      objc_msgSend_setDatabaseType_(v5, v27, v26);
    }
    id v21 = v5;
  }

  return v21;
}

- (id)pShareIdentifierFromRecordID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_recordName(v4, v6, v7);
  uint64_t v11 = objc_msgSend_CKDPIdentifier_ShareId(v8, v9, v10);
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_zoneID(v4, v13, v14);

  uint64_t v17 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v16, (uint64_t)v15);
  objc_msgSend_setZoneIdentifier_(v5, v18, (uint64_t)v17);

  return v5;
}

- (id)recordIDFromPShareIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_zoneIdentifier(v8, v10, v11);
  uint64_t v14 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, a5);

  if (v14
    && (objc_msgSend_value(v8, v15, v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_name(v17, v18, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = _CKCheckArgument(),
        v20,
        v17,
        v21))
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v25 = objc_msgSend_value(v8, v23, v24);
    uint64_t v28 = objc_msgSend_name(v25, v26, v27);
    uint64_t v30 = objc_msgSend_initWithRecordName_zoneID_(v22, v29, (uint64_t)v28, v14);
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (id)recordIDFromPShareIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)referenceFromPReference:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_referenceFromPReference_asAnonymousCKUserID_error_, a3);
}

- (id)referenceFromPReference:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_recordIdentifier(v8, v10, v11);
  id v27 = 0;
  uint64_t v14 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, &v27);

  id v17 = v27;
  if (v14)
  {
    if (objc_msgSend_hasType(v8, v15, v16))
    {
      int v20 = objc_msgSend_type(v8, v18, v19);
      uint64_t v21 = sub_1C4E93FB0(v20);
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F1A348]);
    uint64_t v23 = objc_msgSend_initWithRecordID_action_(v24, v25, (uint64_t)v14, v21);
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v22 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v17;
    _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Invalid record identifier from server %{public}@: %@", buf, 0x16u);
  }
  uint64_t v23 = 0;
  if (a5) {
LABEL_12:
  }
    *a5 = v17;
LABEL_13:

  return v23;
}

- (id)pReferenceFromReference:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  id v9 = objc_msgSend_recordID(v5, v7, v8);
  uint64_t v11 = objc_msgSend_pRecordIdentifierFromRecordID_(self, v10, (uint64_t)v9);
  objc_msgSend_setRecordIdentifier_(v6, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_referenceAction(v5, v13, v14);
  if (*MEMORY[0x1E4F19D98] == v15) {
    unsigned int v17 = 3;
  }
  else {
    unsigned int v17 = 2;
  }
  if (v15 == 1) {
    objc_msgSend_setType_(v6, v16, 1);
  }
  else {
    objc_msgSend_setType_(v6, v16, v17);
  }
  return v6;
}

- (id)recordFromPRecord:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)recordFromPRecord:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  uint64_t v427 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_recordIdentifier(v8, v10, v11);
  v403 = v9;
  v404 = self;
  uint64_t v14 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, a5);

  if (!v14)
  {
    id v28 = 0;
    goto LABEL_123;
  }
  unsigned int v17 = objc_msgSend_type(v8, v15, v16);
  int v20 = objc_msgSend_name(v17, v18, v19);
  uint64_t v400 = *MEMORY[0x1E4F19D78];
  int isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x1E4F19D78]);

  if (isEqualToString)
  {
    uint64_t v25 = objc_msgSend_shareInfo(v8, v23, v24);
    inited = objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(v404, v26, (uint64_t)v25, v403, a5);
  }
  else
  {
    id v29 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    uint64_t v25 = objc_msgSend_type(v8, v30, v31);
    uint64_t v34 = objc_msgSend_name(v25, v32, v33);
    inited = objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(v29, v35, (uint64_t)v34, v14);
  }
  if (!inited) {
    goto LABEL_121;
  }
  if (objc_msgSend_hasStableUrl(v8, v36, v37))
  {
    uint64_t v40 = objc_msgSend_stableUrl(v8, v38, v39);
    if (objc_msgSend_hasRoutingKey(v40, v41, v42))
    {
      uint64_t v45 = objc_msgSend_stableUrl(v8, v43, v44);
      uint64_t v48 = objc_msgSend_routingKey(v45, v46, v47);
      objc_msgSend_setRoutingKey_(inited, v49, (uint64_t)v48);
    }
    else
    {
      objc_msgSend_setRoutingKey_(inited, v43, 0);
    }

    v52 = objc_msgSend_stableUrl(v8, v50, v51);
    int hasEncryptedPublicSharingKey = objc_msgSend_hasEncryptedPublicSharingKey(v52, v53, v54);

    if (hasEncryptedPublicSharingKey)
    {
      id v58 = objc_alloc(MEMORY[0x1E4F19FA0]);
      v61 = objc_msgSend_stableUrl(v8, v59, v60);
      id v64 = objc_msgSend_encryptedPublicSharingKey(v61, v62, v63);
      id v66 = objc_msgSend_initWithEncryptedData_(v58, v65, (uint64_t)v64);
      objc_msgSend_setMutableEncryptedPSK_(inited, v67, (uint64_t)v66);
    }
    id v68 = objc_msgSend_stableUrl(v8, v56, v57);
    id v71 = objc_msgSend_displayedHostname(v68, v69, v70);
    objc_msgSend_setDisplayedHostname_(inited, v72, (uint64_t)v71);
  }
  id v401 = v8;
  v402 = inited;
  v399 = v14;
  if (objc_msgSend_hasOneTimeStableUrlInfo(v8, v38, v39))
  {
    uint64_t v75 = objc_msgSend_recordID(inited, v73, v74);
    v78 = objc_msgSend_recordName(v75, v76, v77);
    int v80 = objc_msgSend_isEqualToString_(v78, v79, *MEMORY[0x1E4F19D48]);

    if (v80)
    {
      v398 = a5;
      id v397 = inited;
      v81 = objc_opt_new();
      long long v417 = 0u;
      long long v418 = 0u;
      long long v419 = 0u;
      long long v420 = 0u;
      v84 = objc_msgSend_oneTimeStableUrlInfo(v8, v82, v83);
      v87 = objc_msgSend_oneTimeUrls(v84, v85, v86);

      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v417, v426, 16);
      if (v89)
      {
        uint64_t v92 = v89;
        uint64_t v93 = *(void *)v418;
        do
        {
          for (uint64_t i = 0; i != v92; ++i)
          {
            if (*(void *)v418 != v93) {
              objc_enumerationMutation(v87);
            }
            v95 = *(void **)(*((void *)&v417 + 1) + 8 * i);
            if (objc_msgSend_hasEncryptedFullTokenInfo(v95, v90, v91, v397)
              && objc_msgSend_participantIdsCount(v95, v90, v91))
            {
              id v96 = objc_alloc(MEMORY[0x1E4F19FA0]);
              v99 = objc_msgSend_encryptedFullTokenInfo(v95, v97, v98);
              v101 = objc_msgSend_initWithEncryptedData_(v96, v100, (uint64_t)v99);

              id v102 = objc_alloc(MEMORY[0x1E4F1A1F8]);
              v105 = objc_msgSend_participantIds(v95, v103, v104);
              v108 = objc_msgSend_firstObject(v105, v106, v107);
              v110 = objc_msgSend_initWithEncryptedOneTimeFullToken_participantID_(v102, v109, (uint64_t)v101, v108);

              v113 = objc_msgSend_participantIds(v95, v111, v112);
              v116 = objc_msgSend_firstObject(v113, v114, v115);
              objc_msgSend_setObject_forKeyedSubscript_(v81, v117, (uint64_t)v110, v116);
            }
          }
          uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v417, v426, 16);
        }
        while (v92);
      }

      v121 = v397;
      if (objc_msgSend_count(v81, v118, v119))
      {
        objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v397, v120, (uint64_t)v81);
        long long v415 = 0u;
        long long v416 = 0u;
        long long v413 = 0u;
        long long v414 = 0u;
        v124 = objc_msgSend_allParticipants(v397, v122, v123);
        uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v413, v425, 16);
        if (v126)
        {
          uint64_t v129 = v126;
          uint64_t v130 = *(void *)v414;
          do
          {
            for (uint64_t j = 0; j != v129; ++j)
            {
              if (*(void *)v414 != v130) {
                objc_enumerationMutation(v124);
              }
              v132 = *(void **)(*((void *)&v413 + 1) + 8 * j);
              v133 = objc_msgSend_allKeys(v81, v127, v128, v397);
              v136 = objc_msgSend_participantID(v132, v134, v135);
              int v138 = objc_msgSend_containsObject_(v133, v137, (uint64_t)v136);

              if (v138) {
                objc_msgSend_setUsesOneTimeURL_(v132, v127, 1);
              }
            }
            uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v127, (uint64_t)&v413, v425, 16);
          }
          while (v129);
        }
      }
      id v8 = v401;
      inited = v402;
      a5 = v398;
      uint64_t v14 = v399;
    }
  }
  v139 = objc_msgSend_etag(v8, v73, v74, v397);
  objc_msgSend_setEtag_(inited, v140, (uint64_t)v139);

  if (objc_msgSend_hasTimeStatistics(v8, v141, v142))
  {
    v145 = objc_msgSend_timeStatistics(v8, v143, v144);
    if (objc_msgSend_hasCreation(v145, v146, v147))
    {
      v150 = (void *)MEMORY[0x1E4F1C9C8];
      v151 = objc_msgSend_timeStatistics(v8, v148, v149);
      v154 = objc_msgSend_creation(v151, v152, v153);
      objc_msgSend_time(v154, v155, v156);
      v159 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v150, v157, v158);
      objc_msgSend_setCreationDate_(inited, v160, (uint64_t)v159);
    }
    else
    {
      objc_msgSend_setCreationDate_(inited, v148, 0);
    }

    v163 = objc_msgSend_timeStatistics(v8, v161, v162);
    if (objc_msgSend_hasModification(v163, v164, v165))
    {
      v168 = (void *)MEMORY[0x1E4F1C9C8];
      v169 = objc_msgSend_timeStatistics(v8, v166, v167);
      v172 = objc_msgSend_modification(v169, v170, v171);
      objc_msgSend_time(v172, v173, v174);
      v177 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v168, v175, v176);
      objc_msgSend_setModificationDate_(inited, v178, (uint64_t)v177);
    }
    else
    {
      objc_msgSend_setModificationDate_(inited, v166, 0);
    }
  }
  if (objc_msgSend_hasCreatedBy(v8, v143, v144))
  {
    v181 = objc_msgSend_createdBy(v8, v179, v180);
    v184 = objc_msgSend_name(v181, v182, v183);
    v186 = objc_msgSend_recordIDFromPUserName_error_(v404, v185, (uint64_t)v184, 0);
    objc_msgSend_setCreatorUserRecordID_(inited, v187, (uint64_t)v186);
  }
  if (objc_msgSend_hasModifiedBy(v8, v179, v180))
  {
    v190 = objc_msgSend_modifiedBy(v8, v188, v189);
    v193 = objc_msgSend_name(v190, v191, v192);
    v195 = objc_msgSend_recordIDFromPUserName_error_(v404, v194, (uint64_t)v193, 0);
    objc_msgSend_setLastModifiedUserRecordID_(inited, v196, (uint64_t)v195);
  }
  if (objc_msgSend_hasModifiedByDevice(v8, v188, v189))
  {
    v199 = objc_msgSend_modifiedByDevice(v8, v197, v198);
    objc_msgSend_setModifiedByDevice_(inited, v200, (uint64_t)v199);
  }
  if (objc_msgSend_hasExpirationTime(v8, v197, v198))
  {
    v203 = (void *)MEMORY[0x1E4F1C9C8];
    v204 = objc_msgSend_expirationTime(v8, v201, v202);
    objc_msgSend_time(v204, v205, v206);
    v209 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v203, v207, v208);
    objc_msgSend_setExpirationDate_(inited, v210, (uint64_t)v209);
  }
  if (objc_msgSend_hasExpired(v8, v201, v202))
  {
    uint64_t v213 = objc_msgSend_expired(v8, v211, v212);
    objc_msgSend_setExpired_(inited, v214, v213);
  }
  if (objc_msgSend_hasProtectionInfo(v8, v211, v212))
  {
    v217 = objc_msgSend_protectionInfo(v8, v215, v216);
    v220 = objc_msgSend_protectionInfo(v217, v218, v219);
    uint64_t v223 = objc_msgSend_length(v220, v221, v222);

    if (v223)
    {
      v224 = objc_msgSend_protectionInfo(v8, v215, v216);
      v227 = objc_msgSend_protectionInfo(v224, v225, v226);
      objc_msgSend_setProtectionData_(inited, v228, (uint64_t)v227);

      v231 = objc_msgSend_protectionInfo(v8, v229, v230);
      v234 = objc_msgSend_protectionInfoTag(v231, v232, v233);
      objc_msgSend_setProtectionEtag_(inited, v235, (uint64_t)v234);
    }
  }
  if (objc_msgSend_hasZoneishPrimaryKeyId(v8, v215, v216))
  {
    v238 = objc_msgSend_zoneishPrimaryKeyId(v8, v236, v237);
    objc_msgSend_setZoneishKeyID_(inited, v239, (uint64_t)v238);
  }
  objc_msgSend_setTrackChanges_(inited, v236, 0);
  if (!objc_msgSend_hasShareId(v8, v240, v241)) {
    goto LABEL_66;
  }
  v244 = objc_msgSend_type(v8, v242, v243);
  v247 = objc_msgSend_name(v244, v245, v246);
  char v249 = objc_msgSend_isEqualToString_(v247, v248, v400);

  if (v249) {
    goto LABEL_66;
  }
  v250 = objc_msgSend_shareId(v8, v242, v243);
  v252 = objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(v404, v251, (uint64_t)v250, v403, a5);

  if (v252)
  {
    id v253 = objc_alloc(MEMORY[0x1E4F1A348]);
    v255 = objc_msgSend_initWithRecordID_action_(v253, v254, (uint64_t)v252, 0);
    objc_msgSend_setShare_(inited, v256, (uint64_t)v255);

    v259 = objc_msgSend_share(inited, v257, v258);

    if (v259)
    {

LABEL_66:
      if (!objc_msgSend_hasChainParent(v8, v242, v243))
      {
LABEL_73:
        v286 = objc_msgSend_tombstonedPublicKeyIDs(v8, v260, v261);
        objc_msgSend_setTombstonedPublicKeyIDs_(inited, v287, (uint64_t)v286);

        if (objc_msgSend_hasChainPrivateKey(v8, v288, v289))
        {
          id v292 = objc_alloc(MEMORY[0x1E4F19FA0]);
          v295 = objc_msgSend_chainPrivateKey(v8, v293, v294);
          v297 = objc_msgSend_initWithEncryptedData_(v292, v296, (uint64_t)v295);
          objc_msgSend_setChainPrivateKey_(inited, v298, (uint64_t)v297);
        }
        if (objc_msgSend_hasChainProtectionInfo(v8, v290, v291))
        {
          v301 = objc_msgSend_chainProtectionInfo(v8, v299, v300);
          v304 = objc_msgSend_protectionInfo(v301, v302, v303);
          objc_msgSend_setChainProtectionInfo_(inited, v305, (uint64_t)v304);
        }
        long long v411 = 0u;
        long long v412 = 0u;
        long long v409 = 0u;
        long long v410 = 0u;
        v306 = objc_msgSend_fields(v8, v299, v300);
        uint64_t v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v307, (uint64_t)&v409, v422, 16);
        if (v308)
        {
          uint64_t v311 = v308;
          uint64_t v312 = *(void *)v410;
          do
          {
            for (uint64_t k = 0; k != v311; ++k)
            {
              if (*(void *)v410 != v312) {
                objc_enumerationMutation(v306);
              }
              v314 = *(void **)(*((void *)&v409 + 1) + 8 * k);
              v315 = objc_msgSend_identifier(v314, v309, v310);
              v318 = objc_msgSend_name(v315, v316, v317);
              char hasPrefix = objc_msgSend_hasPrefix_(v318, v319, @"_");

              if ((hasPrefix & 1) == 0)
              {
                v321 = objc_msgSend_identifier(v314, v309, v310);
                v324 = objc_msgSend_name(v321, v322, v323);

                v326 = objc_msgSend_objectRepresentationFromField_inRecord_asAnonymousCKUserID_(v404, v325, (uint64_t)v314, v8, v403);
                if ((objc_msgSend_objectIsAnEncryptedType_(v404, v327, (uint64_t)v326) & 1) != 0
                  || objc_msgSend__valueTypeIsAnEncryptedBytesTypeForField_(v404, v328, (uint64_t)v314))
                {
                  v330 = objc_msgSend_encryptedValueStore(v402, v328, v329);
                }
                else
                {
                  v330 = objc_msgSend_valueStore(v402, v328, v329);
                }
                v332 = v330;
                objc_msgSend_setObjectNoValidate_forKey_(v330, v331, (uint64_t)v326, v324);

                id v8 = v401;
              }
            }
            uint64_t v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v309, (uint64_t)&v409, v422, 16);
          }
          while (v311);
        }

        inited = v402;
        objc_msgSend_setTrackChanges_(v402, v333, 1);
        if (objc_msgSend_pluginFieldsCount(v8, v334, v335))
        {
          id v338 = objc_alloc(MEMORY[0x1E4F1CA60]);
          uint64_t v341 = objc_msgSend_pluginFieldsCount(v8, v339, v340);
          v343 = objc_msgSend_initWithCapacity_(v338, v342, v341);
          long long v405 = 0u;
          long long v406 = 0u;
          long long v407 = 0u;
          long long v408 = 0u;
          v346 = objc_msgSend_pluginFields(v8, v344, v345);
          uint64_t v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v346, v347, (uint64_t)&v405, v421, 16);
          if (v348)
          {
            uint64_t v351 = v348;
            uint64_t v352 = *(void *)v406;
            do
            {
              for (uint64_t m = 0; m != v351; ++m)
              {
                if (*(void *)v406 != v352) {
                  objc_enumerationMutation(v346);
                }
                v354 = *(void **)(*((void *)&v405 + 1) + 8 * m);
                v355 = objc_msgSend_value(v354, v349, v350);
                v357 = objc_msgSend_objectRepresentationFromFieldValue_(v404, v356, (uint64_t)v355);
                v360 = objc_msgSend_identifier(v354, v358, v359);
                v363 = objc_msgSend_name(v360, v361, v362);
                objc_msgSend_setObject_forKeyedSubscript_(v343, v364, (uint64_t)v357, v363);
              }
              uint64_t v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v346, v349, (uint64_t)&v405, v421, 16);
            }
            while (v351);
          }

          inited = v402;
          objc_msgSend_setPluginFields_(v402, v365, (uint64_t)v343);
        }
        v366 = objc_msgSend_conflictLoserEtags(v8, v336, v337);
        objc_msgSend_setConflictLoserEtags_(inited, v367, (uint64_t)v366);

        objc_msgSend_setKnownToServer_(inited, v368, 1);
        if (objc_msgSend_hasPermission(v8, v369, v370))
        {
          if (objc_msgSend_permission(v8, v371, v372) == 1) {
            uint64_t v373 = 2;
          }
          else {
            uint64_t v373 = 1;
          }
        }
        else
        {
          uint64_t v373 = 0;
        }
        uint64_t v14 = v399;
        objc_msgSend_setPermission_(inited, v371, v373);
        if (objc_msgSend_hasProtectionInfoKeysToRemove(v8, v374, v375))
        {
          v378 = objc_msgSend_protectionInfoKeysToRemove(v8, v376, v377);
          v380 = objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(v404, v379, (uint64_t)v378);
          objc_msgSend_setPcsKeysToRemove_(inited, v381, (uint64_t)v380);
        }
        id v28 = inited;
        goto LABEL_122;
      }
      v252 = objc_msgSend_chainParent(v8, v260, v261);
      if (!objc_msgSend_hasReference(v252, v262, v263))
      {
LABEL_70:
        if (objc_msgSend_hasPublicKeyID(v252, v264, v265))
        {
          v284 = objc_msgSend_publicKeyID(v252, v282, v283);
          objc_msgSend_setChainParentPublicKeyID_(inited, v285, (uint64_t)v284);
        }
        goto LABEL_73;
      }
      v266 = objc_msgSend_chainParent(v8, v264, v265);
      v269 = objc_msgSend_reference(v266, v267, v268);
      v272 = objc_msgSend_recordIdentifier(v269, v270, v271);
      v274 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v404, v273, (uint64_t)v272, v403, a5);

      id v275 = objc_alloc(MEMORY[0x1E4F1A348]);
      v277 = objc_msgSend_initWithRecordID_action_(v275, v276, (uint64_t)v274, 0);
      objc_msgSend_setParent_(inited, v278, (uint64_t)v277);

      v281 = objc_msgSend_parent(inited, v279, v280);

      if (v281)
      {

        goto LABEL_70;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v387 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v390 = v387;
        v393 = objc_msgSend_chainParent(v8, v391, v392);
        v396 = objc_msgSend_reference(v393, v394, v395);
        *(_DWORD *)long long buf = 138543362;
        v424 = v396;
        _os_log_debug_impl(&dword_1C4CFF000, v390, OS_LOG_TYPE_DEBUG, "Couldn't convert parent record ID: %{public}@", buf, 0xCu);
      }
      goto LABEL_120;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v388 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      v424 = v252;
      _os_log_debug_impl(&dword_1C4CFF000, v388, OS_LOG_TYPE_DEBUG, "Couldn't create a share reference for share %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v382 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v383 = v382;
      v386 = objc_msgSend_shareId(v8, v384, v385);
      *(_DWORD *)long long buf = 138543362;
      v424 = v386;
      _os_log_debug_impl(&dword_1C4CFF000, v383, OS_LOG_TYPE_DEBUG, "Couldn't convert share ID for record: %{public}@", buf, 0xCu);
    }
  }
LABEL_120:

LABEL_121:
  id v28 = 0;
LABEL_122:

LABEL_123:
  return v28;
}

- (id)dateFromPDate:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend_time(a3, a2, (uint64_t)a3);
  return (id)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v3, v4, v5);
}

- (id)pProtectionInfoKeysToRemoveFromPCSKeysToRemove:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_etag(v3, v5, v6);
  objc_msgSend_setProtectionInfoTag_(v4, v8, (uint64_t)v7);

  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = objc_msgSend_keys(v3, v10, v11);
  uint64_t v15 = objc_msgSend_count(v12, v13, v14);
  unsigned int v17 = objc_msgSend_arrayWithCapacity_(v9, v16, v15);
  objc_msgSend_setKeysToRemoves_(v4, v18, (uint64_t)v17);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = objc_msgSend_keys(v3, v19, v20, 0);
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v42, v46, 16);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v21);
        }
        id v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v28 = objc_opt_new();
        uint64_t v31 = objc_msgSend_pcsKeyID(v27, v29, v30);
        objc_msgSend_setKeyId_(v28, v32, (uint64_t)v31);

        uint64_t v35 = objc_msgSend_keyType(v27, v33, v34);
        if ((unint64_t)(v35 - 1) <= 2) {
          objc_msgSend_setKeyType_(v28, v36, v35);
        }
        uint64_t v38 = objc_msgSend_keysToRemoves(v4, v36, v37);
        objc_msgSend_addObject_(v38, v39, (uint64_t)v28);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v40, (uint64_t)&v42, v46, 16);
    }
    while (v24);
  }

  return v4;
}

- (id)pcsKeysToRemoveFromPProtectionInfoKeysToRemove:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_hasProtectionInfoTag(v3, v4, v5))
  {
    uint64_t v8 = objc_msgSend_protectionInfoTag(v3, v6, v7);
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  long long v46 = (void *)v8;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = objc_msgSend_keysToRemovesCount(v3, v10, v11);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v47 = v3;
  unsigned int v17 = objc_msgSend_keysToRemoves(v3, v15, v16);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v54, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v49;
    uint64_t v24 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v25 = (os_log_t *)MEMORY[0x1E4F1A500];
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v49 != v23) {
          objc_enumerationMutation(v17);
        }
        id v27 = *(void **)(*((void *)&v48 + 1) + 8 * v26);
        if (objc_msgSend_hasKeyId(v27, v20, v21, v46)
          && objc_msgSend_hasKeyType(v27, v28, v29))
        {
          uint64_t v32 = objc_msgSend_keyType(v27, v30, v31) - 1;
          if (v32 < 3) {
            uint64_t v33 = v32 + 1;
          }
          else {
            uint64_t v33 = 0;
          }
          id v34 = objc_alloc(MEMORY[0x1E4F1A240]);
          uint64_t v37 = objc_msgSend_keyId(v27, v35, v36);
          uint64_t v39 = objc_msgSend_initWithKeyID_keyType_(v34, v38, (uint64_t)v37, v33);

          objc_msgSend_addObject_(v14, v40, (uint64_t)v39);
        }
        else
        {
          if (*v24 != -1) {
            dispatch_once(v24, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v41 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543362;
            int v53 = v27;
            _os_log_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_INFO, "Warn: Ignoring PCS key to remove because key type and/or key ID is not specified: %{public}@", buf, 0xCu);
          }
        }
        ++v26;
      }
      while (v22 != v26);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v48, v54, 16);
    }
    while (v22);
  }

  id v42 = objc_alloc(MEMORY[0x1E4F1A248]);
  long long v44 = objc_msgSend_initWithEtag_keys_(v42, v43, (uint64_t)v46, v14);

  return v44;
}

- (BOOL)_valueTypeIsAnEncryptedBytesTypeForField:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_value(v3, v4, v5);
  if (objc_msgSend_type(v6, v7, v8) == 20)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = objc_msgSend_value(v3, v9, v10);
    BOOL v11 = objc_msgSend_type(v12, v13, v14) == 21;
  }
  return v11;
}

- (id)pDateFromDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend_timeIntervalSinceReferenceDate(v3, v5, v6);
  double v8 = v7;

  objc_msgSend_setTime_(v4, v9, v10, v8);
  return v4;
}

- (id)_pRecordFromRecordSansValues:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v350 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = objc_opt_new();
  uint64_t v10 = objc_msgSend_etag(v6, v8, v9);
  objc_msgSend_setEtag_(v7, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_recordID(v6, v12, v13);
  uint64_t v16 = objc_msgSend_pRecordIdentifierFromRecordID_(self, v15, (uint64_t)v14);
  objc_msgSend_setRecordIdentifier_(v7, v17, (uint64_t)v16);

  id v18 = objc_opt_new();
  objc_msgSend_setType_(v7, v19, (uint64_t)v18);

  uint64_t v22 = objc_msgSend_recordType(v6, v20, v21);
  uint64_t v25 = objc_msgSend_type(v7, v23, v24);
  objc_msgSend_setName_(v25, v26, (uint64_t)v22);

  uint64_t v29 = objc_msgSend_conflictLoserEtags(v6, v27, v28);
  uint64_t v32 = objc_msgSend_mutableCopy(v29, v30, v31);
  objc_msgSend_setConflictLoserEtags_(v7, v33, (uint64_t)v32);

  if (!v4) {
    goto LABEL_19;
  }
  uint64_t v36 = objc_msgSend_creationDate(v6, v34, v35);
  if (v36)
  {

LABEL_5:
    id v42 = objc_opt_new();
    objc_msgSend_setTimeStatistics_(v7, v43, (uint64_t)v42);

    goto LABEL_6;
  }
  uint64_t v39 = objc_msgSend_modificationDate(v6, v37, v38);

  if (v39) {
    goto LABEL_5;
  }
LABEL_6:
  long long v44 = objc_msgSend_creationDate(v6, v40, v41);

  if (v44)
  {
    uint64_t v47 = objc_msgSend_creationDate(v6, v45, v46);
    long long v49 = objc_msgSend_pDateFromDate_(self, v48, (uint64_t)v47);
    v52 = objc_msgSend_timeStatistics(v7, v50, v51);
    objc_msgSend_setCreation_(v52, v53, (uint64_t)v49);
  }
  uint64_t v54 = objc_msgSend_modificationDate(v6, v45, v46);

  if (v54)
  {
    uint64_t v57 = objc_msgSend_modificationDate(v6, v55, v56);
    uint64_t v59 = objc_msgSend_pDateFromDate_(self, v58, (uint64_t)v57);
    id v62 = objc_msgSend_timeStatistics(v7, v60, v61);
    objc_msgSend_setModification_(v62, v63, (uint64_t)v59);
  }
  id v64 = objc_msgSend_creatorUserRecordID(v6, v55, v56);

  if (v64)
  {
    id v67 = objc_msgSend_creatorUserRecordID(v6, v65, v66);
    id v69 = objc_msgSend_pIdentifierFromUserRecordID_(self, v68, (uint64_t)v67);
    objc_msgSend_setCreatedBy_(v7, v70, (uint64_t)v69);
  }
  id v71 = objc_msgSend_lastModifiedUserRecordID(v6, v65, v66);

  if (v71)
  {
    uint64_t v74 = objc_msgSend_lastModifiedUserRecordID(v6, v72, v73);
    v76 = objc_msgSend_pIdentifierFromUserRecordID_(self, v75, (uint64_t)v74);
    objc_msgSend_setModifiedBy_(v7, v77, (uint64_t)v76);
  }
  v78 = objc_msgSend_modifiedByDevice(v6, v72, v73);

  if (v78)
  {
    v81 = objc_msgSend_modifiedByDevice(v6, v79, v80);
    objc_msgSend_setModifiedByDevice_(v7, v82, (uint64_t)v81);
  }
  uint64_t v83 = objc_msgSend_expirationDate(v6, v79, v80);

  if (v83)
  {
    uint64_t v86 = objc_msgSend_expirationDate(v6, v84, v85);
    v88 = objc_msgSend_pDateFromDate_(self, v87, (uint64_t)v86);
    objc_msgSend_setExpirationTime_(v7, v89, (uint64_t)v88);
  }
  uint64_t isExpired = objc_msgSend_isExpired(v6, v84, v85);
  objc_msgSend_setExpired_(v7, v91, isExpired);
LABEL_19:
  uint64_t v92 = objc_msgSend_protectionData(v6, v34, v35);

  if (v92)
  {
    v95 = objc_opt_new();
    objc_msgSend_setProtectionInfo_(v7, v96, (uint64_t)v95);

    v99 = objc_msgSend_protectionData(v6, v97, v98);
    id v102 = objc_msgSend_protectionInfo(v7, v100, v101);
    objc_msgSend_setProtectionInfo_(v102, v103, (uint64_t)v99);

    v106 = objc_msgSend_protectionEtag(v6, v104, v105);
    v109 = objc_msgSend_protectionInfo(v7, v107, v108);
    objc_msgSend_setProtectionInfoTag_(v109, v110, (uint64_t)v106);
  }
  v111 = objc_msgSend_zoneishKeyID(v6, v93, v94);

  if (v111)
  {
    v114 = objc_msgSend_zoneishKeyID(v6, v112, v113);
    objc_msgSend_setZoneishPrimaryKeyId_(v7, v115, (uint64_t)v114);

    objc_msgSend_setProtectionInfo_(v7, v116, 0);
  }
  v117 = objc_msgSend_share(v6, v112, v113);

  if (v117)
  {
    v120 = objc_msgSend_share(v6, v118, v119);
    uint64_t v123 = objc_msgSend_recordID(v120, v121, v122);
    v125 = objc_msgSend_pShareIdentifierFromRecordID_(self, v124, (uint64_t)v123);
    objc_msgSend_setShareId_(v7, v126, (uint64_t)v125);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v129 = v6;
    v132 = objc_msgSend_currentUserParticipant(v129, v130, v131);
    uint64_t v135 = v132;
    if (v4)
    {
      v136 = objc_msgSend_pShareFromShare_forCache_(self, v133, (uint64_t)v129, 1);
      objc_msgSend_setShareInfo_(v7, v137, (uint64_t)v136);
    }
    else
    {
      if (objc_msgSend_role(v132, v133, v134) == 1 || objc_msgSend_role(v135, v140, v141) == 2)
      {
        v143 = objc_msgSend_pShareFromShare_forCache_(self, v140, (uint64_t)v129, 0);
        objc_msgSend_setShareInfo_(v7, v144, (uint64_t)v143);
      }
      if (!objc_msgSend_isZoneWideShare(v129, v140, v142)) {
        goto LABEL_43;
      }
      uint64_t v147 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v129, v145, v146);
      uint64_t v150 = objc_msgSend_count(v147, v148, v149);

      if (!v150) {
        goto LABEL_43;
      }
    }
    v336 = self;
    BOOL v337 = v4;
    id v338 = v6;
    if ((objc_msgSend_hasOneTimeStableUrlInfo(v7, v138, v139) & 1) == 0)
    {
      v151 = objc_opt_new();
      objc_msgSend_setOneTimeStableUrlInfo_(v7, v152, (uint64_t)v151);
    }
    uint64_t v335 = v135;
    v339 = v7;
    uint64_t v153 = objc_opt_new();
    long long v342 = 0u;
    long long v343 = 0u;
    long long v344 = 0u;
    long long v345 = 0u;
    objc_msgSend_oneTimeURLMetadatasByParticipantID(v129, v154, v155);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v156, (uint64_t)&v342, v349, 16);
    if (v157)
    {
      uint64_t v160 = v157;
      uint64_t v161 = *(void *)v343;
      do
      {
        for (uint64_t i = 0; i != v160; ++i)
        {
          if (*(void *)v343 != v161) {
            objc_enumerationMutation(obj);
          }
          uint64_t v163 = *(void *)(*((void *)&v342 + 1) + 8 * i);
          v164 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v129, v158, v159);
          v166 = objc_msgSend_objectForKeyedSubscript_(v164, v165, v163);

          uint64_t v167 = objc_opt_new();
          v170 = objc_msgSend_encryptedOneTimeFullToken(v166, v168, v169);
          v173 = objc_msgSend_encryptedData(v170, v171, v172);
          objc_msgSend_setEncryptedFullTokenInfo_(v167, v174, (uint64_t)v173);

          v177 = objc_msgSend_participantID(v166, v175, v176);
          uint64_t v348 = v177;
          v179 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v178, (uint64_t)&v348, 1);
          v182 = objc_msgSend_mutableCopy(v179, v180, v181);
          objc_msgSend_setParticipantIds_(v167, v183, (uint64_t)v182);

          v186 = objc_msgSend_encryptedOneTimeFullTokenData(v166, v184, v185);
          objc_msgSend_setProtectedFullToken_(v167, v187, (uint64_t)v186);

          v190 = objc_msgSend_oneTimeShortSharingTokenHashData(v166, v188, v189);
          objc_msgSend_setShortTokenHash_(v167, v191, (uint64_t)v190);

          objc_msgSend_addObject_(v153, v192, (uint64_t)v167);
        }
        uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v158, (uint64_t)&v342, v349, 16);
      }
      while (v160);
    }

    double v7 = v339;
    v195 = objc_msgSend_oneTimeStableUrlInfo(v339, v193, v194);
    objc_msgSend_setOneTimeUrls_(v195, v196, (uint64_t)v153);

    id v6 = v338;
    BOOL v4 = v337;
    uint64_t v135 = v335;
    self = v336;
LABEL_43:
  }
  v197 = objc_msgSend_chainPrivateKey(v6, v127, v128);
  v200 = objc_msgSend_encryptedData(v197, v198, v199);

  if (v200)
  {
    v203 = objc_msgSend_chainPrivateKey(v6, v201, v202);
    uint64_t v206 = objc_msgSend_encryptedData(v203, v204, v205);
    objc_msgSend_setChainPrivateKey_(v7, v207, (uint64_t)v206);
  }
  uint64_t v208 = objc_msgSend_chainProtectionInfo(v6, v201, v202);

  if (v208)
  {
    v211 = objc_opt_new();
    objc_msgSend_setChainProtectionInfo_(v7, v212, (uint64_t)v211);

    v215 = objc_msgSend_chainProtectionInfo(v6, v213, v214);
    v218 = objc_msgSend_chainProtectionInfo(v7, v216, v217);
    objc_msgSend_setProtectionInfo_(v218, v219, (uint64_t)v215);
  }
  if ((objc_msgSend_hasUpdatedParent(v6, v209, v210) & 1) != 0 || v4)
  {
    uint64_t v222 = objc_opt_new();
    objc_msgSend_setChainParent_(v7, v223, (uint64_t)v222);

    uint64_t v226 = objc_msgSend_parent(v6, v224, v225);

    if (v226)
    {
      if (objc_msgSend_dontCreateValidatingParentReferences(self, v220, v221)) {
        uint64_t v227 = 0;
      }
      else {
        uint64_t v227 = *MEMORY[0x1E4F19D98];
      }
      id v228 = objc_alloc(MEMORY[0x1E4F1A348]);
      v231 = objc_msgSend_parent(v6, v229, v230);
      v234 = objc_msgSend_recordID(v231, v232, v233);
      v236 = objc_msgSend_initWithRecordID_action_(v228, v235, (uint64_t)v234, v227);

      id v341 = 0;
      v238 = objc_msgSend_pReferenceFromReference_error_(self, v237, (uint64_t)v236, &v341);
      id v239 = v341;
      v242 = objc_msgSend_chainParent(v7, v240, v241);
      objc_msgSend_setReference_(v242, v243, (uint64_t)v238);

      uint64_t v246 = objc_msgSend_chainParent(v7, v244, v245);
      char v249 = objc_msgSend_reference(v246, v247, v248);

      if (!v249 || v239)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v252 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          id v253 = v252;
          v256 = objc_msgSend_recordID(v6, v254, v255);
          *(_DWORD *)long long buf = 138543362;
          v347 = v256;
          _os_log_impl(&dword_1C4CFF000, v253, OS_LOG_TYPE_INFO, "Warn: Couldn't create a parent reference for record %{public}@", buf, 0xCu);
        }
      }
      v257 = objc_msgSend_chainParentPublicKeyID(v6, v250, v251);

      if (v257)
      {
        v260 = objc_msgSend_chainParentPublicKeyID(v6, v258, v259);
        uint64_t v263 = objc_msgSend_chainParent(v7, v261, v262);
        objc_msgSend_setPublicKeyID_(v263, v264, (uint64_t)v260);
      }
    }
  }
  if (v4)
  {
    uint64_t v265 = objc_msgSend_tombstonedPublicKeyIDs(v6, v220, v221);
    uint64_t v268 = objc_msgSend_mutableCopy(v265, v266, v267);
    objc_msgSend_setTombstonedPublicKeyIDs_(v7, v269, (uint64_t)v268);
  }
  if (objc_msgSend_hasUpdatedExpirationTimeInterval(v6, v220, v221))
  {
    v272 = objc_opt_new();
    objc_msgSend_setStorageExpiration_(v7, v273, (uint64_t)v272);

    v276 = objc_msgSend_updatedExpirationTimeInterval(v6, v274, v275);

    v279 = objc_msgSend_storageExpiration(v7, v277, v278);
    v281 = v279;
    if (v276)
    {
      objc_msgSend_setOperationType_(v279, v280, 2);

      v281 = objc_msgSend_updatedExpirationTimeInterval(v6, v282, v283);
      uint64_t v286 = objc_msgSend_unsignedLongLongValue(v281, v284, v285);
      uint64_t v289 = objc_msgSend_storageExpiration(v7, v287, v288);
      objc_msgSend_setDuration_(v289, v290, v286);
    }
    else
    {
      objc_msgSend_setOperationType_(v279, v280, 1);
    }
  }
  if (v4
    || objc_msgSend_canHostServerURLInfo(v6, v270, v271)
    && (objc_msgSend_shortSharingTokenHashData(v6, v291, v292),
        v293 = objc_claimAutoreleasedReturnValue(),
        v293,
        v293))
  {
    if ((objc_msgSend_hasStableUrl(v7, v270, v271) & 1) == 0)
    {
      v296 = objc_opt_new();
      objc_msgSend_setStableUrl_(v7, v297, (uint64_t)v296);
    }
    v298 = objc_msgSend_mutableEncryptedPSK(v6, v294, v295);
    v301 = objc_msgSend_encryptedData(v298, v299, v300);
    v304 = objc_msgSend_stableUrl(v7, v302, v303);
    objc_msgSend_setEncryptedPublicSharingKey_(v304, v305, (uint64_t)v301);

    uint64_t v308 = objc_msgSend_encryptedFullTokenData(v6, v306, v307);
    uint64_t v311 = objc_msgSend_stableUrl(v7, v309, v310);
    objc_msgSend_setProtectedFullToken_(v311, v312, (uint64_t)v308);

    v315 = objc_msgSend_routingKey(v6, v313, v314);
    v318 = objc_msgSend_stableUrl(v7, v316, v317);
    objc_msgSend_setRoutingKey_(v318, v319, (uint64_t)v315);

    v322 = objc_msgSend_shortSharingTokenHashData(v6, v320, v321);
    v325 = objc_msgSend_stableUrl(v7, v323, v324);
    objc_msgSend_setShortTokenHash_(v325, v326, (uint64_t)v322);

    uint64_t v329 = objc_msgSend_displayedHostname(v6, v327, v328);
    v332 = objc_msgSend_stableUrl(v7, v330, v331);
    objc_msgSend_setDisplayedHostname_(v332, v333, (uint64_t)v329);
  }
  return v7;
}

- (id)pRecordFromRecord:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v82 = a3;
  objc_msgSend__pRecordFromRecordSansValues_forCache_(self, v6, (uint64_t)v82, v4);
  id v81 = (id)objc_claimAutoreleasedReturnValue();
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v9 = objc_msgSend_valueStore(v82, v7, v8);
  uint64_t v12 = objc_msgSend_allKeys(v9, v10, v11);

  uint64_t v14 = 0;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v91, v97, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v92;
    obuint64_t j = v12;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v92 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_valueStore(v82, v15, v16);
        uint64_t v23 = objc_msgSend_rawValueForKey_(v21, v22, v20);

        uint64_t v25 = objc_msgSend_pFieldWithKey_value_forCache_(self, v24, v20, v23, v4);
        uint64_t v28 = objc_msgSend_actions(v25, v26, v27);
        uint64_t v31 = objc_msgSend_count(v28, v29, v30);
        if (v14) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v31 == 0;
        }
        int v33 = !v32;

        if (v33) {
          uint64_t v14 = objc_opt_new();
        }
        sub_1C5003F28(v81, v25, v14);
      }
      uint64_t v12 = obj;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v91, v97, 16);
    }
    while (v17);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v36 = objc_msgSend_encryptedValueStore(v82, v34, v35);
  objc_msgSend_allKeys(v36, v37, v38);
  id obja = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v87, v96, 16);
  if (v42)
  {
    uint64_t v43 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v88 != v43) {
          objc_enumerationMutation(obja);
        }
        uint64_t v45 = *(void *)(*((void *)&v87 + 1) + 8 * j);
        uint64_t v46 = objc_msgSend_encryptedValueStore(v82, v40, v41);
        long long v48 = objc_msgSend_rawValueForKey_(v46, v47, v45);

        long long v50 = objc_msgSend_pFieldWithKey_value_forCache_(self, v49, v45, v48, v4);
        int v53 = objc_msgSend_actions(v50, v51, v52);
        uint64_t v56 = objc_msgSend_count(v53, v54, v55);
        if (v14) {
          BOOL v57 = 1;
        }
        else {
          BOOL v57 = v56 == 0;
        }
        int v58 = !v57;

        if (v58) {
          uint64_t v14 = objc_opt_new();
        }
        sub_1C5003F28(v81, v50, v14);
      }
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v40, (uint64_t)&v87, v96, 16);
    }
    while (v42);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v61 = objc_msgSend_pluginFields(v82, v59, v60);
  id v64 = objc_msgSend_allKeys(v61, v62, v63);

  uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v83, v95, 16);
  if (v68)
  {
    uint64_t v69 = *(void *)v84;
    do
    {
      for (uint64_t k = 0; k != v68; ++k)
      {
        if (*(void *)v84 != v69) {
          objc_enumerationMutation(v64);
        }
        uint64_t v71 = *(void *)(*((void *)&v83 + 1) + 8 * k);
        uint64_t v72 = objc_msgSend_pluginFields(v82, v66, v67);
        uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v72, v73, v71);

        v76 = objc_msgSend_pFieldWithKey_value_forCache_(self, v75, v71, v74, v4);
        objc_msgSend_addPluginFields_(v81, v77, (uint64_t)v76);
      }
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v83, v95, 16);
    }
    while (v68);
  }

  return v81;
}

- (id)pRecordFromRecord:(id)a3
{
  return (id)objc_msgSend_pRecordFromRecord_forCache_(self, a2, (uint64_t)a3, 0);
}

- (id)deltaPRecordFromRecord:(id)a3 withAllFields:(BOOL)a4 outDeletedMergeFields:(id *)a5 outKeysToSend:(id *)a6
{
  v125 = a5;
  BOOL v6 = a4;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v131 = (id)objc_opt_new();
  objc_msgSend__pRecordFromRecordSansValues_forCache_(self, v9, (uint64_t)v8, 0);
  id v132 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_valueStore(v8, v10, v11);
  objc_msgSend_changedKeys(v12, v13, v14);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_encryptedValueStore(v8, v15, v16);
  objc_msgSend_changedKeys(v17, v18, v19);
  id v127 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    uint64_t v21 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v20, (uint64_t)obj);
    uint64_t v24 = v21;
    if (v21)
    {
      id v25 = v21;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CA80], v22, v23);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v27 = v25;

    uint64_t v30 = objc_msgSend_valueStore(v8, v28, v29);
    uint64_t v33 = objc_msgSend_allKeys(v30, v31, v32);
    uint64_t v35 = (void *)v33;
    uint64_t v36 = MEMORY[0x1E4F1CBF0];
    if (v33) {
      objc_msgSend_addObjectsFromArray_(v27, v34, v33, v125);
    }
    else {
      objc_msgSend_addObjectsFromArray_(v27, v34, MEMORY[0x1E4F1CBF0], v125);
    }

    uint64_t v26 = objc_msgSend_allObjects(v27, v37, v38);

    uint64_t v40 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v39, (uint64_t)v127);
    uint64_t v43 = v40;
    if (v40)
    {
      id v44 = v40;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CA80], v41, v42);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v45 = v44;

    long long v48 = objc_msgSend_encryptedValueStore(v8, v46, v47);
    uint64_t v51 = objc_msgSend_allKeys(v48, v49, v50);
    int v53 = (void *)v51;
    if (v51) {
      objc_msgSend_addObjectsFromArray_(v45, v52, v51);
    }
    else {
      objc_msgSend_addObjectsFromArray_(v45, v52, v36);
    }

    uint64_t v56 = objc_msgSend_allObjects(v45, v54, v55);

    id v127 = (id)v56;
  }
  else
  {
    uint64_t v26 = obj;
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id obja = v26;
  int v58 = 0;
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v57, (uint64_t)&v141, v147, 16);
  if (v61)
  {
    uint64_t v62 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v142 != v62) {
          objc_enumerationMutation(obja);
        }
        uint64_t v64 = *(void *)(*((void *)&v141 + 1) + 8 * i);
        long long v65 = objc_msgSend_valueStore(v8, v59, v60, v125);
        uint64_t v67 = objc_msgSend_rawValueForKey_(v65, v66, v64);

        if (v67)
        {
          uint64_t v69 = objc_msgSend_pFieldWithKey_value_forCache_(self, v68, v64, v67, 0);
          uint64_t v72 = objc_msgSend_actions(v69, v70, v71);
          if (objc_msgSend_count(v72, v73, v74)) {
            BOOL v75 = v58 == 0;
          }
          else {
            BOOL v75 = 0;
          }
          int v76 = v75;

          if (v76) {
            int v58 = objc_opt_new();
          }
          sub_1C5003F28(v132, v69, v58);
        }
        else
        {
          uint64_t v69 = objc_opt_new();
          objc_msgSend_setName_(v69, v77, v64);
          objc_msgSend_addObject_(v131, v78, (uint64_t)v69);
        }
      }
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v59, (uint64_t)&v141, v147, 16);
    }
    while (v61);
  }

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v128 = v127;
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v79, (uint64_t)&v137, v146, 16);
  if (v82)
  {
    uint64_t v83 = *(void *)v138;
    do
    {
      for (uint64_t j = 0; j != v82; ++j)
      {
        if (*(void *)v138 != v83) {
          objc_enumerationMutation(v128);
        }
        uint64_t v85 = *(void *)(*((void *)&v137 + 1) + 8 * j);
        long long v86 = objc_msgSend_encryptedValueStore(v8, v80, v81, v125);
        long long v88 = objc_msgSend_rawValueForKey_(v86, v87, v85);

        if (v88)
        {
          long long v90 = objc_msgSend_pFieldWithKey_value_forCache_(self, v89, v85, v88, 0);
          long long v93 = objc_msgSend_actions(v90, v91, v92);
          if (objc_msgSend_count(v93, v94, v95)) {
            BOOL v96 = v58 == 0;
          }
          else {
            BOOL v96 = 0;
          }
          int v97 = v96;

          if (v97) {
            int v58 = objc_opt_new();
          }
          sub_1C5003F28(v132, v90, v58);
        }
        else
        {
          long long v90 = objc_opt_new();
          objc_msgSend_setName_(v90, v98, v85);
          objc_msgSend_addObject_(v131, v99, (uint64_t)v90);
        }
      }
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v80, (uint64_t)&v137, v146, 16);
    }
    while (v82);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v102 = objc_msgSend_pluginFields(v8, v100, v101);
  uint64_t v105 = objc_msgSend_allKeys(v102, v103, v104);

  uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v106, (uint64_t)&v133, v145, 16);
  if (v109)
  {
    uint64_t v110 = *(void *)v134;
    do
    {
      for (uint64_t k = 0; k != v109; ++k)
      {
        if (*(void *)v134 != v110) {
          objc_enumerationMutation(v105);
        }
        uint64_t v112 = *(void *)(*((void *)&v133 + 1) + 8 * k);
        uint64_t v113 = objc_msgSend_pluginFields(v8, v107, v108, v125);
        uint64_t v115 = objc_msgSend_objectForKeyedSubscript_(v113, v114, v112);

        v117 = objc_msgSend_pFieldWithKey_value_forCache_(self, v116, v112, v115, 0);
        objc_msgSend_addPluginFields_(v132, v118, (uint64_t)v117);
      }
      uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v107, (uint64_t)&v133, v145, 16);
    }
    while (v109);
  }

  if (v125 && objc_msgSend_count(v131, v119, v120)) {
    id *v125 = v131;
  }
  if (a6)
  {
    v121 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v119, (uint64_t)obja);
    objc_msgSend_addObjectsFromArray_(v121, v122, (uint64_t)v128);
    id v123 = v121;
    *a6 = v123;
  }
  return v132;
}

- (id)assetFromPAsset:(id)a3 error:(id *)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F19E50]);
  inited = objc_msgSend_initInternal(v6, v7, v8);
  uint64_t v12 = objc_msgSend_signature(v5, v10, v11);
  objc_msgSend_setSignature_(inited, v13, (uint64_t)v12);

  uint64_t v16 = objc_msgSend_size(v5, v14, v15);
  objc_msgSend_setPaddedFileSize_(inited, v17, v16);
  uint64_t v20 = objc_msgSend_size(v5, v18, v19);
  objc_msgSend_setSize_(inited, v21, v20);
  uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
  id v25 = objc_msgSend_contentBaseURL(v5, v23, v24);
  uint64_t v27 = objc_msgSend_URLWithString_(v22, v26, (uint64_t)v25);
  objc_msgSend_setContentBaseURL_(inited, v28, (uint64_t)v27);

  uint64_t v31 = objc_msgSend_owner(v5, v29, v30);
  objc_msgSend_setOwner_(inited, v32, (uint64_t)v31);

  uint64_t v35 = objc_msgSend_requestor(v5, v33, v34);
  objc_msgSend_setRequestor_(inited, v36, (uint64_t)v35);

  uint64_t v39 = objc_msgSend_downloadToken(v5, v37, v38);
  objc_msgSend_setAuthToken_(inited, v40, (uint64_t)v39);

  if (objc_msgSend_hasAssetAuthorizationResponseUUID(v5, v41, v42)
    && objc_msgSend_haveDownloadPreauthorizations(self, v43, v44))
  {
    uint64_t v45 = objc_msgSend_assetAuthorizationResponseUUID(v5, v43, v44);
    uint64_t v47 = objc_msgSend_downloadPreauthorizationForResponseUUID_(self, v46, (uint64_t)v45);

    if (v47)
    {
      objc_msgSend_setDownloadPreauthorization_(inited, v48, (uint64_t)v47);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      long long v49 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v108 = v49;
        v111 = objc_msgSend_assetAuthorizationResponseUUID(v5, v109, v110);
        int v112 = 138543362;
        uint64_t v113 = v111;
        _os_log_error_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_ERROR, "Download Preauthorization For Response UUID %{public}@ Not Found", (uint8_t *)&v112, 0xCu);
      }
    }
  }
  uint64_t v50 = objc_msgSend_uploadReceipt(v5, v43, v44);
  objc_msgSend_setUploadReceipt_(inited, v51, (uint64_t)v50);

  if ((objc_msgSend_hasDownloadBaseURL(v5, v52, v53) & 1) != 0
    || objc_msgSend_hasConstructedAssetDownloadURL(v5, v54, v55))
  {
    uint64_t v56 = objc_msgSend_downloadBaseURL(v5, v54, v55);
    objc_msgSend_setDownloadBaseURL_(inited, v57, (uint64_t)v56);

    uint64_t v60 = objc_msgSend_constructedAssetDownloadURL(v5, v58, v59);
    objc_msgSend_setConstructedAssetDownloadURLTemplate_(inited, v61, (uint64_t)v60);

    if (objc_msgSend_hasDownloadURLExpiration(v5, v62, v63))
    {
      uint64_t v64 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v65 = objc_msgSend_downloadURLExpiration(v5, v54, v55);
      uint64_t v68 = objc_msgSend_dateWithTimeIntervalSince1970_(v64, v66, v67, (double)v65);
      objc_msgSend_setDownloadURLExpiration_(inited, v69, (uint64_t)v68);
    }
  }
  if (objc_msgSend_hasConstructedAssetDownloadURL(v5, v54, v55))
  {
    uint64_t v72 = objc_msgSend_constructedAssetDownloadURL(v5, v70, v71);
    objc_msgSend_setConstructedAssetDownloadURLTemplate_(inited, v73, (uint64_t)v72);

    if (objc_msgSend_hasConstructedAssetDownloadEstimatedSize(v5, v74, v75)) {
      uint64_t v78 = objc_msgSend_constructedAssetDownloadEstimatedSize(v5, v76, v77);
    }
    else {
      uint64_t v78 = objc_msgSend_size(v5, v76, v77);
    }
    objc_msgSend_setConstructedAssetEstimatedSize_(inited, v79, v78);
  }
  if (objc_msgSend_hasConstructedAssetDownloadParameters(v5, v70, v71))
  {
    uint64_t v82 = objc_msgSend_constructedAssetDownloadParameters(v5, v80, v81);
    objc_msgSend_setConstructedAssetDownloadParameters_(inited, v83, (uint64_t)v82);
  }
  long long v84 = objc_msgSend_referenceSignature(v5, v80, v81);
  objc_msgSend_setReferenceSignature_(inited, v85, (uint64_t)v84);

  long long v88 = objc_msgSend_protectionInfo(v5, v86, v87);
  long long v91 = objc_msgSend_protectionInfo(v88, v89, v90);
  objc_msgSend_setWrappedAssetKey_(inited, v92, (uint64_t)v91);

  if (objc_msgSend_hasClearAssetKey(v5, v93, v94))
  {
    int v97 = objc_msgSend_clearAssetKey(v5, v95, v96);
    objc_msgSend_setClearAssetKey_(inited, v98, (uint64_t)v97);

    uint64_t v101 = objc_msgSend_clearAssetKey(inited, v99, v100);
    objc_msgSend_setAssetKey_(inited, v102, (uint64_t)v101);
  }
  if (objc_msgSend_hasDownloadTokenExpiration(v5, v95, v96))
  {
    uint64_t v105 = objc_msgSend_downloadTokenExpiration(v5, v103, v104);
    objc_msgSend_setDownloadTokenExpiration_(inited, v106, v105);
  }

  return inited;
}

- (id)pAssetFromAsset:(id)a3
{
  id v4 = a3;
  double v7 = objc_msgSend_record(v4, v5, v6);
  uint64_t v8 = objc_opt_new();
  uint64_t v11 = objc_msgSend_signature(v4, v9, v10);
  objc_msgSend_setSignature_(v8, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_paddedFileSize(v4, v13, v14);
  objc_msgSend_setSize_(v8, v16, v15);
  if (v7)
  {
    uint64_t v19 = objc_msgSend_recordID(v7, v17, v18);
    uint64_t v21 = objc_msgSend_pRecordIdentifierFromRecordID_(self, v20, (uint64_t)v19);
    objc_msgSend_setRecordId_(v8, v22, (uint64_t)v21);
  }
  uint64_t v23 = objc_msgSend_uploadReceipt(v4, v17, v18);
  objc_msgSend_setUploadReceipt_(v8, v24, (uint64_t)v23);

  uint64_t v27 = objc_msgSend_wrappedAssetKey(v4, v25, v26);

  if (v27)
  {
    uint64_t v30 = objc_opt_new();
    objc_msgSend_setProtectionInfo_(v8, v31, (uint64_t)v30);

    uint64_t v34 = objc_msgSend_wrappedAssetKey(v4, v32, v33);
    uint64_t v37 = objc_msgSend_protectionInfo(v8, v35, v36);
    objc_msgSend_setProtectionInfo_(v37, v38, (uint64_t)v34);
  }
  uint64_t v39 = objc_msgSend_clearAssetKey(v4, v28, v29);

  if (v39)
  {
    uint64_t v42 = objc_msgSend_clearAssetKey(v4, v40, v41);
    objc_msgSend_setClearAssetKey_(v8, v43, (uint64_t)v42);
  }
  uint64_t v44 = objc_msgSend_referenceSignature(v4, v40, v41);

  if (v44)
  {
    uint64_t v47 = objc_msgSend_referenceSignature(v4, v45, v46);
    objc_msgSend_setReferenceSignature_(v8, v48, (uint64_t)v47);
  }
  long long v49 = objc_msgSend_downloadPreauthorization(v4, v45, v46);

  if (v49)
  {
    uint64_t v52 = objc_msgSend_downloadPreauthorization(v4, v50, v51);
    uint64_t v55 = objc_msgSend_responseUUID(v52, v53, v54);
    objc_msgSend_setAssetAuthorizationResponseUUID_(v8, v56, (uint64_t)v55);
  }
  return v8;
}

- (id)packageFromPPackage:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1E4F1A250];
  uint64_t v10 = objc_msgSend_packageStagingDirectory(self, v8, v9);
  uint64_t v12 = objc_msgSend_packageInDaemonWithBasePath_error_(v7, v11, (uint64_t)v10, a4);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_sections(v6, v13, v14);
    uint64_t v18 = objc_msgSend_count(v15, v16, v17) + 1;

    id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v19, v20, v18);
    uint64_t v24 = objc_msgSend_manifest(v6, v22, v23);
    uint64_t v26 = objc_msgSend_assetFromPAsset_error_(self, v25, (uint64_t)v24, a4);

    if (v26)
    {
      uint64_t v42 = v12;
      objc_msgSend_addObject_(v21, v27, v26);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v30 = objc_msgSend_sections(v6, v28, v29);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v43, v47, 16);
      if (v32)
      {
        uint64_t v34 = v32;
        uint64_t v35 = *(void *)v44;
        while (2)
        {
          uint64_t v36 = 0;
          uint64_t v37 = (void *)v26;
          do
          {
            if (*(void *)v44 != v35) {
              objc_enumerationMutation(v30);
            }
            uint64_t v26 = objc_msgSend_assetFromPAsset_error_(self, v33, *(void *)(*((void *)&v43 + 1) + 8 * v36), a4);

            if (!v26)
            {
              id v40 = 0;
              uint64_t v12 = v42;
              goto LABEL_14;
            }
            objc_msgSend_addObject_(v21, v38, v26);
            ++v36;
            uint64_t v37 = (void *)v26;
          }
          while (v34 != v36);
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v43, v47, 16);
          if (v34) {
            continue;
          }
          break;
        }
      }

      uint64_t v12 = v42;
      objc_msgSend_setAssets_(v42, v39, (uint64_t)v21);
      id v40 = v42;
      uint64_t v30 = (void *)v26;
LABEL_14:
    }
    else
    {
      id v40 = 0;
    }
  }
  else
  {
    id v40 = 0;
  }

  return v40;
}

- (id)pPackageFromPackage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_assets(v4, v6, v7);
  uint64_t v11 = objc_msgSend_objectEnumerator(v8, v9, v10);

  uint64_t v14 = objc_msgSend_nextObject(v11, v12, v13);
  uint64_t v16 = objc_msgSend_pAssetFromAsset_(self, v15, (uint64_t)v14);
  objc_msgSend_setManifest_(v5, v17, (uint64_t)v16);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v11;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v18);
        }
        id v25 = objc_msgSend_pAssetFromAsset_(self, v21, *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        objc_msgSend_addSections_(v5, v26, (uint64_t)v25);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  return v5;
}

- (id)pStreamingAssetFromStreamingAsset:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v9 = objc_msgSend_owner(v5, v7, v8);
  if (v9)
  {
    uint64_t v12 = (void *)v9;
    uint64_t v13 = objc_msgSend_fileSignature(v5, v10, v11);
    if (v13)
    {
      uint64_t v16 = (void *)v13;
      uint64_t v17 = objc_msgSend_referenceSignature(v5, v14, v15);

      if (!v17) {
        goto LABEL_6;
      }
      uint64_t v12 = objc_opt_new();
      uint64_t v20 = objc_msgSend_referenceSignature(v5, v18, v19);
      objc_msgSend_setReferenceSignature_(v12, v21, (uint64_t)v20);

      uint64_t v24 = objc_msgSend_fileSignature(v5, v22, v23);
      objc_msgSend_setFileSignature_(v12, v25, (uint64_t)v24);

      long long v28 = objc_msgSend_owner(v5, v26, v27);
      objc_msgSend_setOwner_(v12, v29, (uint64_t)v28);

      objc_msgSend_setAssetId_(v6, v30, (uint64_t)v12);
    }
  }
LABEL_6:
  if (!v4) {
    goto LABEL_17;
  }
  long long v31 = objc_msgSend_downloadURL(v5, v10, v11);
  if (v31)
  {
  }
  else if (!objc_msgSend_hasSize(v5, v32, v33))
  {
    goto LABEL_17;
  }
  uint64_t v34 = objc_opt_new();
  uint64_t v37 = objc_msgSend_downloadURL(v5, v35, v36);

  if (v37)
  {
    id v40 = objc_msgSend_downloadURL(v5, v38, v39);
    long long v43 = objc_msgSend_absoluteString(v40, v41, v42);
    objc_msgSend_setDownloadURL_(v34, v44, (uint64_t)v43);
  }
  if (objc_msgSend_hasSize(v5, v38, v39))
  {
    uint64_t v47 = objc_msgSend_size(v5, v45, v46);
    objc_msgSend_setSize_(v34, v48, v47);
  }
  long long v49 = objc_msgSend_downloadURLExpirationDate(v5, v45, v46);

  if (v49)
  {
    uint64_t v52 = objc_msgSend_downloadURLExpirationDate(v5, v50, v51);
    objc_msgSend_timeIntervalSince1970(v52, v53, v54);
    objc_msgSend_setDownloadURLExpirationTimeSeconds_(v34, v56, (uint64_t)v55);
  }
  objc_msgSend_setRetrieveAssetResponse_(v6, v50, (uint64_t)v34);

LABEL_17:
  BOOL v57 = objc_opt_new();
  objc_msgSend_setRequestedSize_(v57, v58, 0x7FFFFFFFFFFFFFFFLL);
  if (objc_msgSend_hasSize(v5, v59, v60))
  {
    uint64_t v63 = objc_msgSend_size(v5, v61, v62);
    objc_msgSend_setUploadedSize_(v57, v64, v63);
  }
  uint64_t v65 = objc_msgSend_uploadReceipt(v5, v61, v62);

  if (v65)
  {
    uint64_t v68 = objc_msgSend_uploadReceipt(v5, v66, v67);
    objc_msgSend_setUploadReceipt_(v57, v69, (uint64_t)v68);
  }
  objc_msgSend_setSaveAssetRequest_(v6, v66, (uint64_t)v57);

  return v6;
}

- (id)streamingAssetFromPStreamingAsset:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1A3C8]);
  inited = objc_msgSend_initInternal(v5, v6, v7);
  if (objc_msgSend_hasAssetId(v4, v9, v10))
  {
    uint64_t v13 = objc_msgSend_assetId(v4, v11, v12);
    if (objc_msgSend_hasOwner(v13, v14, v15))
    {
      id v18 = objc_msgSend_owner(v13, v16, v17);
      objc_msgSend_setOwner_(inited, v19, (uint64_t)v18);
    }
    if (objc_msgSend_hasFileSignature(v13, v16, v17))
    {
      uint64_t v22 = objc_msgSend_fileSignature(v13, v20, v21);
      objc_msgSend_setFileSignature_(inited, v23, (uint64_t)v22);
    }
    if (objc_msgSend_hasReferenceSignature(v13, v20, v21))
    {
      uint64_t v26 = objc_msgSend_referenceSignature(v13, v24, v25);
      objc_msgSend_setReferenceSignature_(inited, v27, (uint64_t)v26);
    }
  }
  if (objc_msgSend_hasSaveAssetResponse(v4, v11, v12))
  {
    long long v30 = objc_msgSend_saveAssetResponse(v4, v28, v29);
    if (objc_msgSend_hasUploadURL(v30, v31, v32))
    {
      uint64_t v35 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v36 = objc_msgSend_uploadURL(v30, v33, v34);
      uint64_t v38 = objc_msgSend_URLWithString_(v35, v37, (uint64_t)v36);
      objc_msgSend_setUploadURL_(inited, v39, (uint64_t)v38);
    }
    if (objc_msgSend_hasReservedSize(v30, v33, v34))
    {
      uint64_t v42 = objc_msgSend_reservedSize(v30, v40, v41);
      objc_msgSend_setReservedSize_(inited, v43, v42);
    }
    if (objc_msgSend_hasUploadURLExpirationTimeSeconds(v30, v40, v41))
    {
      uint64_t v46 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v47 = objc_msgSend_uploadURLExpirationTimeSeconds(v30, v44, v45);
      uint64_t v50 = objc_msgSend_dateWithTimeIntervalSince1970_(v46, v48, v49, (double)v47);
      objc_msgSend_setUploadURLExpirationDate_(inited, v51, (uint64_t)v50);
    }
  }
  if (objc_msgSend_hasRetrieveAssetResponse(v4, v28, v29))
  {
    uint64_t v54 = objc_msgSend_retrieveAssetResponse(v4, v52, v53);
    if (objc_msgSend_hasSize(v54, v55, v56))
    {
      uint64_t v59 = objc_msgSend_size(v54, v57, v58);
      objc_msgSend_setSize_(inited, v60, v59);
    }
    if (objc_msgSend_hasDownloadURL(v54, v57, v58))
    {
      uint64_t v63 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v64 = objc_msgSend_downloadURL(v54, v61, v62);
      uint64_t v66 = objc_msgSend_URLWithString_(v63, v65, (uint64_t)v64);
      objc_msgSend_setDownloadURL_(inited, v67, (uint64_t)v66);
    }
    if (objc_msgSend_hasDownloadURLExpirationTimeSeconds(v54, v61, v62))
    {
      uint64_t v70 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v71 = objc_msgSend_downloadURLExpirationTimeSeconds(v54, v68, v69);
      uint64_t v74 = objc_msgSend_dateWithTimeIntervalSince1970_(v70, v72, v73, (double)v71);
      objc_msgSend_setDownloadURLExpirationDate_(inited, v75, (uint64_t)v74);
    }
  }

  return inited;
}

- (id)pMergeableValueIdentifierFromMergeableValueID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_name(v4, v6, v7);
  uint64_t v11 = objc_msgSend_CKDPIdentifier_MergeableValue(v8, v9, v10);
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_zoneID(v4, v13, v14);

  uint64_t v17 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v16, (uint64_t)v15);
  objc_msgSend_setZoneIdentifier_(v5, v18, (uint64_t)v17);

  return v5;
}

- (id)mergeableValueIDFromPMergeableValueIdentifier:(id)a3 recordName:(id)a4 fieldName:(id)a5 encrypted:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a3;
  uint64_t v17 = objc_msgSend_value(v14, v15, v16);
  uint64_t v20 = objc_msgSend_name(v17, v18, v19);

  uint64_t v23 = objc_msgSend_zoneIdentifier(v14, v21, v22);

  id v34 = 0;
  uint64_t v25 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(self, v24, (uint64_t)v23, &v34);
  id v26 = v34;

  if (v26)
  {
    uint64_t v27 = 0;
    if (a7) {
      *a7 = v26;
    }
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    long long v30 = objc_msgSend_initWithRecordName_zoneID_(v28, v29, (uint64_t)v12, v25);
    id v31 = objc_alloc(MEMORY[0x1E4F1A168]);
    uint64_t v27 = objc_msgSend_initWithName_recordID_key_encrypted_(v31, v32, (uint64_t)v20, v30, v13, v8);
  }
  return v27;
}

- (id)mergeableRecordValueFromPRecordField:(id)a3 inPRecordIdentifier:(id)a4 asAnonymousCKUserID:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v16 = objc_msgSend_value(v11, v14, v15);
  int v19 = objc_msgSend_type(v16, v17, v18);
  if (v19 == 29)
  {
    uint64_t v22 = objc_msgSend_encryptedMergeableValue(v16, v20, v21);

    if (v22)
    {
      uint64_t v25 = objc_msgSend_encryptedMergeableValue(v16, v23, v24);
      unsigned int v63 = 1;
      objc_msgSend_identifier(v25, v28, v29);
      goto LABEL_7;
    }
    unsigned int v63 = 1;
  }
  else
  {
    if (v19 != 28)
    {
      if (a6)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 1005, @"Invalid field value type");
        uint64_t v22 = 0;
        id v30 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      uint64_t v22 = 0;
      goto LABEL_18;
    }
    uint64_t v22 = objc_msgSend_mergeableValue(v16, v20, v21);

    if (v22)
    {
      uint64_t v25 = objc_msgSend_mergeableValue(v16, v23, v24);
      unsigned int v63 = 0;
      objc_msgSend_identifier(v25, v26, v27);
      uint64_t v22 = LABEL_7:;

      goto LABEL_12;
    }
    unsigned int v63 = 0;
  }
LABEL_12:
  id v31 = objc_msgSend_name(v22, v23, v24);
  int v32 = _CKCheckArgument();

  if (!v32)
  {
LABEL_18:
    id v30 = 0;
    goto LABEL_25;
  }
  uint64_t v35 = objc_msgSend_name(v22, v33, v34);

  if (v35)
  {
    if (v12) {
      goto LABEL_15;
    }
LABEL_20:
    id v39 = 0;
LABEL_21:
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 1017, 0, v39, @"No zone ID for mergeable value");
      id v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v30 = 0;
    }
    goto LABEL_24;
  }
  uint64_t v59 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v36, v37);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)a2, self, @"CKDProtocolTranslator.m", 1186, @"Convincing clang");

  if (!v12) {
    goto LABEL_20;
  }
LABEL_15:
  id v64 = 0;
  uint64_t v38 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v36, (uint64_t)v12, v13, &v64);
  id v39 = v64;
  if (!v38) {
    goto LABEL_21;
  }
  id v40 = objc_alloc(MEMORY[0x1E4F1A168]);
  long long v43 = objc_msgSend_name(v22, v41, v42);
  uint64_t v46 = objc_msgSend_identifier(v11, v44, v45);
  uint64_t v49 = objc_msgSend_name(v46, v47, v48);
  uint64_t v50 = v38;
  uint64_t v62 = (void *)v38;
  id v51 = v12;
  id v52 = v13;
  id v53 = v39;
  uint64_t v54 = (void *)v49;
  uint64_t v56 = objc_msgSend_initWithName_recordID_key_encrypted_(v40, v55, (uint64_t)v43, v50, v49, v63);

  id v39 = v53;
  id v13 = v52;
  id v12 = v51;

  id v30 = objc_alloc_init(MEMORY[0x1E4F1A160]);
  objc_msgSend_setValueID_(v30, v57, (uint64_t)v56);
  objc_msgSend_setIsValueIDKnownToServer_(v30, v58, 1);

LABEL_24:
LABEL_25:

  return v30;
}

- (id)pMergeableValueFromMergeableValueID:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDProtocolTranslator.m", 1213, @"Trying to create a mergeable value proto without a mergeable value ID");
  }
  BOOL v8 = objc_opt_new();
  id v11 = objc_msgSend_name(v7, v9, v10);
  id v14 = objc_msgSend_CKDPIdentifier_MergeableValue(v11, v12, v13);
  objc_msgSend_setIdentifier_(v8, v15, (uint64_t)v14);

  return v8;
}

- (id)pEncryptedMergeableValueFromRecordValue:(id)a3
{
  id v5 = a3;
  BOOL v8 = objc_msgSend_valueID(v5, v6, v7);

  if (!v8)
  {
    uint64_t v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDProtocolTranslator.m", 1220, @"Trying to create a mergeable value proto without a mergeable value ID");
  }
  id v11 = objc_opt_new();
  id v14 = objc_msgSend_valueID(v5, v12, v13);

  uint64_t v17 = objc_msgSend_name(v14, v15, v16);
  uint64_t v20 = objc_msgSend_CKDPIdentifier_MergeableValue(v17, v18, v19);
  objc_msgSend_setIdentifier_(v11, v21, (uint64_t)v20);

  return v11;
}

- (id)mergeableDeltaFromPDelta:(id)a3 valueID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_hasMetadata(v8, v10, v11))
  {
    id v14 = objc_msgSend_metadata(v8, v12, v13);
    uint64_t v16 = objc_msgSend_mergeableDeltaMetadataFromPMetadata_mergeableValueID_error_(self, v15, (uint64_t)v14, v9, a5);

    if (v16)
    {
      switch(objc_msgSend_payload(v8, v17, v18))
      {
        case 0u:
          if (!a5) {
            goto LABEL_11;
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 1017, @"Unknown or missing mergeable delta payload");
          id v26 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          break;
        case 1u:
          id v27 = objc_alloc(MEMORY[0x1E4F1A148]);
          id v30 = objc_msgSend_data(v8, v28, v29);
          uint64_t v32 = objc_msgSend_initWithValueID_metadata_data_(v27, v31, (uint64_t)v9, v16, v30);
          goto LABEL_14;
        case 2u:
          id v33 = objc_alloc(MEMORY[0x1E4F1A148]);
          id v30 = objc_msgSend_encryptedData(v8, v34, v35);
          uint64_t v32 = objc_msgSend_initWithValueID_metadata_encryptedData_(v33, v36, (uint64_t)v9, v16, v30);
LABEL_14:
          id v26 = (void *)v32;

          break;
        case 3u:
        case 4u:
          uint64_t v21 = objc_msgSend_asset(v8, v19, v20);
          uint64_t v24 = v21;
          if (v21)
          {
            id v25 = v21;
          }
          else
          {
            objc_msgSend_encryptedAsset(v8, v22, v23);
            id v25 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v37 = v25;

          id v45 = 0;
          id v39 = objc_msgSend_assetFromPAsset_error_(self, v38, (uint64_t)v37, &v45);
          id v41 = v45;
          if (v39)
          {
            id v42 = objc_alloc(MEMORY[0x1E4F1A148]);
            id v26 = objc_msgSend_initWithValueID_metadata_asset_(v42, v43, (uint64_t)v9, v16, v39);
          }
          else if (a5)
          {
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v40, *MEMORY[0x1E4F19DD8], 2005, v41, @"Failed to parse asset from server");
            id v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v26 = 0;
          }

          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      id v26 = 0;
    }
  }
  else if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 1017, @"Missing mergeable delta metadata: %@", v8);
    id v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (id)pMergeableDeltaFromDelta:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(CKDPMergeableDelta);
  uint64_t v10 = objc_msgSend_valueID(v6, v8, v9);
  int isEncrypted = objc_msgSend_isEncrypted(v10, v11, v12);

  if (isEncrypted)
  {
    uint64_t v16 = objc_msgSend_encryptedData(v6, v14, v15);

    if (v16)
    {
      objc_msgSend_encryptedData(v6, v17, v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEncryptedData_(v7, v20, (uint64_t)v19);
      goto LABEL_11;
    }
    id v27 = objc_msgSend_asset(v6, v17, v18);

    if (v27)
    {
      objc_msgSend_asset(v6, v28, v29);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = objc_msgSend_pAssetFromAsset_(self, v30, (uint64_t)v19);
      objc_msgSend_setEncryptedAsset_(v7, v31, (uint64_t)v25);
      goto LABEL_10;
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 1017, @"No encrypted data on delta %@", v6);
      id v45 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend_asset(v6, v14, v15);

    if (v21)
    {
      objc_msgSend_asset(v6, v22, v23);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = objc_msgSend_pAssetFromAsset_(self, v24, (uint64_t)v19);
      objc_msgSend_setAsset_(v7, v26, (uint64_t)v25);
LABEL_10:

LABEL_11:
      uint64_t v37 = objc_msgSend_metadata(v6, v33, v34);
      if (v37)
      {
        uint64_t v38 = objc_msgSend_valueID(v6, v35, v36);
        id v40 = objc_msgSend_pMergeableDeltaMetadataFromMetadata_mergeableValueID_error_(self, v39, (uint64_t)v37, v38, a4);
        objc_msgSend_setMetadata_(v7, v41, (uint64_t)v40);

        long long v44 = objc_msgSend_metadata(v7, v42, v43);

        if (v44)
        {
          id v45 = v7;
LABEL_17:

          goto LABEL_18;
        }
      }
      else if (a4)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 1017, @"No metadata on delta %@", v6);
        id v45 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      id v45 = 0;
      goto LABEL_17;
    }
    id v47 = 0;
    id v25 = objc_msgSend_dataWithError_(v6, v22, (uint64_t)&v47);
    id v19 = v47;
    if (v25)
    {
      objc_msgSend_setData_(v7, v32, (uint64_t)v25);
      goto LABEL_10;
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 1017, v19, @"Failed to get data from mergeable delta %@", v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v45 = 0;
LABEL_18:

  return v45;
}

- (id)mergeableDeltaMetadataFromPMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_identifier(v8, v10, v11);
  if (v13)
  {
    id v14 = objc_opt_new();
    long long v89 = objc_opt_new();
    uint64_t v15 = objc_opt_new();
    long long v88 = objc_opt_new();
    uint64_t v18 = objc_msgSend_replacedDeltaIdentifiers(v8, v16, v17);
    uint64_t v21 = objc_msgSend_count(v18, v19, v20);

    if (v21)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
      objc_msgSend_replacedDeltaIdentifiers(v8, v22, v23);
      v26 = id v25 = v15;
      uint64_t v21 = objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26);

      uint64_t v15 = v25;
    }
    if (objc_msgSend_isEncrypted(v9, v22, v23))
    {
      id v30 = objc_alloc(MEMORY[0x1E4F1A150]);
      id v31 = objc_alloc(MEMORY[0x1E4F1A158]);
      uint64_t v87 = v14;
      uint64_t v32 = v15;
      uint64_t v34 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v31, v33, (uint64_t)v14, v89, v15, v88);
      id v36 = (id)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v30, v35, (uint64_t)v13, v34, v21);

      if (!objc_msgSend_hasProtectionInfo(v8, v37, v38)
        || (objc_msgSend_protectionInfo(v8, v39, v40),
            id v41 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_protectionInfo(v41, v42, v43),
            long long v44 = objc_claimAutoreleasedReturnValue(),
            uint64_t v47 = objc_msgSend_length(v44, v45, v46),
            v44,
            v41,
            !v47))
      {
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, *MEMORY[0x1E4F19DD8], 1017, @"Missing protection info for delta metadata");
          uint64_t v78 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v78 = 0;
        }
        id v14 = v87;
        uint64_t v15 = v32;
        goto LABEL_39;
      }
      uint64_t v49 = objc_msgSend_protectionInfo(v8, v39, v48);
      id v52 = objc_msgSend_protectionInfo(v49, v50, v51);
      objc_msgSend_setEnvelope_(v36, v53, (uint64_t)v52);

      if ((objc_msgSend_hasTimestamps(v8, v54, v55) & 1) != 0
        || (objc_msgSend_hasEncryptedTimestamps(v8, v56, v57) & 1) != 0)
      {
        uint64_t v15 = v32;
        if (!objc_msgSend_hasTimestamps(v8, v56, v57))
        {
LABEL_12:
          if (!objc_msgSend_hasEncryptedTimestamps(v8, v58, v59))
          {
            id v14 = v87;
            goto LABEL_31;
          }
          int v76 = objc_msgSend_encryptedTimestamps(v8, v74, v75);
          objc_msgSend_setEncryptedTimestamps_(v36, v77, (uint64_t)v76);
          id v14 = v87;
LABEL_20:

LABEL_31:
          id v36 = v36;
          uint64_t v78 = v36;
          goto LABEL_39;
        }
        if (objc_msgSend_hasTimestampsAuthTag(v8, v58, v59))
        {
          id v61 = objc_alloc(MEMORY[0x1E4F1A470]);
          id v64 = objc_msgSend_timestamps(v8, v62, v63);
          uint64_t v67 = objc_msgSend_data(v64, v65, v66);
          uint64_t v70 = objc_msgSend_timestampsAuthTag(v8, v68, v69);
          uint64_t v72 = objc_msgSend_initWithObject1_object2_(v61, v71, (uint64_t)v67, v70);
          objc_msgSend_setAuthenticatedTimestamps_(v36, v73, (uint64_t)v72);

          uint64_t v15 = v32;
          goto LABEL_12;
        }
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v60, *MEMORY[0x1E4F19DD8], 1017, @"Missing authentication tag for timestamps");
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v15 = v32;
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19DD8], 1017, @"No version vectors in delta metadata proto");
LABEL_36:
          uint64_t v78 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
          id v14 = v87;
          goto LABEL_39;
        }
      }
      uint64_t v78 = 0;
      goto LABEL_38;
    }
    if (objc_msgSend_hasTimestamps(v8, v28, v29))
    {
      uint64_t v81 = objc_msgSend_timestamps(v8, v79, v80);
      int v76 = objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(self, v82, (uint64_t)v81, a5);

      if (v76 && (objc_msgSend__validate_(v76, v83, (uint64_t)a5) & 1) != 0)
      {
        id v84 = objc_alloc(MEMORY[0x1E4F1A150]);
        id v36 = (id)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v84, v85, (uint64_t)v13, v76, v21);
        goto LABEL_20;
      }
    }
    else if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v79, *MEMORY[0x1E4F19DD8], 1017, @"No version vectors in delta metadata proto");
      id v36 = 0;
      uint64_t v78 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

      goto LABEL_40;
    }
    id v36 = 0;
    uint64_t v78 = 0;
    goto LABEL_39;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 1017, @"No identifier in delta metadata proto");
    uint64_t v78 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v78 = 0;
  }
LABEL_40:

  return v78;
}

- (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  id v19 = 0;
  id v5 = objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(MEMORY[0x1E4F1A158], a2, (uint64_t)a3, &v19);
  id v6 = v19;
  id v9 = v6;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  int v11 = !v10;
  if (a4 && v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v13 = *MEMORY[0x1E4F19DD8];
    id v14 = objc_msgSend_userInfo(v6, v7, v8);
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E4F28568]);
    objc_msgSend_errorWithDomain_code_format_(v12, v17, v13, 1017, @"%@", v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pMergeableDeltaMetadataFromMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)objc_opt_new();
  uint64_t v12 = objc_msgSend_identifier(v7, v10, v11);
  objc_msgSend_setIdentifier_(v9, v13, (uint64_t)v12);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v16 = objc_msgSend_replacedDeltaIdentifiers(v7, v14, v15);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v71, v75, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addReplacedDeltaIdentifiers_(v9, v19, *(void *)(*((void *)&v71 + 1) + 8 * i));
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v71, v75, 16);
    }
    while (v20);
  }

  if (!objc_msgSend_isEncrypted(v8, v23, v24))
  {
    uint64_t v35 = (void *)MEMORY[0x1E4F1A158];
    id v36 = objc_msgSend_vectors(v7, v25, v26);
    uint64_t v38 = objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(v35, v37, (uint64_t)v36);
    objc_msgSend_setTimestamps_(v9, v39, (uint64_t)v38);

    uint64_t v34 = 0;
    id v40 = v9;
LABEL_21:

    uint64_t v68 = v34;
    id v9 = v40;
LABEL_22:
    if (a5) {
      *a5 = v68;
    }
    id v9 = v9;
    uint64_t v34 = v68;
    uint64_t v69 = v9;
    goto LABEL_25;
  }
  id v28 = objc_msgSend_envelope(v7, v25, v26);
  if (v28)
  {
    uint64_t v29 = objc_opt_new();
    objc_msgSend_setProtectionInfo_(v29, v30, (uint64_t)v28);
    objc_msgSend_setProtectionInfo_(v9, v31, (uint64_t)v29);

    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 1017, @"No envelope on metadata: %@", v7);
  }
  id v41 = objc_msgSend_encryptedTimestamps(v7, v32, v33);
  if (v41)
  {

    goto LABEL_16;
  }
  uint64_t v46 = objc_msgSend_authenticatedTimestamps(v7, v42, v43);

  if (v46)
  {
LABEL_16:
    uint64_t v47 = objc_msgSend_encryptedTimestamps(v7, v44, v45);

    if (v47)
    {
      uint64_t v50 = objc_msgSend_encryptedTimestamps(v7, v48, v49);
      objc_msgSend_setEncryptedTimestamps_(v9, v51, (uint64_t)v50);
    }
    id v52 = objc_msgSend_authenticatedTimestamps(v7, v48, v49);

    if (v52)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F19F00]);
      uint64_t v56 = objc_msgSend_authenticatedTimestamps(v7, v54, v55);
      uint64_t v58 = objc_msgSend_objectAtIndexedSubscript_(v56, v57, 0);
      uint64_t v60 = objc_msgSend_initWithData_(v53, v59, (uint64_t)v58);
      objc_msgSend_setTimestamps_(v9, v61, (uint64_t)v60);

      id v64 = objc_msgSend_authenticatedTimestamps(v7, v62, v63);
      uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v64, v65, 1);
      objc_msgSend_setTimestampsAuthTag_(v9, v67, (uint64_t)v66);
    }
    id v40 = 0;
    uint64_t v68 = 0;
    id v36 = v9;
    if (!v34) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v44, *MEMORY[0x1E4F19DD8], 1017, @"No version vectors in delta metadata");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v69 = 0;
LABEL_25:

  return v69;
}

- (id)pQueryFromQuery:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  BOOL v10 = objc_msgSend_predicate(v6, v8, v9);
  id v48 = 0;
  uint64_t v12 = objc_msgSend_CKDPQueryFiltersWithTranslator_error_(v10, v11, (uint64_t)self, &v48);
  id v13 = v48;

  if (!v12) {
    goto LABEL_4;
  }
  uint64_t v14 = CKVerifyFilters(v12);

  if (v14)
  {
    id v13 = (id)v14;
LABEL_4:
    if (a4)
    {
      id v13 = v13;
      *a4 = v13;
    }

    id v15 = 0;
    goto LABEL_22;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v16 = v12;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v44, v50, 16);
  if (v19)
  {
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addFilters_(v7, v18, *(void *)(*((void *)&v44 + 1) + 8 * i));
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v44, v50, 16);
    }
    while (v19);
  }

  uint64_t v22 = objc_alloc_init(CKDPRecordType);
  id v25 = objc_msgSend_recordType(v6, v23, v24);
  objc_msgSend_setName_(v22, v26, (uint64_t)v25);

  objc_msgSend_addTypes_(v7, v27, (uint64_t)v22);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v30 = objc_msgSend_sortDescriptors(v6, v28, v29);
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v40, v49, 16);
  if (v34)
  {
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v30);
        }
        uint64_t v37 = objc_msgSend_CKDPQuerySort(*(void **)(*((void *)&v40 + 1) + 8 * j), v32, v33);
        objc_msgSend_addSorts_(v7, v38, (uint64_t)v37);
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v40, v49, 16);
    }
    while (v34);
  }

  id v15 = v7;
LABEL_22:

  return v15;
}

- (id)subscriptionFromPSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_identifier(v6, v7, v8);
  uint64_t v12 = objc_msgSend_name(v9, v10, v11);

  if (objc_msgSend_hasZoneIdentifier(v6, v13, v14))
  {
    uint64_t v17 = objc_msgSend_zoneIdentifier(v6, v15, v16);
    uint64_t v19 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(self, v18, (uint64_t)v17, a4);

    if (!v19)
    {
      uint64_t v20 = 0;
LABEL_4:
      uint64_t v21 = 0;
LABEL_5:
      id v22 = 0;
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (objc_msgSend_hasEvaluationType(v6, v15, v16))
  {
    unsigned int v25 = objc_msgSend_evaluationType(v6, v23, v24);
    uint64_t v26 = (uint64_t)v12;
    if (v25 > 3)
    {
      BOOL v27 = 0;
      BOOL v28 = 0;
      BOOL v296 = 0;
    }
    else
    {
      BOOL v27 = (v25 & 0xF) == 1;
      BOOL v28 = v25 == 2;
      BOOL v296 = v25 == 3;
    }
  }
  else
  {
    uint64_t v26 = (uint64_t)v12;
    BOOL v28 = 0;
    BOOL v296 = 0;
    BOOL v27 = 1;
  }
  if (objc_msgSend_filtersCount(v6, v23, v24))
  {
    id v31 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v32 = objc_msgSend_filters(v6, v29, v30);
    uint64_t v21 = objc_msgSend_predicateWithCKDPQueryFilters_translator_(v31, v33, (uint64_t)v32, self);
  }
  else if (objc_msgSend_evaluationType(v6, v29, v30) == 1)
  {
    uint64_t v21 = objc_msgSend_predicateWithValue_(MEMORY[0x1E4F28F60], v34, 1);
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v20 = objc_msgSend_recordTypes(v6, v34, v35);
  if (v20)
  {
    uint64_t v38 = objc_msgSend_recordTypes(v6, v36, v37);
    uint64_t v41 = objc_msgSend_count(v38, v39, v40);

    if (v41)
    {
      long long v42 = objc_msgSend_recordTypes(v6, v36, v37);
      long long v44 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0);
      uint64_t v20 = objc_msgSend_name(v44, v45, v46);
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  if (objc_msgSend_mutationTriggers(v6, v36, v37) && objc_msgSend_mutationTriggersCount(v6, v47, v48))
  {
    unint64_t v49 = 0;
    uint64_t v50 = 0;
    do
    {
      int v53 = *(_DWORD *)(objc_msgSend_mutationTriggers(v6, v47, v48) + 4 * v49);
      uint64_t v54 = v50 | 2;
      uint64_t v55 = v50 | 1;
      if (v53 != 1) {
        uint64_t v55 = v50;
      }
      if (v53 != 2) {
        uint64_t v54 = v55;
      }
      if (v53 == 3) {
        v50 |= 4uLL;
      }
      else {
        uint64_t v50 = v54;
      }
      ++v49;
    }
    while (v49 < objc_msgSend_mutationTriggersCount(v6, v51, v52));
  }
  else
  {
    uint64_t v50 = 0;
  }
  if (objc_msgSend_fireOnce(v6, v47, v48)) {
    v50 |= 8uLL;
  }
  if (v27)
  {
    uint64_t v12 = (void *)v26;
    if (v20)
    {
      if (v21)
      {
        id v58 = objc_alloc(MEMORY[0x1E4F1A2C8]);
        uint64_t v60 = objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v58, v59, (uint64_t)v20, v21, v26, v50);
        objc_msgSend_setZoneID_(v60, v61, (uint64_t)v19);
        goto LABEL_49;
      }
      if (!a4) {
        goto LABEL_4;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19C40], 2019, @"Subscription from server didn't have a predicate");
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = 0;
    }
    else
    {
      if (!a4)
      {
        uint64_t v20 = 0;
        goto LABEL_5;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19C40], 2019, @"Subscription from server didn't have a record type");
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = 0;
    }
LABEL_57:
    id v22 = 0;
    *a4 = v68;
    goto LABEL_58;
  }
  if (v28)
  {
    if (!v19)
    {
      uint64_t v12 = (void *)v26;
      if (!a4)
      {
        uint64_t v19 = 0;
        goto LABEL_5;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19C40], 2019, @"Subscription from server didn't have a zone id");
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = 0;
      goto LABEL_57;
    }
    id v62 = objc_alloc(MEMORY[0x1E4F1A340]);
    uint64_t v12 = (void *)v26;
    id v64 = objc_msgSend_initWithZoneID_subscriptionID_(v62, v63, (uint64_t)v19, v26);
    goto LABEL_45;
  }
  if (v296)
  {
    id v66 = objc_alloc(MEMORY[0x1E4F19F50]);
    uint64_t v12 = (void *)v26;
    id v64 = objc_msgSend_initWithSubscriptionID_(v66, v67, v26);
LABEL_45:
    uint64_t v60 = v64;
    objc_msgSend_setRecordType_(v64, v65, (uint64_t)v20);
    goto LABEL_49;
  }
  uint64_t v60 = 0;
  uint64_t v12 = (void *)v26;
LABEL_49:
  if (objc_msgSend_hasNotification(v6, v56, v57))
  {
    id v69 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
    objc_msgSend_setNotificationInfo_(v60, v70, (uint64_t)v69);

    long long v73 = objc_msgSend_notification(v6, v71, v72);
    uint64_t shouldBadge = objc_msgSend_shouldBadge(v73, v74, v75);
    v79 = objc_msgSend_notificationInfo(v60, v77, v78);
    objc_msgSend_setShouldBadge_(v79, v80, shouldBadge);

    uint64_t v83 = objc_msgSend_notification(v6, v81, v82);
    uint64_t shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(v83, v84, v85);
    long long v89 = objc_msgSend_notificationInfo(v60, v87, v88);
    objc_msgSend_setShouldSendContentAvailable_(v89, v90, shouldSendContentAvailable);

    long long v93 = objc_msgSend_notification(v6, v91, v92);
    uint64_t shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(v93, v94, v95);
    v99 = objc_msgSend_notificationInfo(v60, v97, v98);
    objc_msgSend_setShouldSendMutableContent_(v99, v100, shouldSendMutableContent);

    v103 = objc_msgSend_notification(v6, v101, v102);
    v106 = objc_msgSend_collapseIdKey(v103, v104, v105);
    uint64_t v109 = objc_msgSend_notificationInfo(v60, v107, v108);
    objc_msgSend_setCollapseIDKey_(v109, v110, (uint64_t)v106);

    uint64_t v113 = objc_msgSend_notification(v6, v111, v112);
    v116 = objc_msgSend_additionalFields(v113, v114, v115);
    uint64_t v119 = objc_msgSend_notificationInfo(v60, v117, v118);
    objc_msgSend_setDesiredKeys_(v119, v120, (uint64_t)v116);

    id v123 = objc_msgSend_notification(v6, v121, v122);
    LODWORD(v116) = objc_msgSend_hasAlert(v123, v124, v125);

    if (v116)
    {
      id v128 = objc_msgSend_notification(v6, v126, v127);
      id v131 = objc_msgSend_alert(v128, v129, v130);
      long long v134 = objc_msgSend_text(v131, v132, v133);
      long long v137 = objc_msgSend_notificationInfo(v60, v135, v136);
      objc_msgSend_setAlertBody_(v137, v138, (uint64_t)v134);

      long long v141 = objc_msgSend_notification(v6, v139, v140);
      long long v144 = objc_msgSend_alert(v141, v142, v143);
      uint64_t v147 = objc_msgSend_localizedKey(v144, v145, v146);
      uint64_t v150 = objc_msgSend_notificationInfo(v60, v148, v149);
      objc_msgSend_setAlertLocalizationKey_(v150, v151, (uint64_t)v147);

      v154 = objc_msgSend_notification(v6, v152, v153);
      uint64_t v157 = objc_msgSend_alert(v154, v155, v156);
      uint64_t v160 = objc_msgSend_localizedArguments(v157, v158, v159);
      uint64_t v163 = objc_msgSend_notificationInfo(v60, v161, v162);
      objc_msgSend_setAlertLocalizationArgs_(v163, v164, (uint64_t)v160);

      uint64_t v167 = objc_msgSend_notification(v6, v165, v166);
      v170 = objc_msgSend_alert(v167, v168, v169);
      v173 = objc_msgSend_title(v170, v171, v172);
      uint64_t v176 = objc_msgSend_notificationInfo(v60, v174, v175);
      objc_msgSend_setTitle_(v176, v177, (uint64_t)v173);

      uint64_t v180 = objc_msgSend_notification(v6, v178, v179);
      uint64_t v183 = objc_msgSend_alert(v180, v181, v182);
      v186 = objc_msgSend_titleLocalizedKey(v183, v184, v185);
      uint64_t v189 = objc_msgSend_notificationInfo(v60, v187, v188);
      objc_msgSend_setTitleLocalizationKey_(v189, v190, (uint64_t)v186);

      v193 = objc_msgSend_notification(v6, v191, v192);
      v196 = objc_msgSend_alert(v193, v194, v195);
      uint64_t v199 = objc_msgSend_titleLocalizedArguments(v196, v197, v198);
      uint64_t v202 = objc_msgSend_notificationInfo(v60, v200, v201);
      objc_msgSend_setTitleLocalizationArgs_(v202, v203, (uint64_t)v199);

      uint64_t v206 = objc_msgSend_notification(v6, v204, v205);
      v209 = objc_msgSend_alert(v206, v207, v208);
      uint64_t v212 = objc_msgSend_subtitle(v209, v210, v211);
      v215 = objc_msgSend_notificationInfo(v60, v213, v214);
      objc_msgSend_setSubtitle_(v215, v216, (uint64_t)v212);

      uint64_t v219 = objc_msgSend_notification(v6, v217, v218);
      uint64_t v222 = objc_msgSend_alert(v219, v220, v221);
      uint64_t v225 = objc_msgSend_subtitleLocalizedKey(v222, v223, v224);
      id v228 = objc_msgSend_notificationInfo(v60, v226, v227);
      objc_msgSend_setSubtitleLocalizationKey_(v228, v229, (uint64_t)v225);

      v232 = objc_msgSend_notification(v6, v230, v231);
      v235 = objc_msgSend_alert(v232, v233, v234);
      v238 = objc_msgSend_subtitleLocalizedArguments(v235, v236, v237);
      uint64_t v241 = objc_msgSend_notificationInfo(v60, v239, v240);
      objc_msgSend_setSubtitleLocalizationArgs_(v241, v242, (uint64_t)v238);

      uint64_t v245 = objc_msgSend_notification(v6, v243, v244);
      uint64_t v248 = objc_msgSend_alert(v245, v246, v247);
      uint64_t v251 = objc_msgSend_actionLocKey(v248, v249, v250);
      v254 = objc_msgSend_notificationInfo(v60, v252, v253);
      objc_msgSend_setAlertActionLocalizationKey_(v254, v255, (uint64_t)v251);

      uint64_t v258 = objc_msgSend_notification(v6, v256, v257);
      uint64_t v261 = objc_msgSend_alert(v258, v259, v260);
      v264 = objc_msgSend_launchImage(v261, v262, v263);
      uint64_t v267 = objc_msgSend_notificationInfo(v60, v265, v266);
      objc_msgSend_setAlertLaunchImage_(v267, v268, (uint64_t)v264);

      uint64_t v271 = objc_msgSend_notification(v6, v269, v270);
      v274 = objc_msgSend_alert(v271, v272, v273);
      v277 = objc_msgSend_soundName(v274, v275, v276);
      uint64_t v280 = objc_msgSend_notificationInfo(v60, v278, v279);
      objc_msgSend_setSoundName_(v280, v281, (uint64_t)v277);

      v284 = objc_msgSend_notification(v6, v282, v283);
      v287 = objc_msgSend_alert(v284, v285, v286);
      v290 = objc_msgSend_category(v287, v288, v289);
      v293 = objc_msgSend_notificationInfo(v60, v291, v292);
      objc_msgSend_setCategory_(v293, v294, (uint64_t)v290);
    }
  }
  id v22 = v60;
LABEL_58:

  return v22;
}

- (id)pSubscriptionFromSubscription:(id)a3 error:(id *)a4
{
  uint64_t v326 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  BOOL v10 = objc_msgSend_subscriptionID(v6, v8, v9);
  id v13 = objc_msgSend_CKDPIdentifier_Subscription(v10, v11, v12);
  objc_msgSend_setIdentifier_(v7, v14, (uint64_t)v13);

  if (objc_msgSend_subscriptionType(v6, v15, v16) == 1)
  {
    id v19 = v6;
    id v22 = objc_msgSend_zoneID(v19, v20, v21);

    if (v22)
    {
      unsigned int v25 = objc_msgSend_zoneID(v19, v23, v24);
      BOOL v27 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v26, (uint64_t)v25);
      objc_msgSend_setZoneIdentifier_(v7, v28, (uint64_t)v27);
    }
    uint64_t v29 = objc_msgSend_predicate(v19, v23, v24);
    id v324 = 0;
    id v31 = objc_msgSend_CKDPQueryFiltersWithTranslator_error_(v29, v30, (uint64_t)self, &v324);
    id v32 = v324;

    if (!v31 && v32)
    {
      if (!a4)
      {
LABEL_8:

        id v33 = 0;
        goto LABEL_43;
      }
LABEL_7:
      id v32 = v32;
      *a4 = v32;
      goto LABEL_8;
    }
    uint64_t v45 = CKVerifyFilters(v31);

    if (v45)
    {
      id v32 = (id)v45;
      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    long long v322 = 0u;
    long long v323 = 0u;
    long long v320 = 0u;
    long long v321 = 0u;
    id v51 = v31;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v57, (uint64_t)&v320, v325, 16);
    if (v58)
    {
      uint64_t v60 = v58;
      uint64_t v61 = *(void *)v321;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v321 != v61) {
            objc_enumerationMutation(v51);
          }
          objc_msgSend_addFilters_(v7, v59, *(void *)(*((void *)&v320 + 1) + 8 * i), (void)v320);
        }
        uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v59, (uint64_t)&v320, v325, 16);
      }
      while (v60);
    }

    uint64_t v63 = objc_opt_new();
    id v66 = objc_msgSend_recordType(v19, v64, v65);
    objc_msgSend_setName_(v63, v67, (uint64_t)v66);

    objc_msgSend_addRecordTypes_(v7, v68, (uint64_t)v63);
    unint64_t SubscriptionOptions = objc_msgSend_querySubscriptionOptions(v19, v69, v70);
    char v72 = SubscriptionOptions;
    objc_msgSend_setFireOnce_(v7, v73, (SubscriptionOptions >> 3) & 1);
    if (v72)
    {
      objc_msgSend_addMutationTriggers_(v7, v74, 1);
      if ((v72 & 2) == 0)
      {
LABEL_29:
        if ((v72 & 4) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:
        objc_msgSend_addMutationTriggers_(v7, v74, 3, (void)v320);
        goto LABEL_31;
      }
    }
    else if ((v72 & 2) == 0)
    {
      goto LABEL_29;
    }
    objc_msgSend_addMutationTriggers_(v7, v74, 2, (void)v320);
    if ((v72 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (objc_msgSend_subscriptionType(v6, v17, v18) == 2)
  {
    id v19 = v6;
    uint64_t v38 = objc_msgSend_zoneID(v19, v36, v37);

    if (v38)
    {
      uint64_t v41 = objc_msgSend_zoneID(v19, v39, v40);
      long long v43 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v42, (uint64_t)v41);
      objc_msgSend_setZoneIdentifier_(v7, v44, (uint64_t)v43);
    }
    objc_msgSend_recordType(v19, v39, v40);
    goto LABEL_18;
  }
  if (objc_msgSend_subscriptionType(v6, v34, v35) == 3)
  {
    id v19 = v6;
    objc_msgSend_recordType(v19, v48, v49);
    uint64_t v50 = LABEL_18:;

    if (!v50)
    {
LABEL_33:

      goto LABEL_34;
    }
    id v51 = (id)objc_opt_new();
    uint64_t v54 = objc_msgSend_recordType(v19, v52, v53);
    objc_msgSend_setName_(v51, v55, (uint64_t)v54);

    objc_msgSend_addRecordTypes_(v7, v56, (uint64_t)v51);
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:
  uint64_t v75 = objc_msgSend_subscriptionType(v6, v46, v47, (void)v320);
  if (v75 == 3) {
    unsigned int v77 = 3;
  }
  else {
    unsigned int v77 = 1;
  }
  if (v75 == 2) {
    objc_msgSend_setEvaluationType_(v7, v76, 2);
  }
  else {
    objc_msgSend_setEvaluationType_(v7, v76, v77);
  }
  uint64_t v80 = objc_msgSend_notificationInfo(v6, v78, v79);

  if (v80)
  {
    uint64_t v81 = objc_opt_new();
    objc_msgSend_setNotification_(v7, v82, (uint64_t)v81);

    uint64_t v83 = (void *)MEMORY[0x1E4F1CA48];
    long long v86 = objc_msgSend_notificationInfo(v6, v84, v85);
    long long v89 = objc_msgSend_desiredKeys(v86, v87, v88);
    long long v91 = objc_msgSend_arrayWithArray_(v83, v90, (uint64_t)v89);
    uint64_t v94 = objc_msgSend_notification(v7, v92, v93);
    objc_msgSend_setAdditionalFields_(v94, v95, (uint64_t)v91);

    uint64_t v98 = objc_msgSend_notificationInfo(v6, v96, v97);
    uint64_t shouldBadge = objc_msgSend_shouldBadge(v98, v99, v100);
    uint64_t v104 = objc_msgSend_notification(v7, v102, v103);
    objc_msgSend_setShouldBadge_(v104, v105, shouldBadge);

    uint64_t v108 = objc_msgSend_notificationInfo(v6, v106, v107);
    uint64_t shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(v108, v109, v110);
    uint64_t v114 = objc_msgSend_notification(v7, v112, v113);
    objc_msgSend_setShouldSendContentAvailable_(v114, v115, shouldSendContentAvailable);

    uint64_t v118 = objc_msgSend_notificationInfo(v6, v116, v117);
    uint64_t shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(v118, v119, v120);
    v124 = objc_msgSend_notification(v7, v122, v123);
    objc_msgSend_setShouldSendMutableContent_(v124, v125, shouldSendMutableContent);

    id v128 = objc_msgSend_notificationInfo(v6, v126, v127);
    id v131 = objc_msgSend_collapseIDKey(v128, v129, v130);
    long long v134 = objc_msgSend_notification(v7, v132, v133);
    objc_msgSend_setCollapseIdKey_(v134, v135, (uint64_t)v131);

    uint64_t v136 = objc_opt_new();
    long long v139 = objc_msgSend_notification(v7, v137, v138);
    objc_msgSend_setAlert_(v139, v140, (uint64_t)v136);

    uint64_t v143 = objc_msgSend_notificationInfo(v6, v141, v142);
    uint64_t v146 = objc_msgSend_alertBody(v143, v144, v145);
    uint64_t v149 = objc_msgSend_notification(v7, v147, v148);
    v152 = objc_msgSend_alert(v149, v150, v151);
    objc_msgSend_setText_(v152, v153, (uint64_t)v146);

    uint64_t v156 = objc_msgSend_notificationInfo(v6, v154, v155);
    uint64_t v159 = objc_msgSend_alertLocalizationKey(v156, v157, v158);
    uint64_t v162 = objc_msgSend_notification(v7, v160, v161);
    uint64_t v165 = objc_msgSend_alert(v162, v163, v164);
    objc_msgSend_setLocalizedKey_(v165, v166, (uint64_t)v159);

    uint64_t v167 = (void *)MEMORY[0x1E4F1CA48];
    v170 = objc_msgSend_notificationInfo(v6, v168, v169);
    v173 = objc_msgSend_alertLocalizationArgs(v170, v171, v172);
    uint64_t v175 = objc_msgSend_arrayWithArray_(v167, v174, (uint64_t)v173);
    v178 = objc_msgSend_notification(v7, v176, v177);
    uint64_t v181 = objc_msgSend_alert(v178, v179, v180);
    objc_msgSend_setLocalizedArguments_(v181, v182, (uint64_t)v175);

    uint64_t v185 = objc_msgSend_notificationInfo(v6, v183, v184);
    uint64_t v188 = objc_msgSend_title(v185, v186, v187);
    v191 = objc_msgSend_notification(v7, v189, v190);
    uint64_t v194 = objc_msgSend_alert(v191, v192, v193);
    objc_msgSend_setTitle_(v194, v195, (uint64_t)v188);

    uint64_t v198 = objc_msgSend_notificationInfo(v6, v196, v197);
    uint64_t v201 = objc_msgSend_titleLocalizationKey(v198, v199, v200);
    v204 = objc_msgSend_notification(v7, v202, v203);
    v207 = objc_msgSend_alert(v204, v205, v206);
    objc_msgSend_setTitleLocalizedKey_(v207, v208, (uint64_t)v201);

    v209 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v212 = objc_msgSend_notificationInfo(v6, v210, v211);
    v215 = objc_msgSend_titleLocalizationArgs(v212, v213, v214);
    uint64_t v217 = objc_msgSend_arrayWithArray_(v209, v216, (uint64_t)v215);
    v220 = objc_msgSend_notification(v7, v218, v219);
    uint64_t v223 = objc_msgSend_alert(v220, v221, v222);
    objc_msgSend_setTitleLocalizedArguments_(v223, v224, (uint64_t)v217);

    uint64_t v227 = objc_msgSend_notificationInfo(v6, v225, v226);
    uint64_t v230 = objc_msgSend_subtitle(v227, v228, v229);
    uint64_t v233 = objc_msgSend_notification(v7, v231, v232);
    v236 = objc_msgSend_alert(v233, v234, v235);
    objc_msgSend_setSubtitle_(v236, v237, (uint64_t)v230);

    uint64_t v240 = objc_msgSend_notificationInfo(v6, v238, v239);
    uint64_t v243 = objc_msgSend_subtitleLocalizationKey(v240, v241, v242);
    uint64_t v246 = objc_msgSend_notification(v7, v244, v245);
    char v249 = objc_msgSend_alert(v246, v247, v248);
    objc_msgSend_setSubtitleLocalizedKey_(v249, v250, (uint64_t)v243);

    uint64_t v251 = (void *)MEMORY[0x1E4F1CA48];
    v254 = objc_msgSend_notificationInfo(v6, v252, v253);
    uint64_t v257 = objc_msgSend_subtitleLocalizationArgs(v254, v255, v256);
    uint64_t v259 = objc_msgSend_arrayWithArray_(v251, v258, (uint64_t)v257);
    uint64_t v262 = objc_msgSend_notification(v7, v260, v261);
    uint64_t v265 = objc_msgSend_alert(v262, v263, v264);
    objc_msgSend_setSubtitleLocalizedArguments_(v265, v266, (uint64_t)v259);

    v269 = objc_msgSend_notificationInfo(v6, v267, v268);
    v272 = objc_msgSend_alertActionLocalizationKey(v269, v270, v271);
    uint64_t v275 = objc_msgSend_notification(v7, v273, v274);
    uint64_t v278 = objc_msgSend_alert(v275, v276, v277);
    objc_msgSend_setActionLocKey_(v278, v279, (uint64_t)v272);

    v282 = objc_msgSend_notificationInfo(v6, v280, v281);
    uint64_t v285 = objc_msgSend_alertLaunchImage(v282, v283, v284);
    uint64_t v288 = objc_msgSend_notification(v7, v286, v287);
    uint64_t v291 = objc_msgSend_alert(v288, v289, v290);
    objc_msgSend_setLaunchImage_(v291, v292, (uint64_t)v285);

    uint64_t v295 = objc_msgSend_notificationInfo(v6, v293, v294);
    v298 = objc_msgSend_soundName(v295, v296, v297);
    v301 = objc_msgSend_notification(v7, v299, v300);
    v304 = objc_msgSend_alert(v301, v302, v303);
    objc_msgSend_setSoundName_(v304, v305, (uint64_t)v298);

    uint64_t v308 = objc_msgSend_notificationInfo(v6, v306, v307);
    uint64_t v311 = objc_msgSend_category(v308, v309, v310);
    uint64_t v314 = objc_msgSend_notification(v7, v312, v313);
    uint64_t v317 = objc_msgSend_alert(v314, v315, v316);
    objc_msgSend_setCategory_(v317, v318, (uint64_t)v311);
  }
  id v33 = v7;
LABEL_43:

  return v33;
}

- (id)recordZoneFromPRecordZone:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordZoneFromPRecordZone_asAnonymousCKUserID_databaseScope_error_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (id)recordZoneFromPRecordZone:(id)a3 asAnonymousCKUserID:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6
{
  *(void *)&v265[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v13 = objc_msgSend_defaultRecordZone(MEMORY[0x1E4F1A310], v11, v12);
  uint64_t v16 = objc_msgSend_copy(v13, v14, v15);

  id v19 = objc_msgSend_zoneIdentifier(v9, v17, v18);
  id v22 = objc_msgSend_value(v19, v20, v21);
  unsigned int v25 = objc_msgSend_name(v22, v23, v24);

  if (!_CKCheckArgument()) {
    goto LABEL_72;
  }
  BOOL v28 = objc_msgSend_zoneIdentifier(v9, v26, v27);
  id v261 = 0;
  uint64_t v30 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v29, (uint64_t)v28, v10, &v261);
  id v31 = v261;
  objc_msgSend_setZoneID_(v16, v32, (uint64_t)v30);

  uint64_t v35 = objc_msgSend_zoneID(v16, v33, v34);

  if (!v35)
  {
    if (a6)
    {
      id v31 = v31;
      id v130 = 0;
      *a6 = v31;
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  if (objc_msgSend_hasProtectionInfo(v9, v36, v37))
  {
    uint64_t v40 = objc_msgSend_protectionInfo(v9, v38, v39);
    long long v43 = objc_msgSend_protectionInfo(v40, v41, v42);
    uint64_t v46 = objc_msgSend_length(v43, v44, v45);

    if (v46)
    {
      uint64_t v47 = objc_msgSend_protectionInfo(v9, v38, v39);
      uint64_t v50 = objc_msgSend_protectionInfo(v47, v48, v49);
      objc_msgSend_setProtectionData_(v16, v51, (uint64_t)v50);

      uint64_t v54 = objc_msgSend_protectionInfo(v9, v52, v53);
      uint64_t v57 = objc_msgSend_protectionInfoTag(v54, v55, v56);
      objc_msgSend_setProtectionEtag_(v16, v58, (uint64_t)v57);

      if (objc_msgSend_hasZoneProtectionInfoKeysToRemove(v9, v59, v60))
      {
        uint64_t v61 = objc_msgSend_zoneProtectionInfoKeysToRemove(v9, v38, v39);
        uint64_t v63 = objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(self, v62, (uint64_t)v61);
        objc_msgSend_setZonePCSKeysToRemove_(v16, v64, (uint64_t)v63);
      }
    }
  }
  if (objc_msgSend_hasRecordProtectionInfo(v9, v38, v39))
  {
    uint64_t v67 = objc_msgSend_recordProtectionInfo(v9, v65, v66);
    uint64_t v70 = objc_msgSend_protectionInfo(v67, v68, v69);
    uint64_t v73 = objc_msgSend_length(v70, v71, v72);

    if (v73)
    {
      long long v74 = objc_msgSend_recordProtectionInfo(v9, v65, v66);
      unsigned int v77 = objc_msgSend_protectionInfo(v74, v75, v76);
      objc_msgSend_setZoneishProtectionData_(v16, v78, (uint64_t)v77);

      if (objc_msgSend_hasRecordProtectionInfoKeysToRemove(v9, v79, v80))
      {
        uint64_t v81 = objc_msgSend_recordProtectionInfoKeysToRemove(v9, v65, v66);
        uint64_t v83 = objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(self, v82, (uint64_t)v81);
        objc_msgSend_setZoneishPCSKeysToRemove_(v16, v84, (uint64_t)v83);
      }
    }
  }
  if (objc_msgSend_hasSignedCryptoRequirements(v9, v65, v66))
  {
    uint64_t v87 = objc_msgSend_signedCryptoRequirements(v9, v85, v86);
    uint64_t v90 = objc_msgSend_serializedRequirements(v87, v88, v89);
    uint64_t v258 = v25;
    if (v90)
    {
      uint64_t v93 = (void *)v90;
      id v257 = v10;
      uint64_t v94 = objc_msgSend_signedCryptoRequirements(v9, v91, v92);
      uint64_t v97 = objc_msgSend_signature(v94, v95, v96);
      if (v97)
      {
        uint64_t v100 = (void *)v97;
        objc_msgSend_signedCryptoRequirements(v9, v98, v99);
        uint64_t v101 = v256 = a6;
        int v104 = objc_msgSend_version(v101, v102, v103);

        a6 = v256;
        id v10 = v257;
        if (v104)
        {
          uint64_t v107 = objc_msgSend_signedCryptoRequirements(v9, v105, v106);
          int v110 = objc_msgSend_version(v107, v108, v109);
          v111 = (unsigned int *)MEMORY[0x1E4F1A660];
          int v112 = *MEMORY[0x1E4F1A660];

          if (v110 > v112)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v115 = v256;
            v116 = (void *)*MEMORY[0x1E4F1A528];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
            {
              uint64_t v223 = v116;
              uint64_t v226 = objc_msgSend_zoneID(v16, v224, v225);
              uint64_t v229 = objc_msgSend_signedCryptoRequirements(v9, v227, v228);
              int v232 = objc_msgSend_version(v229, v230, v231);
              unsigned int v233 = *v111;
              *(_DWORD *)long long buf = 138543874;
              uint64_t v263 = v226;
              __int16 v264 = 1024;
              *(_DWORD *)uint64_t v265 = v232;
              v265[2] = 1024;
              *(_DWORD *)&v265[3] = v233;
              _os_log_error_impl(&dword_1C4CFF000, v223, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Unsupported signed requirements version: %d. The current OS supports versions up to %d.", buf, 0x18u);

              uint64_t v115 = v256;
              if (!v256) {
                goto LABEL_31;
              }
              goto LABEL_20;
            }
            if (v256)
            {
LABEL_20:
              uint64_t v119 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v120 = *MEMORY[0x1E4F19DD8];
              objc_msgSend_zoneID(v16, v117, v118);
              uint64_t v122 = v121 = v115;
              uint64_t v125 = objc_msgSend_signedCryptoRequirements(v9, v123, v124);
              uint64_t v128 = objc_msgSend_version(v125, v126, v127);
              objc_msgSend_errorWithDomain_code_format_(v119, v129, v120, 5021, @"Failed to parse required features for zone with ID %@. Version %d is required; the current OS only supports versions up to %d.",
                v122,
                v128,
                *v111);
              id *v121 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
            }
LABEL_31:
            id v130 = 0;
LABEL_32:
            unsigned int v25 = v258;
            goto LABEL_74;
          }
          uint64_t v138 = objc_msgSend_pcsManager(self, v113, v114);
          long long v141 = objc_msgSend_signedCryptoRequirements(v9, v139, v140);
          long long v144 = objc_msgSend_signature(v141, v142, v143);
          uint64_t v147 = objc_msgSend_signedCryptoRequirements(v9, v145, v146);
          uint64_t v150 = objc_msgSend_serializedRequirements(v147, v148, v149);
          id v260 = v31;
          int v255 = objc_msgSend_validateFullPublicKeySignature_forSignedData_error_(v138, v151, (uint64_t)v144, v150, &v260);
          id v152 = v260;

          if (v255 && !v152)
          {
            uint64_t v153 = [CKDPZoneCryptoFeatureRequirements alloc];
            uint64_t v156 = objc_msgSend_signedCryptoRequirements(v9, v154, v155);
            uint64_t v159 = objc_msgSend_serializedRequirements(v156, v157, v158);
            uint64_t v161 = objc_msgSend_initWithData_(v153, v160, (uint64_t)v159);

            id v10 = v257;
            if (v161)
            {
              unsigned int v25 = v258;
              if (objc_msgSend_hasMinimumSchemaVersion(v161, v162, v163))
              {
                int v166 = objc_msgSend_minimumSchemaVersion(v161, v164, v165);
                uint64_t v167 = (unsigned int *)MEMORY[0x1E4F1A5A0];
                if (v166 > *MEMORY[0x1E4F1A5A0])
                {
                  if (*MEMORY[0x1E4F1A550] != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  v168 = (void *)*MEMORY[0x1E4F1A500];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v246 = v168;
                    char v249 = objc_msgSend_zoneID(v16, v247, v248);
                    int v252 = objc_msgSend_minimumSchemaVersion(v161, v250, v251);
                    unsigned int v253 = *v167;
                    *(_DWORD *)long long buf = 138543874;
                    uint64_t v263 = v249;
                    __int16 v264 = 1024;
                    *(_DWORD *)uint64_t v265 = v252;
                    v265[2] = 1024;
                    *(_DWORD *)&v265[3] = v253;
                    _os_log_error_impl(&dword_1C4CFF000, v246, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Unsupported minimum schema version: %d. The current OS supports schema versions up to %d.", buf, 0x18u);

                    unsigned int v25 = v258;
                  }
                  if (!v256) {
                    goto LABEL_71;
                  }
                  uint64_t v171 = (void *)MEMORY[0x1E4F1A280];
                  uint64_t v172 = *MEMORY[0x1E4F19DD8];
                  v173 = objc_msgSend_zoneID(v16, v169, v170);
                  uint64_t v254 = objc_msgSend_minimumSchemaVersion(v161, v174, v175);
                  objc_msgSend_errorWithDomain_code_format_(v171, v176, v172, 5021, @"Failed to parse required features for zone with ID %@. Schema version %d or higher is required; the current OS only supports schema versions up to %d.",
                    v173,
                    v254,
                    *v167);
                  goto LABEL_70;
                }
              }
              if (objc_msgSend_hasRequiredAdopterFeatures(v161, v164, v165))
              {
                uint64_t v190 = objc_msgSend_requiredAdopterFeatures(v161, v188, v189);

                if (v190)
                {
                  uint64_t v193 = objc_msgSend_requiredAdopterFeatures(v161, v191, v192);
                  uint64_t v195 = objc_msgSend_requiredFeatureSetFromPAdopterFeatureSet_(self, v194, (uint64_t)v193);

                  objc_msgSend_setRequiredFeatures_(v16, v196, (uint64_t)v195);
                  objc_msgSend_setOriginalRequiredFeatures_(v16, v197, (uint64_t)v195);

                  unsigned int v25 = v258;
                  id v31 = 0;
                  goto LABEL_55;
                }
              }
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v216 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                uint64_t v242 = v216;
                uint64_t v245 = objc_msgSend_zoneID(v16, v243, v244);
                *(_DWORD *)long long buf = 138543362;
                uint64_t v263 = v245;
                _os_log_error_impl(&dword_1C4CFF000, v242, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: The required features are missing.", buf, 0xCu);

                unsigned int v25 = v258;
                if (!v256) {
                  goto LABEL_71;
                }
                goto LABEL_69;
              }
              if (v256)
              {
LABEL_69:
                uint64_t v219 = (void *)MEMORY[0x1E4F1A280];
                uint64_t v220 = *MEMORY[0x1E4F19DD8];
                v173 = objc_msgSend_zoneID(v16, v217, v218);
                objc_msgSend_errorWithDomain_code_format_(v219, v221, v220, 1005, @"Failed to parse required features for zone with ID %@. The required features are missing.", v173);
                goto LABEL_70;
              }
LABEL_71:

LABEL_72:
              id v31 = 0;
LABEL_73:
              id v130 = 0;
              goto LABEL_74;
            }
            unsigned int v25 = v258;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v210 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v238 = v210;
              uint64_t v241 = objc_msgSend_zoneID(v16, v239, v240);
              *(_DWORD *)long long buf = 138543362;
              uint64_t v263 = v241;
              _os_log_error_impl(&dword_1C4CFF000, v238, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Failed to parse the required features from the signed blob.", buf, 0xCu);

              unsigned int v25 = v258;
              if (!v256) {
                goto LABEL_71;
              }
            }
            else if (!v256)
            {
              goto LABEL_71;
            }
            uint64_t v213 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v214 = *MEMORY[0x1E4F19DD8];
            v173 = objc_msgSend_zoneID(v16, v211, v212);
            objc_msgSend_errorWithDomain_code_format_(v213, v215, v214, 1005, @"Failed to parse the required features for zone with ID %@.", v173);
LABEL_70:
            id *v256 = (id)objc_claimAutoreleasedReturnValue();

            unsigned int v25 = v258;
            goto LABEL_71;
          }
          id v10 = v257;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v177 = (void *)*MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
          {
            uint64_t v234 = v177;
            uint64_t v237 = objc_msgSend_zoneID(v16, v235, v236);
            *(_DWORD *)long long buf = 138543618;
            uint64_t v263 = v237;
            __int16 v264 = 2112;
            *(void *)uint64_t v265 = v152;
            _os_log_error_impl(&dword_1C4CFF000, v234, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Signature validation failed: %@", buf, 0x16u);

            if (!v256) {
              goto LABEL_49;
            }
          }
          else if (!v256)
          {
LABEL_49:
            id v130 = 0;
            id v31 = v152;
            goto LABEL_32;
          }
          uint64_t v180 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v181 = *MEMORY[0x1E4F19DD8];
          uint64_t v182 = objc_msgSend_zoneID(v16, v178, v179);
          objc_msgSend_errorWithDomain_code_error_format_(v180, v183, v181, 5022, v152, @"Failed to validate the cryptographic signature of the required features for zone with ID %@.", v182);
          id *v256 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_49;
        }
LABEL_25:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v131 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          uint64_t v184 = v131;
          uint64_t v187 = objc_msgSend_zoneID(v16, v185, v186);
          *(_DWORD *)long long buf = 138543362;
          uint64_t v263 = v187;
          _os_log_error_impl(&dword_1C4CFF000, v184, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Requirements, signature or version is missing.", buf, 0xCu);

          if (!a6) {
            goto LABEL_31;
          }
        }
        else if (!a6)
        {
          goto LABEL_31;
        }
        long long v134 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v135 = *MEMORY[0x1E4F19DD8];
        objc_msgSend_zoneID(v16, v132, v133);
        uint64_t v122 = v136 = a6;
        objc_msgSend_errorWithDomain_code_format_(v134, v137, v135, 1000, @"Failed to parse required features for zone with ID %@. Missing attributes.", v122);
        id *v136 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }

      id v10 = v257;
    }

    goto LABEL_25;
  }
LABEL_55:
  if (objc_msgSend_hasShareId(v9, v85, v86))
  {
    uint64_t v200 = objc_msgSend_shareId(v9, v198, v199);
    id v259 = v31;
    uint64_t v202 = objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, v201, (uint64_t)v200, v10, &v259);
    id v203 = v259;

    if (v202)
    {
      id v204 = objc_alloc(MEMORY[0x1E4F1A348]);
      uint64_t v206 = objc_msgSend_initWithRecordID_action_(v204, v205, (uint64_t)v202, 0);
      objc_msgSend_setShare_(v16, v207, (uint64_t)v206);
    }
    id v31 = v203;
  }
  uint64_t v208 = objc_msgSend_protectionInfoKeysToRemoves(v9, v198, v199);
  objc_msgSend_setInvitedKeysToRemove_(v16, v209, (uint64_t)v208);

  id v130 = v16;
LABEL_74:

  return v130;
}

- (id)pRecordZoneFromRecordZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_zoneID(v4, v6, v7);
  id v10 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v9, (uint64_t)v8);
  objc_msgSend_setZoneIdentifier_(v5, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_protectionData(v4, v12, v13);

  uint64_t v17 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (v14)
  {
    uint64_t v18 = objc_opt_new();
    objc_msgSend_setProtectionInfo_(v5, v19, (uint64_t)v18);

    id v22 = objc_msgSend_protectionData(v4, v20, v21);
    unsigned int v25 = objc_msgSend_protectionInfo(v5, v23, v24);
    objc_msgSend_setProtectionInfo_(v25, v26, (uint64_t)v22);

    uint64_t v29 = objc_msgSend_protectionEtag(v4, v27, v28);
    id v32 = objc_msgSend_protectionInfo(v5, v30, v31);
    objc_msgSend_setProtectionInfoTag_(v32, v33, (uint64_t)v29);

    if (*v17)
    {
      if (objc_msgSend_applyPCSKeysToRemoveForTesting(v4, v15, v16))
      {
        uint64_t v34 = objc_msgSend_zonePCSKeysToRemove(v4, v15, v16);

        if (v34)
        {
          uint64_t v35 = objc_msgSend_protectionEtag(v4, v15, v16);
          uint64_t v38 = objc_msgSend_zonePCSKeysToRemove(v4, v36, v37);
          objc_msgSend_setEtag_(v38, v39, (uint64_t)v35);

          uint64_t v42 = objc_msgSend_zonePCSKeysToRemove(v4, v40, v41);
          long long v44 = objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(self, v43, (uint64_t)v42);
          objc_msgSend_setZoneProtectionInfoKeysToRemove_(v5, v45, (uint64_t)v44);
        }
      }
    }
  }
  uint64_t v46 = objc_msgSend_zoneishProtectionData(v4, v15, v16);

  if (v46)
  {
    uint64_t v49 = objc_opt_new();
    objc_msgSend_setRecordProtectionInfo_(v5, v50, (uint64_t)v49);

    uint64_t v53 = objc_msgSend_zoneishProtectionData(v4, v51, v52);
    uint64_t v56 = objc_msgSend_recordProtectionInfo(v5, v54, v55);
    objc_msgSend_setProtectionInfo_(v56, v57, (uint64_t)v53);

    if (*v17)
    {
      if (objc_msgSend_applyPCSKeysToRemoveForTesting(v4, v47, v48))
      {
        uint64_t v58 = objc_msgSend_zoneishPCSKeysToRemove(v4, v47, v48);

        if (v58)
        {
          uint64_t v59 = objc_msgSend_zoneishProtectionData(v4, v47, v48);
          uint64_t v61 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v60, (uint64_t)v59);
          id v64 = objc_msgSend_zoneishPCSKeysToRemove(v4, v62, v63);
          objc_msgSend_setEtag_(v64, v65, (uint64_t)v61);

          id v68 = objc_msgSend_zoneishPCSKeysToRemove(v4, v66, v67);
          uint64_t v70 = objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(self, v69, (uint64_t)v68);
          objc_msgSend_setRecordProtectionInfoKeysToRemove_(v5, v71, (uint64_t)v70);
        }
      }
    }
  }
  if (objc_msgSend_hasUpdatedExpirationTimeInterval(v4, v47, v48))
  {
    uint64_t v72 = objc_opt_new();
    objc_msgSend_setStorageExpiration_(v5, v73, (uint64_t)v72);

    uint64_t v76 = objc_msgSend_updatedExpirationTimeInterval(v4, v74, v75);

    uint64_t v79 = objc_msgSend_storageExpiration(v5, v77, v78);
    uint64_t v81 = v79;
    if (v76)
    {
      objc_msgSend_setOperationType_(v79, v80, 2);

      uint64_t v81 = objc_msgSend_updatedExpirationTimeInterval(v4, v82, v83);
      uint64_t v86 = objc_msgSend_unsignedLongLongValue(v81, v84, v85);
      uint64_t v89 = objc_msgSend_storageExpiration(v5, v87, v88);
      objc_msgSend_setDuration_(v89, v90, v86);
    }
    else
    {
      objc_msgSend_setOperationType_(v79, v80, 1);
    }
  }
  return v5;
}

- (unint64_t)capabilitiesFromPZoneCapabilities:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_atomicSaves(v3, v4, v5)) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | objc_msgSend_fetchChanges(v3, v6, v7);
  if (objc_msgSend_hierarchicalSharing(v3, v10, v11)) {
    unint64_t v14 = v9 | 4;
  }
  else {
    unint64_t v14 = v9;
  }
  int v15 = objc_msgSend_zoneSharing(v3, v12, v13);

  if (v15) {
    return v14 | 8;
  }
  else {
    return v14;
  }
}

- (id)featureSetFromPAdopterFeatureSet:(id)a3 ofFeatureClass:(Class)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v33, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = [a4 alloc];
        uint64_t v17 = objc_msgSend_key(v13, v15, v16, (void)v29);
        uint64_t v20 = objc_msgSend_value(v13, v18, v19);
        id v22 = objc_msgSend_initWithName_value_(v14, v21, (uint64_t)v17, v20);
        objc_msgSend_addObject_(v6, v23, (uint64_t)v22);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v29, v33, 16);
    }
    while (v10);
  }

  id v25 = objc_alloc(MEMORY[0x1E4F1A020]);
  uint64_t v27 = objc_msgSend_initWithFeatures_(v25, v26, (uint64_t)v6);

  return v27;
}

- (id)pAdopterFeatureSetFromFeatureSet:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = objc_msgSend_features(v3, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = objc_opt_new();
        uint64_t v17 = objc_msgSend_name(v13, v15, v16);
        objc_msgSend_setKey_(v14, v18, (uint64_t)v17);

        uint64_t v21 = objc_msgSend_value(v13, v19, v20);
        objc_msgSend_setValue_(v14, v22, (uint64_t)v21);

        objc_msgSend_addObject_(v4, v23, (uint64_t)v14);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v26, v30, 16);
    }
    while (v10);
  }

  return v4;
}

- (id)pAdopterFeatureSetFromRequiredFeatures:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_fieldFeatures(v4, v6, v7);
  uint64_t v10 = objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v9, (uint64_t)v8);
  uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
  objc_msgSend_setFieldFeatures_(v5, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend_recordFeatures(v4, v15, v16);
  uint64_t v19 = objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v18, (uint64_t)v17);
  id v22 = objc_msgSend_mutableCopy(v19, v20, v21);
  objc_msgSend_setRecordFeatures_(v5, v23, (uint64_t)v22);

  long long v26 = objc_msgSend_zoneFeatures(v4, v24, v25);

  long long v28 = objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v27, (uint64_t)v26);
  uint64_t v31 = objc_msgSend_mutableCopy(v28, v29, v30);
  objc_msgSend_setZoneFeatures_(v5, v32, (uint64_t)v31);

  return v5;
}

- (id)requiredFeatureSetFromPAdopterFeatureSet:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fieldFeatures(v4, v5, v6);
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v9, (uint64_t)v7, v8);

  uint64_t v13 = objc_msgSend_recordFeatures(v4, v11, v12);
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v15, (uint64_t)v13, v14);

  uint64_t v19 = objc_msgSend_zoneFeatures(v4, v17, v18);

  uint64_t v20 = objc_opt_class();
  id v22 = objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v21, (uint64_t)v19, v20);

  id v23 = objc_alloc(MEMORY[0x1E4F1A358]);
  long long v26 = objc_msgSend_features(v22, v24, v25);
  long long v29 = objc_msgSend_features(v16, v27, v28);
  long long v32 = objc_msgSend_features(v10, v30, v31);
  uint64_t v34 = objc_msgSend_initWithZoneFeatures_recordFeatures_fieldFeatures_(v23, v33, (uint64_t)v26, v29, v32);

  return v34;
}

- (id)pZoneCryptoFeatureRequirmentsFromZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_requiredFeatures(v4, v6, v7);
  uint64_t v10 = objc_msgSend_pAdopterFeatureSetFromRequiredFeatures_(self, v9, (uint64_t)v8);
  objc_msgSend_setRequiredAdopterFeatures_(v5, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_zoneID(v4, v12, v13);

  uint64_t v16 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v15, (uint64_t)v14);
  objc_msgSend_setZoneIdentifier_(v5, v17, (uint64_t)v16);

  objc_msgSend_setMinimumSchemaVersion_(v5, v18, *MEMORY[0x1E4F1A5A8]);
  return v5;
}

- (void)addCapability:(id)a3 to:(id)a4
{
  id v19 = a4;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_name(v5, v6, v7);
  uint64_t v10 = objc_msgSend_objectForKey_(v19, v9, (uint64_t)v8);

  if (!v10) {
    uint64_t v10 = objc_opt_new();
  }
  uint64_t v13 = objc_msgSend_value(v5, v11, v12);
  objc_msgSend_addObject_(v10, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend_name(v5, v15, v16);

  objc_msgSend_setObject_forKey_(v19, v18, (uint64_t)v10, v17);
}

- (id)pCapabilitiesFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C5009E68;
  v8[3] = &unk_1E64F7AE8;
  id v5 = v4;
  id v9 = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v6, (uint64_t)v8);

  return v5;
}

- (id)_capabilitiesFromPCapabilities:(id)a3 level:(int)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_1C5009FF4;
  id v19 = &unk_1E64F8820;
  id v20 = v6;
  int v21 = a4;
  id v7 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v8, (uint64_t)&v16);

  id v9 = (void *)MEMORY[0x1E4F19F58];
  uint64_t v12 = objc_msgSend_copy(v7, v10, v11, v16, v17, v18, v19);
  uint64_t v14 = objc_msgSend_pruneAndSort_(v9, v13, (uint64_t)v12);

  return v14;
}

- (id)deviceCapabilitySetFromPDeviceCapabilitySet:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_fieldLevelCapabilities(v4, v5, v6);
  id v9 = objc_msgSend__capabilitiesFromPCapabilities_level_(self, v8, (uint64_t)v7, 3);

  uint64_t v12 = objc_msgSend_recordLevelCapabilities(v4, v10, v11);
  uint64_t v14 = objc_msgSend__capabilitiesFromPCapabilities_level_(self, v13, (uint64_t)v12, 2);

  uint64_t v17 = objc_msgSend_zoneLevelCapabilities(v4, v15, v16);

  id v19 = objc_msgSend__capabilitiesFromPCapabilities_level_(self, v18, (uint64_t)v17, 1);

  id v20 = objc_opt_new();
  objc_msgSend_addObjectsFromArray_(v20, v21, (uint64_t)v9);
  objc_msgSend_addObjectsFromArray_(v20, v22, (uint64_t)v14);
  objc_msgSend_addObjectsFromArray_(v20, v23, (uint64_t)v19);

  return v20;
}

- (id)pDeviceCapabilitiesFromDeviceCapabilitySet:(id)a3 withDeviceID:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setVersion_(v8, v9, 1);
  uint64_t v12 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v10, v11);
  uint64_t v14 = objc_msgSend_pDateFromDate_(self, v13, (uint64_t)v12);
  objc_msgSend_setTime_(v8, v15, (uint64_t)v14);

  uint64_t v18 = objc_msgSend_containerScopedUserID(self, v16, v17);
  int v21 = objc_msgSend_CKDPIdentifier_User(v18, v19, v20);
  objc_msgSend_setUserIdentifier_(v8, v22, (uint64_t)v21);

  uint64_t v58 = v7;
  uint64_t v25 = objc_msgSend_CKDPIdentifier_Device(v7, v23, v24);
  objc_msgSend_setDeviceIdentifier_(v8, v26, (uint64_t)v25);

  uint64_t v59 = v6;
  if (v6)
  {
    uint64_t v28 = objc_msgSend_pruneAndSort_(MEMORY[0x1E4F19F58], v27, (uint64_t)v6);
  }
  else
  {
    uint64_t v28 = objc_opt_new();
  }
  long long v29 = (void *)v28;
  uint64_t v30 = objc_opt_new();
  uint64_t v31 = objc_opt_new();
  long long v32 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v33 = v29;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v60, v64, 16);
  if (v35)
  {
    uint64_t v38 = v35;
    uint64_t v39 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v61 != v39) {
          objc_enumerationMutation(v33);
        }
        uint64_t v41 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        int v42 = objc_msgSend_level(v41, v36, v37);
        long long v43 = v30;
        if (v42 == 1) {
          goto LABEL_14;
        }
        if (v42 == 3)
        {
          long long v43 = v32;
LABEL_14:
          objc_msgSend_addCapability_to_(self, v36, (uint64_t)v41, v43);
          continue;
        }
        long long v43 = v31;
        if (v42 == 2) {
          goto LABEL_14;
        }
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v60, v64, 16);
    }
    while (v38);
  }

  if (objc_msgSend_count(v30, v44, v45))
  {
    uint64_t v48 = objc_msgSend_pCapabilitiesFrom_(self, v46, (uint64_t)v30);
    objc_msgSend_setZoneLevelCapabilities_(v8, v49, (uint64_t)v48);
  }
  if (objc_msgSend_count(v31, v46, v47))
  {
    uint64_t v52 = objc_msgSend_pCapabilitiesFrom_(self, v50, (uint64_t)v31);
    objc_msgSend_setRecordLevelCapabilities_(v8, v53, (uint64_t)v52);
  }
  if (objc_msgSend_count(v32, v50, v51))
  {
    uint64_t v55 = objc_msgSend_pCapabilitiesFrom_(self, v54, (uint64_t)v32);
    objc_msgSend_setFieldLevelCapabilities_(v8, v56, (uint64_t)v55);
  }
  return v8;
}

- (id)pSignedVersionedBlobFrom:(id)a3 signature:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  objc_msgSend_setVersion_(v7, v8, 1);
  objc_msgSend_setSerializedObject_(v7, v9, (uint64_t)v6);

  objc_msgSend_setSignature_(v7, v10, (uint64_t)v5);
  return v7;
}

- (id)pZoneUsageFromZoneID:(id)a3 at:(id)a4 withDeviceID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  objc_msgSend_setVersion_(v11, v12, 1);
  uint64_t v14 = objc_msgSend_pDateFromDate_(self, v13, (uint64_t)v9);

  objc_msgSend_setTime_(v11, v15, (uint64_t)v14);
  uint64_t v18 = objc_msgSend_CKDPIdentifier_Device(v8, v16, v17);

  objc_msgSend_setDeviceIdentifier_(v11, v19, (uint64_t)v18);
  id v22 = objc_msgSend_containerScopedUserID(self, v20, v21);
  uint64_t v25 = objc_msgSend_CKDPIdentifier_User(v22, v23, v24);
  objc_msgSend_setUserIdentifier_(v11, v26, (uint64_t)v25);

  uint64_t v28 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v27, (uint64_t)v10);

  objc_msgSend_setZoneIdentifier_(v11, v29, (uint64_t)v28);
  return v11;
}

- (id)pShareUsageFromShareRecordID:(id)a3 at:(id)a4 withDeviceID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  objc_msgSend_setVersion_(v11, v12, 1);
  uint64_t v14 = objc_msgSend_pDateFromDate_(self, v13, (uint64_t)v9);

  objc_msgSend_setTime_(v11, v15, (uint64_t)v14);
  uint64_t v18 = objc_msgSend_CKDPIdentifier_Device(v8, v16, v17);

  objc_msgSend_setDeviceIdentifier_(v11, v19, (uint64_t)v18);
  id v22 = objc_msgSend_containerScopedUserID(self, v20, v21);
  uint64_t v25 = objc_msgSend_CKDPIdentifier_User(v22, v23, v24);
  objc_msgSend_setUserIdentifier_(v11, v26, (uint64_t)v25);

  uint64_t v28 = objc_msgSend_pShareIdentifierFromRecordID_(self, v27, (uint64_t)v10);

  objc_msgSend_setShareIdentifier_(v11, v29, (uint64_t)v28);
  return v11;
}

- (id)containerPrivacySettingsFromPContainerPrivacySettings:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_applicationContainer(v3, v4, v5);
  if (objc_msgSend_applicationContainerEnvironment(v3, v7, v8) == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v12 = objc_msgSend_initWithContainerIdentifier_environment_(v10, v11, (uint64_t)v6, v9);
  int v15 = objc_msgSend_userPrivacySettings(v3, v13, v14);
  unsigned int v18 = objc_msgSend_discoverable(v15, v16, v17);

  uint64_t v21 = objc_msgSend_applicationBundles(v3, v19, v20);

  if (v21)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_msgSend_applicationBundles(v3, v22, v23);
    uint64_t v21 = objc_msgSend_setWithArray_(v24, v26, (uint64_t)v25);
  }
  long long v27 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v22, (uint64_t)&unk_1F20AB928);
  int isEqual = objc_msgSend_isEqual_(v21, v28, (uint64_t)v27);

  if (isEqual)
  {
    uint64_t v31 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v30, (uint64_t)v6);

    uint64_t v21 = (void *)v31;
  }
  long long v32 = [CKDContainerPrivacySettings alloc];
  uint64_t v34 = objc_msgSend_initWithContainerID_applicationBundleIDs_discoverable_(v32, v33, (uint64_t)v12, v21, v18);

  return v34;
}

- (id)shareFromPShare:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)shareFromPShare:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((objc_msgSend_hasShareId(v8, v10, v11) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v174 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v214 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1C4CFF000, v174, OS_LOG_TYPE_DEBUG, "Share has no share ID: %@", buf, 0xCu);
    }
    id v173 = 0;
    goto LABEL_88;
  }
  uint64_t v14 = objc_msgSend_shareId(v8, v12, v13);
  uint64_t v16 = objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, v15, (uint64_t)v14, v9, a5);

  if (!v16)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v175 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v185 = v175;
      uint64_t v188 = objc_msgSend_shareId(v8, v186, v187);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v214 = (uint64_t)v188;
      _os_log_debug_impl(&dword_1C4CFF000, v185, OS_LOG_TYPE_DEBUG, "Couldn't create a record ID from share ID %{public}@", buf, 0xCu);
    }
    id v173 = 0;
    goto LABEL_87;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F1A390]);
  inited = objc_msgSend_initInternalWithShareRecordID_(v17, v18, (uint64_t)v16);
  if (!inited)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v179 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v214 = (uint64_t)v16;
      _os_log_debug_impl(&dword_1C4CFF000, v179, OS_LOG_TYPE_DEBUG, "Couldn't create a share with ID %{public}@. Giving up.", buf, 0xCu);
    }
    id v173 = 0;
    goto LABEL_86;
  }
  if (objc_msgSend_hasEtag(v8, v19, v20))
  {
    uint64_t v23 = objc_msgSend_etag(v8, v21, v22);
    objc_msgSend_setEtag_(inited, v24, (uint64_t)v23);
  }
  uint64_t v26 = objc_msgSend_publicAccess(v8, v21, v22) - 1;
  if (v26 < 4) {
    uint64_t v27 = v26 + 1;
  }
  else {
    uint64_t v27 = 0;
  }
  objc_msgSend__setPublicPermissionNoSideEffects_(inited, v25, v27);
  uint64_t v30 = objc_msgSend_invitedKeyToRemoves(v8, v28, v29);
  objc_msgSend_setInvitedKeysToRemove_(inited, v31, (uint64_t)v30);

  if (objc_msgSend_hasPublisherModelType(v8, v32, v33))
  {
    unsigned int v36 = objc_msgSend_publisherModelType(v8, v34, v35) - 1;
    if (v36 <= 3) {
      objc_msgSend_setParticipantVisibility_(inited, v34, qword_1C50808D0[v36]);
    }
  }
  v191 = a5;
  if (objc_msgSend_hasParticipantSelfRemovalBehavior(v8, v34, v35))
  {
    uint64_t v39 = objc_msgSend_participantSelfRemovalBehavior(v8, v37, v38) - 1;
    if (v39 <= 2) {
      objc_msgSend_setParticipantSelfRemovalBehavior_(inited, v37, v39 + 1);
    }
  }
  uint64_t v40 = objc_msgSend_anonymousPublicAccess(v8, v37, v38);
  objc_msgSend_setAllowsAnonymousPublicAccess_(inited, v41, v40);
  id v42 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v45 = objc_msgSend_participants(v8, v43, v44);
  uint64_t v48 = objc_msgSend_count(v45, v46, v47);
  v196 = objc_msgSend_initWithCapacity_(v42, v49, v48);

  objc_msgSend_resetFetchedParticipants(inited, v50, v51);
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  uint64_t v192 = v8;
  objc_msgSend_participants(v8, v52, v53);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v207, v219, 16);
  if (v194)
  {
    uint64_t v193 = *(void *)v208;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v208 != v193) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = *(void *)(*((void *)&v207 + 1) + 8 * v56);
        id v206 = 0;
        uint64_t v58 = objc_msgSend_shareParticipantFromPParticipant_shareID_error_(self, v55, v57, v16, &v206);
        id v61 = v206;
        if (!v58)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v176 = v191;
          id v8 = v192;
          uint64_t v177 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412802;
            uint64_t v214 = v57;
            __int16 v215 = 2114;
            uint64_t v216 = v16;
            __int16 v217 = 2112;
            id v218 = v61;
            _os_log_debug_impl(&dword_1C4CFF000, v177, OS_LOG_TYPE_DEBUG, "Failed to convert participant %@ for share %{public}@: %@", buf, 0x20u);
            if (!v191) {
              goto LABEL_84;
            }
          }
          else if (!v191)
          {
            goto LABEL_84;
          }
          id v178 = v61;
          id v61 = v178;
          goto LABEL_77;
        }
        long long v62 = self;
        long long v63 = v16;
        if (objc_msgSend_role(v58, v59, v60) == 4)
        {
          uint64_t v66 = objc_msgSend_publicPermission(inited, v64, v65);
          objc_msgSend_setPermission_(v58, v67, v66);
        }
        id v68 = objc_msgSend_userIdentity(v58, v64, v65);
        long long v71 = objc_msgSend_userRecordID(v68, v69, v70);
        long long v74 = objc_msgSend_recordName(v71, v72, v73);
        id v75 = v9;
        int isEqualToString = objc_msgSend_isEqualToString_(v9, v76, (uint64_t)v74);

        if (isEqualToString) {
          objc_msgSend_setIsCurrentUser_(v58, v78, 1);
        }
        objc_msgSend_addObject_(v196, v78, (uint64_t)v58);
        objc_msgSend_registerFetchedParticipant_(inited, v79, (uint64_t)v58);

        ++v56;
        id v9 = v75;
        uint64_t v16 = v63;
        self = v62;
      }
      while (v194 != v56);
      uint64_t v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v207, v219, 16);
    }
    while (v194);
  }
  id v189 = v9;

  objc_msgSend_setAllParticipants_(inited, v80, (uint64_t)v196);
  id v81 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v8 = v192;
  id v84 = objc_msgSend_requestingAccess(v192, v82, v83);
  uint64_t v87 = objc_msgSend_requestingAccessUsersCount(v84, v85, v86);
  obuint64_t j = (id)objc_msgSend_initWithCapacity_(v81, v88, v87);

  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v91 = objc_msgSend_requestingAccess(v192, v89, v90);
  objc_msgSend_requestingAccessUsers(v91, v92, v93);
  id v61 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v94, (uint64_t)&v202, v212, 16);
  if (!v95) {
    goto LABEL_35;
  }
  uint64_t v97 = v95;
  uint64_t v98 = *(void *)v203;
  do
  {
    for (uint64_t i = 0; i != v97; ++i)
    {
      if (*(void *)v203 != v98) {
        objc_enumerationMutation(v61);
      }
      uint64_t v100 = *(void *)(*((void *)&v202 + 1) + 8 * i);
      uint64_t v101 = objc_msgSend_shareRequesterFromPRequester_(self, v96, v100, v189);
      if (!v101)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v9 = v189;
        uint64_t v176 = v191;
        uint64_t v180 = *MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          if (v191) {
            goto LABEL_76;
          }
LABEL_84:
          id v173 = 0;
          goto LABEL_85;
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v214 = v100;
        __int16 v215 = 2114;
        uint64_t v216 = v16;
        _os_log_debug_impl(&dword_1C4CFF000, v180, OS_LOG_TYPE_DEBUG, "Failed to convert requester %@ for share %{public}@", buf, 0x16u);
        if (!v191) {
          goto LABEL_84;
        }
LABEL_76:
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v181, *MEMORY[0x1E4F19DD8], 1005, @"Unable to parse requester");
        id v178 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:
        id v173 = 0;
        *uint64_t v176 = v178;
        goto LABEL_85;
      }
      uint64_t v103 = (void *)v101;
      objc_msgSend_addObject_(obj, v102, v101);
    }
    uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v96, (uint64_t)&v202, v212, 16);
  }
  while (v97);
LABEL_35:

  objc_msgSend_setRequesters_(inited, v104, (uint64_t)obj);
  id v105 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v108 = objc_msgSend_blockedRequestingAccess(v192, v106, v107);
  uint64_t v111 = objc_msgSend_blockedUsersCount(v108, v109, v110);
  id v61 = (id)objc_msgSend_initWithCapacity_(v105, v112, v111);

  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  uint64_t v115 = objc_msgSend_blockedRequestingAccess(v192, v113, v114);
  uint64_t v118 = objc_msgSend_blockedUsers(v115, v116, v117);

  uint64_t v119 = v118;
  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v120, (uint64_t)&v198, v211, 16);
  if (!v121) {
    goto LABEL_43;
  }
  uint64_t v123 = v121;
  uint64_t v124 = *(void *)v199;
  while (2)
  {
    uint64_t v125 = 0;
    while (2)
    {
      if (*(void *)v199 != v124) {
        objc_enumerationMutation(v119);
      }
      uint64_t v126 = *(void *)(*((void *)&v198 + 1) + 8 * v125);
      uint64_t v127 = objc_msgSend_blockedIdentityFromPBlockedUser_(self, v122, v126, v189);
      if (!v127)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v9 = v189;
        uint64_t v182 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v214 = v126;
          __int16 v215 = 2114;
          uint64_t v216 = v16;
          _os_log_debug_impl(&dword_1C4CFF000, v182, OS_LOG_TYPE_DEBUG, "Failed to convert blocked identity %@ for share %{public}@", buf, 0x16u);
          if (!v191) {
            goto LABEL_83;
          }
        }
        else if (!v191)
        {
LABEL_83:

          goto LABEL_84;
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v183, *MEMORY[0x1E4F19DD8], 1005, @"Unable to parse blocked user");
        id *v191 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_83;
      }
      id v129 = (void *)v127;
      objc_msgSend_addObject_(v61, v128, v127);

      if (v123 != ++v125) {
        continue;
      }
      break;
    }
    uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v198, v211, 16);
    if (v123) {
      continue;
    }
    break;
  }
LABEL_43:

  objc_msgSend_setBlockedIdentities_(inited, v130, (uint64_t)v61);
  int v133 = objc_msgSend_denyAccessRequests(v192, v131, v132);
  objc_msgSend_setAccessRequestsEnabled_(inited, v134, v133 ^ 1u);
  if (objc_msgSend_hasShortTokenRoutingKey(v192, v135, v136))
  {
    long long v139 = objc_msgSend_shortTokenRoutingKey(v192, v137, v138);
    objc_msgSend_setRoutingKey_(inited, v140, (uint64_t)v139);
  }
  if (objc_msgSend_hasDisplayedHostname(v192, v137, v138, v189))
  {
    uint64_t v143 = objc_msgSend_displayedHostname(v192, v141, v142);
    objc_msgSend_setDisplayedHostname_(inited, v144, (uint64_t)v143);
  }
  if (objc_msgSend_hasInvitedPcs(v192, v141, v142))
  {
    uint64_t v147 = objc_msgSend_invitedPcs(v192, v145, v146);
    uint64_t v150 = objc_msgSend_protectionInfo(v147, v148, v149);
    objc_msgSend_setInvitedProtectionData_(inited, v151, (uint64_t)v150);

    v154 = objc_msgSend_invitedPcs(v192, v152, v153);
    uint64_t v157 = objc_msgSend_protectionInfoTag(v154, v155, v156);
    objc_msgSend_setInvitedProtectionEtag_(inited, v158, (uint64_t)v157);
  }
  if (objc_msgSend_hasSelfAddedPcs(v192, v145, v146))
  {
    uint64_t v161 = objc_msgSend_selfAddedPcs(v192, v159, v160);
    uint64_t v164 = objc_msgSend_protectionInfo(v161, v162, v163);
    objc_msgSend_setPublicProtectionData_(inited, v165, (uint64_t)v164);

    v168 = objc_msgSend_selfAddedPcs(v192, v166, v167);
    uint64_t v171 = objc_msgSend_protectionInfoTag(v168, v169, v170);
    objc_msgSend_setPublicProtectionEtag_(inited, v172, (uint64_t)v171);
  }
  id v173 = inited;
  id v9 = v190;
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_88:
  return v173;
}

- (id)pShareFromShare:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  id v10 = objc_msgSend_recordID(v6, v8, v9);
  uint64_t v12 = objc_msgSend_pShareIdentifierFromRecordID_(self, v11, (uint64_t)v10);
  objc_msgSend_setShareId_(v7, v13, (uint64_t)v12);

  uint64_t v16 = objc_msgSend_etag(v6, v14, v15);
  uint64_t v145 = v7;
  objc_msgSend_setEtag_(v7, v17, (uint64_t)v16);

  uint64_t v146 = objc_opt_new();
  uint64_t v20 = objc_msgSend_removedParticipants(v6, v18, v19);
  uint64_t v22 = objc_msgSend_valueForKey_(v20, v21, @"participantID");

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v144 = v6;
  uint64_t v25 = objc_msgSend_allParticipants(v6, v23, v24);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v155, v161, 16);
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v156 != v30) {
          objc_enumerationMutation(v25);
        }
        long long v32 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        uint64_t v33 = objc_msgSend_pParticipantFromShareParticipant_forCache_(self, v28, (uint64_t)v32, v4);
        unsigned int v36 = objc_msgSend_participantID(v32, v34, v35);
        int v38 = objc_msgSend_containsObject_(v22, v37, (uint64_t)v36);

        if (v38) {
          objc_msgSend_setState_(v33, v39, 3);
        }
        objc_msgSend_addObject_(v146, v39, (uint64_t)v33);
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v155, v161, 16);
    }
    while (v29);
  }

  objc_msgSend_setParticipants_(v145, v40, (uint64_t)v146);
  int v43 = objc_msgSend_accessRequestsEnabled(v144, v41, v42);
  objc_msgSend_setDenyAccessRequests_(v145, v44, v43 ^ 1u);
  uint64_t v45 = objc_opt_new();
  uint64_t v48 = objc_msgSend_requesters(v144, v46, v47);
  uint64_t v51 = objc_msgSend_approvedRequesters(v144, v49, v50);
  uint64_t v53 = objc_msgSend_arrayByAddingObjectsFromArray_(v48, v52, (uint64_t)v51);

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v54 = v53;
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v151, v160, 16);
  if (v56)
  {
    uint64_t v58 = v56;
    uint64_t v59 = *(void *)v152;
    do
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v152 != v59) {
          objc_enumerationMutation(v54);
        }
        long long v62 = objc_msgSend_pRequesterFromShareRequester_(self, v57, *(void *)(*((void *)&v151 + 1) + 8 * j));
        if (v62) {
          objc_msgSend_addObject_(v45, v61, (uint64_t)v62);
        }
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v151, v160, 16);
    }
    while (v58);
  }

  long long v63 = objc_opt_new();
  objc_msgSend_setRequestingAccess_(v145, v64, (uint64_t)v63);

  uint64_t v67 = objc_msgSend_requestingAccess(v145, v65, v66);
  objc_msgSend_setRequestingAccessUsers_(v67, v68, (uint64_t)v45);

  uint64_t v69 = objc_opt_new();
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  uint64_t v72 = objc_msgSend_blockedIdentities(v144, v70, v71);
  uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v147, v159, 16);
  if (v74)
  {
    uint64_t v76 = v74;
    uint64_t v77 = *(void *)v148;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v148 != v77) {
          objc_enumerationMutation(v72);
        }
        uint64_t v80 = objc_msgSend_pBlockedUserFromShareBlockedIdentity_(self, v75, *(void *)(*((void *)&v147 + 1) + 8 * k));
        if (v80) {
          objc_msgSend_addObject_(v69, v79, (uint64_t)v80);
        }
      }
      uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v147, v159, 16);
    }
    while (v76);
  }

  id v81 = objc_opt_new();
  objc_msgSend_setBlockedRequestingAccess_(v145, v82, (uint64_t)v81);

  uint64_t v85 = objc_msgSend_blockedRequestingAccess(v145, v83, v84);
  objc_msgSend_setBlockedUsers_(v85, v86, (uint64_t)v69);

  objc_msgSend_publicPermission(v144, v87, v88);
  uint64_t v89 = sub_1C4E94F90();
  objc_msgSend_setPublicAccess_(v145, v90, v89);
  uint64_t v93 = objc_msgSend_participantVisibility(v144, v91, v92);
  uint64_t v95 = 1;
  switch(v93)
  {
    case 0:
      goto LABEL_33;
    case 1:
      if (objc_msgSend_publicPermission(v144, v94, 1) == 1) {
        objc_msgSend_setPublisherModelType_(v145, v94, 2);
      }
      break;
    case 2:
      objc_msgSend_setPublisherModelType_(v145, v94, 3);
      break;
    case 3:
      uint64_t v95 = 4;
LABEL_33:
      objc_msgSend_setPublisherModelType_(v145, v94, v95);
      break;
    default:
      break;
  }
  uint64_t v96 = objc_msgSend_participantSelfRemovalBehavior(v144, v94, v95);
  if ((unint64_t)(v96 - 1) <= 2) {
    objc_msgSend_setParticipantSelfRemovalBehavior_(v145, v97, v96);
  }
  uint64_t v99 = objc_msgSend_allowsAnonymousPublicAccess(v144, v97, v98);
  objc_msgSend_setAnonymousPublicAccess_(v145, v100, v99);
  uint64_t v103 = objc_msgSend_displayedHostname(v144, v101, v102);
  objc_msgSend_setDisplayedHostname_(v145, v104, (uint64_t)v103);

  uint64_t v107 = objc_msgSend_invitedProtectionData(v144, v105, v106);

  if (v107)
  {
    uint64_t v110 = objc_opt_new();
    objc_msgSend_setInvitedPcs_(v145, v111, (uint64_t)v110);

    uint64_t v114 = objc_msgSend_invitedProtectionData(v144, v112, v113);
    uint64_t v117 = objc_msgSend_invitedPcs(v145, v115, v116);
    objc_msgSend_setProtectionInfo_(v117, v118, (uint64_t)v114);

    uint64_t v121 = objc_msgSend_invitedProtectionEtag(v144, v119, v120);
    uint64_t v124 = objc_msgSend_invitedPcs(v145, v122, v123);
    objc_msgSend_setProtectionInfoTag_(v124, v125, (uint64_t)v121);
  }
  uint64_t v126 = objc_msgSend_publicProtectionData(v144, v108, v109);

  if (v126)
  {
    uint64_t v127 = objc_opt_new();
    objc_msgSend_setSelfAddedPcs_(v145, v128, (uint64_t)v127);

    id v131 = objc_msgSend_publicProtectionData(v144, v129, v130);
    long long v134 = objc_msgSend_selfAddedPcs(v145, v132, v133);
    objc_msgSend_setProtectionInfo_(v134, v135, (uint64_t)v131);

    uint64_t v138 = objc_msgSend_publicProtectionEtag(v144, v136, v137);
    long long v141 = objc_msgSend_selfAddedPcs(v145, v139, v140);
    objc_msgSend_setProtectionInfoTag_(v141, v142, (uint64_t)v138);
  }
  return v145;
}

- (id)shareParticipantFromPParticipant:(id)a3 shareID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(MEMORY[0x1E4F1A480]);
  inited = objc_msgSend_initInternal(v10, v11, v12);
  uint64_t v16 = objc_msgSend_userId(v8, v14, v15);
  int hasName = objc_msgSend_hasName(v16, v17, v18);

  if (hasName)
  {
    uint64_t v22 = objc_msgSend_userId(v8, v20, v21);
    uint64_t v25 = objc_msgSend_name(v22, v23, v24);
    uint64_t v27 = objc_msgSend_recordIDFromPUserName_error_(self, v26, (uint64_t)v25, a5);

    if (!v27)
    {
      uint64_t v120 = 0;
      goto LABEL_57;
    }
    objc_msgSend_setUserRecordID_(inited, v28, (uint64_t)v27);
  }
  else
  {
    uint64_t v27 = 0;
  }
  if (objc_msgSend_hasContactInformation(v8, v20, v21))
  {
    uint64_t v31 = objc_msgSend_contactInformation(v8, v29, v30);
    int hasEmailAddress = objc_msgSend_hasEmailAddress(v31, v32, v33);

    if (hasEmailAddress)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F1A488]);
      uint64_t v40 = objc_msgSend_contactInformation(v8, v38, v39);
      int v43 = objc_msgSend_emailAddress(v40, v41, v42);
      uint64_t v45 = objc_msgSend_initWithEmailAddress_(v37, v44, (uint64_t)v43);
      objc_msgSend_setLookupInfo_(inited, v46, (uint64_t)v45);
    }
    uint64_t v47 = objc_msgSend_contactInformation(v8, v35, v36);
    int hasPhoneNumber = objc_msgSend_hasPhoneNumber(v47, v48, v49);

    if (hasPhoneNumber)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F1A488]);
      uint64_t v56 = objc_msgSend_contactInformation(v8, v54, v55);
      uint64_t v59 = objc_msgSend_phoneNumber(v56, v57, v58);
      id v61 = objc_msgSend_initWithPhoneNumber_(v53, v60, (uint64_t)v59);
      objc_msgSend_setLookupInfo_(inited, v62, (uint64_t)v61);
    }
    long long v63 = objc_msgSend_contactInformation(v8, v51, v52);
    int hasContainerScopedUserId = objc_msgSend_hasContainerScopedUserId(v63, v64, v65);

    if (hasContainerScopedUserId)
    {
      id v69 = objc_alloc(MEMORY[0x1E4F1A488]);
      uint64_t v72 = objc_msgSend_contactInformation(v8, v70, v71);
      id v75 = objc_msgSend_containerScopedUserId(v72, v73, v74);
      uint64_t v77 = objc_msgSend_recordIDFromPUserName_error_(self, v76, (uint64_t)v75, 0);
      uint64_t v79 = objc_msgSend_initWithUserRecordID_(v69, v78, (uint64_t)v77);
      objc_msgSend_setLookupInfo_(inited, v80, (uint64_t)v79);
    }
    id v81 = objc_msgSend_contactInformation(v8, v67, v68);
    uint64_t v84 = objc_msgSend_firstName(v81, v82, v83);
    uint64_t v87 = objc_msgSend_nameComponents(inited, v85, v86);
    objc_msgSend_setGivenName_(v87, v88, (uint64_t)v84);

    long long v91 = objc_msgSend_contactInformation(v8, v89, v90);
    uint64_t v94 = objc_msgSend_lastName(v91, v92, v93);
    uint64_t v97 = objc_msgSend_nameComponents(inited, v95, v96);
    objc_msgSend_setFamilyName_(v97, v98, (uint64_t)v94);
  }
  if (objc_msgSend_hasOutOfNetworkPrivateKey(v8, v29, v30))
  {
    uint64_t v101 = objc_msgSend_outOfNetworkPrivateKey(v8, v99, v100);
    objc_msgSend_setOutOfNetworkPrivateKey_(inited, v102, (uint64_t)v101);
  }
  if (objc_msgSend_hasPublicKey(v8, v99, v100))
  {
    id v105 = objc_msgSend_publicKey(v8, v103, v104);
    uint64_t v108 = objc_msgSend_protectionInfo(v105, v106, v107);
    objc_msgSend_setPublicSharingKey_(inited, v109, (uint64_t)v108);
  }
  int v110 = objc_msgSend_publicKeyVersion(v8, v103, v104);
  objc_msgSend_setPublicKeyVersion_(inited, v111, v110);
  if (objc_msgSend_hasIsInNetwork(v8, v112, v113))
  {
    uint64_t v116 = objc_msgSend_isInNetwork(v8, v114, v115);
    objc_msgSend_setHasiCloudAccount_(inited, v117, v116);
  }
  else if (objc_msgSend_hasOutOfNetworkKeyType(v8, v114, v115))
  {
    objc_msgSend_setHasiCloudAccount_(inited, v118, 0);
  }
  else
  {
    uint64_t v121 = objc_msgSend_hasOutOfNetworkPrivateKey(v8, v118, v119) ^ 1;
    objc_msgSend_setHasiCloudAccount_(inited, v122, v121);
  }
  id v123 = objc_alloc(MEMORY[0x1E4F1A3B0]);
  uint64_t v120 = objc_msgSend_initInternalWithUserIdentity_(v123, v124, (uint64_t)inited);
  uint64_t v127 = objc_msgSend_participantId(v8, v125, v126);
  uint64_t v130 = objc_msgSend_name(v127, v128, v129);
  objc_msgSend_setParticipantID_(v120, v131, (uint64_t)v130);

  objc_msgSend_setShareID_(v120, v132, (uint64_t)v9);
  if (objc_msgSend_hasInviterId(v8, v133, v134))
  {
    uint64_t v137 = objc_msgSend_inviterId(v8, v135, v136);
    uint64_t v140 = objc_msgSend_name(v137, v138, v139);
    objc_msgSend_setInviterID_(v120, v141, (uint64_t)v140);
  }
  if (objc_msgSend_hasParticipantType(v8, v135, v136)
    && (uint64_t v144 = objc_msgSend_participantType(v8, v142, v143) - 1, v144 <= 3))
  {
    objc_msgSend_setRole_(v120, v142, v144 + 1);
  }
  else
  {
    objc_msgSend_setRole_(v120, v142, 0);
  }
  if (objc_msgSend_hasState(v8, v145, v146))
  {
    uint64_t v150 = objc_msgSend_state(v8, v147, v148) - 2;
    BOOL v151 = v150 >= 3;
    uint64_t v152 = v150 + 2;
    if (v151) {
      objc_msgSend_setAcceptanceStatus_(v120, v149, 1);
    }
    else {
      objc_msgSend_setAcceptanceStatus_(v120, v149, v152);
    }
  }
  else
  {
    uint64_t v155 = 2 * (objc_msgSend_role(v120, v147, v148) == 1);
    objc_msgSend_setAcceptanceStatus_(v120, v156, v155);
  }
  uint64_t v158 = objc_msgSend_permission(v8, v153, v154) - 1;
  if (v158 < 4) {
    objc_msgSend_setPermission_(v120, v157, v158 + 1);
  }
  else {
    objc_msgSend_setPermission_(v120, v157, 0);
  }
  uint64_t v161 = objc_msgSend_recordName(v27, v159, v160);
  char isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v162, (uint64_t)v161);

  if (isDefaultUserNameFromServer) {
    goto LABEL_40;
  }
  int v166 = objc_msgSend_userIdentity(v120, v164, v165);
  uint64_t v169 = objc_msgSend_userRecordID(v166, v167, v168);
  uint64_t v172 = objc_msgSend_recordName(v169, v170, v171);
  char isEqualToString = objc_msgSend_isEqualToString_(v172, v173, *MEMORY[0x1E4F19C08]);

  if (isEqualToString) {
    goto LABEL_40;
  }
  uint64_t v176 = objc_msgSend_identityDelegate(self, v164, v175);
  uint64_t v179 = objc_msgSend_publicKey(v8, v177, v178);
  uint64_t v182 = objc_msgSend_protectionInfo(v179, v180, v181);
  int v184 = objc_msgSend_sharingFingerprintsContainPublicKeyWithData_error_(v176, v183, (uint64_t)v182, 0);

  if (v184) {
LABEL_40:
  }
    objc_msgSend_setIsCurrentUser_(v120, v164, 1);
  uint64_t v186 = objc_msgSend_userIdentity(v120, v164, v185);
  id v189 = objc_msgSend_userRecordID(v186, v187, v188);
  uint64_t v192 = objc_msgSend_recordName(v189, v190, v191);
  uint64_t v195 = objc_msgSend_orgAdminUserID(self, v193, v194);
  char v197 = objc_msgSend_isEqualToString_(v192, v196, (uint64_t)v195);

  if ((v197 & 1) != 0 || objc_msgSend_isOrgUser(v8, v198, v199)) {
    objc_msgSend_setIsOrgAdminUser_(v120, v198, 1);
  }
  long long v201 = objc_msgSend_protectionInfo(v8, v198, v200);
  long long v204 = objc_msgSend_protectionInfo(v201, v202, v203);
  uint64_t v207 = objc_msgSend_length(v204, v205, v206);

  if (v207)
  {
    long long v210 = objc_msgSend_protectionInfo(v8, v208, v209);
    uint64_t v213 = objc_msgSend_protectionInfo(v210, v211, v212);
    objc_msgSend_setProtectionInfo_(v120, v214, (uint64_t)v213);
  }
  __int16 v215 = objc_msgSend_protectionInfoPublicKey(v8, v208, v209);
  uint64_t v218 = objc_msgSend_length(v215, v216, v217);

  if (v218)
  {
    uint64_t v221 = objc_msgSend_protectionInfoPublicKey(v8, v219, v220);
    objc_msgSend_setProtectionInfoPublicKey_(v120, v222, (uint64_t)v221);
  }
  if (objc_msgSend_hasKeyHealth(v8, v219, v220))
  {
    uint64_t v226 = objc_msgSend_keyHealth(v8, v223, v224) - 1;
    if (v226 < 3) {
      objc_msgSend_setMutableInvitationTokenStatus_(v120, v225, v226 + 1);
    }
    else {
      objc_msgSend_setMutableInvitationTokenStatus_(v120, v225, 0);
    }
  }
  uint64_t v227 = objc_msgSend_createdInProcess(v8, v223, v224);
  objc_msgSend_setCreatedInProcess_(v120, v228, v227);
  uint64_t v231 = objc_msgSend_acceptedInProcess(v8, v229, v230);
  objc_msgSend_setAcceptedInProcess_(v120, v232, v231);
  uint64_t isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v8, v233, v234);
  objc_msgSend_setIsAnonymousInvitedParticipant_(v120, v236, isAnonymousInvitedParticipant);
  if (objc_msgSend_hasIsApprovedRequester(v8, v237, v238))
  {
    uint64_t isApprovedRequester = objc_msgSend_isApprovedRequester(v8, v239, v240);
    objc_msgSend_setIsApprovedRequester_(v120, v242, isApprovedRequester);
  }
  if (objc_msgSend_hasInviteTimestampDate(v8, v239, v240))
  {
    uint64_t v245 = objc_msgSend_inviteTimestampDate(v8, v243, v244);
    objc_msgSend_time(v245, v246, v247);
    double v249 = v248 / 1000.0;

    int v252 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v250, v251, v249);
    objc_msgSend_setInvitationDate_(v120, v253, (uint64_t)v252);
  }
LABEL_57:

  return v120;
}

- (id)pParticipantFromShareParticipant:(id)a3 forCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v8 = objc_opt_new();
  if (v4)
  {
    id v9 = objc_msgSend_userIdentity(v5, v6, v7);
    uint64_t v12 = objc_msgSend_userRecordID(v9, v10, v11);
    uint64_t v15 = objc_msgSend_recordName(v12, v13, v14);
    id v17 = objc_msgSend_pUserIdentifierFromUserRecordName_(self, v16, (uint64_t)v15);
    objc_msgSend_setUserId_(v8, v18, (uint64_t)v17);
  }
  uint64_t v19 = objc_msgSend_role(v5, v6, v7);
  uint64_t v22 = sub_1C4E9506C(v19, v20, v21);
  objc_msgSend_setParticipantType_(v8, v23, v22);
  if (objc_msgSend_role(v5, v24, v25) != 4)
  {
    objc_msgSend_permission(v5, v26, v27);
    uint64_t v28 = sub_1C4E94F90();
    objc_msgSend_setPermission_(v8, v29, v28);
  }
  uint64_t v30 = objc_msgSend_userIdentity(v5, v26, v27);
  if (!objc_msgSend_isAnonymousInvitedParticipant(v5, v31, v32)
    || objc_msgSend_forceSendPublicKeyForAnonymousParticipants(v5, v33, v34))
  {
    uint64_t v35 = objc_msgSend_lookupInfo(v30, v33, v34);
    uint64_t v38 = objc_msgSend_userRecordID(v35, v36, v37);
    if (v38)
    {
      uint64_t v41 = (void *)v38;
      uint64_t v42 = objc_msgSend_role(v5, v39, v40);

      if (v42 != 1)
      {
        uint64_t v45 = objc_opt_new();
        objc_msgSend_setContactInformation_(v8, v46, (uint64_t)v45);

        uint64_t v49 = objc_msgSend_lookupInfo(v30, v47, v48);
        uint64_t v52 = objc_msgSend_userRecordID(v49, v50, v51);
        uint64_t v55 = objc_msgSend_recordName(v52, v53, v54);
        uint64_t v57 = objc_msgSend_pUserIdentifierFromUserRecordName_(self, v56, (uint64_t)v55);
        objc_msgSend_name(v57, v58, v59);
        uint64_t v60 = v30;
        long long v62 = v61 = v4;
        uint64_t v65 = objc_msgSend_contactInformation(v8, v63, v64);
        objc_msgSend_setContainerScopedUserId_(v65, v66, (uint64_t)v62);

        BOOL v4 = v61;
        uint64_t v30 = v60;

        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v67 = objc_msgSend_lookupInfo(v30, v43, v44);
    uint64_t v70 = objc_msgSend_emailAddress(v67, v68, v69);

    if (v70)
    {
      uint64_t v73 = objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v74, (uint64_t)v73);

      uint64_t v49 = objc_msgSend_lookupInfo(v30, v75, v76);
      uint64_t v52 = objc_msgSend_emailAddress(v49, v77, v78);
      id v81 = objc_msgSend_contactInformation(v8, v79, v80);
      objc_msgSend_setEmailAddress_(v81, v82, (uint64_t)v52);
    }
    else
    {
      uint64_t v83 = objc_msgSend_lookupInfo(v30, v71, v72);
      uint64_t v86 = objc_msgSend_phoneNumber(v83, v84, v85);

      if (!v86) {
        goto LABEL_16;
      }
      uint64_t v89 = objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v90, (uint64_t)v89);

      uint64_t v93 = objc_msgSend_lookupInfo(v30, v91, v92);
      uint64_t v96 = objc_msgSend_phoneNumber(v93, v94, v95);
      uint64_t v49 = sub_1C4FC459C(v96);

      uint64_t v52 = objc_msgSend_contactInformation(v8, v97, v98);
      objc_msgSend_setPhoneNumber_(v52, v99, (uint64_t)v49);
    }
LABEL_15:

LABEL_16:
    if (v4)
    {
      uint64_t v100 = objc_msgSend_lookupInfo(v30, v87, v88);
      uint64_t v103 = objc_msgSend_emailAddress(v100, v101, v102);
      uint64_t v106 = objc_msgSend_contactInformation(v8, v104, v105);
      objc_msgSend_setEmailAddress_(v106, v107, (uint64_t)v103);

      int v110 = objc_msgSend_lookupInfo(v30, v108, v109);
      uint64_t v113 = objc_msgSend_phoneNumber(v110, v111, v112);
      uint64_t v116 = objc_msgSend_contactInformation(v8, v114, v115);
      objc_msgSend_setPhoneNumber_(v116, v117, (uint64_t)v113);
    }
    uint64_t v118 = objc_msgSend_contactInformation(v8, v87, v88);

    uint64_t v121 = objc_msgSend_nameComponents(v30, v119, v120);
    uint64_t v124 = objc_msgSend_familyName(v121, v122, v123);
    uint64_t v127 = v124;
    if (v118)
    {
      uint64_t v128 = objc_msgSend_contactInformation(v8, v125, v126);
      objc_msgSend_setLastName_(v128, v129, (uint64_t)v127);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v124, v125, (uint64_t)&stru_1F2044F30))
      {
        uint64_t v134 = objc_msgSend_nameComponents(v30, v132, v133);
        uint64_t v137 = objc_msgSend_givenName(v134, v135, v136);
        char isEqualToString = objc_msgSend_isEqualToString_(v137, v138, (uint64_t)&stru_1F2044F30);

        if (isEqualToString) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      uint64_t v140 = objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v141, (uint64_t)v140);

      uint64_t v144 = objc_msgSend_nameComponents(v30, v142, v143);
      long long v147 = objc_msgSend_familyName(v144, v145, v146);
      uint64_t v150 = objc_msgSend_contactInformation(v8, v148, v149);
      objc_msgSend_setLastName_(v150, v151, (uint64_t)v147);
    }
    uint64_t v152 = objc_msgSend_nameComponents(v30, v130, v131);
    uint64_t v155 = objc_msgSend_givenName(v152, v153, v154);
    uint64_t v158 = objc_msgSend_contactInformation(v8, v156, v157);
    objc_msgSend_setFirstName_(v158, v159, (uint64_t)v155);

LABEL_26:
    uint64_t v160 = objc_opt_new();
    objc_msgSend_setPublicKey_(v8, v161, (uint64_t)v160);

    uint64_t v164 = objc_msgSend_publicSharingKey(v30, v162, v163);
    uint64_t v167 = objc_msgSend_publicKey(v8, v165, v166);
    objc_msgSend_setProtectionInfo_(v167, v168, (uint64_t)v164);
  }
  uint64_t v169 = objc_msgSend_userIdentity(v5, v33, v34);
  uint64_t v172 = objc_msgSend_publicKeyVersion(v169, v170, v171);
  objc_msgSend_setPublicKeyVersion_(v8, v173, v172);

  uint64_t v176 = objc_msgSend_participantID(v5, v174, v175);
  uint64_t v179 = objc_msgSend_length(v176, v177, v178);

  if (v179)
  {
    uint64_t v182 = objc_msgSend_participantID(v5, v180, v181);
    uint64_t v185 = objc_msgSend_CKDPIdentifier_User(v182, v183, v184);
    objc_msgSend_setParticipantId_(v8, v186, (uint64_t)v185);
  }
  uint64_t v187 = objc_msgSend_inviterID(v5, v180, v181);
  uint64_t v190 = objc_msgSend_length(v187, v188, v189);

  if (v190)
  {
    uint64_t v193 = objc_msgSend_inviterID(v5, v191, v192);
    v196 = objc_msgSend_CKDPIdentifier_User(v193, v194, v195);
    objc_msgSend_setInviterId_(v8, v197, (uint64_t)v196);
  }
  long long v198 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (v4
    || objc_msgSend_acceptanceStatus(v5, v191, v192) == 3
    || (uint64_t v199 = objc_msgSend_role(v5, v191, v192), *v198)
    || v199 != 4)
  {
    uint64_t v200 = objc_msgSend_acceptanceStatus(v5, v191, v192);
    if ((unint64_t)(v200 - 2) >= 3) {
      objc_msgSend_setState_(v8, v201, 1);
    }
    else {
      objc_msgSend_setState_(v8, v201, v200);
    }
  }
  if (objc_msgSend_isOrgAdminUser(v5, v191, v192))
  {
    objc_msgSend_setIsOrgUser_(v8, v202, 1);
  }
  else
  {
    uint64_t v206 = objc_msgSend_userIdentity(v5, v202, v203);
    uint64_t v209 = objc_msgSend_userRecordID(v206, v207, v208);
    uint64_t v212 = objc_msgSend_recordName(v209, v210, v211);
    __int16 v215 = objc_msgSend_orgAdminUserID(self, v213, v214);
    uint64_t v217 = objc_msgSend_isEqualToString_(v212, v216, (uint64_t)v215);

    objc_msgSend_setIsOrgUser_(v8, v218, v217);
  }
  uint64_t v219 = objc_msgSend_protectionInfo(v5, v204, v205);

  if (v219)
  {
    uint64_t v222 = objc_opt_new();
    objc_msgSend_setProtectionInfo_(v8, v223, (uint64_t)v222);

    uint64_t v226 = objc_msgSend_protectionInfo(v5, v224, v225);
    uint64_t v229 = objc_msgSend_protectionInfo(v8, v227, v228);
    objc_msgSend_setProtectionInfo_(v229, v230, (uint64_t)v226);
  }
  uint64_t v231 = objc_msgSend_userIdentity(v5, v220, v221);
  uint64_t v234 = objc_msgSend_outOfNetworkPrivateKey(v231, v232, v233);
  uint64_t v237 = objc_msgSend_length(v234, v235, v236);

  if (v237)
  {
    uint64_t v240 = objc_msgSend_userIdentity(v5, v238, v239);
    uint64_t v243 = objc_msgSend_outOfNetworkPrivateKey(v240, v241, v242);
    objc_msgSend_setOutOfNetworkPrivateKey_(v8, v244, (uint64_t)v243);

    objc_msgSend_setOutOfNetworkKeyType_(v8, v245, 0);
  }
  uint64_t v246 = objc_msgSend_protectionInfoPublicKey(v5, v238, v239);
  uint64_t v249 = objc_msgSend_length(v246, v247, v248);

  if (v249)
  {
    int v252 = objc_msgSend_protectionInfoPublicKey(v5, v250, v251);
    objc_msgSend_setProtectionInfoPublicKey_(v8, v253, (uint64_t)v252);
  }
  uint64_t v254 = objc_msgSend_createdInProcess(v5, v250, v251);
  objc_msgSend_setCreatedInProcess_(v8, v255, v254);
  uint64_t v258 = objc_msgSend_acceptedInProcess(v5, v256, v257);
  objc_msgSend_setAcceptedInProcess_(v8, v259, v258);
  uint64_t v262 = objc_msgSend_invitationTokenStatus(v5, v260, v261);
  uint64_t v265 = sub_1C4E94EE4(v262, v263, v264);
  objc_msgSend_setKeyHealth_(v8, v266, v265);
  uint64_t isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v5, v267, v268);
  objc_msgSend_setIsAnonymousInvitedParticipant_(v8, v270, isAnonymousInvitedParticipant);
  uint64_t isApprovedRequester = objc_msgSend_isApprovedRequester(v5, v271, v272);
  objc_msgSend_setIsApprovedRequester_(v8, v274, isApprovedRequester);
  if (*v198)
  {
    uint64_t v277 = objc_msgSend_userIdentity(v5, v275, v276);
    uint64_t v280 = objc_msgSend_hasiCloudAccount(v277, v278, v279);
    objc_msgSend_setIsInNetwork_(v8, v281, v280);
  }
  return v8;
}

- (id)shareRequesterFromPRequester:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1A480]);
    inited = objc_msgSend_initInternal(v5, v6, v7);
    id v9 = objc_alloc(MEMORY[0x1E4F1A488]);
    uint64_t v12 = objc_msgSend_initInternal(v9, v10, v11);
    if (objc_msgSend_hasUserId(v4, v13, v14))
    {
      id v17 = objc_msgSend_userId(v4, v15, v16);
      uint64_t v19 = objc_msgSend_recordIDFromPUserName_error_(self, v18, (uint64_t)v17, 0);
      objc_msgSend_setUserRecordID_(v12, v20, (uint64_t)v19);
    }
    if (objc_msgSend_hasContactInformation(v4, v15, v16))
    {
      uint64_t v23 = objc_msgSend_contactInformation(v4, v21, v22);
      int hasEmailAddress = objc_msgSend_hasEmailAddress(v23, v24, v25);

      if (hasEmailAddress)
      {
        uint64_t v29 = objc_msgSend_contactInformation(v4, v27, v28);
        uint64_t v32 = objc_msgSend_emailAddress(v29, v30, v31);
        objc_msgSend_setEmailAddress_(v12, v33, (uint64_t)v32);
      }
      uint64_t v34 = objc_msgSend_contactInformation(v4, v27, v28);
      int hasPhoneNumber = objc_msgSend_hasPhoneNumber(v34, v35, v36);

      if (hasPhoneNumber)
      {
        uint64_t v40 = objc_msgSend_contactInformation(v4, v38, v39);
        int v43 = objc_msgSend_phoneNumber(v40, v41, v42);
        objc_msgSend_setPhoneNumber_(v12, v44, (uint64_t)v43);
      }
      uint64_t v45 = objc_msgSend_contactInformation(v4, v38, v39);
      int hasFirstName = objc_msgSend_hasFirstName(v45, v46, v47);

      if (hasFirstName)
      {
        uint64_t v51 = objc_msgSend_contactInformation(v4, v49, v50);
        uint64_t v54 = objc_msgSend_firstName(v51, v52, v53);
        uint64_t v57 = objc_msgSend_nameComponents(inited, v55, v56);
        objc_msgSend_setGivenName_(v57, v58, (uint64_t)v54);
      }
      uint64_t v59 = objc_msgSend_contactInformation(v4, v49, v50);
      int hasLastName = objc_msgSend_hasLastName(v59, v60, v61);

      if (hasLastName)
      {
        uint64_t v64 = objc_msgSend_contactInformation(v4, v21, v63);
        uint64_t v67 = objc_msgSend_lastName(v64, v65, v66);
        uint64_t v70 = objc_msgSend_nameComponents(inited, v68, v69);
        objc_msgSend_setFamilyName_(v70, v71, (uint64_t)v67);
      }
    }
    objc_msgSend_setLookupInfo_(inited, v21, (uint64_t)v12);
    id v72 = objc_alloc(MEMORY[0x1E4F1A398]);
    uint64_t v74 = objc_msgSend_initWithUserIdentity_(v72, v73, (uint64_t)inited);
  }
  else
  {
    uint64_t v74 = 0;
  }

  return v74;
}

- (id)blockedIdentityFromPBlockedUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1A480]);
    inited = objc_msgSend_initInternal(v5, v6, v7);
    id v9 = objc_alloc(MEMORY[0x1E4F1A488]);
    uint64_t v12 = objc_msgSend_initInternal(v9, v10, v11);
    if (objc_msgSend_hasUserId(v4, v13, v14))
    {
      id v17 = objc_msgSend_userId(v4, v15, v16);
      uint64_t v19 = objc_msgSend_recordIDFromPUserName_error_(self, v18, (uint64_t)v17, 0);
      objc_msgSend_setUserRecordID_(v12, v20, (uint64_t)v19);
    }
    if (objc_msgSend_hasContactInformation(v4, v15, v16))
    {
      uint64_t v23 = objc_msgSend_contactInformation(v4, v21, v22);
      int hasEmailAddress = objc_msgSend_hasEmailAddress(v23, v24, v25);

      if (hasEmailAddress)
      {
        uint64_t v29 = objc_msgSend_contactInformation(v4, v27, v28);
        uint64_t v32 = objc_msgSend_emailAddress(v29, v30, v31);
        objc_msgSend_setEmailAddress_(v12, v33, (uint64_t)v32);
      }
      uint64_t v34 = objc_msgSend_contactInformation(v4, v27, v28);
      int hasPhoneNumber = objc_msgSend_hasPhoneNumber(v34, v35, v36);

      if (hasPhoneNumber)
      {
        uint64_t v40 = objc_msgSend_contactInformation(v4, v38, v39);
        int v43 = objc_msgSend_phoneNumber(v40, v41, v42);
        objc_msgSend_setPhoneNumber_(v12, v44, (uint64_t)v43);
      }
      uint64_t v45 = objc_msgSend_contactInformation(v4, v38, v39);
      int hasFirstName = objc_msgSend_hasFirstName(v45, v46, v47);

      if (hasFirstName)
      {
        uint64_t v51 = objc_msgSend_contactInformation(v4, v49, v50);
        uint64_t v54 = objc_msgSend_firstName(v51, v52, v53);
        uint64_t v57 = objc_msgSend_nameComponents(inited, v55, v56);
        objc_msgSend_setGivenName_(v57, v58, (uint64_t)v54);
      }
      uint64_t v59 = objc_msgSend_contactInformation(v4, v49, v50);
      int hasLastName = objc_msgSend_hasLastName(v59, v60, v61);

      if (hasLastName)
      {
        uint64_t v64 = objc_msgSend_contactInformation(v4, v21, v63);
        uint64_t v67 = objc_msgSend_lastName(v64, v65, v66);
        uint64_t v70 = objc_msgSend_nameComponents(inited, v68, v69);
        objc_msgSend_setFamilyName_(v70, v71, (uint64_t)v67);
      }
    }
    objc_msgSend_setLookupInfo_(inited, v21, (uint64_t)v12);
    id v72 = objc_alloc(MEMORY[0x1E4F1A3A0]);
    uint64_t v74 = objc_msgSend_initWithUserIdentity_(v72, v73, (uint64_t)inited);
  }
  else
  {
    uint64_t v74 = 0;
  }

  return v74;
}

- (id)pRequesterFromShareRequester:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(CKDPUserInformationRequestAccess);
    id v8 = objc_msgSend_userIdentity(v4, v6, v7);

    uint64_t v11 = objc_msgSend_lookupInfo(v8, v9, v10);
    uint64_t v14 = objc_msgSend_userRecordID(v11, v12, v13);
    id v17 = objc_msgSend_recordName(v14, v15, v16);
    uint64_t v19 = objc_msgSend_pUserIdentifierFromUserRecordName_(self, v18, (uint64_t)v17);
    uint64_t v22 = objc_msgSend_name(v19, v20, v21);
    objc_msgSend_setUserId_(v5, v23, (uint64_t)v22);

    uint64_t v24 = objc_alloc_init(CKDPContactInformation);
    uint64_t v27 = objc_msgSend_nameComponents(v8, v25, v26);
    uint64_t v30 = objc_msgSend_givenName(v27, v28, v29);
    objc_msgSend_setFirstName_(v24, v31, (uint64_t)v30);

    uint64_t v34 = objc_msgSend_nameComponents(v8, v32, v33);
    uint64_t v37 = objc_msgSend_familyName(v34, v35, v36);
    objc_msgSend_setLastName_(v24, v38, (uint64_t)v37);

    uint64_t v41 = objc_msgSend_lookupInfo(v8, v39, v40);
    uint64_t v44 = objc_msgSend_emailAddress(v41, v42, v43);
    objc_msgSend_setEmailAddress_(v24, v45, (uint64_t)v44);

    uint64_t v48 = objc_msgSend_lookupInfo(v8, v46, v47);
    uint64_t v51 = objc_msgSend_phoneNumber(v48, v49, v50);
    objc_msgSend_setPhoneNumber_(v24, v52, (uint64_t)v51);

    objc_msgSend_setContactInformation_(v5, v53, (uint64_t)v24);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)pBlockedUserFromShareBlockedIdentity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(CKDPUserInformationBlockedRequestAccess);
    id v8 = objc_msgSend_userIdentity(v4, v6, v7);

    uint64_t v11 = objc_msgSend_lookupInfo(v8, v9, v10);
    uint64_t v14 = objc_msgSend_userRecordID(v11, v12, v13);
    id v17 = objc_msgSend_recordName(v14, v15, v16);
    uint64_t v19 = objc_msgSend_pUserIdentifierFromUserRecordName_(self, v18, (uint64_t)v17);
    uint64_t v22 = objc_msgSend_name(v19, v20, v21);
    objc_msgSend_setUserId_(v5, v23, (uint64_t)v22);

    uint64_t v24 = objc_alloc_init(CKDPContactInformation);
    uint64_t v27 = objc_msgSend_nameComponents(v8, v25, v26);
    uint64_t v30 = objc_msgSend_givenName(v27, v28, v29);
    objc_msgSend_setFirstName_(v24, v31, (uint64_t)v30);

    uint64_t v34 = objc_msgSend_nameComponents(v8, v32, v33);
    uint64_t v37 = objc_msgSend_familyName(v34, v35, v36);
    objc_msgSend_setLastName_(v24, v38, (uint64_t)v37);

    uint64_t v41 = objc_msgSend_lookupInfo(v8, v39, v40);
    uint64_t v44 = objc_msgSend_emailAddress(v41, v42, v43);
    objc_msgSend_setEmailAddress_(v24, v45, (uint64_t)v44);

    uint64_t v48 = objc_msgSend_lookupInfo(v8, v46, v47);
    uint64_t v51 = objc_msgSend_phoneNumber(v48, v49, v50);
    objc_msgSend_setPhoneNumber_(v24, v52, (uint64_t)v51);

    objc_msgSend_setContactInformation_(v5, v53, (uint64_t)v24);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)notificationFromPPushMessage:(id)a3
{
  v111[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v6 = objc_msgSend_payload(v3, v4, v5);
  uint64_t v9 = objc_msgSend_length(v6, v7, v8);

  if (v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v13 = objc_msgSend_payload(v3, v10, v11);
    id v105 = 0;
    uint64_t v15 = objc_msgSend_JSONObjectWithData_options_error_(v12, v14, (uint64_t)v13, 4, &v105);
    id v16 = v105;

    if (v15)
    {
      uint64_t v110 = *MEMORY[0x1E4F1A640];
      v111[0] = v15;
      uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v111, &v110, 1);
      objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x1E4F1A1D0], v19, (uint64_t)v18);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v26 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v107 = v16;
        _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Unable to convert payload message: %@", buf, 0xCu);
      }
      uint64_t v18 = 0;
      objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x1E4F1A1D0], v27, 0);
    inited = };
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1A1D0]);
    inited = objc_msgSend_initInternal(v20, v21, v22);
  }
  uint64_t v28 = objc_msgSend_uuid(v3, v23, v24);

  if (v28)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1A1D8]);
    uint64_t v34 = objc_msgSend_uuid(v3, v32, v33);
    uint64_t v36 = objc_msgSend_initWithNotificationUUID_(v31, v35, (uint64_t)v34);

    objc_msgSend_setNotificationID_(inited, v37, (uint64_t)v36);
  }
  if (objc_msgSend_hasDialog(v3, v29, v30))
  {
    uint64_t v40 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v41 = objc_msgSend_dialog(v3, v38, v39);
    uint64_t v43 = objc_msgSend_dataUsingEncoding_(v41, v42, 4);
    id v104 = 0;
    uint64_t v45 = objc_msgSend_JSONObjectWithData_options_error_(v40, v44, (uint64_t)v43, 4, &v104);
    id v46 = v104;

    if (v45)
    {
      id v47 = v45;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v47, v48, *MEMORY[0x1E4F1A600]);
        objc_msgSend_setAlertBody_(inited, v51, (uint64_t)v50);

        uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v47, v52, *MEMORY[0x1E4F1A618]);
        objc_msgSend_setAlertLocalizationKey_(inited, v54, (uint64_t)v53);

        uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v47, v55, *MEMORY[0x1E4F1A610]);
        objc_msgSend_setAlertLocalizationArgs_(inited, v57, (uint64_t)v56);

        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v47, v58, *MEMORY[0x1E4F1A638]);
        objc_msgSend_setTitleLocalizationKey_(inited, v60, (uint64_t)v59);

        long long v62 = objc_msgSend_objectForKeyedSubscript_(v47, v61, *MEMORY[0x1E4F1A630]);
        objc_msgSend_setTitleLocalizationArgs_(inited, v63, (uint64_t)v62);

        uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v47, v64, *MEMORY[0x1E4F1A628]);
        objc_msgSend_setSubtitleLocalizationKey_(inited, v66, (uint64_t)v65);

        uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v47, v67, *MEMORY[0x1E4F1A620]);
        objc_msgSend_setSubtitleLocalizationArgs_(inited, v69, (uint64_t)v68);

        uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v47, v70, *MEMORY[0x1E4F1A5F8]);
        objc_msgSend_setAlertActionLocalizationKey_(inited, v72, (uint64_t)v71);

        uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v47, v73, *MEMORY[0x1E4F1A608]);
        objc_msgSend_setAlertLaunchImage_(inited, v75, (uint64_t)v74);
      }
      else
      {
        uint64_t v74 = objc_msgSend_dialog(v3, v48, v49);
        objc_msgSend_setAlertBody_(inited, v80, (uint64_t)v74);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v76 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v100 = v76;
        uint64_t v103 = objc_msgSend_dialog(v3, v101, v102);
        *(_DWORD *)long long buf = 138412546;
        id v107 = v103;
        __int16 v108 = 2112;
        id v109 = v46;
        _os_log_error_impl(&dword_1C4CFF000, v100, OS_LOG_TYPE_ERROR, "Unable to parse dialog body %@: %@", buf, 0x16u);
      }
      objc_msgSend_dialog(v3, v77, v78);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertBody_(inited, v79, (uint64_t)v47);
    }
  }
  id v81 = objc_msgSend_sound(v3, v38, v39);
  objc_msgSend_setSoundName_(inited, v82, (uint64_t)v81);

  if (objc_msgSend_hasBadgeCount(v3, v83, v84))
  {
    uint64_t v87 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v88 = objc_msgSend_badgeCount(v3, v85, v86);
    uint64_t v90 = objc_msgSend_numberWithInt_(v87, v89, v88);
    objc_msgSend_setBadge_(inited, v91, (uint64_t)v90);
  }
  uint64_t v92 = objc_msgSend_category(v3, v85, v86);
  objc_msgSend_setCategory_(inited, v93, (uint64_t)v92);

  if (objc_msgSend_hasIsRead(v3, v94, v95) && objc_msgSend_isRead(v3, v96, v97)) {
    objc_msgSend_setNotificationType_(inited, v98, 3);
  }

  return inited;
}

- (id)pAliasWithIdentityLookupInfo:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_lookupField(v5, v6, v7) == 1)
  {
    uint64_t v10 = objc_msgSend_emailAddress(v5, v8, v9);
    uint64_t v12 = objc_msgSend_pAliasWithEmailAddress_(self, v11, (uint64_t)v10);
  }
  else if (objc_msgSend_lookupField(v5, v8, v9) == 2)
  {
    uint64_t v10 = objc_msgSend_userRecordID(v5, v13, v14);
    uint64_t v12 = objc_msgSend_pAliasWithUserRecordID_(self, v15, (uint64_t)v10);
  }
  else
  {
    if (objc_msgSend_lookupField(v5, v13, v14) != 3)
    {
      uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
      uint64_t v24 = objc_msgSend_lookupField(v5, v22, v23);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v25, (uint64_t)a2, self, @"CKDProtocolTranslator.m", 2737, @"Unknown lookup field in CKUserIdentityLookupInfo: %ld", v24);
    }
    uint64_t v10 = objc_msgSend_phoneNumber(v5, v16, v17);
    uint64_t v12 = objc_msgSend_pAliasWithPhoneNumber_(self, v18, (uint64_t)v10);
  }
  uint64_t v19 = (void *)v12;

  return v19;
}

- (id)pAliasWithEmailAddress:(id)a3
{
  return (id)objc_msgSend_pAliasWithHashedStringID_type_(self, a2, (uint64_t)a3, 1);
}

- (id)pAliasWithPhoneNumber:(id)a3
{
  id v4 = sub_1C4FC459C(a3);
  id v6 = objc_msgSend_pAliasWithHashedStringID_type_(self, v5, (uint64_t)v4, 3);

  return v6;
}

- (id)pAliasWithHashedStringID:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = a3;
  uint64_t v8 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v5, v7, (uint64_t)&v24, 32, 0);
  uint64_t v11 = objc_msgSend_lowercaseString(v6, v9, v10, v24, v25);

  uint64_t v14 = (const void *)objc_msgSend_UTF8String(v11, v12, v13);
  CC_LONG v16 = objc_msgSend_lengthOfBytesUsingEncoding_(v11, v15, 4);
  CC_SHA256(v14, v16, (unsigned __int8 *)&v24);
  uint64_t v19 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v8, v17, v18);
  if (v19)
  {
    id v20 = objc_opt_new();
    objc_msgSend_setIdentifier_(v20, v21, (uint64_t)v19);
    objc_msgSend_setType_(v20, v22, v4);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)pAliasWithUserRecordID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_recordName(v4, v6, v7);
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v9, (uint64_t)v8)) {
    objc_msgSend_containerScopedUserID(self, v10, v11);
  }
  else {
  uint64_t v12 = objc_msgSend_recordName(v4, v10, v11);
  }
  objc_msgSend_setIdentifier_(v5, v13, (uint64_t)v12);

  objc_msgSend_setType_(v5, v14, 2);
  return v5;
}

- (id)identityFromPUser:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1A480]);
    inited = objc_msgSend_initInternal(v4, v5, v6);
    uint64_t v10 = objc_msgSend_lastName(v3, v8, v9);
    uint64_t v13 = objc_msgSend_nameComponents(inited, v11, v12);
    objc_msgSend_setFamilyName_(v13, v14, (uint64_t)v10);

    uint64_t v17 = objc_msgSend_firstName(v3, v15, v16);
    id v20 = objc_msgSend_nameComponents(inited, v18, v19);
    objc_msgSend_setGivenName_(v20, v21, (uint64_t)v17);

    long long v24 = objc_msgSend_identifier(v3, v22, v23);
    LODWORD(v20) = objc_msgSend_hasName(v24, v25, v26);

    if (v20)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      uint64_t v30 = objc_msgSend_identifier(v3, v28, v29);
      uint64_t v33 = objc_msgSend_name(v30, v31, v32);
      uint64_t v35 = objc_msgSend_initWithRecordName_(v27, v34, (uint64_t)v33);
      objc_msgSend_setUserRecordID_(inited, v36, (uint64_t)v35);
    }
  }
  else
  {
    inited = 0;
  }

  return inited;
}

- (BOOL)dontCreateValidatingParentReferences
{
  return self->_dontCreateValidatingParentReferences;
}

- (void)setDontCreateValidatingParentReferences:(BOOL)a3
{
  self->_dontCreateValidatingParentReferences = a3;
}

- (NSString)packageStagingDirectory
{
  return self->_packageStagingDirectory;
}

- (NSString)orgAdminUserID
{
  return self->_orgAdminUserID;
}

- (CKDProtocolTranslatorIdentityDelegate)identityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identityDelegate);
  return (CKDProtocolTranslatorIdentityDelegate *)WeakRetained;
}

- (void)setIdentityDelegate:(id)a3
{
}

- (NSString)overriddenContainerScopedUserID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOverriddenContainerScopedUserID:(id)a3
{
}

- (int64_t)overriddenDatabaseScope
{
  return self->_overriddenDatabaseScope;
}

- (void)setOverriddenDatabaseScope:(int64_t)a3
{
  self->_overriddenDatabaseScope = a3;
}

- (BOOL)addDatabaseScopeToZoneIDs
{
  return self->_addDatabaseScopeToZoneIDs;
}

- (NSMutableDictionary)downloadPreauthorizationMap
{
  return self->_downloadPreauthorizationMap;
}

- (CKDPCSManager)pcsManager
{
  return self->_pcsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorizationMap, 0);
  objc_storeStrong((id *)&self->_overriddenContainerScopedUserID, 0);
  objc_destroyWeak((id *)&self->_identityDelegate);
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_packageStagingDirectory, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
}

@end
@interface CKDPResponseOperationResultErrorClient
- (BOOL)hasMoveOplockFailure;
- (BOOL)hasOplockFailure;
- (BOOL)hasType;
- (BOOL)hasUniqueFieldFailure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPMoveOplockFailure)moveOplockFailure;
- (CKDPOplockFailure)oplockFailure;
- (CKDPUniqueFieldFailure)uniqueFieldFailure;
- (id)_typeCKLogValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMoveOplockFailure:(id)a3;
- (void)setOplockFailure:(id)a3;
- (void)setType:(int)a3;
- (void)setUniqueFieldFailure:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultErrorClient

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  v4 = @"unknown";
  switch(a3)
  {
    case 1:
      goto LABEL_129;
    case 2:
      v4 = @"expiredAppConfig";
      break;
    case 3:
      v4 = @"expiredGlobalConfig";
      break;
    case 4:
      v4 = @"badSyntax";
      break;
    case 5:
      v4 = @"forbidden";
      break;
    case 6:
      v4 = @"throttled";
      break;
    case 7:
      v4 = @"refused";
      break;
    case 8:
      v4 = @"notSupported";
      break;
    case 9:
      v4 = @"exists";
      break;
    case 10:
      v4 = @"requestAlreadyProcessed";
      break;
    case 11:
      v4 = @"badAuthToken";
      break;
    case 12:
      v4 = @"needsAuthentication";
      break;
    case 13:
      v4 = @"mescalSignatureMissing";
      break;
    case 14:
      v4 = @"invalidMescalSignature";
      break;
    case 15:
      v4 = @"opLockFailure";
      break;
    case 16:
      v4 = @"atomicFailure";
      break;
    case 17:
      v4 = @"resetNeeded";
      break;
    case 18:
      v4 = @"fieldsPerTypeLimitExceeded";
      break;
    case 19:
      v4 = @"typeBusy";
      break;
    case 20:
      v4 = @"numRecordTypesLimitExceeded";
      break;
    case 21:
      v4 = @"invalidContainer";
      break;
    case 22:
      v4 = @"invalidRecordTypeName";
      break;
    case 23:
      v4 = @"invalidFieldName";
      break;
    case 24:
      v4 = @"invalidFieldValue";
      break;
    case 25:
      v4 = @"invalidIdentifier";
      break;
    case 26:
      v4 = @"fieldNotQueryable";
      break;
    case 27:
      v4 = @"fieldNotSortable";
      break;
    case 28:
      v4 = @"queryFilterLimitExceeded";
      break;
    case 29:
      v4 = @"queryFilterValuesLimitExceeded";
      break;
    case 30:
      v4 = @"membershipQueryLimitExceeded";
      break;
    case 31:
      v4 = @"notificationAdditionalFieldLimitExceeded";
      break;
    case 32:
      v4 = @"notificationAdditionalFieldInvalidType";
      break;
    case 33:
      v4 = @"subscriptionLimitExceeded";
      break;
    case 34:
      v4 = @"uniqueTriggerLimitExceeded";
      break;
    case 35:
      v4 = @"triggerSubscriptionBindingTypeMismatch";
      break;
    case 36:
      v4 = @"zoneSizeLimitExceeded";
      break;
    case 37:
      v4 = @"zoneCountLimitExceeded";
      break;
    case 38:
      v4 = @"uniqueFieldFailure";
      break;
    case 39:
      v4 = @"validatingReferenceError";
      break;
    case 40:
      v4 = @"fullResetNeeded";
      break;
    case 41:
      v4 = @"alreadyShared";
      break;
    case 42:
      v4 = @"emailOutOfNetwork";
      break;
    case 43:
      v4 = @"duplicateSubscription";
      break;
    case 46:
      v4 = @"expiredPutReceipt";
      break;
    case 47:
      v4 = @"quotaExceeded";
      break;
    case 48:
      v4 = @"zoneNotFound";
      break;
    case 49:
      v4 = @"invalidBundleId";
      break;
    case 50:
      v4 = @"unsupportedDevice";
      break;
    case 51:
      v4 = @"blocklisted";
      break;
    case 52:
      v4 = @"recordProtectionInfoTagMismatch";
      break;
    case 53:
      v4 = @"zoneProtectionInfoTagMismatch";
      break;
    case 54:
      v4 = @"assetSizeLimitExceeded";
      break;
    case 55:
      v4 = @"batchOperationLimitExceeded";
      break;
    case 56:
      v4 = @"requestSizeLimitExceeded";
      break;
    case 57:
      v4 = @"recordSizeLimitExceeded";
      break;
    case 58:
      v4 = @"databaseCommitSizeExceeded";
      break;
    case 59:
      v4 = @"userDeletedDataForZone";
      break;
    case 60:
      v4 = @"staleRecordUpdate";
      break;
    case 61:
      v4 = @"shareParticipantLimitExceeded";
      break;
    case 62:
      v4 = @"shareParticipantError";
      break;
    case 64:
      v4 = @"pcsChainingError";
      break;
    case 65:
      v4 = @"hierarchyAlreadyHasShare";
      break;
    case 66:
      v4 = @"u13Restricted";
      break;
    case 67:
      v4 = @"managedAppleIdRestricted";
      break;
    case 68:
      v4 = @"shareParticipantContactError";
      break;
    case 69:
      v4 = @"recordArchived";
      break;
    case 70:
      v4 = @"databaseAccessDenied";
      break;
    case 71:
      v4 = @"parentHierarchyDepthLimitExceeded";
      break;
    case 72:
      v4 = @"zonePcsUserIdentityUnknown";
      break;
    case 73:
      v4 = @"managedAppleIdBackupBlocked";
      break;
    case 75:
      v4 = @"outOfNetworkUsersUnsupported";
      break;
    case 76:
      v4 = @"gameAssignmentNotFound";
      break;
    case 77:
      v4 = @"queryBeginsWithValueLengthLimitExceeded";
      break;
    case 78:
      v4 = @"userResetEncryptedData";
      break;
    case 79:
      v4 = @"mergeableValueNotFound";
      break;
    case 80:
      v4 = @"invalidPublicKey";
      break;
    case 81:
      v4 = @"mergeableDeltaSizeLimitExceeded";
      break;
    case 82:
      v4 = @"mergeableDeltaNotFound";
      break;
    case 83:
      v4 = @"mergeableDeltaInvalid";
      break;
    case 84:
      v4 = @"mergeableValueCompactionRequired";
      break;
    case 85:
      v4 = @"unprovisionedICloudAccount";
      break;
    case 86:
      v4 = @"purgedICloudAccount";
      break;
    case 87:
      v4 = @"invalidDsidForICloudAccount";
      break;
    case 88:
      v4 = @"shareRegionUnsupported";
      break;
    case 89:
      v4 = @"a2aSignatureValidationError";
      break;
    case 90:
      v4 = @"participantIdMismatch";
      break;
    case 94:
      v4 = @"groupKitSignatureValidationError";
      break;
    case 95:
      v4 = @"shareRequestAccessError";
      break;
    case 96:
      v4 = @"shareRequestAccessLimitExceeded";
      break;
    case 97:
      v4 = @"shareRequestAccessShareAcceptRequired";
      break;
    case 98:
      v4 = @"shareBlockedUserCanNotBeParticipant";
      break;
    case 100:
      v4 = @"shareBlockedLimitExceeded";
      break;
    case 101:
      v4 = @"zoneAncestryOpLockFailure";
      break;
    case 102:
      v4 = @"invalidTimestamp";
      break;
    case 103:
      v4 = @"invalidSignature";
      break;
    case 104:
      v4 = @"unsupportedSigningIdentity";
      break;
    case 105:
      v4 = @"invalidSignedBlob";
      break;
    case 106:
      v4 = @"unsupportedVersion";
      break;
    default:
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_129:
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unknown"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"expiredAppConfig"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"expiredGlobalConfig"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"badSyntax"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"forbidden"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"throttled"))
  {
    int v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"refused"))
  {
    int v6 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v12, @"notSupported"))
  {
    int v6 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"exists"))
  {
    int v6 = 9;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"requestAlreadyProcessed"))
  {
    int v6 = 10;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"badAuthToken"))
  {
    int v6 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v16, @"needsAuthentication"))
  {
    int v6 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"mescalSignatureMissing"))
  {
    int v6 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v3, v18, @"invalidMescalSignature"))
  {
    int v6 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"opLockFailure"))
  {
    int v6 = 15;
  }
  else if (objc_msgSend_isEqualToString_(v3, v20, @"atomicFailure"))
  {
    int v6 = 16;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, @"resetNeeded"))
  {
    int v6 = 17;
  }
  else if (objc_msgSend_isEqualToString_(v3, v22, @"fieldsPerTypeLimitExceeded"))
  {
    int v6 = 18;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, @"typeBusy"))
  {
    int v6 = 19;
  }
  else if (objc_msgSend_isEqualToString_(v3, v24, @"numRecordTypesLimitExceeded"))
  {
    int v6 = 20;
  }
  else if (objc_msgSend_isEqualToString_(v3, v25, @"invalidContainer"))
  {
    int v6 = 21;
  }
  else if (objc_msgSend_isEqualToString_(v3, v26, @"invalidRecordTypeName"))
  {
    int v6 = 22;
  }
  else if (objc_msgSend_isEqualToString_(v3, v27, @"invalidFieldName"))
  {
    int v6 = 23;
  }
  else if (objc_msgSend_isEqualToString_(v3, v28, @"invalidFieldValue"))
  {
    int v6 = 24;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, @"invalidIdentifier"))
  {
    int v6 = 25;
  }
  else if (objc_msgSend_isEqualToString_(v3, v30, @"fieldNotQueryable"))
  {
    int v6 = 26;
  }
  else if (objc_msgSend_isEqualToString_(v3, v31, @"fieldNotSortable"))
  {
    int v6 = 27;
  }
  else if (objc_msgSend_isEqualToString_(v3, v32, @"queryFilterLimitExceeded"))
  {
    int v6 = 28;
  }
  else if (objc_msgSend_isEqualToString_(v3, v33, @"queryFilterValuesLimitExceeded"))
  {
    int v6 = 29;
  }
  else if (objc_msgSend_isEqualToString_(v3, v34, @"membershipQueryLimitExceeded"))
  {
    int v6 = 30;
  }
  else if (objc_msgSend_isEqualToString_(v3, v35, @"notificationAdditionalFieldLimitExceeded"))
  {
    int v6 = 31;
  }
  else if (objc_msgSend_isEqualToString_(v3, v36, @"notificationAdditionalFieldInvalidType"))
  {
    int v6 = 32;
  }
  else if (objc_msgSend_isEqualToString_(v3, v37, @"subscriptionLimitExceeded"))
  {
    int v6 = 33;
  }
  else if (objc_msgSend_isEqualToString_(v3, v38, @"uniqueTriggerLimitExceeded"))
  {
    int v6 = 34;
  }
  else if (objc_msgSend_isEqualToString_(v3, v39, @"triggerSubscriptionBindingTypeMismatch"))
  {
    int v6 = 35;
  }
  else if (objc_msgSend_isEqualToString_(v3, v40, @"zoneSizeLimitExceeded"))
  {
    int v6 = 36;
  }
  else if (objc_msgSend_isEqualToString_(v3, v41, @"zoneCountLimitExceeded"))
  {
    int v6 = 37;
  }
  else if (objc_msgSend_isEqualToString_(v3, v42, @"uniqueFieldFailure"))
  {
    int v6 = 38;
  }
  else if (objc_msgSend_isEqualToString_(v3, v43, @"validatingReferenceError"))
  {
    int v6 = 39;
  }
  else if (objc_msgSend_isEqualToString_(v3, v44, @"fullResetNeeded"))
  {
    int v6 = 40;
  }
  else if (objc_msgSend_isEqualToString_(v3, v45, @"alreadyShared"))
  {
    int v6 = 41;
  }
  else if (objc_msgSend_isEqualToString_(v3, v46, @"emailOutOfNetwork"))
  {
    int v6 = 42;
  }
  else if (objc_msgSend_isEqualToString_(v3, v47, @"duplicateSubscription"))
  {
    int v6 = 43;
  }
  else if (objc_msgSend_isEqualToString_(v3, v48, @"expiredPutReceipt"))
  {
    int v6 = 46;
  }
  else if (objc_msgSend_isEqualToString_(v3, v49, @"quotaExceeded"))
  {
    int v6 = 47;
  }
  else if (objc_msgSend_isEqualToString_(v3, v50, @"zoneNotFound"))
  {
    int v6 = 48;
  }
  else if (objc_msgSend_isEqualToString_(v3, v51, @"invalidBundleId"))
  {
    int v6 = 49;
  }
  else if (objc_msgSend_isEqualToString_(v3, v52, @"unsupportedDevice"))
  {
    int v6 = 50;
  }
  else if (objc_msgSend_isEqualToString_(v3, v53, @"blocklisted"))
  {
    int v6 = 51;
  }
  else if (objc_msgSend_isEqualToString_(v3, v54, @"recordProtectionInfoTagMismatch"))
  {
    int v6 = 52;
  }
  else if (objc_msgSend_isEqualToString_(v3, v55, @"zoneProtectionInfoTagMismatch"))
  {
    int v6 = 53;
  }
  else if (objc_msgSend_isEqualToString_(v3, v56, @"assetSizeLimitExceeded"))
  {
    int v6 = 54;
  }
  else if (objc_msgSend_isEqualToString_(v3, v57, @"batchOperationLimitExceeded"))
  {
    int v6 = 55;
  }
  else if (objc_msgSend_isEqualToString_(v3, v58, @"requestSizeLimitExceeded"))
  {
    int v6 = 56;
  }
  else if (objc_msgSend_isEqualToString_(v3, v59, @"recordSizeLimitExceeded"))
  {
    int v6 = 57;
  }
  else if (objc_msgSend_isEqualToString_(v3, v60, @"databaseCommitSizeExceeded"))
  {
    int v6 = 58;
  }
  else if (objc_msgSend_isEqualToString_(v3, v61, @"userDeletedDataForZone"))
  {
    int v6 = 59;
  }
  else if (objc_msgSend_isEqualToString_(v3, v62, @"staleRecordUpdate"))
  {
    int v6 = 60;
  }
  else if (objc_msgSend_isEqualToString_(v3, v63, @"shareParticipantLimitExceeded"))
  {
    int v6 = 61;
  }
  else if (objc_msgSend_isEqualToString_(v3, v64, @"shareParticipantError"))
  {
    int v6 = 62;
  }
  else if (objc_msgSend_isEqualToString_(v3, v65, @"pcsChainingError"))
  {
    int v6 = 64;
  }
  else if (objc_msgSend_isEqualToString_(v3, v66, @"hierarchyAlreadyHasShare"))
  {
    int v6 = 65;
  }
  else if (objc_msgSend_isEqualToString_(v3, v67, @"u13Restricted"))
  {
    int v6 = 66;
  }
  else if (objc_msgSend_isEqualToString_(v3, v68, @"managedAppleIdRestricted"))
  {
    int v6 = 67;
  }
  else if (objc_msgSend_isEqualToString_(v3, v69, @"shareParticipantContactError"))
  {
    int v6 = 68;
  }
  else if (objc_msgSend_isEqualToString_(v3, v70, @"recordArchived"))
  {
    int v6 = 69;
  }
  else if (objc_msgSend_isEqualToString_(v3, v71, @"databaseAccessDenied"))
  {
    int v6 = 70;
  }
  else if (objc_msgSend_isEqualToString_(v3, v72, @"parentHierarchyDepthLimitExceeded"))
  {
    int v6 = 71;
  }
  else if (objc_msgSend_isEqualToString_(v3, v73, @"zonePcsUserIdentityUnknown"))
  {
    int v6 = 72;
  }
  else if (objc_msgSend_isEqualToString_(v3, v74, @"managedAppleIdBackupBlocked"))
  {
    int v6 = 73;
  }
  else if (objc_msgSend_isEqualToString_(v3, v75, @"outOfNetworkUsersUnsupported"))
  {
    int v6 = 75;
  }
  else if (objc_msgSend_isEqualToString_(v3, v76, @"gameAssignmentNotFound"))
  {
    int v6 = 76;
  }
  else if (objc_msgSend_isEqualToString_(v3, v77, @"queryBeginsWithValueLengthLimitExceeded"))
  {
    int v6 = 77;
  }
  else if (objc_msgSend_isEqualToString_(v3, v78, @"userResetEncryptedData"))
  {
    int v6 = 78;
  }
  else if (objc_msgSend_isEqualToString_(v3, v79, @"mergeableValueNotFound"))
  {
    int v6 = 79;
  }
  else if (objc_msgSend_isEqualToString_(v3, v80, @"invalidPublicKey"))
  {
    int v6 = 80;
  }
  else if (objc_msgSend_isEqualToString_(v3, v81, @"mergeableDeltaSizeLimitExceeded"))
  {
    int v6 = 81;
  }
  else if (objc_msgSend_isEqualToString_(v3, v82, @"mergeableDeltaNotFound"))
  {
    int v6 = 82;
  }
  else if (objc_msgSend_isEqualToString_(v3, v83, @"mergeableDeltaInvalid"))
  {
    int v6 = 83;
  }
  else if (objc_msgSend_isEqualToString_(v3, v84, @"mergeableValueCompactionRequired"))
  {
    int v6 = 84;
  }
  else if (objc_msgSend_isEqualToString_(v3, v85, @"unprovisionedICloudAccount"))
  {
    int v6 = 85;
  }
  else if (objc_msgSend_isEqualToString_(v3, v86, @"purgedICloudAccount"))
  {
    int v6 = 86;
  }
  else if (objc_msgSend_isEqualToString_(v3, v87, @"invalidDsidForICloudAccount"))
  {
    int v6 = 87;
  }
  else if (objc_msgSend_isEqualToString_(v3, v88, @"shareRegionUnsupported"))
  {
    int v6 = 88;
  }
  else if (objc_msgSend_isEqualToString_(v3, v89, @"a2aSignatureValidationError"))
  {
    int v6 = 89;
  }
  else if (objc_msgSend_isEqualToString_(v3, v90, @"participantIdMismatch"))
  {
    int v6 = 90;
  }
  else if (objc_msgSend_isEqualToString_(v3, v91, @"groupKitSignatureValidationError"))
  {
    int v6 = 94;
  }
  else if (objc_msgSend_isEqualToString_(v3, v92, @"shareRequestAccessError"))
  {
    int v6 = 95;
  }
  else if (objc_msgSend_isEqualToString_(v3, v93, @"shareRequestAccessLimitExceeded"))
  {
    int v6 = 96;
  }
  else if (objc_msgSend_isEqualToString_(v3, v94, @"shareRequestAccessShareAcceptRequired"))
  {
    int v6 = 97;
  }
  else if (objc_msgSend_isEqualToString_(v3, v95, @"shareBlockedUserCanNotBeParticipant"))
  {
    int v6 = 98;
  }
  else if (objc_msgSend_isEqualToString_(v3, v96, @"shareBlockedLimitExceeded"))
  {
    int v6 = 100;
  }
  else if (objc_msgSend_isEqualToString_(v3, v97, @"zoneAncestryOpLockFailure"))
  {
    int v6 = 101;
  }
  else if (objc_msgSend_isEqualToString_(v3, v98, @"invalidTimestamp"))
  {
    int v6 = 102;
  }
  else if (objc_msgSend_isEqualToString_(v3, v99, @"invalidSignature"))
  {
    int v6 = 103;
  }
  else if (objc_msgSend_isEqualToString_(v3, v100, @"unsupportedSigningIdentity"))
  {
    int v6 = 104;
  }
  else if (objc_msgSend_isEqualToString_(v3, v101, @"invalidSignedBlob"))
  {
    int v6 = 105;
  }
  else if (objc_msgSend_isEqualToString_(v3, v102, @"unsupportedVersion"))
  {
    int v6 = 106;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorClient;
  v4 = [(CKDPResponseOperationResultErrorClient *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = @"unknown";
    switch(self->_type)
    {
      case 1:
        goto LABEL_101;
      case 2:
        v7 = @"expiredAppConfig";
        objc_msgSend_setObject_forKey_(v6, v4, @"expiredAppConfig", @"type");
        break;
      case 3:
        v7 = @"expiredGlobalConfig";
        objc_msgSend_setObject_forKey_(v6, v4, @"expiredGlobalConfig", @"type");
        break;
      case 4:
        v7 = @"badSyntax";
        objc_msgSend_setObject_forKey_(v6, v4, @"badSyntax", @"type");
        break;
      case 5:
        v7 = @"forbidden";
        objc_msgSend_setObject_forKey_(v6, v4, @"forbidden", @"type");
        break;
      case 6:
        v7 = @"throttled";
        objc_msgSend_setObject_forKey_(v6, v4, @"throttled", @"type");
        break;
      case 7:
        v7 = @"refused";
        objc_msgSend_setObject_forKey_(v6, v4, @"refused", @"type");
        break;
      case 8:
        v7 = @"notSupported";
        objc_msgSend_setObject_forKey_(v6, v4, @"notSupported", @"type");
        break;
      case 9:
        v7 = @"exists";
        objc_msgSend_setObject_forKey_(v6, v4, @"exists", @"type");
        break;
      case 0xA:
        v7 = @"requestAlreadyProcessed";
        objc_msgSend_setObject_forKey_(v6, v4, @"requestAlreadyProcessed", @"type");
        break;
      case 0xB:
        v7 = @"badAuthToken";
        objc_msgSend_setObject_forKey_(v6, v4, @"badAuthToken", @"type");
        break;
      case 0xC:
        v7 = @"needsAuthentication";
        objc_msgSend_setObject_forKey_(v6, v4, @"needsAuthentication", @"type");
        break;
      case 0xD:
        v7 = @"mescalSignatureMissing";
        objc_msgSend_setObject_forKey_(v6, v4, @"mescalSignatureMissing", @"type");
        break;
      case 0xE:
        v7 = @"invalidMescalSignature";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidMescalSignature", @"type");
        break;
      case 0xF:
        v7 = @"opLockFailure";
        objc_msgSend_setObject_forKey_(v6, v4, @"opLockFailure", @"type");
        break;
      case 0x10:
        v7 = @"atomicFailure";
        objc_msgSend_setObject_forKey_(v6, v4, @"atomicFailure", @"type");
        break;
      case 0x11:
        v7 = @"resetNeeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"resetNeeded", @"type");
        break;
      case 0x12:
        v7 = @"fieldsPerTypeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"fieldsPerTypeLimitExceeded", @"type");
        break;
      case 0x13:
        v7 = @"typeBusy";
        objc_msgSend_setObject_forKey_(v6, v4, @"typeBusy", @"type");
        break;
      case 0x14:
        v7 = @"numRecordTypesLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"numRecordTypesLimitExceeded", @"type");
        break;
      case 0x15:
        v7 = @"invalidContainer";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidContainer", @"type");
        break;
      case 0x16:
        v7 = @"invalidRecordTypeName";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidRecordTypeName", @"type");
        break;
      case 0x17:
        v7 = @"invalidFieldName";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidFieldName", @"type");
        break;
      case 0x18:
        v7 = @"invalidFieldValue";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidFieldValue", @"type");
        break;
      case 0x19:
        v7 = @"invalidIdentifier";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidIdentifier", @"type");
        break;
      case 0x1A:
        v7 = @"fieldNotQueryable";
        objc_msgSend_setObject_forKey_(v6, v4, @"fieldNotQueryable", @"type");
        break;
      case 0x1B:
        v7 = @"fieldNotSortable";
        objc_msgSend_setObject_forKey_(v6, v4, @"fieldNotSortable", @"type");
        break;
      case 0x1C:
        v7 = @"queryFilterLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"queryFilterLimitExceeded", @"type");
        break;
      case 0x1D:
        v7 = @"queryFilterValuesLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"queryFilterValuesLimitExceeded", @"type");
        break;
      case 0x1E:
        v7 = @"membershipQueryLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"membershipQueryLimitExceeded", @"type");
        break;
      case 0x1F:
        v7 = @"notificationAdditionalFieldLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"notificationAdditionalFieldLimitExceeded", @"type");
        break;
      case 0x20:
        v7 = @"notificationAdditionalFieldInvalidType";
        objc_msgSend_setObject_forKey_(v6, v4, @"notificationAdditionalFieldInvalidType", @"type");
        break;
      case 0x21:
        v7 = @"subscriptionLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"subscriptionLimitExceeded", @"type");
        break;
      case 0x22:
        v7 = @"uniqueTriggerLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"uniqueTriggerLimitExceeded", @"type");
        break;
      case 0x23:
        v7 = @"triggerSubscriptionBindingTypeMismatch";
        objc_msgSend_setObject_forKey_(v6, v4, @"triggerSubscriptionBindingTypeMismatch", @"type");
        break;
      case 0x24:
        v7 = @"zoneSizeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"zoneSizeLimitExceeded", @"type");
        break;
      case 0x25:
        v7 = @"zoneCountLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"zoneCountLimitExceeded", @"type");
        break;
      case 0x26:
        v7 = @"uniqueFieldFailure";
        objc_msgSend_setObject_forKey_(v6, v4, @"uniqueFieldFailure", @"type");
        break;
      case 0x27:
        v7 = @"validatingReferenceError";
        objc_msgSend_setObject_forKey_(v6, v4, @"validatingReferenceError", @"type");
        break;
      case 0x28:
        v7 = @"fullResetNeeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"fullResetNeeded", @"type");
        break;
      case 0x29:
        v7 = @"alreadyShared";
        objc_msgSend_setObject_forKey_(v6, v4, @"alreadyShared", @"type");
        break;
      case 0x2A:
        v7 = @"emailOutOfNetwork";
        objc_msgSend_setObject_forKey_(v6, v4, @"emailOutOfNetwork", @"type");
        break;
      case 0x2B:
        v7 = @"duplicateSubscription";
        objc_msgSend_setObject_forKey_(v6, v4, @"duplicateSubscription", @"type");
        break;
      case 0x2E:
        v7 = @"expiredPutReceipt";
        objc_msgSend_setObject_forKey_(v6, v4, @"expiredPutReceipt", @"type");
        break;
      case 0x2F:
        v7 = @"quotaExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"quotaExceeded", @"type");
        break;
      case 0x30:
        v7 = @"zoneNotFound";
        objc_msgSend_setObject_forKey_(v6, v4, @"zoneNotFound", @"type");
        break;
      case 0x31:
        v7 = @"invalidBundleId";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidBundleId", @"type");
        break;
      case 0x32:
        v7 = @"unsupportedDevice";
        objc_msgSend_setObject_forKey_(v6, v4, @"unsupportedDevice", @"type");
        break;
      case 0x33:
        v7 = @"blocklisted";
        objc_msgSend_setObject_forKey_(v6, v4, @"blocklisted", @"type");
        break;
      case 0x34:
        v7 = @"recordProtectionInfoTagMismatch";
        objc_msgSend_setObject_forKey_(v6, v4, @"recordProtectionInfoTagMismatch", @"type");
        break;
      case 0x35:
        v7 = @"zoneProtectionInfoTagMismatch";
        objc_msgSend_setObject_forKey_(v6, v4, @"zoneProtectionInfoTagMismatch", @"type");
        break;
      case 0x36:
        v7 = @"assetSizeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"assetSizeLimitExceeded", @"type");
        break;
      case 0x37:
        v7 = @"batchOperationLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"batchOperationLimitExceeded", @"type");
        break;
      case 0x38:
        v7 = @"requestSizeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"requestSizeLimitExceeded", @"type");
        break;
      case 0x39:
        v7 = @"recordSizeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"recordSizeLimitExceeded", @"type");
        break;
      case 0x3A:
        v7 = @"databaseCommitSizeExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"databaseCommitSizeExceeded", @"type");
        break;
      case 0x3B:
        v7 = @"userDeletedDataForZone";
        objc_msgSend_setObject_forKey_(v6, v4, @"userDeletedDataForZone", @"type");
        break;
      case 0x3C:
        v7 = @"staleRecordUpdate";
        objc_msgSend_setObject_forKey_(v6, v4, @"staleRecordUpdate", @"type");
        break;
      case 0x3D:
        v7 = @"shareParticipantLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareParticipantLimitExceeded", @"type");
        break;
      case 0x3E:
        v7 = @"shareParticipantError";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareParticipantError", @"type");
        break;
      case 0x40:
        v7 = @"pcsChainingError";
        objc_msgSend_setObject_forKey_(v6, v4, @"pcsChainingError", @"type");
        break;
      case 0x41:
        v7 = @"hierarchyAlreadyHasShare";
        objc_msgSend_setObject_forKey_(v6, v4, @"hierarchyAlreadyHasShare", @"type");
        break;
      case 0x42:
        v7 = @"u13Restricted";
        objc_msgSend_setObject_forKey_(v6, v4, @"u13Restricted", @"type");
        break;
      case 0x43:
        v7 = @"managedAppleIdRestricted";
        objc_msgSend_setObject_forKey_(v6, v4, @"managedAppleIdRestricted", @"type");
        break;
      case 0x44:
        v7 = @"shareParticipantContactError";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareParticipantContactError", @"type");
        break;
      case 0x45:
        v7 = @"recordArchived";
        objc_msgSend_setObject_forKey_(v6, v4, @"recordArchived", @"type");
        break;
      case 0x46:
        v7 = @"databaseAccessDenied";
        objc_msgSend_setObject_forKey_(v6, v4, @"databaseAccessDenied", @"type");
        break;
      case 0x47:
        v7 = @"parentHierarchyDepthLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"parentHierarchyDepthLimitExceeded", @"type");
        break;
      case 0x48:
        v7 = @"zonePcsUserIdentityUnknown";
        objc_msgSend_setObject_forKey_(v6, v4, @"zonePcsUserIdentityUnknown", @"type");
        break;
      case 0x49:
        v7 = @"managedAppleIdBackupBlocked";
        objc_msgSend_setObject_forKey_(v6, v4, @"managedAppleIdBackupBlocked", @"type");
        break;
      case 0x4B:
        v7 = @"outOfNetworkUsersUnsupported";
        objc_msgSend_setObject_forKey_(v6, v4, @"outOfNetworkUsersUnsupported", @"type");
        break;
      case 0x4C:
        v7 = @"gameAssignmentNotFound";
        objc_msgSend_setObject_forKey_(v6, v4, @"gameAssignmentNotFound", @"type");
        break;
      case 0x4D:
        v7 = @"queryBeginsWithValueLengthLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"queryBeginsWithValueLengthLimitExceeded", @"type");
        break;
      case 0x4E:
        v7 = @"userResetEncryptedData";
        objc_msgSend_setObject_forKey_(v6, v4, @"userResetEncryptedData", @"type");
        break;
      case 0x4F:
        v7 = @"mergeableValueNotFound";
        objc_msgSend_setObject_forKey_(v6, v4, @"mergeableValueNotFound", @"type");
        break;
      case 0x50:
        v7 = @"invalidPublicKey";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidPublicKey", @"type");
        break;
      case 0x51:
        v7 = @"mergeableDeltaSizeLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"mergeableDeltaSizeLimitExceeded", @"type");
        break;
      case 0x52:
        v7 = @"mergeableDeltaNotFound";
        objc_msgSend_setObject_forKey_(v6, v4, @"mergeableDeltaNotFound", @"type");
        break;
      case 0x53:
        v7 = @"mergeableDeltaInvalid";
        objc_msgSend_setObject_forKey_(v6, v4, @"mergeableDeltaInvalid", @"type");
        break;
      case 0x54:
        v7 = @"mergeableValueCompactionRequired";
        objc_msgSend_setObject_forKey_(v6, v4, @"mergeableValueCompactionRequired", @"type");
        break;
      case 0x55:
        v7 = @"unprovisionedICloudAccount";
        objc_msgSend_setObject_forKey_(v6, v4, @"unprovisionedICloudAccount", @"type");
        break;
      case 0x56:
        v7 = @"purgedICloudAccount";
        objc_msgSend_setObject_forKey_(v6, v4, @"purgedICloudAccount", @"type");
        break;
      case 0x57:
        v7 = @"invalidDsidForICloudAccount";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidDsidForICloudAccount", @"type");
        break;
      case 0x58:
        v7 = @"shareRegionUnsupported";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareRegionUnsupported", @"type");
        break;
      case 0x59:
        v7 = @"a2aSignatureValidationError";
        objc_msgSend_setObject_forKey_(v6, v4, @"a2aSignatureValidationError", @"type");
        break;
      case 0x5A:
        v7 = @"participantIdMismatch";
        objc_msgSend_setObject_forKey_(v6, v4, @"participantIdMismatch", @"type");
        break;
      case 0x5E:
        v7 = @"groupKitSignatureValidationError";
        objc_msgSend_setObject_forKey_(v6, v4, @"groupKitSignatureValidationError", @"type");
        break;
      case 0x5F:
        v7 = @"shareRequestAccessError";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareRequestAccessError", @"type");
        break;
      case 0x60:
        v7 = @"shareRequestAccessLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareRequestAccessLimitExceeded", @"type");
        break;
      case 0x61:
        v7 = @"shareRequestAccessShareAcceptRequired";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareRequestAccessShareAcceptRequired", @"type");
        break;
      case 0x62:
        v7 = @"shareBlockedUserCanNotBeParticipant";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareBlockedUserCanNotBeParticipant", @"type");
        break;
      case 0x64:
        v7 = @"shareBlockedLimitExceeded";
        objc_msgSend_setObject_forKey_(v6, v4, @"shareBlockedLimitExceeded", @"type");
        break;
      case 0x65:
        v7 = @"zoneAncestryOpLockFailure";
        objc_msgSend_setObject_forKey_(v6, v4, @"zoneAncestryOpLockFailure", @"type");
        break;
      case 0x66:
        v7 = @"invalidTimestamp";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidTimestamp", @"type");
        break;
      case 0x67:
        v7 = @"invalidSignature";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidSignature", @"type");
        break;
      case 0x68:
        v7 = @"unsupportedSigningIdentity";
        objc_msgSend_setObject_forKey_(v6, v4, @"unsupportedSigningIdentity", @"type");
        break;
      case 0x69:
        v7 = @"invalidSignedBlob";
        objc_msgSend_setObject_forKey_(v6, v4, @"invalidSignedBlob", @"type");
        break;
      case 0x6A:
        v7 = @"unsupportedVersion";
LABEL_101:
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v7, @"type");
        break;
      default:
        objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"type");
        break;
    }
  }
  oplockFailure = self->_oplockFailure;
  if (oplockFailure)
  {
    v10 = objc_msgSend_dictionaryRepresentation(oplockFailure, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"oplockFailure");
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    v13 = objc_msgSend_dictionaryRepresentation(uniqueFieldFailure, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"uniqueFieldFailure");
  }
  moveOplockFailure = self->_moveOplockFailure;
  if (moveOplockFailure)
  {
    v16 = objc_msgSend_dictionaryRepresentation(moveOplockFailure, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"moveOplockFailure");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorClientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_oplockFailure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uniqueFieldFailure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_moveOplockFailure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  oplockFailure = self->_oplockFailure;
  v9 = v4;
  if (oplockFailure)
  {
    objc_msgSend_setOplockFailure_(v4, v5, (uint64_t)oplockFailure);
    id v4 = v9;
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    objc_msgSend_setUniqueFieldFailure_(v9, v5, (uint64_t)uniqueFieldFailure);
    id v4 = v9;
  }
  moveOplockFailure = self->_moveOplockFailure;
  if (moveOplockFailure)
  {
    objc_msgSend_setMoveOplockFailure_(v9, v5, (uint64_t)moveOplockFailure);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_type;
    *(unsigned char *)(v10 + 40) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_oplockFailure, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_uniqueFieldFailure, v15, (uint64_t)a3);
  v17 = (void *)v12[4];
  v12[4] = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_moveOplockFailure, v18, (uint64_t)a3);
  v20 = (void *)v12[1];
  v12[1] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (v4[5])
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  oplockFailure = self->_oplockFailure;
  uint64_t v9 = v4[2];
  if ((unint64_t)oplockFailure | v9 && !objc_msgSend_isEqual_(oplockFailure, v7, v9)) {
    goto LABEL_13;
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  uint64_t v11 = v4[4];
  if ((unint64_t)uniqueFieldFailure | v11)
  {
    if (!objc_msgSend_isEqual_(uniqueFieldFailure, v7, v11)) {
      goto LABEL_13;
    }
  }
  moveOplockFailure = self->_moveOplockFailure;
  uint64_t v13 = v4[1];
  if ((unint64_t)moveOplockFailure | v13) {
    char isEqual = objc_msgSend_isEqual_(moveOplockFailure, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_oplockFailure, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_uniqueFieldFailure, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_moveOplockFailure, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[10])
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  oplockFailure = self->_oplockFailure;
  uint64_t v7 = v5[2];
  v12 = v5;
  if (oplockFailure)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(oplockFailure, (const char *)v5, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setOplockFailure_(self, (const char *)v5, v7);
  }
  uint64_t v5 = v12;
LABEL_9:
  uniqueFieldFailure = self->_uniqueFieldFailure;
  uint64_t v9 = v5[4];
  if (uniqueFieldFailure)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(uniqueFieldFailure, (const char *)v5, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setUniqueFieldFailure_(self, (const char *)v5, v9);
  }
  uint64_t v5 = v12;
LABEL_15:
  moveOplockFailure = self->_moveOplockFailure;
  uint64_t v11 = v5[1];
  if (moveOplockFailure)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(moveOplockFailure, (const char *)v5, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setMoveOplockFailure_(self, (const char *)v5, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueFieldFailure, 0);
  objc_storeStrong((id *)&self->_oplockFailure, 0);
  objc_storeStrong((id *)&self->_moveOplockFailure, 0);
}

- (BOOL)hasOplockFailure
{
  return self->_oplockFailure != 0;
}

- (CKDPOplockFailure)oplockFailure
{
  return self->_oplockFailure;
}

- (void)setOplockFailure:(id)a3
{
}

- (BOOL)hasUniqueFieldFailure
{
  return self->_uniqueFieldFailure != 0;
}

- (CKDPUniqueFieldFailure)uniqueFieldFailure
{
  return self->_uniqueFieldFailure;
}

- (void)setUniqueFieldFailure:(id)a3
{
}

- (BOOL)hasMoveOplockFailure
{
  return self->_moveOplockFailure != 0;
}

- (CKDPMoveOplockFailure)moveOplockFailure
{
  return self->_moveOplockFailure;
}

- (void)setMoveOplockFailure:(id)a3
{
}

- (id)_typeCKLogValue
{
  uint64_t v4 = objc_msgSend_type(self, a2, v2);
  uint64_t v5 = @"unknown";
  switch((int)v4)
  {
    case 1:
      break;
    case 2:
      uint64_t v5 = @"expiredAppConfig";
      break;
    case 3:
      uint64_t v5 = @"expiredGlobalConfig";
      break;
    case 4:
      uint64_t v5 = @"badSyntax";
      break;
    case 5:
      uint64_t v5 = @"forbidden";
      break;
    case 6:
      uint64_t v5 = @"throttled";
      break;
    case 7:
      uint64_t v5 = @"refused";
      break;
    case 8:
      uint64_t v5 = @"notSupported";
      break;
    case 9:
      uint64_t v5 = @"exists";
      break;
    case 10:
      uint64_t v5 = @"requestAlreadyProcessed";
      break;
    case 11:
      uint64_t v5 = @"badAuthToken";
      break;
    case 12:
      uint64_t v5 = @"needsAuthentication";
      break;
    case 13:
      uint64_t v5 = @"mescalSignatureMissing";
      break;
    case 14:
      uint64_t v5 = @"invalidMescalSignature";
      break;
    case 15:
      uint64_t v5 = @"opLockFailure";
      break;
    case 16:
      uint64_t v5 = @"atomicFailure";
      break;
    case 17:
      uint64_t v5 = @"resetNeeded";
      break;
    case 18:
      uint64_t v5 = @"fieldsPerTypeLimitExceeded";
      break;
    case 19:
      uint64_t v5 = @"typeBusy";
      break;
    case 20:
      uint64_t v5 = @"numRecordTypesLimitExceeded";
      break;
    case 21:
      uint64_t v5 = @"invalidContainer";
      break;
    case 22:
      uint64_t v5 = @"invalidRecordTypeName";
      break;
    case 23:
      uint64_t v5 = @"invalidFieldName";
      break;
    case 24:
      uint64_t v5 = @"invalidFieldValue";
      break;
    case 25:
      uint64_t v5 = @"invalidIdentifier";
      break;
    case 26:
      uint64_t v5 = @"fieldNotQueryable";
      break;
    case 27:
      uint64_t v5 = @"fieldNotSortable";
      break;
    case 28:
      uint64_t v5 = @"queryFilterLimitExceeded";
      break;
    case 29:
      uint64_t v5 = @"queryFilterValuesLimitExceeded";
      break;
    case 30:
      uint64_t v5 = @"membershipQueryLimitExceeded";
      break;
    case 31:
      uint64_t v5 = @"notificationAdditionalFieldLimitExceeded";
      break;
    case 32:
      uint64_t v5 = @"notificationAdditionalFieldInvalidType";
      break;
    case 33:
      uint64_t v5 = @"subscriptionLimitExceeded";
      break;
    case 34:
      uint64_t v5 = @"uniqueTriggerLimitExceeded";
      break;
    case 35:
      uint64_t v5 = @"triggerSubscriptionBindingTypeMismatch";
      break;
    case 36:
      uint64_t v5 = @"zoneSizeLimitExceeded";
      break;
    case 37:
      uint64_t v5 = @"zoneCountLimitExceeded";
      break;
    case 38:
      uint64_t v5 = @"uniqueFieldFailure";
      break;
    case 39:
      uint64_t v5 = @"validatingReferenceError";
      break;
    case 40:
      uint64_t v5 = @"fullResetNeeded";
      break;
    case 41:
      uint64_t v5 = @"alreadyShared";
      break;
    case 42:
      uint64_t v5 = @"emailOutOfNetwork";
      break;
    case 43:
      uint64_t v5 = @"duplicateSubscription";
      break;
    case 46:
      uint64_t v5 = @"expiredPutReceipt";
      break;
    case 47:
      uint64_t v5 = @"quotaExceeded";
      break;
    case 48:
      uint64_t v5 = @"zoneNotFound";
      break;
    case 49:
      uint64_t v5 = @"invalidBundleId";
      break;
    case 50:
      uint64_t v5 = @"unsupportedDevice";
      break;
    case 51:
      uint64_t v5 = @"blocklisted";
      break;
    case 52:
      uint64_t v5 = @"recordProtectionInfoTagMismatch";
      break;
    case 53:
      uint64_t v5 = @"zoneProtectionInfoTagMismatch";
      break;
    case 54:
      uint64_t v5 = @"assetSizeLimitExceeded";
      break;
    case 55:
      uint64_t v5 = @"batchOperationLimitExceeded";
      break;
    case 56:
      uint64_t v5 = @"requestSizeLimitExceeded";
      break;
    case 57:
      uint64_t v5 = @"recordSizeLimitExceeded";
      break;
    case 58:
      uint64_t v5 = @"databaseCommitSizeExceeded";
      break;
    case 59:
      uint64_t v5 = @"userDeletedDataForZone";
      break;
    case 60:
      uint64_t v5 = @"staleRecordUpdate";
      break;
    case 61:
      uint64_t v5 = @"shareParticipantLimitExceeded";
      break;
    case 62:
      uint64_t v5 = @"shareParticipantError";
      break;
    case 64:
      uint64_t v5 = @"pcsChainingError";
      break;
    case 65:
      uint64_t v5 = @"hierarchyAlreadyHasShare";
      break;
    case 66:
      uint64_t v5 = @"u13Restricted";
      break;
    case 67:
      uint64_t v5 = @"managedAppleIdRestricted";
      break;
    case 68:
      uint64_t v5 = @"shareParticipantContactError";
      break;
    case 69:
      uint64_t v5 = @"recordArchived";
      break;
    case 70:
      uint64_t v5 = @"databaseAccessDenied";
      break;
    case 71:
      uint64_t v5 = @"parentHierarchyDepthLimitExceeded";
      break;
    case 72:
      uint64_t v5 = @"zonePcsUserIdentityUnknown";
      break;
    case 73:
      uint64_t v5 = @"managedAppleIdBackupBlocked";
      break;
    case 75:
      uint64_t v5 = @"outOfNetworkUsersUnsupported";
      break;
    case 76:
      uint64_t v5 = @"gameAssignmentNotFound";
      break;
    case 77:
      uint64_t v5 = @"queryBeginsWithValueLengthLimitExceeded";
      break;
    case 78:
      uint64_t v5 = @"userResetEncryptedData";
      break;
    case 79:
      uint64_t v5 = @"mergeableValueNotFound";
      break;
    case 80:
      uint64_t v5 = @"invalidPublicKey";
      break;
    case 81:
      uint64_t v5 = @"mergeableDeltaSizeLimitExceeded";
      break;
    case 82:
      uint64_t v5 = @"mergeableDeltaNotFound";
      break;
    case 83:
      uint64_t v5 = @"mergeableDeltaInvalid";
      break;
    case 84:
      uint64_t v5 = @"mergeableValueCompactionRequired";
      break;
    case 85:
      uint64_t v5 = @"unprovisionedICloudAccount";
      break;
    case 86:
      uint64_t v5 = @"purgedICloudAccount";
      break;
    case 87:
      uint64_t v5 = @"invalidDsidForICloudAccount";
      break;
    case 88:
      uint64_t v5 = @"shareRegionUnsupported";
      break;
    case 89:
      uint64_t v5 = @"a2aSignatureValidationError";
      break;
    case 90:
      uint64_t v5 = @"participantIdMismatch";
      break;
    case 94:
      uint64_t v5 = @"groupKitSignatureValidationError";
      break;
    case 95:
      uint64_t v5 = @"shareRequestAccessError";
      break;
    case 96:
      uint64_t v5 = @"shareRequestAccessLimitExceeded";
      break;
    case 97:
      uint64_t v5 = @"shareRequestAccessShareAcceptRequired";
      break;
    case 98:
      uint64_t v5 = @"shareBlockedUserCanNotBeParticipant";
      break;
    case 100:
      uint64_t v5 = @"shareBlockedLimitExceeded";
      break;
    case 101:
      uint64_t v5 = @"zoneAncestryOpLockFailure";
      break;
    case 102:
      uint64_t v5 = @"invalidTimestamp";
      break;
    case 103:
      uint64_t v5 = @"invalidSignature";
      break;
    case 104:
      uint64_t v5 = @"unsupportedSigningIdentity";
      break;
    case 105:
      uint64_t v5 = @"invalidSignedBlob";
      break;
    case 106:
      uint64_t v5 = @"unsupportedVersion";
      break;
    default:
      objc_msgSend_stringWithFormat_(NSString, v3, @"(unknown: %i)", v4);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

@end
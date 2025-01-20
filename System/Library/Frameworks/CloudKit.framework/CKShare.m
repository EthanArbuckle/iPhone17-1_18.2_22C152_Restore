@interface CKShare
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_existingParticipantReferencedByUserIdentities:(id)a3;
- (BOOL)_participantArray:(id)a3 containsEquivalentWithPermissionsParticipant:(id)a4;
- (BOOL)_participantArray:(id)a3 isEquivalentToArray:(id)a4;
- (BOOL)_userIdentityLookupInfoHasSingleIdentifier:(id)a3;
- (BOOL)accessRequestsEnabled;
- (BOOL)allNonOwnerParticipantsHavePermission:(int64_t)a3;
- (BOOL)allNonOwnerParticipantsHaveRole:(int64_t)a3;
- (BOOL)allowsAnonymousPublicAccess;
- (BOOL)allowsReadOnlyParticipantsToSeeEachOther;
- (BOOL)blockRequesters:(id)a3 error:(id *)a4;
- (BOOL)blockUserIdentities:(id)a3 error:(id *)a4;
- (BOOL)blockUserIdentityLookupInfos:(id)a3 error:(id *)a4;
- (BOOL)encodeAllowsReadOnlyParticipantsToSeeEachOther;
- (BOOL)hasEncryptedData;
- (BOOL)hasModifiedEncryptedData;
- (BOOL)hasModifiedPropertiesRequiringEncryption;
- (BOOL)hasPropertiesRequiringDecryption;
- (BOOL)hasPropertiesRequiringEncryption;
- (BOOL)isCurrentUserOwnerOrAdmin;
- (BOOL)isZoneWideShare;
- (BOOL)serializePersonalInfo;
- (CKRecordID)rootRecordID;
- (CKShare)init;
- (CKShare)initWithCoder:(NSCoder *)aDecoder;
- (CKShare)initWithRecordType:(CKRecordType)recordType;
- (CKShare)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID;
- (CKShare)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID;
- (CKShare)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID;
- (CKShare)initWithRootRecord:(CKRecord *)rootRecord;
- (CKShare)initWithRootRecord:(CKRecord *)rootRecord shareID:(CKRecordID *)shareID;
- (CKShareID)shareID;
- (CKShareParticipant)currentUserParticipant;
- (CKShareParticipant)owner;
- (CKShareParticipantPermission)publicPermission;
- (NSArray)approvedRequesters;
- (NSArray)blockedIdentities;
- (NSArray)invitedKeysToRemove;
- (NSArray)participants;
- (NSArray)requesters;
- (NSData)invitedProtectionData;
- (NSData)publicProtectionData;
- (NSData)publicSharingIdentity;
- (NSMutableArray)lastFetchedParticipants;
- (NSMutableArray)mutableAllParticipants;
- (NSMutableArray)mutableApprovedRequesters;
- (NSMutableArray)mutableBlockedIdentities;
- (NSMutableArray)mutableRequesters;
- (NSMutableDictionary)oneTimeURLMetadatasByParticipantID;
- (NSMutableSet)addedParticipantIDs;
- (NSMutableSet)removedParticipantIDs;
- (NSString)description;
- (NSString)invitedProtectionEtag;
- (NSString)previousInvitedProtectionEtag;
- (NSString)previousPublicProtectionEtag;
- (NSString)publicProtectionEtag;
- (id)_copyWithoutPersonalInfo;
- (id)_existingRequestersForUserIdentities:(id)a3;
- (id)_knownParticipantEqualToParticipant:(id)a3;
- (id)_knownParticipantEqualToParticipant:(id)a3 inParticipants:(id)a4;
- (id)_knownParticipantWithParticipantID:(id)a3;
- (id)addedParticipants;
- (id)allParticipants;
- (id)copyWithOriginalValues;
- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4;
- (id)encryptedPublicSharingKey;
- (id)initInternalWithShareRecordID:(id)a3;
- (id)lookupInfosFromRequesters:(id)a3;
- (id)oneTimeURLForParticipantID:(id)a3;
- (id)redactedDescription;
- (id)removedParticipants;
- (id)updateFromServerShare:(id)a3;
- (int64_t)_indexForIdentity:(id)a3 matchingAnyInCollection:(id)a4;
- (int64_t)participantSelfRemovalBehavior;
- (int64_t)participantVisibility;
- (void)CKAssignToContainerWithID:(id)a3;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_addOwnerParticipant;
- (void)_addParticipantBypassingChecks:(id)a3;
- (void)_addParticipantEmails:(id)a3 phoneNumbers:(id)a4 asReadWrite:(BOOL)a5 inContainer:(id)a6 completionHandler:(id)a7;
- (void)_commonCKShareInit;
- (void)_getDecryptedShareInContainer:(id)a3 completionHandler:(id)a4;
- (void)_removeAllNonOneTimeLinkParticipants;
- (void)_removeNonOneTimeLinkPendingPrivateAndAdminParticipants;
- (void)_removeParticipantBypassingChecks:(id)a3;
- (void)_setPublicPermissionNoSideEffects:(int64_t)a3;
- (void)_stripPersonalInfo;
- (void)_unblockIdentitiesReferencedByParticipant:(id)a3;
- (void)addParticipant:(CKShareParticipant *)participant;
- (void)approveRequesters:(id)a3 inContainer:(id)a4 completionHandler:(id)a5;
- (void)approveRequesters:(id)a3 inContainer:(id)a4 withPermission:(int64_t)a5 asRole:(int64_t)a6 completionHandler:(id)a7;
- (void)clearModifiedParticipants;
- (void)denyRequesters:(id)a3;
- (void)enableAccessRequests:(BOOL)a3;
- (void)encodeSystemFieldsWithCoder:(id)a3;
- (void)registerFetchedParticipant:(id)a3;
- (void)removeParticipant:(CKShareParticipant *)participant;
- (void)resetFetchedParticipants;
- (void)setAccessRequestsEnabled:(BOOL)a3;
- (void)setAllParticipants:(id)a3;
- (void)setAllowsAnonymousPublicAccess:(BOOL)a3;
- (void)setAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3;
- (void)setApprovedRequesters:(id)a3;
- (void)setBlockedIdentities:(id)a3;
- (void)setEncodeAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3;
- (void)setInvitedKeysToRemove:(id)a3;
- (void)setInvitedProtectionData:(id)a3;
- (void)setInvitedProtectionEtag:(id)a3;
- (void)setLastFetchedParticipants:(id)a3;
- (void)setMutableAllParticipants:(id)a3;
- (void)setMutableApprovedRequesters:(id)a3;
- (void)setMutableBlockedIdentities:(id)a3;
- (void)setMutableRequesters:(id)a3;
- (void)setOneTimeURLMetadatasByParticipantID:(id)a3;
- (void)setParticipantSelfRemovalBehavior:(int64_t)a3;
- (void)setParticipantVisibility:(int64_t)a3;
- (void)setPreviousPublicProtectionEtag:(id)a3;
- (void)setPublicPermission:(CKShareParticipantPermission)publicPermission;
- (void)setPublicProtectionData:(id)a3;
- (void)setPublicProtectionEtag:(id)a3;
- (void)setPublicSharingIdentity:(id)a3;
- (void)setRequesters:(id)a3;
- (void)setSerializePersonalInfo:(BOOL)a3;
- (void)setShareID:(id)a3;
- (void)setWantsPublicSharingKey:(BOOL)a3;
- (void)unblockIdentities:(id)a3;
- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4;
@end

@implementation CKShare

+ (void)initialize
{
  v3 = (objc_class *)objc_opt_class();

  sub_18AF14F44((uint64_t)a1, v3, 0, &unk_1ED845FA0, 0);
}

- (CKShare)initWithRootRecord:(CKRecord *)rootRecord
{
  v4 = rootRecord;
  v5 = [CKRecordID alloc];
  v6 = CKCreateGUID();
  v9 = objc_msgSend_stringByAppendingString_(@"Share-", v7, (uint64_t)v6, v8);
  v13 = objc_msgSend_recordID(v4, v10, v11, v12);
  v17 = objc_msgSend_zoneID(v13, v14, v15, v16);
  v19 = objc_msgSend_initWithRecordName_zoneID_(v5, v18, (uint64_t)v9, (uint64_t)v17);

  v21 = (CKShare *)objc_msgSend_initWithRootRecord_shareID_(self, v20, (uint64_t)v4, (uint64_t)v19);
  return v21;
}

- (CKShare)initWithRootRecord:(CKRecord *)rootRecord shareID:(CKRecordID *)shareID
{
  v6 = rootRecord;
  v7 = shareID;
  v31.receiver = self;
  v31.super_class = (Class)CKShare;
  uint64_t v8 = [(CKRecord *)&v31 initWithRecordType:@"cloudkit.share" recordID:v7];
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend__commonCKShareInit(v8, v9, v10, v11);
    objc_msgSend__addOwnerParticipant(v12, v13, v14, v15);
    if (v6)
    {
      uint64_t v16 = [CKReference alloc];
      v18 = objc_msgSend_initWithRecordID_action_(v16, v17, (uint64_t)v7, 0);
      objc_msgSend_setShare_(v6, v19, (uint64_t)v18, v20);

      v24 = objc_msgSend_recordID(v6, v21, v22, v23);
      uint64_t v28 = objc_msgSend_copy(v24, v25, v26, v27);
      rootRecordID = v12->_rootRecordID;
      v12->_rootRecordID = (CKRecordID *)v28;
    }
  }

  return v12;
}

- (CKShare)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID
{
  v4 = recordZoneID;
  v5 = [CKRecordID alloc];
  v7 = objc_msgSend_initWithRecordName_zoneID_(v5, v6, @"cloudkit.zoneshare", (uint64_t)v4);

  v17.receiver = self;
  v17.super_class = (Class)CKShare;
  uint64_t v8 = [(CKRecord *)&v17 initWithRecordType:@"cloudkit.share" recordID:v7];
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend__commonCKShareInit(v8, v9, v10, v11);
    objc_msgSend__addOwnerParticipant(v12, v13, v14, v15);
  }

  return v12;
}

- (id)initInternalWithShareRecordID:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKShare;
  v3 = [(CKRecord *)&v9 initWithRecordType:@"cloudkit.share" recordID:a3];
  v7 = v3;
  if (v3) {
    objc_msgSend__commonCKShareInit(v3, v4, v5, v6);
  }
  return v7;
}

- (CKShare)init
{
  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, @"You must call -[%@ initWithRootRecord:shareID:]", v4);

  objc_exception_throw(v6);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType
{
  v3 = recordType;
  v4 = [CKException alloc];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v8 = (id)objc_msgSend_initWithCode_format_(v4, v7, 12, @"You must call -[%@ initWithRootRecord:shareID:]", v6);

  objc_exception_throw(v8);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID
{
  uint64_t v5 = recordType;
  id v6 = recordID;
  v7 = [CKException alloc];
  id v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  id v11 = (id)objc_msgSend_initWithCode_format_(v7, v10, 12, @"You must call -[%@ initWithRootRecord:shareID:]", v9);

  objc_exception_throw(v11);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID
{
  uint64_t v5 = recordType;
  id v6 = zoneID;
  v7 = [CKException alloc];
  id v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  id v11 = (id)objc_msgSend_initWithCode_format_(v7, v10, 12, @"You must call -[%@ initWithRootRecord:shareID:]", v9);

  objc_exception_throw(v11);
}

- (void)_addOwnerParticipant
{
  v3 = [CKUserIdentity alloc];
  v4 = [CKRecordID alloc];
  v7 = objc_msgSend_initWithRecordName_(v4, v5, @"__defaultOwner__", v6);
  id v24 = (id)objc_msgSend_initWithUserRecordID_(v3, v8, (uint64_t)v7, v9);

  uint64_t v10 = [CKShareParticipant alloc];
  inited = objc_msgSend_initInternalWithUserIdentity_(v10, v11, (uint64_t)v24, v12);
  objc_msgSend_setRole_(inited, v14, 1, v15);
  objc_msgSend_setPermission_(inited, v16, 3, v17);
  objc_msgSend_setIsCurrentUser_(inited, v18, 1, v19);
  objc_msgSend_setAcceptanceStatus_(inited, v20, 2, v21);
  objc_msgSend__addParticipantBypassingChecks_(self, v22, (uint64_t)inited, v23);
}

- (void)_commonCKShareInit
{
  self->_publicPermission = 1;
  v3 = (NSMutableArray *)objc_opt_new();
  mutableAllParticipants = self->_mutableAllParticipants;
  self->_mutableAllParticipants = v3;

  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  mutableRequesters = self->_mutableRequesters;
  self->_mutableRequesters = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  mutableApprovedRequesters = self->_mutableApprovedRequesters;
  self->_mutableApprovedRequesters = v7;

  uint64_t v9 = (NSMutableArray *)objc_opt_new();
  mutableBlockedIdentities = self->_mutableBlockedIdentities;
  self->_mutableBlockedIdentities = v9;

  self->_accessRequestsEnabled = 0;
  id v11 = (NSMutableArray *)objc_opt_new();
  lastFetchedParticipants = self->_lastFetchedParticipants;
  self->_lastFetchedParticipants = v11;

  v13 = (NSMutableSet *)objc_opt_new();
  addedParticipantIDs = self->_addedParticipantIDs;
  self->_addedParticipantIDs = v13;

  uint64_t v15 = (NSMutableSet *)objc_opt_new();
  removedParticipantIDs = self->_removedParticipantIDs;
  self->_removedParticipantIDs = v15;

  self->_participantVisibility = 0;
  self->_participantSelfRemovalBehavior = 0;
}

- (void)_removeNonOneTimeLinkPendingPrivateAndAdminParticipants
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_copy(v5, v6, v7, v8);

  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend_role(v18, v12, v13, v14) == 3 || objc_msgSend_role(v18, v12, v13, v14) == 2)
          && (objc_msgSend_usesOneTimeURL(v18, v12, v13, v14) & 1) == 0
          && objc_msgSend_acceptanceStatus(v18, v12, v13, v14) == 1
          && (objc_msgSend_isCurrentUser(v18, v12, v13, v14) & 1) == 0)
        {
          objc_msgSend__removeParticipantBypassingChecks_(self, v12, (uint64_t)v18, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v15);
  }
}

- (void)_removeAllNonOneTimeLinkParticipants
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_copy(v5, v6, v7, v8);

  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend_role(v18, v12, v13, v14) == 3
           || objc_msgSend_role(v18, v12, v13, v14) == 4
           || objc_msgSend_role(v18, v12, v13, v14) == 2)
          && (objc_msgSend_usesOneTimeURL(v18, v12, v13, v14) & 1) == 0
          && (objc_msgSend_isCurrentUser(v18, v12, v13, v14) & 1) == 0)
        {
          objc_msgSend__removeParticipantBypassingChecks_(self, v12, (uint64_t)v18, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v15);
  }
}

- (CKShareParticipantPermission)publicPermission
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  CKShareParticipantPermission publicPermission = v2->_publicPermission;
  objc_sync_exit(v2);

  return publicPermission;
}

- (BOOL)isCurrentUserOwnerOrAdmin
{
  v4 = objc_msgSend_currentUserParticipant(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4) {
    BOOL v12 = objc_msgSend_role(v4, v5, v6, v7) == 1 || objc_msgSend_role(v8, v9, v10, v11) == 2;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setPublicPermission:(CKShareParticipantPermission)publicPermission
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v11 = objc_msgSend_currentUserParticipant(obj, v5, v6, v7);
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(obj, v8, v9, v10) & 1) == 0)
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)obj, @"CKShare.m", 251, @"Only owners and admins may set the public permission of a share");
  }
  if ((unint64_t)(publicPermission - 2) >= 3)
  {
    if (publicPermission == CKShareParticipantPermissionNone)
    {
      if ((obj->_publicPermission & 0xFFFFFFFFFFFFFFFELL) == 2) {
        objc_msgSend__removeAllNonOneTimeLinkParticipants(obj, v8, v9, v10);
      }
    }
    else if (publicPermission == CKShareParticipantPermissionUnknown)
    {
      BOOL v12 = [CKException alloc];
      id v14 = (id)objc_msgSend_initWithCode_format_(v12, v13, 12, @"You can't set a share's publicPermission to CKShareParticipantPermissionUnknown");
      objc_exception_throw(v14);
    }
  }
  else
  {
    objc_msgSend__removeNonOneTimeLinkPendingPrivateAndAdminParticipants(obj, v8, v9, v10);
  }
  objc_msgSend__setPublicPermissionNoSideEffects_(obj, v8, publicPermission, v10);

  objc_sync_exit(obj);
}

- (void)_setPublicPermissionNoSideEffects:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_CKShareParticipantPermission publicPermission = a3;
  objc_sync_exit(obj);
}

- (void)setAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3
{
}

- (BOOL)allowsReadOnlyParticipantsToSeeEachOther
{
  return objc_msgSend_participantVisibility(self, a2, v2, v3) == 0;
}

- (void)setOneTimeURLMetadatasByParticipantID:(id)a3
{
  id v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v14, v5, v6, v7);
  uint64_t v12 = objc_msgSend_mutableCopy(v8, v9, v10, v11);
  oneTimeURLMetadatasByParticipantID = v4->_oneTimeURLMetadatasByParticipantID;
  v4->_oneTimeURLMetadatasByParticipantID = (NSMutableDictionary *)v12;

  objc_sync_exit(v4);
}

- (NSMutableDictionary)oneTimeURLMetadatasByParticipantID
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_CKDeepCopy(v2->_oneTimeURLMetadatasByParticipantID, v3, v4, v5);
  uint64_t v10 = objc_msgSend_mutableCopy(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return (NSMutableDictionary *)v10;
}

- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4
{
  v212.receiver = self;
  v212.super_class = (Class)CKShare;
  uint64_t v5 = [(CKRecord *)&v212 copyWithZone:a3 userFields:a4];
  uint64_t v9 = objc_msgSend_containerID(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);
  id v14 = (void *)v5[1];
  v5[1] = v13;

  v18 = objc_msgSend_etag(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_copy(v18, v19, v20, v21);
  uint64_t v23 = (void *)v5[2];
  v5[2] = v22;

  uint64_t v27 = objc_msgSend_rootRecordID(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_copy(v27, v28, v29, v30);
  v32 = (void *)v5[49];
  v5[49] = v31;

  *((unsigned char *)v5 + 346) = objc_msgSend_allowsAnonymousPublicAccess(self, v33, v34, v35);
  v5[44] = objc_msgSend_publicPermission(self, v36, v37, v38);
  v5[46] = objc_msgSend_participantVisibility(self, v39, v40, v41);
  v5[47] = objc_msgSend_participantSelfRemovalBehavior(self, v42, v43, v44);
  v45 = self;
  objc_sync_enter(v45);
  v49 = objc_msgSend_mutableAllParticipants(v45, v46, v47, v48);
  v53 = objc_msgSend_CKDeepCopy(v49, v50, v51, v52);
  uint64_t v57 = objc_msgSend_mutableCopy(v53, v54, v55, v56);
  v58 = (void *)v5[50];
  v5[50] = v57;

  v62 = objc_msgSend_lastFetchedParticipants(v45, v59, v60, v61);
  v66 = objc_msgSend_CKDeepCopy(v62, v63, v64, v65);
  uint64_t v70 = objc_msgSend_mutableCopy(v66, v67, v68, v69);
  v71 = (void *)v5[51];
  v5[51] = v70;

  v75 = objc_msgSend_addedParticipantIDs(v45, v72, v73, v74);
  uint64_t v79 = objc_msgSend_mutableCopy(v75, v76, v77, v78);
  v80 = (void *)v5[52];
  v5[52] = v79;

  v84 = objc_msgSend_removedParticipantIDs(v45, v81, v82, v83);
  uint64_t v88 = objc_msgSend_mutableCopy(v84, v85, v86, v87);
  v89 = (void *)v5[53];
  v5[53] = v88;

  v93 = objc_msgSend_mutableRequesters(v45, v90, v91, v92);
  v97 = objc_msgSend_CKDeepCopy(v93, v94, v95, v96);
  uint64_t v101 = objc_msgSend_mutableCopy(v97, v98, v99, v100);
  v102 = (void *)v5[54];
  v5[54] = v101;

  v106 = objc_msgSend_mutableApprovedRequesters(v45, v103, v104, v105);
  v110 = objc_msgSend_CKDeepCopy(v106, v107, v108, v109);
  uint64_t v114 = objc_msgSend_mutableCopy(v110, v111, v112, v113);
  v115 = (void *)v5[55];
  v5[55] = v114;

  v119 = objc_msgSend_mutableBlockedIdentities(v45, v116, v117, v118);
  v123 = objc_msgSend_CKDeepCopy(v119, v120, v121, v122);
  uint64_t v127 = objc_msgSend_mutableCopy(v123, v124, v125, v126);
  v128 = (void *)v5[56];
  v5[56] = v127;

  objc_sync_exit(v45);
  *((unsigned char *)v5 + 344) = objc_msgSend_accessRequestsEnabled(v45, v129, v130, v131);
  v135 = objc_msgSend_invitedKeysToRemove(v45, v132, v133, v134);
  uint64_t v139 = objc_msgSend_CKDeepCopy(v135, v136, v137, v138);
  v140 = (void *)v5[45];
  v5[45] = v139;

  v144 = objc_msgSend_invitedProtectionData(v45, v141, v142, v143);
  uint64_t v148 = objc_msgSend_copy(v144, v145, v146, v147);
  v149 = (void *)v5[57];
  v5[57] = v148;

  v153 = objc_msgSend_invitedProtectionEtag(v45, v150, v151, v152);
  uint64_t v157 = objc_msgSend_copy(v153, v154, v155, v156);
  v158 = (void *)v5[58];
  v5[58] = v157;

  v162 = objc_msgSend_previousInvitedProtectionEtag(v45, v159, v160, v161);
  uint64_t v166 = objc_msgSend_copy(v162, v163, v164, v165);
  v167 = (void *)v5[59];
  v5[59] = v166;

  v171 = objc_msgSend_publicProtectionData(v45, v168, v169, v170);
  uint64_t v175 = objc_msgSend_copy(v171, v172, v173, v174);
  v176 = (void *)v5[60];
  v5[60] = v175;

  v180 = objc_msgSend_publicProtectionEtag(v45, v177, v178, v179);
  uint64_t v184 = objc_msgSend_copy(v180, v181, v182, v183);
  v185 = (void *)v5[61];
  v5[61] = v184;

  v189 = objc_msgSend_previousPublicProtectionEtag(v45, v186, v187, v188);
  uint64_t v193 = objc_msgSend_copy(v189, v190, v191, v192);
  v194 = (void *)v5[62];
  v5[62] = v193;

  *((unsigned char *)v5 + 347) = objc_msgSend_serializePersonalInfo(v45, v195, v196, v197);
  v201 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v45, v198, v199, v200);
  v205 = objc_msgSend_CKDeepCopy(v201, v202, v203, v204);
  uint64_t v209 = objc_msgSend_mutableCopy(v205, v206, v207, v208);
  v210 = (void *)v5[48];
  v5[48] = v209;

  return v5;
}

- (id)copyWithOriginalValues
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)CKShare;
  id v2 = [(CKRecord *)&v70 copyWithOriginalValues];
  uint64_t v6 = objc_msgSend_removedParticipantIDs(v2, v3, v4, v5);
  objc_msgSend_removeAllObjects(v6, v7, v8, v9);

  uint64_t v13 = objc_msgSend_owner(v2, v10, v11, v12);
  uint64_t v17 = objc_msgSend_participantID(v13, v14, v15, v16);

  if (v17)
  {
    uint64_t v21 = objc_msgSend_addedParticipantIDs(v2, v18, v19, v20);
    int v65 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v17, v23);
  }
  else
  {
    int v65 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v24 = objc_msgSend_mutableAllParticipants(v2, v18, v19, v20);
  uint64_t v28 = objc_msgSend_copy(v24, v25, v26, v27);

  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v66, (uint64_t)v71, 16);
  if (v30)
  {
    uint64_t v34 = v30;
    uint64_t v35 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v67 != v35) {
          objc_enumerationMutation(v28);
        }
        uint64_t v37 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v38 = objc_msgSend_addedParticipantIDs(v2, v31, v32, v33);
        v42 = objc_msgSend_participantID(v37, v39, v40, v41);
        if (objc_msgSend_containsObject_(v38, v43, (uint64_t)v42, v44))
        {
          uint64_t v48 = objc_msgSend_role(v37, v45, v46, v47);

          if (v48 == 1) {
            continue;
          }
          uint64_t v38 = objc_msgSend_mutableAllParticipants(v2, v31, v32, v33);
          objc_msgSend_removeObject_(v38, v49, (uint64_t)v37, v50);
        }
        else
        {
        }
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v66, (uint64_t)v71, 16);
    }
    while (v34);
  }

  v54 = objc_msgSend_addedParticipantIDs(v2, v51, v52, v53);
  objc_msgSend_removeAllObjects(v54, v55, v56, v57);

  if (v65)
  {
    uint64_t v61 = objc_msgSend_addedParticipantIDs(v2, v58, v59, v60);
    objc_msgSend_addObject_(v61, v62, (uint64_t)v17, v63);
  }
  return v2;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)CKShare;
  [(CKRecord *)&v87 CKDescribePropertiesUsing:v4];
  uint64_t v8 = objc_msgSend_rootRecordID(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"rootRecordID", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_etag(self, v10, v11, v12);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, @"etag", (uint64_t)v13, 0);

  uint64_t v18 = objc_msgSend_publicPermission(self, v15, v16, v17);
  uint64_t v19 = CKStringFromParticipantPermission(v18);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v20, @"publicPermission", (uint64_t)v19, 0);

  unint64_t v24 = objc_msgSend_participantVisibility(self, v21, v22, v23);
  if (v24 > 3) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v25, @"participantVisibility", @"Unknown", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v25, @"participantVisibility", (uint64_t)off_1E5464070[v24], 0);
  }
  unint64_t v29 = objc_msgSend_participantSelfRemovalBehavior(self, v26, v27, v28);
  if (v29 > 3) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v30, @"participantSelfRemovalBehavior", @"Unknown", 0);
  }
  else {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v30, @"participantSelfRemovalBehavior", (uint64_t)off_1E5464090[v29], 0);
  }
  if (objc_msgSend_allowsAnonymousPublicAccess(self, v31, v32, v33)) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v34, @"allowsAnonymousPublicAccess", @"true", 0);
  }
  uint64_t v37 = objc_msgSend_baseToken(self, v34, v35, v36);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v38, @"baseToken", (uint64_t)v37, 0);

  v42 = objc_msgSend_routingKey(self, v39, v40, v41);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v43, @"routingKey", (uint64_t)v42, 0);

  uint64_t v47 = objc_msgSend_mutableEncryptedPSK(self, v44, v45, v46);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v48, @"mutableEncryptedPSK", (uint64_t)v47, 0);

  v49 = self;
  objc_sync_enter(v49);
  uint64_t v53 = objc_msgSend_mutableAllParticipants(v49, v50, v51, v52);
  if (objc_msgSend_count(v53, v54, v55, v56)) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v57, @"participants", (uint64_t)v53, 0);
  }
  uint64_t v60 = objc_msgSend_mutableRequesters(v49, v57, v58, v59);
  if (objc_msgSend_count(v60, v61, v62, v63)) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v64, @"requesters", (uint64_t)v60, 0);
  }
  long long v67 = objc_msgSend_mutableApprovedRequesters(v49, v64, v65, v66);
  if (objc_msgSend_count(v67, v68, v69, v70)) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v71, @"approvedRequesters", (uint64_t)v67, 0);
  }
  uint64_t v74 = objc_msgSend_mutableBlockedIdentities(v49, v71, v72, v73);
  if (objc_msgSend_count(v74, v75, v76, v77)) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v78, @"blockedIdentities", (uint64_t)v74, 0);
  }
  if (objc_msgSend_accessRequestsEnabled(v49, v78, v79, v80)) {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v81, @"accessRequestsEnabled", @"true", 0);
  }
  else {
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v81, @"accessRequestsEnabled", @"false", 0);
  }

  objc_sync_exit(v49);
  v85 = objc_msgSend_currentUserParticipant(v49, v82, v83, v84);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v86, @"currentParticipant", (uint64_t)v85, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShare *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShare *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)hasEncryptedData
{
  return 1;
}

- (BOOL)hasPropertiesRequiringDecryption
{
  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if ([(CKRecord *)&v12 hasPropertiesRequiringDecryption]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  BOOL v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasPropertiesRequiringEncryption
{
  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if ([(CKRecord *)&v12 hasPropertiesRequiringEncryption]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  BOOL v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasModifiedPropertiesRequiringEncryption
{
  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if ([(CKRecord *)&v12 hasModifiedPropertiesRequiringEncryption]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  BOOL v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasModifiedEncryptedData
{
  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if ([(CKRecord *)&v12 hasModifiedEncryptedData]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  BOOL v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)isZoneWideShare
{
  uint64_t v4 = objc_msgSend_recordID(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_recordName(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"cloudkit.zoneshare", v10);

  return isEqualToString;
}

- (void)CKAssignToContainerWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v12.receiver = v5;
  v12.super_class = (Class)CKShare;
  [(CKRecord *)&v12 CKAssignToContainerWithID:v4];
  uint64_t v9 = objc_msgSend_mutableAllParticipants(v5, v6, v7, v8);
  objc_msgSend_CKAssignToContainerWithID_(v9, v10, (uint64_t)v4, v11);

  objc_sync_exit(v5);
}

- (id)allParticipants
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_copy(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return v10;
}

- (void)setAllParticipants:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v11, v5, v6, v7);
  objc_msgSend_setMutableAllParticipants_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v4);
}

- (NSArray)participants
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_removedParticipantIDs(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_mutableAllParticipants(v2, v7, v8, v9);
  if (objc_msgSend_count(v6, v11, v12, v13))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_18B0CD12C;
    v21[3] = &unk_1E5463EB8;
    id v22 = v6;
    uint64_t v19 = objc_msgSend_CKFilter_(v10, v17, (uint64_t)v21, v18);
  }
  else
  {
    uint64_t v19 = objc_msgSend_copy(v10, v14, v15, v16);
  }

  objc_sync_exit(v2);

  return (NSArray *)v19;
}

- (NSArray)requesters
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_copy(v2->_mutableRequesters, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setRequesters:(id)a3
{
  id v10 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableRequesters = v4->_mutableRequesters;
  v4->_mutableRequesters = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)approvedRequesters
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_copy(v2->_mutableApprovedRequesters, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setApprovedRequesters:(id)a3
{
  id v10 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableApprovedRequesters = v4->_mutableApprovedRequesters;
  v4->_mutableApprovedRequesters = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)blockedIdentities
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_copy(v2->_mutableBlockedIdentities, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setBlockedIdentities:(id)a3
{
  id v10 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableBlockedIdentities = v4->_mutableBlockedIdentities;
  v4->_mutableBlockedIdentities = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (id)lookupInfosFromRequesters:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v8 = v3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v102, (uint64_t)v106, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v103;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v103 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v102 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend_userIdentity(v17, v11, v12, v13);
        id v22 = objc_msgSend_lookupInfo(v18, v19, v20, v21);
        uint64_t v26 = objc_msgSend_userRecordID(v22, v23, v24, v25);

        if (v26)
        {
          uint64_t v30 = [CKUserIdentityLookupInfo alloc];
          uint64_t v34 = objc_msgSend_userIdentity(v17, v31, v32, v33);
          uint64_t v38 = objc_msgSend_lookupInfo(v34, v35, v36, v37);
          v42 = objc_msgSend_userRecordID(v38, v39, v40, v41);
          uint64_t v45 = objc_msgSend_initWithUserRecordID_(v30, v43, (uint64_t)v42, v44);
LABEL_12:
          uint64_t v91 = (void *)v45;

          objc_msgSend_addObject_(v7, v92, (uint64_t)v91, v93);
          goto LABEL_13;
        }
        uint64_t v46 = objc_msgSend_userIdentity(v17, v27, v28, v29);
        uint64_t v50 = objc_msgSend_lookupInfo(v46, v47, v48, v49);
        v54 = objc_msgSend_emailAddress(v50, v51, v52, v53);

        if (v54)
        {
          uint64_t v58 = [CKUserIdentityLookupInfo alloc];
          uint64_t v34 = objc_msgSend_userIdentity(v17, v59, v60, v61);
          uint64_t v38 = objc_msgSend_lookupInfo(v34, v62, v63, v64);
          v42 = objc_msgSend_emailAddress(v38, v65, v66, v67);
          uint64_t v45 = objc_msgSend_initWithEmailAddress_(v58, v68, (uint64_t)v42, v69);
          goto LABEL_12;
        }
        uint64_t v70 = objc_msgSend_userIdentity(v17, v55, v56, v57);
        uint64_t v74 = objc_msgSend_lookupInfo(v70, v71, v72, v73);
        uint64_t v78 = objc_msgSend_phoneNumber(v74, v75, v76, v77);

        if (v78)
        {
          uint64_t v79 = [CKUserIdentityLookupInfo alloc];
          uint64_t v34 = objc_msgSend_userIdentity(v17, v80, v81, v82);
          uint64_t v38 = objc_msgSend_lookupInfo(v34, v83, v84, v85);
          v42 = objc_msgSend_phoneNumber(v38, v86, v87, v88);
          uint64_t v45 = objc_msgSend_initWithPhoneNumber_(v79, v89, (uint64_t)v42, v90);
          goto LABEL_12;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v94 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v101 = 0;
          _os_log_error_impl(&dword_18AF10000, v94, OS_LOG_TYPE_ERROR, "Cannot approve share requester without a user record ID, email address, or phone number.", v101, 2u);
        }
LABEL_13:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v102, (uint64_t)v106, 16);
      uint64_t v14 = v95;
    }
    while (v95);
  }

  uint64_t v99 = objc_msgSend_copy(v7, v96, v97, v98);

  return v99;
}

- (void)approveRequesters:(id)a3 inContainer:(id)a4 completionHandler:(id)a5
{
}

- (void)approveRequesters:(id)a3 inContainer:(id)a4 withPermission:(int64_t)a5 asRole:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v22 = objc_msgSend_currentUserParticipant(self, v16, v17, v18);
  if (v22 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v19, v20, v21) & 1) == 0)
  {
    uint64_t v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 555, @"Only owners and admins may approve share requesters");

    if (!v13) {
      goto LABEL_8;
    }
  }
  else if (!v13)
  {
    goto LABEL_8;
  }
  uint64_t v23 = objc_msgSend_count(v13, v19, v20, v21);
  if (v14 && v23)
  {
    uint64_t v26 = objc_msgSend_lookupInfosFromRequesters_(self, v24, (uint64_t)v13, v25);
    uint64_t v27 = [CKFetchShareParticipantsOperation alloc];
    uint64_t v30 = objc_msgSend_initWithUserIdentityLookupInfos_(v27, v28, (uint64_t)v26, v29);
    uint64_t v34 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33);
    objc_initWeak(&location, self);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = sub_18B0CDA68;
    v53[3] = &unk_1E5463EE0;
    int64_t v55 = a5;
    int64_t v56 = a6;
    id v35 = v34;
    id v54 = v35;
    objc_msgSend_setPerShareParticipantCompletionBlock_(v30, v36, (uint64_t)v53, v37);
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    uint64_t v47 = sub_18B0CDBEC;
    uint64_t v48 = &unk_1E5463F08;
    objc_copyWeak(&v52, &location);
    id v51 = v15;
    id v38 = v35;
    id v49 = v38;
    id v50 = v13;
    objc_msgSend_setFetchShareParticipantsCompletionBlock_(v30, v39, (uint64_t)&v45, v40);
    objc_msgSend_addOperation_(v14, v41, (uint64_t)v30, v42, v45, v46, v47, v48);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
LABEL_8:
  if (v15) {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
LABEL_10:
}

- (void)denyRequesters:(id)a3
{
  id v20 = a3;
  id v11 = objc_msgSend_currentUserParticipant(self, v5, v6, v7);
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v8, v9, v10) & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 613, @"Only owners and admins may deny share requesters");
  }
  if (v20)
  {
    id v15 = self;
    objc_sync_enter(v15);
    objc_msgSend_removeObjectsInArray_(v15->_mutableRequesters, v16, (uint64_t)v20, v17);
    objc_sync_exit(v15);
  }
}

- (void)_unblockIdentitiesReferencedByParticipant:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  if (v96)
  {
    v94 = self;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18B0CE3A0;
    aBlock[3] = &unk_1E5463F30;
    id v5 = v4;
    id v104 = v5;
    uint64_t v95 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v9 = objc_msgSend_userIdentity(v96, v6, v7, v8);
    uint64_t v13 = objc_msgSend_userRecordID(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_recordName(v13, v14, v15, v16);
    v95[2](v95, v17);

    uint64_t v21 = objc_msgSend_userIdentity(v96, v18, v19, v20);
    uint64_t v25 = objc_msgSend_lookupInfo(v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_emailAddress(v25, v26, v27, v28);
    v95[2](v95, v29);

    uint64_t v33 = objc_msgSend_userIdentity(v96, v30, v31, v32);
    uint64_t v37 = objc_msgSend_lookupInfo(v33, v34, v35, v36);
    uint64_t v41 = objc_msgSend_phoneNumber(v37, v38, v39, v40);
    v95[2](v95, v41);

    uint64_t v98 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v93 = 448;
    obj = self->_mutableBlockedIdentities;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v99, (uint64_t)v109, 16);
    if (v46)
    {
      uint64_t v47 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v100 != v47) {
            objc_enumerationMutation(obj);
          }
          id v49 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          id v50 = objc_msgSend_userIdentity(v49, v43, v44, v45, v93);
          id v54 = objc_msgSend_lookupInfo(v50, v51, v52, v53);
          uint64_t v58 = objc_msgSend_userRecordID(v54, v55, v56, v57);
          uint64_t v62 = objc_msgSend_recordName(v58, v59, v60, v61);

          uint64_t v66 = objc_msgSend_userIdentity(v49, v63, v64, v65);
          uint64_t v70 = objc_msgSend_lookupInfo(v66, v67, v68, v69);
          uint64_t v74 = objc_msgSend_emailAddress(v70, v71, v72, v73);

          uint64_t v78 = objc_msgSend_userIdentity(v49, v75, v76, v77);
          uint64_t v82 = objc_msgSend_lookupInfo(v78, v79, v80, v81);
          uint64_t v86 = objc_msgSend_phoneNumber(v82, v83, v84, v85);

          if (v62 && (objc_msgSend_containsObject_(v5, v87, (uint64_t)v62, v88) & 1) != 0
            || v74 && (objc_msgSend_containsObject_(v5, v87, (uint64_t)v74, v88) & 1) != 0
            || v86 && objc_msgSend_containsObject_(v5, v87, (uint64_t)v86, v88))
          {
            objc_msgSend_addObject_(v98, v87, (uint64_t)v49, v88);
          }
        }
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v99, (uint64_t)v109, 16);
      }
      while (v46);
    }

    v89 = v94;
    objc_sync_enter(v89);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v90 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v106 = v98;
      __int16 v107 = 2112;
      id v108 = v96;
      _os_log_impl(&dword_18AF10000, v90, OS_LOG_TYPE_DEFAULT, "Unblocking identities: %@ referenced by participant: %@", buf, 0x16u);
    }
    objc_msgSend_removeObjectsInArray_(*(void **)((char *)&v94->super.super.isa + v93), v91, (uint64_t)v98, v92, v93);
    objc_sync_exit(v89);
  }
}

- (int64_t)_indexForIdentity:(id)a3 matchingAnyInCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_lookupInfo(v5, v7, v8, v9);
  uint64_t v14 = objc_msgSend_userRecordID(v10, v11, v12, v13);
  uint64_t v83 = objc_msgSend_recordName(v14, v15, v16, v17);

  uint64_t v21 = objc_msgSend_lookupInfo(v5, v18, v19, v20);
  uint64_t v82 = objc_msgSend_emailAddress(v21, v22, v23, v24);

  uint64_t v28 = objc_msgSend_lookupInfo(v5, v25, v26, v27);
  uint64_t v81 = objc_msgSend_phoneNumber(v28, v29, v30, v31);

  if (objc_msgSend_count(v6, v32, v33, v34))
  {
    id v80 = v5;
    uint64_t v37 = 0;
    while (1)
    {
      id v38 = objc_msgSend_objectAtIndexedSubscript_(v6, v35, v37, v36, v80);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v42 = objc_msgSend_userIdentity(v38, v39, v40, v41);
        uint64_t v46 = objc_msgSend_lookupInfo(v42, v43, v44, v45);
        id v50 = objc_msgSend_userRecordID(v46, v47, v48, v49);
        id v54 = objc_msgSend_recordName(v50, v51, v52, v53);

        uint64_t v58 = objc_msgSend_lookupInfo(v42, v55, v56, v57);
        uint64_t v62 = objc_msgSend_emailAddress(v58, v59, v60, v61);

        uint64_t v66 = objc_msgSend_lookupInfo(v42, v63, v64, v65);
        uint64_t v70 = objc_msgSend_phoneNumber(v66, v67, v68, v69);

        char isEqualToString = 0;
        if (v83 && v54) {
          char isEqualToString = objc_msgSend_isEqualToString_(v83, v71, (uint64_t)v54, v72);
        }
        char v74 = 0;
        if (v82 && v62) {
          char v74 = objc_msgSend_isEqualToString_(v82, v71, (uint64_t)v62, v72);
        }
        int v75 = 0;
        if (v81 && v70) {
          int v75 = objc_msgSend_isEqualToString_(v81, v71, (uint64_t)v70, v72);
        }
      }
      else
      {
        char v74 = 0;
        uint64_t v70 = 0;
        uint64_t v62 = 0;
        id v54 = 0;
        char isEqualToString = 0;
        int v75 = 0;
      }

      if ((isEqualToString & 1) != 0 || (v74 & 1) != 0 || v75) {
        break;
      }
      if (++v37 >= (unint64_t)objc_msgSend_count(v6, v76, v77, v78))
      {
        uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
    id v5 = v80;
  }
  else
  {
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v37;
}

- (BOOL)_existingParticipantReferencedByUserIdentities:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = a3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_participants(self, v7, v8, v9, (void)v19);
        uint64_t v16 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(self, v15, v13, (uint64_t)v14);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v17 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (id)_existingRequestersForUserIdentities:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(self, v9, *(void *)(*((void *)&v21 + 1) + 8 * i), (uint64_t)self->_mutableRequesters, (void)v21);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(self->_mutableRequesters, v9, v13, v14);
          if ((objc_msgSend_containsObject_(v5, v16, (uint64_t)v15, v17) & 1) == 0) {
            objc_msgSend_addObject_(v5, v18, (uint64_t)v15, v19);
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_userIdentityLookupInfoHasSingleIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  uint64_t v7 = objc_msgSend_emailAddress(v3, v4, v5, v6);

  uint64_t v11 = objc_msgSend_phoneNumber(v3, v8, v9, v10);

  uint64_t v15 = 1;
  if (v7) {
    uint64_t v15 = 2;
  }
  if (v11) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = v7 != 0;
  }
  uint64_t v17 = objc_msgSend_userRecordID(v3, v12, v13, v14);

  if (v17) {
    return v16 + 1;
  }
  else {
    return v16;
  }
}

- (BOOL)blockUserIdentities:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  uint64_t v48 = objc_msgSend_currentUserParticipant(self, v7, v8, v9);
  if (v48 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v10, v11, v12) & 1) == 0)
  {
    uint64_t v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v13, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 736, @"Only owners and admins may block.");
  }
  if (!v47) {
    goto LABEL_25;
  }
  if (!objc_msgSend__existingParticipantReferencedByUserIdentities_(self, v10, (uint64_t)v47, v12))
  {
    uint64_t v17 = self;
    objc_sync_enter(v17);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v47;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v51 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          long long v23 = [CKShareBlockedIdentity alloc];
          uint64_t v26 = objc_msgSend_initWithUserIdentity_(v23, v24, v22, v25);
          uint64_t v29 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(v17, v27, v22, (uint64_t)v17->_mutableBlockedIdentities);
          mutableBlockedIdentities = v17->_mutableBlockedIdentities;
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!mutableBlockedIdentities)
            {
              uint64_t v32 = objc_opt_new();
              uint64_t v33 = v17->_mutableBlockedIdentities;
              v17->_mutableBlockedIdentities = (NSMutableArray *)v32;

              mutableBlockedIdentities = v17->_mutableBlockedIdentities;
            }
            objc_msgSend_addObject_(mutableBlockedIdentities, v28, (uint64_t)v26, v30);
          }
          else
          {
            objc_msgSend_replaceObjectAtIndex_withObject_(mutableBlockedIdentities, v28, v29, (uint64_t)v26);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v50, (uint64_t)v54, 16);
      }
      while (v19);
    }

    id v38 = objc_msgSend_copy(obj, v35, v36, v37);
    uint64_t v41 = objc_msgSend__existingRequestersForUserIdentities_(v17, v39, (uint64_t)v38, v40);

    objc_msgSend_removeObjectsInArray_(v17->_mutableRequesters, v42, (uint64_t)v41, v43);
    objc_sync_exit(v17);

LABEL_25:
    BOOL v16 = 1;
    goto LABEL_26;
  }
  if (a4)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v47;
      _os_log_error_impl(&dword_18AF10000, v14, OS_LOG_TYPE_ERROR, "Existing share participant referenced by user identities: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKErrorDomain", 12, @"Cannot block an identity referenced by an existing share participant.");
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_26:

  return v16;
}

- (BOOL)blockRequesters:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = objc_msgSend_userIdentity(*(void **)(*((void *)&v27 + 1) + 8 * v16), v11, v12, v13, (void)v27);
        objc_msgSend_addObject_(v7, v18, (uint64_t)v17, v19);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  long long v23 = objc_msgSend_copy(v7, v20, v21, v22);
  char v25 = objc_msgSend_blockUserIdentities_error_(self, v24, (uint64_t)v23, (uint64_t)a4);

  return v25;
}

- (BOOL)blockUserIdentityLookupInfos:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = (id)objc_msgSend_copy(v5, v7, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v40, (uint64_t)v46, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ((objc_msgSend__userIdentityLookupInfoHasSingleIdentifier_(self, v13, v18, v14) & 1) == 0)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v35 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v18;
            _os_log_fault_impl(&dword_18AF10000, v35, OS_LOG_TYPE_FAULT, "Multiple identifiers found on lookup info: %@", buf, 0xCu);
          }
          uint64_t v36 = [CKException alloc];
          id v38 = (id)objc_msgSend_initWithCode_format_(v36, v37, 12, @"You cannot block a user identity lookup info with multiple identifiers.");
          objc_exception_throw(v38);
        }
        uint64_t v19 = [CKUserIdentity alloc];
        inited = objc_msgSend_initInternal(v19, v20, v21, v22);
        objc_msgSend_setLookupInfo_(inited, v24, v18, v25);
        objc_msgSend_addObject_(v6, v26, (uint64_t)inited, v27);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v40, (uint64_t)v46, 16);
    }
    while (v15);
  }

  uint64_t v31 = objc_msgSend_copy(v6, v28, v29, v30);
  char v33 = objc_msgSend_blockUserIdentities_error_(self, v32, (uint64_t)v31, (uint64_t)a4);

  return v33;
}

- (void)unblockIdentities:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  uint64_t v31 = objc_msgSend_currentUserParticipant(self, v5, v6, v7);
  uint64_t v11 = (void *)v31;
  if (v31 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v8, v9, v10) & 1) == 0)
  {
    uint64_t v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 804, @"Only owners and admins may unblock users");

    uint64_t v11 = (void *)v31;
  }
  if (v32 && objc_msgSend_count(v32, v8, v9, v10))
  {
    uint64_t v34 = self;
    objc_sync_enter(v34);
    uint64_t v12 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v32;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v39, (uint64_t)v44, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v18 = v34->_mutableBlockedIdentities;
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v35, (uint64_t)v43, 16);
          if (v22)
          {
            uint64_t v23 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * j);
                if (objc_msgSend_isEqual_(v17, v20, v25, v21, v31)) {
                  objc_msgSend_addObject_(v12, v20, v25, v21);
                }
              }
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v35, (uint64_t)v43, 16);
            }
            while (v22);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v39, (uint64_t)v44, 16);
      }
      while (v14);
    }

    objc_msgSend_removeObjectsInArray_(v34->_mutableBlockedIdentities, v27, (uint64_t)v12, v28);
    objc_sync_exit(v34);

    uint64_t v11 = (void *)v31;
  }
}

- (void)enableAccessRequests:(BOOL)a3
{
  objc_msgSend_currentUserParticipant(self, a2, a3, v3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v7, v8, v9) & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 825, @"Only owners and admins may set deny access requests.");
  }
  uint64_t v13 = self;
  objc_sync_enter(v13);
  v13->_accessRequestsEnabled = a3;
  objc_sync_exit(v13);
}

- (void)clearModifiedParticipants
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = objc_msgSend_recordID(v2, v4, v5, v6);
    int v22 = 138412290;
    uint64_t v23 = v21;
    _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Clearing modified participants on share %@", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v10 = objc_msgSend_addedParticipantIDs(v2, v7, v8, v9);
  objc_msgSend_removeAllObjects(v10, v11, v12, v13);

  uint64_t v17 = objc_msgSend_removedParticipantIDs(v2, v14, v15, v16);
  objc_msgSend_removeAllObjects(v17, v18, v19, v20);

  objc_sync_exit(v2);
}

- (NSArray)invitedKeysToRemove
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_invitedKeysToRemove;
  objc_sync_exit(v2);

  return v3;
}

- (void)setInvitedKeysToRemove:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  invitedKeysToRemove = v4->_invitedKeysToRemove;
  v4->_invitedKeysToRemove = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (CKShareParticipant)owner
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = objc_msgSend_mutableAllParticipants(v3, v4, v5, v6, 0);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
      if (objc_msgSend_role(v15, v9, v10, v11) == 1) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v23, (uint64_t)v27, 16);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v15;

    if (!v21) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_9:

LABEL_10:
    uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)v3, @"CKShare.m", 861, @"You should never have a share without an owner");

    id v21 = 0;
  }
  objc_sync_exit(v3);

  return (CKShareParticipant *)v21;
}

- (id)_knownParticipantWithParticipantID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7, 0);
  id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_participantID(v16, v10, v11, v12);
        char isEqualToString = objc_msgSend_isEqualToString_(v4, v18, (uint64_t)v17, v19);

        if (isEqualToString)
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)_knownParticipantEqualToParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend__knownParticipantEqualToParticipant_inParticipants_(self, v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

- (id)_knownParticipantEqualToParticipant:(id)a3 inParticipants:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v62 = 0;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x3032000000;
    uint64_t v65 = sub_18AF13E6C;
    uint64_t v66 = sub_18AF13908;
    id v67 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x3032000000;
    uint64_t v59 = sub_18AF13E6C;
    uint64_t v60 = sub_18AF13908;
    id v61 = v6;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18B0CFD90;
    aBlock[3] = &unk_1E5463F80;
    id v54 = &v56;
    id v47 = v5;
    id v53 = v47;
    int64_t v55 = &v62;
    uint64_t v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    v8[2](v8, &unk_1ED7EF218);
    uint64_t v9 = (void *)v63[5];
    if (v9) {
      goto LABEL_8;
    }
    v8[2](v8, &unk_1ED7EFAF8);
    uint64_t v10 = (void *)v63[5];
    v63[5] = 0;

    v8[2](v8, &unk_1ED7EFB18);
    uint64_t v9 = (void *)v63[5];
    if (v9) {
      goto LABEL_8;
    }
    uint64_t v14 = objc_msgSend_userIdentity(v47, v11, v12, v13);
    uint64_t v18 = objc_msgSend_publicSharingKey(v14, v15, v16, v17);

    if (v18) {
      v8[2](v8, &unk_1ED7EFB58);
    }
    uint64_t v9 = (void *)v63[5];
    if (v9 || (v8[2](v8, &unk_1ED7EFBB8), (uint64_t v9 = (void *)v63[5]) != 0))
    {
LABEL_8:
      id v19 = v9;
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = (id)v57[5];
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v48, (uint64_t)v68, 16);
      if (v22)
      {
        uint64_t v46 = *(void *)v49;
        while (2)
        {
          uint64_t v45 = v22;
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v49 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v28 = objc_msgSend_userIdentity(v47, v23, v24, v25);
            id v32 = objc_msgSend_lookupInfo(v28, v29, v30, v31);
            long long v36 = objc_msgSend_userIdentity(v27, v33, v34, v35);
            long long v40 = objc_msgSend_lookupInfo(v36, v37, v38, v39);
            char isEqual = objc_msgSend_isEqual_(v32, v41, (uint64_t)v40, v42);

            if (isEqual)
            {
              id v19 = v27;

              goto LABEL_9;
            }
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v48, (uint64_t)v68, 16);
          if (v22) {
            continue;
          }
          break;
        }
      }

      id v19 = 0;
    }
LABEL_9:

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)addParticipant:(CKShareParticipant *)participant
{
  id v5 = participant;
  uint64_t v39 = v5;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_role(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 953, @"You cannot add a nil participant");

    uint64_t v9 = objc_msgSend_role(0, v32, v33, v34);
  }
  if (v9 != 3 && objc_msgSend_role(v39, v10, v11, v12) != 2)
  {
    uint64_t v13 = objc_msgSend_role(v39, v10, v11, v12);
    uint64_t v14 = @"You can only add PrivateUsers as participants on a share";
    if (v13 == 1) {
      uint64_t v14 = @"You can have only one owner on a share";
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28B00];
    uint64_t v16 = v14;
    uint64_t v20 = objc_msgSend_currentHandler(v15, v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 961, v16);
  }
  uint64_t v25 = objc_msgSend_currentUserParticipant(self, v10, v11, v12);
  if (v25 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v22, v23, v24) & 1) == 0)
  {
    uint64_t v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v24);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 966, @"Only owners may add participants to a share");
  }
  if (objc_msgSend_usesOneTimeURL(v39, v22, v23, v24)
    && (objc_msgSend_isZoneWideShare(self, v26, v27, v28) & 1) == 0)
  {
    long long v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v29, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 969, @"One-time URL participants can only be added to zone-wide shares");
  }
  objc_msgSend__addParticipantBypassingChecks_(self, v26, (uint64_t)v39, v28);
}

- (void)_addParticipantBypassingChecks:(id)a3
{
  id v84 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v84)
  {
    uint64_t v7 = objc_msgSend__knownParticipantEqualToParticipant_(v4, v5, (uint64_t)v84, v6);
    uint64_t v11 = v7;
    if (v7)
    {
      if (objc_msgSend_acceptanceStatus(v7, v8, v9, v10) != 2)
      {
        uint64_t v15 = objc_msgSend_role(v84, v12, v13, v14);
        objc_msgSend_setRole_(v11, v16, v15, v17);
        uint64_t v21 = objc_msgSend_permission(v84, v18, v19, v20);
        objc_msgSend_setPermission_(v11, v22, v21, v23);
      }
    }
    else
    {
      uint64_t v24 = objc_msgSend_recordID(v4, v8, v9, v10);
      uint64_t v31 = objc_msgSend_shareID(v84, v25, v26, v27);
      if (v31)
      {
        id v32 = objc_msgSend_shareID(v84, v28, v29, v30);
        char isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v24, v34);

        if ((isEqual & 1) == 0)
        {
          uint64_t v81 = [CKException alloc];
          id v83 = (id)objc_msgSend_initWithCode_format_(v81, v82, 12, @"You can't move participants between shares. Create a new participant to add to this share");
          objc_exception_throw(v83);
        }
      }
      objc_msgSend_setShareID_(v84, v28, (uint64_t)v24, v30);
      objc_msgSend__unblockIdentitiesReferencedByParticipant_(v4, v36, (uint64_t)v84, v37);
      long long v41 = objc_msgSend_removedParticipantIDs(v4, v38, v39, v40);
      uint64_t v45 = objc_msgSend_participantID(v84, v42, v43, v44);
      int v48 = objc_msgSend_containsObject_(v41, v46, (uint64_t)v45, v47);

      if (v48)
      {
        long long v52 = objc_msgSend_mutableAllParticipants(v4, v49, v50, v51);
        id v54 = objc_msgSend__knownParticipantEqualToParticipant_inParticipants_(v4, v53, (uint64_t)v84, (uint64_t)v52);

        if (v54)
        {
          uint64_t v58 = objc_msgSend_mutableAllParticipants(v4, v55, v56, v57);
          objc_msgSend_removeObject_(v58, v59, (uint64_t)v54, v60);
        }
        id v61 = objc_msgSend_removedParticipantIDs(v4, v55, v56, v57);
        uint64_t v65 = objc_msgSend_participantID(v84, v62, v63, v64);
        objc_msgSend_removeObject_(v61, v66, (uint64_t)v65, v67);
      }
      uint64_t v68 = objc_msgSend_mutableAllParticipants(v4, v49, v50, v51);
      objc_msgSend_addObject_(v68, v69, (uint64_t)v84, v70);

      char v74 = objc_msgSend_addedParticipantIDs(v4, v71, v72, v73);
      uint64_t v78 = objc_msgSend_participantID(v84, v75, v76, v77);
      objc_msgSend_addObject_(v74, v79, (uint64_t)v78, v80);
    }
  }
  objc_sync_exit(v4);
}

- (void)removeParticipant:(CKShareParticipant *)participant
{
  id v5 = participant;
  if (v5)
  {
    uint64_t v47 = v5;
    uint64_t v9 = objc_msgSend_shareID(v5, v6, v7, v8);
    if (!v9) {
      goto LABEL_4;
    }
    uint64_t v13 = (void *)v9;
    uint64_t v14 = objc_msgSend_shareID(v47, v10, v11, v12);
    uint64_t v18 = objc_msgSend_recordID(self, v15, v16, v17);
    char isEqual = objc_msgSend_isEqual_(v14, v19, (uint64_t)v18, v20);

    if ((isEqual & 1) == 0)
    {
      uint64_t v40 = [CKException alloc];
      uint64_t v42 = objc_msgSend_initWithCode_format_(v40, v41, 12, @"You can't move participants between shares. Create a new participant to add to this share");
    }
    else
    {
LABEL_4:
      uint64_t v22 = objc_msgSend__knownParticipantEqualToParticipant_(self, v10, (uint64_t)v47, v12);
      uint64_t v26 = v22;
      if (!v22)
      {
LABEL_11:

        id v5 = v47;
        goto LABEL_12;
      }
      if (objc_msgSend_role(v22, v23, v24, v25) == 1)
      {
        uint64_t v43 = [CKException alloc];
        uint64_t v42 = objc_msgSend_initWithCode_format_(v43, v44, 12, @"You cannot remove the owner from a share");
      }
      else
      {
        if (!objc_msgSend_isCurrentUser(v26, v27, v28, v29))
        {
          long long v36 = objc_msgSend_currentUserParticipant(self, v30, v31, v32);
          if (v36 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v33, v34, v35) & 1) == 0)
          {
            uint64_t v38 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v33, v37, v35);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, (uint64_t)self, @"CKShare.m", 1034, @"Only owners may remove participants from a share");
          }
          objc_msgSend__removeParticipantBypassingChecks_(self, v33, (uint64_t)v47, v35);

          goto LABEL_11;
        }
        uint64_t v45 = [CKException alloc];
        uint64_t v42 = objc_msgSend_initWithCode_format_(v45, v46, 12, @"You cannot remove yourself as a participant on the share.  Delete the share instead if you want out.");
      }
    }
    objc_exception_throw(v42);
  }
LABEL_12:
}

- (void)_removeParticipantBypassingChecks:(id)a3
{
  id v43 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend__knownParticipantEqualToParticipant_(v4, v5, (uint64_t)v43, v6);
  uint64_t v10 = v7;
  if (v7)
  {
    objc_msgSend_setShareID_(v7, v8, 0, v9);
    uint64_t v14 = objc_msgSend_addedParticipantIDs(v4, v11, v12, v13);
    uint64_t v18 = objc_msgSend_participantID(v10, v15, v16, v17);
    int v21 = objc_msgSend_containsObject_(v14, v19, (uint64_t)v18, v20);

    if (v21)
    {
      uint64_t v25 = objc_msgSend_mutableAllParticipants(v4, v22, v23, v24);
      objc_msgSend_removeObject_(v25, v26, (uint64_t)v10, v27);

      uint64_t v31 = objc_msgSend_addedParticipantIDs(v4, v28, v29, v30);
      uint64_t v35 = objc_msgSend_participantID(v10, v32, v33, v34);
      objc_msgSend_removeObject_(v31, v36, (uint64_t)v35, v37);
    }
    else
    {
      uint64_t v31 = objc_msgSend_removedParticipantIDs(v4, v22, v23, v24);
      uint64_t v35 = objc_msgSend_participantID(v10, v38, v39, v40);
      objc_msgSend_addObject_(v31, v41, (uint64_t)v35, v42);
    }
  }
  objc_sync_exit(v4);
}

- (id)addedParticipants
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0D09B8;
  v11[3] = &unk_1E5463EB8;
  v11[4] = v2;
  uint64_t v9 = objc_msgSend_CKFilter_(v6, v7, (uint64_t)v11, v8);

  objc_sync_exit(v2);

  return v9;
}

- (id)removedParticipants
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0D0B00;
  v11[3] = &unk_1E5463EB8;
  v11[4] = v2;
  uint64_t v9 = objc_msgSend_CKFilter_(v6, v7, (uint64_t)v11, v8);

  objc_sync_exit(v2);

  return v9;
}

- (CKShareParticipant)currentUserParticipant
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend_mutableAllParticipants(v2, v3, v4, v5, 0);
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend_isCurrentUser(v14, v8, v9, v10))
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);

  return (CKShareParticipant *)v11;
}

- (BOOL)_participantArray:(id)a3 containsEquivalentWithPermissionsParticipant:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend_isEqual_(v14, v9, (uint64_t)v6, v10, (void)v24)
          && (uint64_t v18 = objc_msgSend_acceptanceStatus(v14, v15, v16, v17),
              v18 == objc_msgSend_acceptanceStatus(v6, v19, v20, v21))
          || objc_msgSend_role(v6, v15, v16, v17) == 1 && objc_msgSend_role(v14, v9, v22, v10) == 1)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v11;
}

- (BOOL)_participantArray:(id)a3 isEquivalentToArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
  if (v11 == objc_msgSend_count(v7, v12, v13, v14))
  {
    if (objc_msgSend_count(v6, v15, v16, v17))
    {
      unint64_t v20 = 0;
      do
      {
        uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, v19);
        char v23 = objc_msgSend__participantArray_containsEquivalentWithPermissionsParticipant_(self, v22, (uint64_t)v7, (uint64_t)v21);

        if ((v23 & 1) == 0) {
          break;
        }
        ++v20;
      }
      while (v20 < objc_msgSend_count(v6, v24, v25, v26));
    }
    else
    {
      char v23 = 1;
    }
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

- (void)resetFetchedParticipants
{
  id obj = self;
  objc_sync_enter(obj);
  id v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4);
  objc_msgSend_setLastFetchedParticipants_(obj, v6, (uint64_t)v5, v7);

  objc_sync_exit(obj);
}

- (void)registerFetchedParticipant:(id)a3
{
  id v15 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_lastFetchedParticipants(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v15, v9, v10, v11);
  objc_msgSend_addObject_(v8, v13, (uint64_t)v12, v14);

  objc_sync_exit(v4);
}

- (id)updateFromServerShare:(id)a3
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_lastFetchedParticipants(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_participants(v5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_participants(v4, v14, v15, v16);
  int isEquivalentToArray = objc_msgSend__participantArray_isEquivalentToArray_(v5, v18, (uint64_t)v17, (uint64_t)v9);
  int v21 = objc_msgSend__participantArray_isEquivalentToArray_(v5, v20, (uint64_t)v13, (uint64_t)v9);
  int v23 = objc_msgSend__participantArray_isEquivalentToArray_(v5, v22, (uint64_t)v13, (uint64_t)v17);

  objc_sync_exit(v5);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  long long v24 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v159 = NSNumber;
    uint64_t v160 = v24;
    v163 = objc_msgSend_numberWithBool_(v159, v161, v21 ^ 1u, v162);
    uint64_t v166 = objc_msgSend_numberWithBool_(NSNumber, v164, isEquivalentToArray ^ 1u, v165);
    *(_DWORD *)buf = 138412546;
    uint64_t v183 = v163;
    __int16 v184 = 2112;
    v185 = v166;
    _os_log_debug_impl(&dword_18AF10000, v160, OS_LOG_TYPE_DEBUG, "Updating local share from a remote share, client participants changed: %@, server participants changed: %@", buf, 0x16u);
  }
  if ((isEquivalentToArray & 1) == 0)
  {
    if (((v21 | v23) & 1) == 0)
    {
      uint64_t v139 = objc_opt_new();
      id v143 = v4;
      v144 = v5;
      uint64_t v151 = objc_msgSend_copyWithOriginalValues(v144, v145, v146, v147);
      if (v151) {
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v151, @"AncestorRecord");
      }
      if (v143) {
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v143, @"ServerRecord");
      }
      if (v144) {
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v144, @"ClientRecord");
      }
      uint64_t v152 = objc_msgSend_participants(v144, v148, v149, v150);
      uint64_t v156 = objc_msgSend_participants(v143, v153, v154, v155);
      uint64_t v142 = objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v157, @"CKInternalErrorDomain", 1022, v139, @"Participants conflict while trying to update share from the server. Participants:\n=== Client: %@\n=== Server: %@", v152, v156);

      goto LABEL_51;
    }
    uint64_t v28 = objc_msgSend_addedParticipants(v5, v25, v26, v27);
    uint64_t v32 = objc_msgSend_removedParticipants(v5, v29, v30, v31);
    uint64_t v33 = v5;
    objc_sync_enter(v33);
    uint64_t v37 = objc_msgSend_participants(v4, v34, v35, v36);
    uint64_t v40 = (void *)v37;
    uint64_t v41 = MEMORY[0x1E4F1CBF0];
    if (v37) {
      objc_msgSend_setAllParticipants_(v33, v38, v37, v39);
    }
    else {
      objc_msgSend_setAllParticipants_(v33, v38, MEMORY[0x1E4F1CBF0], v39);
    }

    objc_msgSend_resetFetchedParticipants(v33, v42, v43, v44);
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    int v48 = objc_msgSend_mutableAllParticipants(v33, v45, v46, v47);
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v175, (uint64_t)v181, 16);
    if (v52)
    {
      uint64_t v53 = *(void *)v176;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v176 != v53) {
            objc_enumerationMutation(v48);
          }
          objc_msgSend_registerFetchedParticipant_(v33, v50, *(void *)(*((void *)&v175 + 1) + 8 * i), v51);
        }
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v175, (uint64_t)v181, 16);
      }
      while (v52);
    }

    uint64_t v58 = objc_msgSend_requesters(v4, v55, v56, v57);
    id v61 = (void *)v58;
    if (v58) {
      objc_msgSend_setRequesters_(v33, v59, v58, v60);
    }
    else {
      objc_msgSend_setRequesters_(v33, v59, v41, v60);
    }

    uint64_t v65 = objc_msgSend_approvedRequesters(v4, v62, v63, v64);
    uint64_t v68 = (void *)v65;
    if (v65) {
      objc_msgSend_setApprovedRequesters_(v33, v66, v65, v67);
    }
    else {
      objc_msgSend_setApprovedRequesters_(v33, v66, v41, v67);
    }

    uint64_t v72 = objc_msgSend_blockedIdentities(v4, v69, v70, v71);
    int v75 = (void *)v72;
    if (v72) {
      objc_msgSend_setBlockedIdentities_(v33, v73, v72, v74);
    }
    else {
      objc_msgSend_setBlockedIdentities_(v33, v73, v41, v74);
    }

    uint64_t v79 = objc_msgSend_accessRequestsEnabled(v4, v76, v77, v78);
    objc_msgSend_setAccessRequestsEnabled_(v33, v80, v79, v81);
    objc_sync_exit(v33);

    objc_msgSend_clearModifiedParticipants(v33, v82, v83, v84);
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v85 = v28;
    uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v171, (uint64_t)v180, 16);
    if (v89)
    {
      uint64_t v90 = *(void *)v172;
      do
      {
        for (uint64_t j = 0; j != v89; ++j)
        {
          if (*(void *)v172 != v90) {
            objc_enumerationMutation(v85);
          }
          objc_msgSend__addParticipantBypassingChecks_(v33, v87, *(void *)(*((void *)&v171 + 1) + 8 * j), v88);
        }
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v87, (uint64_t)&v171, (uint64_t)v180, 16);
      }
      while (v89);
    }

    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v92 = v32;
    uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v167, (uint64_t)v179, 16);
    if (v96)
    {
      uint64_t v97 = *(void *)v168;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v168 != v97) {
            objc_enumerationMutation(v92);
          }
          objc_msgSend__removeParticipantBypassingChecks_(v33, v94, *(void *)(*((void *)&v167 + 1) + 8 * k), v95);
        }
        uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v94, (uint64_t)&v167, (uint64_t)v179, 16);
      }
      while (v96);
    }
  }
  long long v99 = objc_msgSend_invitedProtectionData(v4, v25, v26, v27);
  objc_msgSend_setInvitedProtectionData_(v5, v100, (uint64_t)v99, v101);

  long long v105 = objc_msgSend_invitedProtectionEtag(v4, v102, v103, v104);
  objc_msgSend_setInvitedProtectionEtag_(v5, v106, (uint64_t)v105, v107);

  v111 = objc_msgSend_publicProtectionData(v4, v108, v109, v110);
  objc_msgSend_setPublicProtectionData_(v5, v112, (uint64_t)v111, v113);

  uint64_t v117 = objc_msgSend_publicProtectionEtag(v4, v114, v115, v116);
  objc_msgSend_setPublicProtectionEtag_(v5, v118, (uint64_t)v117, v119);

  v123 = objc_msgSend_etag(v4, v120, v121, v122);
  objc_msgSend_setEtag_(v5, v124, (uint64_t)v123, v125);

  v129 = objc_msgSend_routingKey(v4, v126, v127, v128);
  objc_msgSend_setRoutingKey_(v5, v130, (uint64_t)v129, v131);

  v135 = objc_msgSend_displayedHostname(v4, v132, v133, v134);

  if (!v135)
  {
    uint64_t v142 = 0;
    goto LABEL_52;
  }
  uint64_t v139 = objc_msgSend_displayedHostname(v4, v136, v137, v138);
  objc_msgSend_setDisplayedHostname_(v5, v140, (uint64_t)v139, v141);
  uint64_t v142 = 0;
LABEL_51:

LABEL_52:

  return v142;
}

- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CKShare;
  [(CKRecord *)&v76 updateWithSavedRecordXPCMetadata:v6 shouldOnlySaveAssetContent:v4];
  uint64_t v10 = objc_msgSend_serverRecord(v6, v7, v8, v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = self;
    objc_sync_enter(v11);
    id v12 = v10;
    objc_sync_enter(v12);
    id v13 = v12;
    uint64_t v17 = objc_msgSend_mutableAllParticipants(v13, v14, v15, v16);
    objc_msgSend_setAllParticipants_(v11, v18, (uint64_t)v17, v19);

    int v23 = objc_msgSend_mutableRequesters(v13, v20, v21, v22);
    objc_msgSend_setRequesters_(v11, v24, (uint64_t)v23, v25);

    uint64_t v29 = objc_msgSend_mutableApprovedRequesters(v13, v26, v27, v28);
    objc_msgSend_setApprovedRequesters_(v11, v30, (uint64_t)v29, v31);

    uint64_t v35 = objc_msgSend_mutableBlockedIdentities(v13, v32, v33, v34);
    objc_msgSend_setBlockedIdentities_(v11, v36, (uint64_t)v35, v37);

    uint64_t v41 = objc_msgSend_accessRequestsEnabled(v13, v38, v39, v40);
    objc_msgSend_setAccessRequestsEnabled_(v11, v42, v41, v43);
    objc_msgSend_resetFetchedParticipants(v11, v44, v45, v46);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v50 = objc_msgSend_mutableAllParticipants(v13, v47, v48, v49, 0);
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v72, (uint64_t)v77, 16);
    if (v54)
    {
      uint64_t v55 = *(void *)v73;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v73 != v55) {
            objc_enumerationMutation(v50);
          }
          objc_msgSend_registerFetchedParticipant_(v11, v52, *(void *)(*((void *)&v72 + 1) + 8 * v56++), v53);
        }
        while (v54 != v56);
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v52, (uint64_t)&v72, (uint64_t)v77, 16);
      }
      while (v54);
    }

    objc_msgSend_clearModifiedParticipants(v11, v57, v58, v59);
    uint64_t v63 = objc_msgSend_publicSharingIdentity(v13, v60, v61, v62);
    objc_msgSend_setPublicSharingIdentity_(v11, v64, (uint64_t)v63, v65);

    uint64_t v69 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v13, v66, v67, v68);
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v11, v70, (uint64_t)v69, v71);

    objc_sync_exit(v13);
    objc_sync_exit(v11);
  }
}

- (void)_addParticipantEmails:(id)a3 phoneNumbers:(id)a4 asReadWrite:(BOOL)a5 inContainer:(id)a6 completionHandler:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  uint64_t v17 = objc_msgSend_lookupInfosWithEmails_(CKUserIdentityLookupInfo, v15, (uint64_t)a3, v16);
  uint64_t v18 = (void *)v17;
  uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  if (v17) {
    unint64_t v20 = (void *)v17;
  }
  else {
    unint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v21 = v20;

  long long v24 = objc_msgSend_lookupInfosWithPhoneNumbers_(CKUserIdentityLookupInfo, v22, (uint64_t)v14, v23);

  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = v19;
  }
  id v26 = v25;

  uint64_t v29 = objc_msgSend_arrayByAddingObjectsFromArray_(v21, v27, (uint64_t)v26, v28);

  uint64_t v30 = [CKFetchShareParticipantsOperation alloc];
  uint64_t v33 = objc_msgSend_initWithUserIdentityLookupInfos_(v30, v31, (uint64_t)v29, v32);
  uint64_t v37 = objc_msgSend_resolvedConfiguration(v33, v34, v35, v36);
  objc_msgSend_setRequestOriginator_(v37, v38, 5, v39);

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = sub_18B0D1C7C;
  v52[3] = &unk_1E5463FC8;
  BOOL v53 = a5;
  v52[4] = self;
  objc_msgSend_setPerShareParticipantCompletionBlock_(v33, v40, (uint64_t)v52, v41);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v42 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = v29;
    _os_log_debug_impl(&dword_18AF10000, v42, OS_LOG_TYPE_DEBUG, "Fetching share participants for UI: %@", buf, 0xCu);
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_18B0D1CEC;
  v49[3] = &unk_1E5464018;
  id v50 = v12;
  id v51 = v13;
  v49[4] = self;
  id v43 = v12;
  id v44 = v13;
  objc_msgSend_setFetchShareParticipantsCompletionBlock_(v33, v45, (uint64_t)v49, v46);
  objc_msgSend_addOperation_(v43, v47, (uint64_t)v33, v48);
}

- (void)_stripPersonalInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend__stripPersonalInfo(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (id)_copyWithoutPersonalInfo
{
  BOOL v4 = objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend__stripPersonalInfo(v4, v5, v6, v7);
  return v4;
}

- (void)_getDecryptedShareInContainer:(id)a3 completionHandler:(id)a4
{
}

- (void)setWantsPublicSharingKey:(BOOL)a3
{
  uint64_t v3 = [CKException alloc];
  id v5 = (id)objc_msgSend_initWithCode_format_(v3, v4, 12, @"Cannot set this property on CKShare");
  objc_exception_throw(v5);
}

- (id)encryptedPublicSharingKey
{
  return 0;
}

- (NSData)publicSharingIdentity
{
  BOOL v4 = objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);

  return (NSData *)v8;
}

- (void)setPublicSharingIdentity:(id)a3
{
  id v23 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableEncryptedPSK(v4, v5, v6, v7);
  objc_msgSend_data(v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v23)
  {
    if (v23)
    {
      long long v15 = [CKEncryptedData alloc];
      uint64_t v18 = objc_msgSend_initWithData_(v15, v16, (uint64_t)v23, v17);
      objc_msgSend_setMutableEncryptedPSK_(v4, v19, (uint64_t)v18, v20);
    }
    else
    {
      objc_msgSend_setMutableEncryptedPSK_(v4, v13, 0, v14);
    }
    objc_msgSend_setMutableURL_(v4, v21, 0, v22);
  }
  objc_sync_exit(v4);
}

- (id)oneTimeURLForParticipantID:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
LABEL_13:
    id v21 = 0;
    goto LABEL_32;
  }
  if ((objc_msgSend_isZoneWideShare(self, v4, v5, v6) & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v20 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v91) = 0;
      _os_log_error_impl(&dword_18AF10000, v20, OS_LOG_TYPE_ERROR, "You cannot get a one-time URL for a participant on a hierarhical share", (uint8_t *)&v91, 2u);
    }
    goto LABEL_13;
  }
  uint64_t v10 = objc_msgSend__knownParticipantWithParticipantID_(self, v8, (uint64_t)v7, v9);
  uint64_t v14 = v10;
  if (!v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v18 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    LOWORD(v91) = 0;
    uint64_t v19 = "You cannot get a one-time URL for a participant that isn't on the share";
    goto LABEL_29;
  }
  if (objc_msgSend_role(v10, v11, v12, v13) == 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v18 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    LOWORD(v91) = 0;
    uint64_t v19 = "You cannot get a one-time URL for an owner participant";
    goto LABEL_29;
  }
  uint64_t v22 = objc_msgSend_mutableEncryptedPSK(self, v15, v16, v17);
  uint64_t v26 = objc_msgSend_data(v22, v23, v24, v25);
  if (v26)
  {
    uint64_t v30 = (void *)v26;
    uint64_t v31 = objc_msgSend_routingKey(self, v27, v28, v29);
    uint64_t v35 = objc_msgSend_length(v31, v32, v33, v34);

    if (v35)
    {
      uint64_t v39 = objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v36, v37, v38);
      uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)v7, v41);

      if (v42
        && (objc_msgSend_encryptedOneTimeFullToken(v42, v43, v44, v45),
            uint64_t v46 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_data(v46, v47, v48, v49),
            id v50 = objc_claimAutoreleasedReturnValue(),
            v50,
            v46,
            v50))
      {
        uint64_t v54 = objc_msgSend_routingKey(self, v51, v52, v53);
        uint64_t v57 = objc_msgSend_oneTimeShortTokenWithRoutingKey_(v42, v55, (uint64_t)v54, v56);
        uint64_t v61 = objc_msgSend_CKSafeStringForURLPathComponent(v57, v58, v59, v60);

        if (v61)
        {
          uint64_t v62 = objc_opt_class();
          uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(self, v63, @"cloudkit.title", v64);
          uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(self, v66, @"cloudkit.type", v67);
          long long v72 = objc_msgSend_containerID(self, v69, v70, v71);
          objc_super v76 = objc_msgSend_displayedHostname(self, v73, v74, v75);
          id v21 = objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v62, v77, (uint64_t)v61, (uint64_t)v65, v68, v72, v76);
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v80 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            uint64_t v86 = v80;
            uint64_t v90 = objc_msgSend_recordID(self, v87, v88, v89);
            int v91 = 138412546;
            id v92 = v7;
            __int16 v93 = 2112;
            v94 = v90;
            _os_log_error_impl(&dword_18AF10000, v86, OS_LOG_TYPE_ERROR, "Failed to get the one-time short token for participant %@ on %@", (uint8_t *)&v91, 0x16u);
          }
          id v21 = 0;
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v79 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = v79;
          id v85 = objc_msgSend_recordID(self, v82, v83, v84);
          int v91 = 138412546;
          id v92 = v7;
          __int16 v93 = 2112;
          v94 = v85;
          _os_log_error_impl(&dword_18AF10000, v81, OS_LOG_TYPE_ERROR, "Failed to get the one-time URL metadata for %@ on record %@", (uint8_t *)&v91, 0x16u);
        }
        id v21 = 0;
      }

      goto LABEL_31;
    }
  }
  else
  {
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v18 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v91) = 0;
    uint64_t v19 = "You cannot get a one-time URL for a participant until the share it's been saved to the server";
LABEL_29:
    _os_log_error_impl(&dword_18AF10000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v91, 2u);
  }
LABEL_30:
  id v21 = 0;
LABEL_31:

LABEL_32:

  return v21;
}

- (int64_t)participantVisibility
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t participantVisibility = v2->_participantVisibility;
  objc_sync_exit(v2);

  return participantVisibility;
}

- (void)setParticipantVisibility:(int64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v8 = obj;
  if (obj->_participantVisibility != a3)
  {
    uint64_t v9 = objc_msgSend_publicPermission(obj, v5, v6, v7);
    if (a3 == 1)
    {
      if (v9 == 1)
      {
LABEL_7:
        uint64_t v8 = obj;
        obj->_int64_t participantVisibility = a3;
        goto LABEL_8;
      }
      uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v15, (uint64_t)a2, (uint64_t)obj, @"CKShare.m", 1371, @"Cannot set %@ on a share with publicPermission != CKShareParticipantPermissionNone", @"ReadOnlyParticipantsSeeSelfAndOwner");
    }
    else
    {
      if (a3 != 3 || v9 != 1) {
        goto LABEL_7;
      }
      uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)obj, @"CKShare.m", 1374, @"Cannot set %@ on a share with publicPermission == CKShareParticipantPermissionNone", @"OwnerSeesSelfAndParticipantsSeeSelfAndOwner");
    }

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v8);
}

- (int64_t)participantSelfRemovalBehavior
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t participantSelfRemovalBehavior = v2->_participantSelfRemovalBehavior;
  objc_sync_exit(v2);

  return participantSelfRemovalBehavior;
}

- (void)setParticipantSelfRemovalBehavior:(int64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v11 = objc_msgSend_currentUserParticipant(obj, v5, v6, v7);
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(obj, v8, v9, v10) & 1) == 0)
  {
    long long v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)obj, @"CKShare.m", 1396, @"Only owners may set the participant self removal behavior of a share");
  }
  if (obj->_participantSelfRemovalBehavior != a3) {
    obj->_int64_t participantSelfRemovalBehavior = a3;
  }

  objc_sync_exit(obj);
}

- (BOOL)allNonOwnerParticipantsHavePermission:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_participants(self, a2, a3, v3);
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8) >= 2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend_role(v19, v13, v14, v15, (void)v21) != 1
            && objc_msgSend_permission(v19, v13, v14, v15) != a3)
          {
            BOOL v9 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_14:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)allNonOwnerParticipantsHaveRole:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_participants(self, a2, a3, v3);
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8) >= 2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend_role(v19, v13, v14, v15, (void)v21) != 1 && objc_msgSend_role(v19, v13, v14, v15) != a3)
          {
            BOOL v9 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_14:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeSystemFieldsWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = (void *)MEMORY[0x18C12ADA0]();
  if (!byte_1E9124EF0 && (objc_msgSend_serializePersonalInfo(self, v5, v6, v7) & 1) == 0) {
    objc_msgSend__stripPersonalInfo(self, v9, v10, v11);
  }
  v126.receiver = self;
  v126.super_class = (Class)CKShare;
  [(CKRecord *)&v126 encodeSystemFieldsWithCoder:v4];
  uint64_t v15 = objc_msgSend_containerID(self, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"ContainerID");

  uint64_t v20 = objc_msgSend_rootRecordID(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, @"RootRecordID");

  uint64_t v25 = objc_msgSend_publicPermission(self, v22, v23, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v26, v25, @"PublicPermission");
  LODWORD(v20) = objc_msgSend_encodeAllowsReadOnlyParticipantsToSeeEachOther(self, v27, v28, v29);
  uint64_t v33 = objc_msgSend_participantVisibility(self, v30, v31, v32);
  if (v20) {
    objc_msgSend_encodeBool_forKey_(v4, v34, v33 == 0, @"AllowsReadOnlyParticipantsToSeeEachOther");
  }
  else {
    objc_msgSend_encodeInteger_forKey_(v4, v34, v33, @"ParticipantVisibility");
  }
  uint64_t v38 = objc_msgSend_participantSelfRemovalBehavior(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v4, v39, v38, @"ParticipantSelfRemovalBehavior");
  uint64_t v43 = objc_msgSend_allowsAnonymousPublicAccess(self, v40, v41, v42);
  objc_msgSend_encodeBool_forKey_(v4, v44, v43, @"AllowsAnonymousAccess");
  uint64_t v45 = self;
  objc_sync_enter(v45);
  uint64_t v49 = objc_msgSend_mutableAllParticipants(v45, v46, v47, v48);
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, @"Participants");

  uint64_t v54 = objc_msgSend_lastFetchedParticipants(v45, v51, v52, v53);
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v54, @"LastFetchedParticipants");

  uint64_t v59 = objc_msgSend_addedParticipantIDs(v45, v56, v57, v58);
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, @"AddedParticipantIDs");

  uint64_t v64 = objc_msgSend_removedParticipantIDs(v45, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"RemovedParticipantIDs");

  uint64_t v69 = objc_msgSend_mutableRequesters(v45, v66, v67, v68);
  objc_msgSend_encodeObject_forKey_(v4, v70, (uint64_t)v69, @"Requesters");

  uint64_t v74 = objc_msgSend_mutableApprovedRequesters(v45, v71, v72, v73);
  objc_msgSend_encodeObject_forKey_(v4, v75, (uint64_t)v74, @"ApprovedRequesters");

  uint64_t v79 = objc_msgSend_mutableBlockedIdentities(v45, v76, v77, v78);
  objc_msgSend_encodeObject_forKey_(v4, v80, (uint64_t)v79, @"BlockedIdentities");

  uint64_t v84 = objc_msgSend_accessRequestsEnabled(v45, v81, v82, v83);
  objc_msgSend_encodeBool_forKey_(v4, v85, v84, @"AccessRequestsEnabled");
  uint64_t v89 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v45, v86, v87, v88);
  objc_msgSend_encodeObject_forKey_(v4, v90, (uint64_t)v89, @"oneTimeURLMetadatasByParticipantID");

  objc_sync_exit(v45);
  v94 = objc_msgSend_invitedKeysToRemove(v45, v91, v92, v93);
  objc_msgSend_encodeObject_forKey_(v4, v95, (uint64_t)v94, @"InvitedKeysToRemove");

  if (byte_1E9124EF0 || objc_msgSend_serializeProtectionData(v45, v96, v97, v98))
  {
    long long v99 = objc_msgSend_invitedProtectionData(v45, v96, v97, v98);
    objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, @"InvitedPCS");

    uint64_t v104 = objc_msgSend_invitedProtectionEtag(v45, v101, v102, v103);
    objc_msgSend_encodeObject_forKey_(v4, v105, (uint64_t)v104, @"InvitedPCSEtag");

    uint64_t v109 = objc_msgSend_previousInvitedProtectionEtag(v45, v106, v107, v108);
    objc_msgSend_encodeObject_forKey_(v4, v110, (uint64_t)v109, @"PreviousInvitedPCSEtag");

    uint64_t v114 = objc_msgSend_publicProtectionData(v45, v111, v112, v113);
    objc_msgSend_encodeObject_forKey_(v4, v115, (uint64_t)v114, @"PublicPCS");

    uint64_t v119 = objc_msgSend_publicProtectionEtag(v45, v116, v117, v118);
    objc_msgSend_encodeObject_forKey_(v4, v120, (uint64_t)v119, @"PublicPCSEtag");

    v124 = objc_msgSend_previousPublicProtectionEtag(v45, v121, v122, v123);
    objc_msgSend_encodeObject_forKey_(v4, v125, (uint64_t)v124, @"PreviousPublicPCSEtag");
  }
}

- (CKShare)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v175.receiver = self;
  v175.super_class = (Class)CKShare;
  uint64_t v5 = [(CKRecord *)&v175 initWithCoder:v4];
  if (v5)
  {
    context = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ContainerID");
    containerID = v5->super._containerID;
    v5->super._containerID = (CKContainerID *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"RootRecordID");
    rootRecordID = v5->_rootRecordID;
    v5->_rootRecordID = (CKRecordID *)v12;

    v5->_CKShareParticipantPermission publicPermission = objc_msgSend_decodeIntegerForKey_(v4, v14, @"PublicPermission", v15);
    if (objc_msgSend_containsValueForKey_(v4, v16, @"ParticipantVisibility", v17))
    {
      v5->_int64_t participantVisibility = objc_msgSend_decodeIntegerForKey_(v4, v18, @"ParticipantVisibility", v19);
    }
    else if (objc_msgSend_containsValueForKey_(v4, v18, @"AllowsReadOnlyParticipantsToSeeEachOther", v19))
    {
      if (objc_msgSend_decodeBoolForKey_(v4, v20, @"AllowsReadOnlyParticipantsToSeeEachOther", v21))v5->_int64_t participantVisibility = 0; {
      else
      }
        v5->_int64_t participantVisibility = 1;
    }
    v5->_int64_t participantSelfRemovalBehavior = objc_msgSend_decodeIntegerForKey_(v4, v20, @"ParticipantSelfRemovalBehavior", v21);
    v5->_allowsAnonymousPublicAccess = objc_msgSend_decodeBoolForKey_(v4, v22, @"AllowsAnonymousAccess", v23);
    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v30 = objc_msgSend_setWithObjects_(v24, v28, v25, v29, v26, v27, 0);
    uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"Participants");
    uint64_t v36 = objc_msgSend_mutableCopy(v32, v33, v34, v35);
    mutableAllParticipants = v5->_mutableAllParticipants;
    v5->_mutableAllParticipants = (NSMutableArray *)v36;

    uint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v44 = objc_msgSend_setWithObjects_(v38, v42, v39, v43, v40, v41, 0);
    uint64_t v46 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, @"LastFetchedParticipants");
    uint64_t v50 = objc_msgSend_mutableCopy(v46, v47, v48, v49);
    lastFetchedParticipants = v5->_lastFetchedParticipants;
    v5->_lastFetchedParticipants = (NSMutableArray *)v50;

    uint64_t v52 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v59 = objc_msgSend_setWithObjects_(v52, v57, v53, v58, v54, v55, v56, 0);
    uint64_t v61 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v59, @"AddedParticipantIDs");
    uint64_t v65 = objc_msgSend_mutableCopy(v61, v62, v63, v64);
    addedParticipantIDs = v5->_addedParticipantIDs;
    v5->_addedParticipantIDs = (NSMutableSet *)v65;

    uint64_t v67 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v68 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v74 = objc_msgSend_setWithObjects_(v67, v72, v68, v73, v69, v70, v71, 0);
    objc_super v76 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v75, (uint64_t)v74, @"RemovedParticipantIDs");
    uint64_t v80 = objc_msgSend_mutableCopy(v76, v77, v78, v79);
    removedParticipantIDs = v5->_removedParticipantIDs;
    v5->_removedParticipantIDs = (NSMutableSet *)v80;

    uint64_t v82 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v83 = objc_opt_class();
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    uint64_t v88 = objc_msgSend_setWithObjects_(v82, v86, v83, v87, v84, v85, 0);
    uint64_t v90 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v89, (uint64_t)v88, @"Requesters");
    uint64_t v94 = objc_msgSend_mutableCopy(v90, v91, v92, v93);
    mutableRequesters = v5->_mutableRequesters;
    v5->_mutableRequesters = (NSMutableArray *)v94;

    uint64_t v96 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v97 = objc_opt_class();
    uint64_t v98 = objc_opt_class();
    uint64_t v99 = objc_opt_class();
    uint64_t v102 = objc_msgSend_setWithObjects_(v96, v100, v97, v101, v98, v99, 0);
    uint64_t v104 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v103, (uint64_t)v102, @"ApprovedRequesters");
    uint64_t v108 = objc_msgSend_mutableCopy(v104, v105, v106, v107);
    mutableApprovedRequesters = v5->_mutableApprovedRequesters;
    v5->_mutableApprovedRequesters = (NSMutableArray *)v108;

    uint64_t v110 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v111 = objc_opt_class();
    uint64_t v112 = objc_opt_class();
    uint64_t v113 = objc_opt_class();
    uint64_t v114 = objc_opt_class();
    uint64_t v117 = objc_msgSend_setWithObjects_(v110, v115, v111, v116, v112, v113, v114, 0);
    uint64_t v119 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v118, (uint64_t)v117, @"BlockedIdentities");
    uint64_t v123 = objc_msgSend_mutableCopy(v119, v120, v121, v122);
    mutableBlockedIdentities = v5->_mutableBlockedIdentities;
    v5->_mutableBlockedIdentities = (NSMutableArray *)v123;

    v5->_accessRequestsEnabled = objc_msgSend_decodeBoolForKey_(v4, v125, @"AccessRequestsEnabled", v126);
    uint64_t v127 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v128 = objc_opt_class();
    uint64_t v129 = objc_opt_class();
    uint64_t v130 = objc_opt_class();
    uint64_t v131 = objc_opt_class();
    uint64_t v134 = objc_msgSend_setWithObjects_(v127, v132, v128, v133, v129, v130, v131, 0);
    uint64_t v136 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, @"oneTimeURLMetadatasByParticipantID");
    oneTimeURLMetadatasByParticipantID = v5->_oneTimeURLMetadatasByParticipantID;
    v5->_oneTimeURLMetadatasByParticipantID = (NSMutableDictionary *)v136;

    uint64_t v138 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v139 = objc_opt_class();
    uint64_t v140 = objc_opt_class();
    uint64_t v141 = objc_opt_class();
    uint64_t v142 = objc_opt_class();
    v145 = objc_msgSend_setWithObjects_(v138, v143, v139, v144, v140, v141, v142, 0);
    uint64_t v147 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v146, (uint64_t)v145, @"InvitedKeysToRemove");
    invitedKeysToRemove = v5->_invitedKeysToRemove;
    v5->_invitedKeysToRemove = (NSArray *)v147;

    uint64_t v149 = objc_opt_class();
    uint64_t v151 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v150, v149, @"InvitedPCS");
    invitedProtectionData = v5->_invitedProtectionData;
    v5->_invitedProtectionData = (NSData *)v151;

    uint64_t v153 = objc_opt_class();
    uint64_t v155 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v154, v153, @"InvitedPCSEtag");
    invitedProtectionEtag = v5->_invitedProtectionEtag;
    v5->_invitedProtectionEtag = (NSString *)v155;

    uint64_t v157 = objc_opt_class();
    uint64_t v159 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v158, v157, @"PreviousInvitedPCSEtag");
    previousInvitedProtectionEtag = v5->_previousInvitedProtectionEtag;
    v5->_previousInvitedProtectionEtag = (NSString *)v159;

    uint64_t v161 = objc_opt_class();
    uint64_t v163 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v162, v161, @"PublicPCS");
    publicProtectionData = v5->_publicProtectionData;
    v5->_publicProtectionData = (NSData *)v163;

    uint64_t v165 = objc_opt_class();
    uint64_t v167 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, @"PublicPCSEtag");
    publicProtectionEtag = v5->_publicProtectionEtag;
    v5->_publicProtectionEtag = (NSString *)v167;

    uint64_t v169 = objc_opt_class();
    uint64_t v171 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v170, v169, @"PreviousPublicPCSEtag");
    previousPublicProtectionEtag = v5->_previousPublicProtectionEtag;
    v5->_previousPublicProtectionEtag = (NSString *)v171;
  }

  return v5;
}

- (BOOL)accessRequestsEnabled
{
  return self->_accessRequestsEnabled;
}

- (void)setAccessRequestsEnabled:(BOOL)a3
{
  self->_accessRequestsEnabled = a3;
}

- (BOOL)encodeAllowsReadOnlyParticipantsToSeeEachOther
{
  return self->_encodeAllowsReadOnlyParticipantsToSeeEachOther;
}

- (void)setEncodeAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3
{
  self->_encodeAllowsReadOnlyParticipantsToSeeEachOther = a3;
}

- (CKRecordID)rootRecordID
{
  return self->_rootRecordID;
}

- (BOOL)allowsAnonymousPublicAccess
{
  return self->_allowsAnonymousPublicAccess;
}

- (void)setAllowsAnonymousPublicAccess:(BOOL)a3
{
  self->_allowsAnonymousPublicAccess = a3;
}

- (NSMutableArray)mutableAllParticipants
{
  return self->_mutableAllParticipants;
}

- (void)setMutableAllParticipants:(id)a3
{
}

- (NSMutableArray)lastFetchedParticipants
{
  return self->_lastFetchedParticipants;
}

- (void)setLastFetchedParticipants:(id)a3
{
}

- (NSMutableSet)addedParticipantIDs
{
  return self->_addedParticipantIDs;
}

- (NSMutableSet)removedParticipantIDs
{
  return self->_removedParticipantIDs;
}

- (NSMutableArray)mutableRequesters
{
  return self->_mutableRequesters;
}

- (void)setMutableRequesters:(id)a3
{
}

- (NSMutableArray)mutableApprovedRequesters
{
  return self->_mutableApprovedRequesters;
}

- (void)setMutableApprovedRequesters:(id)a3
{
}

- (NSMutableArray)mutableBlockedIdentities
{
  return self->_mutableBlockedIdentities;
}

- (void)setMutableBlockedIdentities:(id)a3
{
}

- (NSData)invitedProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setInvitedProtectionData:(id)a3
{
}

- (NSString)invitedProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setInvitedProtectionEtag:(id)a3
{
}

- (NSString)previousInvitedProtectionEtag
{
  return self->_previousInvitedProtectionEtag;
}

- (NSData)publicProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPublicProtectionData:(id)a3
{
}

- (NSString)publicProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (void)setPublicProtectionEtag:(id)a3
{
}

- (NSString)previousPublicProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPreviousPublicProtectionEtag:(id)a3
{
}

- (BOOL)serializePersonalInfo
{
  return self->_serializePersonalInfo;
}

- (void)setSerializePersonalInfo:(BOOL)a3
{
  self->_serializePersonalInfo = a3;
}

- (CKShareID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_previousPublicProtectionEtag, 0);
  objc_storeStrong((id *)&self->_publicProtectionEtag, 0);
  objc_storeStrong((id *)&self->_publicProtectionData, 0);
  objc_storeStrong((id *)&self->_previousInvitedProtectionEtag, 0);
  objc_storeStrong((id *)&self->_invitedProtectionEtag, 0);
  objc_storeStrong((id *)&self->_invitedProtectionData, 0);
  objc_storeStrong((id *)&self->_mutableBlockedIdentities, 0);
  objc_storeStrong((id *)&self->_mutableApprovedRequesters, 0);
  objc_storeStrong((id *)&self->_mutableRequesters, 0);
  objc_storeStrong((id *)&self->_removedParticipantIDs, 0);
  objc_storeStrong((id *)&self->_addedParticipantIDs, 0);
  objc_storeStrong((id *)&self->_lastFetchedParticipants, 0);
  objc_storeStrong((id *)&self->_mutableAllParticipants, 0);
  objc_storeStrong((id *)&self->_rootRecordID, 0);
  objc_storeStrong((id *)&self->_oneTimeURLMetadatasByParticipantID, 0);

  objc_storeStrong((id *)&self->_invitedKeysToRemove, 0);
}

@end
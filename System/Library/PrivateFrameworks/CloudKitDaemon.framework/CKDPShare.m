@interface CKDPShare
+ (Class)invitedKeyToRemoveType;
+ (Class)participantType;
+ (Class)potentialMatchType;
- (BOOL)anonymousPublicAccess;
- (BOOL)denyAccessRequests;
- (BOOL)hasAnonymousPublicAccess;
- (BOOL)hasBlockedRequestingAccess;
- (BOOL)hasDenyAccessRequests;
- (BOOL)hasDisplayedHostname;
- (BOOL)hasEtag;
- (BOOL)hasInvitedPcs;
- (BOOL)hasOrigin;
- (BOOL)hasParticipantSelfRemovalBehavior;
- (BOOL)hasPublicAccess;
- (BOOL)hasPublisherModel;
- (BOOL)hasPublisherModelType;
- (BOOL)hasRequestingAccess;
- (BOOL)hasSelfAddedPcs;
- (BOOL)hasShareId;
- (BOOL)hasShortTokenHash;
- (BOOL)hasShortTokenRoutingKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)publisherModel;
- (BOOL)readFrom:(id)a3;
- (CKDPProtectionInfo)invitedPcs;
- (CKDPProtectionInfo)selfAddedPcs;
- (CKDPShareAccessBlockedRequesters)blockedRequestingAccess;
- (CKDPShareAccessRequesters)requestingAccess;
- (CKDPShareIdentifier)shareId;
- (NSData)shortTokenHash;
- (NSMutableArray)invitedKeyToRemoves;
- (NSMutableArray)participants;
- (NSMutableArray)potentialMatchs;
- (NSString)displayedHostname;
- (NSString)etag;
- (NSString)origin;
- (NSString)shortTokenRoutingKey;
- (id)_publicAccessCKLogValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)invitedKeyToRemoveAtIndex:(unint64_t)a3;
- (id)participantAtIndex:(unint64_t)a3;
- (id)participantSelfRemovalBehaviorAsString:(int)a3;
- (id)potentialMatchAtIndex:(unint64_t)a3;
- (id)publicAccessAsString:(int)a3;
- (id)publisherModelTypeAsString:(int)a3;
- (int)StringAsParticipantSelfRemovalBehavior:(id)a3;
- (int)StringAsPublicAccess:(id)a3;
- (int)StringAsPublisherModelType:(id)a3;
- (int)participantSelfRemovalBehavior;
- (int)publicAccess;
- (int)publisherModelType;
- (unint64_t)hash;
- (unint64_t)invitedKeyToRemovesCount;
- (unint64_t)participantsCount;
- (unint64_t)potentialMatchsCount;
- (void)addInvitedKeyToRemove:(id)a3;
- (void)addParticipant:(id)a3;
- (void)addPotentialMatch:(id)a3;
- (void)clearInvitedKeyToRemoves;
- (void)clearParticipants;
- (void)clearPotentialMatchs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousPublicAccess:(BOOL)a3;
- (void)setBlockedRequestingAccess:(id)a3;
- (void)setDenyAccessRequests:(BOOL)a3;
- (void)setDisplayedHostname:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasAnonymousPublicAccess:(BOOL)a3;
- (void)setHasDenyAccessRequests:(BOOL)a3;
- (void)setHasParticipantSelfRemovalBehavior:(BOOL)a3;
- (void)setHasPublicAccess:(BOOL)a3;
- (void)setHasPublisherModel:(BOOL)a3;
- (void)setHasPublisherModelType:(BOOL)a3;
- (void)setInvitedKeyToRemoves:(id)a3;
- (void)setInvitedPcs:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setParticipantSelfRemovalBehavior:(int)a3;
- (void)setParticipants:(id)a3;
- (void)setPotentialMatchs:(id)a3;
- (void)setPublicAccess:(int)a3;
- (void)setPublisherModel:(BOOL)a3;
- (void)setPublisherModelType:(int)a3;
- (void)setRequestingAccess:(id)a3;
- (void)setSelfAddedPcs:(id)a3;
- (void)setShareId:(id)a3;
- (void)setShortTokenHash:(id)a3;
- (void)setShortTokenRoutingKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShare

- (id)_publicAccessCKLogValue
{
  uint64_t v3 = objc_msgSend_publicAccess(self, a2, v2);
  if ((v3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E64F4F00[(int)v3 - 1];
  }
  return v5;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (int)publicAccess
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_publicAccess;
  }
  else {
    return 1;
  }
}

- (void)setPublicAccess:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_publicAccess = a3;
}

- (void)setHasPublicAccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublicAccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)publicAccessAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F6670[a3 - 1];
  }
  return v3;
}

- (int)StringAsPublicAccess:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"none"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"readOnly"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"readWrite"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"derived"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasInvitedPcs
{
  return self->_invitedPcs != 0;
}

- (BOOL)hasSelfAddedPcs
{
  return self->_selfAddedPcs != 0;
}

- (void)clearParticipants
{
  objc_msgSend_removeAllObjects(self->_participants, a2, v2);
}

- (void)addParticipant:(id)a3
{
  v4 = (const char *)a3;
  participants = self->_participants;
  v8 = (char *)v4;
  if (!participants)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  objc_msgSend_addObject_(participants, v4, (uint64_t)v4);
}

- (unint64_t)participantsCount
{
  return objc_msgSend_count(self->_participants, a2, v2);
}

- (id)participantAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_participants, a2, a3);
}

+ (Class)participantType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShortTokenRoutingKey
{
  return self->_shortTokenRoutingKey != 0;
}

- (void)clearPotentialMatchs
{
  objc_msgSend_removeAllObjects(self->_potentialMatchs, a2, v2);
}

- (void)addPotentialMatch:(id)a3
{
  v4 = (const char *)a3;
  potentialMatchs = self->_potentialMatchs;
  v8 = (char *)v4;
  if (!potentialMatchs)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_potentialMatchs;
    self->_potentialMatchs = v6;

    v4 = v8;
    potentialMatchs = self->_potentialMatchs;
  }
  objc_msgSend_addObject_(potentialMatchs, v4, (uint64_t)v4);
}

- (unint64_t)potentialMatchsCount
{
  return objc_msgSend_count(self->_potentialMatchs, a2, v2);
}

- (id)potentialMatchAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_potentialMatchs, a2, a3);
}

+ (Class)potentialMatchType
{
  return (Class)objc_opt_class();
}

- (void)clearInvitedKeyToRemoves
{
  objc_msgSend_removeAllObjects(self->_invitedKeyToRemoves, a2, v2);
}

- (void)addInvitedKeyToRemove:(id)a3
{
  v4 = (const char *)a3;
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  v8 = (char *)v4;
  if (!invitedKeyToRemoves)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_invitedKeyToRemoves;
    self->_invitedKeyToRemoves = v6;

    v4 = v8;
    invitedKeyToRemoves = self->_invitedKeyToRemoves;
  }
  objc_msgSend_addObject_(invitedKeyToRemoves, v4, (uint64_t)v4);
}

- (unint64_t)invitedKeyToRemovesCount
{
  return objc_msgSend_count(self->_invitedKeyToRemoves, a2, v2);
}

- (id)invitedKeyToRemoveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_invitedKeyToRemoves, a2, a3);
}

+ (Class)invitedKeyToRemoveType
{
  return (Class)objc_opt_class();
}

- (BOOL)publisherModel
{
  return (*(unsigned char *)&self->_has & 0x20) != 0 && self->_publisherModel;
}

- (void)setPublisherModel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_publisherModel = a3;
}

- (void)setHasPublisherModel:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPublisherModel
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)anonymousPublicAccess
{
  return (*(unsigned char *)&self->_has & 8) != 0 && self->_anonymousPublicAccess;
}

- (void)setAnonymousPublicAccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_anonymousPublicAccess = a3;
}

- (void)setHasAnonymousPublicAccess:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAnonymousPublicAccess
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasDisplayedHostname
{
  return self->_displayedHostname != 0;
}

- (int)publisherModelType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_publisherModelType;
  }
  else {
    return 1;
  }
}

- (void)setPublisherModelType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_publisherModelType = a3;
}

- (void)setHasPublisherModelType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPublisherModelType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)publisherModelTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F6690[a3 - 1];
  }
  return v3;
}

- (int)StringAsPublisherModelType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"participantsSeeAccepted"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"readOnlyCannotSeeReadOnly"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"selfAndOwner"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"anonymousPublic"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (int)participantSelfRemovalBehavior
{
  if (*(unsigned char *)&self->_has) {
    return self->_participantSelfRemovalBehavior;
  }
  else {
    return 1;
  }
}

- (void)setParticipantSelfRemovalBehavior:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantSelfRemovalBehavior = a3;
}

- (void)setHasParticipantSelfRemovalBehavior:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantSelfRemovalBehavior
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)participantSelfRemovalBehaviorAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E64F66B0[a3 - 1];
  }
  return v3;
}

- (int)StringAsParticipantSelfRemovalBehavior:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"setInvited"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"setUnsubscribed"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"removeFromShare"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)denyAccessRequests
{
  return (*(unsigned char *)&self->_has & 0x10) != 0 && self->_denyAccessRequests;
}

- (void)setDenyAccessRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_denyAccessRequests = a3;
}

- (void)setHasDenyAccessRequests:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDenyAccessRequests
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasRequestingAccess
{
  return self->_requestingAccess != 0;
}

- (BOOL)hasBlockedRequestingAccess
{
  return self->_blockedRequestingAccess != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShare;
  v4 = [(CKDPShare *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  shareId = self->_shareId;
  if (shareId)
  {
    v8 = objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"shareId");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v11 = self->_publicAccess - 1;
    if (v11 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_publicAccess);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E64F6670[v11];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v12, @"publicAccess");
  }
  invitedPcs = self->_invitedPcs;
  if (invitedPcs)
  {
    v14 = objc_msgSend_dictionaryRepresentation(invitedPcs, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"invitedPcs");
  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    v17 = objc_msgSend_dictionaryRepresentation(selfAddedPcs, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"selfAddedPcs");
  }
  if (objc_msgSend_count(self->_participants, v4, (uint64_t)etag))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = objc_msgSend_count(self->_participants, v21, v22);
    v25 = objc_msgSend_initWithCapacity_(v20, v24, v23);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v26 = self->_participants;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v83, v88, 16);
    if (v28)
    {
      uint64_t v31 = v28;
      uint64_t v32 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v84 != v32) {
            objc_enumerationMutation(v26);
          }
          v34 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v83 + 1) + 8 * i), v29, v30);
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v83, v88, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v25, @"participant");
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  if (shortTokenRoutingKey) {
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)shortTokenRoutingKey, @"shortTokenRoutingKey");
  }
  if (objc_msgSend_count(self->_potentialMatchs, v19, (uint64_t)shortTokenRoutingKey))
  {
    id v39 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v42 = objc_msgSend_count(self->_potentialMatchs, v40, v41);
    v44 = objc_msgSend_initWithCapacity_(v39, v43, v42);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v45 = self->_potentialMatchs;
    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v79, v87, 16);
    if (v47)
    {
      uint64_t v50 = v47;
      uint64_t v51 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v80 != v51) {
            objc_enumerationMutation(v45);
          }
          v53 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v79 + 1) + 8 * j), v48, v49);
          objc_msgSend_addObject_(v44, v54, (uint64_t)v53);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v79, v87, 16);
      }
      while (v50);
    }

    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v44, @"potentialMatch");
  }
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  if (invitedKeyToRemoves) {
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)invitedKeyToRemoves, @"invitedKeyToRemove");
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v58 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v38, self->_publisherModel);
    objc_msgSend_setObject_forKey_(v6, v59, (uint64_t)v58, @"publisherModel");

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v60 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v38, self->_anonymousPublicAccess);
    objc_msgSend_setObject_forKey_(v6, v61, (uint64_t)v60, @"anonymousPublicAccess");
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname) {
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)displayedHostname, @"displayedHostname");
  }
  char v63 = (char)self->_has;
  if ((v63 & 4) != 0)
  {
    unsigned int v75 = self->_publisherModelType - 1;
    if (v75 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v38, @"(unknown: %i)", self->_publisherModelType);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E64F6690[v75];
    }
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v76, @"publisherModelType");

    char v63 = (char)self->_has;
    if ((v63 & 1) == 0)
    {
LABEL_44:
      if ((v63 & 0x10) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_44;
  }
  unsigned int v77 = self->_participantSelfRemovalBehavior - 1;
  if (v77 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, v38, @"(unknown: %i)", self->_participantSelfRemovalBehavior);
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = off_1E64F66B0[v77];
  }
  objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v78, @"participantSelfRemovalBehavior");

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    v64 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v38, self->_denyAccessRequests);
    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v64, @"denyAccessRequests");
  }
LABEL_46:
  requestingAccess = self->_requestingAccess;
  if (requestingAccess)
  {
    v67 = objc_msgSend_dictionaryRepresentation(requestingAccess, v38, (uint64_t)displayedHostname);
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, @"requestingAccess");
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  if (blockedRequestingAccess)
  {
    v70 = objc_msgSend_dictionaryRepresentation(blockedRequestingAccess, v38, (uint64_t)displayedHostname);
    objc_msgSend_setObject_forKey_(v6, v71, (uint64_t)v70, @"blockedRequestingAccess");
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash) {
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)shortTokenHash, @"shortTokenHash");
  }
  origin = self->_origin;
  if (origin) {
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)origin, @"origin");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPShareReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_shareId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_invitedPcs) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_selfAddedPcs) {
    PBDataWriterWriteSubmessage();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = self->_participants;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v36, v42, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v36, v42, 16);
    }
    while (v8);
  }

  if (self->_shortTokenRoutingKey) {
    PBDataWriterWriteStringField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v12 = self->_potentialMatchs;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, v41, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v32, v41, 16);
    }
    while (v15);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = self->_invitedKeyToRemoves;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v28, v40, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v28, v40, 16);
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_displayedHostname) {
    PBDataWriterWriteStringField();
  }
  char v27 = (char)self->_has;
  if ((v27 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v27 = (char)self->_has;
    if ((v27 & 1) == 0)
    {
LABEL_42:
      if ((v27 & 0x10) == 0) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_43:
  }
    PBDataWriterWriteBOOLField();
LABEL_44:
  if (self->_requestingAccess) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_blockedRequestingAccess) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_shortTokenHash) {
    PBDataWriterWriteDataField();
  }
  if (self->_origin) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  shareId = self->_shareId;
  v46 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    id v4 = v46;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v46, v5, (uint64_t)etag);
    id v4 = v46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_publicAccess;
    v4[132] |= 2u;
  }
  invitedPcs = self->_invitedPcs;
  if (invitedPcs) {
    objc_msgSend_setInvitedPcs_(v46, v5, (uint64_t)invitedPcs);
  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs) {
    objc_msgSend_setSelfAddedPcs_(v46, v5, (uint64_t)selfAddedPcs);
  }
  if (objc_msgSend_participantsCount(self, v5, (uint64_t)selfAddedPcs))
  {
    objc_msgSend_clearParticipants(v46, v10, v11);
    uint64_t v14 = objc_msgSend_participantsCount(self, v12, v13);
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        v17 = objc_msgSend_participantAtIndex_(self, v10, i);
        objc_msgSend_addParticipant_(v46, v18, (uint64_t)v17);
      }
    }
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  if (shortTokenRoutingKey) {
    objc_msgSend_setShortTokenRoutingKey_(v46, v10, (uint64_t)shortTokenRoutingKey);
  }
  if (objc_msgSend_potentialMatchsCount(self, v10, (uint64_t)shortTokenRoutingKey))
  {
    objc_msgSend_clearPotentialMatchs(v46, v20, v21);
    uint64_t v24 = objc_msgSend_potentialMatchsCount(self, v22, v23);
    if (v24)
    {
      uint64_t v25 = v24;
      for (uint64_t j = 0; j != v25; ++j)
      {
        char v27 = objc_msgSend_potentialMatchAtIndex_(self, v20, j);
        objc_msgSend_addPotentialMatch_(v46, v28, (uint64_t)v27);
      }
    }
  }
  if (objc_msgSend_invitedKeyToRemovesCount(self, v20, v21))
  {
    objc_msgSend_clearInvitedKeyToRemoves(v46, v29, v30);
    uint64_t v33 = objc_msgSend_invitedKeyToRemovesCount(self, v31, v32);
    if (v33)
    {
      uint64_t v34 = v33;
      for (uint64_t k = 0; k != v34; ++k)
      {
        long long v36 = objc_msgSend_invitedKeyToRemoveAtIndex_(self, v29, k);
        objc_msgSend_addInvitedKeyToRemove_(v46, v37, (uint64_t)v36);
      }
    }
  }
  char has = (char)self->_has;
  long long v39 = v46;
  if ((has & 0x20) != 0)
  {
    v46[130] = self->_publisherModel;
    v46[132] |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v46[128] = self->_anonymousPublicAccess;
    v46[132] |= 8u;
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
  {
    objc_msgSend_setDisplayedHostname_(v46, v29, (uint64_t)displayedHostname);
    long long v39 = v46;
  }
  char v41 = (char)self->_has;
  if ((v41 & 4) != 0)
  {
    *((_DWORD *)v39 + 21) = self->_publisherModelType;
    v39[132] |= 4u;
    char v41 = (char)self->_has;
    if ((v41 & 1) == 0)
    {
LABEL_33:
      if ((v41 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)v39 + 14) = self->_participantSelfRemovalBehavior;
  v39[132] |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_34:
    v39[129] = self->_denyAccessRequests;
    v39[132] |= 0x10u;
  }
LABEL_35:
  requestingAccess = self->_requestingAccess;
  if (requestingAccess)
  {
    objc_msgSend_setRequestingAccess_(v46, v29, (uint64_t)requestingAccess);
    long long v39 = v46;
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  if (blockedRequestingAccess)
  {
    objc_msgSend_setBlockedRequestingAccess_(v46, v29, (uint64_t)blockedRequestingAccess);
    long long v39 = v46;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v46, v29, (uint64_t)shortTokenHash);
    long long v39 = v46;
  }
  origin = self->_origin;
  if (origin)
  {
    objc_msgSend_setOrigin_(v46, v29, (uint64_t)origin);
    long long v39 = v46;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 80) = self->_publicAccess;
    *(unsigned char *)(v10 + 132) |= 2u;
  }
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_invitedPcs, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_selfAddedPcs, v20, (uint64_t)a3);
  uint64_t v22 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v21;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v23 = self->_participants;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v79, v85, 16);
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v80 != v28) {
          objc_enumerationMutation(v23);
        }
        uint64_t v30 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v79 + 1) + 8 * i), v26, (uint64_t)a3);
        objc_msgSend_addParticipant_((void *)v10, v31, (uint64_t)v30);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v79, v85, 16);
    }
    while (v27);
  }

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_shortTokenRoutingKey, v32, (uint64_t)a3);
  uint64_t v34 = *(void **)(v10 + 120);
  *(void *)(v10 + 120) = v33;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v35 = self->_potentialMatchs;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v75, v84, 16);
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v76 != v40) {
          objc_enumerationMutation(v35);
        }
        uint64_t v42 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v75 + 1) + 8 * j), v38, (uint64_t)a3);
        objc_msgSend_addPotentialMatch_((void *)v10, v43, (uint64_t)v42);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v75, v84, 16);
    }
    while (v39);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v44 = self->_invitedKeyToRemoves;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v71, v83, 16);
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v72 != v49) {
          objc_enumerationMutation(v44);
        }
        uint64_t v51 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v71 + 1) + 8 * k), v47, (uint64_t)a3, (void)v71);
        objc_msgSend_addInvitedKeyToRemove_((void *)v10, v52, (uint64_t)v51);
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v71, v83, 16);
    }
    while (v48);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v10 + 130) = self->_publisherModel;
    *(unsigned char *)(v10 + 132) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v10 + 128) = self->_anonymousPublicAccess;
    *(unsigned char *)(v10 + 132) |= 8u;
  }
  uint64_t v55 = objc_msgSend_copyWithZone_(self->_displayedHostname, v53, (uint64_t)a3, (void)v71);
  v56 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v55;

  char v58 = (char)self->_has;
  if ((v58 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_30;
    }
LABEL_34:
    *(_DWORD *)(v10 + 56) = self->_participantSelfRemovalBehavior;
    *(unsigned char *)(v10 + 132) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  *(_DWORD *)(v10 + 84) = self->_publisherModelType;
  *(unsigned char *)(v10 + 132) |= 4u;
  char v58 = (char)self->_has;
  if (v58) {
    goto LABEL_34;
  }
LABEL_30:
  if ((v58 & 0x10) != 0)
  {
LABEL_31:
    *(unsigned char *)(v10 + 129) = self->_denyAccessRequests;
    *(unsigned char *)(v10 + 132) |= 0x10u;
  }
LABEL_32:
  uint64_t v59 = objc_msgSend_copyWithZone_(self->_requestingAccess, v57, (uint64_t)a3);
  v60 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v59;

  uint64_t v62 = objc_msgSend_copyWithZone_(self->_blockedRequestingAccess, v61, (uint64_t)a3);
  char v63 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v62;

  uint64_t v65 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v64, (uint64_t)a3);
  v66 = *(void **)(v10 + 112);
  *(void *)(v10 + 112) = v65;

  uint64_t v68 = objc_msgSend_copyWithZone_(self->_origin, v67, (uint64_t)a3);
  v69 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v68;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_68;
  }
  shareId = self->_shareId;
  uint64_t v9 = v4[13];
  if ((unint64_t)shareId | v9)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v9)) {
      goto LABEL_68;
    }
  }
  etag = self->_etag;
  uint64_t v11 = v4[3];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11)) {
      goto LABEL_68;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 2) == 0 || self->_publicAccess != *((_DWORD *)v4 + 20)) {
      goto LABEL_68;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 2) != 0)
  {
    goto LABEL_68;
  }
  invitedPcs = self->_invitedPcs;
  uint64_t v13 = v4[5];
  if ((unint64_t)invitedPcs | v13 && !objc_msgSend_isEqual_(invitedPcs, v7, v13)) {
    goto LABEL_68;
  }
  selfAddedPcs = self->_selfAddedPcs;
  uint64_t v15 = v4[12];
  if ((unint64_t)selfAddedPcs | v15)
  {
    if (!objc_msgSend_isEqual_(selfAddedPcs, v7, v15)) {
      goto LABEL_68;
    }
  }
  participants = self->_participants;
  uint64_t v17 = v4[8];
  if ((unint64_t)participants | v17)
  {
    if (!objc_msgSend_isEqual_(participants, v7, v17)) {
      goto LABEL_68;
    }
  }
  shortTokenRoutingKey = self->_shortTokenRoutingKey;
  uint64_t v19 = v4[15];
  if ((unint64_t)shortTokenRoutingKey | v19)
  {
    if (!objc_msgSend_isEqual_(shortTokenRoutingKey, v7, v19)) {
      goto LABEL_68;
    }
  }
  potentialMatchs = self->_potentialMatchs;
  uint64_t v21 = v4[9];
  if ((unint64_t)potentialMatchs | v21)
  {
    if (!objc_msgSend_isEqual_(potentialMatchs, v7, v21)) {
      goto LABEL_68;
    }
  }
  invitedKeyToRemoves = self->_invitedKeyToRemoves;
  uint64_t v23 = v4[4];
  if ((unint64_t)invitedKeyToRemoves | v23)
  {
    if (!objc_msgSend_isEqual_(invitedKeyToRemoves, v7, v23)) {
      goto LABEL_68;
    }
  }
  char has = (char)self->_has;
  char v25 = *((unsigned char *)v4 + 132);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 0x20) == 0) {
      goto LABEL_68;
    }
    if (self->_publisherModel)
    {
      if (!*((unsigned char *)v4 + 130)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 130))
    {
      goto LABEL_68;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 8) == 0) {
      goto LABEL_68;
    }
    if (self->_anonymousPublicAccess)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_68;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 8) != 0)
  {
    goto LABEL_68;
  }
  displayedHostname = self->_displayedHostname;
  uint64_t v27 = v4[2];
  if ((unint64_t)displayedHostname | v27)
  {
    if (!objc_msgSend_isEqual_(displayedHostname, v7, v27)) {
      goto LABEL_68;
    }
    char has = (char)self->_has;
    char v25 = *((unsigned char *)v4 + 132);
  }
  if ((has & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_publisherModelType != *((_DWORD *)v4 + 21)) {
      goto LABEL_68;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_68;
  }
  if (has)
  {
    if ((v25 & 1) == 0 || self->_participantSelfRemovalBehavior != *((_DWORD *)v4 + 14)) {
      goto LABEL_68;
    }
  }
  else if (v25)
  {
    goto LABEL_68;
  }
  if ((has & 0x10) != 0)
  {
    if ((v25 & 0x10) != 0)
    {
      if (self->_denyAccessRequests)
      {
        if (!*((unsigned char *)v4 + 129)) {
          goto LABEL_68;
        }
        goto LABEL_60;
      }
      if (!*((unsigned char *)v4 + 129)) {
        goto LABEL_60;
      }
    }
LABEL_68:
    char isEqual = 0;
    goto LABEL_69;
  }
  if ((v25 & 0x10) != 0) {
    goto LABEL_68;
  }
LABEL_60:
  requestingAccess = self->_requestingAccess;
  uint64_t v29 = v4[11];
  if ((unint64_t)requestingAccess | v29 && !objc_msgSend_isEqual_(requestingAccess, v7, v29)) {
    goto LABEL_68;
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  uint64_t v31 = v4[1];
  if ((unint64_t)blockedRequestingAccess | v31)
  {
    if (!objc_msgSend_isEqual_(blockedRequestingAccess, v7, v31)) {
      goto LABEL_68;
    }
  }
  shortTokenHash = self->_shortTokenHash;
  uint64_t v33 = v4[14];
  if ((unint64_t)shortTokenHash | v33)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v33)) {
      goto LABEL_68;
    }
  }
  origin = self->_origin;
  uint64_t v35 = v4[6];
  if ((unint64_t)origin | v35) {
    char isEqual = objc_msgSend_isEqual_(origin, v7, v35);
  }
  else {
    char isEqual = 1;
  }
LABEL_69:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v46 = objc_msgSend_hash(self->_shareId, a2, v2);
  uint64_t v45 = objc_msgSend_hash(self->_etag, v4, v5);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v44 = 2654435761 * self->_publicAccess;
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v43 = objc_msgSend_hash(self->_invitedPcs, v6, v7);
  uint64_t v10 = objc_msgSend_hash(self->_selfAddedPcs, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_participants, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_shortTokenRoutingKey, v14, v15);
  uint64_t v19 = objc_msgSend_hash(self->_potentialMatchs, v17, v18);
  uint64_t v24 = objc_msgSend_hash(self->_invitedKeyToRemoves, v20, v21);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v25 = 2654435761 * self->_publisherModel;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v26 = 2654435761 * self->_anonymousPublicAccess;
      goto LABEL_9;
    }
  }
  uint64_t v26 = 0;
LABEL_9:
  uint64_t v27 = objc_msgSend_hash(self->_displayedHostname, v22, v23);
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v30 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v31 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v32 = 0;
    goto LABEL_16;
  }
  uint64_t v30 = 2654435761 * self->_publisherModelType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v31 = 2654435761 * self->_participantSelfRemovalBehavior;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v32 = 2654435761 * self->_denyAccessRequests;
LABEL_16:
  uint64_t v33 = v45 ^ v46 ^ v44 ^ v43 ^ v10 ^ v13 ^ v16 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v30 ^ v31 ^ v32 ^ objc_msgSend_hash(self->_requestingAccess, v28, v29);
  uint64_t v36 = objc_msgSend_hash(self->_blockedRequestingAccess, v34, v35);
  uint64_t v39 = v36 ^ objc_msgSend_hash(self->_shortTokenHash, v37, v38);
  return v33 ^ v39 ^ objc_msgSend_hash(self->_origin, v40, v41);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  shareId = self->_shareId;
  uint64_t v7 = *((void *)v5 + 13);
  if (shareId)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(shareId, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setShareId_(self, v4, v7);
  }
  uint64_t v8 = *((void *)v5 + 3);
  if (v8) {
    objc_msgSend_setEtag_(self, v4, v8);
  }
  if ((*((unsigned char *)v5 + 132) & 2) != 0)
  {
    self->_publicAccess = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  invitedPcs = self->_invitedPcs;
  uint64_t v10 = *((void *)v5 + 5);
  if (invitedPcs)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(invitedPcs, v4, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setInvitedPcs_(self, v4, v10);
  }
  selfAddedPcs = self->_selfAddedPcs;
  uint64_t v12 = *((void *)v5 + 12);
  if (selfAddedPcs)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(selfAddedPcs, v4, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setSelfAddedPcs_(self, v4, v12);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = *((id *)v5 + 8);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v54, v60, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addParticipant_(self, v16, *(void *)(*((void *)&v54 + 1) + 8 * i));
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v54, v60, 16);
    }
    while (v17);
  }

  uint64_t v21 = *((void *)v5 + 15);
  if (v21) {
    objc_msgSend_setShortTokenRoutingKey_(self, v20, v21);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v22 = *((id *)v5 + 9);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v50, v59, 16);
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_addPotentialMatch_(self, v25, *(void *)(*((void *)&v50 + 1) + 8 * j));
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v50, v59, 16);
    }
    while (v26);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = *((id *)v5 + 4);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v46, v58, 16);
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v29);
        }
        objc_msgSend_addInvitedKeyToRemove_(self, v32, *(void *)(*((void *)&v46 + 1) + 8 * k), (void)v46);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v46, v58, 16);
    }
    while (v33);
  }

  char v37 = *((unsigned char *)v5 + 132);
  if ((v37 & 0x20) != 0)
  {
    self->_publisherModel = *((unsigned char *)v5 + 130);
    *(unsigned char *)&self->_has |= 0x20u;
    char v37 = *((unsigned char *)v5 + 132);
  }
  if ((v37 & 8) != 0)
  {
    self->_anonymousPublicAccess = *((unsigned char *)v5 + 128);
    *(unsigned char *)&self->_has |= 8u;
  }
  uint64_t v38 = *((void *)v5 + 2);
  if (v38) {
    objc_msgSend_setDisplayedHostname_(self, v36, v38);
  }
  char v39 = *((unsigned char *)v5 + 132);
  if ((v39 & 4) != 0)
  {
    self->_publisherModelType = *((_DWORD *)v5 + 21);
    *(unsigned char *)&self->_has |= 4u;
    char v39 = *((unsigned char *)v5 + 132);
    if ((v39 & 1) == 0)
    {
LABEL_51:
      if ((v39 & 0x10) == 0) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v5 + 132) & 1) == 0)
  {
    goto LABEL_51;
  }
  self->_participantSelfRemovalBehavior = *((_DWORD *)v5 + 14);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v5 + 132) & 0x10) != 0)
  {
LABEL_52:
    self->_denyAccessRequests = *((unsigned char *)v5 + 129);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_53:
  requestingAccess = self->_requestingAccess;
  uint64_t v41 = *((void *)v5 + 11);
  if (requestingAccess)
  {
    if (v41) {
      objc_msgSend_mergeFrom_(requestingAccess, v36, v41);
    }
  }
  else if (v41)
  {
    objc_msgSend_setRequestingAccess_(self, v36, v41);
  }
  blockedRequestingAccess = self->_blockedRequestingAccess;
  uint64_t v43 = *((void *)v5 + 1);
  if (blockedRequestingAccess)
  {
    if (v43) {
      objc_msgSend_mergeFrom_(blockedRequestingAccess, v36, v43);
    }
  }
  else if (v43)
  {
    objc_msgSend_setBlockedRequestingAccess_(self, v36, v43);
  }
  uint64_t v44 = *((void *)v5 + 14);
  if (v44) {
    objc_msgSend_setShortTokenHash_(self, v36, v44);
  }
  uint64_t v45 = *((void *)v5 + 6);
  if (v45) {
    objc_msgSend_setOrigin_(self, v36, v45);
  }
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPProtectionInfo)invitedPcs
{
  return self->_invitedPcs;
}

- (void)setInvitedPcs:(id)a3
{
}

- (CKDPProtectionInfo)selfAddedPcs
{
  return self->_selfAddedPcs;
}

- (void)setSelfAddedPcs:(id)a3
{
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSString)shortTokenRoutingKey
{
  return self->_shortTokenRoutingKey;
}

- (void)setShortTokenRoutingKey:(id)a3
{
}

- (NSMutableArray)potentialMatchs
{
  return self->_potentialMatchs;
}

- (void)setPotentialMatchs:(id)a3
{
}

- (NSMutableArray)invitedKeyToRemoves
{
  return self->_invitedKeyToRemoves;
}

- (void)setInvitedKeyToRemoves:(id)a3
{
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
}

- (CKDPShareAccessRequesters)requestingAccess
{
  return self->_requestingAccess;
}

- (void)setRequestingAccess:(id)a3
{
}

- (CKDPShareAccessBlockedRequesters)blockedRequestingAccess
{
  return self->_blockedRequestingAccess;
}

- (void)setBlockedRequestingAccess:(id)a3
{
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenRoutingKey, 0);
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_selfAddedPcs, 0);
  objc_storeStrong((id *)&self->_requestingAccess, 0);
  objc_storeStrong((id *)&self->_potentialMatchs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_invitedPcs, 0);
  objc_storeStrong((id *)&self->_invitedKeyToRemoves, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_blockedRequestingAccess, 0);
}

@end
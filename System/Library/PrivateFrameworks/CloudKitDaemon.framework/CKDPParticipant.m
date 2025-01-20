@interface CKDPParticipant
- (BOOL)acceptedInProcess;
- (BOOL)createdInProcess;
- (BOOL)hasAcceptTimestamp;
- (BOOL)hasAcceptedInProcess;
- (BOOL)hasAcceptedTimestampDate;
- (BOOL)hasContactInformation;
- (BOOL)hasCreatedInProcess;
- (BOOL)hasEncryptedContactInformation;
- (BOOL)hasInviteTimestampDate;
- (BOOL)hasInviterId;
- (BOOL)hasIsAnonymousInvitedParticipant;
- (BOOL)hasIsApprovedRequester;
- (BOOL)hasIsInNetwork;
- (BOOL)hasIsOrgUser;
- (BOOL)hasKeyHealth;
- (BOOL)hasOutOfNetworkKeyType;
- (BOOL)hasOutOfNetworkPrivateKey;
- (BOOL)hasParticipantId;
- (BOOL)hasParticipantType;
- (BOOL)hasPermission;
- (BOOL)hasProtectionInfo;
- (BOOL)hasProtectionInfoPublicKey;
- (BOOL)hasPublicKey;
- (BOOL)hasPublicKeyVersion;
- (BOOL)hasState;
- (BOOL)hasUserId;
- (BOOL)isAnonymousInvitedParticipant;
- (BOOL)isApprovedRequester;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInNetwork;
- (BOOL)isOrgUser;
- (BOOL)readFrom:(id)a3;
- (CKDPContactInformation)contactInformation;
- (CKDPDate)acceptedTimestampDate;
- (CKDPDate)inviteTimestampDate;
- (CKDPIdentifier)inviterId;
- (CKDPIdentifier)participantId;
- (CKDPIdentifier)userId;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPProtectionInfo)publicKey;
- (NSData)encryptedContactInformation;
- (NSData)outOfNetworkPrivateKey;
- (NSData)protectionInfoPublicKey;
- (id)_participantTypeCKLogValue;
- (id)_permissionCKLogValue;
- (id)_stateCKLogValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyHealthAsString:(int)a3;
- (id)participantTypeAsString:(int)a3;
- (id)permissionAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsKeyHealth:(id)a3;
- (int)StringAsParticipantType:(id)a3;
- (int)StringAsPermission:(id)a3;
- (int)StringAsState:(id)a3;
- (int)keyHealth;
- (int)outOfNetworkKeyType;
- (int)participantType;
- (int)permission;
- (int)publicKeyVersion;
- (int)state;
- (int64_t)acceptTimestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcceptTimestamp:(int64_t)a3;
- (void)setAcceptedInProcess:(BOOL)a3;
- (void)setAcceptedTimestampDate:(id)a3;
- (void)setContactInformation:(id)a3;
- (void)setCreatedInProcess:(BOOL)a3;
- (void)setEncryptedContactInformation:(id)a3;
- (void)setHasAcceptTimestamp:(BOOL)a3;
- (void)setHasAcceptedInProcess:(BOOL)a3;
- (void)setHasCreatedInProcess:(BOOL)a3;
- (void)setHasIsAnonymousInvitedParticipant:(BOOL)a3;
- (void)setHasIsApprovedRequester:(BOOL)a3;
- (void)setHasIsInNetwork:(BOOL)a3;
- (void)setHasIsOrgUser:(BOOL)a3;
- (void)setHasKeyHealth:(BOOL)a3;
- (void)setHasOutOfNetworkKeyType:(BOOL)a3;
- (void)setHasParticipantType:(BOOL)a3;
- (void)setHasPermission:(BOOL)a3;
- (void)setHasPublicKeyVersion:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setInviteTimestampDate:(id)a3;
- (void)setInviterId:(id)a3;
- (void)setIsAnonymousInvitedParticipant:(BOOL)a3;
- (void)setIsApprovedRequester:(BOOL)a3;
- (void)setIsInNetwork:(BOOL)a3;
- (void)setIsOrgUser:(BOOL)a3;
- (void)setKeyHealth:(int)a3;
- (void)setOutOfNetworkKeyType:(int)a3;
- (void)setOutOfNetworkPrivateKey:(id)a3;
- (void)setParticipantId:(id)a3;
- (void)setParticipantType:(int)a3;
- (void)setPermission:(int)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setProtectionInfoPublicKey:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyVersion:(int)a3;
- (void)setState:(int)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPParticipant

- (id)_stateCKLogValue
{
  uint64_t v3 = objc_msgSend_state(self, a2, v2);
  if ((v3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E64F4EC0[(int)v3 - 1];
  }
  return v5;
}

- (id)_participantTypeCKLogValue
{
  uint64_t v3 = objc_msgSend_participantType(self, a2, v2);
  if ((v3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E64F4EE0[(int)v3 - 1];
  }
  return v5;
}

- (id)_permissionCKLogValue
{
  uint64_t v3 = objc_msgSend_permission(self, a2, v2);
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

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasContactInformation
{
  return self->_contactInformation != 0;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_state;
  }
  else {
    return 1;
  }
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)stateAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F6D18[a3 - 1];
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"invited"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"accepted"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"removed"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"unsubscribed"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (int)participantType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_participantType;
  }
  else {
    return 1;
  }
}

- (void)setParticipantType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasParticipantType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)participantTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F6D38[a3 - 1];
  }
  return v3;
}

- (int)StringAsParticipantType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"owner"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"administrator"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"user"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"publicUser"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (int)permission
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_permission;
  }
  else {
    return 1;
  }
}

- (void)setPermission:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_permission = a3;
}

- (void)setHasPermission:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPermission
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)permissionAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F6D58[a3 - 1];
  }
  return v3;
}

- (int)StringAsPermission:(id)a3
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

- (BOOL)hasInviterId
{
  return self->_inviterId != 0;
}

- (void)setCreatedInProcess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_createdInProcess = a3;
}

- (void)setHasCreatedInProcess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCreatedInProcess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (void)setAcceptTimestamp:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_acceptTimestamp = a3;
}

- (void)setHasAcceptTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAcceptTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasOutOfNetworkPrivateKey
{
  return self->_outOfNetworkPrivateKey != 0;
}

- (void)setOutOfNetworkKeyType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_outOfNetworkKeyType = a3;
}

- (void)setHasOutOfNetworkKeyType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOutOfNetworkKeyType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)publicKeyVersion
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_publicKeyVersion;
  }
  else {
    return 1;
  }
}

- (void)setPublicKeyVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_publicKeyVersion = a3;
}

- (void)setHasPublicKeyVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPublicKeyVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_acceptedInProcess = a3;
}

- (void)setHasAcceptedInProcess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAcceptedInProcess
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsInNetwork:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isInNetwork = a3;
}

- (void)setHasIsInNetwork:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsInNetwork
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasAcceptedTimestampDate
{
  return self->_acceptedTimestampDate != 0;
}

- (void)setIsOrgUser:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isOrgUser = a3;
}

- (void)setHasIsOrgUser:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsOrgUser
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasProtectionInfoPublicKey
{
  return self->_protectionInfoPublicKey != 0;
}

- (int)keyHealth
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_keyHealth;
  }
  else {
    return 1;
  }
}

- (void)setKeyHealth:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_keyHealth = a3;
}

- (void)setHasKeyHealth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasKeyHealth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)keyHealthAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E64F6D78[a3 - 1];
  }
  return v3;
}

- (int)StringAsKeyHealth:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"healthy"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"expired"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"keylost"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasInviteTimestampDate
{
  return self->_inviteTimestampDate != 0;
}

- (void)setIsAnonymousInvitedParticipant:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAnonymousInvitedParticipant = a3;
}

- (void)setHasIsAnonymousInvitedParticipant:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAnonymousInvitedParticipant
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsApprovedRequester:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isApprovedRequester = a3;
}

- (void)setHasIsApprovedRequester:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsApprovedRequester
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasEncryptedContactInformation
{
  return self->_encryptedContactInformation != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPParticipant;
  v4 = [(CKDPParticipant *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  participantId = self->_participantId;
  if (participantId)
  {
    v8 = objc_msgSend_dictionaryRepresentation(participantId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"participantId");
  }
  userId = self->_userId;
  if (userId)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(userId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"userId");
  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    v14 = objc_msgSend_dictionaryRepresentation(contactInformation, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"contactInformation");
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    unsigned int v17 = self->_state - 1;
    if (v17 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_state);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E64F6D18[v17];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v18, @"state");

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  unsigned int v19 = self->_participantType - 1;
  if (v19 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_participantType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E64F6D38[v19];
  }
  objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v20, @"participantType");

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    unsigned int v21 = self->_permission - 1;
    if (v21 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_permission);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E64F6D58[v21];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v22, @"permission");
  }
LABEL_23:
  inviterId = self->_inviterId;
  if (inviterId)
  {
    v24 = objc_msgSend_dictionaryRepresentation(inviterId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"inviterId");
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v26 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_createdInProcess);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"createdInProcess");
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v29 = objc_msgSend_dictionaryRepresentation(publicKey, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, @"publicKey");
  }
  if (*(_WORD *)&self->_has)
  {
    v31 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_acceptTimestamp);
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, @"acceptTimestamp");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v34 = objc_msgSend_dictionaryRepresentation(protectionInfo, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, @"protectionInfo");
  }
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  if (outOfNetworkPrivateKey) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)outOfNetworkPrivateKey, @"outOfNetworkPrivateKey");
  }
  __int16 v37 = (__int16)self->_has;
  if ((v37 & 4) != 0)
  {
    v48 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_outOfNetworkKeyType);
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, @"outOfNetworkKeyType");

    __int16 v37 = (__int16)self->_has;
    if ((v37 & 0x20) == 0)
    {
LABEL_37:
      if ((v37 & 0x80) == 0) {
        goto LABEL_38;
      }
      goto LABEL_51;
    }
  }
  else if ((v37 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  v50 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_publicKeyVersion);
  objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, @"publicKeyVersion");

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x80) == 0)
  {
LABEL_38:
    if ((v37 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_51:
  v52 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_acceptedInProcess);
  objc_msgSend_setObject_forKey_(v6, v53, (uint64_t)v52, @"acceptedInProcess");

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_39:
    v38 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isInNetwork);
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, @"isInNetwork");
  }
LABEL_40:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  if (acceptedTimestampDate)
  {
    v41 = objc_msgSend_dictionaryRepresentation(acceptedTimestampDate, v4, (uint64_t)outOfNetworkPrivateKey);
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, @"acceptedTimestampDate");
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    v43 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isOrgUser);
    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v43, @"isOrgUser");
  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  if (protectionInfoPublicKey) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)protectionInfoPublicKey, @"protectionInfoPublicKey");
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    unsigned int v46 = self->_keyHealth - 1;
    if (v46 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_keyHealth);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E64F6D78[v46];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v47, @"keyHealth");
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  if (inviteTimestampDate)
  {
    v55 = objc_msgSend_dictionaryRepresentation(inviteTimestampDate, v4, (uint64_t)protectionInfoPublicKey);
    objc_msgSend_setObject_forKey_(v6, v56, (uint64_t)v55, @"inviteTimestampDate");
  }
  __int16 v57 = (__int16)self->_has;
  if ((v57 & 0x200) != 0)
  {
    v58 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isAnonymousInvitedParticipant);
    objc_msgSend_setObject_forKey_(v6, v59, (uint64_t)v58, @"isAnonymousInvitedParticipant");

    __int16 v57 = (__int16)self->_has;
  }
  if ((v57 & 0x400) != 0)
  {
    v60 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isApprovedRequester);
    objc_msgSend_setObject_forKey_(v6, v61, (uint64_t)v60, @"isApprovedRequester");
  }
  encryptedContactInformation = self->_encryptedContactInformation;
  if (encryptedContactInformation) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedContactInformation, @"encryptedContactInformation");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPParticipantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_participantId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_userId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_contactInformation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
LABEL_11:
  if (self->_inviterId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_publicKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_outOfNetworkPrivateKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_25:
      if ((v6 & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_27:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_28:
  if (self->_acceptedTimestampDate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_protectionInfoPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_inviteTimestampDate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_encryptedContactInformation)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  participantId = self->_participantId;
  id v20 = v4;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v4, v5, (uint64_t)participantId);
    id v4 = v20;
  }
  userId = self->_userId;
  if (userId)
  {
    objc_msgSend_setUserId_(v20, v5, (uint64_t)userId);
    id v4 = v20;
  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    objc_msgSend_setContactInformation_(v20, v5, (uint64_t)contactInformation);
    id v4 = v20;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_state;
    *((_WORD *)v4 + 68) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 20) = self->_participantType;
  *((_WORD *)v4 + 68) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 21) = self->_permission;
    *((_WORD *)v4 + 68) |= 0x10u;
  }
LABEL_11:
  inviterId = self->_inviterId;
  if (inviterId)
  {
    objc_msgSend_setInviterId_(v20, v5, (uint64_t)inviterId);
    id v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((unsigned char *)v4 + 129) = self->_createdInProcess;
    *((_WORD *)v4 + 68) |= 0x100u;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_setPublicKey_(v20, v5, (uint64_t)publicKey);
    id v4 = v20;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v4 + 1) = self->_acceptTimestamp;
    *((_WORD *)v4 + 68) |= 1u;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v20, v5, (uint64_t)protectionInfo);
    id v4 = v20;
  }
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  if (outOfNetworkPrivateKey)
  {
    objc_msgSend_setOutOfNetworkPrivateKey_(v20, v5, (uint64_t)outOfNetworkPrivateKey);
    id v4 = v20;
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_outOfNetworkKeyType;
    *((_WORD *)v4 + 68) |= 4u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x20) == 0)
    {
LABEL_25:
      if ((v14 & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_52;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 28) = self->_publicKeyVersion;
  *((_WORD *)v4 + 68) |= 0x20u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_26:
    if ((v14 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_52:
  *((unsigned char *)v4 + 128) = self->_acceptedInProcess;
  *((_WORD *)v4 + 68) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_27:
    *((unsigned char *)v4 + 132) = self->_isInNetwork;
    *((_WORD *)v4 + 68) |= 0x800u;
  }
LABEL_28:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  if (acceptedTimestampDate)
  {
    objc_msgSend_setAcceptedTimestampDate_(v20, v5, (uint64_t)acceptedTimestampDate);
    id v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *((unsigned char *)v4 + 133) = self->_isOrgUser;
    *((_WORD *)v4 + 68) |= 0x1000u;
  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  if (protectionInfoPublicKey)
  {
    objc_msgSend_setProtectionInfoPublicKey_(v20, v5, (uint64_t)protectionInfoPublicKey);
    id v4 = v20;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_keyHealth;
    *((_WORD *)v4 + 68) |= 2u;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  if (inviteTimestampDate)
  {
    objc_msgSend_setInviteTimestampDate_(v20, v5, (uint64_t)inviteTimestampDate);
    id v4 = v20;
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 130) = self->_isAnonymousInvitedParticipant;
    *((_WORD *)v4 + 68) |= 0x200u;
    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 131) = self->_isApprovedRequester;
    *((_WORD *)v4 + 68) |= 0x400u;
  }
  encryptedContactInformation = self->_encryptedContactInformation;
  if (encryptedContactInformation)
  {
    objc_msgSend_setEncryptedContactInformation_(v20, v5, (uint64_t)encryptedContactInformation);
    id v4 = v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  __int16 v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_participantId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_userId, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 120);
  *(void *)(v10 + 120) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_contactInformation, v17, (uint64_t)a3);
  unsigned int v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v10 + 116) = self->_state;
    *(_WORD *)(v10 + 136) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v10 + 80) = self->_participantType;
  *(_WORD *)(v10 + 136) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 84) = self->_permission;
    *(_WORD *)(v10 + 136) |= 0x10u;
  }
LABEL_5:
  uint64_t v22 = objc_msgSend_copyWithZone_(self->_inviterId, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v22;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(unsigned char *)(v10 + 129) = self->_createdInProcess;
    *(_WORD *)(v10 + 136) |= 0x100u;
  }
  uint64_t v25 = objc_msgSend_copyWithZone_(self->_publicKey, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v25;

  if (*(_WORD *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_acceptTimestamp;
    *(_WORD *)(v10 + 136) |= 1u;
  }
  uint64_t v28 = objc_msgSend_copyWithZone_(self->_protectionInfo, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v28;

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_outOfNetworkPrivateKey, v30, (uint64_t)a3);
  v32 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v31;

  __int16 v34 = (__int16)self->_has;
  if ((v34 & 4) != 0)
  {
    *(_DWORD *)(v10 + 60) = self->_outOfNetworkKeyType;
    *(_WORD *)(v10 + 136) |= 4u;
    __int16 v34 = (__int16)self->_has;
    if ((v34 & 0x20) == 0)
    {
LABEL_11:
      if ((v34 & 0x80) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((v34 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v10 + 112) = self->_publicKeyVersion;
  *(_WORD *)(v10 + 136) |= 0x20u;
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x80) == 0)
  {
LABEL_12:
    if ((v34 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  *(unsigned char *)(v10 + 128) = self->_acceptedInProcess;
  *(_WORD *)(v10 + 136) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    *(unsigned char *)(v10 + 132) = self->_isInNetwork;
    *(_WORD *)(v10 + 136) |= 0x800u;
  }
LABEL_14:
  uint64_t v35 = objc_msgSend_copyWithZone_(self->_acceptedTimestampDate, v33, (uint64_t)a3);
  v36 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v35;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(unsigned char *)(v10 + 133) = self->_isOrgUser;
    *(_WORD *)(v10 + 136) |= 0x1000u;
  }
  uint64_t v38 = objc_msgSend_copyWithZone_(self->_protectionInfoPublicKey, v37, (uint64_t)a3);
  v39 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v38;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_keyHealth;
    *(_WORD *)(v10 + 136) |= 2u;
  }
  uint64_t v41 = objc_msgSend_copyWithZone_(self->_inviteTimestampDate, v40, (uint64_t)a3);
  v42 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v41;

  __int16 v44 = (__int16)self->_has;
  if ((v44 & 0x200) != 0)
  {
    *(unsigned char *)(v10 + 130) = self->_isAnonymousInvitedParticipant;
    *(_WORD *)(v10 + 136) |= 0x200u;
    __int16 v44 = (__int16)self->_has;
  }
  if ((v44 & 0x400) != 0)
  {
    *(unsigned char *)(v10 + 131) = self->_isApprovedRequester;
    *(_WORD *)(v10 + 136) |= 0x400u;
  }
  uint64_t v45 = objc_msgSend_copyWithZone_(self->_encryptedContactInformation, v43, (uint64_t)a3);
  unsigned int v46 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v45;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_106;
  }
  participantId = self->_participantId;
  uint64_t v9 = v4[9];
  if ((unint64_t)participantId | v9)
  {
    if (!objc_msgSend_isEqual_(participantId, v7, v9)) {
      goto LABEL_106;
    }
  }
  userId = self->_userId;
  uint64_t v11 = v4[15];
  if ((unint64_t)userId | v11)
  {
    if (!objc_msgSend_isEqual_(userId, v7, v11)) {
      goto LABEL_106;
    }
  }
  contactInformation = self->_contactInformation;
  uint64_t v13 = v4[3];
  if ((unint64_t)contactInformation | v13)
  {
    if (!objc_msgSend_isEqual_(contactInformation, v7, v13)) {
      goto LABEL_106;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 68);
  if ((has & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_state != *((_DWORD *)v4 + 29)) {
      goto LABEL_106;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_participantType != *((_DWORD *)v4 + 20)) {
      goto LABEL_106;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_permission != *((_DWORD *)v4 + 21)) {
      goto LABEL_106;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  inviterId = self->_inviterId;
  uint64_t v17 = v4[6];
  if ((unint64_t)inviterId | v17)
  {
    if (!objc_msgSend_isEqual_(inviterId, v7, v17)) {
      goto LABEL_106;
    }
    __int16 has = (__int16)self->_has;
    __int16 v15 = *((_WORD *)v4 + 68);
  }
  if ((has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0) {
      goto LABEL_106;
    }
    if (self->_createdInProcess)
    {
      if (!*((unsigned char *)v4 + 129)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 129))
    {
      goto LABEL_106;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_106;
  }
  publicKey = self->_publicKey;
  uint64_t v19 = v4[13];
  if ((unint64_t)publicKey | v19)
  {
    if (!objc_msgSend_isEqual_(publicKey, v7, v19)) {
      goto LABEL_106;
    }
    __int16 has = (__int16)self->_has;
    __int16 v15 = *((_WORD *)v4 + 68);
  }
  if (has)
  {
    if ((v15 & 1) == 0 || self->_acceptTimestamp != v4[1]) {
      goto LABEL_106;
    }
  }
  else if (v15)
  {
    goto LABEL_106;
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v21 = v4[11];
  if ((unint64_t)protectionInfo | v21 && !objc_msgSend_isEqual_(protectionInfo, v7, v21)) {
    goto LABEL_106;
  }
  outOfNetworkPrivateKey = self->_outOfNetworkPrivateKey;
  uint64_t v23 = v4[8];
  if ((unint64_t)outOfNetworkPrivateKey | v23)
  {
    if (!objc_msgSend_isEqual_(outOfNetworkPrivateKey, v7, v23)) {
      goto LABEL_106;
    }
  }
  __int16 v24 = (__int16)self->_has;
  __int16 v25 = *((_WORD *)v4 + 68);
  if ((v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_outOfNetworkKeyType != *((_DWORD *)v4 + 15)) {
      goto LABEL_106;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_publicKeyVersion != *((_DWORD *)v4 + 28)) {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0) {
      goto LABEL_106;
    }
    if (self->_acceptedInProcess)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((v4[17] & 0x800) == 0) {
      goto LABEL_106;
    }
    if (self->_isInNetwork)
    {
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 132))
    {
      goto LABEL_106;
    }
  }
  else if ((v4[17] & 0x800) != 0)
  {
    goto LABEL_106;
  }
  acceptedTimestampDate = self->_acceptedTimestampDate;
  uint64_t v27 = v4[2];
  if ((unint64_t)acceptedTimestampDate | v27)
  {
    if (!objc_msgSend_isEqual_(acceptedTimestampDate, v7, v27)) {
      goto LABEL_106;
    }
    __int16 v24 = (__int16)self->_has;
    __int16 v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0) {
      goto LABEL_106;
    }
    if (self->_isOrgUser)
    {
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 133))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  protectionInfoPublicKey = self->_protectionInfoPublicKey;
  uint64_t v29 = v4[12];
  if ((unint64_t)protectionInfoPublicKey | v29)
  {
    if (!objc_msgSend_isEqual_(protectionInfoPublicKey, v7, v29)) {
      goto LABEL_106;
    }
    __int16 v24 = (__int16)self->_has;
    __int16 v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_keyHealth != *((_DWORD *)v4 + 14)) {
      goto LABEL_106;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_106;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  uint64_t v31 = v4[5];
  if ((unint64_t)inviteTimestampDate | v31)
  {
    if (!objc_msgSend_isEqual_(inviteTimestampDate, v7, v31)) {
      goto LABEL_106;
    }
    __int16 v24 = (__int16)self->_has;
    __int16 v25 = *((_WORD *)v4 + 68);
  }
  if ((v24 & 0x200) != 0)
  {
    if ((v25 & 0x200) == 0) {
      goto LABEL_106;
    }
    if (self->_isAnonymousInvitedParticipant)
    {
      if (!*((unsigned char *)v4 + 130)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 130))
    {
      goto LABEL_106;
    }
  }
  else if ((v25 & 0x200) != 0)
  {
    goto LABEL_106;
  }
  if ((v24 & 0x400) == 0)
  {
    if ((v25 & 0x400) == 0) {
      goto LABEL_112;
    }
LABEL_106:
    char isEqual = 0;
    goto LABEL_107;
  }
  if ((v25 & 0x400) == 0) {
    goto LABEL_106;
  }
  if (!self->_isApprovedRequester)
  {
    if (!*((unsigned char *)v4 + 131)) {
      goto LABEL_112;
    }
    goto LABEL_106;
  }
  if (!*((unsigned char *)v4 + 131)) {
    goto LABEL_106;
  }
LABEL_112:
  encryptedContactInformation = self->_encryptedContactInformation;
  uint64_t v35 = v4[4];
  if ((unint64_t)encryptedContactInformation | v35) {
    char isEqual = objc_msgSend_isEqual_(encryptedContactInformation, v7, v35);
  }
  else {
    char isEqual = 1;
  }
LABEL_107:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v49 = objc_msgSend_hash(self->_participantId, a2, v2);
  uint64_t v48 = objc_msgSend_hash(self->_userId, v4, v5);
  uint64_t v47 = objc_msgSend_hash(self->_contactInformation, v6, v7);
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    uint64_t v46 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v45 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v46 = 2654435761 * self->_state;
  if ((has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v45 = 2654435761 * self->_participantType;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v44 = 2654435761 * self->_permission;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v44 = 0;
LABEL_8:
  uint64_t v43 = objc_msgSend_hash(self->_inviterId, v8, v9);
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v42 = 2654435761 * self->_createdInProcess;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v41 = objc_msgSend_hash(self->_publicKey, v11, v12);
  if (*(_WORD *)&self->_has) {
    uint64_t v40 = 2654435761 * self->_acceptTimestamp;
  }
  else {
    uint64_t v40 = 0;
  }
  uint64_t v39 = objc_msgSend_hash(self->_protectionInfo, v13, v14);
  uint64_t v38 = objc_msgSend_hash(self->_outOfNetworkPrivateKey, v15, v16);
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 4) != 0)
  {
    uint64_t v37 = 2654435761 * self->_outOfNetworkKeyType;
    if ((v19 & 0x20) != 0)
    {
LABEL_16:
      uint64_t v20 = 2654435761 * self->_publicKeyVersion;
      if ((v19 & 0x80) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v21 = 0;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v37 = 0;
    if ((v19 & 0x20) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v20 = 0;
  if ((v19 & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v21 = 2654435761 * self->_acceptedInProcess;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_18:
    uint64_t v22 = 2654435761 * self->_isInNetwork;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v22 = 0;
LABEL_23:
  uint64_t v25 = objc_msgSend_hash(self->_acceptedTimestampDate, v17, v18);
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    uint64_t v26 = 2654435761 * self->_isOrgUser;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v29 = objc_msgSend_hash(self->_protectionInfoPublicKey, v23, v24);
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v30 = 2654435761 * self->_keyHealth;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = objc_msgSend_hash(self->_inviteTimestampDate, v27, v28);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v34 = 2654435761 * self->_isAnonymousInvitedParticipant;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_31;
    }
LABEL_33:
    uint64_t v35 = 0;
    return v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v20 ^ v21 ^ v22 ^ v25 ^ v26 ^ v29 ^ v30 ^ v31 ^ v34 ^ v35 ^ objc_msgSend_hash(self->_encryptedContactInformation, v32, v33);
  }
  uint64_t v34 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v35 = 2654435761 * self->_isApprovedRequester;
  return v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v20 ^ v21 ^ v22 ^ v25 ^ v26 ^ v29 ^ v30 ^ v31 ^ v34 ^ v35 ^ objc_msgSend_hash(self->_encryptedContactInformation, v32, v33);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  participantId = self->_participantId;
  uint64_t v6 = *((void *)v4 + 9);
  id v27 = v4;
  if (participantId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(participantId, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setParticipantId_(self, (const char *)v4, v6);
  }
  id v4 = v27;
LABEL_7:
  userId = self->_userId;
  uint64_t v8 = *((void *)v4 + 15);
  if (userId)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(userId, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setUserId_(self, (const char *)v4, v8);
  }
  id v4 = v27;
LABEL_13:
  contactInformation = self->_contactInformation;
  uint64_t v10 = *((void *)v4 + 3);
  if (contactInformation)
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_mergeFrom_(contactInformation, (const char *)v4, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_setContactInformation_(self, (const char *)v4, v10);
  }
  id v4 = v27;
LABEL_19:
  __int16 v11 = *((_WORD *)v4 + 68);
  if ((v11 & 0x40) != 0)
  {
    self->_state = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v11 = *((_WORD *)v4 + 68);
    if ((v11 & 8) == 0)
    {
LABEL_21:
      if ((v11 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_21;
  }
  self->_participantType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 68) & 0x10) != 0)
  {
LABEL_22:
    self->_permission = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_23:
  inviterId = self->_inviterId;
  uint64_t v13 = *((void *)v4 + 6);
  if (inviterId)
  {
    if (!v13) {
      goto LABEL_32;
    }
    objc_msgSend_mergeFrom_(inviterId, (const char *)v4, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_32;
    }
    objc_msgSend_setInviterId_(self, (const char *)v4, v13);
  }
  id v4 = v27;
LABEL_32:
  if ((*((_WORD *)v4 + 68) & 0x100) != 0)
  {
    self->_createdInProcess = *((unsigned char *)v4 + 129);
    *(_WORD *)&self->_has |= 0x100u;
  }
  publicKey = self->_publicKey;
  uint64_t v15 = *((void *)v4 + 13);
  if (publicKey)
  {
    if (!v15) {
      goto LABEL_40;
    }
    objc_msgSend_mergeFrom_(publicKey, (const char *)v4, v15);
  }
  else
  {
    if (!v15) {
      goto LABEL_40;
    }
    objc_msgSend_setPublicKey_(self, (const char *)v4, v15);
  }
  id v4 = v27;
LABEL_40:
  if (*((_WORD *)v4 + 68))
  {
    self->_acceptTimestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v17 = *((void *)v4 + 11);
  if (protectionInfo)
  {
    if (!v17) {
      goto LABEL_48;
    }
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v17);
  }
  else
  {
    if (!v17) {
      goto LABEL_48;
    }
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v17);
  }
  id v4 = v27;
LABEL_48:
  uint64_t v18 = *((void *)v4 + 8);
  if (v18)
  {
    objc_msgSend_setOutOfNetworkPrivateKey_(self, (const char *)v4, v18);
    id v4 = v27;
  }
  __int16 v19 = *((_WORD *)v4 + 68);
  if ((v19 & 4) != 0)
  {
    self->_outOfNetworkKeyType = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 4u;
    __int16 v19 = *((_WORD *)v4 + 68);
    if ((v19 & 0x20) == 0)
    {
LABEL_52:
      if ((v19 & 0x80) == 0) {
        goto LABEL_53;
      }
      goto LABEL_60;
    }
  }
  else if ((v19 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  self->_publicKeyVersion = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v19 = *((_WORD *)v4 + 68);
  if ((v19 & 0x80) == 0)
  {
LABEL_53:
    if ((v19 & 0x800) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_60:
  self->_acceptedInProcess = *((unsigned char *)v4 + 128);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 68) & 0x800) != 0)
  {
LABEL_54:
    self->_isInNetwork = *((unsigned char *)v4 + 132);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_55:
  acceptedTimestampDate = self->_acceptedTimestampDate;
  uint64_t v21 = *((void *)v4 + 2);
  if (acceptedTimestampDate)
  {
    if (!v21) {
      goto LABEL_65;
    }
    objc_msgSend_mergeFrom_(acceptedTimestampDate, (const char *)v4, v21);
  }
  else
  {
    if (!v21) {
      goto LABEL_65;
    }
    objc_msgSend_setAcceptedTimestampDate_(self, (const char *)v4, v21);
  }
  id v4 = v27;
LABEL_65:
  if ((*((_WORD *)v4 + 68) & 0x1000) != 0)
  {
    self->_isOrgUser = *((unsigned char *)v4 + 133);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  uint64_t v22 = *((void *)v4 + 12);
  if (v22)
  {
    objc_msgSend_setProtectionInfoPublicKey_(self, (const char *)v4, v22);
    id v4 = v27;
  }
  if ((*((_WORD *)v4 + 68) & 2) != 0)
  {
    self->_keyHealth = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 2u;
  }
  inviteTimestampDate = self->_inviteTimestampDate;
  uint64_t v24 = *((void *)v4 + 5);
  if (inviteTimestampDate)
  {
    if (!v24) {
      goto LABEL_77;
    }
    objc_msgSend_mergeFrom_(inviteTimestampDate, (const char *)v4, v24);
  }
  else
  {
    if (!v24) {
      goto LABEL_77;
    }
    objc_msgSend_setInviteTimestampDate_(self, (const char *)v4, v24);
  }
  id v4 = v27;
LABEL_77:
  __int16 v25 = *((_WORD *)v4 + 68);
  if ((v25 & 0x200) != 0)
  {
    self->_isAnonymousInvitedParticipant = *((unsigned char *)v4 + 130);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v25 = *((_WORD *)v4 + 68);
  }
  if ((v25 & 0x400) != 0)
  {
    self->_isApprovedRequester = *((unsigned char *)v4 + 131);
    *(_WORD *)&self->_has |= 0x400u;
  }
  uint64_t v26 = *((void *)v4 + 4);
  if (v26) {
    objc_msgSend_setEncryptedContactInformation_(self, (const char *)v4, v26);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPIdentifier)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
}

- (CKDPIdentifier)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (CKDPContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (void)setContactInformation:(id)a3
{
}

- (CKDPIdentifier)inviterId
{
  return self->_inviterId;
}

- (void)setInviterId:(id)a3
{
}

- (BOOL)createdInProcess
{
  return self->_createdInProcess;
}

- (CKDPProtectionInfo)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (int64_t)acceptTimestamp
{
  return self->_acceptTimestamp;
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSData)outOfNetworkPrivateKey
{
  return self->_outOfNetworkPrivateKey;
}

- (void)setOutOfNetworkPrivateKey:(id)a3
{
}

- (int)outOfNetworkKeyType
{
  return self->_outOfNetworkKeyType;
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (BOOL)isInNetwork
{
  return self->_isInNetwork;
}

- (CKDPDate)acceptedTimestampDate
{
  return self->_acceptedTimestampDate;
}

- (void)setAcceptedTimestampDate:(id)a3
{
}

- (BOOL)isOrgUser
{
  return self->_isOrgUser;
}

- (NSData)protectionInfoPublicKey
{
  return self->_protectionInfoPublicKey;
}

- (void)setProtectionInfoPublicKey:(id)a3
{
}

- (CKDPDate)inviteTimestampDate
{
  return self->_inviteTimestampDate;
}

- (void)setInviteTimestampDate:(id)a3
{
}

- (BOOL)isAnonymousInvitedParticipant
{
  return self->_isAnonymousInvitedParticipant;
}

- (BOOL)isApprovedRequester
{
  return self->_isApprovedRequester;
}

- (NSData)encryptedContactInformation
{
  return self->_encryptedContactInformation;
}

- (void)setEncryptedContactInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfoPublicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_outOfNetworkPrivateKey, 0);
  objc_storeStrong((id *)&self->_inviterId, 0);
  objc_storeStrong((id *)&self->_inviteTimestampDate, 0);
  objc_storeStrong((id *)&self->_encryptedContactInformation, 0);
  objc_storeStrong((id *)&self->_contactInformation, 0);
  objc_storeStrong((id *)&self->_acceptedTimestampDate, 0);
}

@end
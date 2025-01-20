@interface CKDPShareMetadata
- (BOOL)hasCallerParticipant;
- (BOOL)hasOwnerParticipant;
- (BOOL)hasParticipantPermission;
- (BOOL)hasParticipantState;
- (BOOL)hasParticipantType;
- (BOOL)hasProtectedFullToken;
- (BOOL)hasRootRecordType;
- (BOOL)hasRoutingKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPParticipant)callerParticipant;
- (CKDPParticipant)ownerParticipant;
- (CKDPRecordType)rootRecordType;
- (NSData)protectedFullToken;
- (NSString)routingKey;
- (id)_participantPermissionCKLogValue;
- (id)_participantStateCKLogValue;
- (id)_participantTypeCKLogValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantPermissionAsString:(int)a3;
- (id)participantStateAsString:(int)a3;
- (id)participantTypeAsString:(int)a3;
- (int)StringAsParticipantPermission:(id)a3;
- (int)StringAsParticipantState:(id)a3;
- (int)StringAsParticipantType:(id)a3;
- (int)participantPermission;
- (int)participantState;
- (int)participantType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallerParticipant:(id)a3;
- (void)setHasParticipantPermission:(BOOL)a3;
- (void)setHasParticipantState:(BOOL)a3;
- (void)setHasParticipantType:(BOOL)a3;
- (void)setOwnerParticipant:(id)a3;
- (void)setParticipantPermission:(int)a3;
- (void)setParticipantState:(int)a3;
- (void)setParticipantType:(int)a3;
- (void)setProtectedFullToken:(id)a3;
- (void)setRootRecordType:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShareMetadata

- (id)_participantPermissionCKLogValue
{
  uint64_t v3 = objc_msgSend_participantPermission(self, a2, v2);
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

- (id)_participantStateCKLogValue
{
  uint64_t v3 = objc_msgSend_participantState(self, a2, v2);
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

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasCallerParticipant
{
  return self->_callerParticipant != 0;
}

- (int)participantPermission
{
  if (*(unsigned char *)&self->_has) {
    return self->_participantPermission;
  }
  else {
    return 1;
  }
}

- (void)setParticipantPermission:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantPermission = a3;
}

- (void)setHasParticipantPermission:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantPermission
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)participantPermissionAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E64F5AD0[a3 - 1];
  }
  return v3;
}

- (int)StringAsParticipantPermission:(id)a3
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

- (int)participantState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_participantState;
  }
  else {
    return 1;
  }
}

- (void)setParticipantState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_participantState = a3;
}

- (void)setHasParticipantState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParticipantState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)participantStateAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F5AF0[a3 - 1];
  }
  return v3;
}

- (int)StringAsParticipantState:(id)a3
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_participantType;
  }
  else {
    return 1;
  }
}

- (void)setParticipantType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParticipantType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)participantTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F5B10[a3 - 1];
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

- (BOOL)hasRootRecordType
{
  return self->_rootRecordType != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareMetadata;
  v4 = [(CKDPShareMetadata *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, @"routingKey");
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, @"protectedFullToken");
  }
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
  {
    v10 = objc_msgSend_dictionaryRepresentation(ownerParticipant, v5, (uint64_t)protectedFullToken);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"ownerParticipant");
  }
  callerParticipant = self->_callerParticipant;
  if (callerParticipant)
  {
    v13 = objc_msgSend_dictionaryRepresentation(callerParticipant, v5, (uint64_t)protectedFullToken);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"callerParticipant");
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v16 = self->_participantPermission - 1;
    if (v16 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_participantPermission);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E64F5AD0[v16];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v17, @"participantPermission");

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  unsigned int v18 = self->_participantState - 1;
  if (v18 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_participantState);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E64F5AF0[v18];
  }
  objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v19, @"participantState");

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_21:
    unsigned int v20 = self->_participantType - 1;
    if (v20 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_participantType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E64F5B10[v20];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v21, @"participantType");
  }
LABEL_25:
  rootRecordType = self->_rootRecordType;
  if (rootRecordType)
  {
    v23 = objc_msgSend_dictionaryRepresentation(rootRecordType, v5, (uint64_t)protectedFullToken);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"rootRecordType");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPShareMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_routingKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_protectedFullToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_ownerParticipant)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_callerParticipant)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_rootRecordType)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  routingKey = self->_routingKey;
  id v12 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    id v4 = v12;
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
  {
    objc_msgSend_setProtectedFullToken_(v12, v5, (uint64_t)protectedFullToken);
    id v4 = v12;
  }
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
  {
    objc_msgSend_setOwnerParticipant_(v12, v5, (uint64_t)ownerParticipant);
    id v4 = v12;
  }
  callerParticipant = self->_callerParticipant;
  if (callerParticipant)
  {
    objc_msgSend_setCallerParticipant_(v12, v5, (uint64_t)callerParticipant);
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_participantPermission;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 7) = self->_participantState;
  *((unsigned char *)v4 + 64) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 8) = self->_participantType;
    *((unsigned char *)v4 + 64) |= 4u;
  }
LABEL_13:
  rootRecordType = self->_rootRecordType;
  if (rootRecordType)
  {
    objc_msgSend_setRootRecordType_(v12, v5, (uint64_t)rootRecordType);
    id v4 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v14, (uint64_t)a3);
  unsigned int v16 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_ownerParticipant, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_callerParticipant, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v21;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v10 + 28) = self->_participantState;
    *(unsigned char *)(v10 + 64) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 24) = self->_participantPermission;
  *(unsigned char *)(v10 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 32) = self->_participantType;
    *(unsigned char *)(v10 + 64) |= 4u;
  }
LABEL_5:
  uint64_t v25 = objc_msgSend_copyWithZone_(self->_rootRecordType, v23, (uint64_t)a3);
  v26 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_27;
  }
  routingKey = self->_routingKey;
  uint64_t v9 = v4[7];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9)) {
      goto LABEL_27;
    }
  }
  protectedFullToken = self->_protectedFullToken;
  uint64_t v11 = v4[5];
  if ((unint64_t)protectedFullToken | v11)
  {
    if (!objc_msgSend_isEqual_(protectedFullToken, v7, v11)) {
      goto LABEL_27;
    }
  }
  ownerParticipant = self->_ownerParticipant;
  uint64_t v13 = v4[2];
  if ((unint64_t)ownerParticipant | v13)
  {
    if (!objc_msgSend_isEqual_(ownerParticipant, v7, v13)) {
      goto LABEL_27;
    }
  }
  callerParticipant = self->_callerParticipant;
  uint64_t v15 = v4[1];
  if ((unint64_t)callerParticipant | v15)
  {
    if (!objc_msgSend_isEqual_(callerParticipant, v7, v15)) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[8] & 1) == 0 || self->_participantPermission != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if (v4[8])
  {
LABEL_27:
    char isEqual = 0;
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[8] & 2) == 0 || self->_participantState != *((_DWORD *)v4 + 7)) {
      goto LABEL_27;
    }
  }
  else if ((v4[8] & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[8] & 4) == 0 || self->_participantType != *((_DWORD *)v4 + 8)) {
      goto LABEL_27;
    }
  }
  else if ((v4[8] & 4) != 0)
  {
    goto LABEL_27;
  }
  rootRecordType = self->_rootRecordType;
  uint64_t v17 = v4[6];
  if ((unint64_t)rootRecordType | v17) {
    char isEqual = objc_msgSend_isEqual_(rootRecordType, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_28:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_protectedFullToken, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_ownerParticipant, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_callerParticipant, v11, v12);
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v18 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ v18 ^ objc_msgSend_hash(self->_rootRecordType, v14, v15);
  }
  uint64_t v16 = 2654435761 * self->_participantPermission;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = 2654435761 * self->_participantState;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v18 = 2654435761 * self->_participantType;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ v18 ^ objc_msgSend_hash(self->_rootRecordType, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 7);
  id v14 = v4;
  if (v5)
  {
    objc_msgSend_setRoutingKey_(self, (const char *)v4, v5);
    id v4 = v14;
  }
  uint64_t v6 = *((void *)v4 + 5);
  if (v6)
  {
    objc_msgSend_setProtectedFullToken_(self, (const char *)v4, v6);
    id v4 = v14;
  }
  ownerParticipant = self->_ownerParticipant;
  uint64_t v8 = *((void *)v4 + 2);
  if (ownerParticipant)
  {
    if (!v8) {
      goto LABEL_11;
    }
    objc_msgSend_mergeFrom_(ownerParticipant, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    objc_msgSend_setOwnerParticipant_(self, (const char *)v4, v8);
  }
  id v4 = v14;
LABEL_11:
  callerParticipant = self->_callerParticipant;
  uint64_t v10 = *((void *)v4 + 1);
  if (callerParticipant)
  {
    if (!v10) {
      goto LABEL_17;
    }
    objc_msgSend_mergeFrom_(callerParticipant, (const char *)v4, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    objc_msgSend_setCallerParticipant_(self, (const char *)v4, v10);
  }
  id v4 = v14;
LABEL_17:
  char v11 = *((unsigned char *)v4 + 64);
  if (v11)
  {
    self->_participantPermission = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v11 = *((unsigned char *)v4 + 64);
    if ((v11 & 2) == 0)
    {
LABEL_19:
      if ((v11 & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_participantState = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_20:
    self->_participantType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_21:
  rootRecordType = self->_rootRecordType;
  uint64_t v13 = *((void *)v4 + 6);
  if (rootRecordType)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(rootRecordType, (const char *)v4, v13);
    }
  }
  else if (v13)
  {
    objc_msgSend_setRootRecordType_(self, (const char *)v4, v13);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
}

- (CKDPParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
}

- (CKDPParticipant)callerParticipant
{
  return self->_callerParticipant;
}

- (void)setCallerParticipant:(id)a3
{
}

- (CKDPRecordType)rootRecordType
{
  return self->_rootRecordType;
}

- (void)setRootRecordType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_rootRecordType, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_callerParticipant, 0);
}

@end
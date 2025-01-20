@interface SecureBackupEscrowReason
- (BOOL)hasExpectedFederationID;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)expectedFederationID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpectedFederationID:(id)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecureBackupEscrowReason

- (int)reason
{
  if (*(unsigned char *)&self->_has) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"FEDERATION_MOVE";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"UNKNOWN")) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"FEDERATION_MOVE");
  }

  return isEqualToString;
}

- (BOOL)hasExpectedFederationID
{
  return self->_expectedFederationID != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)SecureBackupEscrowReason;
  v4 = [(SecureBackupEscrowReason *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    int reason = self->_reason;
    if (reason)
    {
      if (reason == 1)
      {
        v7 = @"FEDERATION_MOVE";
        objc_msgSend_setObject_forKey_(v5, v4, @"FEDERATION_MOVE", @"reason");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_reason);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"reason");
      }
    }
    else
    {
      v7 = @"UNKNOWN";
      objc_msgSend_setObject_forKey_(v5, v4, @"UNKNOWN", @"reason");
    }
  }
  expectedFederationID = self->_expectedFederationID;
  if (expectedFederationID) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)expectedFederationID, @"expectedFederationID");
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return SecureBackupEscrowReasonReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_expectedFederationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_reason;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  expectedFederationID = self->_expectedFederationID;
  if (expectedFederationID)
  {
    v7 = v4;
    objc_msgSend_setExpectedFederationID_(v4, v5, (uint64_t)expectedFederationID);
    id v4 = v7;
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
    *(_DWORD *)(v10 + 16) = self->_reason;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_expectedFederationID, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  expectedFederationID = self->_expectedFederationID;
  uint64_t v9 = v4[1];
  if ((unint64_t)expectedFederationID | v9) {
    char isEqual = objc_msgSend_isEqual_(expectedFederationID, v7, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_expectedFederationID, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 20))
  {
    self->_int reason = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = *((void *)v4 + 1);
  if (v6)
  {
    id v7 = v4;
    objc_msgSend_setExpectedFederationID_(self, v5, v6);
    id v4 = v7;
  }
}

- (NSString)expectedFederationID
{
  return self->_expectedFederationID;
}

- (void)setExpectedFederationID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
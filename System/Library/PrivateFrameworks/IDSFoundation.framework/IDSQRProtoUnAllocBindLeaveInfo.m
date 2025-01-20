@interface IDSQRProtoUnAllocBindLeaveInfo
- (BOOL)hasClientContextBlob;
- (BOOL)hasParticipantId;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoMaterial)clientContextBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (unint64_t)participantId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientContextBlob:(id)a3;
- (void)setHasParticipantId:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setParticipantId:(unint64_t)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoUnAllocBindLeaveInfo

- (void)setParticipantId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantId = a3;
}

- (void)setHasParticipantId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (int)reason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)reasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5975C70[a3];
  }
  return v4;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"VOLUNTARY_LEAVE", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"CLIENT_LEAVING", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"GO_AWAY_INDICATION", v10))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"CLIENT_REINITIATE", v12))
  {
    int v8 = 3;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoUnAllocBindLeaveInfo;
  v4 = [(IDSQRProtoUnAllocBindLeaveInfo *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_participantId, v8);
    objc_msgSend_setObject_forKey_(v7, v10, (uint64_t)v9, v11, @"participant_id");
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    objc_super v13 = objc_msgSend_dictionaryRepresentation(clientContextBlob, v5, v6, v8);
    objc_msgSend_setObject_forKey_(v7, v14, (uint64_t)v13, v15, @"client_context_blob");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t reason = self->_reason;
    if (reason >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v8, self->_reason);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5975C70[reason];
    }
    objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)v17, v8, @"reason");
  }
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoUnAllocBindLeaveInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_clientContextBlob)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_participantId;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    double v8 = v4;
    objc_msgSend_setClientContextBlob_(v4, v5, (uint64_t)clientContextBlob, v6);
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_reason;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = v12;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_participantId;
    *(unsigned char *)(v12 + 28) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v13, (uint64_t)a3, v14);
  v17 = *(void **)(v15 + 16);
  *(void *)(v15 + 16) = v16;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v15 + 24) = self->_reason;
    *(unsigned char *)(v15 + 28) |= 2u;
  }
  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_participantId != v4[1]) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v12 = v4[2];
  if ((unint64_t)clientContextBlob | v12)
  {
    if (!objc_msgSend_isEqual_(clientContextBlob, v8, v12, v9))
    {
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v13 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_reason != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
    BOOL v13 = 1;
  }
LABEL_15:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_participantId;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend_hash(self->_clientContextBlob, a2, v2, v3);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 ^ v5 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_participantId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v8 = *((void *)v6 + 2);
  if (clientContextBlob)
  {
    if (!v8) {
      goto LABEL_9;
    }
    id v9 = v6;
    objc_msgSend_mergeFrom_(clientContextBlob, (const char *)v6, v8, v5);
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    id v9 = v6;
    objc_msgSend_setClientContextBlob_(self, (const char *)v6, v8, v5);
  }
  id v6 = v9;
LABEL_9:
  if ((*((unsigned char *)v6 + 28) & 2) != 0)
  {
    self->_uint64_t reason = *((_DWORD *)v6 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)participantId
{
  return self->_participantId;
}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
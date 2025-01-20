@interface IDSQRProtoParticipantUpdateParticipantModeInfo
- (BOOL)hasClientContextBlob;
- (BOOL)hasMode;
- (BOOL)hasParticipantId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoMaterial)clientContextBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (unint64_t)participantId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientContextBlob:(id)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasParticipantId:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setParticipantId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoParticipantUpdateParticipantModeInfo

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

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v5 = @"LIGHTWEIGHT";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v4, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"NORMAL";
  }
  return v5;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"NORMAL", v5)) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v6, @"LIGHTWEIGHT", v7);
  }

  return isEqualToString;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoParticipantUpdateParticipantModeInfo;
  double v4 = [(IDSQRProtoParticipantUpdateParticipantModeInfo *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if (has)
  {
    double v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_participantId, v8);
    objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)v10, v12, @"participant_id");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int mode = self->_mode;
    if (mode)
    {
      if (mode == 1)
      {
        v14 = @"LIGHTWEIGHT";
        objc_msgSend_setObject_forKey_(v7, v5, @"LIGHTWEIGHT", v8, @"mode");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v8, self->_mode);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)v14, v16, @"mode");
      }
    }
    else
    {
      v14 = @"NORMAL";
      objc_msgSend_setObject_forKey_(v7, v5, @"NORMAL", v8, @"mode");
    }
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    v18 = objc_msgSend_dictionaryRepresentation(clientContextBlob, v5, v6, v8);
    objc_msgSend_setObject_forKey_(v7, v19, (uint64_t)v18, v20, @"client_context_blob");
  }
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateParticipantModeInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_clientContextBlob)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_participantId;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_mode;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    v9 = v4;
    objc_msgSend_setClientContextBlob_(v4, v5, (uint64_t)clientContextBlob, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v12 + 8) = self->_participantId;
    *(unsigned char *)(v12 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 24) = self->_mode;
    *(unsigned char *)(v12 + 28) |= 2u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[2];
  v15[2] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_participantId != v4[1]) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_14:
    char isEqual = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v11 = v4[2];
  if ((unint64_t)clientContextBlob | v11) {
    char isEqual = objc_msgSend_isEqual_(clientContextBlob, v8, v11, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_participantId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v5 ^ v4 ^ objc_msgSend_hash(self->_clientContextBlob, a2, v2, v3);
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mode;
  return v5 ^ v4 ^ objc_msgSend_hash(self->_clientContextBlob, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  double v6 = v4;
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_participantId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_int mode = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v9 = v6[2];
  if (clientContextBlob)
  {
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v10 = v6;
    objc_msgSend_mergeFrom_(clientContextBlob, (const char *)v6, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v10 = v6;
    objc_msgSend_setClientContextBlob_(self, (const char *)v6, v9, v5);
  }
  double v6 = v10;
LABEL_11:
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
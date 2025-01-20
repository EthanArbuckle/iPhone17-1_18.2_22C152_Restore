@interface IDSQRProtoParticipantUpdateIndication
- (BOOL)hasOperationFlags;
- (BOOL)hasSessionStateCounter;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)participantIdListAtIndex:(unint64_t)a3;
- (unint64_t)participantIdLists;
- (unint64_t)participantIdListsCount;
- (unint64_t)txnId;
- (unsigned)operationFlags;
- (unsigned)sessionStateCounter;
- (void)addParticipantIdList:(unint64_t)a3;
- (void)clearParticipantIdLists;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationFlags:(BOOL)a3;
- (void)setHasSessionStateCounter:(BOOL)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setOperationFlags:(unsigned int)a3;
- (void)setParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setSessionStateCounter:(unsigned int)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoParticipantUpdateIndication

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantUpdateIndication;
  [(IDSQRProtoParticipantUpdateIndication *)&v3 dealloc];
}

- (unint64_t)participantIdListsCount
{
  return self->_participantIdLists.count;
}

- (unint64_t)participantIdLists
{
  return self->_participantIdLists.list;
}

- (void)clearParticipantIdLists
{
}

- (void)addParticipantIdList:(unint64_t)a3
{
}

- (unint64_t)participantIdListAtIndex:(unint64_t)a3
{
  p_participantIdLists = &self->_participantIdLists;
  unint64_t count = self->_participantIdLists.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_participantIdLists->list[a3];
}

- (void)setParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)setOperationFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_operationFlags = a3;
}

- (void)setHasOperationFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationFlags
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTxnId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStateCounter
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoParticipantUpdateIndication;
  v4 = [(IDSQRProtoParticipantUpdateIndication *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v6 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, v8, @"participant_id_list");

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, self->_operationFlags, v10);
    objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, v18, @"operation_flags");

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v19 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, self->_txnId, v10);
  objc_msgSend_setObject_forKey_(v5, v20, (uint64_t)v19, v21, @"txn_id");

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, self->_sessionStateCounter, v10);
    objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, v14, @"session_state_counter");
  }
LABEL_5:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_participantIdLists.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_participantIdLists.count);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_6:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v22 = a3;
  if (objc_msgSend_participantIdListsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearParticipantIdLists(v22, v7, v8, v9);
    uint64_t v13 = objc_msgSend_participantIdListsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v16 = v13;
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = objc_msgSend_participantIdListAtIndex_(self, v14, i, v15);
        objc_msgSend_addParticipantIdList_(v22, v19, v18, v20);
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v22 + 10) = self->_operationFlags;
    *((unsigned char *)v22 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v22 + 4) = self->_txnId;
  *((unsigned char *)v22 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v22 + 11) = self->_sessionStateCounter;
    *((unsigned char *)v22 + 48) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  PBRepeatedUInt64Copy();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v12 + 32) = self->_txnId;
    *(unsigned char *)(v12 + 48) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v12;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v12 + 40) = self->_operationFlags;
  *(unsigned char *)(v12 + 48) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v12 + 44) = self->_sessionStateCounter;
    *(unsigned char *)(v12 + 48) |= 4u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || !PBRepeatedUInt64IsEqual()) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_operationFlags != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_txnId != *((void *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_17;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_sessionStateCounter != *((_DWORD *)v4 + 11)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt64Hash();
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_operationFlags;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_txnId;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_sessionStateCounter;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  uint64_t v7 = objc_msgSend_participantIdListsCount(v16, v4, v5, v6);
  if (v7)
  {
    uint64_t v10 = v7;
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = objc_msgSend_participantIdListAtIndex_(v16, v8, i, v9);
      objc_msgSend_addParticipantIdList_(self, v13, v12, v14);
    }
  }
  char v15 = *((unsigned char *)v16 + 48);
  if ((v15 & 2) != 0)
  {
    self->_operationFlags = *((_DWORD *)v16 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v15 = *((unsigned char *)v16 + 48);
    if ((v15 & 1) == 0)
    {
LABEL_6:
      if ((v15 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*((unsigned char *)v16 + 48) & 1) == 0)
  {
    goto LABEL_6;
  }
  self->_txnId = *((void *)v16 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v16 + 48) & 4) != 0)
  {
LABEL_7:
    self->_sessionStateCounter = *((_DWORD *)v16 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
}

- (unsigned)operationFlags
{
  return self->_operationFlags;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

@end
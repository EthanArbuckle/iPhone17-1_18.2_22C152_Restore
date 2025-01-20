@interface IDSQRProtoParticipantUpdateRequest
- (BOOL)hasClientContextBlob;
- (BOOL)hasSessionStateCounter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoMaterial)clientContextBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)participantIdListAtIndex:(unint64_t)a3;
- (unint64_t)participantIdLists;
- (unint64_t)participantIdListsCount;
- (unsigned)operationFlags;
- (unsigned)sessionStateCounter;
- (void)addParticipantIdList:(unint64_t)a3;
- (void)clearParticipantIdLists;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientContextBlob:(id)a3;
- (void)setHasSessionStateCounter:(BOOL)a3;
- (void)setOperationFlags:(unsigned int)a3;
- (void)setParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setSessionStateCounter:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoParticipantUpdateRequest

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantUpdateRequest;
  [(IDSQRProtoParticipantUpdateRequest *)&v3 dealloc];
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

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStateCounter
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoParticipantUpdateRequest;
  v4 = [(IDSQRProtoParticipantUpdateRequest *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_operationFlags, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"operation_flags");

  double v11 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v12, (uint64_t)v11, v13, @"participant_id_list");

  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    v18 = objc_msgSend_dictionaryRepresentation(clientContextBlob, v14, v15, v16);
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, @"client_context_blob");
  }
  if (*(unsigned char *)&self->_has)
  {
    v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, self->_sessionStateCounter, v16);
    objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, v23, @"session_state_counter");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_participantIdLists.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v4;
    }
    while (v4 < self->_participantIdLists.count);
  }
  if (self->_clientContextBlob) {
    PBDataWriterWriteSubmessage();
  }
  v5 = v6;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  double v20 = a3;
  v20[10] = self->_operationFlags;
  if (objc_msgSend_participantIdListsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearParticipantIdLists(v20, v7, v8, v9);
    uint64_t v13 = objc_msgSend_participantIdListsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_participantIdListAtIndex_(self, v7, i, v9);
        objc_msgSend_addParticipantIdList_(v20, v17, v16, v18);
      }
    }
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob) {
    objc_msgSend_setClientContextBlob_(v20, v7, (uint64_t)clientContextBlob, v9);
  }
  if (*(unsigned char *)&self->_has)
  {
    v20[11] = self->_sessionStateCounter;
    *((unsigned char *)v20 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 40) = self->_operationFlags;
  PBRepeatedUInt64Copy();
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v13, (uint64_t)a3, v14);
  uint64_t v16 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 44) = self->_sessionStateCounter;
    *(unsigned char *)(v12 + 48) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_10;
  }
  if (self->_operationFlags != *((_DWORD *)v4 + 10)) {
    goto LABEL_10;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_10;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v11 = v4[4];
  if ((unint64_t)clientContextBlob | v11)
  {
    if (!objc_msgSend_isEqual_(clientContextBlob, v8, v11, v9)) {
      goto LABEL_10;
    }
  }
  BOOL v12 = (v4[6] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[6] & 1) != 0 && self->_sessionStateCounter == *((_DWORD *)v4 + 11))
    {
      BOOL v12 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  unsigned int operationFlags = self->_operationFlags;
  uint64_t v4 = PBRepeatedUInt64Hash();
  uint64_t v8 = objc_msgSend_hash(self->_clientContextBlob, v5, v6, v7);
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_sessionStateCounter;
  }
  else {
    uint64_t v9 = 0;
  }
  return (2654435761 * operationFlags) ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_unsigned int operationFlags = v4[10];
  v19 = v4;
  uint64_t v8 = objc_msgSend_participantIdListsCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_participantIdListAtIndex_(v19, v9, i, v10);
      objc_msgSend_addParticipantIdList_(self, v14, v13, v15);
    }
  }
  clientContextBlob = self->_clientContextBlob;
  v17 = v19;
  uint64_t v18 = v19[4];
  if (clientContextBlob)
  {
    if (!v18) {
      goto LABEL_10;
    }
    objc_msgSend_mergeFrom_(clientContextBlob, (const char *)v19, v18, v10);
  }
  else
  {
    if (!v18) {
      goto LABEL_10;
    }
    objc_msgSend_setClientContextBlob_(self, (const char *)v19, v18, v10);
  }
  v17 = v19;
LABEL_10:
  if (v17[6])
  {
    self->_sessionStateCounter = *((_DWORD *)v17 + 11);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)operationFlags
{
  return self->_operationFlags;
}

- (void)setOperationFlags:(unsigned int)a3
{
  self->_unsigned int operationFlags = a3;
}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

- (void).cxx_destruct
{
}

@end
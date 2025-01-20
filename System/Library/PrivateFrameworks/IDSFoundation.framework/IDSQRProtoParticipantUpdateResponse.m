@interface IDSQRProtoParticipantUpdateResponse
- (BOOL)hasSessionStateCounter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setHasSessionStateCounter:(BOOL)a3;
- (void)setOperationFlags:(unsigned int)a3;
- (void)setParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setSessionStateCounter:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoParticipantUpdateResponse

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantUpdateResponse;
  [(IDSQRProtoParticipantUpdateResponse *)&v3 dealloc];
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
  v13.super_class = (Class)IDSQRProtoParticipantUpdateResponse;
  v4 = [(IDSQRProtoParticipantUpdateResponse *)&v13 description];
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

  if (*(unsigned char *)&self->_has)
  {
    v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, self->_sessionStateCounter, v15);
    objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, v18, @"session_state_counter");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v21 = a3;
  v21[8] = self->_operationFlags;
  if (objc_msgSend_participantIdListsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearParticipantIdLists(v21, v7, v8, v9);
    uint64_t v13 = objc_msgSend_participantIdListsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v16 = v13;
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = objc_msgSend_participantIdListAtIndex_(self, v14, i, v15);
        objc_msgSend_addParticipantIdList_(v21, v19, v18, v20);
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v21[9] = self->_sessionStateCounter;
    *((unsigned char *)v21 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 32) = self->_operationFlags;
  PBRepeatedUInt64Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 36) = self->_sessionStateCounter;
    *(unsigned char *)(v12 + 40) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    || self->_operationFlags != *((_DWORD *)v4 + 8)
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_8;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_sessionStateCounter == *((_DWORD *)v4 + 9))
    {
      BOOL v8 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  unsigned int operationFlags = self->_operationFlags;
  uint64_t v4 = PBRepeatedUInt64Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_sessionStateCounter;
  }
  else {
    uint64_t v5 = 0;
  }
  return (2654435761 * operationFlags) ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  self->_unsigned int operationFlags = v4[8];
  uint64_t v16 = v4;
  uint64_t v8 = objc_msgSend_participantIdListsCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_participantIdListAtIndex_(v16, v9, i, v10);
      objc_msgSend_addParticipantIdList_(self, v14, v13, v15);
    }
  }
  if (v16[10])
  {
    self->_sessionStateCounter = v16[9];
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

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

@end
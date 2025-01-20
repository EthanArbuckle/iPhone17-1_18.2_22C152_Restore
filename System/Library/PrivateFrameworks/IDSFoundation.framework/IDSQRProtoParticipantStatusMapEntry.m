@interface IDSQRProtoParticipantStatusMapEntry
- (BOOL)hasParticipantStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantStatusAsString:(int)a3;
- (int)StringAsParticipantStatus:(id)a3;
- (int)participantStatus;
- (unint64_t)hash;
- (unint64_t)participantIds;
- (unint64_t)participantIdsAtIndex:(unint64_t)a3;
- (unint64_t)participantIdsCount;
- (void)addParticipantIds:(unint64_t)a3;
- (void)clearParticipantIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasParticipantStatus:(BOOL)a3;
- (void)setParticipantIds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setParticipantStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoParticipantStatusMapEntry

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantStatusMapEntry;
  [(IDSQRProtoParticipantStatusMapEntry *)&v3 dealloc];
}

- (int)participantStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_participantStatus;
  }
  else {
    return 0;
  }
}

- (void)setParticipantStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantStatus = a3;
}

- (void)setHasParticipantStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)participantStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5974B20[a3];
  }
  return v4;
}

- (int)StringAsParticipantStatus:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"HOST", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"PERFORMER", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"ACTIVE_AUDIENCE", v10))
  {
    int v8 = 2;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (unint64_t)participantIdsCount
{
  return self->_participantIds.count;
}

- (unint64_t)participantIds
{
  return self->_participantIds.list;
}

- (void)clearParticipantIds
{
}

- (void)addParticipantIds:(unint64_t)a3
{
}

- (unint64_t)participantIdsAtIndex:(unint64_t)a3
{
  p_participantIds = &self->_participantIds;
  unint64_t count = self->_participantIds.count;
  if (count <= a3)
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_participantIds->list[a3];
}

- (void)setParticipantIds:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoParticipantStatusMapEntry;
  v4 = [(IDSQRProtoParticipantStatusMapEntry *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t participantStatus = self->_participantStatus;
    if (participantStatus >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_participantStatus);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5974B20[participantStatus];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v9, v7, @"participant_status");
  }
  double v10 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, v12, @"participant_ids");

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantStatusMapEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  p_participantIds = &self->_participantIds;
  if (p_participantIds->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_participantIds->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_participantStatus;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v22 = v4;
  if (objc_msgSend_participantIdsCount(self, v5, v6, v7))
  {
    objc_msgSend_clearParticipantIds(v22, v8, v9, v10);
    uint64_t v14 = objc_msgSend_participantIdsCount(self, v11, v12, v13);
    if (v14)
    {
      uint64_t v17 = v14;
      for (uint64_t i = 0; i != v17; ++i)
      {
        uint64_t v19 = objc_msgSend_participantIdsAtIndex_(self, v15, i, v16);
        objc_msgSend_addParticipantIds_(v22, v20, v19, v21);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  double v13 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 32) = self->_participantStatus;
    *(unsigned char *)(v12 + 36) |= 1u;
  }
  PBRepeatedUInt64Copy();
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_participantStatus != *((_DWORD *)v4 + 8)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_participantStatus;
  }
  else {
    uint64_t v2 = 0;
  }
  return PBRepeatedUInt64Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[9])
  {
    self->_uint64_t participantStatus = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v16 = v4;
  uint64_t v8 = objc_msgSend_participantIdsCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_participantIdsAtIndex_(v16, v9, i, v10);
      objc_msgSend_addParticipantIds_(self, v14, v13, v15);
    }
  }
}

@end
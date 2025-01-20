@interface IDSQRProtoSubscribedStream
- (BOOL)hasIsSeamlessTransition;
- (BOOL)hasPeerParticipantId;
- (BOOL)hasWildcardSubscription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSeamlessTransition;
- (BOOL)readFrom:(id)a3;
- (BOOL)wildcardSubscription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)peerParticipantId;
- (unint64_t)peerStreamIdsCount;
- (unsigned)peerStreamIds;
- (unsigned)peerStreamIdsAtIndex:(unint64_t)a3;
- (void)addPeerStreamIds:(unsigned int)a3;
- (void)clearPeerStreamIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIsSeamlessTransition:(BOOL)a3;
- (void)setHasPeerParticipantId:(BOOL)a3;
- (void)setHasWildcardSubscription:(BOOL)a3;
- (void)setIsSeamlessTransition:(BOOL)a3;
- (void)setPeerParticipantId:(unint64_t)a3;
- (void)setPeerStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWildcardSubscription:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSubscribedStream

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSubscribedStream;
  [(IDSQRProtoSubscribedStream *)&v3 dealloc];
}

- (void)setWildcardSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wildcardSubscription = a3;
}

- (void)setHasWildcardSubscription:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWildcardSubscription
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPeerParticipantId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_peerParticipantId = a3;
}

- (void)setHasPeerParticipantId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPeerParticipantId
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)peerStreamIdsCount
{
  return self->_peerStreamIds.count;
}

- (unsigned)peerStreamIds
{
  return self->_peerStreamIds.list;
}

- (void)clearPeerStreamIds
{
}

- (void)addPeerStreamIds:(unsigned int)a3
{
}

- (unsigned)peerStreamIdsAtIndex:(unint64_t)a3
{
  p_peerStreamIds = &self->_peerStreamIds;
  unint64_t count = self->_peerStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_peerStreamIds->list[a3];
}

- (void)setPeerStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setIsSeamlessTransition:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isSeamlessTransition = a3;
}

- (void)setHasIsSeamlessTransition:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSeamlessTransition
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoSubscribedStream;
  v4 = [(IDSQRProtoSubscribedStream *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_wildcardSubscription, v7);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, @"wildcard_subscription");

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_peerParticipantId, v7);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, @"peer_participant_id");
  }
  double v15 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, v17, @"peer_stream_ids");

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20 = objc_msgSend_numberWithBool_(NSNumber, v18, self->_isSeamlessTransition, v19);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, v22, @"is_seamless_transition");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSubscribedStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
  if (self->_peerStreamIds.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_peerStreamIds.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[41] = self->_wildcardSubscription;
    v4[44] |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 4) = self->_peerParticipantId;
    v4[44] |= 1u;
  }
  v23 = v4;
  if (objc_msgSend_peerStreamIdsCount(self, v5, v6, v7))
  {
    objc_msgSend_clearPeerStreamIds(v23, v9, v10, v11);
    uint64_t v15 = objc_msgSend_peerStreamIdsCount(self, v12, v13, v14);
    if (v15)
    {
      uint64_t v18 = v15;
      for (uint64_t i = 0; i != v18; ++i)
      {
        uint64_t v20 = objc_msgSend_peerStreamIdsAtIndex_(self, v16, i, v17);
        objc_msgSend_addPeerStreamIds_(v23, v21, v20, v22);
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v23[40] = self->_isSeamlessTransition;
    v23[44] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v13 = (unsigned char *)v12;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v12 + 41) = self->_wildcardSubscription;
    *(unsigned char *)(v12 + 44) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v12 + 32) = self->_peerParticipantId;
    *(unsigned char *)(v12 + 44) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13[40] = self->_isSeamlessTransition;
    v13[44] |= 2u;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0) {
      goto LABEL_18;
    }
    if (self->_wildcardSubscription)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_peerParticipantId != *((void *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_18:
    BOOL v8 = 0;
    goto LABEL_19;
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_isSeamlessTransition)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_18;
      }
      BOOL v8 = 1;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_wildcardSubscription;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_peerParticipantId;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_isSeamlessTransition;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v8 = *((unsigned char *)v4 + 44);
  if ((v8 & 4) != 0)
  {
    self->_wildcardSubscription = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v4 + 44);
  }
  if (v8)
  {
    self->_peerParticipantId = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  double v17 = (BOOL *)v4;
  uint64_t v9 = objc_msgSend_peerStreamIdsCount(v4, v5, v6, v7);
  if (v9)
  {
    uint64_t v12 = v9;
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v14 = objc_msgSend_peerStreamIdsAtIndex_(v17, v10, i, v11);
      objc_msgSend_addPeerStreamIds_(self, v15, v14, v16);
    }
  }
  if ((v17[44] & 2) != 0)
  {
    self->_isSeamlessTransition = v17[40];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)wildcardSubscription
{
  return self->_wildcardSubscription;
}

- (unint64_t)peerParticipantId
{
  return self->_peerParticipantId;
}

- (BOOL)isSeamlessTransition
{
  return self->_isSeamlessTransition;
}

@end
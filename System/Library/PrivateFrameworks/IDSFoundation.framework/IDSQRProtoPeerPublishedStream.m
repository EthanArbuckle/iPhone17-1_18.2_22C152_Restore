@interface IDSQRProtoPeerPublishedStream
- (BOOL)hasPeerParticipantId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setHasPeerParticipantId:(BOOL)a3;
- (void)setPeerParticipantId:(unint64_t)a3;
- (void)setPeerStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPeerPublishedStream

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoPeerPublishedStream;
  [(IDSQRProtoPeerPublishedStream *)&v3 dealloc];
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

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPeerPublishedStream;
  v4 = [(IDSQRProtoPeerPublishedStream *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_peerParticipantId, v7);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, @"peer_participant_id");
  }
  double v11 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, v13, @"peer_stream_ids");

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPeerPublishedStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
  p_peerStreamIds = &self->_peerStreamIds;
  if (p_peerStreamIds->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_peerStreamIds->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_peerParticipantId;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v22 = v4;
  if (objc_msgSend_peerStreamIdsCount(self, v5, v6, v7))
  {
    objc_msgSend_clearPeerStreamIds(v22, v8, v9, v10);
    uint64_t v14 = objc_msgSend_peerStreamIdsCount(self, v11, v12, v13);
    if (v14)
    {
      uint64_t v17 = v14;
      for (uint64_t i = 0; i != v17; ++i)
      {
        uint64_t v19 = objc_msgSend_peerStreamIdsAtIndex_(self, v15, i, v16);
        objc_msgSend_addPeerStreamIds_(v22, v20, v19, v21);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  double v13 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 32) = self->_peerParticipantId;
    *(unsigned char *)(v12 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
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
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_peerParticipantId != *((void *)v4 + 4)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_peerParticipantId;
  }
  else {
    unint64_t v2 = 0;
  }
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_peerParticipantId = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v16 = v4;
  uint64_t v8 = objc_msgSend_peerStreamIdsCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_peerStreamIdsAtIndex_(v16, v9, i, v10);
      objc_msgSend_addPeerStreamIds_(self, v14, v13, v15);
    }
  }
}

- (unint64_t)peerParticipantId
{
  return self->_peerParticipantId;
}

@end
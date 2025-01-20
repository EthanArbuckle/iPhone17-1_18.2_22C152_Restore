@interface IDSQRProtoSessionInfoResponse
+ (Class)peerPublishedStreamsType;
- (BOOL)hasCommandFlags;
- (BOOL)hasGenerationCounter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)peerPublishedStreams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)peerPublishedStreamsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3;
- (unint64_t)lightweightParticipantIdLists;
- (unint64_t)lightweightParticipantIdListsCount;
- (unint64_t)peerPublishedStreamsCount;
- (unint64_t)peerSubscribedStreamIdsCount;
- (unsigned)commandFlags;
- (unsigned)generationCounter;
- (unsigned)peerSubscribedStreamIds;
- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3;
- (void)addLightweightParticipantIdList:(unint64_t)a3;
- (void)addPeerPublishedStreams:(id)a3;
- (void)addPeerSubscribedStreamIds:(unsigned int)a3;
- (void)clearLightweightParticipantIdLists;
- (void)clearPeerPublishedStreams;
- (void)clearPeerSubscribedStreamIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCommandFlags:(unsigned int)a3;
- (void)setGenerationCounter:(unsigned int)a3;
- (void)setHasCommandFlags:(BOOL)a3;
- (void)setHasGenerationCounter:(BOOL)a3;
- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setPeerPublishedStreams:(id)a3;
- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSessionInfoResponse

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoResponse;
  [(IDSQRProtoSessionInfoResponse *)&v3 dealloc];
}

- (void)clearPeerPublishedStreams
{
  objc_msgSend_removeAllObjects(self->_peerPublishedStreams, a2, v2, v3);
}

- (void)addPeerPublishedStreams:(id)a3
{
  v4 = (const char *)a3;
  peerPublishedStreams = self->_peerPublishedStreams;
  v9 = (char *)v4;
  if (!peerPublishedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_peerPublishedStreams;
    self->_peerPublishedStreams = v7;

    v4 = v9;
    peerPublishedStreams = self->_peerPublishedStreams;
  }
  objc_msgSend_addObject_(peerPublishedStreams, v4, (uint64_t)v4, v5);
}

- (unint64_t)peerPublishedStreamsCount
{
  return objc_msgSend_count(self->_peerPublishedStreams, a2, v2, v3);
}

- (id)peerPublishedStreamsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_peerPublishedStreams, a2, a3, v3);
}

+ (Class)peerPublishedStreamsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)peerSubscribedStreamIdsCount
{
  return self->_peerSubscribedStreamIds.count;
}

- (unsigned)peerSubscribedStreamIds
{
  return self->_peerSubscribedStreamIds.list;
}

- (void)clearPeerSubscribedStreamIds
{
}

- (void)addPeerSubscribedStreamIds:(unsigned int)a3
{
}

- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3
{
  p_peerSubscribedStreamIds = &self->_peerSubscribedStreamIds;
  unint64_t count = self->_peerSubscribedStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_peerSubscribedStreamIds->list[a3];
}

- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)lightweightParticipantIdListsCount
{
  return self->_lightweightParticipantIdLists.count;
}

- (unint64_t)lightweightParticipantIdLists
{
  return self->_lightweightParticipantIdLists.list;
}

- (void)clearLightweightParticipantIdLists
{
}

- (void)addLightweightParticipantIdList:(unint64_t)a3
{
}

- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3
{
  p_lightweightParticipantIdLists = &self->_lightweightParticipantIdLists;
  unint64_t count = self->_lightweightParticipantIdLists.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_lightweightParticipantIdLists->list[a3];
}

- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)setCommandFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_commandFlags = a3;
}

- (void)setHasCommandFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_generationCounter = a3;
}

- (void)setHasGenerationCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationCounter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoSessionInfoResponse;
  v4 = [(IDSQRProtoSessionInfoResponse *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (objc_msgSend_count(self->_peerPublishedStreams, v6, v7, v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_peerPublishedStreams, v10, v11, v12);
    v16 = objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v17 = self->_peerPublishedStreams;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v19, v52, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      uint64_t v25 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v49 != v25) {
            objc_enumerationMutation(v17);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v48 + 1) + 8 * i), v21, v22, v23, (void)v48);
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v48, v23, v52, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, @"peer_published_streams");
  }
  v32 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, v34, @"peer_subscribed_stream_ids");

  v35 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, v37, @"lightweight_participant_id_list");

  char has = (char)self->_has;
  if (has)
  {
    v41 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v38, self->_commandFlags, v39);
    objc_msgSend_setObject_forKey_(v5, v42, (uint64_t)v41, v43, @"command_flags");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v44 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v38, self->_generationCounter, v39);
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, @"generation_counter");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoResponseReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = self->_peerPublishedStreams;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, v7, v21, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v17, v13, v21, 16);
    }
    while (v9);
  }

  if (self->_peerSubscribedStreamIds.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v14;
    }
    while (v14 < self->_peerSubscribedStreamIds.count);
  }
  if (self->_lightweightParticipantIdLists.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v15;
    }
    while (v15 < self->_lightweightParticipantIdLists.count);
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v46 = a3;
  if (objc_msgSend_peerPublishedStreamsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPeerPublishedStreams(v46, v7, v8, v9);
    uint64_t v13 = objc_msgSend_peerPublishedStreamsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_peerPublishedStreamsAtIndex_(self, v7, i, v9);
        objc_msgSend_addPeerPublishedStreams_(v46, v17, (uint64_t)v16, v18);
      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v46, v19, v20, v21);
    uint64_t v25 = objc_msgSend_peerSubscribedStreamIdsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v28 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v19, j, v21);
        objc_msgSend_addPeerSubscribedStreamIds_(v46, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v46, v31, v32, v33);
    uint64_t v37 = objc_msgSend_lightweightParticipantIdListsCount(self, v34, v35, v36);
    if (v37)
    {
      uint64_t v40 = v37;
      for (uint64_t k = 0; k != v40; ++k)
      {
        uint64_t v42 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v38, k, v39);
        objc_msgSend_addLightweightParticipantIdList_(v46, v43, v42, v44);
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v46 + 14) = self->_commandFlags;
    *((unsigned char *)v46 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v46 + 15) = self->_generationCounter;
    *((unsigned char *)v46 + 72) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = self->_peerPublishedStreams;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v15, v31, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, v18, (void)v27);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v27, v18, v31, 16);
    }
    while (v19);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v12 + 56) = self->_commandFlags;
    *(unsigned char *)(v12 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 60) = self->_generationCounter;
    *(unsigned char *)(v12 + 72) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_15;
  }
  peerPublishedStreams = self->_peerPublishedStreams;
  uint64_t v11 = v4[8];
  if ((unint64_t)peerPublishedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v11, v9)) {
      goto LABEL_15;
    }
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt64IsEqual()) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[9] & 1) == 0 || self->_commandFlags != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
  }
  else if (v4[9])
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  BOOL v12 = (v4[9] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 15)) {
      goto LABEL_15;
    }
    BOOL v12 = 1;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_peerPublishedStreams, a2, v2, v3);
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt64Hash();
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_commandFlags;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v6 ^ v5 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_generationCounter;
  return v6 ^ v5 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v7, v39, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addPeerPublishedStreams_(self, v9, *(void *)(*((void *)&v35 + 1) + 8 * i), v10, (void)v35);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v35, v10, v39, 16);
    }
    while (v11);
  }

  uint64_t v17 = objc_msgSend_peerSubscribedStreamIdsCount(v4, v14, v15, v16);
  if (v17)
  {
    uint64_t v21 = v17;
    for (uint64_t j = 0; j != v21; ++j)
    {
      uint64_t v23 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v4, v18, j, v20, (void)v35);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v24, v23, v25);
    }
  }
  uint64_t v26 = objc_msgSend_lightweightParticipantIdListsCount(v4, v18, v19, v20, (void)v35);
  if (v26)
  {
    uint64_t v29 = v26;
    for (uint64_t k = 0; k != v29; ++k)
    {
      uint64_t v31 = objc_msgSend_lightweightParticipantIdListAtIndex_(v4, v27, k, v28);
      objc_msgSend_addLightweightParticipantIdList_(self, v32, v31, v33);
    }
  }
  char v34 = *((unsigned char *)v4 + 72);
  if (v34)
  {
    self->_commandFlags = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v34 = *((unsigned char *)v4 + 72);
  }
  if ((v34 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSMutableArray)peerPublishedStreams
{
  return self->_peerPublishedStreams;
}

- (void)setPeerPublishedStreams:(id)a3
{
}

- (unsigned)commandFlags
{
  return self->_commandFlags;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void).cxx_destruct
{
}

@end
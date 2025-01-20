@interface IDSQRProtoSessionInfoIndication
+ (Class)joinedParticipantsType;
+ (Class)leftParticipantsType;
+ (Class)peerPublishedStreamsType;
+ (Class)updatedParticipantsType;
- (BOOL)hasGenerationCounter;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)joinedParticipants;
- (NSMutableArray)leftParticipants;
- (NSMutableArray)peerPublishedStreams;
- (NSMutableArray)updatedParticipants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)joinedParticipantsAtIndex:(unint64_t)a3;
- (id)leftParticipantsAtIndex:(unint64_t)a3;
- (id)peerPublishedStreamsAtIndex:(unint64_t)a3;
- (id)updatedParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)joinedParticipantsCount;
- (unint64_t)leftParticipantsCount;
- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3;
- (unint64_t)lightweightParticipantIdLists;
- (unint64_t)lightweightParticipantIdListsCount;
- (unint64_t)peerPublishedStreamsCount;
- (unint64_t)peerSubscribedStreamIdsCount;
- (unint64_t)txnId;
- (unint64_t)updatedParticipantsCount;
- (unsigned)generationCounter;
- (unsigned)peerSubscribedStreamIds;
- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3;
- (void)addJoinedParticipants:(id)a3;
- (void)addLeftParticipants:(id)a3;
- (void)addLightweightParticipantIdList:(unint64_t)a3;
- (void)addPeerPublishedStreams:(id)a3;
- (void)addPeerSubscribedStreamIds:(unsigned int)a3;
- (void)addUpdatedParticipants:(id)a3;
- (void)clearJoinedParticipants;
- (void)clearLeftParticipants;
- (void)clearLightweightParticipantIdLists;
- (void)clearPeerPublishedStreams;
- (void)clearPeerSubscribedStreamIds;
- (void)clearUpdatedParticipants;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGenerationCounter:(unsigned int)a3;
- (void)setHasGenerationCounter:(BOOL)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setJoinedParticipants:(id)a3;
- (void)setLeftParticipants:(id)a3;
- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setPeerPublishedStreams:(id)a3;
- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxnId:(unint64_t)a3;
- (void)setUpdatedParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSessionInfoIndication

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoIndication;
  [(IDSQRProtoSessionInfoIndication *)&v3 dealloc];
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

- (void)clearJoinedParticipants
{
  objc_msgSend_removeAllObjects(self->_joinedParticipants, a2, v2, v3);
}

- (void)addJoinedParticipants:(id)a3
{
  v4 = (const char *)a3;
  joinedParticipants = self->_joinedParticipants;
  v9 = (char *)v4;
  if (!joinedParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_joinedParticipants;
    self->_joinedParticipants = v7;

    v4 = v9;
    joinedParticipants = self->_joinedParticipants;
  }
  objc_msgSend_addObject_(joinedParticipants, v4, (uint64_t)v4, v5);
}

- (unint64_t)joinedParticipantsCount
{
  return objc_msgSend_count(self->_joinedParticipants, a2, v2, v3);
}

- (id)joinedParticipantsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_joinedParticipants, a2, a3, v3);
}

+ (Class)joinedParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)clearLeftParticipants
{
  objc_msgSend_removeAllObjects(self->_leftParticipants, a2, v2, v3);
}

- (void)addLeftParticipants:(id)a3
{
  v4 = (const char *)a3;
  leftParticipants = self->_leftParticipants;
  v9 = (char *)v4;
  if (!leftParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_leftParticipants;
    self->_leftParticipants = v7;

    v4 = v9;
    leftParticipants = self->_leftParticipants;
  }
  objc_msgSend_addObject_(leftParticipants, v4, (uint64_t)v4, v5);
}

- (unint64_t)leftParticipantsCount
{
  return objc_msgSend_count(self->_leftParticipants, a2, v2, v3);
}

- (id)leftParticipantsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_leftParticipants, a2, a3, v3);
}

+ (Class)leftParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)clearUpdatedParticipants
{
  objc_msgSend_removeAllObjects(self->_updatedParticipants, a2, v2, v3);
}

- (void)addUpdatedParticipants:(id)a3
{
  v4 = (const char *)a3;
  updatedParticipants = self->_updatedParticipants;
  v9 = (char *)v4;
  if (!updatedParticipants)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_updatedParticipants;
    self->_updatedParticipants = v7;

    v4 = v9;
    updatedParticipants = self->_updatedParticipants;
  }
  objc_msgSend_addObject_(updatedParticipants, v4, (uint64_t)v4, v5);
}

- (unint64_t)updatedParticipantsCount
{
  return objc_msgSend_count(self->_updatedParticipants, a2, v2, v3);
}

- (id)updatedParticipantsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_updatedParticipants, a2, a3, v3);
}

+ (Class)updatedParticipantsType
{
  return (Class)objc_opt_class();
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
  v13.super_class = (Class)IDSQRProtoSessionInfoIndication;
  v4 = [(IDSQRProtoSessionInfoIndication *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (objc_msgSend_count(self->_peerPublishedStreams, v6, v7, v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_peerPublishedStreams, v10, v11, v12);
    v16 = objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v17 = self->_peerPublishedStreams;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v138, v19, v145, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      uint64_t v25 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v139 != v25) {
            objc_enumerationMutation(v17);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v138 + 1) + 8 * i), v21, v22, v23);
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v138, v23, v145, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, @"peer_published_streams");
  }
  v32 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, v34, @"peer_subscribed_stream_ids");

  v35 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, v37, @"lightweight_participant_id_list");

  if (objc_msgSend_count(self->_joinedParticipants, v38, v39, v40))
  {
    id v44 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v48 = objc_msgSend_count(self->_joinedParticipants, v45, v46, v47);
    v51 = objc_msgSend_initWithCapacity_(v44, v49, v48, v50);
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    v52 = self->_joinedParticipants;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v134, v54, v144, 16);
    if (v55)
    {
      uint64_t v59 = v55;
      uint64_t v60 = *(void *)v135;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v135 != v60) {
            objc_enumerationMutation(v52);
          }
          v62 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v134 + 1) + 8 * j), v56, v57, v58);
          objc_msgSend_addObject_(v51, v63, (uint64_t)v62, v64);
        }
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v134, v58, v144, 16);
      }
      while (v59);
    }

    objc_msgSend_setObject_forKey_(v5, v65, (uint64_t)v51, v66, @"joined_participants");
  }
  if (objc_msgSend_count(self->_leftParticipants, v41, v42, v43))
  {
    id v70 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v74 = objc_msgSend_count(self->_leftParticipants, v71, v72, v73);
    v77 = objc_msgSend_initWithCapacity_(v70, v75, v74, v76);
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v78 = self->_leftParticipants;
    uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v130, v80, v143, 16);
    if (v81)
    {
      uint64_t v85 = v81;
      uint64_t v86 = *(void *)v131;
      do
      {
        for (uint64_t k = 0; k != v85; ++k)
        {
          if (*(void *)v131 != v86) {
            objc_enumerationMutation(v78);
          }
          v88 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v130 + 1) + 8 * k), v82, v83, v84);
          objc_msgSend_addObject_(v77, v89, (uint64_t)v88, v90);
        }
        uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v82, (uint64_t)&v130, v84, v143, 16);
      }
      while (v85);
    }

    objc_msgSend_setObject_forKey_(v5, v91, (uint64_t)v77, v92, @"left_participants");
  }
  if (objc_msgSend_count(self->_updatedParticipants, v67, v68, v69))
  {
    id v95 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v99 = objc_msgSend_count(self->_updatedParticipants, v96, v97, v98);
    v102 = objc_msgSend_initWithCapacity_(v95, v100, v99, v101);
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v103 = self->_updatedParticipants;
    uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v126, v105, v142, 16);
    if (v106)
    {
      uint64_t v110 = v106;
      uint64_t v111 = *(void *)v127;
      do
      {
        for (uint64_t m = 0; m != v110; ++m)
        {
          if (*(void *)v127 != v111) {
            objc_enumerationMutation(v103);
          }
          v113 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v126 + 1) + 8 * m), v107, v108, v109, (void)v126);
          objc_msgSend_addObject_(v102, v114, (uint64_t)v113, v115);
        }
        uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v107, (uint64_t)&v126, v109, v142, 16);
      }
      while (v110);
    }

    objc_msgSend_setObject_forKey_(v5, v116, (uint64_t)v102, v117, @"updated_participants");
  }
  char has = (char)self->_has;
  if (has)
  {
    v119 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v93, self->_txnId, v94);
    objc_msgSend_setObject_forKey_(v5, v120, (uint64_t)v119, v121, @"txn_id");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v122 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v93, self->_generationCounter, v94);
    objc_msgSend_setObject_forKey_(v5, v123, (uint64_t)v122, v124, @"generation_counter");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  double v5 = self->_peerPublishedStreams;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v56, v7, v63, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v56, v13, v63, 16);
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
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v16 = self->_joinedParticipants;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v52, v18, v62, 16);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v52, v24, v62, 16);
    }
    while (v20);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v25 = self->_leftParticipants;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v48, v27, v61, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v48, v33, v61, 16);
    }
    while (v29);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v34 = self->_updatedParticipants;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v44, v36, v60, 16);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v34);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v41, (uint64_t)&v44, v42, v60, 16);
    }
    while (v38);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v82 = a3;
  if (objc_msgSend_peerPublishedStreamsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPeerPublishedStreams(v82, v7, v8, v9);
    uint64_t v13 = objc_msgSend_peerPublishedStreamsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_peerPublishedStreamsAtIndex_(self, v7, i, v9);
        objc_msgSend_addPeerPublishedStreams_(v82, v17, (uint64_t)v16, v18);
      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v82, v19, v20, v21);
    uint64_t v25 = objc_msgSend_peerSubscribedStreamIdsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v28 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v19, j, v21);
        objc_msgSend_addPeerSubscribedStreamIds_(v82, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v82, v31, v32, v33);
    uint64_t v37 = objc_msgSend_lightweightParticipantIdListsCount(self, v34, v35, v36);
    if (v37)
    {
      uint64_t v38 = v37;
      for (uint64_t k = 0; k != v38; ++k)
      {
        uint64_t v40 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v31, k, v33);
        objc_msgSend_addLightweightParticipantIdList_(v82, v41, v40, v42);
      }
    }
  }
  if (objc_msgSend_joinedParticipantsCount(self, v31, v32, v33))
  {
    objc_msgSend_clearJoinedParticipants(v82, v43, v44, v45);
    uint64_t v49 = objc_msgSend_joinedParticipantsCount(self, v46, v47, v48);
    if (v49)
    {
      uint64_t v50 = v49;
      for (uint64_t m = 0; m != v50; ++m)
      {
        long long v52 = objc_msgSend_joinedParticipantsAtIndex_(self, v43, m, v45);
        objc_msgSend_addJoinedParticipants_(v82, v53, (uint64_t)v52, v54);
      }
    }
  }
  if (objc_msgSend_leftParticipantsCount(self, v43, v44, v45))
  {
    objc_msgSend_clearLeftParticipants(v82, v55, v56, v57);
    uint64_t v61 = objc_msgSend_leftParticipantsCount(self, v58, v59, v60);
    if (v61)
    {
      uint64_t v62 = v61;
      for (uint64_t n = 0; n != v62; ++n)
      {
        uint64_t v64 = objc_msgSend_leftParticipantsAtIndex_(self, v55, n, v57);
        objc_msgSend_addLeftParticipants_(v82, v65, (uint64_t)v64, v66);
      }
    }
  }
  if (objc_msgSend_updatedParticipantsCount(self, v55, v56, v57))
  {
    objc_msgSend_clearUpdatedParticipants(v82, v67, v68, v69);
    uint64_t v73 = objc_msgSend_updatedParticipantsCount(self, v70, v71, v72);
    if (v73)
    {
      uint64_t v76 = v73;
      for (iuint64_t i = 0; ii != v76; ++ii)
      {
        v78 = objc_msgSend_updatedParticipantsAtIndex_(self, v74, ii, v75);
        objc_msgSend_addUpdatedParticipants_(v82, v79, (uint64_t)v78, v80);
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v82 + 7) = self->_txnId;
    *((unsigned char *)v82 + 104) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v82 + 16) = self->_generationCounter;
    *((unsigned char *)v82 + 104) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v13 = self->_peerPublishedStreams;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v75, v15, v82, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v76 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v75 + 1) + 8 * i), v17, (uint64_t)a3, v18);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v75, v18, v82, 16);
    }
    while (v19);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v25 = self->_joinedParticipants;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v71, v27, v81, 16);
  if (v28)
  {
    uint64_t v31 = v28;
    uint64_t v32 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v72 != v32) {
          objc_enumerationMutation(v25);
        }
        double v34 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v71 + 1) + 8 * j), v29, (uint64_t)a3, v30);
        objc_msgSend_addJoinedParticipants_((void *)v12, v35, (uint64_t)v34, v36);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v29, (uint64_t)&v71, v30, v81, 16);
    }
    while (v31);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v37 = self->_leftParticipants;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v67, v39, v80, 16);
  if (v40)
  {
    uint64_t v43 = v40;
    uint64_t v44 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v68 != v44) {
          objc_enumerationMutation(v37);
        }
        long long v46 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v67 + 1) + 8 * k), v41, (uint64_t)a3, v42);
        objc_msgSend_addLeftParticipants_((void *)v12, v47, (uint64_t)v46, v48);
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v41, (uint64_t)&v67, v42, v80, 16);
    }
    while (v43);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v49 = self->_updatedParticipants;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v63, v51, v79, 16);
  if (v52)
  {
    uint64_t v55 = v52;
    uint64_t v56 = *(void *)v64;
    do
    {
      for (uint64_t m = 0; m != v55; ++m)
      {
        if (*(void *)v64 != v56) {
          objc_enumerationMutation(v49);
        }
        long long v58 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v63 + 1) + 8 * m), v53, (uint64_t)a3, v54, (void)v63);
        objc_msgSend_addUpdatedParticipants_((void *)v12, v59, (uint64_t)v58, v60);
      }
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v53, (uint64_t)&v63, v54, v79, 16);
    }
    while (v55);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v12 + 56) = self->_txnId;
    *(unsigned char *)(v12 + 104) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 64) = self->_generationCounter;
    *(unsigned char *)(v12 + 104) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_21;
  }
  peerPublishedStreams = self->_peerPublishedStreams;
  uint64_t v11 = v4[11];
  if ((unint64_t)peerPublishedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v11, v9)) {
      goto LABEL_21;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_21;
  }
  joinedParticipants = self->_joinedParticipants;
  uint64_t v15 = v4[9];
  if ((unint64_t)joinedParticipants | v15)
  {
    if (!objc_msgSend_isEqual_(joinedParticipants, v12, v15, v13)) {
      goto LABEL_21;
    }
  }
  leftParticipants = self->_leftParticipants;
  uint64_t v17 = v4[10];
  if ((unint64_t)leftParticipants | v17)
  {
    if (!objc_msgSend_isEqual_(leftParticipants, v12, v17, v13)) {
      goto LABEL_21;
    }
  }
  updatedParticipants = self->_updatedParticipants;
  uint64_t v19 = v4[12];
  if ((unint64_t)updatedParticipants | v19)
  {
    if (!objc_msgSend_isEqual_(updatedParticipants, v12, v19, v13)) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[13] & 1) == 0 || self->_txnId != v4[7]) {
      goto LABEL_21;
    }
  }
  else if (v4[13])
  {
LABEL_21:
    BOOL v20 = 0;
    goto LABEL_22;
  }
  BOOL v20 = (v4[13] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[13] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 16)) {
      goto LABEL_21;
    }
    BOOL v20 = 1;
  }
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_peerPublishedStreams, a2, v2, v3);
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt64Hash();
  uint64_t v11 = objc_msgSend_hash(self->_joinedParticipants, v8, v9, v10);
  uint64_t v15 = objc_msgSend_hash(self->_leftParticipants, v12, v13, v14);
  uint64_t v19 = objc_msgSend_hash(self->_updatedParticipants, v16, v17, v18);
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v20 = 2654435761u * self->_txnId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    return v6 ^ v5 ^ v7 ^ v11 ^ v15 ^ v19 ^ v20 ^ v21;
  }
  unint64_t v20 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v21 = 2654435761 * self->_generationCounter;
  return v6 ^ v5 ^ v7 ^ v11 ^ v15 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v5 = *((id *)v4 + 11);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v74, v7, v81, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addPeerPublishedStreams_(self, v9, *(void *)(*((void *)&v74 + 1) + 8 * i), v10);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v74, v10, v81, 16);
    }
    while (v11);
  }

  uint64_t v17 = objc_msgSend_peerSubscribedStreamIdsCount(v4, v14, v15, v16);
  if (v17)
  {
    uint64_t v21 = v17;
    for (uint64_t j = 0; j != v21; ++j)
    {
      uint64_t v23 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v4, v18, j, v20);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v24, v23, v25);
    }
  }
  uint64_t v26 = objc_msgSend_lightweightParticipantIdListsCount(v4, v18, v19, v20);
  if (v26)
  {
    uint64_t v29 = v26;
    for (uint64_t k = 0; k != v29; ++k)
    {
      uint64_t v31 = objc_msgSend_lightweightParticipantIdListAtIndex_(v4, v27, k, v28);
      objc_msgSend_addLightweightParticipantIdList_(self, v32, v31, v33);
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v34 = *((id *)v4 + 9);
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v70, v36, v80, 16);
  if (v37)
  {
    uint64_t v40 = v37;
    uint64_t v41 = *(void *)v71;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v71 != v41) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend_addJoinedParticipants_(self, v38, *(void *)(*((void *)&v70 + 1) + 8 * m), v39);
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v38, (uint64_t)&v70, v39, v80, 16);
    }
    while (v40);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v43 = *((id *)v4 + 10);
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v66, v45, v79, 16);
  if (v46)
  {
    uint64_t v49 = v46;
    uint64_t v50 = *(void *)v67;
    do
    {
      for (uint64_t n = 0; n != v49; ++n)
      {
        if (*(void *)v67 != v50) {
          objc_enumerationMutation(v43);
        }
        objc_msgSend_addLeftParticipants_(self, v47, *(void *)(*((void *)&v66 + 1) + 8 * n), v48);
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v47, (uint64_t)&v66, v48, v79, 16);
    }
    while (v49);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v52 = *((id *)v4 + 12);
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v62, v54, v78, 16);
  if (v55)
  {
    uint64_t v58 = v55;
    uint64_t v59 = *(void *)v63;
    do
    {
      for (iuint64_t i = 0; ii != v58; ++ii)
      {
        if (*(void *)v63 != v59) {
          objc_enumerationMutation(v52);
        }
        objc_msgSend_addUpdatedParticipants_(self, v56, *(void *)(*((void *)&v62 + 1) + 8 * ii), v57, (void)v62);
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v62, v57, v78, 16);
    }
    while (v58);
  }

  char v61 = *((unsigned char *)v4 + 104);
  if (v61)
  {
    self->_txnId = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
    char v61 = *((unsigned char *)v4 + 104);
  }
  if ((v61 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v4 + 16);
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

- (NSMutableArray)joinedParticipants
{
  return self->_joinedParticipants;
}

- (void)setJoinedParticipants:(id)a3
{
}

- (NSMutableArray)leftParticipants
{
  return self->_leftParticipants;
}

- (void)setLeftParticipants:(id)a3
{
}

- (NSMutableArray)updatedParticipants
{
  return self->_updatedParticipants;
}

- (void)setUpdatedParticipants:(id)a3
{
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedParticipants, 0);
  objc_storeStrong((id *)&self->_peerPublishedStreams, 0);
  objc_storeStrong((id *)&self->_leftParticipants, 0);
  objc_storeStrong((id *)&self->_joinedParticipants, 0);
}

@end
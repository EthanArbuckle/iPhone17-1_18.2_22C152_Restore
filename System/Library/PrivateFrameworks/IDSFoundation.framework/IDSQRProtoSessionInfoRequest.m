@interface IDSQRProtoSessionInfoRequest
+ (Class)subscribedStreamsType;
- (BOOL)allWildcardSubscription;
- (BOOL)hasAllWildcardSubscription;
- (BOOL)hasCommandFlags;
- (BOOL)hasGenerationCounter;
- (BOOL)hasLinkId;
- (BOOL)hasMaxConcurrentStreams;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)subscribedStreams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscribedStreamsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)publishedStreamIdsCount;
- (unint64_t)subscribedStreamsCount;
- (unsigned)commandFlags;
- (unsigned)generationCounter;
- (unsigned)linkId;
- (unsigned)maxConcurrentStreams;
- (unsigned)publishedStreamIds;
- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3;
- (unsigned)requestId;
- (void)addPublishedStreamIds:(unsigned int)a3;
- (void)addSubscribedStreams:(id)a3;
- (void)clearPublishedStreamIds;
- (void)clearSubscribedStreams;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllWildcardSubscription:(BOOL)a3;
- (void)setCommandFlags:(unsigned int)a3;
- (void)setGenerationCounter:(unsigned int)a3;
- (void)setHasAllWildcardSubscription:(BOOL)a3;
- (void)setHasCommandFlags:(BOOL)a3;
- (void)setHasGenerationCounter:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMaxConcurrentStreams:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setLinkId:(unsigned int)a3;
- (void)setMaxConcurrentStreams:(unsigned int)a3;
- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRequestId:(unsigned int)a3;
- (void)setSubscribedStreams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSessionInfoRequest

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoRequest;
  [(IDSQRProtoSessionInfoRequest *)&v3 dealloc];
}

- (unint64_t)publishedStreamIdsCount
{
  return self->_publishedStreamIds.count;
}

- (unsigned)publishedStreamIds
{
  return self->_publishedStreamIds.list;
}

- (void)clearPublishedStreamIds
{
}

- (void)addPublishedStreamIds:(unsigned int)a3
{
}

- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3
{
  p_publishedStreamIds = &self->_publishedStreamIds;
  unint64_t count = self->_publishedStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_publishedStreamIds->list[a3];
}

- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearSubscribedStreams
{
  objc_msgSend_removeAllObjects(self->_subscribedStreams, a2, v2, v3);
}

- (void)addSubscribedStreams:(id)a3
{
  v4 = (const char *)a3;
  subscribedStreams = self->_subscribedStreams;
  v9 = (char *)v4;
  if (!subscribedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_subscribedStreams;
    self->_subscribedStreams = v7;

    v4 = v9;
    subscribedStreams = self->_subscribedStreams;
  }
  objc_msgSend_addObject_(subscribedStreams, v4, (uint64_t)v4, v5);
}

- (unint64_t)subscribedStreamsCount
{
  return objc_msgSend_count(self->_subscribedStreams, a2, v2, v3);
}

- (id)subscribedStreamsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_subscribedStreams, a2, a3, v3);
}

+ (Class)subscribedStreamsType
{
  return (Class)objc_opt_class();
}

- (void)setAllWildcardSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_allWildcardSubscription = a3;
}

- (void)setHasAllWildcardSubscription:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAllWildcardSubscription
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMaxConcurrentStreams:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_maxConcurrentStreams = a3;
}

- (void)setHasMaxConcurrentStreams:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxConcurrentStreams
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLinkId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_linkId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRequestId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_requestId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRequestId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
  v13.super_class = (Class)IDSQRProtoSessionInfoRequest;
  v4 = [(IDSQRProtoSessionInfoRequest *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v6 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, v8, @"published_stream_ids");

  if (objc_msgSend_count(self->_subscribedStreams, v9, v10, v11))
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v18 = objc_msgSend_count(self->_subscribedStreams, v15, v16, v17);
    v21 = objc_msgSend_initWithCapacity_(v14, v19, v18, v20);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v22 = self->_subscribedStreams;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v57, v24, v61, 16);
    if (v25)
    {
      uint64_t v29 = v25;
      uint64_t v30 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v22);
          }
          v32 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v57 + 1) + 8 * i), v26, v27, v28, (void)v57);
          objc_msgSend_addObject_(v21, v33, (uint64_t)v32, v34);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v26, (uint64_t)&v57, v28, v61, 16);
      }
      while (v29);
    }

    objc_msgSend_setObject_forKey_(v5, v35, (uint64_t)v21, v36, @"subscribed_streams");
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v42 = objc_msgSend_numberWithBool_(NSNumber, v12, self->_allWildcardSubscription, v13);
    objc_msgSend_setObject_forKey_(v5, v43, (uint64_t)v42, v44, @"all_wildcard_subscription");

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  v45 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, self->_maxConcurrentStreams, v13, (void)v57);
  objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v45, v47, @"max_concurrent_streams");

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  v48 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, self->_linkId, v13, (void)v57);
  objc_msgSend_setObject_forKey_(v5, v49, (uint64_t)v48, v50, @"link_id");

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, self->_requestId, v13, (void)v57);
  objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, @"request_id");

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_24:
  v54 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, self->_commandFlags, v13, (void)v57);
  objc_msgSend_setObject_forKey_(v5, v55, (uint64_t)v54, v56, @"command_flags");

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_16:
    v38 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, self->_generationCounter, v13, (void)v57);
    objc_msgSend_setObject_forKey_(v5, v39, (uint64_t)v38, v40, @"generation_counter");
  }
LABEL_17:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_publishedStreamIds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_publishedStreamIds.count);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_subscribedStreams;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v8, v20, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v16, v14, v20, 16);
    }
    while (v10);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 1) == 0) {
      goto LABEL_16;
    }
LABEL_23:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_23;
  }
LABEL_16:
  if ((has & 2) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  id v34 = a3;
  if (objc_msgSend_publishedStreamIdsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPublishedStreamIds(v34, v7, v8, v9);
    uint64_t v13 = objc_msgSend_publishedStreamIdsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_publishedStreamIdsAtIndex_(self, v7, i, v9);
        objc_msgSend_addPublishedStreamIds_(v34, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_subscribedStreamsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearSubscribedStreams(v34, v19, v20, v21);
    uint64_t v25 = objc_msgSend_subscribedStreamsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v28 = v25;
      for (uint64_t j = 0; j != v28; ++j)
      {
        uint64_t v30 = objc_msgSend_subscribedStreamsAtIndex_(self, v26, j, v27);
        objc_msgSend_addSubscribedStreams_(v34, v31, (uint64_t)v30, v32);
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v34 + 64) = self->_allWildcardSubscription;
    *((unsigned char *)v34 + 68) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v34 + 11) = self->_maxConcurrentStreams;
  *((unsigned char *)v34 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v34 + 10) = self->_linkId;
  *((unsigned char *)v34 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v34 + 12) = self->_requestId;
  *((unsigned char *)v34 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  *((_DWORD *)v34 + 8) = self->_commandFlags;
  *((unsigned char *)v34 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_15:
    *((_DWORD *)v34 + 9) = self->_generationCounter;
    *((unsigned char *)v34 + 68) |= 2u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  PBRepeatedUInt32Copy();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = self->_subscribedStreams;
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
        v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, v18, (void)v27);
        objc_msgSend_addSubscribedStreams_((void *)v12, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v27, v18, v31, 16);
    }
    while (v19);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v12 + 64) = self->_allWildcardSubscription;
    *(unsigned char *)(v12 + 68) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v12 + 44) = self->_maxConcurrentStreams;
  *(unsigned char *)(v12 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v12 + 40) = self->_linkId;
  *(unsigned char *)(v12 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
LABEL_20:
    *(_DWORD *)(v12 + 32) = self->_commandFlags;
    *(unsigned char *)(v12 + 68) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v12;
    }
    goto LABEL_14;
  }
LABEL_19:
  *(_DWORD *)(v12 + 48) = self->_requestId;
  *(unsigned char *)(v12 + 68) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_20;
  }
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *(_DWORD *)(v12 + 36) = self->_generationCounter;
    *(unsigned char *)(v12 + 68) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_37;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_37;
  }
  subscribedStreams = self->_subscribedStreams;
  uint64_t v11 = v4[7];
  if ((unint64_t)subscribedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(subscribedStreams, v8, v11, v9)) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
    {
      if (self->_allWildcardSubscription)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_37;
        }
        goto LABEL_13;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_13;
      }
    }
LABEL_37:
    BOOL v12 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 68) & 0x20) != 0) {
    goto LABEL_37;
  }
LABEL_13:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_maxConcurrentStreams != *((_DWORD *)v4 + 11)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_linkId != *((_DWORD *)v4 + 10)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_requestId != *((_DWORD *)v4 + 12)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_commandFlags != *((_DWORD *)v4 + 8)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_37;
  }
  BOOL v12 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 9)) {
      goto LABEL_37;
    }
    BOOL v12 = 1;
  }
LABEL_38:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v7 = objc_msgSend_hash(self->_subscribedStreams, v4, v5, v6);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v8 = 2654435761 * self->_allWildcardSubscription;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v9 = 2654435761 * self->_maxConcurrentStreams;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v10 = 2654435761 * self->_linkId;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v11 = 2654435761 * self->_requestId;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v13 = 0;
    return v7 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_11:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v12 = 2654435761 * self->_commandFlags;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v13 = 2654435761 * self->_generationCounter;
  return v7 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_publishedStreamIdsCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_publishedStreamIdsAtIndex_(v4, v9, i, v10);
      objc_msgSend_addPublishedStreamIds_(self, v14, v13, v15);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = *((id *)v4 + 7);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v26, v18, v30, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addSubscribedStreams_(self, v20, *(void *)(*((void *)&v26 + 1) + 8 * j), v21, (void)v26);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v20, (uint64_t)&v26, v21, v30, 16);
    }
    while (v22);
  }

  char v25 = *((unsigned char *)v4 + 68);
  if ((v25 & 0x20) != 0)
  {
    self->_allWildcardSubscription = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 0x20u;
    char v25 = *((unsigned char *)v4 + 68);
    if ((v25 & 8) == 0)
    {
LABEL_13:
      if ((v25 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_maxConcurrentStreams = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 8u;
  char v25 = *((unsigned char *)v4 + 68);
  if ((v25 & 4) == 0)
  {
LABEL_14:
    if ((v25 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_linkId = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v25 = *((unsigned char *)v4 + 68);
  if ((v25 & 0x10) == 0)
  {
LABEL_15:
    if ((v25 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_23:
    self->_commandFlags = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    if ((*((unsigned char *)v4 + 68) & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_22:
  self->_requestId = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  char v25 = *((unsigned char *)v4 + 68);
  if (v25) {
    goto LABEL_23;
  }
LABEL_16:
  if ((v25 & 2) != 0)
  {
LABEL_17:
    self->_generationCounter = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_18:
}

- (NSMutableArray)subscribedStreams
{
  return self->_subscribedStreams;
}

- (void)setSubscribedStreams:(id)a3
{
}

- (BOOL)allWildcardSubscription
{
  return self->_allWildcardSubscription;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (unsigned)linkId
{
  return self->_linkId;
}

- (unsigned)requestId
{
  return self->_requestId;
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
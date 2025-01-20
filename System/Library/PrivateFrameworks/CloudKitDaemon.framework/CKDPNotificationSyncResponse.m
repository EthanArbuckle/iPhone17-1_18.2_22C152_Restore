@interface CKDPNotificationSyncResponse
+ (Class)pushMessageType;
- (BOOL)hasChangeID;
- (BOOL)hasMoreAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreAvailable;
- (BOOL)readFrom:(id)a3;
- (NSData)changeID;
- (NSMutableArray)pushMessages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pushMessageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pushMessagesCount;
- (void)addPushMessage:(id)a3;
- (void)clearPushMessages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeID:(id)a3;
- (void)setHasMoreAvailable:(BOOL)a3;
- (void)setMoreAvailable:(BOOL)a3;
- (void)setPushMessages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPNotificationSyncResponse

- (BOOL)hasChangeID
{
  return self->_changeID != 0;
}

- (void)clearPushMessages
{
  objc_msgSend_removeAllObjects(self->_pushMessages, a2, v2);
}

- (void)addPushMessage:(id)a3
{
  v4 = (const char *)a3;
  pushMessages = self->_pushMessages;
  v8 = (char *)v4;
  if (!pushMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pushMessages;
    self->_pushMessages = v6;

    v4 = v8;
    pushMessages = self->_pushMessages;
  }
  objc_msgSend_addObject_(pushMessages, v4, (uint64_t)v4);
}

- (unint64_t)pushMessagesCount
{
  return objc_msgSend_count(self->_pushMessages, a2, v2);
}

- (id)pushMessageAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_pushMessages, a2, a3);
}

+ (Class)pushMessageType
{
  return (Class)objc_opt_class();
}

- (void)setMoreAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_moreAvailable = a3;
}

- (void)setHasMoreAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMoreAvailable
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationSyncResponse;
  v4 = [(CKDPNotificationSyncResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  changeID = self->_changeID;
  if (changeID) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)changeID, @"changeID");
  }
  if (objc_msgSend_count(self->_pushMessages, v5, (uint64_t)changeID))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_pushMessages, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v15 = self->_pushMessages;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v29, v33, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v29 + 1) + 8 * i), v18, v19, (void)v29);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v29, v33, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v14, @"pushMessage");
  }
  if (*(unsigned char *)&self->_has)
  {
    v26 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v8, self->_moreAvailable);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"moreAvailable");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPNotificationSyncResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_changeID) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_pushMessages;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v16 = a3;
  changeID = self->_changeID;
  if (changeID) {
    objc_msgSend_setChangeID_(v16, v4, (uint64_t)changeID);
  }
  if (objc_msgSend_pushMessagesCount(self, v4, (uint64_t)changeID))
  {
    objc_msgSend_clearPushMessages(v16, v6, v7);
    uint64_t v10 = objc_msgSend_pushMessagesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_pushMessageAtIndex_(self, v11, i);
        objc_msgSend_addPushMessage_(v16, v15, (uint64_t)v14);
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v16[24] = self->_moreAvailable;
    v16[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_changeID, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_pushMessages;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addPushMessage_((void *)v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 24) = self->_moreAvailable;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  changeID = self->_changeID;
  uint64_t v9 = v4[1];
  if ((unint64_t)changeID | v9)
  {
    if (!objc_msgSend_isEqual_(changeID, v7, v9)) {
      goto LABEL_8;
    }
  }
  pushMessages = self->_pushMessages;
  uint64_t v11 = v4[2];
  if ((unint64_t)pushMessages | v11)
  {
    if (!objc_msgSend_isEqual_(pushMessages, v7, v11)) {
      goto LABEL_8;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v12 = 0;
      goto LABEL_9;
    }
    if (self->_moreAvailable)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v12 = 1;
  }
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_changeID, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_pushMessages, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_moreAvailable;
  }
  else {
    uint64_t v8 = 0;
  }
  return v7 ^ v4 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 1);
  if (v6) {
    objc_msgSend_setChangeID_(self, v4, v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v5 + 2);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_addPushMessage_(self, v10, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }

  if (*((unsigned char *)v5 + 28))
  {
    self->_moreAvailable = *((unsigned char *)v5 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
}

- (NSMutableArray)pushMessages
{
  return self->_pushMessages;
}

- (void)setPushMessages:(id)a3
{
}

- (BOOL)moreAvailable
{
  return self->_moreAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMessages, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
}

@end
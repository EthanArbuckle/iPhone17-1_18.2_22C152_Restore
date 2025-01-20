@interface CKDPZoneRetrieveChangesResponse
+ (Class)changedZonesType;
- (BOOL)hasStatus;
- (BOOL)hasSyncContinuationToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)syncContinuationToken;
- (NSMutableArray)changedZones;
- (id)changedZonesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)changedZonesCount;
- (unint64_t)hash;
- (void)addChangedZones:(id)a3;
- (void)clearChangedZones;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangedZones:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setSyncContinuationToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveChangesResponse

- (void)clearChangedZones
{
  objc_msgSend_removeAllObjects(self->_changedZones, a2, v2);
}

- (void)addChangedZones:(id)a3
{
  v4 = (const char *)a3;
  changedZones = self->_changedZones;
  v8 = (char *)v4;
  if (!changedZones)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_changedZones;
    self->_changedZones = v6;

    v4 = v8;
    changedZones = self->_changedZones;
  }
  objc_msgSend_addObject_(changedZones, v4, (uint64_t)v4);
}

- (unint64_t)changedZonesCount
{
  return objc_msgSend_count(self->_changedZones, a2, v2);
}

- (id)changedZonesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedZones, a2, a3);
}

+ (Class)changedZonesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 1;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"hasPendingChanges";
  }
  else if (a3 == 2)
  {
    v4 = @"syncComplete";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"hasPendingChanges") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"syncComplete")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveChangesResponse;
  v4 = [(CKDPZoneRetrieveChangesResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_changedZones, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_changedZones, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v14 = self->_changedZones;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, v34, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v30 + 1) + 8 * i), v17, v18);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, v34, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"changedZones");
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken) {
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)syncContinuationToken, @"syncContinuationToken");
  }
  if (*(unsigned char *)&self->_has)
  {
    int status = self->_status;
    if (status == 1)
    {
      v27 = @"hasPendingChanges";
      objc_msgSend_setObject_forKey_(v4, v7, @"hasPendingChanges", @"status");
    }
    else if (status == 2)
    {
      v27 = @"syncComplete";
      objc_msgSend_setObject_forKey_(v4, v7, @"syncComplete", @"status");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v7, @"(unknown: %i)", self->_status);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v4, v28, (uint64_t)v27, @"status");
    }
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5025140((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_changedZones;
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

  if (self->_syncContinuationToken) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (objc_msgSend_changedZonesCount(self, v4, v5))
  {
    objc_msgSend_clearChangedZones(v16, v6, v7);
    uint64_t v10 = objc_msgSend_changedZonesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        long long v13 = objc_msgSend_changedZonesAtIndex_(self, v6, i);
        objc_msgSend_addChangedZones_(v16, v14, (uint64_t)v13);
      }
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken) {
    objc_msgSend_setSyncContinuationToken_(v16, v6, (uint64_t)syncContinuationToken);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v16 + 4) = self->_status;
    *((unsigned char *)v16 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = self->_changedZones;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v24, v28, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * i), v14, (uint64_t)a3, (void)v24);
        objc_msgSend_addChangedZones_((void *)v10, v19, (uint64_t)v18);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v21;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_status;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_10;
  }
  changedZones = self->_changedZones;
  uint64_t v9 = v4[1];
  if ((unint64_t)changedZones | v9)
  {
    if (!objc_msgSend_isEqual_(changedZones, v7, v9)) {
      goto LABEL_10;
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  uint64_t v11 = v4[3];
  if ((unint64_t)syncContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v11)) {
      goto LABEL_10;
    }
  }
  BOOL v12 = (v4[4] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) != 0 && self->_status == *((_DWORD *)v4 + 4))
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
  uint64_t v4 = objc_msgSend_hash(self->_changedZones, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_syncContinuationToken, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_status;
  }
  else {
    uint64_t v8 = 0;
  }
  return v7 ^ v4 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v18, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addChangedZones_(self, v8, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v18, 16);
    }
    while (v9);
  }

  uint64_t v13 = *((void *)v4 + 3);
  if (v13) {
    objc_msgSend_setSyncContinuationToken_(self, v12, v13);
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_int status = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)changedZones
{
  return self->_changedZones;
}

- (void)setChangedZones:(id)a3
{
}

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (void)setSyncContinuationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_changedZones, 0);
}

@end
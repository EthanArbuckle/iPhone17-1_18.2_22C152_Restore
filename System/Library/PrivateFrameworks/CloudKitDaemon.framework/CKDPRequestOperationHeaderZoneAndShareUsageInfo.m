@interface CKDPRequestOperationHeaderZoneAndShareUsageInfo
+ (Class)shareUsageType;
+ (Class)zoneUsageType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)shareUsages;
- (NSMutableArray)zoneUsages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)shareUsageAtIndex:(unint64_t)a3;
- (id)zoneUsageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)shareUsagesCount;
- (unint64_t)zoneUsagesCount;
- (void)addShareUsage:(id)a3;
- (void)addZoneUsage:(id)a3;
- (void)clearShareUsages;
- (void)clearZoneUsages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setShareUsages:(id)a3;
- (void)setZoneUsages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRequestOperationHeaderZoneAndShareUsageInfo

- (void)clearZoneUsages
{
  objc_msgSend_removeAllObjects(self->_zoneUsages, a2, v2);
}

- (void)addZoneUsage:(id)a3
{
  v4 = (const char *)a3;
  zoneUsages = self->_zoneUsages;
  v8 = (char *)v4;
  if (!zoneUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneUsages;
    self->_zoneUsages = v6;

    v4 = v8;
    zoneUsages = self->_zoneUsages;
  }
  objc_msgSend_addObject_(zoneUsages, v4, (uint64_t)v4);
}

- (unint64_t)zoneUsagesCount
{
  return objc_msgSend_count(self->_zoneUsages, a2, v2);
}

- (id)zoneUsageAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneUsages, a2, a3);
}

+ (Class)zoneUsageType
{
  return (Class)objc_opt_class();
}

- (void)clearShareUsages
{
  objc_msgSend_removeAllObjects(self->_shareUsages, a2, v2);
}

- (void)addShareUsage:(id)a3
{
  v4 = (const char *)a3;
  shareUsages = self->_shareUsages;
  v8 = (char *)v4;
  if (!shareUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shareUsages;
    self->_shareUsages = v6;

    v4 = v8;
    shareUsages = self->_shareUsages;
  }
  objc_msgSend_addObject_(shareUsages, v4, (uint64_t)v4);
}

- (unint64_t)shareUsagesCount
{
  return objc_msgSend_count(self->_shareUsages, a2, v2);
}

- (id)shareUsageAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_shareUsages, a2, a3);
}

+ (Class)shareUsageType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestOperationHeaderZoneAndShareUsageInfo;
  v4 = [(CKDPRequestOperationHeaderZoneAndShareUsageInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_zoneUsages, v5, v6))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_zoneUsages, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v15 = self->_zoneUsages;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v48, v53, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v48 + 1) + 8 * i), v18, v19);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v48, v53, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v14, @"zoneUsage");
  }
  if (objc_msgSend_count(self->_shareUsages, v7, v8))
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v29 = objc_msgSend_count(self->_shareUsages, v27, v28);
    v31 = objc_msgSend_initWithCapacity_(v26, v30, v29);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v32 = self->_shareUsages;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v44, v52, 16);
    if (v34)
    {
      uint64_t v37 = v34;
      uint64_t v38 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v45 != v38) {
            objc_enumerationMutation(v32);
          }
          v40 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v44 + 1) + 8 * j), v35, v36, (void)v44);
          objc_msgSend_addObject_(v31, v41, (uint64_t)v40);
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v44, v52, 16);
      }
      while (v37);
    }

    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v31, @"shareUsage");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestOperationHeaderZoneAndShareUsageInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_zoneUsages;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_shareUsages;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  if (objc_msgSend_zoneUsagesCount(self, v4, v5))
  {
    objc_msgSend_clearZoneUsages(v25, v6, v7);
    uint64_t v10 = objc_msgSend_zoneUsagesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_zoneUsageAtIndex_(self, v6, i);
        objc_msgSend_addZoneUsage_(v25, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_shareUsagesCount(self, v6, v7))
  {
    objc_msgSend_clearShareUsages(v25, v15, v16);
    uint64_t v19 = objc_msgSend_shareUsagesCount(self, v17, v18);
    if (v19)
    {
      uint64_t v21 = v19;
      for (uint64_t j = 0; j != v21; ++j)
      {
        long long v23 = objc_msgSend_shareUsageAtIndex_(self, v20, j);
        objc_msgSend_addShareUsage_(v25, v24, (uint64_t)v23);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = self->_zoneUsages;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v34, v39, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v34 + 1) + 8 * v17), v14, (uint64_t)a3);
        objc_msgSend_addZoneUsage_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v34, v39, 16);
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v20 = self->_shareUsages;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v38, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v20);
        }
        v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (void)v30);
        objc_msgSend_addShareUsage_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v38, 16);
    }
    while (v24);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((zoneUsages = self->_zoneUsages, uint64_t v9 = v4[2], !((unint64_t)zoneUsages | v9))
     || objc_msgSend_isEqual_(zoneUsages, v7, v9)))
  {
    shareUsages = self->_shareUsages;
    uint64_t v11 = v4[1];
    if ((unint64_t)shareUsages | v11) {
      char isEqual = objc_msgSend_isEqual_(shareUsages, v7, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneUsages, a2, v2);
  return objc_msgSend_hash(self->_shareUsages, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4[2];
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addZoneUsage_(self, v8, *(void *)(*((void *)&v23 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v23, v28, 16);
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v4[1];
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addShareUsage_(self, v15, *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v19, v27, 16);
    }
    while (v16);
  }
}

- (NSMutableArray)zoneUsages
{
  return self->_zoneUsages;
}

- (void)setZoneUsages:(id)a3
{
}

- (NSMutableArray)shareUsages
{
  return self->_shareUsages;
}

- (void)setShareUsages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUsages, 0);
  objc_storeStrong((id *)&self->_shareUsages, 0);
}

@end
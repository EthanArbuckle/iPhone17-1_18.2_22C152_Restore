@interface CKDPZoneRetrieveResponse
+ (Class)anonymousZoneInfoType;
+ (Class)zoneSummaryType;
- (BOOL)hasContinuationMarker;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)continuationMarker;
- (NSMutableArray)anonymousZoneInfos;
- (NSMutableArray)zoneSummarys;
- (id)anonymousZoneInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)zoneSummaryAtIndex:(unint64_t)a3;
- (unint64_t)anonymousZoneInfosCount;
- (unint64_t)hash;
- (unint64_t)zoneSummarysCount;
- (void)addAnonymousZoneInfo:(id)a3;
- (void)addZoneSummary:(id)a3;
- (void)clearAnonymousZoneInfos;
- (void)clearZoneSummarys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousZoneInfos:(id)a3;
- (void)setContinuationMarker:(id)a3;
- (void)setZoneSummarys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveResponse

- (void)clearZoneSummarys
{
  objc_msgSend_removeAllObjects(self->_zoneSummarys, a2, v2);
}

- (void)addZoneSummary:(id)a3
{
  v4 = (const char *)a3;
  zoneSummarys = self->_zoneSummarys;
  v8 = (char *)v4;
  if (!zoneSummarys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneSummarys;
    self->_zoneSummarys = v6;

    v4 = v8;
    zoneSummarys = self->_zoneSummarys;
  }
  objc_msgSend_addObject_(zoneSummarys, v4, (uint64_t)v4);
}

- (unint64_t)zoneSummarysCount
{
  return objc_msgSend_count(self->_zoneSummarys, a2, v2);
}

- (id)zoneSummaryAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneSummarys, a2, a3);
}

+ (Class)zoneSummaryType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
}

- (void)clearAnonymousZoneInfos
{
  objc_msgSend_removeAllObjects(self->_anonymousZoneInfos, a2, v2);
}

- (void)addAnonymousZoneInfo:(id)a3
{
  v4 = (const char *)a3;
  anonymousZoneInfos = self->_anonymousZoneInfos;
  v8 = (char *)v4;
  if (!anonymousZoneInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_anonymousZoneInfos;
    self->_anonymousZoneInfos = v6;

    v4 = v8;
    anonymousZoneInfos = self->_anonymousZoneInfos;
  }
  objc_msgSend_addObject_(anonymousZoneInfos, v4, (uint64_t)v4);
}

- (unint64_t)anonymousZoneInfosCount
{
  return objc_msgSend_count(self->_anonymousZoneInfos, a2, v2);
}

- (id)anonymousZoneInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_anonymousZoneInfos, a2, a3);
}

+ (Class)anonymousZoneInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveResponse;
  v4 = [(CKDPZoneRetrieveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_zoneSummarys, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_zoneSummarys, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v14 = self->_zoneSummarys;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v48, v53, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v48 + 1) + 8 * i), v17, v18);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v48, v53, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"zoneSummary");
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)continuationMarker, @"continuationMarker");
  }
  if (objc_msgSend_count(self->_anonymousZoneInfos, v7, (uint64_t)continuationMarker))
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v29 = objc_msgSend_count(self->_anonymousZoneInfos, v27, v28);
    v31 = objc_msgSend_initWithCapacity_(v26, v30, v29);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v32 = self->_anonymousZoneInfos;
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

    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v31, @"anonymousZoneInfo");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F407E0(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_zoneSummarys;
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

  if (self->_continuationMarker) {
    PBDataWriterWriteDataField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_anonymousZoneInfos;
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
  id v26 = a3;
  if (objc_msgSend_zoneSummarysCount(self, v4, v5))
  {
    objc_msgSend_clearZoneSummarys(v26, v6, v7);
    uint64_t v10 = objc_msgSend_zoneSummarysCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_zoneSummaryAtIndex_(self, v6, i);
        objc_msgSend_addZoneSummary_(v26, v14, (uint64_t)v13);
      }
    }
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setContinuationMarker_(v26, v6, (uint64_t)continuationMarker);
  }
  if (objc_msgSend_anonymousZoneInfosCount(self, v6, (uint64_t)continuationMarker))
  {
    objc_msgSend_clearAnonymousZoneInfos(v26, v16, v17);
    uint64_t v20 = objc_msgSend_anonymousZoneInfosCount(self, v18, v19);
    if (v20)
    {
      uint64_t v22 = v20;
      for (uint64_t j = 0; j != v22; ++j)
      {
        long long v24 = objc_msgSend_anonymousZoneInfoAtIndex_(self, v21, j);
        objc_msgSend_addAnonymousZoneInfo_(v26, v25, (uint64_t)v24);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v11 = self->_zoneSummarys;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v37, v42, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v38;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v37 + 1) + 8 * v17), v14, (uint64_t)a3);
        objc_msgSend_addZoneSummary_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v37, v42, 16);
    }
    while (v15);
  }

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_continuationMarker, v20, (uint64_t)a3);
  uint64_t v22 = (void *)v10[2];
  v10[2] = v21;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v23 = self->_anonymousZoneInfos;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v41, 16);
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v34;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v23);
        }
        v30 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v33 + 1) + 8 * v29), v26, (uint64_t)a3, (void)v33);
        objc_msgSend_addAnonymousZoneInfo_(v10, v31, (uint64_t)v30);

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v33, v41, 16);
    }
    while (v27);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((zoneSummarys = self->_zoneSummarys, uint64_t v9 = v4[3], !((unint64_t)zoneSummarys | v9))
     || objc_msgSend_isEqual_(zoneSummarys, v7, v9))
    && ((continuationMarker = self->_continuationMarker, uint64_t v11 = v4[2], !((unint64_t)continuationMarker | v11))
     || objc_msgSend_isEqual_(continuationMarker, v7, v11)))
  {
    anonymousZoneInfos = self->_anonymousZoneInfos;
    uint64_t v13 = v4[1];
    if ((unint64_t)anonymousZoneInfos | v13) {
      char isEqual = objc_msgSend_isEqual_(anonymousZoneInfos, v7, v13);
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
  uint64_t v4 = objc_msgSend_hash(self->_zoneSummarys, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_continuationMarker, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_anonymousZoneInfos, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, v30, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addZoneSummary_(self, v8, *(void *)(*((void *)&v25 + 1) + 8 * i));
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, v30, 16);
    }
    while (v9);
  }

  uint64_t v13 = *((void *)v4 + 2);
  if (v13) {
    objc_msgSend_setContinuationMarker_(self, v12, v13);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = *((id *)v4 + 1);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v29, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_addAnonymousZoneInfo_(self, v17, *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v21, v29, 16);
    }
    while (v18);
  }
}

- (NSMutableArray)zoneSummarys
{
  return self->_zoneSummarys;
}

- (void)setZoneSummarys:(id)a3
{
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
}

- (NSMutableArray)anonymousZoneInfos
{
  return self->_anonymousZoneInfos;
}

- (void)setAnonymousZoneInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSummarys, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfos, 0);
}

@end
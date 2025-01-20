@interface CKDPDistributedTimestamps
+ (Class)siteIdentifiersType;
+ (Class)siteVersionVectorsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)siteIdentifiers;
- (NSMutableArray)siteVersionVectors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)siteIdentifiersAtIndex:(unint64_t)a3;
- (id)siteVersionVectorsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)siteIdentifiersCount;
- (unint64_t)siteVersionVectorsCount;
- (void)addSiteIdentifiers:(id)a3;
- (void)addSiteVersionVectors:(id)a3;
- (void)clearSiteIdentifiers;
- (void)clearSiteVersionVectors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSiteIdentifiers:(id)a3;
- (void)setSiteVersionVectors:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDistributedTimestamps

- (void)clearSiteIdentifiers
{
  objc_msgSend_removeAllObjects(self->_siteIdentifiers, a2, v2, v3);
}

- (void)addSiteIdentifiers:(id)a3
{
  v4 = (const char *)a3;
  siteIdentifiers = self->_siteIdentifiers;
  v9 = (char *)v4;
  if (!siteIdentifiers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_siteIdentifiers;
    self->_siteIdentifiers = v7;

    v4 = v9;
    siteIdentifiers = self->_siteIdentifiers;
  }
  objc_msgSend_addObject_(siteIdentifiers, v4, (uint64_t)v4, v5);
}

- (unint64_t)siteIdentifiersCount
{
  return objc_msgSend_count(self->_siteIdentifiers, a2, v2, v3);
}

- (id)siteIdentifiersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_siteIdentifiers, a2, a3, v3);
}

+ (Class)siteIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSiteVersionVectors
{
  objc_msgSend_removeAllObjects(self->_siteVersionVectors, a2, v2, v3);
}

- (void)addSiteVersionVectors:(id)a3
{
  v4 = (const char *)a3;
  siteVersionVectors = self->_siteVersionVectors;
  v9 = (char *)v4;
  if (!siteVersionVectors)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_siteVersionVectors;
    self->_siteVersionVectors = v7;

    v4 = v9;
    siteVersionVectors = self->_siteVersionVectors;
  }
  objc_msgSend_addObject_(siteVersionVectors, v4, (uint64_t)v4, v5);
}

- (unint64_t)siteVersionVectorsCount
{
  return objc_msgSend_count(self->_siteVersionVectors, a2, v2, v3);
}

- (id)siteVersionVectorsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_siteVersionVectors, a2, a3, v3);
}

+ (Class)siteVersionVectorsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPDistributedTimestamps;
  v4 = [(CKDPDistributedTimestamps *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (objc_msgSend_count(self->_siteIdentifiers, v6, v7, v8))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_siteIdentifiers, v13, v14, v15);
    v19 = objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v20 = self->_siteIdentifiers;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v59, (uint64_t)v64, 16);
    if (v22)
    {
      uint64_t v26 = v22;
      uint64_t v27 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v20);
          }
          v29 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v59 + 1) + 8 * i), v23, v24, v25);
          objc_msgSend_addObject_(v19, v30, (uint64_t)v29, v31);
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v59, (uint64_t)v64, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v5, v32, (uint64_t)v19, @"siteIdentifiers");
  }
  if (objc_msgSend_count(self->_siteVersionVectors, v9, v10, v11))
  {
    id v33 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v37 = objc_msgSend_count(self->_siteVersionVectors, v34, v35, v36);
    v40 = objc_msgSend_initWithCapacity_(v33, v38, v37, v39);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v41 = self->_siteVersionVectors;
    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v55, (uint64_t)v63, 16);
    if (v43)
    {
      uint64_t v47 = v43;
      uint64_t v48 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v56 != v48) {
            objc_enumerationMutation(v41);
          }
          v50 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v55 + 1) + 8 * j), v44, v45, v46, (void)v55);
          objc_msgSend_addObject_(v40, v51, (uint64_t)v50, v52);
        }
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v55, (uint64_t)v63, 16);
      }
      while (v47);
    }

    objc_msgSend_setObject_forKey_(v5, v53, (uint64_t)v40, @"siteVersionVectors");
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = self->_siteIdentifiers;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, (uint64_t)v28, 16);
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
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, (uint64_t)v28, 16);
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_siteVersionVectors;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, (uint64_t)v27, 16);
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
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, (uint64_t)v27, 16);
    }
    while (v15);
  }
}

- (void)copyTo:(id)a3
{
  id v33 = a3;
  if (objc_msgSend_siteIdentifiersCount(self, v4, v5, v6))
  {
    objc_msgSend_clearSiteIdentifiers(v33, v7, v8, v9);
    uint64_t v13 = objc_msgSend_siteIdentifiersCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_siteIdentifiersAtIndex_(self, v7, i, v9);
        objc_msgSend_addSiteIdentifiers_(v33, v17, (uint64_t)v16, v18);
      }
    }
  }
  if (objc_msgSend_siteVersionVectorsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearSiteVersionVectors(v33, v19, v20, v21);
    uint64_t v25 = objc_msgSend_siteVersionVectorsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v28 = v25;
      for (uint64_t j = 0; j != v28; ++j)
      {
        v30 = objc_msgSend_siteVersionVectorsAtIndex_(self, v26, j, v27);
        objc_msgSend_addSiteVersionVectors_(v33, v31, (uint64_t)v30, v32);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = self->_siteIdentifiers;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, (uint64_t)v45, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v41;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * v20), v16, (uint64_t)a3, v17);
        objc_msgSend_addSiteIdentifiers_(v12, v22, (uint64_t)v21, v23);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v40, (uint64_t)v45, 16);
    }
    while (v18);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = self->_siteVersionVectors;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v26)
  {
    uint64_t v29 = v26;
    uint64_t v30 = *(void *)v37;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v24);
        }
        uint64_t v32 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v36 + 1) + 8 * v31), v27, (uint64_t)a3, v28, (void)v36);
        objc_msgSend_addSiteVersionVectors_(v12, v33, (uint64_t)v32, v34);

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v29);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((siteIdentifiers = self->_siteIdentifiers, uint64_t v11 = v4[1], !((unint64_t)siteIdentifiers | v11))
     || objc_msgSend_isEqual_(siteIdentifiers, v8, v11, v9)))
  {
    siteVersionVectors = self->_siteVersionVectors;
    uint64_t v13 = v4[2];
    if ((unint64_t)siteVersionVectors | v13) {
      char isEqual = objc_msgSend_isEqual_(siteVersionVectors, v8, v13, v9);
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
  uint64_t v5 = objc_msgSend_hash(self->_siteIdentifiers, a2, v2, v3);
  return objc_msgSend_hash(self->_siteVersionVectors, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4[1];
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v30, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addSiteIdentifiers_(self, v8, *(void *)(*((void *)&v25 + 1) + 8 * v12++), v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v30, 16);
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v4[2];
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v21, (uint64_t)v29, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addSiteVersionVectors_(self, v16, *(void *)(*((void *)&v21 + 1) + 8 * v20++), v17, (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v21, (uint64_t)v29, 16);
    }
    while (v18);
  }
}

- (NSMutableArray)siteIdentifiers
{
  return self->_siteIdentifiers;
}

- (void)setSiteIdentifiers:(id)a3
{
}

- (NSMutableArray)siteVersionVectors
{
  return self->_siteVersionVectors;
}

- (void)setSiteVersionVectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteVersionVectors, 0);

  objc_storeStrong((id *)&self->_siteIdentifiers, 0);
}

@end
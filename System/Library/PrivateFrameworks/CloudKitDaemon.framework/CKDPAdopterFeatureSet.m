@interface CKDPAdopterFeatureSet
+ (Class)fieldFeaturesType;
+ (Class)recordFeaturesType;
+ (Class)zoneFeaturesType;
- (BOOL)hasMinimumSchemaVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)fieldFeatures;
- (NSMutableArray)recordFeatures;
- (NSMutableArray)zoneFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldFeaturesAtIndex:(unint64_t)a3;
- (id)recordFeaturesAtIndex:(unint64_t)a3;
- (id)zoneFeaturesAtIndex:(unint64_t)a3;
- (int)minimumSchemaVersion;
- (unint64_t)fieldFeaturesCount;
- (unint64_t)hash;
- (unint64_t)recordFeaturesCount;
- (unint64_t)zoneFeaturesCount;
- (void)addFieldFeatures:(id)a3;
- (void)addRecordFeatures:(id)a3;
- (void)addZoneFeatures:(id)a3;
- (void)clearFieldFeatures;
- (void)clearRecordFeatures;
- (void)clearZoneFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldFeatures:(id)a3;
- (void)setHasMinimumSchemaVersion:(BOOL)a3;
- (void)setMinimumSchemaVersion:(int)a3;
- (void)setRecordFeatures:(id)a3;
- (void)setZoneFeatures:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAdopterFeatureSet

- (int)minimumSchemaVersion
{
  if (*(unsigned char *)&self->_has) {
    return self->_minimumSchemaVersion;
  }
  else {
    return 1;
  }
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearZoneFeatures
{
  objc_msgSend_removeAllObjects(self->_zoneFeatures, a2, v2);
}

- (void)addZoneFeatures:(id)a3
{
  v4 = (const char *)a3;
  zoneFeatures = self->_zoneFeatures;
  v8 = (char *)v4;
  if (!zoneFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneFeatures;
    self->_zoneFeatures = v6;

    v4 = v8;
    zoneFeatures = self->_zoneFeatures;
  }
  objc_msgSend_addObject_(zoneFeatures, v4, (uint64_t)v4);
}

- (unint64_t)zoneFeaturesCount
{
  return objc_msgSend_count(self->_zoneFeatures, a2, v2);
}

- (id)zoneFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneFeatures, a2, a3);
}

+ (Class)zoneFeaturesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordFeatures
{
  objc_msgSend_removeAllObjects(self->_recordFeatures, a2, v2);
}

- (void)addRecordFeatures:(id)a3
{
  v4 = (const char *)a3;
  recordFeatures = self->_recordFeatures;
  v8 = (char *)v4;
  if (!recordFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_recordFeatures;
    self->_recordFeatures = v6;

    v4 = v8;
    recordFeatures = self->_recordFeatures;
  }
  objc_msgSend_addObject_(recordFeatures, v4, (uint64_t)v4);
}

- (unint64_t)recordFeaturesCount
{
  return objc_msgSend_count(self->_recordFeatures, a2, v2);
}

- (id)recordFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordFeatures, a2, a3);
}

+ (Class)recordFeaturesType
{
  return (Class)objc_opt_class();
}

- (void)clearFieldFeatures
{
  objc_msgSend_removeAllObjects(self->_fieldFeatures, a2, v2);
}

- (void)addFieldFeatures:(id)a3
{
  v4 = (const char *)a3;
  fieldFeatures = self->_fieldFeatures;
  v8 = (char *)v4;
  if (!fieldFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fieldFeatures;
    self->_fieldFeatures = v6;

    v4 = v8;
    fieldFeatures = self->_fieldFeatures;
  }
  objc_msgSend_addObject_(fieldFeatures, v4, (uint64_t)v4);
}

- (unint64_t)fieldFeaturesCount
{
  return objc_msgSend_count(self->_fieldFeatures, a2, v2);
}

- (id)fieldFeaturesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldFeatures, a2, a3);
}

+ (Class)fieldFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAdopterFeatureSet;
  v4 = [(CKDPAdopterFeatureSet *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_minimumSchemaVersion);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"minimumSchemaVersion");
  }
  if (objc_msgSend_count(self->_zoneFeatures, v4, v5))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = objc_msgSend_count(self->_zoneFeatures, v12, v13);
    v16 = objc_msgSend_initWithCapacity_(v11, v15, v14);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v17 = self->_zoneFeatures;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v73, v79, 16);
    if (v19)
    {
      uint64_t v22 = v19;
      uint64_t v23 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v74 != v23) {
            objc_enumerationMutation(v17);
          }
          v25 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v73 + 1) + 8 * i), v20, v21);
          objc_msgSend_addObject_(v16, v26, (uint64_t)v25);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v73, v79, 16);
      }
      while (v22);
    }

    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v16, @"zoneFeatures");
  }
  if (objc_msgSend_count(self->_recordFeatures, v9, v10))
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v33 = objc_msgSend_count(self->_recordFeatures, v31, v32);
    v35 = objc_msgSend_initWithCapacity_(v30, v34, v33);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v36 = self->_recordFeatures;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v69, v78, 16);
    if (v38)
    {
      uint64_t v41 = v38;
      uint64_t v42 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v70 != v42) {
            objc_enumerationMutation(v36);
          }
          v44 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v69 + 1) + 8 * j), v39, v40);
          objc_msgSend_addObject_(v35, v45, (uint64_t)v44);
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v69, v78, 16);
      }
      while (v41);
    }

    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v35, @"recordFeatures");
  }
  if (objc_msgSend_count(self->_fieldFeatures, v28, v29))
  {
    id v47 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v50 = objc_msgSend_count(self->_fieldFeatures, v48, v49);
    v52 = objc_msgSend_initWithCapacity_(v47, v51, v50);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v53 = self->_fieldFeatures;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v65, v77, 16);
    if (v55)
    {
      uint64_t v58 = v55;
      uint64_t v59 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v66 != v59) {
            objc_enumerationMutation(v53);
          }
          v61 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v65 + 1) + 8 * k), v56, v57, (void)v65);
          objc_msgSend_addObject_(v52, v62, (uint64_t)v61);
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v65, v77, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v52, @"fieldFeatures");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E74B20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_zoneFeatures;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v12 = self->_recordFeatures;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self->_fieldFeatures;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_minimumSchemaVersion;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v35 = v4;
  if (objc_msgSend_zoneFeaturesCount(self, v5, v6))
  {
    objc_msgSend_clearZoneFeatures(v35, v7, v8);
    uint64_t v11 = objc_msgSend_zoneFeaturesCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_zoneFeaturesAtIndex_(self, v7, i);
        objc_msgSend_addZoneFeatures_(v35, v15, (uint64_t)v14);
      }
    }
  }
  if (objc_msgSend_recordFeaturesCount(self, v7, v8))
  {
    objc_msgSend_clearRecordFeatures(v35, v16, v17);
    uint64_t v20 = objc_msgSend_recordFeaturesCount(self, v18, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      for (uint64_t j = 0; j != v21; ++j)
      {
        uint64_t v23 = objc_msgSend_recordFeaturesAtIndex_(self, v16, j);
        objc_msgSend_addRecordFeatures_(v35, v24, (uint64_t)v23);
      }
    }
  }
  if (objc_msgSend_fieldFeaturesCount(self, v16, v17))
  {
    objc_msgSend_clearFieldFeatures(v35, v25, v26);
    uint64_t v29 = objc_msgSend_fieldFeaturesCount(self, v27, v28);
    if (v29)
    {
      uint64_t v31 = v29;
      for (uint64_t k = 0; k != v31; ++k)
      {
        long long v33 = objc_msgSend_fieldFeaturesAtIndex_(self, v30, k);
        objc_msgSend_addFieldFeatures_(v35, v34, (uint64_t)v33);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v11 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_minimumSchemaVersion;
    *(unsigned char *)(v10 + 40) |= 1u;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = self->_zoneFeatures;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v54, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v49;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v48 + 1) + 8 * v18), v15, (uint64_t)a3);
        objc_msgSend_addZoneFeatures_(v11, v20, (uint64_t)v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v48, v54, 16);
    }
    while (v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v21 = self->_recordFeatures;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v44, v53, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v45;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v44 + 1) + 8 * v27), v24, (uint64_t)a3);
        objc_msgSend_addRecordFeatures_(v11, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v44, v53, 16);
    }
    while (v25);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v30 = self->_fieldFeatures;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v40, v52, 16);
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v30);
        }
        long long v37 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * v36), v33, (uint64_t)a3, (void)v40);
        objc_msgSend_addFieldFeatures_(v11, v38, (uint64_t)v37);

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v40, v52, 16);
    }
    while (v34);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (v4[5])
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  zoneFeatures = self->_zoneFeatures;
  uint64_t v9 = v4[4];
  if ((unint64_t)zoneFeatures | v9 && !objc_msgSend_isEqual_(zoneFeatures, v7, v9)) {
    goto LABEL_13;
  }
  recordFeatures = self->_recordFeatures;
  uint64_t v11 = v4[3];
  if ((unint64_t)recordFeatures | v11)
  {
    if (!objc_msgSend_isEqual_(recordFeatures, v7, v11)) {
      goto LABEL_13;
    }
  }
  fieldFeatures = self->_fieldFeatures;
  uint64_t v13 = v4[1];
  if ((unint64_t)fieldFeatures | v13) {
    char isEqual = objc_msgSend_isEqual_(fieldFeatures, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_minimumSchemaVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_zoneFeatures, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_recordFeatures, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_fieldFeatures, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 40))
  {
    self->_minimumSchemaVersion = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, v41, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_addZoneFeatures_(self, v9, *(void *)(*((void *)&v35 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v35, v41, 16);
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v5[3];
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v31, v40, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addRecordFeatures_(self, v16, *(void *)(*((void *)&v31 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v31, v40, 16);
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v5[1];
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v27, v39, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend_addFieldFeatures_(self, v23, *(void *)(*((void *)&v27 + 1) + 8 * v26++), (void)v27);
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v27, v39, 16);
    }
    while (v24);
  }
}

- (NSMutableArray)zoneFeatures
{
  return self->_zoneFeatures;
}

- (void)setZoneFeatures:(id)a3
{
}

- (NSMutableArray)recordFeatures
{
  return self->_recordFeatures;
}

- (void)setRecordFeatures:(id)a3
{
}

- (NSMutableArray)fieldFeatures
{
  return self->_fieldFeatures;
}

- (void)setFieldFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneFeatures, 0);
  objc_storeStrong((id *)&self->_recordFeatures, 0);
  objc_storeStrong((id *)&self->_fieldFeatures, 0);
}

@end
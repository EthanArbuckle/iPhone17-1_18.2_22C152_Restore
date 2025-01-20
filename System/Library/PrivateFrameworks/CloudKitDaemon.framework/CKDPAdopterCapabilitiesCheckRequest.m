@interface CKDPAdopterCapabilitiesCheckRequest
+ (Class)fieldLevelCapabilitiesType;
+ (Class)recordLevelCapabilitiesType;
+ (Class)zoneLevelCapabilitiesType;
+ (id)options;
- (BOOL)excludeDevicesWithoutCapabilityCheckingSupport;
- (BOOL)hasExcludeDevicesWithoutCapabilityCheckingSupport;
- (BOOL)hasExcludeZoneAccessBefore;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)excludeZoneAccessBefore;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (Class)responseClass;
- (NSMutableArray)fieldLevelCapabilities;
- (NSMutableArray)recordLevelCapabilities;
- (NSMutableArray)zoneLevelCapabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldLevelCapabilitiesAtIndex:(unint64_t)a3;
- (id)recordLevelCapabilitiesAtIndex:(unint64_t)a3;
- (id)zoneLevelCapabilitiesAtIndex:(unint64_t)a3;
- (unint64_t)fieldLevelCapabilitiesCount;
- (unint64_t)hash;
- (unint64_t)recordLevelCapabilitiesCount;
- (unint64_t)zoneLevelCapabilitiesCount;
- (unsigned)requestTypeCode;
- (void)addFieldLevelCapabilities:(id)a3;
- (void)addRecordLevelCapabilities:(id)a3;
- (void)addZoneLevelCapabilities:(id)a3;
- (void)clearFieldLevelCapabilities;
- (void)clearRecordLevelCapabilities;
- (void)clearZoneLevelCapabilities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3;
- (void)setExcludeZoneAccessBefore:(id)a3;
- (void)setFieldLevelCapabilities:(id)a3;
- (void)setHasExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3;
- (void)setRecordLevelCapabilities:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)setZoneLevelCapabilities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAdopterCapabilitiesCheckRequest

+ (id)options
{
  if (qword_1EBBCDE90 != -1) {
    dispatch_once(&qword_1EBBCDE90, &unk_1F2043F50);
  }
  v2 = (void *)qword_1EBBCDE88;
  return v2;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (void)clearZoneLevelCapabilities
{
  objc_msgSend_removeAllObjects(self->_zoneLevelCapabilities, a2, v2);
}

- (void)addZoneLevelCapabilities:(id)a3
{
  v4 = (const char *)a3;
  zoneLevelCapabilities = self->_zoneLevelCapabilities;
  v8 = (char *)v4;
  if (!zoneLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneLevelCapabilities;
    self->_zoneLevelCapabilities = v6;

    v4 = v8;
    zoneLevelCapabilities = self->_zoneLevelCapabilities;
  }
  objc_msgSend_addObject_(zoneLevelCapabilities, v4, (uint64_t)v4);
}

- (unint64_t)zoneLevelCapabilitiesCount
{
  return objc_msgSend_count(self->_zoneLevelCapabilities, a2, v2);
}

- (id)zoneLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneLevelCapabilities, a2, a3);
}

+ (Class)zoneLevelCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordLevelCapabilities
{
  objc_msgSend_removeAllObjects(self->_recordLevelCapabilities, a2, v2);
}

- (void)addRecordLevelCapabilities:(id)a3
{
  v4 = (const char *)a3;
  recordLevelCapabilities = self->_recordLevelCapabilities;
  v8 = (char *)v4;
  if (!recordLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_recordLevelCapabilities;
    self->_recordLevelCapabilities = v6;

    v4 = v8;
    recordLevelCapabilities = self->_recordLevelCapabilities;
  }
  objc_msgSend_addObject_(recordLevelCapabilities, v4, (uint64_t)v4);
}

- (unint64_t)recordLevelCapabilitiesCount
{
  return objc_msgSend_count(self->_recordLevelCapabilities, a2, v2);
}

- (id)recordLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordLevelCapabilities, a2, a3);
}

+ (Class)recordLevelCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearFieldLevelCapabilities
{
  objc_msgSend_removeAllObjects(self->_fieldLevelCapabilities, a2, v2);
}

- (void)addFieldLevelCapabilities:(id)a3
{
  v4 = (const char *)a3;
  fieldLevelCapabilities = self->_fieldLevelCapabilities;
  v8 = (char *)v4;
  if (!fieldLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fieldLevelCapabilities;
    self->_fieldLevelCapabilities = v6;

    v4 = v8;
    fieldLevelCapabilities = self->_fieldLevelCapabilities;
  }
  objc_msgSend_addObject_(fieldLevelCapabilities, v4, (uint64_t)v4);
}

- (unint64_t)fieldLevelCapabilitiesCount
{
  return objc_msgSend_count(self->_fieldLevelCapabilities, a2, v2);
}

- (id)fieldLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldLevelCapabilities, a2, a3);
}

+ (Class)fieldLevelCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasExcludeZoneAccessBefore
{
  return self->_excludeZoneAccessBefore != 0;
}

- (void)setExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_excludeDevicesWithoutCapabilityCheckingSupport = a3;
}

- (void)setHasExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExcludeDevicesWithoutCapabilityCheckingSupport
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAdopterCapabilitiesCheckRequest;
  v4 = [(CKDPAdopterCapabilitiesCheckRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  if (objc_msgSend_count(self->_zoneLevelCapabilities, v4, v5))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(self->_zoneLevelCapabilities, v13, v14);
    v17 = objc_msgSend_initWithCapacity_(v12, v16, v15);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v18 = self->_zoneLevelCapabilities;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v81, v87, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v82 != v24) {
            objc_enumerationMutation(v18);
          }
          v26 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v81 + 1) + 8 * i), v21, v22);
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v81, v87, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, @"zoneLevelCapabilities");
  }
  if (objc_msgSend_count(self->_recordLevelCapabilities, v10, v11))
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v34 = objc_msgSend_count(self->_recordLevelCapabilities, v32, v33);
    v36 = objc_msgSend_initWithCapacity_(v31, v35, v34);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v37 = self->_recordLevelCapabilities;
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v77, v86, 16);
    if (v39)
    {
      uint64_t v42 = v39;
      uint64_t v43 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v78 != v43) {
            objc_enumerationMutation(v37);
          }
          v45 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v77 + 1) + 8 * j), v40, v41);
          objc_msgSend_addObject_(v36, v46, (uint64_t)v45);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v77, v86, 16);
      }
      while (v42);
    }

    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)v36, @"recordLevelCapabilities");
  }
  if (objc_msgSend_count(self->_fieldLevelCapabilities, v29, v30))
  {
    id v50 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v53 = objc_msgSend_count(self->_fieldLevelCapabilities, v51, v52);
    v55 = objc_msgSend_initWithCapacity_(v50, v54, v53);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v56 = self->_fieldLevelCapabilities;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v73, v85, 16);
    if (v58)
    {
      uint64_t v61 = v58;
      uint64_t v62 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v74 != v62) {
            objc_enumerationMutation(v56);
          }
          v64 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v73 + 1) + 8 * k), v59, v60, (void)v73);
          objc_msgSend_addObject_(v55, v65, (uint64_t)v64);
        }
        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v73, v85, 16);
      }
      while (v61);
    }

    objc_msgSend_setObject_forKey_(v6, v66, (uint64_t)v55, @"fieldLevelCapabilities");
  }
  excludeZoneAccessBefore = self->_excludeZoneAccessBefore;
  if (excludeZoneAccessBefore)
  {
    v68 = objc_msgSend_dictionaryRepresentation(excludeZoneAccessBefore, v48, v49);
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, @"excludeZoneAccessBefore");
  }
  if (*(unsigned char *)&self->_has)
  {
    v70 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v48, self->_excludeDevicesWithoutCapabilityCheckingSupport);
    objc_msgSend_setObject_forKey_(v6, v71, (uint64_t)v70, @"excludeDevicesWithoutCapabilityCheckingSupport");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EFE234((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_zoneIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_zoneLevelCapabilities;
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
  id v12 = self->_recordLevelCapabilities;
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
  v19 = self->_fieldLevelCapabilities;
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

  if (self->_excludeZoneAccessBefore) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (unsigned)requestTypeCode
{
  return 93;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v34 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier) {
    objc_msgSend_setZoneIdentifier_(v34, v4, (uint64_t)zoneIdentifier);
  }
  if (objc_msgSend_zoneLevelCapabilitiesCount(self, v4, (uint64_t)zoneIdentifier))
  {
    objc_msgSend_clearZoneLevelCapabilities(v34, v6, v7);
    uint64_t v10 = objc_msgSend_zoneLevelCapabilitiesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_zoneLevelCapabilitiesAtIndex_(self, v6, i);
        objc_msgSend_addZoneLevelCapabilities_(v34, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_recordLevelCapabilitiesCount(self, v6, v7))
  {
    objc_msgSend_clearRecordLevelCapabilities(v34, v15, v16);
    uint64_t v19 = objc_msgSend_recordLevelCapabilitiesCount(self, v17, v18);
    if (v19)
    {
      uint64_t v20 = v19;
      for (uint64_t j = 0; j != v20; ++j)
      {
        uint64_t v22 = objc_msgSend_recordLevelCapabilitiesAtIndex_(self, v15, j);
        objc_msgSend_addRecordLevelCapabilities_(v34, v23, (uint64_t)v22);
      }
    }
  }
  if (objc_msgSend_fieldLevelCapabilitiesCount(self, v15, v16))
  {
    objc_msgSend_clearFieldLevelCapabilities(v34, v24, v25);
    uint64_t v28 = objc_msgSend_fieldLevelCapabilitiesCount(self, v26, v27);
    if (v28)
    {
      uint64_t v29 = v28;
      for (uint64_t k = 0; k != v29; ++k)
      {
        long long v31 = objc_msgSend_fieldLevelCapabilitiesAtIndex_(self, v24, k);
        objc_msgSend_addFieldLevelCapabilities_(v34, v32, (uint64_t)v31);
      }
    }
  }
  excludeZoneAccessBefore = self->_excludeZoneAccessBefore;
  if (excludeZoneAccessBefore) {
    objc_msgSend_setExcludeZoneAccessBefore_(v34, v24, (uint64_t)excludeZoneAccessBefore);
  }
  if (*(unsigned char *)&self->_has)
  {
    v34[48] = self->_excludeDevicesWithoutCapabilityCheckingSupport;
    v34[52] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v14 = self->_zoneLevelCapabilities;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v53, v59, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v53 + 1) + 8 * i), v17, (uint64_t)a3);
        objc_msgSend_addZoneLevelCapabilities_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v53, v59, 16);
    }
    while (v18);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v23 = self->_recordLevelCapabilities;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v49, v58, 16);
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v23);
        }
        long long v30 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v49 + 1) + 8 * j), v26, (uint64_t)a3);
        objc_msgSend_addRecordLevelCapabilities_((void *)v10, v31, (uint64_t)v30);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v49, v58, 16);
    }
    while (v27);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v32 = self->_fieldLevelCapabilities;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v45, v57, 16);
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v32);
        }
        uint64_t v39 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v45 + 1) + 8 * k), v35, (uint64_t)a3, (void)v45);
        objc_msgSend_addFieldLevelCapabilities_((void *)v10, v40, (uint64_t)v39);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v45, v57, 16);
    }
    while (v36);
  }

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_excludeZoneAccessBefore, v41, (uint64_t)a3);
  uint64_t v43 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v42;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 48) = self->_excludeDevicesWithoutCapabilityCheckingSupport;
    *(unsigned char *)(v10 + 52) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[4];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_14;
    }
  }
  zoneLevelCapabilities = self->_zoneLevelCapabilities;
  uint64_t v11 = v4[5];
  if ((unint64_t)zoneLevelCapabilities | v11)
  {
    if (!objc_msgSend_isEqual_(zoneLevelCapabilities, v7, v11)) {
      goto LABEL_14;
    }
  }
  recordLevelCapabilities = self->_recordLevelCapabilities;
  uint64_t v13 = v4[3];
  if ((unint64_t)recordLevelCapabilities | v13)
  {
    if (!objc_msgSend_isEqual_(recordLevelCapabilities, v7, v13)) {
      goto LABEL_14;
    }
  }
  fieldLevelCapabilities = self->_fieldLevelCapabilities;
  uint64_t v15 = v4[2];
  if ((unint64_t)fieldLevelCapabilities | v15)
  {
    if (!objc_msgSend_isEqual_(fieldLevelCapabilities, v7, v15)) {
      goto LABEL_14;
    }
  }
  excludeZoneAccessBefore = self->_excludeZoneAccessBefore;
  uint64_t v17 = v4[1];
  if ((unint64_t)excludeZoneAccessBefore | v17)
  {
    if (!objc_msgSend_isEqual_(excludeZoneAccessBefore, v7, v17)) {
      goto LABEL_14;
    }
  }
  BOOL v18 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0)
    {
LABEL_14:
      BOOL v18 = 0;
      goto LABEL_15;
    }
    if (self->_excludeDevicesWithoutCapabilityCheckingSupport)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_14;
    }
    BOOL v18 = 1;
  }
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_zoneLevelCapabilities, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_recordLevelCapabilities, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_fieldLevelCapabilities, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_excludeZoneAccessBefore, v14, v15);
  if (*(unsigned char *)&self->_has) {
    uint64_t v17 = 2654435761 * self->_excludeDevicesWithoutCapabilityCheckingSupport;
  }
  else {
    uint64_t v17 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v7 = *((void *)v5 + 4);
  if (zoneIdentifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(zoneIdentifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setZoneIdentifier_(self, v4, v7);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = *((id *)v5 + 5);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v40, v46, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addZoneLevelCapabilities_(self, v11, *(void *)(*((void *)&v40 + 1) + 8 * i));
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v40, v46, 16);
    }
    while (v12);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = *((id *)v5 + 3);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v36, v45, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend_addRecordLevelCapabilities_(self, v18, *(void *)(*((void *)&v36 + 1) + 8 * j));
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v36, v45, 16);
    }
    while (v19);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = *((id *)v5 + 2);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v32, v44, 16);
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_addFieldLevelCapabilities_(self, v25, *(void *)(*((void *)&v32 + 1) + 8 * k), (void)v32);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v32, v44, 16);
    }
    while (v26);
  }

  excludeZoneAccessBefore = self->_excludeZoneAccessBefore;
  uint64_t v31 = *((void *)v5 + 1);
  if (excludeZoneAccessBefore)
  {
    if (v31) {
      objc_msgSend_mergeFrom_(excludeZoneAccessBefore, v29, v31);
    }
  }
  else if (v31)
  {
    objc_msgSend_setExcludeZoneAccessBefore_(self, v29, v31);
  }
  if (*((unsigned char *)v5 + 52))
  {
    self->_excludeDevicesWithoutCapabilityCheckingSupport = *((unsigned char *)v5 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (NSMutableArray)zoneLevelCapabilities
{
  return self->_zoneLevelCapabilities;
}

- (void)setZoneLevelCapabilities:(id)a3
{
}

- (NSMutableArray)recordLevelCapabilities
{
  return self->_recordLevelCapabilities;
}

- (void)setRecordLevelCapabilities:(id)a3
{
}

- (NSMutableArray)fieldLevelCapabilities
{
  return self->_fieldLevelCapabilities;
}

- (void)setFieldLevelCapabilities:(id)a3
{
}

- (CKDPDate)excludeZoneAccessBefore
{
  return self->_excludeZoneAccessBefore;
}

- (void)setExcludeZoneAccessBefore:(id)a3
{
}

- (BOOL)excludeDevicesWithoutCapabilityCheckingSupport
{
  return self->_excludeDevicesWithoutCapabilityCheckingSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_recordLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_fieldLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_excludeZoneAccessBefore, 0);
}

@end
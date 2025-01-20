@interface CKDPSupportedCapabilities
+ (Class)fieldLevelCapabilitiesType;
+ (Class)recordLevelCapabilitiesType;
+ (Class)zoneLevelCapabilitiesType;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasTime;
- (BOOL)hasUserIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)time;
- (CKDPIdentifier)deviceIdentifier;
- (CKDPIdentifier)userIdentifier;
- (NSMutableArray)fieldLevelCapabilities;
- (NSMutableArray)recordLevelCapabilities;
- (NSMutableArray)zoneLevelCapabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldLevelCapabilitiesAtIndex:(unint64_t)a3;
- (id)recordLevelCapabilitiesAtIndex:(unint64_t)a3;
- (id)zoneLevelCapabilitiesAtIndex:(unint64_t)a3;
- (int)version;
- (unint64_t)fieldLevelCapabilitiesCount;
- (unint64_t)hash;
- (unint64_t)recordLevelCapabilitiesCount;
- (unint64_t)zoneLevelCapabilitiesCount;
- (void)addFieldLevelCapabilities:(id)a3;
- (void)addRecordLevelCapabilities:(id)a3;
- (void)addZoneLevelCapabilities:(id)a3;
- (void)clearFieldLevelCapabilities;
- (void)clearRecordLevelCapabilities;
- (void)clearZoneLevelCapabilities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFieldLevelCapabilities:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRecordLevelCapabilities:(id)a3;
- (void)setTime:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setVersion:(int)a3;
- (void)setZoneLevelCapabilities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSupportedCapabilities

- (int)version
{
  if (*(unsigned char *)&self->_has) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
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

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSupportedCapabilities;
  v4 = [(CKDPSupportedCapabilities *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_version);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"version");
  }
  time = self->_time;
  if (time)
  {
    v10 = objc_msgSend_dictionaryRepresentation(time, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"time");
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    v13 = objc_msgSend_dictionaryRepresentation(deviceIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"deviceIdentifier");
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    v16 = objc_msgSend_dictionaryRepresentation(userIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"userIdentifier");
  }
  if (objc_msgSend_count(self->_zoneLevelCapabilities, v4, v5))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = objc_msgSend_count(self->_zoneLevelCapabilities, v21, v22);
    v25 = objc_msgSend_initWithCapacity_(v20, v24, v23);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v26 = self->_zoneLevelCapabilities;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v82, v88, 16);
    if (v28)
    {
      uint64_t v31 = v28;
      uint64_t v32 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v83 != v32) {
            objc_enumerationMutation(v26);
          }
          v34 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v82 + 1) + 8 * i), v29, v30);
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v82, v88, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v25, @"zoneLevelCapabilities");
  }
  if (objc_msgSend_count(self->_recordLevelCapabilities, v18, v19))
  {
    id v39 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v42 = objc_msgSend_count(self->_recordLevelCapabilities, v40, v41);
    v44 = objc_msgSend_initWithCapacity_(v39, v43, v42);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v45 = self->_recordLevelCapabilities;
    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v78, v87, 16);
    if (v47)
    {
      uint64_t v50 = v47;
      uint64_t v51 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v79 != v51) {
            objc_enumerationMutation(v45);
          }
          v53 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v78 + 1) + 8 * j), v48, v49);
          objc_msgSend_addObject_(v44, v54, (uint64_t)v53);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v78, v87, 16);
      }
      while (v50);
    }

    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v44, @"recordLevelCapabilities");
  }
  if (objc_msgSend_count(self->_fieldLevelCapabilities, v37, v38))
  {
    id v56 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v59 = objc_msgSend_count(self->_fieldLevelCapabilities, v57, v58);
    v61 = objc_msgSend_initWithCapacity_(v56, v60, v59);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v62 = self->_fieldLevelCapabilities;
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v74, v86, 16);
    if (v64)
    {
      uint64_t v67 = v64;
      uint64_t v68 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v67; ++k)
        {
          if (*(void *)v75 != v68) {
            objc_enumerationMutation(v62);
          }
          v70 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v74 + 1) + 8 * k), v65, v66, (void)v74);
          objc_msgSend_addObject_(v61, v71, (uint64_t)v70);
        }
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v74, v86, 16);
      }
      while (v67);
    }

    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v61, @"fieldLevelCapabilities");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (1)
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_45:
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v20) = 0;
          }
LABEL_47:
          self->_version = v20;
          goto LABEL_42;
        case 2u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E4F19EF8]);
          objc_storeStrong((id *)&self->_time, v25);
          if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0) {
            goto LABEL_49;
          }
          goto LABEL_41;
        case 3u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E4F19F08]);
          uint64_t v26 = 8;
          goto LABEL_33;
        case 4u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E4F19F08]);
          uint64_t v26 = 40;
LABEL_33:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v26), v25);
          if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0) {
            goto LABEL_49;
          }
          goto LABEL_41;
        case 5u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addZoneLevelCapabilities_(self, v27, (uint64_t)v25);
          goto LABEL_39;
        case 6u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addRecordLevelCapabilities_(self, v28, (uint64_t)v25);
          goto LABEL_39;
        case 7u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addFieldLevelCapabilities_(self, v29, (uint64_t)v25);
LABEL_39:
          if (!PBReaderPlaceMark() || !sub_1C4E44A38(v25, (uint64_t)a3))
          {
LABEL_49:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_41:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_48;
          }
          break;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_42;
      }
    }
  }
LABEL_48:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_time) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userIdentifier) {
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
  uint64_t v12 = self->_recordLevelCapabilities;
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
  unsigned int v19 = self->_fieldLevelCapabilities;
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
    v4[12] = self->_version;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  time = self->_time;
  id v37 = v4;
  if (time) {
    objc_msgSend_setTime_(v4, v5, (uint64_t)time);
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    objc_msgSend_setDeviceIdentifier_(v37, v5, (uint64_t)deviceIdentifier);
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier) {
    objc_msgSend_setUserIdentifier_(v37, v5, (uint64_t)userIdentifier);
  }
  if (objc_msgSend_zoneLevelCapabilitiesCount(self, v5, (uint64_t)userIdentifier))
  {
    objc_msgSend_clearZoneLevelCapabilities(v37, v9, v10);
    uint64_t v13 = objc_msgSend_zoneLevelCapabilitiesCount(self, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_zoneLevelCapabilitiesAtIndex_(self, v9, i);
        objc_msgSend_addZoneLevelCapabilities_(v37, v17, (uint64_t)v16);
      }
    }
  }
  if (objc_msgSend_recordLevelCapabilitiesCount(self, v9, v10))
  {
    objc_msgSend_clearRecordLevelCapabilities(v37, v18, v19);
    uint64_t v22 = objc_msgSend_recordLevelCapabilitiesCount(self, v20, v21);
    if (v22)
    {
      uint64_t v23 = v22;
      for (uint64_t j = 0; j != v23; ++j)
      {
        v25 = objc_msgSend_recordLevelCapabilitiesAtIndex_(self, v18, j);
        objc_msgSend_addRecordLevelCapabilities_(v37, v26, (uint64_t)v25);
      }
    }
  }
  if (objc_msgSend_fieldLevelCapabilitiesCount(self, v18, v19))
  {
    objc_msgSend_clearFieldLevelCapabilities(v37, v27, v28);
    uint64_t v31 = objc_msgSend_fieldLevelCapabilitiesCount(self, v29, v30);
    if (v31)
    {
      uint64_t v33 = v31;
      for (uint64_t k = 0; k != v33; ++k)
      {
        long long v35 = objc_msgSend_fieldLevelCapabilitiesAtIndex_(self, v32, k);
        objc_msgSend_addFieldLevelCapabilities_(v37, v36, (uint64_t)v35);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 48) = self->_version;
    *(unsigned char *)(v10 + 64) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_time, v11, (uint64_t)a3);
  uint64_t v14 = (void *)v12[4];
  v12[4] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v15, (uint64_t)a3);
  uint64_t v17 = (void *)v12[1];
  v12[1] = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_userIdentifier, v18, (uint64_t)a3);
  uint64_t v20 = (void *)v12[5];
  v12[5] = v19;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v21 = self->_zoneLevelCapabilities;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v57, v63, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v57 + 1) + 8 * i), v24, (uint64_t)a3);
        objc_msgSend_addZoneLevelCapabilities_(v12, v29, (uint64_t)v28);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v57, v63, 16);
    }
    while (v25);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v30 = self->_recordLevelCapabilities;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v53, v62, 16);
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v30);
        }
        id v37 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v53 + 1) + 8 * j), v33, (uint64_t)a3);
        objc_msgSend_addRecordLevelCapabilities_(v12, v38, (uint64_t)v37);
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v53, v62, 16);
    }
    while (v34);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v39 = self->_fieldLevelCapabilities;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v49, v61, 16);
  if (v41)
  {
    uint64_t v43 = v41;
    uint64_t v44 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(v39);
        }
        v46 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v49 + 1) + 8 * k), v42, (uint64_t)a3, (void)v49);
        objc_msgSend_addFieldLevelCapabilities_(v12, v47, (uint64_t)v46);
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v49, v61, 16);
    }
    while (v43);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[8] & 1) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_19;
    }
  }
  else if (v4[8])
  {
LABEL_19:
    char isEqual = 0;
    goto LABEL_20;
  }
  time = self->_time;
  uint64_t v9 = v4[4];
  if ((unint64_t)time | v9 && !objc_msgSend_isEqual_(time, v7, v9)) {
    goto LABEL_19;
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v11 = v4[1];
  if ((unint64_t)deviceIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(deviceIdentifier, v7, v11)) {
      goto LABEL_19;
    }
  }
  userIdentifier = self->_userIdentifier;
  uint64_t v13 = v4[5];
  if ((unint64_t)userIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(userIdentifier, v7, v13)) {
      goto LABEL_19;
    }
  }
  zoneLevelCapabilities = self->_zoneLevelCapabilities;
  uint64_t v15 = v4[7];
  if ((unint64_t)zoneLevelCapabilities | v15)
  {
    if (!objc_msgSend_isEqual_(zoneLevelCapabilities, v7, v15)) {
      goto LABEL_19;
    }
  }
  recordLevelCapabilities = self->_recordLevelCapabilities;
  uint64_t v17 = v4[3];
  if ((unint64_t)recordLevelCapabilities | v17)
  {
    if (!objc_msgSend_isEqual_(recordLevelCapabilities, v7, v17)) {
      goto LABEL_19;
    }
  }
  fieldLevelCapabilities = self->_fieldLevelCapabilities;
  uint64_t v19 = v4[2];
  if ((unint64_t)fieldLevelCapabilities | v19) {
    char isEqual = objc_msgSend_isEqual_(fieldLevelCapabilities, v7, v19);
  }
  else {
    char isEqual = 1;
  }
LABEL_20:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_time, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_deviceIdentifier, v6, v7);
  uint64_t v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_userIdentifier, v9, v10);
  uint64_t v14 = objc_msgSend_hash(self->_zoneLevelCapabilities, v12, v13);
  uint64_t v17 = v14 ^ objc_msgSend_hash(self->_recordLevelCapabilities, v15, v16);
  return v11 ^ v17 ^ objc_msgSend_hash(self->_fieldLevelCapabilities, v18, v19);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v6 = v4;
  if (v4[16])
  {
    self->_version = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  time = self->_time;
  uint64_t v8 = *((void *)v6 + 4);
  if (time)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(time, v5, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setTime_(self, v5, v8);
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v10 = *((void *)v6 + 1);
  if (deviceIdentifier)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(deviceIdentifier, v5, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setDeviceIdentifier_(self, v5, v10);
  }
  userIdentifier = self->_userIdentifier;
  uint64_t v12 = *((void *)v6 + 5);
  if (userIdentifier)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(userIdentifier, v5, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setUserIdentifier_(self, v5, v12);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = *((id *)v6 + 7);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v42, v48, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addZoneLevelCapabilities_(self, v16, *(void *)(*((void *)&v42 + 1) + 8 * i));
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v42, v48, 16);
    }
    while (v17);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = *((id *)v6 + 3);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, v47, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend_addRecordLevelCapabilities_(self, v23, *(void *)(*((void *)&v38 + 1) + 8 * j));
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v38, v47, 16);
    }
    while (v24);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = *((id *)v6 + 2);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v34, v46, 16);
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend_addFieldLevelCapabilities_(self, v30, *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v34, v46, 16);
    }
    while (v31);
  }
}

- (CKDPDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (CKDPIdentifier)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_recordLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_fieldLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
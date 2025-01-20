@interface CKDPRecord
+ (Class)conflictLoserEtagsType;
+ (Class)fieldsType;
+ (Class)pluginFieldsType;
+ (Class)tombstonedPublicKeyIDsType;
+ (id)recordFromData:(id)a3;
- (BOOL)expired;
- (BOOL)hasAppliedCryptoFeatures;
- (BOOL)hasChainParent;
- (BOOL)hasChainPrivateKey;
- (BOOL)hasChainProtectionInfo;
- (BOOL)hasChainProtectionInfoKeysToRemove;
- (BOOL)hasCreatedBy;
- (BOOL)hasEtag;
- (BOOL)hasExpirationTime;
- (BOOL)hasExpired;
- (BOOL)hasModifiedBy;
- (BOOL)hasModifiedByDevice;
- (BOOL)hasOneTimeStableUrlInfo;
- (BOOL)hasPermission;
- (BOOL)hasProtectionInfo;
- (BOOL)hasProtectionInfoKeysToRemove;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasShareId;
- (BOOL)hasShareInfo;
- (BOOL)hasStableUrl;
- (BOOL)hasStorageExpiration;
- (BOOL)hasTimeStatistics;
- (BOOL)hasType;
- (BOOL)hasZoneishPrimaryKeyId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)expirationTime;
- (CKDPDateStatistics)timeStatistics;
- (CKDPIdentifier)createdBy;
- (CKDPIdentifier)modifiedBy;
- (CKDPProtectionInfo)chainProtectionInfo;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPProtectionInfoKeysToRemove)chainProtectionInfoKeysToRemove;
- (CKDPProtectionInfoKeysToRemove)protectionInfoKeysToRemove;
- (CKDPRecordChainParent)chainParent;
- (CKDPRecordCryptoFeatureSet)appliedCryptoFeatures;
- (CKDPRecordIdentifier)recordIdentifier;
- (CKDPRecordOneTimeStableUrlInfo)oneTimeStableUrlInfo;
- (CKDPRecordStableUrl)stableUrl;
- (CKDPRecordType)type;
- (CKDPShare)shareInfo;
- (CKDPShareIdentifier)shareId;
- (CKDPStorageExpiration)storageExpiration;
- (NSData)chainPrivateKey;
- (NSData)zoneishPrimaryKeyId;
- (NSMutableArray)conflictLoserEtags;
- (NSMutableArray)fields;
- (NSMutableArray)pluginFields;
- (NSMutableArray)tombstonedPublicKeyIDs;
- (NSString)etag;
- (NSString)modifiedByDevice;
- (id)_permissionAsString;
- (id)conflictLoserEtagsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldData;
- (id)fieldForKey:(id)a3;
- (id)fieldsAtIndex:(unint64_t)a3;
- (id)permissionAsString:(int)a3;
- (id)pluginFieldsAtIndex:(unint64_t)a3;
- (id)tombstonedPublicKeyIDsAtIndex:(unint64_t)a3;
- (int)StringAsPermission:(id)a3;
- (int)permission;
- (unint64_t)conflictLoserEtagsCount;
- (unint64_t)fieldsCount;
- (unint64_t)hash;
- (unint64_t)pluginFieldsCount;
- (unint64_t)tombstonedPublicKeyIDsCount;
- (void)_inflateFieldsFromData:(id)a3;
- (void)addConflictLoserEtags:(id)a3;
- (void)addFields:(id)a3;
- (void)addPluginFields:(id)a3;
- (void)addTombstonedPublicKeyIDs:(id)a3;
- (void)clearConflictLoserEtags;
- (void)clearFields;
- (void)clearPluginFields;
- (void)clearTombstonedPublicKeyIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppliedCryptoFeatures:(id)a3;
- (void)setChainParent:(id)a3;
- (void)setChainPrivateKey:(id)a3;
- (void)setChainProtectionInfo:(id)a3;
- (void)setChainProtectionInfoKeysToRemove:(id)a3;
- (void)setConflictLoserEtags:(id)a3;
- (void)setCreatedBy:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExpirationTime:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setFields:(id)a3;
- (void)setHasExpired:(BOOL)a3;
- (void)setHasPermission:(BOOL)a3;
- (void)setModifiedBy:(id)a3;
- (void)setModifiedByDevice:(id)a3;
- (void)setOneTimeStableUrlInfo:(id)a3;
- (void)setPermission:(int)a3;
- (void)setPluginFields:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setProtectionInfoKeysToRemove:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setShareId:(id)a3;
- (void)setShareInfo:(id)a3;
- (void)setStableUrl:(id)a3;
- (void)setStorageExpiration:(id)a3;
- (void)setTimeStatistics:(id)a3;
- (void)setTombstonedPublicKeyIDs:(id)a3;
- (void)setType:(id)a3;
- (void)setZoneishPrimaryKeyId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecord

- (void)_inflateFieldsFromData:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    objc_msgSend_clearFields(self, v4, v5);
    id v7 = objc_alloc(MEMORY[0x1E4F94090]);
    v9 = (unsigned char *)objc_msgSend_initWithData_(v7, v8, (uint64_t)v6);
    v10 = (int *)MEMORY[0x1E4F940E8];
    v11 = (int *)MEMORY[0x1E4F940E0];
    if (*(void *)&v9[*MEMORY[0x1E4F940E8]] < *(void *)&v9[*MEMORY[0x1E4F940E0]])
    {
      v12 = (int *)MEMORY[0x1E4F940C8];
      v13 = (int *)MEMORY[0x1E4F940B8];
      while (1)
      {
        if (v9[*v12]) {
          goto LABEL_41;
        }
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        while (1)
        {
          uint64_t v17 = *v10;
          unint64_t v18 = *(void *)&v9[v17];
          if (v18 == -1 || v18 >= *(void *)&v9[*v11]) {
            break;
          }
          char v19 = *(unsigned char *)(*(void *)&v9[*v13] + v18);
          *(void *)&v9[v17] = v18 + 1;
          v16 |= (unint64_t)(v19 & 0x7F) << v14;
          if ((v19 & 0x80) == 0) {
            goto LABEL_13;
          }
          v14 += 7;
          if (v15++ >= 9)
          {
            unsigned int v21 = 0;
            int v22 = v9[*v12];
            goto LABEL_16;
          }
        }
        v9[*v12] = 1;
LABEL_13:
        int v22 = v9[*v12];
        unsigned int v21 = v9[*v12] ? 0 : v16;
LABEL_16:
        if (v22) {
          break;
        }
        if ((v21 & 7) == 4) {
          goto LABEL_41;
        }
        if ((*(void *)&v21 & 0x7FFF8) != 0x18)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v30 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = (unsigned __int16)(v21 >> 3);
            v27 = "Warn: Found an unexpected field tag: %d";
            v28 = v30;
            uint32_t v29 = 8;
            goto LABEL_35;
          }
          goto LABEL_41;
        }
        v23 = objc_opt_new();
        objc_msgSend_addFields_(self, v24, (uint64_t)v23);
        *(void *)buf = 0;
        uint64_t v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v31 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't place a reader mark", v32, 2u);
          }

          goto LABEL_41;
        }
        if (!CKDPRecordFieldReadFrom((id *)v23, (uint64_t)v9))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v25 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "Warn: Couldn't read field", v32, 2u);
          }
        }
        PBReaderRecallMark();

        if (*(void *)&v9[*v10] >= *(void *)&v9[*v11]) {
          goto LABEL_41;
        }
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v26 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v27 = "Warn: Hit an error while decoding fields for a record";
        v28 = v26;
        uint32_t v29 = 2;
LABEL_35:
        _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
LABEL_41:
  }
}

- (id)fieldData
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = self->_fields;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, v26, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = objc_opt_new();
        objc_msgSend_writeTo_(v10, v12, (uint64_t)v11, (void)v22);
        unsigned int v15 = objc_msgSend_data(v11, v13, v14);
        objc_msgSend_writeData_forTag_(v3, v16, (uint64_t)v15, 3);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v17, (uint64_t)&v22, v26, 16);
    }
    while (v7);
  }

  v20 = objc_msgSend_data(v3, v18, v19);

  return v20;
}

- (id)fieldForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_fields;
  id v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend_identifier(v12, v7, v8, (void)v20);
        uint64_t v16 = objc_msgSend_name(v13, v14, v15);
        int isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v4);

        if (isEqualToString)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v20, v24, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)recordFromData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CKDPRecord);
  id v5 = objc_alloc(MEMORY[0x1E4F94090]);
  uint64_t v7 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v3);

  CKDPRecordReadFrom((uint64_t)v4, (uint64_t)v7);
  return v4;
}

- (id)dataRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F94098]);
  objc_msgSend_writeTo_(self, v4, (uint64_t)v3);
  uint64_t v7 = objc_msgSend_data(v3, v5, v6);

  return v7;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (void)clearFields
{
  objc_msgSend_removeAllObjects(self->_fields, a2, v2);
}

- (void)addFields:(id)a3
{
  id v4 = (const char *)a3;
  fields = self->_fields;
  uint64_t v8 = (char *)v4;
  if (!fields)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_fields;
    self->_fields = v6;

    id v4 = v8;
    fields = self->_fields;
  }
  objc_msgSend_addObject_(fields, v4, (uint64_t)v4);
}

- (unint64_t)fieldsCount
{
  return objc_msgSend_count(self->_fields, a2, v2);
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fields, a2, a3);
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasModifiedBy
{
  return self->_modifiedBy != 0;
}

- (void)clearConflictLoserEtags
{
  objc_msgSend_removeAllObjects(self->_conflictLoserEtags, a2, v2);
}

- (void)addConflictLoserEtags:(id)a3
{
  id v4 = (const char *)a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  uint64_t v8 = (char *)v4;
  if (!conflictLoserEtags)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    id v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  objc_msgSend_addObject_(conflictLoserEtags, v4, (uint64_t)v4);
}

- (unint64_t)conflictLoserEtagsCount
{
  return objc_msgSend_count(self->_conflictLoserEtags, a2, v2);
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLoserEtags, a2, a3);
}

+ (Class)conflictLoserEtagsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedByDevice
{
  return self->_modifiedByDevice != 0;
}

- (void)clearPluginFields
{
  objc_msgSend_removeAllObjects(self->_pluginFields, a2, v2);
}

- (void)addPluginFields:(id)a3
{
  id v4 = (const char *)a3;
  pluginFields = self->_pluginFields;
  uint64_t v8 = (char *)v4;
  if (!pluginFields)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_pluginFields;
    self->_pluginFields = v6;

    id v4 = v8;
    pluginFields = self->_pluginFields;
  }
  objc_msgSend_addObject_(pluginFields, v4, (uint64_t)v4);
}

- (unint64_t)pluginFieldsCount
{
  return objc_msgSend_count(self->_pluginFields, a2, v2);
}

- (id)pluginFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_pluginFields, a2, a3);
}

+ (Class)pluginFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (int)permission
{
  if (*(unsigned char *)&self->_has) {
    return self->_permission;
  }
  else {
    return 1;
  }
}

- (void)setPermission:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_permission = a3;
}

- (void)setHasPermission:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPermission
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)permissionAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"readOnly";
  }
  else if (a3 == 2)
  {
    id v4 = @"readWrite";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsPermission:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"readOnly") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"readWrite")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasShareInfo
{
  return self->_shareInfo != 0;
}

- (BOOL)hasChainPrivateKey
{
  return self->_chainPrivateKey != 0;
}

- (BOOL)hasChainProtectionInfo
{
  return self->_chainProtectionInfo != 0;
}

- (BOOL)hasChainParent
{
  return self->_chainParent != 0;
}

- (BOOL)hasStableUrl
{
  return self->_stableUrl != 0;
}

- (void)clearTombstonedPublicKeyIDs
{
  objc_msgSend_removeAllObjects(self->_tombstonedPublicKeyIDs, a2, v2);
}

- (void)addTombstonedPublicKeyIDs:(id)a3
{
  id v4 = (const char *)a3;
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  uint64_t v8 = (char *)v4;
  if (!tombstonedPublicKeyIDs)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_tombstonedPublicKeyIDs;
    self->_tombstonedPublicKeyIDs = v6;

    id v4 = v8;
    tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  }
  objc_msgSend_addObject_(tombstonedPublicKeyIDs, v4, (uint64_t)v4);
}

- (unint64_t)tombstonedPublicKeyIDsCount
{
  return objc_msgSend_count(self->_tombstonedPublicKeyIDs, a2, v2);
}

- (id)tombstonedPublicKeyIDsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_tombstonedPublicKeyIDs, a2, a3);
}

+ (Class)tombstonedPublicKeyIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasZoneishPrimaryKeyId
{
  return self->_zoneishPrimaryKeyId != 0;
}

- (BOOL)hasStorageExpiration
{
  return self->_storageExpiration != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpired
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
}

- (BOOL)hasProtectionInfoKeysToRemove
{
  return self->_protectionInfoKeysToRemove != 0;
}

- (BOOL)hasOneTimeStableUrlInfo
{
  return self->_oneTimeStableUrlInfo != 0;
}

- (BOOL)hasChainProtectionInfoKeysToRemove
{
  return self->_chainProtectionInfoKeysToRemove != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecord;
  id v4 = [(CKDPRecord *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  id v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)etag, @"etag");
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    id v9 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"recordIdentifier");
  }
  type = self->_type;
  if (type)
  {
    v12 = objc_msgSend_dictionaryRepresentation(type, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"type");
  }
  createdBy = self->_createdBy;
  if (createdBy)
  {
    uint64_t v15 = objc_msgSend_dictionaryRepresentation(createdBy, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"createdBy");
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    unint64_t v18 = objc_msgSend_dictionaryRepresentation(timeStatistics, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"timeStatistics");
  }
  if (objc_msgSend_count(self->_fields, v5, (uint64_t)etag))
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v25 = objc_msgSend_count(self->_fields, v23, v24);
    uint64_t v27 = objc_msgSend_initWithCapacity_(v22, v26, v25);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v28 = self->_fields;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v112, v117, 16);
    if (v30)
    {
      uint64_t v33 = v30;
      uint64_t v34 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v113 != v34) {
            objc_enumerationMutation(v28);
          }
          v36 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v112 + 1) + 8 * i), v31, v32);
          objc_msgSend_addObject_(v27, v37, (uint64_t)v36);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v112, v117, 16);
      }
      while (v33);
    }

    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v27, @"fields");
  }
  shareId = self->_shareId;
  if (shareId)
  {
    v40 = objc_msgSend_dictionaryRepresentation(shareId, v20, v21);
    objc_msgSend_setObject_forKey_(v6, v41, (uint64_t)v40, @"shareId");
  }
  modifiedBy = self->_modifiedBy;
  if (modifiedBy)
  {
    v43 = objc_msgSend_dictionaryRepresentation(modifiedBy, v20, v21);
    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v43, @"modifiedBy");
  }
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags) {
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)conflictLoserEtags, @"conflictLoserEtags");
  }
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice) {
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)modifiedByDevice, @"modifiedByDevice");
  }
  if (objc_msgSend_count(self->_pluginFields, v20, (uint64_t)modifiedByDevice))
  {
    id v49 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v52 = objc_msgSend_count(self->_pluginFields, v50, v51);
    v54 = objc_msgSend_initWithCapacity_(v49, v53, v52);
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v55 = self->_pluginFields;
    uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v108, v116, 16);
    if (v57)
    {
      uint64_t v60 = v57;
      uint64_t v61 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v109 != v61) {
            objc_enumerationMutation(v55);
          }
          v63 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v108 + 1) + 8 * j), v58, v59);
          objc_msgSend_addObject_(v54, v64, (uint64_t)v63);
        }
        uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v108, v116, 16);
      }
      while (v60);
    }

    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v54, @"pluginFields");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v67 = objc_msgSend_dictionaryRepresentation(protectionInfo, v47, v48);
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, @"protectionInfo");
  }
  if (*(unsigned char *)&self->_has)
  {
    int permission = self->_permission;
    if (permission == 1)
    {
      v70 = @"readOnly";
      objc_msgSend_setObject_forKey_(v6, v47, @"readOnly", @"permission");
    }
    else if (permission == 2)
    {
      v70 = @"readWrite";
      objc_msgSend_setObject_forKey_(v6, v47, @"readWrite", @"permission");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v47, @"(unknown: %i)", self->_permission);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v71, (uint64_t)v70, @"permission");
    }
  }
  shareInfo = self->_shareInfo;
  if (shareInfo)
  {
    v73 = objc_msgSend_dictionaryRepresentation(shareInfo, v47, v48);
    objc_msgSend_setObject_forKey_(v6, v74, (uint64_t)v73, @"shareInfo");
  }
  chainPrivateKey = self->_chainPrivateKey;
  if (chainPrivateKey) {
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)chainPrivateKey, @"chainPrivateKey");
  }
  chainProtectionInfo = self->_chainProtectionInfo;
  if (chainProtectionInfo)
  {
    v77 = objc_msgSend_dictionaryRepresentation(chainProtectionInfo, v47, (uint64_t)chainPrivateKey);
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, @"chainProtectionInfo");
  }
  chainParent = self->_chainParent;
  if (chainParent)
  {
    v80 = objc_msgSend_dictionaryRepresentation(chainParent, v47, (uint64_t)chainPrivateKey);
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, @"chainParent");
  }
  stableUrl = self->_stableUrl;
  if (stableUrl)
  {
    v83 = objc_msgSend_dictionaryRepresentation(stableUrl, v47, (uint64_t)chainPrivateKey);
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, @"stableUrl");
  }
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  if (tombstonedPublicKeyIDs) {
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)tombstonedPublicKeyIDs, @"tombstonedPublicKeyIDs");
  }
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  if (zoneishPrimaryKeyId) {
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)zoneishPrimaryKeyId, @"zoneishPrimaryKeyId");
  }
  storageExpiration = self->_storageExpiration;
  if (storageExpiration)
  {
    v88 = objc_msgSend_dictionaryRepresentation(storageExpiration, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v89, (uint64_t)v88, @"storageExpiration");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v90 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v47, self->_expired);
    objc_msgSend_setObject_forKey_(v6, v91, (uint64_t)v90, @"expired");
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    v93 = objc_msgSend_dictionaryRepresentation(expirationTime, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v94, (uint64_t)v93, @"expirationTime");
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    v96 = objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v97, (uint64_t)v96, @"appliedCryptoFeatures");
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  if (protectionInfoKeysToRemove)
  {
    v99 = objc_msgSend_dictionaryRepresentation(protectionInfoKeysToRemove, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v100, (uint64_t)v99, @"protectionInfoKeysToRemove");
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  if (oneTimeStableUrlInfo)
  {
    v102 = objc_msgSend_dictionaryRepresentation(oneTimeStableUrlInfo, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v103, (uint64_t)v102, @"oneTimeStableUrlInfo");
  }
  chainProtectionInfoKeysToRemove = self->_chainProtectionInfoKeysToRemove;
  if (chainProtectionInfoKeysToRemove)
  {
    v105 = objc_msgSend_dictionaryRepresentation(chainProtectionInfoKeysToRemove, v47, (uint64_t)zoneishPrimaryKeyId);
    objc_msgSend_setObject_forKey_(v6, v106, (uint64_t)v105, @"chainProtectionInfoKeysToRemove");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_type) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_createdBy) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timeStatistics) {
    PBDataWriterWriteSubmessage();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = self->_fields;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, v52, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v45, v52, 16);
    }
    while (v8);
  }

  if (self->_shareId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_modifiedBy) {
    PBDataWriterWriteSubmessage();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v12 = self->_conflictLoserEtags;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v51, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v41, v51, 16);
    }
    while (v15);
  }

  if (self->_modifiedByDevice) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v19 = self->_pluginFields;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v50, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v37, v50, 16);
    }
    while (v22);
  }

  if (self->_protectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_shareInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_chainPrivateKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_chainProtectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_chainParent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stableUrl) {
    PBDataWriterWriteSubmessage();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = self->_tombstonedPublicKeyIDs;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, v49, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteDataField();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v33, v49, 16);
    }
    while (v29);
  }

  if (self->_zoneishPrimaryKeyId) {
    PBDataWriterWriteDataField();
  }
  if (self->_storageExpiration) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_expirationTime) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appliedCryptoFeatures) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_protectionInfoKeysToRemove) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_oneTimeStableUrlInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_chainProtectionInfoKeysToRemove) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v63 = a3;
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setEtag_(v63, v4, (uint64_t)etag);
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier) {
    objc_msgSend_setRecordIdentifier_(v63, v4, (uint64_t)recordIdentifier);
  }
  type = self->_type;
  if (type) {
    objc_msgSend_setType_(v63, v4, (uint64_t)type);
  }
  createdBy = self->_createdBy;
  if (createdBy) {
    objc_msgSend_setCreatedBy_(v63, v4, (uint64_t)createdBy);
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics) {
    objc_msgSend_setTimeStatistics_(v63, v4, (uint64_t)timeStatistics);
  }
  if (objc_msgSend_fieldsCount(self, v4, (uint64_t)timeStatistics))
  {
    objc_msgSend_clearFields(v63, v10, v11);
    uint64_t v14 = objc_msgSend_fieldsCount(self, v12, v13);
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v17 = objc_msgSend_fieldsAtIndex_(self, v10, i);
        objc_msgSend_addFields_(v63, v18, (uint64_t)v17);
      }
    }
  }
  shareId = self->_shareId;
  if (shareId) {
    objc_msgSend_setShareId_(v63, v10, (uint64_t)shareId);
  }
  modifiedBy = self->_modifiedBy;
  if (modifiedBy) {
    objc_msgSend_setModifiedBy_(v63, v10, (uint64_t)modifiedBy);
  }
  if (objc_msgSend_conflictLoserEtagsCount(self, v10, (uint64_t)modifiedBy))
  {
    objc_msgSend_clearConflictLoserEtags(v63, v21, v22);
    uint64_t v25 = objc_msgSend_conflictLoserEtagsCount(self, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v28 = objc_msgSend_conflictLoserEtagsAtIndex_(self, v21, j);
        objc_msgSend_addConflictLoserEtags_(v63, v29, (uint64_t)v28);
      }
    }
  }
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice) {
    objc_msgSend_setModifiedByDevice_(v63, v21, (uint64_t)modifiedByDevice);
  }
  if (objc_msgSend_pluginFieldsCount(self, v21, (uint64_t)modifiedByDevice))
  {
    objc_msgSend_clearPluginFields(v63, v31, v32);
    uint64_t v35 = objc_msgSend_pluginFieldsCount(self, v33, v34);
    if (v35)
    {
      uint64_t v36 = v35;
      for (uint64_t k = 0; k != v36; ++k)
      {
        long long v38 = objc_msgSend_pluginFieldsAtIndex_(self, v31, k);
        objc_msgSend_addPluginFields_(v63, v39, (uint64_t)v38);
      }
    }
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo) {
    objc_msgSend_setProtectionInfo_(v63, v31, (uint64_t)protectionInfo);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v63 + 28) = self->_permission;
    *((unsigned char *)v63 + 220) |= 1u;
  }
  shareInfo = self->_shareInfo;
  if (shareInfo) {
    objc_msgSend_setShareInfo_(v63, v31, (uint64_t)shareInfo);
  }
  chainPrivateKey = self->_chainPrivateKey;
  if (chainPrivateKey) {
    objc_msgSend_setChainPrivateKey_(v63, v31, (uint64_t)chainPrivateKey);
  }
  chainProtectionInfo = self->_chainProtectionInfo;
  if (chainProtectionInfo) {
    objc_msgSend_setChainProtectionInfo_(v63, v31, (uint64_t)chainProtectionInfo);
  }
  chainParent = self->_chainParent;
  if (chainParent) {
    objc_msgSend_setChainParent_(v63, v31, (uint64_t)chainParent);
  }
  stableUrl = self->_stableUrl;
  if (stableUrl) {
    objc_msgSend_setStableUrl_(v63, v31, (uint64_t)stableUrl);
  }
  if (objc_msgSend_tombstonedPublicKeyIDsCount(self, v31, (uint64_t)stableUrl))
  {
    objc_msgSend_clearTombstonedPublicKeyIDs(v63, v46, v47);
    uint64_t v50 = objc_msgSend_tombstonedPublicKeyIDsCount(self, v48, v49);
    if (v50)
    {
      uint64_t v51 = v50;
      for (uint64_t m = 0; m != v51; ++m)
      {
        uint64_t v53 = objc_msgSend_tombstonedPublicKeyIDsAtIndex_(self, v46, m);
        objc_msgSend_addTombstonedPublicKeyIDs_(v63, v54, (uint64_t)v53);
      }
    }
  }
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  if (zoneishPrimaryKeyId) {
    objc_msgSend_setZoneishPrimaryKeyId_(v63, v46, (uint64_t)zoneishPrimaryKeyId);
  }
  storageExpiration = self->_storageExpiration;
  uint64_t v57 = v63;
  if (storageExpiration)
  {
    objc_msgSend_setStorageExpiration_(v63, v46, (uint64_t)storageExpiration);
    uint64_t v57 = v63;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v57[216] = self->_expired;
    v57[220] |= 2u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v63, v46, (uint64_t)expirationTime);
    uint64_t v57 = v63;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v63, v46, (uint64_t)appliedCryptoFeatures);
    uint64_t v57 = v63;
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  if (protectionInfoKeysToRemove)
  {
    objc_msgSend_setProtectionInfoKeysToRemove_(v63, v46, (uint64_t)protectionInfoKeysToRemove);
    uint64_t v57 = v63;
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  if (oneTimeStableUrlInfo)
  {
    objc_msgSend_setOneTimeStableUrlInfo_(v63, v46, (uint64_t)oneTimeStableUrlInfo);
    uint64_t v57 = v63;
  }
  chainProtectionInfoKeysToRemove = self->_chainProtectionInfoKeysToRemove;
  if (chainProtectionInfoKeysToRemove)
  {
    objc_msgSend_setChainProtectionInfoKeysToRemove_(v63, v46, (uint64_t)chainProtectionInfoKeysToRemove);
    uint64_t v57 = v63;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_etag, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 144);
  *(void *)(v10 + 144) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_type, v17, (uint64_t)a3);
  uint64_t v19 = *(void **)(v10 + 200);
  *(void *)(v10 + 200) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_createdBy, v20, (uint64_t)a3);
  uint64_t v22 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_timeStatistics, v23, (uint64_t)a3);
  uint64_t v25 = *(void **)(v10 + 184);
  *(void *)(v10 + 184) = v24;

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v26 = self->_fields;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v123, v130, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v124;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v124 != v31) {
          objc_enumerationMutation(v26);
        }
        long long v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v123 + 1) + 8 * v32), v29, (uint64_t)a3);
        objc_msgSend_addFields_((void *)v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v123, v130, 16);
    }
    while (v30);
  }

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_shareId, v35, (uint64_t)a3);
  long long v37 = *(void **)(v10 + 152);
  *(void *)(v10 + 152) = v36;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_modifiedBy, v38, (uint64_t)a3);
  long long v40 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v39;

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v41 = self->_conflictLoserEtags;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v119, v129, 16);
  if (v43)
  {
    uint64_t v45 = v43;
    uint64_t v46 = *(void *)v120;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v120 != v46) {
          objc_enumerationMutation(v41);
        }
        long long v48 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v119 + 1) + 8 * v47), v44, (uint64_t)a3);
        objc_msgSend_addConflictLoserEtags_((void *)v10, v49, (uint64_t)v48);

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v119, v129, 16);
    }
    while (v45);
  }

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_modifiedByDevice, v50, (uint64_t)a3);
  uint64_t v52 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v51;

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v53 = self->_pluginFields;
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v115, v128, 16);
  if (v55)
  {
    uint64_t v57 = v55;
    uint64_t v58 = *(void *)v116;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v116 != v58) {
          objc_enumerationMutation(v53);
        }
        uint64_t v60 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v115 + 1) + 8 * v59), v56, (uint64_t)a3);
        objc_msgSend_addPluginFields_((void *)v10, v61, (uint64_t)v60);

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v115, v128, 16);
    }
    while (v57);
  }

  uint64_t v63 = objc_msgSend_copyWithZone_(self->_protectionInfo, v62, (uint64_t)a3);
  v64 = *(void **)(v10 + 128);
  *(void *)(v10 + 128) = v63;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 112) = self->_permission;
    *(unsigned char *)(v10 + 220) |= 1u;
  }
  uint64_t v66 = objc_msgSend_copyWithZone_(self->_shareInfo, v65, (uint64_t)a3);
  v67 = *(void **)(v10 + 160);
  *(void *)(v10 + 160) = v66;

  uint64_t v69 = objc_msgSend_copyWithZone_(self->_chainPrivateKey, v68, (uint64_t)a3);
  v70 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v69;

  uint64_t v72 = objc_msgSend_copyWithZone_(self->_chainProtectionInfo, v71, (uint64_t)a3);
  v73 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v72;

  uint64_t v75 = objc_msgSend_copyWithZone_(self->_chainParent, v74, (uint64_t)a3);
  v76 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v75;

  uint64_t v78 = objc_msgSend_copyWithZone_(self->_stableUrl, v77, (uint64_t)a3);
  v79 = *(void **)(v10 + 168);
  *(void *)(v10 + 168) = v78;

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v80 = self->_tombstonedPublicKeyIDs;
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v111, v127, 16);
  if (v82)
  {
    uint64_t v84 = v82;
    uint64_t v85 = *(void *)v112;
    do
    {
      uint64_t v86 = 0;
      do
      {
        if (*(void *)v112 != v85) {
          objc_enumerationMutation(v80);
        }
        v87 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v111 + 1) + 8 * v86), v83, (uint64_t)a3, (void)v111);
        objc_msgSend_addTombstonedPublicKeyIDs_((void *)v10, v88, (uint64_t)v87);

        ++v86;
      }
      while (v84 != v86);
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v111, v127, 16);
    }
    while (v84);
  }

  uint64_t v90 = objc_msgSend_copyWithZone_(self->_zoneishPrimaryKeyId, v89, (uint64_t)a3);
  v91 = *(void **)(v10 + 208);
  *(void *)(v10 + 208) = v90;

  uint64_t v93 = objc_msgSend_copyWithZone_(self->_storageExpiration, v92, (uint64_t)a3);
  v94 = *(void **)(v10 + 176);
  *(void *)(v10 + 176) = v93;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v10 + 216) = self->_expired;
    *(unsigned char *)(v10 + 220) |= 2u;
  }
  uint64_t v96 = objc_msgSend_copyWithZone_(self->_expirationTime, v95, (uint64_t)a3, (void)v111);
  v97 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v96;

  uint64_t v99 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v98, (uint64_t)a3);
  v100 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v99;

  uint64_t v102 = objc_msgSend_copyWithZone_(self->_protectionInfoKeysToRemove, v101, (uint64_t)a3);
  v103 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v102;

  uint64_t v105 = objc_msgSend_copyWithZone_(self->_oneTimeStableUrlInfo, v104, (uint64_t)a3);
  v106 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v105;

  uint64_t v108 = objc_msgSend_copyWithZone_(self->_chainProtectionInfoKeysToRemove, v107, (uint64_t)a3);
  long long v109 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v108;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_65;
  }
  etag = self->_etag;
  uint64_t v9 = v4[8];
  if ((unint64_t)etag | v9)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v9)) {
      goto LABEL_65;
    }
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v11 = v4[18];
  if ((unint64_t)recordIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v11)) {
      goto LABEL_65;
    }
  }
  type = self->_type;
  uint64_t v13 = v4[25];
  if ((unint64_t)type | v13)
  {
    if (!objc_msgSend_isEqual_(type, v7, v13)) {
      goto LABEL_65;
    }
  }
  createdBy = self->_createdBy;
  uint64_t v15 = v4[7];
  if ((unint64_t)createdBy | v15)
  {
    if (!objc_msgSend_isEqual_(createdBy, v7, v15)) {
      goto LABEL_65;
    }
  }
  timeStatistics = self->_timeStatistics;
  uint64_t v17 = v4[23];
  if ((unint64_t)timeStatistics | v17)
  {
    if (!objc_msgSend_isEqual_(timeStatistics, v7, v17)) {
      goto LABEL_65;
    }
  }
  fields = self->_fields;
  uint64_t v19 = v4[10];
  if ((unint64_t)fields | v19)
  {
    if (!objc_msgSend_isEqual_(fields, v7, v19)) {
      goto LABEL_65;
    }
  }
  shareId = self->_shareId;
  uint64_t v21 = v4[19];
  if ((unint64_t)shareId | v21)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v21)) {
      goto LABEL_65;
    }
  }
  modifiedBy = self->_modifiedBy;
  uint64_t v23 = v4[11];
  if ((unint64_t)modifiedBy | v23)
  {
    if (!objc_msgSend_isEqual_(modifiedBy, v7, v23)) {
      goto LABEL_65;
    }
  }
  conflictLoserEtags = self->_conflictLoserEtags;
  uint64_t v25 = v4[6];
  if ((unint64_t)conflictLoserEtags | v25)
  {
    if (!objc_msgSend_isEqual_(conflictLoserEtags, v7, v25)) {
      goto LABEL_65;
    }
  }
  modifiedByDevice = self->_modifiedByDevice;
  uint64_t v27 = v4[12];
  if ((unint64_t)modifiedByDevice | v27)
  {
    if (!objc_msgSend_isEqual_(modifiedByDevice, v7, v27)) {
      goto LABEL_65;
    }
  }
  pluginFields = self->_pluginFields;
  uint64_t v29 = v4[15];
  if ((unint64_t)pluginFields | v29)
  {
    if (!objc_msgSend_isEqual_(pluginFields, v7, v29)) {
      goto LABEL_65;
    }
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v31 = v4[16];
  if ((unint64_t)protectionInfo | v31)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v31)) {
      goto LABEL_65;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 220) & 1) == 0 || self->_permission != *((_DWORD *)v4 + 28)) {
      goto LABEL_65;
    }
  }
  else if (*((unsigned char *)v4 + 220))
  {
    goto LABEL_65;
  }
  shareInfo = self->_shareInfo;
  uint64_t v33 = v4[20];
  if ((unint64_t)shareInfo | v33 && !objc_msgSend_isEqual_(shareInfo, v7, v33)) {
    goto LABEL_65;
  }
  chainPrivateKey = self->_chainPrivateKey;
  uint64_t v35 = v4[3];
  if ((unint64_t)chainPrivateKey | v35)
  {
    if (!objc_msgSend_isEqual_(chainPrivateKey, v7, v35)) {
      goto LABEL_65;
    }
  }
  chainProtectionInfo = self->_chainProtectionInfo;
  uint64_t v37 = v4[4];
  if ((unint64_t)chainProtectionInfo | v37)
  {
    if (!objc_msgSend_isEqual_(chainProtectionInfo, v7, v37)) {
      goto LABEL_65;
    }
  }
  chainParent = self->_chainParent;
  uint64_t v39 = v4[2];
  if ((unint64_t)chainParent | v39)
  {
    if (!objc_msgSend_isEqual_(chainParent, v7, v39)) {
      goto LABEL_65;
    }
  }
  stableUrl = self->_stableUrl;
  uint64_t v41 = v4[21];
  if ((unint64_t)stableUrl | v41)
  {
    if (!objc_msgSend_isEqual_(stableUrl, v7, v41)) {
      goto LABEL_65;
    }
  }
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  uint64_t v43 = v4[24];
  if ((unint64_t)tombstonedPublicKeyIDs | v43)
  {
    if (!objc_msgSend_isEqual_(tombstonedPublicKeyIDs, v7, v43)) {
      goto LABEL_65;
    }
  }
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  uint64_t v45 = v4[26];
  if ((unint64_t)zoneishPrimaryKeyId | v45)
  {
    if (!objc_msgSend_isEqual_(zoneishPrimaryKeyId, v7, v45)) {
      goto LABEL_65;
    }
  }
  storageExpiration = self->_storageExpiration;
  uint64_t v47 = v4[22];
  if ((unint64_t)storageExpiration | v47)
  {
    if (!objc_msgSend_isEqual_(storageExpiration, v7, v47)) {
      goto LABEL_65;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 2) != 0)
    {
      if (self->_expired)
      {
        if (!*((unsigned char *)v4 + 216)) {
          goto LABEL_65;
        }
        goto LABEL_55;
      }
      if (!*((unsigned char *)v4 + 216)) {
        goto LABEL_55;
      }
    }
LABEL_65:
    char isEqual = 0;
    goto LABEL_66;
  }
  if ((*((unsigned char *)v4 + 220) & 2) != 0) {
    goto LABEL_65;
  }
LABEL_55:
  expirationTime = self->_expirationTime;
  uint64_t v49 = v4[9];
  if ((unint64_t)expirationTime | v49 && !objc_msgSend_isEqual_(expirationTime, v7, v49)) {
    goto LABEL_65;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v51 = v4[1];
  if ((unint64_t)appliedCryptoFeatures | v51)
  {
    if (!objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v51)) {
      goto LABEL_65;
    }
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  uint64_t v53 = v4[17];
  if ((unint64_t)protectionInfoKeysToRemove | v53)
  {
    if (!objc_msgSend_isEqual_(protectionInfoKeysToRemove, v7, v53)) {
      goto LABEL_65;
    }
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  uint64_t v55 = v4[13];
  if ((unint64_t)oneTimeStableUrlInfo | v55)
  {
    if (!objc_msgSend_isEqual_(oneTimeStableUrlInfo, v7, v55)) {
      goto LABEL_65;
    }
  }
  chainProtectionInfoKeysToRemove = self->_chainProtectionInfoKeysToRemove;
  uint64_t v57 = v4[5];
  if ((unint64_t)chainProtectionInfoKeysToRemove | v57) {
    char isEqual = objc_msgSend_isEqual_(chainProtectionInfoKeysToRemove, v7, v57);
  }
  else {
    char isEqual = 1;
  }
LABEL_66:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v80 = objc_msgSend_hash(self->_etag, a2, v2);
  uint64_t v79 = objc_msgSend_hash(self->_recordIdentifier, v4, v5);
  uint64_t v78 = objc_msgSend_hash(self->_type, v6, v7);
  uint64_t v77 = objc_msgSend_hash(self->_createdBy, v8, v9);
  uint64_t v76 = objc_msgSend_hash(self->_timeStatistics, v10, v11);
  uint64_t v75 = objc_msgSend_hash(self->_fields, v12, v13);
  uint64_t v74 = objc_msgSend_hash(self->_shareId, v14, v15);
  uint64_t v73 = objc_msgSend_hash(self->_modifiedBy, v16, v17);
  uint64_t v72 = objc_msgSend_hash(self->_conflictLoserEtags, v18, v19);
  uint64_t v71 = objc_msgSend_hash(self->_modifiedByDevice, v20, v21);
  uint64_t v70 = objc_msgSend_hash(self->_pluginFields, v22, v23);
  uint64_t v68 = objc_msgSend_hash(self->_protectionInfo, v24, v25);
  if (*(unsigned char *)&self->_has) {
    uint64_t v28 = 2654435761 * self->_permission;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = objc_msgSend_hash(self->_shareInfo, v26, v27, v68);
  uint64_t v32 = objc_msgSend_hash(self->_chainPrivateKey, v30, v31);
  uint64_t v35 = objc_msgSend_hash(self->_chainProtectionInfo, v33, v34);
  uint64_t v38 = objc_msgSend_hash(self->_chainParent, v36, v37);
  uint64_t v41 = objc_msgSend_hash(self->_stableUrl, v39, v40);
  uint64_t v44 = objc_msgSend_hash(self->_tombstonedPublicKeyIDs, v42, v43);
  uint64_t v47 = objc_msgSend_hash(self->_zoneishPrimaryKeyId, v45, v46);
  uint64_t v50 = objc_msgSend_hash(self->_storageExpiration, v48, v49);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v53 = 2654435761 * self->_expired;
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v54 = v79 ^ v80 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v28 ^ v29 ^ v32 ^ v35 ^ v38 ^ v41 ^ v44 ^ v47 ^ v50 ^ v53;
  uint64_t v55 = objc_msgSend_hash(self->_expirationTime, v51, v52);
  uint64_t v58 = v55 ^ objc_msgSend_hash(self->_appliedCryptoFeatures, v56, v57);
  uint64_t v61 = v58 ^ objc_msgSend_hash(self->_protectionInfoKeysToRemove, v59, v60);
  uint64_t v64 = v61 ^ objc_msgSend_hash(self->_oneTimeStableUrlInfo, v62, v63);
  return v54 ^ v64 ^ objc_msgSend_hash(self->_chainProtectionInfoKeysToRemove, v65, v66);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 8);
  if (v6) {
    objc_msgSend_setEtag_(self, v4, v6);
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v8 = *((void *)v5 + 18);
  if (recordIdentifier)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v8);
  }
  type = self->_type;
  uint64_t v10 = *((void *)v5 + 25);
  if (type)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(type, v4, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setType_(self, v4, v10);
  }
  createdBy = self->_createdBy;
  uint64_t v12 = *((void *)v5 + 7);
  if (createdBy)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(createdBy, v4, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setCreatedBy_(self, v4, v12);
  }
  timeStatistics = self->_timeStatistics;
  uint64_t v14 = *((void *)v5 + 23);
  if (timeStatistics)
  {
    if (v14) {
      objc_msgSend_mergeFrom_(timeStatistics, v4, v14);
    }
  }
  else if (v14)
  {
    objc_msgSend_setTimeStatistics_(self, v4, v14);
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v15 = *((id *)v5 + 10);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v88, v95, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v89 != v20) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend_addFields_(self, v18, *(void *)(*((void *)&v88 + 1) + 8 * i));
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v88, v95, 16);
    }
    while (v19);
  }

  shareId = self->_shareId;
  uint64_t v24 = *((void *)v5 + 19);
  if (shareId)
  {
    if (v24) {
      objc_msgSend_mergeFrom_(shareId, v22, v24);
    }
  }
  else if (v24)
  {
    objc_msgSend_setShareId_(self, v22, v24);
  }
  modifiedBy = self->_modifiedBy;
  uint64_t v26 = *((void *)v5 + 11);
  if (modifiedBy)
  {
    if (v26) {
      objc_msgSend_mergeFrom_(modifiedBy, v22, v26);
    }
  }
  else if (v26)
  {
    objc_msgSend_setModifiedBy_(self, v22, v26);
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v27 = *((id *)v5 + 6);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v84, v94, 16);
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v85 != v32) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend_addConflictLoserEtags_(self, v30, *(void *)(*((void *)&v84 + 1) + 8 * j));
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v84, v94, 16);
    }
    while (v31);
  }

  uint64_t v35 = *((void *)v5 + 12);
  if (v35) {
    objc_msgSend_setModifiedByDevice_(self, v34, v35);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v36 = *((id *)v5 + 15);
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v80, v93, 16);
  if (v38)
  {
    uint64_t v40 = v38;
    uint64_t v41 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v81 != v41) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend_addPluginFields_(self, v39, *(void *)(*((void *)&v80 + 1) + 8 * k));
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v80, v93, 16);
    }
    while (v40);
  }

  protectionInfo = self->_protectionInfo;
  uint64_t v45 = *((void *)v5 + 16);
  if (protectionInfo)
  {
    if (v45) {
      objc_msgSend_mergeFrom_(protectionInfo, v43, v45);
    }
  }
  else if (v45)
  {
    objc_msgSend_setProtectionInfo_(self, v43, v45);
  }
  if (*((unsigned char *)v5 + 220))
  {
    self->_int permission = *((_DWORD *)v5 + 28);
    *(unsigned char *)&self->_has |= 1u;
  }
  shareInfo = self->_shareInfo;
  uint64_t v47 = *((void *)v5 + 20);
  if (shareInfo)
  {
    if (v47) {
      objc_msgSend_mergeFrom_(shareInfo, v43, v47);
    }
  }
  else if (v47)
  {
    objc_msgSend_setShareInfo_(self, v43, v47);
  }
  uint64_t v48 = *((void *)v5 + 3);
  if (v48) {
    objc_msgSend_setChainPrivateKey_(self, v43, v48);
  }
  chainProtectionInfo = self->_chainProtectionInfo;
  uint64_t v50 = *((void *)v5 + 4);
  if (chainProtectionInfo)
  {
    if (v50) {
      objc_msgSend_mergeFrom_(chainProtectionInfo, v43, v50);
    }
  }
  else if (v50)
  {
    objc_msgSend_setChainProtectionInfo_(self, v43, v50);
  }
  chainParent = self->_chainParent;
  uint64_t v52 = *((void *)v5 + 2);
  if (chainParent)
  {
    if (v52) {
      objc_msgSend_mergeFrom_(chainParent, v43, v52);
    }
  }
  else if (v52)
  {
    objc_msgSend_setChainParent_(self, v43, v52);
  }
  stableUrl = self->_stableUrl;
  uint64_t v54 = *((void *)v5 + 21);
  if (stableUrl)
  {
    if (v54) {
      objc_msgSend_mergeFrom_(stableUrl, v43, v54);
    }
  }
  else if (v54)
  {
    objc_msgSend_setStableUrl_(self, v43, v54);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v55 = *((id *)v5 + 24);
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v76, v92, 16);
  if (v57)
  {
    uint64_t v59 = v57;
    uint64_t v60 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v59; ++m)
      {
        if (*(void *)v77 != v60) {
          objc_enumerationMutation(v55);
        }
        objc_msgSend_addTombstonedPublicKeyIDs_(self, v58, *(void *)(*((void *)&v76 + 1) + 8 * m), (void)v76);
      }
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v76, v92, 16);
    }
    while (v59);
  }

  uint64_t v63 = *((void *)v5 + 26);
  if (v63) {
    objc_msgSend_setZoneishPrimaryKeyId_(self, v62, v63);
  }
  storageExpiration = self->_storageExpiration;
  uint64_t v65 = *((void *)v5 + 22);
  if (storageExpiration)
  {
    if (v65) {
      objc_msgSend_mergeFrom_(storageExpiration, v62, v65);
    }
  }
  else if (v65)
  {
    objc_msgSend_setStorageExpiration_(self, v62, v65);
  }
  if ((*((unsigned char *)v5 + 220) & 2) != 0)
  {
    self->_expired = *((unsigned char *)v5 + 216);
    *(unsigned char *)&self->_has |= 2u;
  }
  expirationTime = self->_expirationTime;
  uint64_t v67 = *((void *)v5 + 9);
  if (expirationTime)
  {
    if (v67) {
      objc_msgSend_mergeFrom_(expirationTime, v62, v67);
    }
  }
  else if (v67)
  {
    objc_msgSend_setExpirationTime_(self, v62, v67);
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v69 = *((void *)v5 + 1);
  if (appliedCryptoFeatures)
  {
    if (v69) {
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v62, v69);
    }
  }
  else if (v69)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v62, v69);
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  uint64_t v71 = *((void *)v5 + 17);
  if (protectionInfoKeysToRemove)
  {
    if (v71) {
      objc_msgSend_mergeFrom_(protectionInfoKeysToRemove, v62, v71);
    }
  }
  else if (v71)
  {
    objc_msgSend_setProtectionInfoKeysToRemove_(self, v62, v71);
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  uint64_t v73 = *((void *)v5 + 13);
  if (oneTimeStableUrlInfo)
  {
    if (v73) {
      objc_msgSend_mergeFrom_(oneTimeStableUrlInfo, v62, v73);
    }
  }
  else if (v73)
  {
    objc_msgSend_setOneTimeStableUrlInfo_(self, v62, v73);
  }
  chainProtectionInfoKeysToRemove = self->_chainProtectionInfoKeysToRemove;
  uint64_t v75 = *((void *)v5 + 5);
  if (chainProtectionInfoKeysToRemove)
  {
    if (v75) {
      objc_msgSend_mergeFrom_(chainProtectionInfoKeysToRemove, v62, v75);
    }
  }
  else if (v75)
  {
    objc_msgSend_setChainProtectionInfoKeysToRemove_(self, v62, v75);
  }
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (CKDPIdentifier)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
}

- (CKDPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (void)setTimeStatistics:(id)a3
{
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
}

- (CKDPIdentifier)modifiedBy
{
  return self->_modifiedBy;
}

- (void)setModifiedBy:(id)a3
{
}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
}

- (NSString)modifiedByDevice
{
  return self->_modifiedByDevice;
}

- (void)setModifiedByDevice:(id)a3
{
}

- (NSMutableArray)pluginFields
{
  return self->_pluginFields;
}

- (void)setPluginFields:(id)a3
{
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (CKDPShare)shareInfo
{
  return self->_shareInfo;
}

- (void)setShareInfo:(id)a3
{
}

- (NSData)chainPrivateKey
{
  return self->_chainPrivateKey;
}

- (void)setChainPrivateKey:(id)a3
{
}

- (CKDPProtectionInfo)chainProtectionInfo
{
  return self->_chainProtectionInfo;
}

- (void)setChainProtectionInfo:(id)a3
{
}

- (CKDPRecordChainParent)chainParent
{
  return self->_chainParent;
}

- (void)setChainParent:(id)a3
{
}

- (CKDPRecordStableUrl)stableUrl
{
  return self->_stableUrl;
}

- (void)setStableUrl:(id)a3
{
}

- (NSMutableArray)tombstonedPublicKeyIDs
{
  return self->_tombstonedPublicKeyIDs;
}

- (void)setTombstonedPublicKeyIDs:(id)a3
{
}

- (NSData)zoneishPrimaryKeyId
{
  return self->_zoneishPrimaryKeyId;
}

- (void)setZoneishPrimaryKeyId:(id)a3
{
}

- (CKDPStorageExpiration)storageExpiration
{
  return self->_storageExpiration;
}

- (void)setStorageExpiration:(id)a3
{
}

- (BOOL)expired
{
  return self->_expired;
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
}

- (CKDPRecordCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
}

- (CKDPProtectionInfoKeysToRemove)protectionInfoKeysToRemove
{
  return self->_protectionInfoKeysToRemove;
}

- (void)setProtectionInfoKeysToRemove:(id)a3
{
}

- (CKDPRecordOneTimeStableUrlInfo)oneTimeStableUrlInfo
{
  return self->_oneTimeStableUrlInfo;
}

- (void)setOneTimeStableUrlInfo:(id)a3
{
}

- (CKDPProtectionInfoKeysToRemove)chainProtectionInfoKeysToRemove
{
  return self->_chainProtectionInfoKeysToRemove;
}

- (void)setChainProtectionInfoKeysToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneishPrimaryKeyId, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_tombstonedPublicKeyIDs, 0);
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_storageExpiration, 0);
  objc_storeStrong((id *)&self->_stableUrl, 0);
  objc_storeStrong((id *)&self->_shareInfo, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_oneTimeStableUrlInfo, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_modifiedBy, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_chainProtectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_chainProtectionInfo, 0);
  objc_storeStrong((id *)&self->_chainPrivateKey, 0);
  objc_storeStrong((id *)&self->_chainParent, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

- (id)_permissionAsString
{
  uint64_t v3 = objc_msgSend_permission(self, a2, v2);
  if (v3 == 1)
  {
    id v5 = @"readOnly";
  }
  else if (v3 == 2)
  {
    id v5 = @"readWrite";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
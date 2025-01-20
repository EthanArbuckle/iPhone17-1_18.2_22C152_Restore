@interface CKDPMergeableDeltaMetadata
+ (Class)replacedDeltaIdentifiersType;
- (BOOL)hasEncryptedTimestamps;
- (BOOL)hasIdentifier;
- (BOOL)hasProtectionInfo;
- (BOOL)hasTimestamps;
- (BOOL)hasTimestampsAuthTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDistributedTimestamps)timestamps;
- (CKDPProtectionInfo)protectionInfo;
- (NSData)encryptedTimestamps;
- (NSData)timestampsAuthTag;
- (NSMutableArray)replacedDeltaIdentifiers;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)replacedDeltaIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)replacedDeltaIdentifiersCount;
- (void)addReplacedDeltaIdentifiers:(id)a3;
- (void)clearReplacedDeltaIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedTimestamps:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setReplacedDeltaIdentifiers:(id)a3;
- (void)setTimestamps:(id)a3;
- (void)setTimestampsAuthTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPMergeableDeltaMetadata

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasEncryptedTimestamps
{
  return self->_encryptedTimestamps != 0;
}

- (BOOL)hasTimestamps
{
  return self->_timestamps != 0;
}

- (BOOL)hasTimestampsAuthTag
{
  return self->_timestampsAuthTag != 0;
}

- (void)clearReplacedDeltaIdentifiers
{
  objc_msgSend_removeAllObjects(self->_replacedDeltaIdentifiers, a2, v2);
}

- (void)addReplacedDeltaIdentifiers:(id)a3
{
  v4 = (const char *)a3;
  replacedDeltaIdentifiers = self->_replacedDeltaIdentifiers;
  v8 = (char *)v4;
  if (!replacedDeltaIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_replacedDeltaIdentifiers;
    self->_replacedDeltaIdentifiers = v6;

    v4 = v8;
    replacedDeltaIdentifiers = self->_replacedDeltaIdentifiers;
  }
  objc_msgSend_addObject_(replacedDeltaIdentifiers, v4, (uint64_t)v4);
}

- (unint64_t)replacedDeltaIdentifiersCount
{
  return objc_msgSend_count(self->_replacedDeltaIdentifiers, a2, v2);
}

- (id)replacedDeltaIdentifiersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_replacedDeltaIdentifiers, a2, a3);
}

+ (Class)replacedDeltaIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPMergeableDeltaMetadata;
  v4 = [(CKDPMergeableDeltaMetadata *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)identifier, @"identifier");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v9 = objc_msgSend_dictionaryRepresentation(protectionInfo, v5, (uint64_t)identifier);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"protectionInfo");
  }
  encryptedTimestamps = self->_encryptedTimestamps;
  if (encryptedTimestamps) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedTimestamps, @"encryptedTimestamps");
  }
  timestamps = self->_timestamps;
  if (timestamps)
  {
    v13 = objc_msgSend_dictionaryRepresentation(timestamps, v5, (uint64_t)encryptedTimestamps);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"timestamps");
  }
  timestampsAuthTag = self->_timestampsAuthTag;
  if (timestampsAuthTag) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)timestampsAuthTag, @"timestampsAuthTag");
  }
  replacedDeltaIdentifiers = self->_replacedDeltaIdentifiers;
  if (replacedDeltaIdentifiers) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)replacedDeltaIdentifiers, @"replacedDeltaIdentifiers");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5010554((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_protectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_encryptedTimestamps) {
    PBDataWriterWriteDataField();
  }
  if (self->_timestamps) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timestampsAuthTag) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_replacedDeltaIdentifiers;
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
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setIdentifier_(v20, v4, (uint64_t)identifier);
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo) {
    objc_msgSend_setProtectionInfo_(v20, v4, (uint64_t)protectionInfo);
  }
  encryptedTimestamps = self->_encryptedTimestamps;
  if (encryptedTimestamps) {
    objc_msgSend_setEncryptedTimestamps_(v20, v4, (uint64_t)encryptedTimestamps);
  }
  timestamps = self->_timestamps;
  if (timestamps) {
    objc_msgSend_setTimestamps_(v20, v4, (uint64_t)timestamps);
  }
  timestampsAuthTag = self->_timestampsAuthTag;
  if (timestampsAuthTag) {
    objc_msgSend_setTimestampsAuthTag_(v20, v4, (uint64_t)timestampsAuthTag);
  }
  if (objc_msgSend_replacedDeltaIdentifiersCount(self, v4, (uint64_t)timestampsAuthTag))
  {
    objc_msgSend_clearReplacedDeltaIdentifiers(v20, v10, v11);
    uint64_t v14 = objc_msgSend_replacedDeltaIdentifiersCount(self, v12, v13);
    if (v14)
    {
      uint64_t v16 = v14;
      for (uint64_t i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_replacedDeltaIdentifiersAtIndex_(self, v15, i);
        objc_msgSend_addReplacedDeltaIdentifiers_(v20, v19, (uint64_t)v18);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectionInfo, v14, (uint64_t)a3);
  uint64_t v16 = (void *)v10[3];
  v10[3] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_encryptedTimestamps, v17, (uint64_t)a3);
  v19 = (void *)v10[1];
  v10[1] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_timestamps, v20, (uint64_t)a3);
  v22 = (void *)v10[5];
  v10[5] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_timestampsAuthTag, v23, (uint64_t)a3);
  v25 = (void *)v10[6];
  v10[6] = v24;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v26 = self->_replacedDeltaIdentifiers;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v36, v40, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v37;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v26);
        }
        v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v36 + 1) + 8 * v32), v29, (uint64_t)a3, (void)v36);
        objc_msgSend_addReplacedDeltaIdentifiers_(v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v36, v40, 16);
    }
    while (v30);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[2];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_14;
    }
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v11 = v4[3];
  if ((unint64_t)protectionInfo | v11)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v11)) {
      goto LABEL_14;
    }
  }
  if (((encryptedTimestamps = self->_encryptedTimestamps, uint64_t v13 = v4[1], !((unint64_t)encryptedTimestamps | v13))
     || objc_msgSend_isEqual_(encryptedTimestamps, v7, v13))
    && ((timestamps = self->_timestamps, uint64_t v15 = v4[5], !((unint64_t)timestamps | v15))
     || objc_msgSend_isEqual_(timestamps, v7, v15))
    && ((timestampsAuthTag = self->_timestampsAuthTag, uint64_t v17 = v4[6], !((unint64_t)timestampsAuthTag | v17))
     || objc_msgSend_isEqual_(timestampsAuthTag, v7, v17)))
  {
    replacedDeltaIdentifiers = self->_replacedDeltaIdentifiers;
    uint64_t v19 = v4[4];
    if ((unint64_t)replacedDeltaIdentifiers | v19) {
      char isEqual = objc_msgSend_isEqual_(replacedDeltaIdentifiers, v7, v19);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_14:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_protectionInfo, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_encryptedTimestamps, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_timestamps, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_timestampsAuthTag, v14, v15);
  return v13 ^ v16 ^ objc_msgSend_hash(self->_replacedDeltaIdentifiers, v17, v18);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 2);
  if (v6) {
    objc_msgSend_setIdentifier_(self, v4, v6);
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v8 = *((void *)v5 + 3);
  if (protectionInfo)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(protectionInfo, v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setProtectionInfo_(self, v4, v8);
  }
  uint64_t v9 = *((void *)v5 + 1);
  if (v9) {
    objc_msgSend_setEncryptedTimestamps_(self, v4, v9);
  }
  timestamps = self->_timestamps;
  uint64_t v11 = *((void *)v5 + 5);
  if (timestamps)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(timestamps, v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setTimestamps_(self, v4, v11);
  }
  uint64_t v12 = *((void *)v5 + 6);
  if (v12) {
    objc_msgSend_setTimestampsAuthTag_(self, v4, v12);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = *((id *)v5 + 4);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v20, v24, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addReplacedDeltaIdentifiers_(self, v16, *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v20, v24, 16);
    }
    while (v17);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSData)encryptedTimestamps
{
  return self->_encryptedTimestamps;
}

- (void)setEncryptedTimestamps:(id)a3
{
}

- (CKDPDistributedTimestamps)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (NSData)timestampsAuthTag
{
  return self->_timestampsAuthTag;
}

- (void)setTimestampsAuthTag:(id)a3
{
}

- (NSMutableArray)replacedDeltaIdentifiers
{
  return self->_replacedDeltaIdentifiers;
}

- (void)setReplacedDeltaIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampsAuthTag, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_replacedDeltaIdentifiers, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_encryptedTimestamps, 0);
}

@end
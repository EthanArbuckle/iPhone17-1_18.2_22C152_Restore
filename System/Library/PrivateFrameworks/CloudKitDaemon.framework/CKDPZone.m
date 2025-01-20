@interface CKDPZone
+ (Class)protectionInfoKeysToRemoveType;
- (BOOL)hasAppliedCryptoFeatures;
- (BOOL)hasEtag;
- (BOOL)hasParentReference;
- (BOOL)hasProtectionInfo;
- (BOOL)hasRecordProtectionInfo;
- (BOOL)hasRecordProtectionInfoKeysToRemove;
- (BOOL)hasShareId;
- (BOOL)hasSignedCryptoRequirements;
- (BOOL)hasStableUrl;
- (BOOL)hasStorageExpiration;
- (BOOL)hasZoneIdentifier;
- (BOOL)hasZoneProtectionInfoKeysToRemove;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPProtectionInfo)recordProtectionInfo;
- (CKDPProtectionInfoKeysToRemove)recordProtectionInfoKeysToRemove;
- (CKDPProtectionInfoKeysToRemove)zoneProtectionInfoKeysToRemove;
- (CKDPRecordStableUrl)stableUrl;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPShareIdentifier)shareId;
- (CKDPStorageExpiration)storageExpiration;
- (CKDPZoneCryptoFeatureSet)appliedCryptoFeatures;
- (CKDPZoneSignedCryptoRequirements)signedCryptoRequirements;
- (CKDPZoneZoneReference)parentReference;
- (NSMutableArray)protectionInfoKeysToRemoves;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protectionInfoKeysToRemoveAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)protectionInfoKeysToRemovesCount;
- (void)addProtectionInfoKeysToRemove:(id)a3;
- (void)clearProtectionInfoKeysToRemoves;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppliedCryptoFeatures:(id)a3;
- (void)setEtag:(id)a3;
- (void)setParentReference:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setProtectionInfoKeysToRemoves:(id)a3;
- (void)setRecordProtectionInfo:(id)a3;
- (void)setRecordProtectionInfoKeysToRemove:(id)a3;
- (void)setShareId:(id)a3;
- (void)setSignedCryptoRequirements:(id)a3;
- (void)setStableUrl:(id)a3;
- (void)setStorageExpiration:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)setZoneProtectionInfoKeysToRemove:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZone

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasRecordProtectionInfo
{
  return self->_recordProtectionInfo != 0;
}

- (BOOL)hasStableUrl
{
  return self->_stableUrl != 0;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (void)clearProtectionInfoKeysToRemoves
{
  objc_msgSend_removeAllObjects(self->_protectionInfoKeysToRemoves, a2, v2);
}

- (void)addProtectionInfoKeysToRemove:(id)a3
{
  v4 = (const char *)a3;
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  v8 = (char *)v4;
  if (!protectionInfoKeysToRemoves)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_protectionInfoKeysToRemoves;
    self->_protectionInfoKeysToRemoves = v6;

    v4 = v8;
    protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  }
  objc_msgSend_addObject_(protectionInfoKeysToRemoves, v4, (uint64_t)v4);
}

- (unint64_t)protectionInfoKeysToRemovesCount
{
  return objc_msgSend_count(self->_protectionInfoKeysToRemoves, a2, v2);
}

- (id)protectionInfoKeysToRemoveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_protectionInfoKeysToRemoves, a2, a3);
}

+ (Class)protectionInfoKeysToRemoveType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStorageExpiration
{
  return self->_storageExpiration != 0;
}

- (BOOL)hasSignedCryptoRequirements
{
  return self->_signedCryptoRequirements != 0;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
}

- (BOOL)hasZoneProtectionInfoKeysToRemove
{
  return self->_zoneProtectionInfoKeysToRemove != 0;
}

- (BOOL)hasRecordProtectionInfoKeysToRemove
{
  return self->_recordProtectionInfoKeysToRemove != 0;
}

- (BOOL)hasParentReference
{
  return self->_parentReference != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZone;
  v4 = [(CKDPZone *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(protectionInfo, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"protectionInfo");
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo)
  {
    v14 = objc_msgSend_dictionaryRepresentation(recordProtectionInfo, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"recordProtectionInfo");
  }
  stableUrl = self->_stableUrl;
  if (stableUrl)
  {
    v17 = objc_msgSend_dictionaryRepresentation(stableUrl, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"stableUrl");
  }
  shareId = self->_shareId;
  if (shareId)
  {
    v20 = objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"shareId");
  }
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  if (protectionInfoKeysToRemoves) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)protectionInfoKeysToRemoves, @"protectionInfoKeysToRemove");
  }
  storageExpiration = self->_storageExpiration;
  if (storageExpiration)
  {
    v24 = objc_msgSend_dictionaryRepresentation(storageExpiration, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"storageExpiration");
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  if (signedCryptoRequirements)
  {
    v27 = objc_msgSend_dictionaryRepresentation(signedCryptoRequirements, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v27, @"signedCryptoRequirements");
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    v30 = objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, @"appliedCryptoFeatures");
  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  if (zoneProtectionInfoKeysToRemove)
  {
    v33 = objc_msgSend_dictionaryRepresentation(zoneProtectionInfoKeysToRemove, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, @"zoneProtectionInfoKeysToRemove");
  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  if (recordProtectionInfoKeysToRemove)
  {
    v36 = objc_msgSend_dictionaryRepresentation(recordProtectionInfoKeysToRemove, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, @"recordProtectionInfoKeysToRemove");
  }
  parentReference = self->_parentReference;
  if (parentReference)
  {
    v39 = objc_msgSend_dictionaryRepresentation(parentReference, v4, (uint64_t)protectionInfoKeysToRemoves);
    objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, @"parentReference");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E22544((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_zoneIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_protectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordProtectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stableUrl) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_shareId) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_protectionInfoKeysToRemoves;
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
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_storageExpiration) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_signedCryptoRequirements) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appliedCryptoFeatures) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_zoneProtectionInfoKeysToRemove) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordProtectionInfoKeysToRemove) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_parentReference) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v27 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier) {
    objc_msgSend_setZoneIdentifier_(v27, v4, (uint64_t)zoneIdentifier);
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo) {
    objc_msgSend_setProtectionInfo_(v27, v4, (uint64_t)protectionInfo);
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo) {
    objc_msgSend_setRecordProtectionInfo_(v27, v4, (uint64_t)recordProtectionInfo);
  }
  stableUrl = self->_stableUrl;
  if (stableUrl) {
    objc_msgSend_setStableUrl_(v27, v4, (uint64_t)stableUrl);
  }
  shareId = self->_shareId;
  if (shareId) {
    objc_msgSend_setShareId_(v27, v4, (uint64_t)shareId);
  }
  if (objc_msgSend_protectionInfoKeysToRemovesCount(self, v4, (uint64_t)shareId))
  {
    objc_msgSend_clearProtectionInfoKeysToRemoves(v27, v10, v11);
    uint64_t v14 = objc_msgSend_protectionInfoKeysToRemovesCount(self, v12, v13);
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v17 = objc_msgSend_protectionInfoKeysToRemoveAtIndex_(self, v10, i);
        objc_msgSend_addProtectionInfoKeysToRemove_(v27, v18, (uint64_t)v17);
      }
    }
  }
  storageExpiration = self->_storageExpiration;
  if (storageExpiration) {
    objc_msgSend_setStorageExpiration_(v27, v10, (uint64_t)storageExpiration);
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  v21 = v27;
  if (signedCryptoRequirements)
  {
    objc_msgSend_setSignedCryptoRequirements_(v27, v10, (uint64_t)signedCryptoRequirements);
    v21 = v27;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v27, v10, (uint64_t)appliedCryptoFeatures);
    v21 = v27;
  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  if (zoneProtectionInfoKeysToRemove)
  {
    objc_msgSend_setZoneProtectionInfoKeysToRemove_(v27, v10, (uint64_t)zoneProtectionInfoKeysToRemove);
    v21 = v27;
  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  if (recordProtectionInfoKeysToRemove)
  {
    objc_msgSend_setRecordProtectionInfoKeysToRemove_(v27, v10, (uint64_t)recordProtectionInfoKeysToRemove);
    v21 = v27;
  }
  parentReference = self->_parentReference;
  if (parentReference)
  {
    objc_msgSend_setParentReference_(v27, v10, (uint64_t)parentReference);
    v21 = v27;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v27, v10, (uint64_t)etag);
    v21 = v27;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[12];
  v10[12] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectionInfo, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_recordProtectionInfo, v17, (uint64_t)a3);
  v19 = (void *)v10[6];
  v10[6] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_stableUrl, v20, (uint64_t)a3);
  v22 = (void *)v10[10];
  v10[10] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_shareId, v23, (uint64_t)a3);
  v25 = (void *)v10[8];
  v10[8] = v24;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v26 = self->_protectionInfoKeysToRemoves;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v57, v61, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v58;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(v26);
        }
        v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v57 + 1) + 8 * v32), v29, (uint64_t)a3, (void)v57);
        objc_msgSend_addProtectionInfoKeysToRemove_(v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v57, v61, 16);
    }
    while (v30);
  }

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_storageExpiration, v35, (uint64_t)a3);
  v37 = (void *)v10[11];
  v10[11] = v36;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_signedCryptoRequirements, v38, (uint64_t)a3);
  v40 = (void *)v10[9];
  v10[9] = v39;

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v41, (uint64_t)a3);
  v43 = (void *)v10[1];
  v10[1] = v42;

  uint64_t v45 = objc_msgSend_copyWithZone_(self->_zoneProtectionInfoKeysToRemove, v44, (uint64_t)a3);
  v46 = (void *)v10[13];
  v10[13] = v45;

  uint64_t v48 = objc_msgSend_copyWithZone_(self->_recordProtectionInfoKeysToRemove, v47, (uint64_t)a3);
  v49 = (void *)v10[7];
  v10[7] = v48;

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_parentReference, v50, (uint64_t)a3);
  v52 = (void *)v10[3];
  v10[3] = v51;

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_etag, v53, (uint64_t)a3);
  v55 = (void *)v10[2];
  v10[2] = v54;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_28;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[12];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_28;
    }
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v11 = v4[4];
  if ((unint64_t)protectionInfo | v11)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v11)) {
      goto LABEL_28;
    }
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  uint64_t v13 = v4[6];
  if ((unint64_t)recordProtectionInfo | v13)
  {
    if (!objc_msgSend_isEqual_(recordProtectionInfo, v7, v13)) {
      goto LABEL_28;
    }
  }
  stableUrl = self->_stableUrl;
  uint64_t v15 = v4[10];
  if ((unint64_t)stableUrl | v15)
  {
    if (!objc_msgSend_isEqual_(stableUrl, v7, v15)) {
      goto LABEL_28;
    }
  }
  shareId = self->_shareId;
  uint64_t v17 = v4[8];
  if ((unint64_t)shareId | v17)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v17)) {
      goto LABEL_28;
    }
  }
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  uint64_t v19 = v4[5];
  if ((unint64_t)protectionInfoKeysToRemoves | v19)
  {
    if (!objc_msgSend_isEqual_(protectionInfoKeysToRemoves, v7, v19)) {
      goto LABEL_28;
    }
  }
  storageExpiration = self->_storageExpiration;
  uint64_t v21 = v4[11];
  if ((unint64_t)storageExpiration | v21)
  {
    if (!objc_msgSend_isEqual_(storageExpiration, v7, v21)) {
      goto LABEL_28;
    }
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  uint64_t v23 = v4[9];
  if ((unint64_t)signedCryptoRequirements | v23)
  {
    if (!objc_msgSend_isEqual_(signedCryptoRequirements, v7, v23)) {
      goto LABEL_28;
    }
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v25 = v4[1];
  if ((unint64_t)appliedCryptoFeatures | v25)
  {
    if (!objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v25)) {
      goto LABEL_28;
    }
  }
  if (((zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove,
         uint64_t v27 = v4[13],
         !((unint64_t)zoneProtectionInfoKeysToRemove | v27))
     || objc_msgSend_isEqual_(zoneProtectionInfoKeysToRemove, v7, v27))
    && ((recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove,
         uint64_t v29 = v4[7],
         !((unint64_t)recordProtectionInfoKeysToRemove | v29))
     || objc_msgSend_isEqual_(recordProtectionInfoKeysToRemove, v7, v29))
    && ((parentReference = self->_parentReference, uint64_t v31 = v4[3], !((unint64_t)parentReference | v31))
     || objc_msgSend_isEqual_(parentReference, v7, v31)))
  {
    etag = self->_etag;
    uint64_t v33 = v4[2];
    if ((unint64_t)etag | v33) {
      char isEqual = objc_msgSend_isEqual_(etag, v7, v33);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_28:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_protectionInfo, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_recordProtectionInfo, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_stableUrl, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_shareId, v14, v15);
  uint64_t v19 = v16 ^ objc_msgSend_hash(self->_protectionInfoKeysToRemoves, v17, v18);
  uint64_t v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_storageExpiration, v20, v21);
  uint64_t v25 = objc_msgSend_hash(self->_signedCryptoRequirements, v23, v24);
  uint64_t v28 = v25 ^ objc_msgSend_hash(self->_appliedCryptoFeatures, v26, v27);
  uint64_t v31 = v28 ^ objc_msgSend_hash(self->_zoneProtectionInfoKeysToRemove, v29, v30);
  uint64_t v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordProtectionInfoKeysToRemove, v32, v33);
  uint64_t v37 = objc_msgSend_hash(self->_parentReference, v35, v36);
  return v34 ^ v37 ^ objc_msgSend_hash(self->_etag, v38, v39);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v7 = *((void *)v5 + 12);
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
  protectionInfo = self->_protectionInfo;
  uint64_t v9 = *((void *)v5 + 4);
  if (protectionInfo)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(protectionInfo, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setProtectionInfo_(self, v4, v9);
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  uint64_t v11 = *((void *)v5 + 6);
  if (recordProtectionInfo)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(recordProtectionInfo, v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setRecordProtectionInfo_(self, v4, v11);
  }
  stableUrl = self->_stableUrl;
  uint64_t v13 = *((void *)v5 + 10);
  if (stableUrl)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(stableUrl, v4, v13);
    }
  }
  else if (v13)
  {
    objc_msgSend_setStableUrl_(self, v4, v13);
  }
  shareId = self->_shareId;
  uint64_t v15 = *((void *)v5 + 8);
  if (shareId)
  {
    if (v15) {
      objc_msgSend_mergeFrom_(shareId, v4, v15);
    }
  }
  else if (v15)
  {
    objc_msgSend_setShareId_(self, v4, v15);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = *((id *)v5 + 5);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, v41, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addProtectionInfoKeysToRemove_(self, v19, *(void *)(*((void *)&v37 + 1) + 8 * i), (void)v37);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v37, v41, 16);
    }
    while (v20);
  }

  storageExpiration = self->_storageExpiration;
  uint64_t v25 = *((void *)v5 + 11);
  if (storageExpiration)
  {
    if (v25) {
      objc_msgSend_mergeFrom_(storageExpiration, v23, v25);
    }
  }
  else if (v25)
  {
    objc_msgSend_setStorageExpiration_(self, v23, v25);
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  uint64_t v27 = *((void *)v5 + 9);
  if (signedCryptoRequirements)
  {
    if (v27) {
      objc_msgSend_mergeFrom_(signedCryptoRequirements, v23, v27);
    }
  }
  else if (v27)
  {
    objc_msgSend_setSignedCryptoRequirements_(self, v23, v27);
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v29 = *((void *)v5 + 1);
  if (appliedCryptoFeatures)
  {
    if (v29) {
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v23, v29);
    }
  }
  else if (v29)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v23, v29);
  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  uint64_t v31 = *((void *)v5 + 13);
  if (zoneProtectionInfoKeysToRemove)
  {
    if (v31) {
      objc_msgSend_mergeFrom_(zoneProtectionInfoKeysToRemove, v23, v31);
    }
  }
  else if (v31)
  {
    objc_msgSend_setZoneProtectionInfoKeysToRemove_(self, v23, v31);
  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  uint64_t v33 = *((void *)v5 + 7);
  if (recordProtectionInfoKeysToRemove)
  {
    if (v33) {
      objc_msgSend_mergeFrom_(recordProtectionInfoKeysToRemove, v23, v33);
    }
  }
  else if (v33)
  {
    objc_msgSend_setRecordProtectionInfoKeysToRemove_(self, v23, v33);
  }
  parentReference = self->_parentReference;
  uint64_t v35 = *((void *)v5 + 3);
  if (parentReference)
  {
    if (v35) {
      objc_msgSend_mergeFrom_(parentReference, v23, v35);
    }
  }
  else if (v35)
  {
    objc_msgSend_setParentReference_(self, v23, v35);
  }
  uint64_t v36 = *((void *)v5 + 2);
  if (v36) {
    objc_msgSend_setEtag_(self, v23, v36);
  }
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (CKDPProtectionInfo)recordProtectionInfo
{
  return self->_recordProtectionInfo;
}

- (void)setRecordProtectionInfo:(id)a3
{
}

- (CKDPRecordStableUrl)stableUrl
{
  return self->_stableUrl;
}

- (void)setStableUrl:(id)a3
{
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
}

- (NSMutableArray)protectionInfoKeysToRemoves
{
  return self->_protectionInfoKeysToRemoves;
}

- (void)setProtectionInfoKeysToRemoves:(id)a3
{
}

- (CKDPStorageExpiration)storageExpiration
{
  return self->_storageExpiration;
}

- (void)setStorageExpiration:(id)a3
{
}

- (CKDPZoneSignedCryptoRequirements)signedCryptoRequirements
{
  return self->_signedCryptoRequirements;
}

- (void)setSignedCryptoRequirements:(id)a3
{
}

- (CKDPZoneCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
}

- (CKDPProtectionInfoKeysToRemove)zoneProtectionInfoKeysToRemove
{
  return self->_zoneProtectionInfoKeysToRemove;
}

- (void)setZoneProtectionInfoKeysToRemove:(id)a3
{
}

- (CKDPProtectionInfoKeysToRemove)recordProtectionInfoKeysToRemove
{
  return self->_recordProtectionInfoKeysToRemove;
}

- (void)setRecordProtectionInfoKeysToRemove:(id)a3
{
}

- (CKDPZoneZoneReference)parentReference
{
  return self->_parentReference;
}

- (void)setParentReference:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_storageExpiration, 0);
  objc_storeStrong((id *)&self->_stableUrl, 0);
  objc_storeStrong((id *)&self->_signedCryptoRequirements, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfo, 0);
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemoves, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_parentReference, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

@end
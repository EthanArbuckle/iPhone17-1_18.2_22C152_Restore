@interface CKDPMergeableDelta
- (BOOL)hasAsset;
- (BOOL)hasData;
- (BOOL)hasEncryptedAsset;
- (BOOL)hasEncryptedData;
- (BOOL)hasMetadata;
- (BOOL)hasPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAsset)asset;
- (CKDPAsset)encryptedAsset;
- (CKDPMergeableDeltaMetadata)metadata;
- (NSData)data;
- (NSData)encryptedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadAsString:(int)a3;
- (int)StringAsPayload:(id)a3;
- (int)payload;
- (unint64_t)hash;
- (void)clearOneofValuesForPayload;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsset:(id)a3;
- (void)setData:(id)a3;
- (void)setEncryptedAsset:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setPayload:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPMergeableDelta

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setData:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 1;
  data = self->_data;
  self->_data = v4;
}

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0;
}

- (void)setEncryptedData:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 2;
  encryptedData = self->_encryptedData;
  self->_encryptedData = v4;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)setAsset:(id)a3
{
  v4 = (CKDPAsset *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 3;
  asset = self->_asset;
  self->_asset = v4;
}

- (BOOL)hasEncryptedAsset
{
  return self->_encryptedAsset != 0;
}

- (void)setEncryptedAsset:(id)a3
{
  v4 = (CKDPAsset *)a3;
  objc_msgSend_clearOneofValuesForPayload(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 4;
  encryptedAsset = self->_encryptedAsset;
  self->_encryptedAsset = v4;
}

- (int)payload
{
  if (*(unsigned char *)&self->_has) {
    return self->_payload;
  }
  else {
    return 0;
  }
}

- (void)setPayload:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayload
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)payloadAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E64F5CA0 + a3);
  }
  return v3;
}

- (int)StringAsPayload:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"data"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"encryptedData"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"asset"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"encryptedAsset"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForPayload
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_payload = 0;
  data = self->_data;
  self->_data = 0;

  encryptedData = self->_encryptedData;
  self->_encryptedData = 0;

  asset = self->_asset;
  self->_asset = 0;

  encryptedAsset = self->_encryptedAsset;
  self->_encryptedAsset = 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPMergeableDelta;
  v4 = [(CKDPMergeableDelta *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  metadata = self->_metadata;
  if (metadata)
  {
    v8 = objc_msgSend_dictionaryRepresentation(metadata, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"metadata");
  }
  data = self->_data;
  if (data) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)data, @"data");
  }
  encryptedData = self->_encryptedData;
  if (encryptedData) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedData, @"encryptedData");
  }
  asset = self->_asset;
  if (asset)
  {
    v13 = objc_msgSend_dictionaryRepresentation(asset, v4, (uint64_t)encryptedData);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"asset");
  }
  encryptedAsset = self->_encryptedAsset;
  if (encryptedAsset)
  {
    v16 = objc_msgSend_dictionaryRepresentation(encryptedAsset, v4, (uint64_t)encryptedData);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"encryptedAsset");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t payload = self->_payload;
    if (payload >= 5)
    {
      v19 = objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_payload);
    }
    else
    {
      v19 = (void *)*((void *)&off_1E64F5CA0 + payload);
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v19, @"payload");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPMergeableDeltaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_encryptedAsset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_payload;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  metadata = self->_metadata;
  objc_super v11 = v4;
  if (metadata)
  {
    objc_msgSend_setMetadata_(v4, v5, (uint64_t)metadata);
    id v4 = v11;
  }
  data = self->_data;
  if (data)
  {
    objc_msgSend_setData_(v11, v5, (uint64_t)data);
    id v4 = v11;
  }
  encryptedData = self->_encryptedData;
  if (encryptedData)
  {
    objc_msgSend_setEncryptedData_(v11, v5, (uint64_t)encryptedData);
    id v4 = v11;
  }
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setAsset_(v11, v5, (uint64_t)asset);
    id v4 = v11;
  }
  encryptedAsset = self->_encryptedAsset;
  if (encryptedAsset)
  {
    objc_msgSend_setEncryptedAsset_(v11, v5, (uint64_t)encryptedAsset);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 48) = self->_payload;
    *(unsigned char *)(v10 + 52) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_metadata, v11, (uint64_t)a3);
  v14 = (void *)v12[5];
  v12[5] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_data, v15, (uint64_t)a3);
  v17 = (void *)v12[2];
  v12[2] = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_encryptedData, v18, (uint64_t)a3);
  v20 = (void *)v12[4];
  v12[4] = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_asset, v21, (uint64_t)a3);
  v23 = (void *)v12[1];
  v12[1] = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_encryptedAsset, v24, (uint64_t)a3);
  v26 = (void *)v12[3];
  v12[3] = v25;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char isEqual = 0;
    goto LABEL_18;
  }
  metadata = self->_metadata;
  uint64_t v9 = v4[5];
  if ((unint64_t)metadata | v9 && !objc_msgSend_isEqual_(metadata, v7, v9)) {
    goto LABEL_17;
  }
  data = self->_data;
  uint64_t v11 = v4[2];
  if ((unint64_t)data | v11)
  {
    if (!objc_msgSend_isEqual_(data, v7, v11)) {
      goto LABEL_17;
    }
  }
  encryptedData = self->_encryptedData;
  uint64_t v13 = v4[4];
  if ((unint64_t)encryptedData | v13)
  {
    if (!objc_msgSend_isEqual_(encryptedData, v7, v13)) {
      goto LABEL_17;
    }
  }
  asset = self->_asset;
  uint64_t v15 = v4[1];
  if ((unint64_t)asset | v15)
  {
    if (!objc_msgSend_isEqual_(asset, v7, v15)) {
      goto LABEL_17;
    }
  }
  encryptedAsset = self->_encryptedAsset;
  uint64_t v17 = v4[3];
  if ((unint64_t)encryptedAsset | v17) {
    char isEqual = objc_msgSend_isEqual_(encryptedAsset, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_payload;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_metadata, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_data, v6, v7);
  uint64_t v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_encryptedData, v9, v10);
  uint64_t v14 = objc_msgSend_hash(self->_asset, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_encryptedAsset, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[13])
  {
    self->_uint64_t payload = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  metadata = self->_metadata;
  uint64_t v7 = v5[5];
  uint64_t v14 = v5;
  if (metadata)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(metadata, (const char *)v5, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setMetadata_(self, (const char *)v5, v7);
  }
  uint64_t v5 = v14;
LABEL_9:
  uint64_t v8 = v5[2];
  if (v8)
  {
    objc_msgSend_setData_(self, (const char *)v5, v8);
    uint64_t v5 = v14;
  }
  uint64_t v9 = v5[4];
  if (v9)
  {
    objc_msgSend_setEncryptedData_(self, (const char *)v5, v9);
    uint64_t v5 = v14;
  }
  asset = self->_asset;
  uint64_t v11 = v5[1];
  if (asset)
  {
    if (!v11) {
      goto LABEL_19;
    }
    objc_msgSend_mergeFrom_(asset, (const char *)v5, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_19;
    }
    objc_msgSend_setAsset_(self, (const char *)v5, v11);
  }
  uint64_t v5 = v14;
LABEL_19:
  encryptedAsset = self->_encryptedAsset;
  uint64_t v13 = v5[3];
  if (encryptedAsset)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(encryptedAsset, (const char *)v5, v13);
    }
  }
  else if (v13)
  {
    objc_msgSend_setEncryptedAsset_(self, (const char *)v5, v13);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPMergeableDeltaMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (CKDPAsset)asset
{
  return self->_asset;
}

- (CKDPAsset)encryptedAsset
{
  return self->_encryptedAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_encryptedAsset, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
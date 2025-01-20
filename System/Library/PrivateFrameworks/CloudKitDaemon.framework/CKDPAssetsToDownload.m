@interface CKDPAssetsToDownload
- (BOOL)allAssets;
- (BOOL)hasAllAssets;
- (BOOL)hasAssetFields;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRequestedFields)assetFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllAssets:(BOOL)a3;
- (void)setAssetFields:(id)a3;
- (void)setHasAllAssets:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAssetsToDownload

- (void)setAllAssets:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allAssets = a3;
}

- (void)setHasAllAssets:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllAssets
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssetFields
{
  return self->_assetFields != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAssetsToDownload;
  v4 = [(CKDPAssetsToDownload *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_allAssets);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"allAssets");
  }
  assetFields = self->_assetFields;
  if (assetFields)
  {
    v10 = objc_msgSend_dictionaryRepresentation(assetFields, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"assetFields");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FD2BD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_assetFields)
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
    v4[16] = self->_allAssets;
    v4[20] |= 1u;
  }
  assetFields = self->_assetFields;
  if (assetFields)
  {
    v7 = v4;
    objc_msgSend_setAssetFields_(v4, v5, (uint64_t)assetFields);
    id v4 = v7;
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
    *(unsigned char *)(v10 + 16) = self->_allAssets;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_assetFields, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_allAssets)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char isEqual = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  assetFields = self->_assetFields;
  uint64_t v11 = v4[1];
  if ((unint64_t)assetFields | v11) {
    char isEqual = objc_msgSend_isEqual_(assetFields, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_7:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_allAssets;
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_assetFields, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (const char *)a3;
  uint64_t v5 = v4;
  if (v4[20])
  {
    self->_allAssets = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  assetFields = self->_assetFields;
  uint64_t v7 = *((void *)v5 + 1);
  if (assetFields)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(assetFields, v5, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setAssetFields_(self, v5, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)allAssets
{
  return self->_allAssets;
}

- (CKDPRequestedFields)assetFields
{
  return self->_assetFields;
}

- (void)setAssetFields:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface IDSQRProtoMaterialInfo
- (BOOL)hasShortMaterialIdLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)materialContent;
- (NSData)materialId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialTypeAsString:(int)a3;
- (int)StringAsMaterialType:(id)a3;
- (int)materialType;
- (unint64_t)hash;
- (unsigned)shortMaterialIdLength;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShortMaterialIdLength:(BOOL)a3;
- (void)setMaterialContent:(id)a3;
- (void)setMaterialId:(id)a3;
- (void)setMaterialType:(int)a3;
- (void)setShortMaterialIdLength:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoMaterialInfo

- (id)materialTypeAsString:(int)a3
{
  if a3 < 0xF && ((0x78E1u >> a3))
  {
    v4 = off_1E5973478[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMaterialType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"UNDEFINED", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"PREKEY", v7))
  {
    int v8 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"AVCBLOB", v10))
  {
    int v8 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"MKM", v12))
  {
    int v8 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"SKM", v14))
  {
    int v8 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"MIRAGEKEY", v16))
  {
    int v8 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"MIRAGEBLOB", v18))
  {
    int v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"IDS_CONTEXT_BLOB", v20))
  {
    int v8 = 7;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)setShortMaterialIdLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shortMaterialIdLength = a3;
}

- (void)setHasShortMaterialIdLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShortMaterialIdLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoMaterialInfo;
  v4 = [(IDSQRProtoMaterialInfo *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = v5;
  materialId = self->_materialId;
  if (materialId) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)materialId, v7, @"material_id");
  }
  uint64_t materialType = self->_materialType;
  if materialType < 0xF && ((0x78E1u >> materialType))
  {
    v11 = off_1E5973478[materialType];
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v11, v7, @"material_type");
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v7, self->_materialType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, @"material_type");
  }

  materialContent = self->_materialContent;
  if (materialContent) {
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)materialContent, v15, @"material_content");
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, self->_shortMaterialIdLength, v15);
    objc_msgSend_setObject_forKey_(v8, v18, (uint64_t)v17, v19, @"short_material_id_length");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_materialId) {
    sub_19DB7658C();
  }
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  if (!self->_materialContent) {
    sub_19DB765B8();
  }
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  objc_msgSend_setMaterialId_(v8, v4, (uint64_t)self->_materialId, v5);
  *((_DWORD *)v8 + 6) = self->_materialType;
  objc_msgSend_setMaterialContent_(v8, v6, (uint64_t)self->_materialContent, v7);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 7) = self->_shortMaterialIdLength;
    *((unsigned char *)v8 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  id v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_materialId, v13, (uint64_t)a3, v14);
  double v16 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v15;

  *(_DWORD *)(v12 + 24) = self->_materialType;
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_materialContent, v17, (uint64_t)a3, v18);
  double v20 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 28) = self->_shortMaterialIdLength;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  materialId = self->_materialId;
  uint64_t v11 = v4[2];
  if ((unint64_t)materialId | v11)
  {
    if (!objc_msgSend_isEqual_(materialId, v8, v11, v9)) {
      goto LABEL_11;
    }
  }
  if (self->_materialType != *((_DWORD *)v4 + 6)) {
    goto LABEL_11;
  }
  materialContent = self->_materialContent;
  uint64_t v13 = v4[1];
  if ((unint64_t)materialContent | v13)
  {
    if (!objc_msgSend_isEqual_(materialContent, v8, v13, v9)) {
      goto LABEL_11;
    }
  }
  BOOL v14 = (v4[4] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) != 0 && self->_shortMaterialIdLength == *((_DWORD *)v4 + 7))
    {
      BOOL v14 = 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v14 = 0;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_materialId, a2, v2, v3);
  uint64_t materialType = self->_materialType;
  uint64_t v10 = objc_msgSend_hash(self->_materialContent, v7, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_shortMaterialIdLength;
  }
  else {
    uint64_t v11 = 0;
  }
  return (2654435761 * materialType) ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 2);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setMaterialId_(self, v5, v7, v6);
    id v4 = v9;
  }
  self->_uint64_t materialType = *((_DWORD *)v4 + 6);
  uint64_t v8 = *((void *)v4 + 1);
  if (v8)
  {
    objc_msgSend_setMaterialContent_(self, v5, v8, v6);
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_shortMaterialIdLength = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)materialId
{
  return self->_materialId;
}

- (void)setMaterialId:(id)a3
{
}

- (int)materialType
{
  return self->_materialType;
}

- (void)setMaterialType:(int)a3
{
  self->_uint64_t materialType = a3;
}

- (NSData)materialContent
{
  return self->_materialContent;
}

- (void)setMaterialContent:(id)a3
{
}

- (unsigned)shortMaterialIdLength
{
  return self->_shortMaterialIdLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialId, 0);
  objc_storeStrong((id *)&self->_materialContent, 0);
}

@end
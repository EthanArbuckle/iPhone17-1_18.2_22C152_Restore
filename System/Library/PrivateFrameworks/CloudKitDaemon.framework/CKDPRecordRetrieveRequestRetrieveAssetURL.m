@interface CKDPRecordRetrieveRequestRetrieveAssetURL
- (BOOL)hasAssetFields;
- (BOOL)hasRequestedTTL;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRequestedFields)assetFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)requestedTTL;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetFields:(id)a3;
- (void)setHasRequestedTTL:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setRequestedTTL:(int64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveRequestRetrieveAssetURL

- (BOOL)hasAssetFields
{
  return self->_assetFields != 0;
}

- (void)setRequestedTTL:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestedTTL = a3;
}

- (void)setHasRequestedTTL:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedTTL
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  switch(a3)
  {
    case 1:
      v4 = @"publishedURL";
      break;
    case 4:
      v4 = @"chunkInfoUrl";
      break;
    case 2:
      v4 = @"streamingURL";
      break;
    default:
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"publishedURL"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"streamingURL"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"chunkInfoUrl"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveRequestRetrieveAssetURL;
  v4 = [(CKDPRecordRetrieveRequestRetrieveAssetURL *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  assetFields = self->_assetFields;
  if (assetFields)
  {
    v8 = objc_msgSend_dictionaryRepresentation(assetFields, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"assetFields");
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v11 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_requestedTTL);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"requestedTTL");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int type = self->_type;
    switch(type)
    {
      case 1:
        v14 = @"publishedURL";
        objc_msgSend_setObject_forKey_(v6, v4, @"publishedURL", @"type");
        break;
      case 4:
        v14 = @"chunkInfoUrl";
        objc_msgSend_setObject_forKey_(v6, v4, @"chunkInfoUrl", @"type");
        break;
      case 2:
        v14 = @"streamingURL";
        objc_msgSend_setObject_forKey_(v6, v4, @"streamingURL", @"type");
        break;
      default:
        objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"type");
        break;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E6C5DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_assetFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  assetFields = self->_assetFields;
  if (assetFields)
  {
    id v8 = v4;
    objc_msgSend_setAssetFields_(v4, v5, (uint64_t)assetFields);
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_requestedTTL;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_assetFields, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_requestedTTL;
    *(unsigned char *)(v10 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_type;
    *(unsigned char *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  assetFields = self->_assetFields;
  uint64_t v9 = v4[2];
  if ((unint64_t)assetFields | v9)
  {
    if (!objc_msgSend_isEqual_(assetFields, v7, v9)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_requestedTTL != v4[1]) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v10 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v10 = 1;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_assetFields, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_requestedTTL;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_type;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  assetFields = self->_assetFields;
  uint64_t v6 = *((void *)v4 + 2);
  if (assetFields)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    objc_msgSend_mergeFrom_(assetFields, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    objc_msgSend_setAssetFields_(self, (const char *)v4, v6);
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_requestedTTL = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRequestedFields)assetFields
{
  return self->_assetFields;
}

- (void)setAssetFields:(id)a3
{
}

- (int64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void).cxx_destruct
{
}

@end
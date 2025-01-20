@interface CKDPQueryRetrieveResponseQueryResult
- (BOOL)hasEtag;
- (BOOL)hasIdentifier;
- (BOOL)hasRecord;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)record;
- (CKDPRecordIdentifier)identifier;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRecord:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQueryRetrieveResponseQueryResult

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"idAndEtag";
  }
  else if (a3 == 2)
  {
    v4 = @"fullRecord";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"idAndEtag") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"fullRecord")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQueryRetrieveResponseQueryResult;
  v4 = [(CKDPQueryRetrieveResponseQueryResult *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type == 1)
    {
      v12 = @"idAndEtag";
      objc_msgSend_setObject_forKey_(v6, v4, @"idAndEtag", @"type");
    }
    else if (type == 2)
    {
      v12 = @"fullRecord";
      objc_msgSend_setObject_forKey_(v6, v4, @"fullRecord", @"type");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"type");
    }
  }
  record = self->_record;
  if (record)
  {
    v15 = objc_msgSend_dictionaryRepresentation(record, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"record");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FB2838((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v9 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    id v4 = v9;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v9, v5, (uint64_t)etag);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_setRecord_(v9, v5, (uint64_t)record);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 32) = self->_type;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_record, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[2];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_13;
    }
  }
  etag = self->_etag;
  uint64_t v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  record = self->_record;
  uint64_t v13 = v4[3];
  if ((unint64_t)record | v13) {
    char isEqual = objc_msgSend_isEqual_(record, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_etag, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_type;
  }
  else {
    uint64_t v10 = 0;
  }
  return v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_record, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  uint64_t v6 = *((void *)v4 + 2);
  id v10 = v4;
  if (identifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v10;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    id v4 = v10;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_int type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  record = self->_record;
  uint64_t v9 = *((void *)v4 + 3);
  if (record)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(record, (const char *)v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setRecord_(self, (const char *)v4, v9);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
@interface CKDPRecordRetrieveChangesResponseRecordChange
- (BOOL)hasEtag;
- (BOOL)hasRecord;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasRecordType;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)record;
- (CKDPRecordIdentifier)recordIdentifier;
- (CKDPRecordType)recordType;
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
- (void)setRecord:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveChangesResponseRecordChange

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
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
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F4F20[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"idAndEtag"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"fullRecord"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"recordDeleted"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseRecordChange;
  v4 = [(CKDPRecordRetrieveChangesResponseRecordChange *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"recordIdentifier");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  recordType = self->_recordType;
  if (recordType)
  {
    v12 = objc_msgSend_dictionaryRepresentation(recordType, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"recordType");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v14 = self->_type - 1;
    if (v14 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E64F4F20[v14];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v15, @"type");
  }
  record = self->_record;
  if (record)
  {
    v17 = objc_msgSend_dictionaryRepresentation(record, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"record");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EBE458((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recordType)
  {
    PBDataWriterWriteSubmessage();
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
  recordIdentifier = self->_recordIdentifier;
  id v10 = v4;
  if (recordIdentifier)
  {
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier);
    id v4 = v10;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v10, v5, (uint64_t)etag);
    id v4 = v10;
  }
  recordType = self->_recordType;
  if (recordType)
  {
    objc_msgSend_setRecordType_(v10, v5, (uint64_t)recordType);
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_type;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_setRecord_(v10, v5, (uint64_t)record);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_recordType, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 40) = self->_type;
    *(unsigned char *)(v10 + 44) |= 1u;
  }
  uint64_t v21 = objc_msgSend_copyWithZone_(self->_record, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v21;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_15;
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9)) {
      goto LABEL_15;
    }
  }
  etag = self->_etag;
  uint64_t v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11)) {
      goto LABEL_15;
    }
  }
  recordType = self->_recordType;
  uint64_t v13 = v4[4];
  if ((unint64_t)recordType | v13)
  {
    if (!objc_msgSend_isEqual_(recordType, v7, v13)) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char isEqual = 0;
    goto LABEL_16;
  }
  record = self->_record;
  uint64_t v15 = v4[2];
  if ((unint64_t)record | v15) {
    char isEqual = objc_msgSend_isEqual_(record, v7, v15);
  }
  else {
    char isEqual = 1;
  }
LABEL_16:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_etag, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_recordType, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_type;
  }
  else {
    uint64_t v13 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ objc_msgSend_hash(self->_record, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  uint64_t v6 = *((void *)v4 + 3);
  id v12 = v4;
  if (recordIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setRecordIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v12;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    id v4 = v12;
  }
  recordType = self->_recordType;
  uint64_t v9 = *((void *)v4 + 4);
  if (recordType)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(recordType, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setRecordType_(self, (const char *)v4, v9);
  }
  id v4 = v12;
LABEL_15:
  if (*((unsigned char *)v4 + 44))
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  record = self->_record;
  uint64_t v11 = *((void *)v4 + 2);
  if (record)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(record, (const char *)v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setRecord_(self, (const char *)v4, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPRecordType)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
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
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
@interface CKDPRecordRetrieveResponse
- (BOOL)clientVersionETagMatch;
- (BOOL)hasClientVersionETagMatch;
- (BOOL)hasRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)record;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientVersionETagMatch:(BOOL)a3;
- (void)setHasClientVersionETagMatch:(BOOL)a3;
- (void)setRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveResponse

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (void)setClientVersionETagMatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientVersionETagMatch = a3;
}

- (void)setHasClientVersionETagMatch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientVersionETagMatch
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveResponse;
  v4 = [(CKDPRecordRetrieveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  record = self->_record;
  if (record)
  {
    v8 = objc_msgSend_dictionaryRepresentation(record, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"record");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_clientVersionETagMatch);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"clientVersionETagMatch");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5027968((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  record = self->_record;
  if (record)
  {
    v7 = v4;
    objc_msgSend_setRecord_(v4, v5, (uint64_t)record);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_clientVersionETagMatch;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_record, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 16) = self->_clientVersionETagMatch;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  record = self->_record;
  uint64_t v9 = v4[1];
  if ((unint64_t)record | v9)
  {
    if (!objc_msgSend_isEqual_(record, v7, v9)) {
      goto LABEL_6;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v10 = 0;
      goto LABEL_7;
    }
    if (self->_clientVersionETagMatch)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v10 = 1;
  }
LABEL_7:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_record, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_clientVersionETagMatch;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  record = self->_record;
  uint64_t v6 = *((void *)v4 + 1);
  if (record)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    objc_msgSend_mergeFrom_(record, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    objc_msgSend_setRecord_(self, (const char *)v4, v6);
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_clientVersionETagMatch = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (BOOL)clientVersionETagMatch
{
  return self->_clientVersionETagMatch;
}

- (void).cxx_destruct
{
}

@end
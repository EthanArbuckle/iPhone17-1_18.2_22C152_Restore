@interface CKDPTranscodeResponse
- (BOOL)hasRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCodeRecordTransport)record;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPTranscodeResponse

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPTranscodeResponse;
  v4 = [(CKDPTranscodeResponse *)&v11 description];
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
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F19EB8]);
        objc_storeStrong((id *)&self->_record, v18);
        if (!PBReaderPlaceMark() || (CKCodeRecordTransportReadFrom() & 1) == 0)
        {

          LOBYTE(v19) = 0;
          return v19;
        }
        PBReaderRecallMark();
      }
      else
      {
        int v19 = PBReaderSkipValueWithTag();
        if (!v19) {
          return v19;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v19) = *((unsigned char *)a3 + *v6) == 0;
  return v19;
}

- (void)writeTo:(id)a3
{
  if (self->_record) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  record = self->_record;
  if (record) {
    objc_msgSend_setRecord_(a3, a2, (uint64_t)record);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unsigned int v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_record, v11, (uint64_t)a3);
  unint64_t v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    record = self->_record;
    uint64_t v9 = v4[1];
    if ((unint64_t)record | v9) {
      char isEqual = objc_msgSend_isEqual_(record, v7, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_record, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  v4 = (const char *)a3;
  record = self->_record;
  uint64_t v6 = *((void *)v4 + 1);
  if (record)
  {
    if (v6) {
      objc_msgSend_mergeFrom_(record, v4, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend_setRecord_(self, v4, v6);
  }
  MEMORY[0x1F41817F8]();
}

- (CKCodeRecordTransport)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
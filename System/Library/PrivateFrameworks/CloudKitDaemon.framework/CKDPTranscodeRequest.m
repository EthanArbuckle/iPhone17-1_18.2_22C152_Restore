@interface CKDPTranscodeRequest
- (BOOL)hasConstructedAssetDownloadParameters;
- (BOOL)hasRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCodeRecordTransport)record;
- (NSData)constructedAssetDownloadParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConstructedAssetDownloadParameters:(id)a3;
- (void)setRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPTranscodeRequest

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (BOOL)hasConstructedAssetDownloadParameters
{
  return self->_constructedAssetDownloadParameters != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPTranscodeRequest;
  v4 = [(CKDPTranscodeRequest *)&v11 description];
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
  constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
  if (constructedAssetDownloadParameters) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)constructedAssetDownloadParameters, @"constructedAssetDownloadParameters");
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
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
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
        return *((unsigned char *)a3 + *v6) == 0;
      }
      if ((v11 >> 3) == 2) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        constructedAssetDownloadParameters = (NSData *)objc_alloc_init(MEMORY[0x1E4F19EB8]);
        objc_storeStrong((id *)&self->_record, constructedAssetDownloadParameters);
        if (!PBReaderPlaceMark() || (CKCodeRecordTransportReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    PBReaderReadData();
    v19 = (NSData *)objc_claimAutoreleasedReturnValue();
    constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
    self->_constructedAssetDownloadParameters = v19;
LABEL_24:

    goto LABEL_26;
  }
  return *((unsigned char *)a3 + *v6) == 0;
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
  if (self->_constructedAssetDownloadParameters)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  record = self->_record;
  id v8 = v4;
  if (record)
  {
    objc_msgSend_setRecord_(v4, v5, (uint64_t)record);
    id v4 = v8;
  }
  constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
  if (constructedAssetDownloadParameters)
  {
    objc_msgSend_setConstructedAssetDownloadParameters_(v8, v5, (uint64_t)constructedAssetDownloadParameters);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unsigned int v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_record, v11, (uint64_t)a3);
  unint64_t v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_constructedAssetDownloadParameters, v14, (uint64_t)a3);
  int v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((record = self->_record, uint64_t v9 = v4[2], !((unint64_t)record | v9))
     || objc_msgSend_isEqual_(record, v7, v9)))
  {
    constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
    uint64_t v11 = v4[1];
    if ((unint64_t)constructedAssetDownloadParameters | v11) {
      char isEqual = objc_msgSend_isEqual_(constructedAssetDownloadParameters, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_record, a2, v2);
  return objc_msgSend_hash(self->_constructedAssetDownloadParameters, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  record = self->_record;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (record)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(record, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setRecord_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v8;
LABEL_7:
  uint64_t v7 = v4[1];
  if (v7) {
    objc_msgSend_setConstructedAssetDownloadParameters_(self, (const char *)v4, v7);
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

- (NSData)constructedAssetDownloadParameters
{
  return self->_constructedAssetDownloadParameters;
}

- (void)setConstructedAssetDownloadParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadParameters, 0);
}

@end
@interface CKDPRecordRetrieveRequest
+ (id)options;
- (BOOL)hasAssetsToDownload;
- (BOOL)hasClientVersionETag;
- (BOOL)hasGetAssetURL;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasRequestEncryptedAssetUserIdentifiers;
- (BOOL)hasRequestedFields;
- (BOOL)hasShouldFailBatch;
- (BOOL)hasVersionETag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestEncryptedAssetUserIdentifiers;
- (BOOL)shouldFailBatch;
- (CKDPAssetsToDownload)assetsToDownload;
- (CKDPRecordIdentifier)recordIdentifier;
- (CKDPRecordRetrieveRequestRetrieveAssetURL)getAssetURL;
- (CKDPRequestedFields)requestedFields;
- (Class)responseClass;
- (NSString)clientVersionETag;
- (NSString)versionETag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setClientVersionETag:(id)a3;
- (void)setGetAssetURL:(id)a3;
- (void)setHasRequestEncryptedAssetUserIdentifiers:(BOOL)a3;
- (void)setHasShouldFailBatch:(BOOL)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setRequestEncryptedAssetUserIdentifiers:(BOOL)a3;
- (void)setRequestedFields:(id)a3;
- (void)setShouldFailBatch:(BOOL)a3;
- (void)setVersionETag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDCE0 != -1) {
    dispatch_once(&qword_1EBBCDCE0, &unk_1F2042950);
  }
  v2 = (void *)qword_1EBBCDCD8;
  return v2;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (BOOL)hasVersionETag
{
  return self->_versionETag != 0;
}

- (BOOL)hasClientVersionETag
{
  return self->_clientVersionETag != 0;
}

- (BOOL)hasGetAssetURL
{
  return self->_getAssetURL != 0;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (void)setShouldFailBatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldFailBatch = a3;
}

- (void)setHasShouldFailBatch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldFailBatch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestEncryptedAssetUserIdentifiers:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestEncryptedAssetUserIdentifiers = a3;
}

- (void)setHasRequestEncryptedAssetUserIdentifiers:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestEncryptedAssetUserIdentifiers
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveRequest;
  v4 = [(CKDPRecordRetrieveRequest *)&v11 description];
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
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(requestedFields, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"requestedFields");
  }
  versionETag = self->_versionETag;
  if (versionETag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)versionETag, @"versionETag");
  }
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)clientVersionETag, @"clientVersionETag");
  }
  getAssetURL = self->_getAssetURL;
  if (getAssetURL)
  {
    v16 = objc_msgSend_dictionaryRepresentation(getAssetURL, v4, (uint64_t)clientVersionETag);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"getAssetURL");
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    v19 = objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)clientVersionETag);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"assetsToDownload");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v22 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_shouldFailBatch);
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, @"shouldFailBatch");

    char has = (char)self->_has;
  }
  if (has)
  {
    v24 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_requestEncryptedAssetUserIdentifiers);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"requestEncryptedAssetUserIdentifiers");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D5C620((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_versionETag)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientVersionETag)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_getAssetURL)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (unsigned)requestTypeCode
{
  return 4;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v13 = v4;
  if (recordIdentifier)
  {
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier);
    id v4 = v13;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v13, v5, (uint64_t)requestedFields);
    id v4 = v13;
  }
  versionETag = self->_versionETag;
  if (versionETag)
  {
    objc_msgSend_setVersionETag_(v13, v5, (uint64_t)versionETag);
    id v4 = v13;
  }
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag)
  {
    objc_msgSend_setClientVersionETag_(v13, v5, (uint64_t)clientVersionETag);
    id v4 = v13;
  }
  getAssetURL = self->_getAssetURL;
  if (getAssetURL)
  {
    objc_msgSend_setGetAssetURL_(v13, v5, (uint64_t)getAssetURL);
    id v4 = v13;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v13, v5, (uint64_t)assetsToDownload);
    id v4 = v13;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[57] = self->_shouldFailBatch;
    v4[60] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[56] = self->_requestEncryptedAssetUserIdentifiers;
    v4[60] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_requestedFields, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_versionETag, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_clientVersionETag, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_getAssetURL, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v27;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 57) = self->_shouldFailBatch;
    *(unsigned char *)(v10 + 60) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v10 + 56) = self->_requestEncryptedAssetUserIdentifiers;
    *(unsigned char *)(v10 + 60) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_24;
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v9 = v4[4];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9)) {
      goto LABEL_24;
    }
  }
  requestedFields = self->_requestedFields;
  uint64_t v11 = v4[5];
  if ((unint64_t)requestedFields | v11)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v11)) {
      goto LABEL_24;
    }
  }
  versionETag = self->_versionETag;
  uint64_t v13 = v4[6];
  if ((unint64_t)versionETag | v13)
  {
    if (!objc_msgSend_isEqual_(versionETag, v7, v13)) {
      goto LABEL_24;
    }
  }
  clientVersionETag = self->_clientVersionETag;
  uint64_t v15 = v4[2];
  if ((unint64_t)clientVersionETag | v15)
  {
    if (!objc_msgSend_isEqual_(clientVersionETag, v7, v15)) {
      goto LABEL_24;
    }
  }
  getAssetURL = self->_getAssetURL;
  uint64_t v17 = v4[3];
  if ((unint64_t)getAssetURL | v17)
  {
    if (!objc_msgSend_isEqual_(getAssetURL, v7, v17)) {
      goto LABEL_24;
    }
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v19 = v4[1];
  if ((unint64_t)assetsToDownload | v19)
  {
    if (!objc_msgSend_isEqual_(assetsToDownload, v7, v19)) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_shouldFailBatch)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v20 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_requestEncryptedAssetUserIdentifiers)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 56))
      {
        goto LABEL_24;
      }
      BOOL v20 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v20 = 0;
  }
LABEL_25:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_requestedFields, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_versionETag, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_clientVersionETag, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_getAssetURL, v14, v15);
  uint64_t v19 = objc_msgSend_hash(self->_assetsToDownload, v17, v18);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_shouldFailBatch;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v21 = 2654435761 * self->_requestEncryptedAssetUserIdentifiers;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  uint64_t v6 = *((void *)v4 + 4);
  id v16 = v4;
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
  id v4 = v16;
LABEL_7:
  requestedFields = self->_requestedFields;
  uint64_t v8 = *((void *)v4 + 5);
  if (requestedFields)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v8);
  }
  id v4 = v16;
LABEL_13:
  uint64_t v9 = *((void *)v4 + 6);
  if (v9)
  {
    objc_msgSend_setVersionETag_(self, (const char *)v4, v9);
    id v4 = v16;
  }
  uint64_t v10 = *((void *)v4 + 2);
  if (v10)
  {
    objc_msgSend_setClientVersionETag_(self, (const char *)v4, v10);
    id v4 = v16;
  }
  getAssetURL = self->_getAssetURL;
  uint64_t v12 = *((void *)v4 + 3);
  if (getAssetURL)
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(getAssetURL, (const char *)v4, v12);
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_setGetAssetURL_(self, (const char *)v4, v12);
  }
  id v4 = v16;
LABEL_23:
  assetsToDownload = self->_assetsToDownload;
  uint64_t v14 = *((void *)v4 + 1);
  if (assetsToDownload)
  {
    if (!v14) {
      goto LABEL_29;
    }
    objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v14);
  }
  else
  {
    if (!v14) {
      goto LABEL_29;
    }
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v14);
  }
  id v4 = v16;
LABEL_29:
  char v15 = *((unsigned char *)v4 + 60);
  if ((v15 & 2) != 0)
  {
    self->_shouldFailBatch = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 2u;
    char v15 = *((unsigned char *)v4 + 60);
  }
  if (v15)
  {
    self->_requestEncryptedAssetUserIdentifiers = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 1u;
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

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
}

- (NSString)versionETag
{
  return self->_versionETag;
}

- (void)setVersionETag:(id)a3
{
}

- (NSString)clientVersionETag
{
  return self->_clientVersionETag;
}

- (void)setClientVersionETag:(id)a3
{
}

- (CKDPRecordRetrieveRequestRetrieveAssetURL)getAssetURL
{
  return self->_getAssetURL;
}

- (void)setGetAssetURL:(id)a3
{
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (BOOL)shouldFailBatch
{
  return self->_shouldFailBatch;
}

- (BOOL)requestEncryptedAssetUserIdentifiers
{
  return self->_requestEncryptedAssetUserIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionETag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_getAssetURL, 0);
  objc_storeStrong((id *)&self->_clientVersionETag, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end
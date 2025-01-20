@interface CKDPRecordRetrieveVersionsRequest
+ (id)options;
- (BOOL)hasAssetsToDownload;
- (BOOL)hasMinimumVersionEtag;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasRequestedFields;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAssetsToDownload)assetsToDownload;
- (CKDPRecordIdentifier)recordIdentifier;
- (CKDPRequestedFields)requestedFields;
- (Class)responseClass;
- (NSString)minimumVersionEtag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setMinimumVersionEtag:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setRequestedFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveVersionsRequest

+ (id)options
{
  if (qword_1EBBCDDD0 != -1) {
    dispatch_once(&qword_1EBBCDDD0, &unk_1F2043610);
  }
  v2 = (void *)qword_1EBBCDDC8;
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

- (BOOL)hasMinimumVersionEtag
{
  return self->_minimumVersionEtag != 0;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveVersionsRequest;
  v4 = [(CKDPRecordRetrieveVersionsRequest *)&v11 description];
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
  minimumVersionEtag = self->_minimumVersionEtag;
  if (minimumVersionEtag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)minimumVersionEtag, @"minimumVersionEtag");
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    v15 = objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)minimumVersionEtag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"assetsToDownload");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E68668((uint64_t)self, (uint64_t)a3);
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
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_minimumVersionEtag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 45;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
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
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v10, v5, (uint64_t)requestedFields);
    id v4 = v10;
  }
  minimumVersionEtag = self->_minimumVersionEtag;
  if (minimumVersionEtag)
  {
    objc_msgSend_setMinimumVersionEtag_(v10, v5, (uint64_t)minimumVersionEtag);
    id v4 = v10;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v10, v5, (uint64_t)assetsToDownload);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_requestedFields, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_minimumVersionEtag, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordIdentifier = self->_recordIdentifier, uint64_t v9 = v4[3], !((unint64_t)recordIdentifier | v9))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v9))
    && ((requestedFields = self->_requestedFields, uint64_t v11 = v4[4], !((unint64_t)requestedFields | v11))
     || objc_msgSend_isEqual_(requestedFields, v7, v11))
    && ((minimumVersionEtag = self->_minimumVersionEtag, uint64_t v13 = v4[2], !((unint64_t)minimumVersionEtag | v13))
     || objc_msgSend_isEqual_(minimumVersionEtag, v7, v13)))
  {
    assetsToDownload = self->_assetsToDownload;
    uint64_t v15 = v4[1];
    if ((unint64_t)assetsToDownload | v15) {
      char isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_requestedFields, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_minimumVersionEtag, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_assetsToDownload, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  uint64_t v6 = v4[3];
  uint64_t v12 = v4;
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
  uint64_t v4 = v12;
LABEL_7:
  requestedFields = self->_requestedFields;
  uint64_t v8 = v4[4];
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
  uint64_t v4 = v12;
LABEL_13:
  uint64_t v9 = v4[2];
  if (v9)
  {
    objc_msgSend_setMinimumVersionEtag_(self, (const char *)v4, v9);
    uint64_t v4 = v12;
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v11 = v4[1];
  if (assetsToDownload)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v11);
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

- (NSString)minimumVersionEtag
{
  return self->_minimumVersionEtag;
}

- (void)setMinimumVersionEtag:(id)a3
{
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_minimumVersionEtag, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end